# Y3 官方 UI API - 静态方法

> 来源: `y3/object/scene_object/ui.lua`

## 屏幕尺寸

```lua
y3.ui.get_screen_width()    -- 屏幕宽度（动态）
y3.ui.get_screen_height()   -- 屏幕高度（固定1080）
y3.ui.get_window_width()    -- 窗口宽度
y3.ui.get_window_height()   -- 窗口高度
```

## 系统消息

```lua
y3.ui.display_message(player, msg, time, isSupportLanguage)  -- 系统提示
```

## 时间轴动画

```lua
y3.ui.play_timeline_animation(player, anim, speed, mode, start_frame, end_frame)
-- mode: true/'循环' | '保持' | '常规' | '往复'
```

## 小地图

```lua
y3.ui.change_mini_map_img(player, texture_id)       -- 小地图图片
y3.ui.set_minimap_show_area(player, rect_area)      -- 显示区域
y3.ui.change_minimap_display_mode(player, mode)     -- 显示模式
```

## 默认UI

```lua
y3.ui.set_prefab_ui_visible(player, visible)        -- 默认UI显隐
```

## 悬浮文字

```lua
y3.ui.create_floating_text2(point, text_type, str, jump_type, player_group)
-- text_type: 跳字类型
-- jump_type: 轨迹类型（nil=随机）
-- player_group: 可见玩家组（nil=所有）
```

## 单位路径线

```lua
y3.ui.enable_drawing_unit_path(player, unit)    -- 开启
y3.ui.disable_drawing_unit_path(player, unit)   -- 关闭
```

## 系统设置

```lua
y3.ui.set_window_mode(player, '窗口'|'全屏'|'无边框')
y3.ui.set_graphics_quality(player, quality)
y3.ui.set_screen_resolution(player, x, y)
```

---

## y3.ui.get_ui 使用约束（实战验证）

```lua
---@param player Player
---@param ui_path string  格式："layer名.节点名"
---@return UI
local ui = y3.ui.get_ui(player, 'panel_1.layout_1')
```

### ⚠️ 三条强制规则

| 规则 | 说明 |
|------|------|
| **路径格式** | 必须是 `"layer名.节点名"` — 不接受裸节点 UID，不接受 `layer名/节点名` |
| **调用时机** | `游戏-初始化` 同帧调用会失败（返回 error）；必须延迟至少 1 帧 |
| **Layer vs 节点** | `y3.ui.get_ui(player, 'panel_1')` 可获取 Layer 对象，但 **不能作为 `y3.ui_prefab.create` 的 parent**，必须是 Layer 内的具体节点 |

### 正确的初始化流程（含 1 帧延迟）

```lua
local cached_panel = nil

y3.game:event('游戏-初始化', function()
    y3.player.with_local(function(player)
        -- ⚠️ wait_frame(1, ...) 必须，同帧获取会 error
        y3.ltimer.wait_frame(1, function()
            cached_panel = y3.ui.get_ui(player, 'panel_1.layout_1')
        end)
    end)
end)
```

---

## y3.ui_prefab.create 使用约束（实战验证）

```lua
---@param player Player
---@param prefab_name string  Prefab 名称（不是 UID）
---@param parent_ui UI        Layer 内的节点（不是 Layer 本身）
---@return UIPrefab
local slot = y3.ui_prefab.create(player, 'artifactPickCmp', cached_panel)
```

### UIPrefab:get_child 路径规则

`UIPrefab:get_child(path)` 的路径起点是 prefab 的**根 UI 节点**（对应编辑器节点树的第一层）。
Y3 Prefab 通常有一层隐含的 root，路径需要带 `root.` 前缀：

```lua
-- ⚠️ artifactPickCmp 的正确路径（有隐含 root 层）
local bg   = slot:get_child('root.bg')          -- ✅
local desc = slot:get_child('root.bg.descr_TEXT') -- ✅

-- ❌ 错误写法
local bg   = slot:get_child('bg')               -- ❌ 找不到
```

> 验证方式：查看编辑器节点树或源工程 `*Cmp.lua` 里 `self._ui:get_child("root.xxx")` 的调用方式

---

## 未封装的 GameAPI

> 以下 GameAPI 方法**没有被 y3.ui 封装**，需要直接调用

### 百分比定位（重要）

```lua
-- 按百分比设置控件位置，常用于居中
-- x, y 范围 0-100，50 表示居中
GameAPI.set_ui_comp_pos_percent(player.handle, ui.handle, x, y)

-- 示例：居中显示
GameAPI.set_ui_comp_pos_percent(player.handle, ui.handle, 50, 50)
```
