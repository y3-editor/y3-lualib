# 代码示例索引

本目录存放 Y3 游戏开发常用代码模式和示例。

---

## 📁 现有示例

| 文件 | 说明 |
|------|------|
| `ui/synergy_panel.md` | 羁绊面板（双 Tab 切换 + 项目列表） |
| `tower_defense.md` | 塔防游戏（建筑点、波次、属性同步） |

---

## 🖼️ UI 交互模式

### 按钮点击事件（标准方式）

```lua
-- ✅ 正确的按钮事件绑定方式
-- 1. 使用 add_event + 事件名字符串
btn:add_event("左键-按下", "my_button_click")

-- 2. 使用 player:event("界面-消息", ...) 监听
local_player:event("界面-消息", "my_button_click", function()
    print("按钮被点击")
end)
```

> ⚠️ 注意：使用 `"左键-按下"` 而非 `"左键-点击"`

### Tab 切换面板

```lua
-- 绑定按钮事件
btn_tab1:add_event("左键-按下", "tab_switch_1")
btn_tab2:add_event("左键-按下", "tab_switch_2")

-- 监听并处理切换
local_player:event("界面-消息", "tab_switch_1", function()
    content_1:set_visible(true)
    content_2:set_visible(false)
end)

local_player:event("界面-消息", "tab_switch_2", function()
    content_1:set_visible(false)
    content_2:set_visible(true)
end)
```

### UI 状态表示（透明度替代颜色）

```lua
-- Y3 Image 组件不支持 set_background_color
-- 使用透明度来表示激活/未激活状态
if is_active then
    indicator:set_alpha(255)  -- 完全不透明 = 激活
else
    indicator:set_alpha(100)  -- 半透明 = 未激活
end
```

---

## � 待补充示例

以下为常用模式，待开发过程中补充完整代码：

| 类别 | 模式 |
|------|------|
| **玩家控制** | WASD 移动、鼠标点击移动 |
| **战斗系统** | 伤害计算、投射物、Buff 管理 |
| **通用系统** | 波次刷怪、经验升级、权重随机 |

---

## ⚠️ 注意事项

- 所有示例已针对 **Y3 坐标系** 进行适配（Y轴反转：Y- = 上，Y+ = 下）
- UI 事件统一使用 `add_event("左键-按下", "事件名")` + `player:event("界面-消息", ...)` 模式
- 物编 ID 需要替换为项目中实际存在的 ID

---

*最后更新: 2026-03-11*