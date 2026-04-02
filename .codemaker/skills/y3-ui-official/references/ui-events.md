---
name: ui-events
description: Y3 UI 事件规范文档
---

# Y3 UI 事件规范

## 🔴 禁止使用旧版 API

**禁止**使用以下旧版全局事件 API：

```lua
-- ❌ 禁止：旧版全局事件 API
y3.game:event('UI-按钮-左键-点击', function(trigger, data)
    if data.ui_comp == my_button then
        -- ...
    end
end)
```

**必须**使用 `add_fast_event` 替代。

---

## 推荐：使用 add_fast_event

使用 `ui:add_fast_event(event, callback)` 直接为控件绑定事件，**无需手动判断触发来源**。

```lua
-- ✅ 正确：使用 add_fast_event
local btn = y3.ui.get_ui(player, "panel.button_start")
btn:add_fast_event('左键-按下', function(trg)
    print("按钮被点击了")
end)
```

---

## 事件类型常量表

事件类型字符串**必须**与下表完全一致（含中文标点）：

| 类别 | 事件名 | 说明 |
|------|--------|------|
| 左键 | `'左键-按下'` | **🔴 推荐用于按钮点击** |
| 左键 | `'左键-抬起'` | 鼠标左键抬起 |
| 左键 | `'左键-按住'` | 鼠标左键持续按住 |
| 左键 | `'左键-点击'` | 鼠标左键点击（按下+抬起） |
| 左键 | `'左键-双击'` | 鼠标左键双击 |
| 右键 | `'右键-按下'` | 鼠标右键按下 |
| 右键 | `'右键-抬起'` | 鼠标右键抬起 |
| 右键 | `'右键-按住'` | 鼠标右键按住 |
| 右键 | `'右键-点击'` | 鼠标右键点击 |
| 右键 | `'右键-双击'` | 鼠标右键双击 |
| 悬停 | `'鼠标-悬停'` | 鼠标悬停在控件上 |
| 悬停 | `'鼠标-移入'` | 鼠标移入控件 |
| 悬停 | `'鼠标-移出'` | 鼠标移出控件 |

> **注意**：事件名称必须完全一致，包括中文标点 `-`。常见错误如 `'点击'`、`'click'`、`'左键点击'` 等变体均无效。

## 本地事件

使用 `ui:add_local_event(event, callback)` 创建仅在本地客户端执行的事件：

```lua
btn:add_local_event('左键-按下', function(local_player)
    -- 仅在本地执行，适用于纯UI反馈（如播放音效）
end)
```

> ⚠️ **警告**：`add_local_event` 的回调在本地执行，注意避免产生不同步问题。
