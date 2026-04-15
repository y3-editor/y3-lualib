# Y3 Lua API 错题集

记录开发过程中遇到的 API 使用错误，避免重复踩坑。

---

## 1. 玩家存活检测

### ❌ 错误用法
```lua
player:is_playing()
```
**错误**: `attempt to call a nil value (method 'is_playing')`

### ✅ 正确用法
```lua
player:is_alive()
```
**说明**: 判断玩家是否存活（正在游戏中的真实玩家）  
**源码位置**: `y3/object/runtime_object/player.lua:377-381`

---

## 2. 获取 UI 控件

### ❌ 错误用法
```lua
local ui = player:get_ui('PanelName')
```
**错误**: Player 对象没有 `get_ui` 方法

### ✅ 正确用法
```lua
local ui = y3.ui.get_ui(player, 'PanelName')
local child = y3.ui.get_ui(player, 'PanelName.child_path.node_name')
```
**说明**: 使用 `y3.ui.get_ui(player, path)` 全局函数，路径用点分隔  
**源码位置**: `y3/演示/UI/UI演示-技能按钮.lua:5`

---

## 3. 获取子控件

### ✅ 正确用法
```lua
-- 方式1：完整路径
local child = y3.ui.get_ui(player, 'Panel.block.main_frame.button')

-- 方式2：从父控件获取
local panel = y3.ui.get_ui(player, 'Panel')
local child = panel:get_child('child_name')
```
**说明**: `get_child` 只获取直接子节点，嵌套节点需用完整路径

---

## 4. 键盘按键常量

### ❌ 错误用法
```lua
y3.const.KeyboardKey['1']      -- 数字键
y3.const.KeyboardKey['KEY_F5'] -- 功能键
```

### ✅ 正确用法
```lua
y3.const.KeyboardKey['KEY_1']  -- 数字键需要 KEY_ 前缀
y3.const.KeyboardKey['F5']     -- 功能键直接用名称，不加 KEY_
```
**说明**: 数字键加 `KEY_` 前缀，功能键（F1-F12）直接用名称  
**源码位置**: `y3/game/const.lua:277-350`

---

## 5. 获取玩家资源/金币

### ❌ 错误用法
```lua
player:get_res_num("gold")
```
**错误**: `attempt to call a nil value (method 'get_res_num')`

### ✅ 正确用法
```lua
player:get_attr("gold")
```
**说明**: 使用 `get_attr` 获取玩家属性，包括金币等资源  
**源码位置**: `y3/object/runtime_object/player.lua:168`  
**参考代码**: `y3/演示/demo/合成/商店界面.lua:315`

---

## 6. 计算两点距离

### ❌ 错误用法
```lua
point1:get_distance(point2)
```
**错误**: `attempt to call a nil value (method 'get_distance')`

### ✅ 正确用法
```lua
point1:get_distance_with(point2)
```
**说明**: 方法名是 `get_distance_with` 不是 `get_distance`  
**源码位置**: `y3/object/scene_object/point.lua:171-174`

---

## 7. 单位复活

### ❌ 错误用法
```lua
unit:revive(point)
```
**错误**: `attempt to call a nil value (method 'revive')`

### ✅ 正确用法
```lua
unit:reborn(point)
```
**说明**: 方法名是 `reborn` 不是 `revive`  
**源码位置**: `y3/object/editable_object/unit.lua:408-414`

---

## 8. UI 路径必须包含完整层级

### ❌ 错误用法
```lua
y3.ui.get_ui(player, "ResultPanel.block.label_title")
```
**错误**: `UI "ResultPanel.block.label_title" 不存在`

### ✅ 正确用法
```lua
-- 先查看 ui_tree/ResultPanel_Tree.json 确认路径
y3.ui.get_ui(player, "ResultPanel.block.main_frame.label_title")
```
**说明**: UI 路径必须包含所有中间节点，使用 `ui_tree/*.json` 确认正确路径  
**最佳实践**: 每次生成 UI 后运行 `gen_ui_tree.py` 生成节点树

---

## 9. UI 事件绑定

### ❌ 错误用法
```lua
-- 全局绑定方式（参数不足错误）
y3.ui.set_ui_event_callback(path, event, callback)
```
**错误**: `事件的参数不足!`

### ✅ 正确用法
```lua
-- 先获取 UI 对象，再绑定事件
local btn = y3.ui.get_ui(player, "Panel.block.button")
if btn then
    btn:add_fast_event('左键-按下', function(trg)
        -- 处理点击
    end)
end
```
**说明**: 需要先获取 UI 对象，然后调用其 `add_fast_event` 方法  
**源码位置**: `y3/object/scene_object/ui.lua:115-155`

---

## 10. get_abilities_by_type 参数类型

### ❌ 错误用法
```lua
local abilities = hero:get_abilities_by_type('英雄')
```
**错误**: `Python argument types in get_activated_abilities_by_type(core_ability_member, str) did not match C++ signature: get_activated_abilities_by_type(class framecore::AbilityMember {lvalue}, unsigned int)`

### ✅ 正确用法
```lua
local abilities = hero:get_abilities_by_type(y3.const.AbilityType['英雄'])
```
**说明**: `get_abilities_by_type` 和 `remove_ability` 的底层 C++ 接口要求 `unsigned int` 类型参数，不接受字符串。必须通过 `y3.const.AbilityType` 将中文名映射为整数。  
**对比**: `add_ability` / `find_ability` / `remove_ability_by_key` 内部有 `y3.const.AbilityType[type] or type` 的兼容转换，可以传字符串；但 `get_abilities_by_type` 和 `remove_ability` **没有这层转换**，直接传给 C++。  
**同类受影响 API**：
- `get_abilities_by_type(type)` — unit.lua:182（无转换）
- `remove_ability(type, slot)` — unit.lua:251（无转换）
**源码位置**: `y3/object/editable_object/unit.lua`

---

## 11. 获取玩家的所有单位

### ❌ 错误用法
```lua
local units = y3.unit_group.get_all_units_of_player(player):pick()
```
**错误**: `attempt to call a nil value (field 'get_all_units_of_player')`

### ✅ 正确用法
```lua
local units = player:get_all_units()
for _, unit in pairs(units) do
    -- 处理单位
end
```
**说明**: 使用 `player:get_all_units()` 方法获取玩家的所有单位，直接返回单位表，不需要 `:pick()`  
**源码位置**: `y3/object/runtime_object/player.lua:560`

---

## 12. 计时器循环指定次数

### ❌ 错误用法
```lua
y3.timer.loop_count(timeout, times, callback)
```
**错误**: `attempt to call a nil value (field 'loop_count')`

### ✅ 正确用法
```lua
y3.timer.count_loop(timeout, times, callback)
```
**说明**: 方法名是 `count_loop` 不是 `loop_count`，参数顺序相同：(超时时间, 执行次数, 回调)  
**源码位置**: `y3/object/runtime_object/timer.lua:158`

---

*最后更新: 2026-04-14*
