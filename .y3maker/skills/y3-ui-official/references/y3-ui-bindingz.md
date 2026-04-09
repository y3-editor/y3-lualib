# Y3 官方 UI API - 绑定与事件

> 来源: `y3/object/scene_object/ui.lua`

## 事件

```lua
ui:add_event(event_type, event_name, data)    -- 创建事件（data 通过 trigger 的 data 字段获取）
ui:add_fast_event(event_type, callback)       -- 快速事件（返回 Trigger）
ui:add_local_event(event_type, callback)      -- 本地事件（不同步，回调参数: local_player）
ui:send_event(event_name)                     -- 触发事件
```

**event_type 可选值**: `'左键-按下'`, `'左键-抬起'`, `'左键-点击'`, `'右键-按下'`, `'右键-抬起'`, `'右键-点击'`, `'鼠标-悬停'`, `'鼠标-移入'`, `'鼠标-移出'`, `'拖拽-开始'`, `'拖拽-进行'`, `'拖拽-结束'`

## 属性绑定

```lua
ui:bind_unit_attr(ui_attr, unit_attr, accuracy)       -- 绑定单位属性
ui:bind_player_prop(ui_attr, player, attr, accuracy)  -- 绑定玩家属性
ui:bind_global_variable(ui_attr, var_name, accuracy)  -- 绑定全局变量
ui:bind_ability_cd(ui_attr, skill)                    -- 绑定技能CD
ui:bind_buff_time(ui_attr, buff)                      -- 绑定Buff剩余时间
ui:unbind(ui_attr)                                    -- 解绑属性
```

**ui_attr 可选值**: `'文本'`, `'进度'`, `'进度最大值'`, `'图片'`

## 控件绑定

```lua
ui:bind_unit(unit)          -- 绑定单位到控件（配合属性绑定使用）
ui:unbind_widget()          -- 解绑控件
```

## 技能/物品绑定

```lua
ui:bind_ability(ability)                        -- 绑定技能（同 set_skill_on_ui_comp）
ui:set_skill_on_ui_comp(skill)                  -- 绑定技能到控件
ui:set_item_on_ui(item)                         -- 绑定物品到控件
ui:set_buff_on_ui(unit)                         -- 绑定Buff显示栏
ui:set_ui_unit_slot(unit, slot_type, index)     -- 绑定单位槽位
```

**slot_type**: `'物品栏'`, `'背包'`, `'技能栏'`
