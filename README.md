# AI Panel

轻量级 Linux 服务器管理面板，单文件部署，Go 语言开发。

## 最新版本：v1.3.8

## 一键安装

```bash
curl -sSL https://raw.githubusercontent.com/owen2026a/ai-releases/main/install.sh | sudo bash
```

安装过程中可自定义管理端口（按回车随机分配 30000-40000 端口），安装完成后会显示随机生成的管理员密码。

首次安装自动启用 HTTPS（自签证书），浏览器点击「继续访问」即可，登录后可在「面板 SSL」页面申请免费正式证书。

## 常用命令

| 命令 | 说明 |
|------|------|
| `systemctl status ai` | 查看服务状态 |
| `systemctl restart ai` | 重启服务 |
| `systemctl stop ai` | 停止服务 |
| `journalctl -u ai -f` | 查看实时日志 |
| `/www/ai/ai port` | 查看管理端口 |
| `/www/ai/ai reset` | 重置管理员密码 |

> 忘记管理端口或密码时，SSH 登录服务器执行 `/www/ai/ai port` 或 `/www/ai/ai reset` 即可找回。

## v1.3.8 更新内容

### 微信个人号绑定
- **扫码绑定微信**：面板内一键扫码绑定个人微信（基于 ClawBot 插件），支持多账号
- **解绑管理**：已绑定账号列表展示，每个账号可单独解绑
- **自动环境修复**：插件安装时自动检测并修复 `dist/package.json` name 冲突、`memory-lancedb` 依赖缺失、npm 缓存权限、`openclaw/plugin-sdk` 模块解析等问题

### 适配 OpenClaw 2026.3.28
- **bundled 插件依赖**：自动安装 OpenRouter/Copilot/Codex 等 bundled 插件的 node_modules
- **x_search 搜索集成**：Grok 搜索自动配置 xAI bundled 插件
- **频道依赖更新**：新增 `@matrix-org/matrix-sdk-crypto-nodejs`（Matrix E2EE）+ `botbuilder`（Teams SDK）
- **配置清理增强**：自动移除 `qwen-portal-auth`、内置频道 stale allow 条目、旧 TTS 配置
- **企业微信插件**：默认安装 `@wecom/wecom-openclaw-plugin`

### 优化
- **随机密码**：排除视觉易混淆字符（0/O/o/1/l/I），终端下更易辨认
- **安装/更新脚本**：统一加入 `dist/package.json` name 修正、外部插件 openclaw 软链、npm 缓存修复

### v1.3.7
- 自定义管理端口、随机管理密码、自签 HTTPS 证书、CLI 管理命令（`ai port`/`ai reset`）
- 适配 OpenClaw 2026.3.24（imageModel 迁移、Skills 安装优化、配置自动修复）

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
