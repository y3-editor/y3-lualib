---
name: ui-events
description: Y3 UI 事件规范文档
---

# Y3 UI 事件规范

## 推荐：使用 add_fast_event

使用 `ui:add_fast_event(event, callback)` 直接为控件绑定事件，**无需手动判断触发来源**。

```lua
local btn = y3.ui.get_ui(player, "panel.button_start")
btn:add_fast_event('左键-按下', function(trg)
    print("按钮被点击了")
end)
```

## 支持的事件类型

| 事件名 | 说明 |
|--------|------|
| `'左键-按下'` | 鼠标左键按下 |
| `'左键-抬起'` | 鼠标左键抬起 |
| `'左键-按住'` | 鼠标左键持续按住 |
| `'左键-点击'` | 鼠标左键点击（按下+抬起） |
| `'左键-双击'` | 鼠标左键双击 |
| `'右键-按下'` | 鼠标右键按下 |
| `'右键-抬起'` | 鼠标右键抬起 |
| `'右键-按住'` | 鼠标右键按住 |
| `'右键-点击'` | 鼠标右键点击 |
| `'右键-双击'` | 鼠标右键双击 |
| `'鼠标-悬停'` | 鼠标悬停在控件上 |
| `'鼠标-移入'` | 鼠标移入控件 |
| `'鼠标-移出'` | 鼠标移出控件 |

## 本地事件

使用 `ui:add_local_event(event, callback)` 创建仅在本地客户端执行的事件：

```lua
btn:add_local_event('左键-按下', function(local_player)
    -- 仅在本地执行，适用于纯UI反馈（如播放音效）
end)
```

> ⚠️ **警告**：`add_local_event` 的回调在本地执行，注意避免产生不同步问题。
