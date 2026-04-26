# AI Panel - 轻量级服务器管理面板

基于 Go 语言开发的现代化 Linux 服务器管理面板，单文件部署，无需运行时依赖。

## 最新版本：v1.4.09

## 一键安装

```bash
curl -sSL https://raw.githubusercontent.com/owen2026a/ai-releases/main/install.sh | sudo bash
```

安装过程中可自定义管理端口（按回车随机分配 30000-40000 端口），管理员密码自动随机生成（排除易混淆字符），首次安装自动启用 HTTPS（自签证书）。

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

## 功能特性

### 系统监控
- 实时 CPU、内存、磁盘使用率可视化
- 系统负载、网络流量统计
- 核心服务运行状态一览

### 网站管理
- OpenResty (Nginx) 站点管理，可视化配置
- **AI Nginx 配置助手**（智能分析配置、一键生成反代/缓存/SSL 优化，对话式修改）
- **网站日志分析**（全维度可视化仪表盘，4 个分析 Tab：流量概览/错误排查/性能分析/访客统计）
- **AI 日志智能分析**（流式输出专业分析报告，含流量评估、安全诊断、性能建议、优化方案）
- **CC 攻击检测引擎**（多因子风险评分，高危 IP 自动识别，AI 给出封禁命令和防御配置）
- SSL 证书自动申请（Let's Encrypt），支持 IP 证书
- 反向代理、重定向规则配置
- PHP 多版本切换（7.4 / 8.0 / 8.1 / 8.2 / 8.3）

### 软件管理
- 一键安装 / 卸载 / 更新 / 启停
- OpenResty、PHP、MySQL、Redis、vsftpd、Docker、Go、Node.js、phpMyAdmin
- **AI 软件安装助手**（分析系统环境，推荐版本，一键执行安装命令）
- OpenClaw AI 助手（Agent 模式，可执行系统命令）
- **频道绑定**：可视化配置 Telegram、Discord、Slack、飞书、钉钉、企业微信、QQ 等多平台机器人

### Docker 管理
- 容器管理：创建、启停、删除、实时日志
- 镜像管理、Compose 项目、网络和存储卷
- **AI Compose 生成**（自然语言描述需求，自动生成 docker-compose.yml）

### 文件管理
- 在线文件浏览器，拖拽上传
- 代码编辑器（语法高亮、全屏编辑）
- AI 代码编辑助手（对话式修改、截图粘贴、Diff 对比、一键应用/撤销）
- AI 网页生成器（描述需求自动生成网页、截图还原设计）
- AI 安全检测（智能分析目录文件，检测木马/后门/恶意 JS/暗链/SEO 黑帽）
- 文件压缩 / 解压（zip、tar.gz）
- 文件搜索、WebShell 特征扫描

### 数据库管理
- MySQL 数据库 / 用户 / 权限管理
- **AI SQL 助手**（自然语言描述查询需求，自动生成 SQL 语句）
- Redis 键值浏览、内存监控

### 域名管理
- 多注册商 API 对接：Cloudflare、GoDaddy、Namecheap、DNSPod、阿里云、Gname、Name.com
- DNS 记录管理、批量修改 NS 服务器

### AI 助手

集成 [OpenClaw](https://openclaw.com) 智能助手，为服务器管理提供全方位 AI 能力。

**核心能力：**
- 集成 OpenClaw，支持 Agent 模式（可执行系统命令、管理文件、分析日志）
- 支持多 Provider 切换：Gemini、Claude、GPT、DeepSeek、Groq、xAI、Mistral、Moonshot、通义千问等
- SSE 流式输出，聊天记录持久化，全局 AI 浮窗
- 多平台频道绑定（Telegram / Discord / Slack / 飞书 / 钉钉 / 企业微信 / 微信 / QQ / MS Teams / Matrix 等）
- **微信绑定**：面板内扫码绑定个人微信（ClawBot 插件），支持多账号绑定/解绑
- 一键安装 OpenClaw + 全部频道依赖 + Skills 工具链 + 记忆插件
- 长期记忆（memory-lancedb）、无损上下文引擎（lossless-claw）
- 量化交易 Skills：预装 11 个量化交易插件
- 网络搜索配置：Google / Grok / Kimi / Brave / Perplexity / Tavily / Exa / Firecrawl
- 设置面板 Tab 化：LLM 配置 / 频道绑定 / Git 集成 / 量化交易
- 自动适配最新 OpenClaw 版本，安装/更新时自动迁移配置

**AI 模块助手：**

| 模块 | 功能 | 入口 |
|------|------|------|
| MySQL AI | 自然语言 → SQL 查询语句 | SQL 查询对话框 |
| Cron AI | 自然语言 → Cron 表达式 + 命令 | 创建定时任务对话框 |
| 防火墙 AI | 自然语言 → 防火墙规则（UFW/Firewalld） | 防火墙规则页面 |
| Docker AI | 自然语言 → docker-compose.yml | 创建 Compose 对话框 |
| 终端 AI | 任务描述 → Linux 命令（一键复制/执行） | 终端侧边栏 |
| 软件 AI | 分析系统 → 推荐版本 → 一键执行安装 | 软件管理页面 |
| 系统优化 AI | 自动采集参数 → 优化建议 | 系统优化页面 |
| 仪表盘 AI | 自动采集状态 → 健康诊断 | 仪表盘页面 |
| Nginx AI | 对话式分析/修改配置（支持多轮上下文） | 网站配置弹窗 |
| 日志 AI | 日志分析 → 流量报告 + CC 攻击检测 + 防御方案 | 网站日志分析面板 |

**AI 文件编辑助手：**
- 在代码编辑器中通过对话让 AI 修改代码，支持粘贴截图
- Diff 对比查看修改内容，一键应用或撤销
- 可预览 HTML 文件效果

**AI 网页生成器：**
- 描述需求自动生成完整网页，支持粘贴网页截图智能还原设计
- 生成的文件自动保存到当前目录，支持多文件（HTML + CSS + JS）

**AI Nginx 配置助手：**
- 对话式分析和修改 Nginx 配置，支持多轮上下文
- 智能检测配置问题，一键生成反向代理、SSL 优化、缓存配置等

**AI 安全检测：**
- 智能分析网站目录所有 Web 文件，检测木马/后门/WebShell
- 检测恶意 JS 注入、SEO 黑帽、暗链挂马、配置安全问题

### 暗色主题（NEW）
- 全局暗色模式，侧边栏 + 内容区 + 登录页全覆盖
- 一键切换亮/暗主题，偏好自动保存到 localStorage
- 跟随系统主题自动适配，无闪烁切换
- 夜间运维友好，所有 UI 组件均适配暗色

### 安全功能
- AES-256-GCM 数据库敏感字段加密（API Key、密码等）
- 2FA 双因素认证（TOTP），关闭需密码验证
- **登录暴力破解防护**（同 IP 5次失败锁定15分钟）
- **安全响应头**（X-Frame-Options、X-Content-Type-Options、Referrer-Policy、Permissions-Policy）
- **WebSocket Origin 校验**（终端、日志、AI 助手连接校验来源）
- **Cookie 安全**（SameSite=Strict、HTTPS 自动 Secure、7天过期、HttpOnly）
- **命令注入防护**（crontab/chpasswd/systemctl 使用安全参数传递，禁止 shell 拼接）
- **敏感文件保护**（文件管理器禁止读写系统敏感文件）
- **输入校验**（用户名、服务操作、文件名全部正则校验）
- IP 白名单访问控制
- 用户 / 分组权限管理
- 防火墙规则管理（自动适配 UFW / Firewalld）+ AI 规则生成
- SSH 端口修改（可视化修改，自动适配多发行版 + SELinux + 防火墙放行）
- SSH 登录禁止（一键禁止外部 SSH，Web 终端不受影响，可随时恢复）
- 首次安装自动生成自签 HTTPS 证书

### 其他
- FTP 用户管理
- 计划任务（Cron 可视化）+ AI 定时任务生成
- Web 终端（浏览器内 SSH）+ AI 命令助手（一键复制/执行）
- 系统优化 + AI 优化分析
- AI 系统诊断（仪表盘一键健康检查）
- 自动更新

## 支持系统

| 发行版 | 状态 |
|--------|------|
| Ubuntu 20.04+ | ✅ 主要开发平台 |
| Debian 10+ | ✅ 完整支持 |
| CentOS 7+ | ✅ 完整支持 |
| AlmaLinux / Rocky 8+ | ✅ 完整支持 |

## 技术栈

- **后端**: Go + Chi Router + GORM + SQLite
- **前端**: HTML 模板 + Tailwind CSS + Alpine.js + HTMX
- **部署**: 单二进制文件 + 模板目录

## 许可证

MIT License
