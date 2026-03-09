# AI Panel - Releases

AI Panel 二进制发布仓库。

## 最新版本: v1.2.5

### v1.2.5 更新内容
- **网络搜索引擎配置**：可视化配置搜索引擎（Google/Grok/Kimi/Brave/Perplexity/Tavily MCP）
- 复用已有 LLM API Key（Gemini/xAI/Moonshot），无需额外申请即可搜索
- 独立 Key 方案（Brave/Perplexity/Tavily）附一键申请链接
- 搜索配置自动同步到 OpenClaw，保存即生效

### v1.2.4 更新内容
- OpenClaw 服务稳定性修复：systemd Restart=always 策略

### v1.2.3 更新内容
- OpenClaw 安装自动化：全部频道依赖 + Skills 工具链 + 记忆插件
- 长期记忆：memory-lancedb 自动配置
- 版本检测修复

### v1.2.2 更新内容
- 全面更新 AI 模型列表（GPT-5.4/5.4 Pro、Gemini 3.1、Claude 4.6、o3/o4-mini、Kimi K2.5）

### v1.2.1 更新内容
- 多平台频道绑定：Telegram / Discord / Slack / 飞书 / 钉钉 / 企业微信 / QQ

## 安装

```bash
curl -sSL https://raw.githubusercontent.com/owen2026a/ai-releases/main/install.sh | sudo bash
```

## 文件说明

| 文件 | 说明 |
|------|------|
| `install.sh` | 一键安装/升级脚本 |
| `version.json` | 版本元数据（版本号 + 下载地址 + SHA256） |
| Releases | 各版本二进制文件 |

