# AI Panel

轻量级 Linux 服务器管理面板，单文件部署，Go 语言开发。

## 最新版本：v1.3.7

## 一键安装

```bash
curl -sSL https://raw.githubusercontent.com/owen2026a/ai-releases/main/install.sh | sudo bash
```

安装完成后访问 `https://服务器IP:38899`，默认账号 `admin` / `admin123456`。

## v1.3.7 更新内容

### 适配 OpenClaw 2026.3.24
- **图片生成模型迁移**：`imageModel` → `imageGenerationModel.primary`，适配 nano-banana-pro 移除
- **Skills 安装优化**：优先使用 `openclaw skills install`（2026.3.22+），clawhub 作为降级方案
- **频道依赖更新**：新增 `matrix-js-sdk`（Matrix 官方 SDK 插件）
- **配置自动修复**：升级时运行 `openclaw doctor --fix` 自动修复废弃配置
- **Skills 列表更新**：移除已废弃的 nano-banana-pro，新增 coding-agent + session-logs
- **内置 Web 搜索**：Tavily / Exa / Firecrawl 变为内置搜索插件，按需配置

### 修复
- **配置迁移**：升级脚本自动将旧 `agents.defaults.imageModel` 迁移到新 `imageGenerationModel` 路径
- **syncAPIKeyToOpenClaw**：图片模型配置写入正确的 `imageGenerationModel.primary` 路径

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
