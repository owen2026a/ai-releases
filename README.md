# AI Panel

轻量级 Linux 服务器管理面板，单文件部署，Go 语言开发。

## 最新版本：v1.3.6

## 一键安装

```bash
curl -sSL https://raw.githubusercontent.com/owen2026a/ai-releases/main/install.sh | sudo bash
```

安装完成后访问 `https://服务器IP:38899`，默认账号 `admin` / `admin123456`。

## v1.3.6 更新内容

### 新功能
- **SSH 登录禁止**：防火墙页面新增一键开关，禁止所有外部 SSH 工具连接，面板 Web 终端不受影响
  - 支持 UFW (Ubuntu/Debian)、firewalld (CentOS/RHEL)、iptables (兜底方案) 三种防火墙
  - 开启前弹出安全警告，提示唯一管理方式为面板 Web 终端
  - 操作后自动刷新规则列表

### 修复
- **OpenClaw 配置校验**：修复 OpenClaw 2026.3.12 更新后配置校验失败无法启动
- **网络搜索**：修复 Google Search 搜索引擎配置后无法使用
- **OpenClaw 更新脚本**：加入配置清理（移除无效 key）和 clawhub 同步更新
- **OpenResty 进程管理**：统一使用 systemctl 管理，避免孤儿进程导致端口冲突

## 核心功能

- 系统监控（CPU/内存/磁盘/网络实时可视化）
- 网站管理（OpenResty 站点、SSL 证书、反向代理）
- 网站日志分析（全维度仪表盘 + AI 智能分析 + CC 攻击检测）
- 软件管理（一键安装 MySQL/Redis/PHP/Docker/Node.js 等）
- Docker 管理（容器/镜像/Compose/网络/存储卷）
- 文件管理（在线编辑器 + AI 代码助手 + AI 网页生成器 + AI 安全检测）
- 数据库管理（MySQL + Redis + AI SQL 助手）
- 域名管理（Cloudflare/GoDaddy/DNSPod/阿里云等多注册商）
- AI 助手（OpenClaw Agent 模式，10+ 模块 AI 助手）
- 安全功能（2FA、IP 白名单、SSH 端口修改、SSH 登录禁止、加密存储）
- 防火墙（UFW/Firewalld 自动适配 + AI 规则生成）
- Web 终端 + AI 命令助手
- 计划任务 + AI Cron 生成
- FTP 用户管理
- 自动更新

## 支持系统

| 发行版 | 状态 |
|--------|------|
| Ubuntu 20.04+ | ✅ 主要开发平台 |
| Debian 10+ | ✅ 完整支持 |
| CentOS 7+ | ✅ 完整支持 |
| AlmaLinux / Rocky 8+ | ✅ 完整支持 |
