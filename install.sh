#!/bin/bash
# AI Panel 安装脚本
# 用法: curl -sSL https://raw.githubusercontent.com/owen2026a/ai-releases/main/install.sh | sudo bash

set -e

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# 配置
APP_DIR="/www/ai"
DATA_DIR="/www/ai/data"
BACKUP_DIR="/www/ai/backup"
BINARY_PATH="/www/ai/ai"
SERVICE_NAME="ai"
VERSION_URL="https://raw.githubusercontent.com/owen2026a/ai-releases/main/version.json"
DB_FILE="$APP_DIR/admin.db"

# 检测是否为升级（已存在数据库文件）
IS_UPGRADE=false
if [ -f "$DB_FILE" ]; then
    IS_UPGRADE=true
fi

if [ "$IS_UPGRADE" = true ]; then
    echo -e "${GREEN}========================================${NC}"
    echo -e "${GREEN}       AI Panel 升级脚本${NC}"
    echo -e "${GREEN}========================================${NC}"
else
    echo -e "${GREEN}========================================${NC}"
    echo -e "${GREEN}       AI Panel 安装脚本${NC}"
    echo -e "${GREEN}========================================${NC}"
fi
echo ""

# 检查是否为 root 用户
if [ "$EUID" -ne 0 ]; then
    echo -e "${RED}错误: 请使用 root 用户运行此脚本${NC}"
    echo "使用方法: sudo bash install.sh"
    exit 1
fi

# 检查系统
if [ ! -f /etc/os-release ]; then
    echo -e "${RED}错误: 不支持的操作系统${NC}"
    exit 1
fi

. /etc/os-release
echo -e "${GREEN}检测到系统: ${ID} ${VERSION_ID}${NC}"

# 检查系统兼容性
case "$ID" in
    ubuntu|debian)
        PKG_MGR="apt-get"
        ;;
    centos|rhel|almalinux|rocky|fedora)
        if command -v dnf &> /dev/null; then
            PKG_MGR="dnf"
        else
            PKG_MGR="yum"
        fi
        ;;
    *)
        if [ -f /etc/debian_version ]; then
            PKG_MGR="apt-get"
        elif [ -f /etc/redhat-release ]; then
            if command -v dnf &> /dev/null; then PKG_MGR="dnf"; else PKG_MGR="yum"; fi
        else
            echo -e "${RED}错误: 不支持的发行版 ${ID}${NC}"
            echo "支持: Ubuntu 20.04+, Debian 10+, CentOS 7+, AlmaLinux/Rocky 8+"
            exit 1
        fi
        ;;
esac

# CentOS 7 EOL 源修复
if [ "$ID" = "centos" ] && [[ "$VERSION_ID" == 7* ]]; then
    echo -e "${YELLOW}检测到 CentOS 7 (EOL)，正在修复软件源...${NC}"
    sed -i 's/mirrorlist=http/#mirrorlist=http/g' /etc/yum.repos.d/CentOS-*.repo 2>/dev/null
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*.repo 2>/dev/null
    yum clean all 2>/dev/null
    echo -e "${GREEN}CentOS 7 源已修复为 vault.centos.org${NC}"
fi

# 安装基础依赖
echo -e "${YELLOW}检查基础依赖...${NC}"
if [ "$PKG_MGR" = "apt-get" ]; then
    apt-get update -qq 2>/dev/null
    apt-get install -y -qq curl wget tar gzip 2>/dev/null
else
    $PKG_MGR install -y -q curl wget tar gzip 2>/dev/null
fi

if [ "$IS_UPGRADE" = true ]; then
    echo -e "${GREEN}检测到已有安装，将进行升级（保留数据库和配置）${NC}"
fi

# ========== 端口选择（仅全新安装） ==========
check_port_conflict() {
    local port=$1
    if command -v ss &>/dev/null; then
        ss -tlnp 2>/dev/null | grep -q ":${port} " && return 0
    elif command -v netstat &>/dev/null; then
        netstat -tlnp 2>/dev/null | grep -q ":${port} " && return 0
    fi
    return 1
}

gen_random_port() {
    local port
    local attempts=0
    while [ $attempts -lt 50 ]; do
        port=$((RANDOM % 10001 + 30000))
        if ! check_port_conflict "$port"; then
            echo "$port"
            return
        fi
        attempts=$((attempts + 1))
    done
    echo "38899"
}

# ========== 随机密码生成 ==========
gen_random_password() {
    local chars='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789@$&!'
    local password=""
    local i
    # 保证至少包含每种字符各一个
    password="${password}$(echo 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' | fold -w1 | shuf | head -1)"
    password="${password}$(echo 'abcdefghijklmnopqrstuvwxyz' | fold -w1 | shuf | head -1)"
    password="${password}$(echo '0123456789' | fold -w1 | shuf | head -1)"
    password="${password}$(echo '@$&!' | fold -w1 | shuf | head -1)"
    # 剩余 8 位随机
    for i in $(seq 1 8); do
        password="${password}${chars:$((RANDOM % ${#chars})):1}"
    done
    # 打乱顺序
    echo "$password" | fold -w1 | shuf | tr -d '\n'
}

if [ "$IS_UPGRADE" = false ]; then
    echo ""
    echo -e "${CYAN}========================================${NC}"
    echo -e "${CYAN}  管理端口设置${NC}"
    echo -e "${CYAN}========================================${NC}"
    echo -e "请输入面板管理端口（${YELLOW}1024-65535${NC}）"
    echo -e "直接按 ${GREEN}回车${NC} 将随机分配 30000-40000 之间的端口"
    echo ""
    read -p "管理端口: " INPUT_PORT < /dev/tty

    if [ -z "$INPUT_PORT" ]; then
        CURRENT_PORT=$(gen_random_port)
        echo -e "${GREEN}随机分配端口: ${CURRENT_PORT}${NC}"
    else
        if ! [[ "$INPUT_PORT" =~ ^[0-9]+$ ]] || [ "$INPUT_PORT" -lt 1024 ] || [ "$INPUT_PORT" -gt 65535 ]; then
            echo -e "${RED}端口无效（需为 1024-65535），使用随机端口${NC}"
            CURRENT_PORT=$(gen_random_port)
            echo -e "${GREEN}随机分配端口: ${CURRENT_PORT}${NC}"
        elif check_port_conflict "$INPUT_PORT"; then
            echo -e "${RED}端口 ${INPUT_PORT} 已被占用！${NC}"
            if command -v ss &>/dev/null; then
                ss -tlnp 2>/dev/null | grep ":${INPUT_PORT} " | head -1
            fi
            CURRENT_PORT=$(gen_random_port)
            echo -e "${YELLOW}自动切换为随机端口: ${CURRENT_PORT}${NC}"
        else
            CURRENT_PORT="$INPUT_PORT"
            echo -e "${GREEN}使用端口: ${CURRENT_PORT}${NC}"
        fi
    fi

    # 生成随机密码
    ADMIN_PASS=$(gen_random_password)
    echo ""
fi

# 创建目录
echo -e "${YELLOW}创建应用目录...${NC}"
mkdir -p "$APP_DIR" "$DATA_DIR" "$BACKUP_DIR"
chmod 700 "$APP_DIR" "$DATA_DIR" "$BACKUP_DIR"
chown root:root "$APP_DIR" "$DATA_DIR" "$BACKUP_DIR"

# 获取版本信息
echo -e "${YELLOW}获取最新版本信息...${NC}"
VERSION_INFO=$(curl -s "$VERSION_URL")
if [ -z "$VERSION_INFO" ]; then
    echo -e "${RED}错误: 无法获取版本信息${NC}"
    exit 1
fi

LATEST_VERSION=$(echo "$VERSION_INFO" | grep -o '"version"[[:space:]]*:[[:space:]]*"[^"]*"' | head -1 | cut -d'"' -f4)
DOWNLOAD_URL=$(echo "$VERSION_INFO" | grep -o '"download_url"[[:space:]]*:[[:space:]]*"[^"]*"' | head -1 | cut -d'"' -f4)
CHECKSUM=$(echo "$VERSION_INFO" | grep -o '"checksum"[[:space:]]*:[[:space:]]*"[^"]*"' | head -1 | cut -d'"' -f4)
echo -e "${GREEN}最新版本: ${LATEST_VERSION}${NC}"

# 下载程序
echo -e "${YELLOW}下载程序文件...${NC}"
TMP_FILE="/tmp/ai_download"
curl -L -o "$TMP_FILE" "$DOWNLOAD_URL"

if [ ! -f "$TMP_FILE" ]; then
    echo -e "${RED}错误: 下载失败${NC}"
    exit 1
fi

# 校验文件
if [ -n "$CHECKSUM" ]; then
    echo -e "${YELLOW}校验文件完整性...${NC}"
    EXPECTED_HASH=$(echo "$CHECKSUM" | sed 's/sha256://')
    ACTUAL_HASH=$(sha256sum "$TMP_FILE" | awk '{print $1}')

    if [ "$EXPECTED_HASH" != "$ACTUAL_HASH" ]; then
        echo -e "${RED}错误: 文件校验失败${NC}"
        echo "期望: $EXPECTED_HASH"
        echo "实际: $ACTUAL_HASH"
        rm -f "$TMP_FILE"
        exit 1
    fi
    echo -e "${GREEN}文件校验通过${NC}"
fi

# 停止现有服务
if systemctl is-active --quiet "$SERVICE_NAME" 2>/dev/null; then
    echo -e "${YELLOW}停止现有服务...${NC}"
    systemctl stop "$SERVICE_NAME"
fi

# 备份旧版本
if [ -f "$BINARY_PATH" ]; then
    echo -e "${YELLOW}备份旧版本...${NC}"
    OLD_VERSION=$(timeout 5 "$BINARY_PATH" -version 2>/dev/null || echo "unknown")
    cp "$BINARY_PATH" "$BACKUP_DIR/ai_${OLD_VERSION}_$(date +%Y%m%d%H%M%S)"
fi

# 安装新版本
echo -e "${YELLOW}安装新版本...${NC}"
mv "$TMP_FILE" "$BINARY_PATH"
chmod 755 "$BINARY_PATH"
chown root:root "$BINARY_PATH"

# 创建或更新 systemd 服务
SERVICE_FILE="/etc/systemd/system/ai.service"
if [ "$IS_UPGRADE" = true ] && [ -f "$SERVICE_FILE" ]; then
    echo -e "${YELLOW}升级模式：保留现有 systemd 配置...${NC}"
    CURRENT_PORT=$(grep -oP 'Environment=PORT=\K[0-9]+' "$SERVICE_FILE" 2>/dev/null || echo "38899")
    echo -e "${GREEN}当前端口: ${CURRENT_PORT}${NC}"
else
    echo -e "${YELLOW}配置 systemd 服务 (端口: ${CURRENT_PORT})...${NC}"
    cat > "$SERVICE_FILE" << SVCEOF
[Unit]
Description=AI Panel - Server Management Panel
After=network.target

[Service]
Type=simple
User=root
Group=root
WorkingDirectory=/www/ai
ExecStart=/www/ai/ai
Restart=on-failure
RestartSec=5
StandardOutput=journal
StandardError=journal

# 安全设置
NoNewPrivileges=false
ProtectSystem=false
ProtectHome=false

# 环境变量
Environment=PORT=${CURRENT_PORT}
Environment=INIT_ADMIN_PASS=${ADMIN_PASS}

[Install]
WantedBy=multi-user.target
SVCEOF
fi

# 重载 systemd
systemctl daemon-reload

# 检测并开启防火墙端口
if command -v ufw &> /dev/null && ufw status 2>/dev/null | grep -q "Status: active"; then
    if ! ufw status | grep -q "${CURRENT_PORT}/tcp"; then
        echo -e "${YELLOW}检测到 UFW 防火墙，开放端口 ${CURRENT_PORT}...${NC}"
        ufw allow ${CURRENT_PORT}/tcp comment 'AI Panel' >/dev/null
        echo -e "${GREEN}✓ UFW 已放行 ${CURRENT_PORT}/tcp${NC}"
    fi
elif command -v firewall-cmd &> /dev/null && systemctl is-active --quiet firewalld; then
    if ! firewall-cmd --list-ports 2>/dev/null | grep -q "${CURRENT_PORT}/tcp"; then
        echo -e "${YELLOW}检测到 Firewalld，开放端口 ${CURRENT_PORT}...${NC}"
        firewall-cmd --permanent --add-port=${CURRENT_PORT}/tcp >/dev/null
        firewall-cmd --reload >/dev/null
        echo -e "${GREEN}✓ Firewalld 已放行 ${CURRENT_PORT}/tcp${NC}"
    fi
fi

# 启动服务
echo -e "${YELLOW}启动服务...${NC}"
systemctl enable "$SERVICE_NAME" >/dev/null 2>&1
systemctl start "$SERVICE_NAME"

# 等待服务启动
sleep 3

# 首次安装：启动后清理 systemd 中的初始密码环境变量
if [ "$IS_UPGRADE" = false ] && [ -n "$ADMIN_PASS" ]; then
    sed -i '/Environment=INIT_ADMIN_PASS=/d' "$SERVICE_FILE"
    systemctl daemon-reload
fi

# ========== 公网 IP 检测 ==========
detect_public_ip() {
    local ip=""
    for url in "https://ifconfig.me" "https://ip.sb" "https://ipinfo.io/ip" "https://api.ipify.org"; do
        ip=$(curl -s --max-time 3 "$url" 2>/dev/null | grep -oE '^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$')
        if [ -n "$ip" ]; then
            echo "$ip"
            return
        fi
    done
    echo ""
}

SERVER_IP=$(detect_public_ip)
if [ -n "$SERVER_IP" ]; then
    ACCESS_URL="https://${SERVER_IP}:${CURRENT_PORT}"
else
    ACCESS_URL="https://服务器IP:${CURRENT_PORT}"
fi

# 检查服务状态
if systemctl is-active --quiet "$SERVICE_NAME"; then
    echo -e "${GREEN}========================================${NC}"
    if [ "$IS_UPGRADE" = true ]; then
        echo -e "${GREEN}       升级完成！${NC}"
    else
        echo -e "${GREEN}       安装完成！${NC}"
    fi
    echo -e "${GREEN}========================================${NC}"
    echo ""
    echo -e "版本: ${GREEN}${LATEST_VERSION}${NC}"
    echo -e "管理端口: ${GREEN}${CURRENT_PORT}${NC}"
    if [ -n "$SERVER_IP" ]; then
        echo -e "访问地址: ${GREEN}${ACCESS_URL}${NC}"
    else
        echo -e "访问地址: ${GREEN}https://服务器IP:${CURRENT_PORT}${NC}"
        echo -e "${YELLOW}提示: 未能自动检测公网 IP，请替换为您的服务器 IP${NC}"
    fi
    if [ "$IS_UPGRADE" = false ]; then
        echo -e "${CYAN}已自动启用 HTTPS（自签证书），浏览器会提示不安全，点击「继续访问」即可${NC}"
        echo -e "${CYAN}登录面板后可在「面板SSL」页面申请免费正式证书${NC}"
    fi
    echo ""
    if [ "$IS_UPGRADE" = true ]; then
        echo -e "${GREEN}数据库和配置已保留，无需重新登录${NC}"
    else
        echo -e "默认账号: ${YELLOW}admin${NC}"
        echo -e "默认密码: ${YELLOW}${ADMIN_PASS}${NC}"
        echo ""
        echo -e "${RED}⚠ 请务必记住以上密码，安装完成后不再显示！${NC}"
    fi
    echo ""
    echo "常用命令:"
    echo "  systemctl status ai    # 查看状态"
    echo "  systemctl restart ai   # 重启服务"
    echo "  systemctl stop ai      # 停止服务"
    echo "  journalctl -u ai -f    # 查看日志"
    echo "  /www/ai/ai port        # 查看管理端口"
    echo "  /www/ai/ai reset       # 重置管理员密码"
else
    echo -e "${RED}错误: 服务启动失败${NC}"
    echo "请检查日志: journalctl -u ai -n 50"
    exit 1
fi
