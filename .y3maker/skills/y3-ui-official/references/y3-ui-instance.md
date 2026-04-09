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

## 进度条与滑动条

```lua
ui:set_max_progress_bar_value(max)              -- 进度条最大值
ui:set_current_progress_bar_value(value, time)  -- 进度条当前值（time=渐变时间）
ui:set_slider_value(0-100)                      -- 滑动条百分比
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
