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

## AI 智能助手

AI Panel 深度集成 [OpenClaw](https://github.com/openai/openai-cookbook) 智能助手平台，为服务器管理提供全方位 AI 能力。不同于传统面板的手动操作方式，AI Panel 将人工智能融入每一个管理环节，让复杂的服务器运维变得简单直观。

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

### AI Agent 模式

AI 助手支持 Agent 模式，可直接在服务器上执行操作：
- 执行系统命令（安装软件、查看日志、排查问题）
- 管理文件（创建、编辑、移动、删除）
- 分析系统日志，定位故障原因
- 自动化运维脚本编写与执行

---

### AI 代码编辑助手

在文件管理器的代码编辑器中，内置 AI 对话助手，支持通过自然语言修改代码。

**核心功能：**
- **对话式编辑**：告诉 AI 你要修改什么，自动生成修改方案
- **截图粘贴**：直接粘贴截图让 AI 理解你的需求，支持 UI 还原
- **Diff 对比**：修改前可预览变更内容，清晰展示新增/删除/修改的代码行
- **一键应用**：确认无误后一键应用修改到编辑器
- **一键撤销**：不满意可立即撤回上次 AI 修改，恢复到之前的内容
- **放弃所有修改**：可一键还原到打开文件时的原始内容
- **多轮对话**：支持多轮对话持续优化，AI 记住上下文

<p align="center">
  <img src="https://github.com/owen2026a/ai-releases/releases/download/v1.0.1/ai-file-editor.png" width="700" alt="AI 代码编辑助手">
</p>

---

### AI 网页生成器

在文件管理器中一键呼出 AI 网页生成面板，通过描述需求或粘贴截图，AI 自动生成完整的网页项目。

**核心功能：**
- **描述生成**：用自然语言描述你想要的网页（如"做一个企业官网，蓝色主题，包含首页、关于我们、联系方式"）
- **截图还原**：粘贴任意网页截图，AI 智能还原设计，生成高保真 HTML
- **网站克隆**：提供目标网站 URL，AI 分析并生成类似风格的网页
- **多文件输出**：自动生成 HTML + CSS + JS 多文件项目结构
- **自动保存**：生成的文件直接保存到当前目录，立即可用
- **多轮优化**：对生成结果不满意可继续对话调整细节
- **快捷模板**：内置常用网页类型快捷生成按钮

<p align="center">
  <img src="https://github.com/owen2026a/ai-releases/releases/download/v1.0.1/ai-webpage-generator.png" width="700" alt="AI 网页生成器">
</p>

---

### AI Nginx 配置助手

在网站管理的配置编辑弹窗中，内置 AI 配置助手，支持对话式分析和修改 Nginx 配置。

**核心功能：**
- **配置检测**：AI 自动分析当前 Nginx 配置，发现潜在问题和优化空间
- **智能修改**：告诉 AI 你的需求（如"添加反向代理到 3000 端口"、"开启 Gzip 压缩"、"配置 WebSocket 支持"），自动生成完整修改方案
- **SSL 优化**：一键生成 HTTPS 最佳实践配置（HSTS、OCSP Stapling、强密码套件）
- **缓存配置**：根据站点类型智能推荐静态资源缓存策略
- **预览修改**：展开查看 AI 生成的完整配置内容，确认后再应用
- **一键应用**：将 AI 修改直接应用到配置编辑器
- **一键撤销**：不满意可撤回修改，恢复到 AI 修改前的配置
- **还原原始**：可一键恢复到打开弹窗时的原始配置

<p align="center">
  <img src="https://github.com/owen2026a/ai-releases/releases/download/v1.0.1/ai-nginx-config.png" width="700" alt="AI Nginx 配置助手">
</p>

---

### AI 安全检测

在文件管理器中一键触发 AI 安全扫描，智能分析网站目录下的所有 Web 文件，全面检测安全威胁。

**检测项目：**
- **木马/后门/WebShell**：检测 PHP 一句话木马、大马、变形马、加密木马
- **恶意 JS 注入**：检测流量劫持脚本、广告弹窗注入、加密挖矿代码、eval 混淆执行
- **SEO 黑帽**：检测隐藏文字/链接、蜘蛛劫持（针对搜索引擎 UA 跳转）、关键词堆砌
- **暗链挂马**：检测赌博/色情隐藏链接、base64 编码恶意内容、iframe 隐藏注入
- **配置安全**：检测 .htaccess 篡改、.env 文件泄露、敏感信息暴露
- **异常文件**：检测最近修改的可疑文件、权限异常的文件、不应出现在 Web 目录的文件

<p align="center">
  <img src="https://github.com/owen2026a/ai-releases/releases/download/v1.0.1/ai-file-manager.png" width="700" alt="AI 文件管理器面板">
</p>

---

## 基础功能

### 系统监控
- 实时 CPU、内存、磁盘使用率可视化（环形图表）
- 系统负载（1/5/15 分钟）、网络流量实时统计
- 核心服务运行状态一览（OpenResty、PHP、MySQL、Redis、FTP）

### 网站管理
- OpenResty (Nginx) 站点管理，可视化配置编辑
- SSL 证书自动申请（Let's Encrypt），支持 IP 证书
- 反向代理、重定向规则配置
- PHP 多版本切换（7.4 / 8.0 / 8.1 / 8.2 / 8.3）

### 软件管理
- 一键安装 / 卸载 / 更新 / 启停
- 支持：OpenResty、PHP、MySQL、Redis、vsftpd、Docker、Go、Node.js、phpMyAdmin
- OpenClaw AI 助手一键安装，自动配置 Gateway 认证

### Docker 管理
- 容器管理：创建、启停、删除、实时日志查看
- 镜像管理、Compose 项目、网络和存储卷

### 文件管理
- 在线文件浏览器，支持拖拽上传
- 代码编辑器（Ace Editor，40+ 语言语法高亮、全屏编辑）
- 文件压缩 / 解压（zip、tar.gz）
- 文件搜索、WebShell 特征扫描

### 数据库管理
- MySQL 数据库 / 用户 / 权限管理（支持 8.0 / 8.4 / 9.1）
- Redis 键值浏览、内存监控

### 域名管理
- 多注册商 API 对接：Cloudflare、GoDaddy、Namecheap、DNSPod、阿里云、Gname、Name.com
- DNS 记录管理、批量修改 NS 服务器

### 安全功能
- AES-256-GCM 数据库敏感字段加密（API Key、密码等）
- 2FA 双因素认证（TOTP）
- IP 白名单访问控制
- 用户 / 分组权限管理
- 防火墙规则管理（自动适配 UFW / Firewalld）

### 其他功能
- FTP 用户管理
- 计划任务（Cron 可视化管理）
- Web 终端（浏览器内 SSH）
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
