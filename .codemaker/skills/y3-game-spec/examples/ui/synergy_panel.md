# 羁绊面板（Synergy Panel）开发记录

本文档记录了羁绊面板的完整实现过程，包含 UI 生成、Lua 绑定、Tab 切换等关键技术点。

---

## 📋 功能概述

羁绊面板用于展示玩家当前拥有的羁绊进度和激活状态：
- 6 个羁绊槽位（`synergy_slot_0` ~ `synergy_slot_5`）
- 每个槽位包含：指示器、名称、进度、描述
- Tab 切换：强化/羁绊两个内容区域

---

## 🏗️ UI 结构

```
roguelike_info_panel (面板)
└── bg_panel (背景)
    ├── btn_tab_upgrades (强化Tab按钮)
    ├── btn_tab_synergy (羁绊Tab按钮)
    ├── content_upgrades (强化内容区域)
    │   └── label_upgrades_empty
    └── content_synergy (羁绊内容区域)
        ├── label_synergy_empty
        ├── synergy_slot_0
        │   ├── synergy_0_indicator (状态指示器)
        │   ├── synergy_0_name (名称)
        │   ├── synergy_0_progress (进度如 2/3)
        │   └── synergy_0_desc (描述)
        ├── synergy_slot_1
        │   └── ...
        └── ... (共6个槽位)
```

---

## 🔧 关键实现

### 1. Tab 切换事件绑定

```lua
-- ✅ 正确方式：使用事件名 + 界面消息监听
btn_upgrades:add_event("左键-按下", "tab_switch_upgrades")
btn_synergy:add_event("左键-按下", "tab_switch_synergy")

local_player:event("界面-消息", "tab_switch_upgrades", function()
    content_upgrades:set_visible(true)
    content_synergy:set_visible(false)
end)

local_player:event("界面-消息", "tab_switch_synergy", function()
    content_upgrades:set_visible(false)
    content_synergy:set_visible(true)
end)
```

### 2. 羁绊槽位更新逻辑

```lua
function M.update_display()
    if not content_synergy then return end
    
    -- 收集有进度的羁绊
    local visible_synergies = {}
    for i, synergy in ipairs(shop_config.SYNERGIES) do
        local state = synergy_states[synergy.id]
        if state.progress > 0 or state.is_active then
            table.insert(visible_synergies, {
                synergy = synergy,
                state = state
            })
        end
    end
    
    -- 更新槽位
    for i = 0, 5 do
        local slot = content_synergy:get_child("synergy_slot_" .. i)
        local data = visible_synergies[i + 1]
        
        if data then
            slot:set_visible(true)
            
            -- 更新指示器（使用透明度表示状态）
            local indicator = slot:get_child("synergy_" .. i .. "_indicator")
            if indicator then
                indicator:set_alpha(data.state.is_active and 255 or 100)
            end
            
            -- 更新名称
            local name_label = slot:get_child("synergy_" .. i .. "_name")
            if name_label then
                local prefix = data.state.is_active and "✓ " or ""
                name_label:set_text(prefix .. data.synergy.name)
            end
            
            -- 更新进度
            local progress_label = slot:get_child("synergy_" .. i .. "_progress")
            if progress_label then
                progress_label:set_text(string.format("%d/%d", 
                    data.state.progress, data.synergy.required_count))
            end
            
            -- 更新描述
            local desc_label = slot:get_child("synergy_" .. i .. "_desc")
            if desc_label then
                desc_label:set_text(data.synergy.desc)
            end
        else
            slot:set_visible(false)
        end
    end
end
```

---

## ⚠️ 踩坑记录

### 1. 按钮点击无反应

**错误写法**：
```lua
btn:add_event('左键-点击', function() ... end)
```

**正确写法**：
```lua
btn:add_event("左键-按下", "event_name")
player:event("界面-消息", "event_name", callback)
```

### 2. 图片组件无法设置颜色

**错误**：
```lua
indicator:set_background_color("#FF0000")  -- 方法不存在
```

**正确**：
```lua
indicator:set_alpha(255)  -- 使用透明度表示状态
```

### 3. UI 槽位生成

使用 Python 脚本批量生成 UI JSON，确保：
- 每个组件有唯一的 UUID
- 使用正确的 alignment 枚举值（水平: 1=左/2=中/4=右，垂直: 0=上/8=中/16=下）
- 槽位默认 `visible: false`

---

## 📁 相关文件

| 文件 | 说明 |
|------|------|
| `maps/EntryMap/ui/roguelike_info_panel.json` | UI 布局定义 |
| `maps/EntryMap/script/roguelike/synergy_ui.lua` | 羁绊显示逻辑 |
| `maps/EntryMap/script/roguelike/hud_ui.lua` | Tab 切换逻辑 |
| `maps/EntryMap/script/roguelike/shop_config.lua` | 羁绊配置 |

---

*创建日期: 2026-03-11*
