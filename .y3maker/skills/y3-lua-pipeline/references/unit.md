# Unit API 规范

单位相关 API 的使用规范。

## ⚠️ 重要：单位 ID 获取方法

**判断单位类型时，必须使用 `get_key()` 而不是 `get_type()`！**

### get_key() vs get_type() 区别

| 方法 | 返回类型 | 描述 | 用途 |
|------|----------|------|------|
| `unit:get_key()` | `py.UnitKey` (integer) | **单位的物编 ID**（如 100001, 100002） | ✅ 判断是哪个具体单位类型 |
| `unit:get_type()` | `py.UnitType` (integer) | **单位的种类 ID**（生物、建筑、物品） | 判断单位分类 |

### 正确用法示例

```lua
-- ✅ 正确：判断单位是否为特定物编
local unit_key = unit:get_key()
if unit_key == 100001 then
    log.info("这是弓箭手")
end

-- ✅ 正确：遍历匹配多个物编 ID
local MONSTER_IDS = { 100002, 100003, 100004 }
local unit_key = unit:get_key()
for _, monster_id in ipairs(MONSTER_IDS) do
    if unit_key == monster_id then
        log.info("这是怪物！")
        break
    end
end
```

### 错误用法

```lua
-- ❌ 错误：get_type() 返回的是"种类"，不是物编 ID
local unit_type = unit:get_type()
if unit_type == 100001 then  -- 这永远不会匹配！
    -- ...
end
```

### 源码参考

```lua
-- 来源：y3/object/editable_object/unit.lua

---获取单位的单位种类ID
---@return py.UnitType unit_type 单位种类ID(生物、建筑、物品)
function M:get_type()
    return self.handle:api_get_type() or 0
end

---获取单位类型的ID
---@return py.UnitKey type_id 单位类型的ID
function M:get_key()
    return self.handle:api_get_key() or 0
end
```

---

## 创建单位

```lua
-- 创建单位
-- owner: 所属玩家
-- unit_id: 单位类型ID（从编辑器获取）
-- point: 出生点
-- direction: 朝向（弧度）
local unit = y3.unit.create_unit(owner, unit_id, point, direction)
```

**示例**：
```lua
local spawn_point = y3.point.create(0, 0, 0)
local hero = y3.unit.create_unit(player, 134217857, spawn_point, 0)
```

---

## 获取单位

### 通过 ID 获取

```lua
local unit = y3.unit.get_by_id(id)
```

### 通过 Handle 获取

```lua
local unit = y3.unit.get_by_handle(handle)
```

---

## 单位属性

### 设置属性

```lua
-- 设置基础属性
unit:set_attr('物理攻击', 100)
unit:set_attr('物理防御', 50)
unit:set_attr('移动速度', 300)

-- 常用属性名：
-- '物理攻击', '物理防御', '移动速度', '攻击速度', '暴击率', '暴击伤害'
```

### 获取属性

```lua
local atk = unit:get_attr('物理攻击')
local def = unit:get_attr('物理防御')
```

---

## 生命值

### 获取生命值

```lua
local hp = unit:get_hp()
```

### 修改生命值

```lua
unit:add_hp(50)          -- 增加生命值
unit:set_hp(100)         -- 设置生命值
```

---

## 移动

### 移动到点

```lua
unit:move_to_pos(point)
```

### 停止移动

```lua
unit:stop()
```

### 获取位置

```lua
local pos = unit:get_point()
```

---

## 运动器 (Mover)

运动器用于控制物体运动轨迹，常用于技能效果。

### 通用参数（所有运动器共享，均为可选）

以下参数适用于 `mover_line`、`mover_target`、`mover_curve`、`mover_round`：

| 参数 | 类型 | 必需 | 说明 |
|------|------|:----:|------|
| `on_hit` | `fun(mover, unit)` | 可选 | 碰撞单位回调（特效不支持） |
| `on_block` | `fun(mover)` | 可选 | 碰撞地形回调（特效不支持） |
| `on_finish` | `fun(mover)` | 可选 | 运动结束回调 |
| `on_break` | `fun(mover)` | 可选 | 运动打断回调 |
| `on_remove` | `fun(mover)` | 可选 | 运动移除回调 |
| `hit_type` | integer | 可选 | 碰撞类型：0=敌人，1=盟友，2=全部 |
| `hit_radius` | number | 可选 | 碰撞范围 |
| `hit_same` | boolean | 可选 | 能否重复碰撞同一单位 |
| `hit_interval` | number | 可选 | 碰撞同一个单位的间隔（秒） |
| `terrain_block` | boolean | 可选 | 是否会被地形阻挡 |
| `block_interval` | number | 可选 | 触发地形阻挡事件的间隔（秒） |
| `priority` | integer | 可选 | 优先级 |
| `absolute_height` | boolean | 可选 | 是否使用绝对高度 |
| `face_angle` | boolean | 可选 | 是否始终面向运动方向 |
| `ability` | Ability | 可选 | 关联技能 |
| `unit` | Unit | 可选 | 关联单位 |
| `auto_pitch` | boolean | 可选 | 是否自动调整俯仰角（默认 true） |

### 直线运动 (mover_line)

| 参数 | 类型 | 必需 | 说明 |
|------|------|:----:|------|
| `angle` | number | **必需** | 运动方向（弧度） |
| `distance` | number | **必需** | 运动距离 |
| `speed` | number | **必需** | 初始速度 |
| `acceleration` | number | 可选 | 加速度 |
| `max_speed` | number | 可选 | 最大速度 |
| `min_speed` | number | 可选 | 最小速度 |
| `init_height` | number | 可选 | 初始高度 |
| `fin_height` | number | 可选 | 终点高度 |
| `parabola_height` | number | 可选 | 抛物线顶点高度 |

```lua
unit:mover_line({
    angle = math.rad(45),    -- 运动方向（弧度）
    distance = 500,          -- 运动距离
    speed = 300,             -- 初始速度
    -- 通用参数见上表（on_hit, on_finish, hit_radius 等）
})
```

### 追踪运动 (mover_target)

| 参数 | 类型 | 必需 | 说明 |
|------|------|:----:|------|
| `target` | Unit/Destructible/Item | **必需** | 追踪目标 |
| `speed` | number | **必需** | 初始速度 |
| `target_distance` | number | **必需** | 撞击目标的距离 |
| `acceleration` | number | 可选 | 加速度 |
| `max_speed` | number | 可选 | 最大速度 |
| `min_speed` | number | 可选 | 最小速度 |
| `height` | number | 可选 | 初始高度 |
| `parabola_height` | number | 可选 | 抛物线顶点高度 |
| `bind_point` | string | 可选 | 绑定点 |
| `init_angle` | number | 可选 | 初始角度 |
| `rotate_time` | number | 可选 | 过渡时间 |
| `missing_distance` | number | 可选 | 目标丢失距离 |
| `miss_when_target_destroy` | boolean | 可选 | 目标销毁时丢失目标 |
| `init_max_rotate_angle` | number | 可选 | 初始角速度 |
| `on_miss` | `fun(mover)` | 可选 | 目标丢失回调（**特有**） |

```lua
unit:mover_target({
    target = enemy,          -- 追踪目标
    speed = 400,             -- 初始速度
    target_distance = 50,    -- 撞击距离
    on_miss = function(mover)
        -- 目标丢失回调（mover_target 特有）
    end,
    -- 通用参数见上表
})
```

### 曲线运动 (mover_curve)

| 参数 | 类型 | 必需 | 说明 |
|------|------|:----:|------|
| `angle` | number | **必需** | 运动方向（弧度） |
| `distance` | number | **必需** | 运动距离 |
| `speed` | number | **必需** | 初始速度 |
| `path` | Point[] | **必需** | 路径点数组 |
| `acceleration` | number | 可选 | 加速度 |
| `max_speed` | number | 可选 | 最大速度 |
| `min_speed` | number | 可选 | 最小速度 |
| `init_height` | number | 可选 | 初始高度 |
| `fin_height` | number | 可选 | 终点高度 |

```lua
unit:mover_curve({
    angle = 0,               -- 运动方向（弧度）
    distance = 500,          -- 运动距离
    speed = 300,             -- 初始速度
    path = { p1, p2, p3 },   -- 路径点
    -- 通用参数见上表
})
```

### 环绕运动 (mover_round)

| 参数 | 类型 | 必需 | 说明 |
|------|------|:----:|------|
| `target` | Unit/Point | **必需** | 环绕目标 |
| `radius` | number | 可选 | 环绕半径 |
| `angle_speed` | number | 可选 | 环绕角速度 |
| `init_angle` | number | 可选 | 初始角度 |
| `clock_wise` | boolean | 可选 | 是否顺时针 |
| `round_time` | number | 可选 | 环绕时间 |
| `radius_speed` | number | 可选 | 半径变化速度 |
| `lifting_speed` | number | 可选 | 提升速度 |
| `height` | number | 可选 | 环绕高度 |
| `target_point` | Point | 可选 | 目标点 |

```lua
unit:mover_round({
    target = center_unit,    -- 环绕目标
    radius = 200,            -- 环绕半径
    angle_speed = 90,        -- 环绕角速度
    round_time = 5.0,        -- 环绕时间
    -- 通用参数见上表
})
```

---

## 技能

### 添加技能

```lua
local ability = unit:add_ability(ability_type, ability_id, ability_slot, ability_level)
```

### 查找技能

```lua
local ability = unit:find_ability(ability_type, ability_id)
```

---

## Buff

### 添加 Buff

```lua
local buff = unit:add_buff({
    key = buff_id,
    source = caster,         -- 来源单位（可选）
    time = 10.0,             -- 持续时间
    stacks = 1               -- 层数
})
```

---

## 单位事件

```lua
-- 单位死亡
unit:event('单位-死亡', function(trg, data)
    local source = data.source_unit  -- 击杀者
    log.info("单位死亡")
end)

-- 受到伤害后（最常用）
unit:event('单位-受到伤害后', function(trg, data)
    local damage = data.damage
    local attacker = data.source_unit  -- ✅ 使用完整参数名
end)

-- 造成伤害后（最常用）
unit:event('单位-造成伤害后', function(trg, data)
    local damage = data.damage
    local target = data.target_unit  -- ✅ 使用完整参数名
end)

-- 施放技能
unit:event('单位-施放技能', function(trg, data)
    local caster = data.unit
    local ability = data.ability
    local target = data.ability_target_unit
end)
```

---

## 单位状态

### 检查存活

```lua
if unit:is_alive() then
    -- 单位存活
end
```

### 移除单位

```lua
unit:remove()
```

---

## 完整示例：创建可移动的英雄单位

```lua
-- 创建英雄
local spawn_point = y3.point.create(0, 0, 0)
local hero = y3.unit.create_unit(player, 134217857, spawn_point, 0)

if hero then
    -- 设置属性
    hero:set_attr('物理攻击', 100)
    hero:set_attr('物理防御', 50)
    
    -- 设为选中单位
    player:select_unit(hero)
    
    -- 监听死亡
    hero:event('单位-死亡', function(trg, data)
        log.info("英雄死亡，准备复活...")
        y3.ltimer.wait(5.0, function()
            -- 5秒后复活逻辑
        end)
    end)
end
```
