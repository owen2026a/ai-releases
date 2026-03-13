# AI Panel - 轻量级服务器管理面板

基于 Go 语言开发的现代化 Linux 服务器管理面板，单文件部署，无需运行时依赖。

> 最新发布版本：**v1.3.4**


## 功能特性

### 系统监控
- 实时 CPU、内存、磁盘使用率可视化
- 系统负载、网络流量统计
- 核心服务运行状态一览

### 网站管理
- OpenResty (Nginx) 站点管理，可视化配置
- **AI Nginx 配置助手**（智能分析配置、一键生成反代/缓存/SSL 优化，对话式修改）
- SSL 证书自动申请（Let's Encrypt），支持 IP 证书
- 反向代理、重定向规则配置
- PHP 多版本切换（7.4 / 8.0 / 8.1 / 8.2 / 8.3）

### 软件管理
- 一键安装 / 卸载 / 更新 / 启停
- OpenResty、PHP、MySQL、Redis、vsftpd、Docker、Go、Node.js、phpMyAdmin
- **AI 软件安装助手**（分析系统环境，推荐版本，一键执行安装命令，实时日志流输出）
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
- **全面更新 AI 模型列表**（GPT-5.4/5.4 Pro、Gemini 3.1 Pro/3 Flash/3.1 Flash-Lite、Claude 4.6、o3/o4-mini 推理模型、Kimi K2.5、QwQ-32B 等）
- **SSE 流式输出**（所有 AI 功能支持实时流式响应，打字机效果）
- **聊天记录持久化**（对话历史保存到 SQLite，刷新不丢失）
- **全局 AI 浮窗**（各功能页面可通过浮窗快速呼出对应模块的 AI 助手）
- **多平台频道绑定**（Telegram / Discord / Slack / 飞书 / 钉钉 / 企业微信 / QQ / MS Teams / Matrix 等）
- **安装自动化**：一键安装 OpenClaw + 全部频道依赖 + Skills 工具链（git/gh/clawhub/rg/uv）+ 记忆插件
- **长期记忆**：memory-lancedb 插件自动配置，autoCapture + autoRecall，跨会话记忆
- **无损上下文引擎**：lossless-claw 插件自动安装启用，增量无损压缩，长对话不丢失信息
- **量化交易 Skills**：预装 11 个量化交易插件（币安交易/A 股监控/套利扫描/网格交易等），支持在线搜索安装更多
- **网络搜索配置**：可视化配置搜索引擎（Google/Grok/Kimi/Brave/Perplexity/Tavily），复用 LLM Key 或独立申请
- **设置面板 Tab 化**：LLM 配置 / 频道绑定 / Git 集成 / 量化交易 四个 Tab 切换，告别长滚动
- **服务稳定性**：systemd `Restart=always` 策略，AI Agent 修改配置触发重启后自动恢复
- 安装即用，自动配置 Gateway 认证
- 可在软件管理页面一键安装/更新，保留配置

**AI 模块助手（NEW）：**

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

**AI 文件编辑助手：**
- 在代码编辑器中通过对话让 AI 修改代码，支持粘贴截图
- Diff 对比查看修改内容，一键应用或撤销
- 支持放弃所有修改、还原到原始内容
- 可预览 HTML 文件效果

**AI 网页生成器：**
- 在文件管理器中一键呼出 AI，描述需求自动生成完整网页
- 支持粘贴网页截图，AI 智能还原设计
- 生成的文件自动保存到当前目录，支持多文件（HTML + CSS + JS）
- 多轮对话持续优化生成效果

**AI Nginx 配置助手：**
- 在网站配置弹窗中打开 AI 助手，对话式分析和修改 Nginx 配置
- 智能检测配置问题，一键生成反向代理、SSL 优化、缓存配置等
- 修改方案可预览、一键应用、一键撤销
- **支持多轮上下文**（在同一会话中持续对话优化配置）

**AI 安全检测：**
- 智能分析网站目录所有 Web 文件，检测木马/后门/WebShell
- 检测恶意 JS 注入（流量劫持、广告跳转、加密代码）
- 检测 SEO 黑帽（隐藏文字/链接、蜘蛛劫持、iframe 注入）
- 检测暗链挂马（赌博/色情隐藏链接、base64 恶意内容）
- 检测配置安全问题（.htaccess 篡改、.env 泄露）

### 安全功能
- AES-256-GCM 数据库敏感字段加密（API Key、密码等）
- 2FA 双因素认证（TOTP）
- IP 白名单访问控制
- 用户 / 分组权限管理（编辑用户信息和密码时实时显示错误提示）
- 防火墙规则管理（自动适配 UFW / Firewalld）
- **SSH 端口修改**（可视化修改 SSH 端口，自动适配 Ubuntu/Debian/CentOS/RHEL，支持 systemd socket activation + SELinux + 防火墙自动放行）
- **AI 防火墙规则生成**（自然语言描述安全策略，自动生成规则）

### 其他
- FTP 用户管理
- 计划任务（Cron 可视化）+ **AI 定时任务生成**（自然语言描述需求，自动生成 Cron 表达式和命令）
- Web 终端（浏览器内 SSH）+ **AI 命令助手**（描述任务，生成 Linux 命令，一键复制/执行到终端）
  - WebSocket 连接稳定性大幅提升：修复写超时泄漏、读超时不续期、事件监听器堆叠三大断连 Bug
  - bash 进程独立会话隔离 + 退出诊断日志 + 指数退避自动重连
  - AI 生成的命令支持「复制」「执行」按钮，多行命令自动处理
- 系统优化 + **AI 优化分析**（自动采集系统信息，给出针对性优化建议）
- **AI 系统诊断**（仪表盘一键 AI 健康检查，识别异常和瓶颈）
- 自动更新

## 多系统支持

| 发行版 | 包管理器 | 防火墙 | 状态 |
|--------|---------|--------|------|
| Ubuntu 20.04+ | apt | UFW | 主要开发平台 |
| Debian 10+ | apt | UFW | 完整支持 |
| CentOS 7+ | yum/dnf | Firewalld | 完整支持 |
| AlmaLinux / Rocky 8+ | dnf | Firewalld | 完整支持 |

## 一键安装

```bash
curl -sSL https://raw.githubusercontent.com/owen2026a/ai-releases/main/install.sh | sudo bash
```

安装完成后访问 `https://服务器IP:38899`，默认账号 `admin` / `admin123456`。

## 技术栈

- **后端**: Go + Chi Router + GORM + SQLite
- **前端**: HTML 模板 + Tailwind CSS + Alpine.js + HTMX
- **部署**: 单二进制文件 + 模板目录

## 许可证

MIT License
