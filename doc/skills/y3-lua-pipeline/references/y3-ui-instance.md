# Y3 官方 UI API - 实例方法

> 来源: `y3/object/scene_object/ui.lua`

## 获取UI对象

```lua
local ui = y3.ui.get_ui(player, "panel_1.image_1")  -- 路径获取（推荐）
local ui = y3.ui.get_by_handle(player, handle)      -- handle获取
local ui = y3.ui.create_ui(player, parent_ui, '图片'|'文本'|'按钮'|'进度条'|'输入框'|'列表'|'空节点')
local child = ui:create_child('图片')               -- 创建子控件
```

## 显示与透明度

```lua
ui:set_visible(true)    -- 显示/隐藏
ui:set_alpha(0-100)     -- 透明度
ui:set_z_order(depth)   -- 深度层级
```

## 尺寸与定位

```lua
ui:set_ui_size(width, height)                       -- 尺寸
ui:set_relative_parent_pos('顶部'|'底部'|'左侧'|'右侧', offset)  -- 边缘定位
ui:set_widget_absolute_coordinates(x, y)            -- 绝对坐标
ui:set_widget_relative_rotation(angle)              -- 相对旋转
ui:set_widget_absolute_rotation(angle)              -- 绝对旋转
ui:set_widget_relative_scale(x, y)                  -- 相对缩放
ui:set_widget_absolute_scale(x, y)                  -- 绝对缩放
ui:set_pos(x, y)                                    -- 相对坐标（无转换）
ui:set_absolute_pos(x, y)                           -- 绝对坐标
ui:set_anchor(0-1, 0-1)                             -- 锚点
ui:set_follow_mouse(true, offsetX, offsetY)         -- 跟随鼠标
ui:set_ui_comp_parent(parent_uid, keep_pos, keep_rot, keep_scale)  -- 设置父控件
```

## 图片

```lua
ui:set_image(texture_id)                -- 设置图片
ui:set_image_url(url, aid)              -- 网络图片
ui:clear_ui_comp_image()                -- 清空图片
ui:set_image_color(r, g, b, a)          -- 颜色 (0-255)
ui:set_image_color_hex('#FFFFFF', a)    -- 颜色HEX
```

## 文本

```lua
ui:set_text(str)                        -- 设置文本
ui:set_font_size(size)                  -- 字体大小
ui:set_text_color(r, g, b, a)           -- 颜色 (0-255)
ui:set_text_color_hex('#FFFFFF', a)     -- 颜色HEX
ui:set_text_alignment('左'|'中'|'右', '上'|'中'|'下')  -- 对齐
ui:set_text_format('%.2f')              -- 数值格式
```

## 按钮

```lua
ui:set_button_enable(true)              -- 启用/禁用
ui:set_button_shortcut(key)             -- 快捷键
ui:set_btn_meta_key(key)                -- 组合键
ui:set_btn_status_string('常态'|'悬浮'|'按下'|'禁用', text)    -- 状态文本
ui:set_btn_status_image('常态'|'悬浮'|'按下'|'禁用', texture)  -- 状态图片
ui:set_disable_image_type(img)          -- 禁用图片
ui:set_hover_image_type(img)            -- 悬浮图片
ui:set_press_image_type(img)            -- 按下图片
ui:set_skill_btn_smart_cast_key(key)    -- 智能施法键
ui:set_skill_btn_func_meta_key(key)     -- 智能施法组合键
ui:set_skill_btn_action_effect(true)    -- 激活动效
```

## 进度条 (type 41)

⚠️ **必须同时设置三个值**：最大值、当前值、文本子节点

```lua
-- 1. 设置进度条最大值（必须）
ui:set_max_progress_bar_value(max)

-- 2. 设置进度条当前值（必须）
ui:set_current_progress_bar_value(value, time)  -- time=渐变时间，0=立即更新

-- 3. 设置文本子节点显示数值（必须）
local text_node = ui:get_child('TextNodeName')
text_node:set_text(string.format("%d/%d", current, max))
```

### 示例：血条/能量条

```lua
local hp_bar = y3.ui.get_ui(player, "GameHUD.HP_ProgressBar")

local function update_hp_bar(hero)
    if not hero or not hero:is_alive() then return end
    
    local hp = hero:get_hp()
    local hp_max = hero:get_attr('最大生命')
    if not hp_max or hp_max <= 0 then return end
    
    -- 1. 设置进度条最大值（必须）
    hp_bar:set_max_progress_bar_value(hp_max)
    
    -- 2. 设置进度条当前值（必须）
    hp_bar:set_current_progress_bar_value(hp, 0)
    
    -- 3. 设置文本子节点显示数值（必须）
    local hp_text = hp_bar:get_child('HP_Text')
    if hp_text then
        hp_text:set_text(string.format("%d/%d", math.floor(hp), math.floor(hp_max)))
    end
end
```

## 滑动条

```lua
ui:set_slider_value(0-100)                      -- 设置滑动条百分比
ui:get_slider_current_value()                   -- 获取滑动条当前值
ui:set_list_view_percent(0-100)                 -- 列表滚动位置
```

## 输入框

```lua
ui:set_input_field_focus()       -- 获取焦点
ui:set_input_field_not_focus()   -- 失去焦点
```

## 交互

```lua
ui:set_is_draggable(true)            -- 可拖动
ui:set_intercepts_operations(true)   -- 拦截操作
ui:set_cursor(player, state, key)    -- 鼠标样式
```

## 9宫格

```lua
ui:set_ui_9(x_left, x_right, y_top, y_bottom)  -- 设置9宫
ui:set_ui_9_enable(true)                       -- 启用9宫
```

## 动画

```lua
ui:set_anim_opacity(start, end, duration, ease_type)                 -- 透明度动画
ui:set_anim_pos(start_x, start_y, end_x, end_y, duration, ease_type) -- 移动动画
ui:set_anim_scale(start_x, start_y, end_x, end_y, duration, ease_type) -- 缩放动画
ui:set_anim_rotate(start_rot, end_rot, duration, ease_type)          -- 旋转动画
```

## 子控件操作

```lua
local children = ui:get_childs()           -- 获取所有子控件
local child = ui:get_child("a.b.c")        -- 路径获取子控件（支持多级）
local parent = ui:get_parent()             -- 获取父控件
```

### ⚠️ 重要：get_child 路径格式规范

`get_child(name)` 调用 `GameAPI.get_comp_by_path`，**支持点号分隔的路径格式**：

| 调用方式 | 结果 | 说明 |
|----------|------|------|
| `panel:get_child("btn")` | 仅查找**直接子控件** | 如果 btn 嵌套在子容器中会返回 nil |
| `panel:get_child("container.btn")` | 查找**嵌套子控件** | 路径：panel → container → btn |
| `panel:get_child("a.b.c.d")` | 支持**任意深度** | 多级嵌套 |

**常见错误**：
```lua
-- ❌ 错误：直接查找嵌套在 card_1 中的 btn_select_1，返回 nil
local btn = panel:get_child("btn_select_1")

-- ✅ 正确：使用点号路径格式
local btn = panel:get_child("card_1.btn_select_1")

-- ✅ 也可以分步查找
local card = panel:get_child("card_1")
local btn = card:get_child("btn_select_1")
```

**如何知道正确的路径？**
1. 查看 UI JSON 文件（如 `maps/EntryMap/ui/xxx.json`）中的 `children` 嵌套结构
2. 使用 `y3-ui-pipeline` 生成的 `ui-tree.md` 查看层级关系
3. 路径中的每一段对应 JSON 中的 `name` 字段

## 获取属性

```lua
ui:get_name()                   -- 名称
ui:to_string()                  -- 转字符串
ui:get_width()  ui:get_height() -- 宽高
ui:get_real_width()  ui:get_real_height()   -- 真实宽高（异步，不同步）
ui:get_relative_x()  ui:get_relative_y()    -- 相对坐标
ui:get_absolute_x()  ui:get_absolute_y()    -- 绝对坐标
ui:get_relative_rotation()  ui:get_absolute_rotation()  -- 旋转
ui:get_relative_scale_x()  ui:get_relative_scale_y()    -- 相对缩放
ui:get_absolute_scale_x()  ui:get_absolute_scale_y()    -- 绝对缩放
ui:is_visible()                 -- 是否可见
ui:is_real_visible()            -- 真实可见性（检查父级链）
ui:is_removed()                 -- 是否已删除
ui:get_slider_current_value()   -- 滑动条当前值
ui:get_input_field_content()    -- 输入框文本
ui:get_checkbox_selected()      -- 复选框状态
```

## 删除

```lua
ui:remove()      -- 删除控件
ui:is_removed()  -- 是否已删除
```

## 模型控件 (type 6)

```lua
-- 从物编设置单位模型
GameAPI.set_ui_model_id_from_object_editor(role, comp_uid, unit_id)    -- unit_id: 物编单位ID
```

### 示例：显示物编单位模型

```lua
local player = y3.player.get_by_id(1)
local model_comp = y3.ui.get_ui(player, "MyPanel.Panel_Hero.Model_Hero")

-- 使用物编单位ID（player.handle 就是 role）
GameAPI.set_ui_model_id_from_object_editor(player.handle, model_comp.handle, 100001)

-- 设置镜头模式为智能头像（推荐）
GameAPI.set_model_comp_camera_mod(player.handle, model_comp.handle, 2)
```

## 特效控件

```lua
ui:play_ui_effect(effect_id, is_loop)               -- 播放特效
ui:set_effect_background_color(r, g, b, a)          -- 背景色
ui:set_effect_camera_fov(fov)                       -- 镜头视口
ui:set_effect_camera_pos(x, y, z)                   -- 镜头坐标
ui:set_effect_camera_rotation(pitch, roll, yaw)     -- 镜头旋转
ui:set_effect_focus_pos(x, y, z)                    -- 焦点位置
ui:set_effect_play_speed(speed)                     -- 播放速度
ui:set_effect_camera_mode('智能模式'|'自动'|'手动') -- 镜头模式（推荐使用'智能模式'）
```

## 技能按钮 (type 17)

```lua
-- 设置智能施法快捷键（快捷施法，无需点击确认）
ui:set_skill_btn_smart_cast_key(key)                        -- key: y3.Const.KeyboardKey

-- 设置施法快捷键（按键后需点击确认）
ui:set_button_shortcut(key)                                 -- key: y3.Const.KeyboardKey

-- 绑定技能到按钮
GameAPI.set_skill_on_ui_comp(role, ability, comp_uid)       -- ability: 技能对象, comp_uid: 按钮UID

-- 解绑技能
GameAPI.unbind_skill_on_ui_comp(role, ability, comp_uid)    -- 从按钮解绑技能
```

### 示例：技能按钮配置

```lua
local player = y3.player.get_by_id(1)
-- 获取玩家选中的英雄单位
local hero = player:get_selecting_unit()

-- 或者通过其他方式获取英雄单位，例如：
-- local hero = y3.unit.get_by_id(unit_id)

if hero then
    local skill_btn = y3.ui.get_ui(player, "GameHUD.Panel_Skills.Btn_Skill1")
    
    -- 获取英雄技能（技能类型：'英雄', 技能位：1）
    local ability = hero:get_ability_by_slot('英雄', 1)
    
    if ability then
        -- 绑定技能到按钮（player.handle 就是 role）
        GameAPI.set_skill_on_ui_comp(player.handle, ability.handle, skill_btn.handle)
        
        -- 设置智能施法快捷键为 Q（按Q键直接释放）
        skill_btn:set_skill_btn_smart_cast_key(y3.const.KeyboardKey['KEY_Q'])
        
        -- 或设置普通施法快捷键为 Q（按Q后需要点击目标）
        -- skill_btn:set_button_shortcut(y3.const.KeyboardKey['KEY_Q'])
    end
end
```

## 序列帧

```lua
ui:set_sequence_image(image_id)                             -- 设置序列帧图片
ui:play_ui_sequence(loop, space, start_frame, end_frame)    -- 播放
ui:stop_ui_sequence()                                       -- 停止
```

## 网格/列表控件

GridView / ScrollView 的创建、Prefab 命名和示例见 `y3-ui-instance-list.md`。

## 聊天控件

```lua
ui:enable_chat(enable)                  -- 启用/禁用发送
ui:show_chat(player, enable)            -- 显示/隐藏聊天框
ui:clear_chat()                         -- 清空聊天
ui:send_chat(player, msg)               -- 发送私聊
ui:set_nearby_micro_switch(switch)      -- 聊天频道
```

## 物品槽控件 (type 20)

```lua
-- 绑定物品对象到物品槽
ui:set_item_on_ui(item)                                     -- item: 物品对象

-- 绑定单位的物品槽位
ui:set_ui_unit_slot(unit, slot_type, index)                -- slot_type: y3.const.SlotType, index: 槽位索引(从0开始)

-- 设置使用物品操作方式
ui:set_equip_slot_use_operation(operation)                 -- operation: '无'|'左键单击'|'右键单击'|'左键双击'

-- 设置拖拽物品操作方式
ui:set_equip_slot_drag_operation(operation)                -- operation: '无'|'左键'|'右键'
```

### 示例：绑定物品栏和背包栏

```lua
local player = y3.player.get_by_id(1)
local hero = player:get_selecting_unit()

if hero then
    -- 绑定 6 格物品栏（装备位）
    for i = 1, 6 do
        local slot = y3.ui.get_ui(player, 'GameHUD.Panel_Items.Slot_' .. i)
        slot:set_ui_unit_slot(hero, y3.const.SlotType.BAR, i - 1)
        
        -- 设置操作方式（可选）
        slot:set_equip_slot_use_operation('右键单击')
        slot:set_equip_slot_drag_operation('左键')
    end
    
    -- 绑定 6 格背包栏（仓库位）
    for i = 1, 6 do
        local bag_slot = y3.ui.get_ui(player, 'GameHUD.Panel_Bag.Slot_' .. i)
        bag_slot:set_ui_unit_slot(hero, y3.const.SlotType.PKG, i - 1)
    end
end
```

### 示例：手动绑定物品到槽位

```lua
local player = y3.player.get_by_id(1)
local item = y3.item.get_by_id(item_id)
local item_slot = y3.ui.get_ui(player, "GameHUD.Panel_Items.Slot_1")

-- 直接绑定物品对象
item_slot:set_item_on_ui(item)
```

---
