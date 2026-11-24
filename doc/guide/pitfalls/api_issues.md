> 本文档自动同步自 [y3-maker-config](https://github.com/y3-editor/y3-maker-config/blob/main/memory/lua-issues/api_issues.md)，请勿直接编辑本文件；如需修改请向源仓库提交 PR。

# Y3 Lua API 错题集

记录开发过程中遇到的 API 使用错误，避免重复踩坑。

---

## UI 相关

### [2026-06-04] resurgence 圆形进度条默认显示随机数字

| 项 | 说明 |
|---|---|
| **现象** | 底部控制台英雄头像中间显示 "9.6"，位置不明 |
| **根因** | `avatar.main.mask.resurgence [type_42]` 是复活倒计时圆形进度条，内部 `progress_percent_label` TextLabel 自动显示进度百分比，默认值非零 |
| **解决** | `init_ui` 时获取该节点并 `set_visible(false)`，仅死亡时再显示 |

### [2026-06-04] bind_ability 不会自动赋值技能图标

| 项 | 说明 |
|---|---|
| **错误认知** | `slot:bind_ability(ability)` 会自动把技能图标设置到 slot 内的 `icon` 节点 |
| **实际行为** | `bind_ability` 只绑定 CD 进度 / 技能层数 / 禁用状态，**不赋值图标** |
| **正确做法** | 需手动获取图标并设置：`slot:get_child('icon'):set_image(ability:get_icon())` |
| **完整写法** | `local ok, id = pcall(function() return ability:get_icon() end); if ok and id ~= 0 then icon_node:set_image(id) end` |



| 项 | 说明 |
|---|---|
| **旧（错误）做法** | `slot:bind_unit(unit)` — 引擎以"就绪度"驱动 cd_prog（CD完成=100，冷却趋向0，遮罩方向反） |
| **正确做法** | 不调用 `bind_unit`；定时器手动 `cd_prog:set_current_progress_bar_value(cd_rem/cd_max*100)` |
| **相关API** | `ab:get_cd()` 剩余CD，`ab:get_max_cd()` 最大CD，`cd_prog:set_current_progress_bar_value(n)` |



| 项 | 说明 |
|---|---|
| **场景** | 技能数量不固定，用 GridView + prefab 动态创建 |
| **正确用法** | `local ins = y3.ui_prefab.create(player, 'prefab名', bond_grid_node)` |
| **获取子节点** | `ins:get_child('slot')` — 注意 prefab 内部路径相对于根节点一层之后 |
| **bind_ability** | `slot:bind_ability(ability)` 绑定技能到 type_17 官方控件 |
| **注意** | prefab 必须热更保存后重启游戏才能在 `y3.ui.comp_id` 中注册；否则 `KeyError: 'prefab名'` |



| 项 | 说明 |
|---|---|
| **正确用法** | `slot:bind_ability(ability)` — type_17 控件直接绑定 Ability 对象，自动显示图标/CD/层数 |
| **技能获取** | `unit:get_ability_by_slot('英雄', index)` 优先；无英雄技能时 fallback `'普通'` |
| **title_TEXT** | 技能槽的 `title_TEXT` 子节点默认硬编码文字，需手动 `ability:get_name()` 更新 |



| 项 | 说明 |
|---|---|
| **错误做法** | 延迟 1 帧读 `mask:get_width()` 存为满血宽度 |
| **错误现象** | 满血时进度条只显示约 9%（mask 已被第一次 set_ui_size 缩小） |
| **正确做法** | 用**父容器** `heroHP_BAR:get_width()` 作为满血基准宽度，mask 是动态缩放节点不能作基准 |
| **验证** | `bar_w=461 mask_w=461(满)` → 扣血后 `mask_w=461×ratio` ✅ |

### [2026-06-04] Y3 单位属性名称（UnitAttr 枚举）

| ❌ 错误 | ✅ 正确（见 y3/game/const.lua UnitAttr 表） |
|---------|------|
| `'攻击'` | `'物理攻击'` |
| `'力量'` / `'敏捷'` / `'智力'` | 这三个属性 Y3 不存在，用 `'物理防御'`/`'法术攻击'`/`'法术防御'` 替代 |
| `'护甲'` | `'物理防御'` |



| 项 | 说明 |
|---|---|
| **错误用法** | `y3.ui.get_ui(player_id, path)` 传 integer |
| **正确用法** | `y3.ui.get_ui(y3.player(player_id), path)` 传 Player 对象 |
| **错误现象** | `attempt to index a number value (local 'player')` |
| **来源** | `y3/object/scene_object/ui.lua:105` — `player.handle` |

### y3.ui.get_ui 路径格式

| 项 | 说明 |
|---|---|
| **错误用法** | `y3.ui.get_ui(player, 'uuid-xxxx')` 直接传节点 UID |
| **正确用法** | `y3.ui.get_ui(player, 'layer名.节点名')` |
| **原因** | `GameAPI.get_comp_by_absolute_path` 需要 `layer名.节点名` 格式的绝对路径，不接受裸 UID |
| **补充** | Layer 名本身可以获取，但拿到的是 Layer 对象不是节点，不能作为 `y3.ui_prefab.create` 的 parent |
| **来源** | `y3/object/scene_object/ui.lua:104` |

### y3.ui.get_ui 调用时机

| 项 | 说明 |
|---|---|
| **错误用法** | 在 `游戏-初始化` 事件回调里同帧调用 `y3.ui.get_ui` |
| **正确用法** | `y3.ltimer.wait_frame(1, function() ... y3.ui.get_ui(...) end)` |
| **原因** | UI 节点在 `游戏-初始化` 触发时可能尚未完全注册到路径查找系统 |

### y3.ui_prefab get_child 路径起点

| 项 | 说明 |
|---|---|
| **错误用法** | `slot:get_child('bg')` 或 `slot:get_child('bg.descr_TEXT')` |
| **正确用法** | `slot:get_child('root.bg')` 或 `slot:get_child('root.bg.descr_TEXT')` |
| **原因** | `UIPrefab:get_child(path)` 先获取 prefab 根 UI 节点，再从该节点用 `path` 查找；若元件内有一层隐含 `root` 容器节点，路径需带 `root.` 前缀 |
| **示例** | `self._bg = self._ui:get_child("root.bg")` |

## 键盘事件相关

### y3.config.sync.key 设置位置

| 项 | 说明 |
|---|---|
| **错误用法** | 在 `maps/EntryMap/script/main.lua` 的 `游戏-初始化` 回调里设置 `y3.config.sync.key = true` |
| **正确用法** | 在 `global_script/global_main.lua` 的 `游戏-初始化` 回调里设置 |
| **原因** | global_main.lua 优先于地图 main.lua 执行，键盘同步必须在全局初始化时开启 |

### KeyboardKey 常量格式

| 键类型 | 错误 | 正确 | 说明 |
|--------|------|------|------|
| 字母键 | `'KEY_F'` | `'F'`（单字母大写） | 字母键直接用大写字母 |
| 数字键 | `'1'` | `'KEY_1'` | 数字键需 KEY_ 前缀 |
| 功能键 | `'KEY_F9'` | `'F9'` | 功能键直接用 F+数字 |
| 特殊键 | — | `'SPACE'` `'ENTER'` `'HOME'` | 直接用名字 |

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

## [2026-04-20] 点/单位移动 API 名误用

**现象**：执行案预检阶段使用了 `y3.point.create_point(x,y,z)` 和 `unit:move_to(point)`，运行/审阅时发现 API 不存在。

**根因**：未在 `y3/` 源码中 grep 验证，凭"看起来合理"的命名直接写入。

**正解**：
- 创建点：`y3.point.create(x, y, z)`  — `y3/object/scene_object/point.lua`
- 单位移动：`unit:move_to_pos(point, range)`  — `y3/object/editable_object/unit.lua`（`range` 为停止半径，常用 50~100）

**预防**：编写 y3 API 调用前必须 `grep_search` 在 `maps/EntryMap/script/y3/` 中确认函数签名。

---

## [2026-04-20] 玩家资源 API 不存在

**现象**：尝试用 `player:get_res_num(...)` 读取金币，源码中无此方法。

**正解**（任选其一）：
- 引擎属性：`player:get_attr("gold")` / `player:set_attr("gold", v)`
- 自定义状态表：在 Lua 模块（如 `td_state`）中维护 `state.gold` 字段，由 Lua 完全管控读写

**选用建议**：纯 Lua 玩法（塔防/肉鸽）推荐自定义表，便于跨模块访问与测试 mock。

---

---

## [2026-04-20] `unit:is_removed()` 不存在

**现象**：检查单位是否已被移除时调用 `unit:is_removed()`，运行时报 nil。

**正解**：使用 `unit:is_exist()`（取反判断）或 `unit:is_destroyed()`。
- `is_exist()` — `y3/object/editable_object/unit.lua:116`
- `is_destroyed()` — `y3/object/editable_object/unit.lua:2111`

**典型 bug 代码**：`if unit:is_removed() then return end` → 改为 `if not unit:is_exist() then return end`

---

## [2026-04-20] 键盘抬起事件名是「抬起」不是「弹起」

**现象**：`y3.game:event('键盘-弹起', key, cb)` 触发 `param-type-mismatch` 警告，事件不会响应。

**正解**：事件名为 `'键盘-抬起'`。同样 `'本地-键盘-抬起'`。
**源码**：`y3/meta/event.lua:6945-6951`

---

## [2026-04-20] Unit 没有 add_attribute / set_attribute（那是 Item 的）

**现象**：照执行案预检写 `unit:add_attribute('atk', 20)`，运行时 nil。

**正解**：单位增减属性使用 `unit:add_attr(attr_name, value, attr_type)` / `unit:set_attr(...)`，
其中 `attr_type` 为 `'基础'|'加成'|'升级'|...` 等中文名（自动通过 `y3.const.UnitAttrType` 映射）。
- 攻击力的属性名为 `'atk_base'`（基础攻击）
- `unit:add_attr('atk_base', 20, '基础')`

**源码**：`y3/object/editable_object/unit.lua:698 / 724`

**易混淆**：`Item:add_attribute` 是另一回事，仅用于物品。

---

## [2026-04-20] State 模块自定义回调字段需用 `---@field` 声明

**现象**：在状态模块上挂自定义回调（如 `State.on_gold_changed = ...`）触发 `undefined-field` 警告。

**正解**：在模块的 `---@class` 注解上补 `---@field on_xxx? fun(...)` 声明可选字段，可消除警告。

**示例**：
```lua
---@class TD.State
---@field on_gold_changed? fun(gold: integer)
local M = {}
```

---

*最后更新: 2026-04-20*
