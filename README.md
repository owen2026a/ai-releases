# AI Panel - Releases

AI Panel 二进制发布仓库。

## 最新版本: v1.2.4

### v1.2.4 更新内容
- **OpenClaw 服务稳定性修复**：systemd Restart=always 策略，AI Agent 修改配置后服务自动恢复
- **更新脚本自动修复**：旧版本升级时自动修正 systemd 配置

### v1.2.3 更新内容
- **OpenClaw 安装自动化**：一键安装全部频道依赖 + Skills 工具链（git/gh/clawhub/rg/uv）+ 记忆插件
- **长期记忆**：memory-lancedb 插件自动配置，autoCapture + autoRecall
- **版本检测修复**：修复 OpenClaw 版本比较逻辑，正确提示更新

### v1.2.2 更新内容
- **全面更新 AI 模型列表**（GPT-5.4/5.4 Pro、Gemini 3.1 Pro/3 Flash/3.1 Flash-Lite、Claude 4.6、o3/o4-mini、Kimi K2.5、QwQ-32B）

### v1.2.1 更新内容
- **多平台频道绑定**：Telegram / Discord / Slack / 飞书 / 钉钉 / 企业微信 / QQ

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

