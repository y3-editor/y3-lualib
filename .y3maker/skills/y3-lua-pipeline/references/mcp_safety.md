# Y3 MCP 操作安全规则

记录 MCP 工具调用的安全规则和熔断机制。

---

## 🔴 致命错误

| 错误 | 后果 | 正确做法 |
|------|------|----------|
| MCP 超时后重试 | 请求积压，编辑器卡死 | **绝不重试！立即熔断** |
| 连续快速调用 MCP | 编辑器无响应 | 每两个调用之间至少等待 **2 秒** |
| 每个循环都调用 `hotfix_ui_editor` | 资源浪费 | 仅在流程开始时调用一次 |
| 热更后立即保存 | 内容可能丢失 | **热更后等待 3 秒再保存** |

---

## 熔断原则

```
任何 MCP 工具调用超时/报错
    ↓
立即设置 mcp_broken=true
    ↓
当前及后续所有操作跳过 MCP
    ↓
进入降级模式
```

---

## 预检机制

```python
# 先用 save_editor 做探针确认 MCP 可用
try:
    use_mcp_tool("y3editor", "save_editor", {})
except:
    mcp_broken = True
```

---

## 调用间隔

```python
import time

# 每两个 MCP 调用之间
use_mcp_tool(...)
time.sleep(2)  # 必须等待
use_mcp_tool(...)
```

---

## 热更保存流程

```python
# ✅ 正确流程
hotfix_ui_editor()
time.sleep(3)  # 等待热更完成
save_editor()

# ❌ 错误流程
hotfix_ui_editor()
save_editor()  # 内容丢失！
```
