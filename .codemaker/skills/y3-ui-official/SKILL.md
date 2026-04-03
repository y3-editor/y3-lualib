---
name: y3-ui-official
description: >
  Y3编辑器官方UI API开发指南（y3-ui-pipeline 子技能）。
  用于使用Y3原生API创建和操作UI界面、控件。
  
  ⚠️ 此技能通常由 y3-ui-pipeline 内部调用，不直接触发。
  
  功能：使用 y3.ui 和 GameAPI 编写UI交互代码、事件绑定、显示隐藏、动画等。
  
  触发路径：用户UI需求 → y3-ui-pipeline → 本技能
  
  For non-UI game logic, use y3-lua-pipeline instead.
---

# Y3 Official UI API Guide

Y3编辑器官方UI API开发指南,提供纯官方API的UI开发方案。

## ⚠️ 重要约束

**只能使用Y3引擎官方API**:
- UI操作必须使用 `y3.ui`、`GameAPI` 等Y3框架提供的接口
- **禁止**使用其他游戏引擎的API(如Unity UGUI/NGUI、Cocos、Unreal UMG等)
- **禁止**使用通用Lua GUI库(如LÖVE、IUP等)
- 本skill专注于Y3官方API,不涉及项目自定义基类封装

---

## 📐 坐标系统与分辨率适配

### 坐标系统基础

| 特性 | 说明 |
|------|------|
| 原点位置 | 画布**左下角** |
| 坐标单位 | 支持像素和百分比 |
| 默认锚点 | 控件中心 (0.5, 0.5) |
| 画布高度 | 固定 1080 |

### 分辨率适配原理

**变量定义：**
- 设计分辨率：`(dw, dh)`
- 实际屏幕分辨率（窗口大小）：`(rw, rh)`

**适配公式：**
```
设计分辨率 = (1080/rh * rw, 1080)
```

- 画布高度固定为 1080，即 `dh = 1080`
- 当分辨率改变时，默认缩放系数 `sy = rh/1080`
- 画布宽度随窗口宽高比动态变化：`dw = 1080/rh * rw`

**坐标计算流程：**
1. 设计像素坐标 + 设计分辨率 → 坐标百分比
2. 坐标百分比 + 游戏窗口分辨率 → 实际绝对坐标

### ⚠️ 核心原则

> **总是优先使用百分比坐标。** 百分比坐标能够自动适配不同分辨率，避免因画布宽度动态变化导致的布局问题。

```lua
-- ✅ 推荐：使用百分比坐标居中
GameAPI.set_ui_comp_pos_percent(player.handle, ui.handle, 50, 50)

-- ❌ 不推荐：使用 set_pos + screen_width 计算（会因分辨率变化出错）
local screen_width = y3.ui.get_screen_width()
ui:set_pos(screen_width / 2, 540)
```

### 父子 UI 坐标关系

**重要：** 子控件的坐标是相对于父控件的**左下角**，而非父控件的锚点位置。

`set_pos(x, y)` 设置的是子控件**锚点**相对于父控件**左下角**的位置。

```lua
-- 示例：在父控件内放置一个 100x50 的子控件，使其左下角与父控件左下角对齐
local child = parent:create_child('图片')
child:set_ui_size(100, 50)
-- 锚点在中心，所以 x = 宽度/2, y = 高度/2
child:set_pos(50, 25)

-- 示例：让子控件水平居中于宽度为 200 的父控件底部
local child = parent:create_child('图片')
child:set_ui_size(100, 50)
-- x = 父控件宽度/2 = 100（水平居中）
-- y = 子控件高度/2 = 25（底部对齐）
child:set_pos(100, 25)
```

### 空节点容器技巧

> **当需要使用空节点时，优先考虑使用图片控件并设置为空图片（id:999）。** 这样可以方便后续调试查看控件节点的尺寸。

```lua
-- ✅ 推荐：使用图片控件 + 空图片作为容器
local container = root:create_child('图片')
container:set_image(999)

-- ❌ 不推荐：使用空节点（调试时无法直观看到尺寸）
local container = root:create_child('空节点')
```

---

## 快速参考

### 获取UI对象

```lua
-- 通过路径获取(推荐)
local ui = y3.ui.get_ui(player, "panel_main.button_start")

-- 通过handle获取
local ui = y3.ui.get_by_handle(player, handle)

-- 创建UI控件
local ui = y3.ui.create_ui(player, parent_ui, '图片'|'文本'|'按钮'|'进度条'|'输入框'|'列表'|'空节点')

-- 创建子控件
local child = ui:create_child('图片')
```

### 🔍 UI 节点路径查询

**编写 UI 代码前，必须先确定正确的节点路径。** 按以下优先级查询：

| 优先级 | 方法 | 说明 |
|--------|------|------|
| **1️⃣** | 读取 `ui_tree/*_Tree.json` | 简化树文件（~150行），token消耗极低 |
| **2️⃣** | 读取原始 `maps/EntryMap/ui/*.json` | 完整UI文件（3000+行），作为备选 |

**节点树文件位置：**
```
ui_tree/
├── HeroSelectPanel_Tree.json   # 主面板简化树
├── GameHUD_Tree.json
└── ...
```

**节点树结构示例：**
```json
{
  "name": "HeroSelectPanel",
  "type": 2,
  "children": [
    {
      "name": "block",
      "type": 7,
      "children": [
        {
          "name": "main_frame",
          "type": 7,
          "children": [
            { "name": "hero_1", "type": 7 },
            { "name": "button_select", "type": 1 }
          ]
        }
      ]
    }
  ]
}
```

**从节点树推导 Lua 路径：**
```lua
-- 树结构: HeroSelectPanel → block → main_frame → button_select
-- Lua路径: "HeroSelectPanel.block.main_frame.button_select"

local btn = y3.ui.get_ui(player, "HeroSelectPanel.block.main_frame.button_select")
```

**⚠️ 常见错误：路径缺少中间层级**
```lua
-- ❌ 错误：跳过了 block 层
local btn = y3.ui.get_ui(player, "HeroSelectPanel.main_frame.button_select")

-- ✅ 正确：包含完整路径
local btn = y3.ui.get_ui(player, "HeroSelectPanel.block.main_frame.button_select")
```

> 💡 **提示**：如果 `ui_tree/` 目录下没有对应的 `_Tree.json` 文件，请先执行 `y3-ui-pipeline` 的环节2生成节点树。

### 常用控件类型

- **图片** (`'图片'`) - 显示静态图片、精灵
- **文本** (`'文本'`) - 显示文字标签
- **按钮** (`'按钮'`) - 可点击按钮
- **进度条** (`'进度条'`) - 血条、经验条等
- **输入框** (`'输入框'`) - 文本输入
- **列表** (`'列表'`) - 滚动列表
- **空节点** (`'空节点'`) - 容器/布局节点

## 核心API

### 显示与层级

```lua
ui:set_visible(true)    -- 显示/隐藏
ui:set_alpha(0-100)     -- 透明度
ui:set_z_order(depth)   -- 深度层级
```

### 尺寸与位置

```lua
-- 尺寸
ui:set_ui_size(width, height)

-- 边缘定位
ui:set_relative_parent_pos('顶部'|'底部'|'左侧'|'右侧', offset)

-- 坐标
ui:set_pos(x, y)                                    -- 相对坐标
ui:set_absolute_pos(x, y)                           -- 绝对坐标
ui:set_widget_absolute_coordinates(x, y)            -- 绝对坐标(别名)

-- 锚点
ui:set_anchor(0-1, 0-1)

-- 旋转与缩放
ui:set_widget_relative_rotation(angle)              -- 相对旋转
ui:set_widget_absolute_rotation(angle)              -- 绝对旋转
ui:set_widget_relative_scale(x, y)                  -- 相对缩放
ui:set_widget_absolute_scale(x, y)                  -- 绝对缩放

-- 跟随鼠标
ui:set_follow_mouse(true, offsetX, offsetY)

-- 设置父控件
ui:set_ui_comp_parent(parent_uid, keep_pos, keep_rot, keep_scale)
```

### 百分比定位

```lua
-- 通过 GameAPI 设置百分比位置(居中常用)
GameAPI.set_ui_comp_pos_percent(player.handle, ui.handle, 50, 50)  -- 居中
GameAPI.set_ui_comp_pos_percent(player.handle, ui.handle, 0, 100)  -- 左上角
```

### 图片控件

```lua
ui:set_image(texture_id)                -- 设置图片
ui:set_image_url(url, aid)              -- 网络图片
ui:clear_ui_comp_image()                -- 清空图片
ui:set_image_color(r, g, b, a)          -- 颜色 (0-255)
ui:set_image_color_hex('#FFFFFF', a)    -- 颜色HEX

-- 9宫格
ui:set_slice_type(type)
ui:set_slice_offset(left, top, right, bottom)
```

### 文本控件

```lua
ui:set_text(str)                        -- 设置文本
ui:set_font_size(size)                  -- 字体大小
ui:set_text_color(r, g, b, a)           -- 颜色 (0-255)
ui:set_text_color_hex('#FFFFFF', a)     -- 颜色HEX
ui:set_text_alignment('左'|'中'|'右', '上'|'中'|'下')  -- 对齐
ui:set_text_format('%.2f')              -- 数值格式
```

### 按钮控件

```lua
ui:set_button_enable(true)              -- 启用/禁用
ui:set_button_shortcut(key)             -- 快捷键
ui:set_btn_meta_key(key)                -- 组合键

-- 状态文本和图片
ui:set_btn_status_string('常态'|'悬浮'|'按下'|'禁用', text)
ui:set_btn_status_image('常态'|'悬浮'|'按下'|'禁用', texture)

-- 状态图片类型
ui:set_disable_image_type(img)          -- 禁用图片
ui:set_hover_image_type(img)            -- 悬浮图片
ui:set_press_image_type(img)            -- 按下图片
```

### 进度条与滑动条

```lua
-- 进度条
ui:set_max_progress_bar_value(max)              -- 最大值
ui:set_current_progress_bar_value(value, time)  -- 当前值(time=渐变时间)

-- 滑动条
ui:set_slider_value(0-100)                      -- 滑动条百分比

-- 列表滚动
ui:set_list_view_percent(0-100)                 -- 列表滚动位置
```

### 输入框

```lua
ui:set_input_field_focus()       -- 获取焦点
ui:set_input_field_not_focus()   -- 失去焦点
```

### 交互

```lua
ui:set_is_draggable(true)            -- 可拖动
ui:set_intercepts_operations(true)   -- 拦截操作
ui:set_cursor(player, state, key)    -- 鼠标样式
```

## 事件绑定

### ⚠️ 强制使用 add_fast_event（快速事件）

使用 `ui:add_fast_event(event, callback)` 直接为控件绑定事件，**无需手动判断触发来源**：

```lua
-- ✅ 推荐：快速事件绑定（简洁、直观）
local btn = y3.ui.get_ui(player, "panel.button_start")
btn:add_fast_event('左键-按下', function(trg)
    print("按钮被点击了")
end)

-- ❌ 旧写法：全局事件需要手动判断（冗余、易出错）
-- y3.game:event('UI-按钮-左键-点击', function(trigger, data)
--     if data.ui_comp == my_button then ... end
-- end)
```

### 支持的事件类型

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

### 常用示例

```lua
-- 按钮点击
local btn = panel:get_child("btn_confirm")
btn:add_fast_event('左键-按下', function(trg)
    panel:set_visible(false)
end)

-- 鼠标悬停显示提示
local icon = panel:get_child("item_icon")
icon:add_fast_event('鼠标-移入', function(trg)
    tooltip:set_visible(true)
end)
icon:add_fast_event('鼠标-移出', function(trg)
    tooltip:set_visible(false)
end)
```

### 本地事件（不同步）

使用 `ui:add_local_event(event, callback)` 创建仅在本地客户端执行的事件：

```lua
-- 本地事件：仅触发者的客户端执行，不会同步给其他玩家
btn:add_local_event('左键-按下', function(local_player)
    -- 仅在本地执行，适用于纯UI反馈（如播放音效）
end)
```

> ⚠️ **警告**：`add_local_event` 的回调在本地执行，注意避免产生不同步问题。

## 元件(Prefab)管理

```lua
-- 创建元件实例
local prefab_ui = y3.ui.create_ui_prefab(player, prefab_id, parent_ui)

-- 移除元件
prefab_ui:remove()

-- 获取元件内的子控件
local child = y3.ui.get_ui(player, "prefab_name.child_widget")
```

## 场景UI

场景UI是一种直接放在场景内的类似 billboard 的结构，**始终朝向镜头**，不会默认加载，需要在 Lua 中手动创建。
详细参考: [references/y3-scene-ui.md](references/y3-scene-ui.md)

**两种创建方式的核心区别：**
- **创建到场景点** → 所有玩家可见，可调整子控件但对所有玩家生效，无法按玩家差异化
- **创建到单位挂点** → 仅指定玩家可见，可以自由调整子控件，按玩家独立生效

```lua
-- 创建场景UI到世界坐标点（所有玩家可见，整体不可调整）
local scene_ui = y3.scene_ui.create_scene_ui_at_point('SceneUI_1', point, 10000, 0)

-- 创建场景UI到单位挂点（仅指定玩家可见，可自由调整）
local scene_ui = y3.scene_ui.create_scene_ui_at_player_unit_socket('SceneUI_1', player, unit, 'origin', 100000, true)

-- 获取场景UI中的子控件（需要 player 参数）
local comp = scene_ui:get_ui_comp_in_scene_ui(player, 'layout_1.image_1')

-- 给场景UI控件绑定事件
comp:add_event('左键-点击', '我的点击事件')

-- 设置可见距离
scene_ui:set_scene_ui_visible_distance(player, 5000)

-- 删除场景UI
scene_ui:remove_scene_ui()
```

## 本地UI

本地UI仅在特定玩家客户端显示,常用于个人UI。

```lua
-- 创建本地UI
local local_ui = y3.ui.create_local_ui(player, parent_ui, ui_type)

-- 显示/隐藏本地UI
y3.ui.set_local_ui_visible(player, ui_path, visible)

-- 本地UI仅该玩家可见,其他玩家看不到
```

## 计时器

UI相关的计时器使用Y3官方计时器API:

```lua
-- 本地计时器(Local Timer)
y3.ltimer.loop(interval, function(timer, count)
    -- 每隔 interval 秒执行
end)

y3.ltimer.wait(delay, function(timer, count)
    -- delay 秒后执行一次
end)

y3.ltimer.loop_count(interval, count, function(timer, current_count)
    -- 循环 count 次
end)

-- 帧计时器
y3.ltimer.wait_frame(frame_count, function()
    -- 等待 frame_count 帧后执行
end)

y3.ltimer.loop_frame(1, function(timer, count)
    -- 每帧执行
end)
```

## 动画

### 时间轴动画（推荐）

Y3 编辑器支持通过 UI 时间轴制作关键帧动画，在 Lua 中直接播放。
详细参考: [knowledge/15-UI时间轴动画.md](../../knowledge/15-UI时间轴动画.md)

```lua
-- 播放时间轴动画
y3.ui.play_timeline_animation(player, '动画名称')

-- 2倍速循环播放
y3.ui.play_timeline_animation(player, '动画名称', 2.0, '循环')

-- 播放指定帧范围，保持在最后一帧
y3.ui.play_timeline_animation(player, '动画名称', 1.0, '保持', 0, 26)
```

播放模式：`'保持'` / `'常规'` / `'往复'` / `'循环'`

### 代码动画（计时器模拟）

Y3官方没有内置Tween系统,需要自己实现或使用计时器模拟:

```lua
-- 简单淡入动画示例
local function fade_in(ui, duration)
    local start_time = y3.game.current_game_run_time()
    local timer = y3.ltimer.loop_frame(1, function(t, count)
        local elapsed = y3.game.current_game_run_time() - start_time
        local progress = math.min(elapsed / duration, 1.0)
        
        ui:set_alpha(progress * 100)
        
        if progress >= 1.0 then
            t:remove()
        end
    end)
end

-- 移动动画示例
local function move_to(ui, target_x, target_y, duration)
    local start_x, start_y = ui:get_pos()
    local start_time = y3.game.current_game_run_time()
    
    local timer = y3.ltimer.loop_frame(1, function(t, count)
        local elapsed = y3.game.current_game_run_time() - start_time
        local progress = math.min(elapsed / duration, 1.0)
        
        local current_x = start_x + (target_x - start_x) * progress
        local current_y = start_y + (target_y - start_y) * progress
        
        ui:set_pos(current_x, current_y)
        
        if progress >= 1.0 then
            t:remove()
        end
    end)
end
```

## 常见实践

### 创建简单弹窗

```lua
-- 假设已在编辑器中创建了 panel_dialog
local function show_dialog(player, title, content)
    -- 获取UI元素
    local panel = y3.ui.get_ui(player, "panel_dialog")
    local label_title = panel:get_child("label_title")
    local label_content = panel:get_child("label_content")
    local button_confirm = panel:get_child("button_confirm")
    
    -- 设置内容
    label_title:set_text(title)
    label_content:set_text(content)
    
    -- 绑定关闭按钮（使用 add_fast_event）
    button_confirm:add_fast_event('左键-按下', function(trg)
        panel:set_visible(false)
    end)
    
    -- 显示并居中
    panel:set_visible(true)
    GameAPI.set_ui_comp_pos_percent(player.handle, panel.handle, 50, 50)
end
```

### 动态列表

```lua
-- 创建物品列表
local function create_item_list(player, items)
    local list_container = y3.ui.get_ui(player, "panel_inventory.list_items")
    
    -- 清空现有子控件(需要手动管理)
    -- ...
    
    for i, item_data in ipairs(items) do
        -- 创建列表项元件
        local item_ui = y3.ui.create_ui_prefab(
            player,
            'prefab_item_card',  -- 元件ID
            list_container
        )
        
        -- 获取元件内的子控件并设置
        local icon = y3.ui.get_ui(player, item_ui:get_path() .. ".image_icon")
        local name_label = y3.ui.get_ui(player, item_ui:get_path() .. ".label_name")
        
        icon:set_image(item_data.icon_id)
        name_label:set_text(item_data.name)
        
        -- 设置位置
        item_ui:set_pos(0, (i - 1) * 60)
    end
end
```

### 单位血条(场景UI)

```lua
-- 为单位创建血条（场景UI方式）
-- 注意：创建到单位挂点的场景UI仅指定玩家可见，可自由调整子控件
local function create_unit_hp_bar(player, unit)
    local scene_ui = y3.scene_ui.create_scene_ui_at_player_unit_socket(
        'SceneUI_1',    -- 场景UI名称（在UI编辑器中创建）
        player,         -- 目标玩家（仅该玩家可见）
        unit,           -- 目标单位
        'origin',       -- 挂接点名称
        2000,           -- 可见距离
        true            -- 是否跟随缩放
    )
    
    -- 通过 get_ui_comp_in_scene_ui 获取子控件
    local progress = scene_ui:get_ui_comp_in_scene_ui(player, 'layout_1.progress_hp')
    
    -- 更新血条
    local function update_hp()
        local current_hp = unit:get_hp()
        local max_hp = unit:get_attr('最大生命')
        local percent = (current_hp / max_hp) * 100
        progress:set_current_progress_bar_value(percent, 0)
    end
    
    -- 监听血量变化
    unit:event('单位-血量变化', function()
        update_hp()
    end)
    
    update_hp()
    
    return scene_ui
end
```

## 详细API参考

需要更详细的API说明时,请参考以下文档:

- **UI实例方法(核心)** → [references/y3-ui-instance.md](references/y3-ui-instance.md)
- **静态方法** → [references/y3-ui-static.md](references/y3-ui-static.md)
- **绑定与事件** → [references/y3-ui-bindingz.md](references/y3-ui-bindingz.md)
- **高级控件** → [references/y3-ui-controls.md](references/y3-ui-controls.md)
- **场景UI** → [references/y3-scene-ui.md](references/y3-scene-ui.md)
- **本地UI** → [references/y3-local-ui.md](references/y3-local-ui.md)
- **布局规则** → [references/layout.md](references/layout.md)
- **⚠️ UI事件规范** → [references/ui-events.md](references/ui-events.md) ← **强制阅读**

## ⚠️ 子控件路径查找规范（重要）

`get_child(name)` 方法调用 `GameAPI.get_comp_by_path`，**支持点号分隔的路径格式**：

```lua
-- ❌ 错误：直接查找嵌套在 card_1 中的 btn_select_1，返回 nil
local btn = panel:get_child("btn_select_1")

-- ✅ 正确：使用点号路径格式
local btn = panel:get_child("card_1.btn_select_1")
```

| 调用方式 | 结果 |
|----------|------|
| `panel:get_child("btn")` | 仅查找**直接子控件** |
| `panel:get_child("container.btn")` | 查找**嵌套子控件** |
| `panel:get_child("a.b.c")` | 支持**任意深度** |

**如何确定正确的路径？**（按优先级排列）

1. **🔴 优先读取 `ui_tree/*_Tree.json`** — 简化树文件包含完整的 name/uid/type 层级，token 消耗极低
   - 主面板：读取 `ui_tree/<panel_name>_Tree.json`
   - Prefab 组件：如果树中某节点包含 `"prefab": "<name>"` 字段，则读取 `ui_tree/<name>_Tree.json` 获取 prefab 内部结构
2. 路径中的每一段对应 JSON 中的 `name` 字段
3. **仅当 `_Tree.json` 不存在时**，才回退到读取完整 `ui/*.json` 文件查看 `children` 嵌套结构

> ⚠️ 直接读取完整 UI JSON 通常有数千行，会消耗大量 token，应作为最后手段。

## 🚨 常见问题与解决方案

### 问题 1：控件无法水平居中

**错误做法：**
```lua
local screen_width = y3.ui.get_screen_width()
ui:set_pos(screen_width / 2, 540)  -- ❌ 错误！set_pos 不应该用 screen_width 计算
```

**正确做法：** 使用百分比坐标
```lua
GameAPI.set_ui_comp_pos_percent(player.handle, ui.handle, 50, 50)  -- ✅
```

### 问题 2：全屏背景图片不铺满

**解决方案：** 使用 `set_relative_parent_pos` 四边设为 0
```lua
local bg = root:create_child('图片')
bg:set_relative_parent_pos('顶部', 0)
bg:set_relative_parent_pos('底部', 0)
bg:set_relative_parent_pos('左侧', 0)
bg:set_relative_parent_pos('右侧', 0)
bg:set_image(图片资源ID)
```

### 问题 3：文本控件内容显示不全

**原因：** 文本控件默认宽度可能不够

**解决方案：** 设置足够的控件尺寸，并设置文本对齐方式
```lua
local title = root:create_child('文本')
title:set_text('碰碰车大作战')
title:set_font_size(48)
title:set_ui_size(400, 60)  -- 设置足够宽度
title:set_text_alignment('中', '中')  -- 文本居中对齐
```

### 问题 4：图片控件显示默认图片

**原因：** 创建图片控件后只设置了颜色，没有设置图片资源

**错误做法：**
```lua
local overlay = root:create_child('图片')
overlay:set_image_color(0, 0, 0, 150)  -- ❌ 没有图片资源，会显示默认图片
```

**正确做法：** `set_image_color` 是叠加在图片资源上的，应直接在有图片的控件上设置
```lua
local bg = root:create_child('图片')
bg:set_image(图片资源ID)
bg:set_image_color(180, 180, 180, 255)  -- ✅ 叠加颜色让图片变暗
```

### 问题 5：按钮文字看不清

**原因：** 按钮背景色和文字颜色对比度不够

**解决方案：** 分别设置按钮背景色和文字颜色
```lua
local btn = root:create_child('按钮')
btn:set_image_color(50, 150, 50, 255)  -- 深绿色背景
btn:set_text_color(255, 255, 255, 255)  -- 白色文字
```

---

## 📋 推荐布局模式

### 全屏居中布局（推荐）

适用于菜单、弹窗等需要居中的界面：

```lua
-- 1. 创建全屏容器
local root_panel = canvas:create_child('空节点')
root_panel:set_relative_parent_pos('顶部', 0)
root_panel:set_relative_parent_pos('底部', 0)
root_panel:set_relative_parent_pos('左侧', 0)
root_panel:set_relative_parent_pos('右侧', 0)

-- 2. 全屏背景
local bg = root_panel:create_child('图片')
bg:set_relative_parent_pos('顶部', 0)
bg:set_relative_parent_pos('底部', 0)
bg:set_relative_parent_pos('左侧', 0)
bg:set_relative_parent_pos('右侧', 0)
bg:set_image(背景图片ID)

-- 3. 居中元素使用百分比坐标
local title = root_panel:create_child('文本')
GameAPI.set_ui_comp_pos_percent(player.handle, title.handle, 50, 70)  -- 水平居中，垂直 70%

local btn = root_panel:create_child('按钮')
GameAPI.set_ui_comp_pos_percent(player.handle, btn.handle, 50, 50)  -- 居中
```

### 边缘固定布局

适用于 HUD 等需要固定在屏幕边缘的元素：

```lua
-- 左上角元素
local top_left = root:create_child('文本')
top_left:set_relative_parent_pos('顶部', 30)
top_left:set_relative_parent_pos('左侧', 30)

-- 右上角元素
local top_right = root:create_child('文本')
top_right:set_relative_parent_pos('顶部', 30)
top_right:set_relative_parent_pos('右侧', 30)

-- 左下角元素
local bottom_left = root:create_child('空节点')
bottom_left:set_relative_parent_pos('底部', 30)
bottom_left:set_relative_parent_pos('左侧', 30)

-- 右下角元素
local bottom_right = root:create_child('空节点')
bottom_right:set_relative_parent_pos('底部', 30)
bottom_right:set_relative_parent_pos('右侧', 30)
```

### 相对父控件边缘定位详解

`set_relative_parent_pos(direction, offset)` 用于让控件边缘贴合父控件边缘：

| direction | 含义 |
|-----------|------|
| `'顶部'` | 当前控件**顶边**距离父控件**顶边**的距离 |
| `'底部'` | 当前控件**底边**距离父控件**底边**的距离 |
| `'左侧'` | 当前控件**左边**距离父控件**左边**的距离 |
| `'右侧'` | 当前控件**右边**距离父控件**右边**的距离 |

---

## 最佳实践

1. **使用路径获取UI** - 比handle更稳定:`y3.ui.get_ui(player, "panel.button")`
2. **子控件路径格式** - 嵌套控件使用点号路径:`panel:get_child("card.btn")`
3. **及时清理** - 不用的UI及时`remove()`或`set_visible(false)`
4. **百分比定位** - 使用`GameAPI.set_ui_comp_pos_percent`实现响应式布局
5. **事件去重** - 全局事件需要判断是哪个UI触发,避免误操作
6. **本地计时器** - UI相关逻辑优先使用`y3.ltimer`
7. **场景UI距离** - 合理设置`visible_distance`避免性能问题
8. **优先百分比坐标** - 需要居中时使用百分比，不要用 `screen_width` 计算
9. **空节点容器** - 调试时使用 `图片` + `set_image(999)` 代替空节点
10. **边缘贴合** - 全屏铺满使用 `set_relative_parent_pos` 四边设为 0
