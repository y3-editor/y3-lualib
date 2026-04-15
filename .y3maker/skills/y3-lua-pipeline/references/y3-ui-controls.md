# Y3 官方 UI API - 高级控件

> 来源: `y3/object/scene_object/ui.lua`

## 模型控件

```lua
ui:set_ui_model_id(model_id)                                            -- 设置模型
ui:set_ui_model_unit(unit, clone_effect, clone_attach, clone_material)  -- 单位模型
ui:set_ui_model_focus_pos(x, y, z)                                      -- 观察点
ui:change_showroom_fov(fov)                                             -- 视野
ui:change_showroom_cposition(x, y, z)                                   -- 镜头坐标
ui:change_showroom_crotation(x, y, z)                                   -- 镜头旋转
ui:set_show_room_background_color(r, g, b, a)                           -- 背景色
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
ui:set_effect_camera_mode('自动'|'手动')            -- 镜头模式
```

## 序列帧

```lua
ui:set_sequence_image(image_id)                             -- 设置序列帧图片
ui:play_ui_sequence(loop, space, start_frame, end_frame)    -- 播放
ui:stop_ui_sequence()                                       -- 停止
```

## 网格列表 (GridView)

```lua
ui:insert_ui_gridview_comp(child, index)                    -- 添加子控件
ui:set_ui_gridview_type(layout_type)                        -- 布局方式
ui:set_ui_gridview_count(row, col)                          -- 行列数
ui:set_ui_gridview_size(width, height)                      -- 单元格尺寸
ui:set_ui_gridview_margin(top, bottom, left, right)         -- 边距
ui:set_ui_gridview_space(row_space, col_space)              -- 间距
ui:set_ui_gridview_align(align_type)                        -- 对齐方式
ui:set_ui_gridview_scroll(enable)                           -- 滚动开关
ui:set_ui_gridview_size_adaptive(enable)                    -- 尺寸自适应
ui:set_ui_gridview_bar_percent(direction, ratio)            -- 滚动位置
```

## 列表控件

```lua
ui:set_scrollview_scroll(enable)    -- 允许/禁止滚动
```

## 聊天控件

```lua
ui:enable_chat(enable)                  -- 启用/禁用发送
ui:show_chat(player, enable)            -- 显示/隐藏聊天框
ui:clear_chat()                         -- 清空聊天
ui:send_chat(player, msg)               -- 发送私聊
ui:set_nearby_micro_switch(switch)      -- 聊天频道
```

## 物品操作

```lua
ui:set_equip_slot_use_operation('无'|'左键单击'|'右键单击'|'左键双击')
ui:set_equip_slot_drag_operation('无'|'左键'|'右键')
```
