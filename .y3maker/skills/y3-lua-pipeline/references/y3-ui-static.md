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
