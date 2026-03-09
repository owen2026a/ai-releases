# AI Panel - 轻量级 AI 服务器管理面板

基于 Go 语言开发的现代化 Linux 服务器管理面板，单文件部署，无需运行时依赖。深度集成 AI 能力，让服务器管理更智能更高效。

<p align="center">
  <img src="https://github.com/owen2026a/ai-releases/releases/download/v1.0.1/dashboard.png" width="800" alt="AI Panel 仪表盘">
</p>

## 一键安装

```bash
curl -sSL https://raw.githubusercontent.com/owen2026a/ai-releases/main/install.sh | sudo bash
```

安装完成后访问 `https://服务器IP:38899`，默认账号 `admin` / `admin123456`。

---

## 最新版本 v1.2.2

### 新增功能
- **全面更新 AI 模型列表**：覆盖 11 大 Provider 截至 2026.3.7 的最新模型
- **OpenAI**：新增 GPT-5.4 Pro（旗舰 Computer Use）、GPT-5.3 Codex（代码）、o3/o3-pro/o4-mini 推理模型
- **Gemini**：Gemini 3.1 Pro、3 Flash、3.1 Flash-Lite 全系列
- **Moonshot**：更新为 Kimi K2.5（万亿 MoE）、Kimi Latest
- **Qwen**：新增 QwQ-32B 深度推理模型
- **xAI**：新增 Grok Code Fast 代码专用模型
- **Mistral**：新增 Magistral Medium 推理模型
- **OpenRouter**：热门模型更新为 GPT-5.4、Gemini 3 Flash 等

### 历史版本
- **v1.2.1**：飞书/钉钉/企业微信/QQ 频道绑定、自动更新修复
- **v1.2.0**：OpenClaw GitHub/GitLab Token 配置、频道绑定、插件预装、长期记忆
- **v1.1.2**：终端心跳保活+自动重连、AI 命令复制/执行按钮、软件 AI 安装助手
- **v1.1.1**：手机端适配优化、AI 浮窗一键应用、终端 AI 命令助手修复
- **v1.1.0**：AI 模块助手、SSE 流式输出、聊天持久化、全局 AI 浮窗
- **v1.0.1**：品牌重命名、AI 全面增强（网页生成、配置助手、安全检测）

---

## AI 智能助手

AI Panel 深度集成 [OpenClaw](https://openclaw.com) 智能助手平台，为服务器管理提供全方位 AI 能力。不同于传统面板的手动操作方式，AI Panel 将人工智能融入每一个管理环节，让复杂的服务器运维变得简单直观。

<p align="center">
  <img src="https://github.com/owen2026a/ai-releases/releases/download/v1.0.1/openclaw-ui.png" width="800" alt="OpenClaw 智能助手">
</p>

### 多模型支持

支持主流 AI 模型 Provider 一键切换，可根据需求和预算灵活选择：

| Provider | 模型 | 特点 |
|----------|------|------|
| Google Gemini | Gemini 3.1 Pro / 2.5 Flash | 1M 上下文，综合榜首 |
| Anthropic | Claude Sonnet 4.6 / Haiku | 代码能力顶尖，200K 上下文 |
| OpenAI | GPT-5 / o3-mini | 128K 上下文，多模态推理 |
| DeepSeek | DeepSeek V3 / R1 | 性价比最高，中文优化 |
| Groq | Llama 4 / DeepSeek R1 | 推理速度极快（LPU 加速） |
| xAI | Grok 4.1 / Grok Code | 2M 上下文，实时 X 数据 |
| Mistral | Mistral Large / Codestral | 欧洲部署，隐私合规 |
| Moonshot | Kimi K2.5 / K2 Thinking | 256K 上下文，Agent 协作 |
| 通义千问 | Qwen 3.5 Plus / Qwen-Max | 1M 上下文，国内直连 |

### SSE 流式输出

所有 AI 功能均支持 **Server-Sent Events 实时流式响应**，打字机效果逐字输出，无需等待完整回复。支持 OpenAI 兼容 API、Anthropic Claude、Google Gemini 三大 Provider 的原生流式协议。

### 聊天记录持久化

对话历史自动保存到 SQLite 数据库，刷新页面不丢失聊天记录。支持会话列表查看、历史消息加载和会话删除管理。

### AI Agent 模式

AI 助手支持 Agent 模式，可直接在服务器上执行操作：
- 执行系统命令（安装软件、查看日志、排查问题）
- 管理文件（创建、编辑、移动、删除）
- 分析系统日志，定位故障原因
- 自动化运维脚本编写与执行

<p align="center">
  <img src="https://github.com/owen2026a/ai-releases/releases/download/v1.0.1/ai-assistant.png" width="800" alt="AI Agent 模式">
</p>

---

### AI 模块助手

AI Panel 将 AI 能力深度融入各个管理模块，在你需要的地方直接提供智能辅助。通过自然语言描述需求，AI 自动生成对应的配置、命令或代码，一键应用。

| 模块 | 功能 | 入口位置 |
|------|------|---------|
| **MySQL AI** | 自然语言 → SQL 查询语句，自动识别当前数据库和表结构 | SQL 查询对话框 |
| **Cron AI** | 自然语言 → Cron 表达式 + 执行命令，自动填充表单 | 创建定时任务对话框 |
| **防火墙 AI** | 自然语言 → 防火墙规则（自动适配 UFW/Firewalld），一键应用 | 防火墙规则页面 |
| **Docker AI** | 自然语言 → docker-compose.yml 完整配置 | 创建 Compose 项目对话框 |
| **终端 AI** | 任务描述 → Linux 命令，一键复制/执行到终端 | 终端侧边栏 |
| **软件 AI** | 分析系统环境 → 推荐版本 → 一键执行安装（实时日志流） | 软件管理页面 |
| **系统优化 AI** | 自动采集 CPU/内存/磁盘/内核参数，给出针对性优化建议 | 系统优化页面 |
| **仪表盘 AI** | 一键系统健康检查，识别异常、分析瓶颈、给出处理建议 | 仪表盘页面 |
| **Nginx AI** | 对话式分析和修改配置，支持多轮上下文持续优化 | 网站配置弹窗 |

**全局 AI 浮窗**：各功能页面右下角均有 AI 浮窗按钮，点击即可呼出对应模块的 AI 助手，无需切换页面。统一的聊天界面支持流式输出、Markdown 渲染、代码高亮和一键复制。

---

### AI 代码编辑助手

在文件管理器的代码编辑器中，内置 AI 对话助手，支持通过自然语言修改代码。

**核心功能：**
- **对话式编辑**：告诉 AI 你要修改什么，自动生成修改方案
- **截图粘贴**：直接粘贴截图让 AI 理解你的需求，支持 UI 还原
- **Diff 对比**：修改前可预览变更内容，清晰展示新增/删除/修改的代码行
- **一键应用/撤销**：确认无误后一键应用，不满意可立即撤回
- **多轮对话**：支持多轮对话持续优化，AI 记住上下文

<p align="center">
  <img src="https://github.com/owen2026a/ai-releases/releases/download/v1.0.1/ai-file-editor.png" width="700" alt="AI 代码编辑助手">
</p>

---

### AI 网页生成器

在文件管理器中一键呼出 AI 网页生成面板，通过描述需求或粘贴截图，AI 自动生成完整的网页项目。

**核心功能：**
- **描述生成**：用自然语言描述你想要的网页
- **截图还原**：粘贴任意网页截图，AI 智能还原设计
- **多文件输出**：自动生成 HTML + CSS + JS 多文件项目结构
- **多轮优化**：对生成结果不满意可继续对话调整细节

<p align="center">
  <img src="https://github.com/owen2026a/ai-releases/releases/download/v1.0.1/ai-webpage-generator.png" width="700" alt="AI 网页生成器">
</p>

---

### AI Nginx 配置助手

在网站管理的配置编辑弹窗中，内置 AI 配置助手，支持对话式分析和修改 Nginx 配置。

**核心功能：**
- **配置检测**：AI 自动分析当前 Nginx 配置，发现潜在问题
- **智能修改**：自然语言描述需求，自动生成完整修改方案
- **SSL 优化**：一键生成 HTTPS 最佳实践配置
- **预览 / 应用 / 撤销**：修改前可预览，一键应用或撤回
- **多轮上下文**：在同一会话中持续对话优化配置

<p align="center">
  <img src="https://github.com/owen2026a/ai-releases/releases/download/v1.0.1/ai-nginx-config.png" width="700" alt="AI Nginx 配置助手">
</p>

---

### AI 安全检测

在文件管理器中一键触发 AI 安全扫描，智能分析网站目录下的所有 Web 文件，全面检测安全威胁。

**检测项目：**
- **木马/后门/WebShell**：PHP 一句话木马、大马、变形马、加密木马
- **恶意 JS 注入**：流量劫持脚本、广告弹窗注入、加密挖矿代码
- **SEO 黑帽**：隐藏文字/链接、蜘蛛劫持、关键词堆砌
- **暗链挂马**：赌博/色情隐藏链接、base64 编码恶意内容
- **配置安全**：.htaccess 篡改、.env 文件泄露

---

## 基础功能

### 系统监控
- 实时 CPU、内存、磁盘使用率可视化（环形图表）
- 系统负载、网络流量实时统计
- 核心服务运行状态一览

### 网站管理
- OpenResty (Nginx) 站点管理，可视化配置
- SSL 证书自动申请（Let's Encrypt），支持 IP 证书
- 反向代理、重定向规则配置
- PHP 多版本切换（7.4 / 8.0 / 8.1 / 8.2 / 8.3）

### 软件管理
- 一键安装 / 卸载 / 更新 / 启停
- 支持：OpenResty、PHP、MySQL、Redis、vsftpd、Docker、Go、Node.js、phpMyAdmin
- **AI 软件安装助手**（分析系统 → 推荐版本 → 一键执行 + 实时日志）

### Docker 管理
- 容器管理：创建、启停、删除、实时日志
- 镜像管理、Compose 项目、网络和存储卷

### 文件管理
- 在线文件浏览器，拖拽上传
- 代码编辑器（Ace Editor，40+ 语言语法高亮）
- 文件压缩 / 解压（zip、tar.gz）

### 数据库管理
- MySQL 数据库 / 用户 / 权限管理（支持 8.0 / 8.4 / 9.1）
- Redis 键值浏览、内存监控

### 域名管理
- 多注册商 API 对接：Cloudflare、GoDaddy、Namecheap、DNSPod、阿里云、Gname、Name.com
- DNS 记录管理、批量修改 NS 服务器

### 安全功能
- AES-256-GCM 数据库加密
- 2FA 双因素认证（TOTP）
- IP 白名单、用户/分组权限
- 防火墙规则管理（UFW / Firewalld）

### 其他
- FTP 用户管理
- 计划任务（Cron 可视化）
- Web 终端（浏览器内 SSH + 心跳保活 + 断线自动重连）
- 系统优化（内核参数调优）
- 面板自动更新

---

## 多系统支持

| 发行版 | 包管理器 | 防火墙 | 状态 |
|--------|---------|--------|------|
| Ubuntu 20.04+ | apt | UFW | 主要开发平台 |
| Debian 10+ | apt | UFW | 完整支持 |
| CentOS 7+ | yum/dnf | Firewalld | 完整支持 |
| AlmaLinux / Rocky 8+ | dnf | Firewalld | 完整支持 |

## 技术栈

- **后端**: Go + Chi Router + GORM + SQLite
- **前端**: HTML 模板 + Tailwind CSS + Alpine.js + HTMX
- **部署**: 单二进制文件 + 模板目录，无运行时依赖

## 常用命令

```bash
systemctl status ai      # 查看状态
systemctl restart ai     # 重启服务
systemctl stop ai        # 停止服务
journalctl -u ai -f      # 查看日志
```

## 许可证

MIT License
