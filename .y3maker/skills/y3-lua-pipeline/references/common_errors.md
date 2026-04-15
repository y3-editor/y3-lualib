# Y3 常见错误汇总

记录 Y3 开发中常见的错误和正确做法，涵盖物编、UI、Lua API、坐标数值等。

---

## 🔴 致命错误（编辑器崩溃/地图打不开）

### 修改物编模板文件
| 错误做法 | 后果 | 正确做法 |
|----------|------|----------|
| 直接修改 `data_template/*.json` | 模板污染，后续生成全部异常 | 只修改输出文件 `editor_table/` |

### 物编 JSON 格式错误
| 错误做法 | 后果 | 正确做法 |
|----------|------|----------|
| 手动编写物编 JSON | `AttributeError: 'str' object has no attribute 'get'` | 使用 `y3-obj-gen` 技能生成 |
| kv 字段存自定义数据 | 编辑器崩溃 | kv 保持空对象 `{}` |

### UI JSON 格式错误
| 错误做法 | 后果 | 正确做法 |
|----------|------|----------|
| 手动编写 UI JSON | `KeyError: 0` | 使用 `y3-ui-generator` 技能 |
| alignment 用非法值 | 编辑器崩溃 | 水平: 1/2/4，垂直: 0/8/16 |

### UI JSON 输出路径错误 🚨
| 错误做法 | 后果 | 正确做法 |
|----------|------|----------|
| 生成到 `maps/.../ui/prefab/` | 地图打不开 | 生成到 `maps/.../ui/` |

### 脚本路径冲突
```
❌ global_script/xxx/ + maps/.../script/xxx/ 同时存在
✅ 删除 global_script 下的重复目录
```

---

## 🟠 Lua 运行时错误

---

## 错误 #1: 玩家遍历方法不存在

**错误代码**:
```lua
y3.player.with_all_players(function(player)
    -- ...
end)
```

**错误信息**: `attempt to call a nil value (field 'with_all_players')`

**原因**: `y3.player` 对象没有 `with_all_players` 方法

**正确做法**:
```lua
local allPlayers = y3.player_group.get_all_players():pick()
for _, player in pairs(allPlayers) do
    -- 处理每个玩家
end
```

**记录日期**: 2026-03-05

---

## 错误 #2: 摄像机跟随方法不存在

**错误代码**:
```lua
player:camera_follow_unit(hero)
```

**错误信息**: `attempt to call a nil value (method 'camera_follow_unit')`

**原因**: `player` 对象没有 `camera_follow_unit` 方法，摄像机相关 API 在 `y3.camera` 模块中

**正确做法**:
```lua
y3.camera.set_camera_follow_unit(player, hero, 0, 0, 0)
-- 参数：玩家对象, 跟随单位, x偏移, y偏移, z偏移
```

**记录日期**: 2025-01-XX

---

## 错误 #3: 获取敌对玩家方法名和模块错误

**错误代码**:
```lua
-- 错误1: 不存在的方法
local enemy = y3.player.get_enemy_player()

-- 错误2: 模块名错误 (player vs player_group)
local enemy_group = y3.player.get_enemy_player_group_by_player(player)
```

**错误信息**: `attempt to call a nil value (field 'get_enemy_player_group_by_player')`

**原因**: 
1. `get_enemy_player()` 方法不存在
2. 该方法属于 `y3.player_group` 模块，而非 `y3.player` 模块

**正确做法**:
```lua
-- 注意是 player_group 不是 player
local enemy_group = y3.player_group.get_enemy_player_group_by_player(player)
local enemy_player = enemy_group and enemy_group:pick()[1]  -- 获取第一个敌对玩家
```

**记录日期**: 2025-03-07

---

## 错误 #4: 单位死亡事件参数名错误

**错误代码**:
```lua
y3.game:event('单位-死亡', function(trg, data)
    local deadUnit = data.dying_unit    -- ❌ 不存在
    local killer = data.killer_unit     -- ❌ 不存在
end)
```

**错误信息**: 参数值为 nil，导致后续逻辑无法执行

**原因**: 事件参数名必须严格匹配 `y3/meta/event.lua` 中对应条目的 `event_params`

**正确做法**:
```lua
y3.game:event('单位-死亡', function(trg, data)
    local deadUnit = data.unit          -- ✅ 死亡的单位
    local killer = data.source_unit     -- ✅ 击杀者
end)
```

**完整参数列表**（参考 `event.md`）:
| 参数名 | 类型 | 描述 |
|--------|------|------|
| `unit` | Unit | 死亡的单位 |
| `source_unit` | Unit | 施加致命伤害的单位 |
| `target_unit` | Unit | 承受伤害的单位（同 unit） |
| `damage` | number | 致命伤害值 |

**记录日期**: 2026-03-08

---

## 错误 #5: 单位攻击方法名错误

**错误代码**:
```lua
monster:attack(target)
```

**错误信息**: `attempt to call a nil value (method 'attack')`

**原因**: Unit 对象没有 `attack` 方法，正确方法是 `attack_target`

**正确做法**:
```lua
-- 参数：目标单位, 范围（0表示直接攻击目标）
monster:attack_target(target, 0)
```

**记录日期**: 2026-03-08

---

## 错误 #6: 中立敌对玩家编号错误

**错误代码**:
```lua
local enemyPlayer = y3.player(2)  -- ❌ 玩家2不一定是敌对方
```

**原因**: 玩家编号与阵营无直接关系，Y3 引擎中立敌对玩家固定为玩家31

**正确做法**:
```lua
-- 中立敌对玩家（用于生成攻击所有玩家的怪物）
local enemyPlayer = y3.player(31)
```

**常用玩家编号**:
| 编号 | 用途 |
|------|------|
| 1-12 | 普通玩家位 |
| 31 | 中立敌对（攻击所有玩家） |
| 32 | 中立友好（不攻击任何人） |

**记录日期**: 2026-03-08

---

## 错误分类索引

| 错误类型 | 相关 API | 解决方案 |
|----------|----------|----------|
| 方法不存在 | `y3.player.with_all_players` | 使用 `y3.player_group.get_all_players():pick()` |
| 方法不存在 | `player:camera_follow_unit` | 使用 `y3.camera.set_camera_follow_unit(player, unit, 0, 0, 0)` |
| 模块名错误 | `y3.player.get_enemy_player_group_by_player` | 使用 `y3.player_group.get_enemy_player_group_by_player(player)` |
| 参数名错误 | `data.dying_unit` / `data.killer_unit` | 使用 `data.unit` / `data.source_unit` |
| 方法不存在 | `unit:attack(target)` | 使用 `unit:attack_target(target, 0)` |
| 编号错误 | `y3.player(2)` 作为敌方 | 使用 `y3.player(31)` 中立敌对 |

---

## 🟡 静默失败（无报错但不生效）

### 事件名称错误
```lua
-- ❌ 臆造事件名（静默失败）
y3.game:event("玩家-进入游戏", callback)

-- ✅ 查阅 y3/meta/event.lua
y3.game:event("玩家-加入游戏", callback)
```

### 键盘常量名错误
| 按键 | ❌ 错误 | ✅ 正确 |
|------|--------|--------|
| 数字 1 | `'1'` | `'KEY_1'` |
| 小键盘 1 | `'1'` | `'NUM_1'` |
| 字母 A | `'a'` | `'A'` |
| 空格 | `' '` | `'SPACE'` |
| 回车 | `'ENTER'` | `'RETURN'` |

```lua
-- 调试：列出所有键盘常量
for k, v in pairs(y3.const.KeyboardKey) do print(k, v) end
```

### UI 按钮事件无响应
```lua
-- ❌ 错误写法
btn:add_event('左键-点击', callback)

-- ✅ 正确写法
btn:add_event("左键-按下", "event_name")
player:event("界面-消息", "event_name", callback)
```

### 回调序列化失败
```lua
-- ❌ add_event 引用局部变量会报错
panel:add_event("左键-点击", on_click)

-- ✅ 使用 add_fast_event
panel:add_fast_event("左键-点击", callback)
```

### 配置数据未同步到引擎
```lua
-- ❌ 假设 Config 会自动应用
local unit = y3.unit.create_unit(player, id, point, 0)

-- ✅ 创建后手动设置属性
unit:set_attr("attack_phy", Config.damage)
unit:set_attr("attack_range", Config.range)
```

---

## 📐 坐标与数值

### Y 轴反转
```
Y3 坐标系：Y- = 北/上，Y+ = 南/下
```

### 角度单位（度 vs 弧度）
```lua
-- ❌ 直接传度数
mover = y3.mover.create_mover_line(point, 45, ...)

-- ✅ 转换为弧度
mover = y3.mover.create_mover_line(point, math.rad(45), ...)
```

---

## 🔧 快速验证命令

```bash
# 验证事件名
grep -r "关键词" y3/meta/event.lua

# 验证 API 存在
grep -rn "function.*方法名" y3/

# 验证物编 ID
ls editor_table/editorunit/ | grep "ID"
```

---

## ✅ 代码审查清单

- [ ] 物编 ID 在 `editor_table/` 中存在
- [ ] 事件名在 `event.lua` 中定义
- [ ] API 参数顺序正确
- [ ] 键盘常量使用 `KEY_1` 格式
- [ ] UI 回调使用 `add_fast_event`
- [ ] 坐标计算考虑 Y 轴反转
- [ ] 角度使用弧度制

---

## 如何添加新错误记录

当发现新的 API 错误时，按以下格式添加：

```markdown
## 错误 #N: [错误简述]

**错误代码**:
\`\`\`lua
-- 导致错误的代码
\`\`\`

**错误信息**: `具体的错误提示信息`

**原因**: 错误产生的原因分析

**正确做法**:
\`\`\`lua
-- 正确的代码示例
\`\`\`

**记录日期**: YYYY-MM-DD
```
