# Ability API 规范

技能相关 API 的使用规范。

## 添加技能

```lua
-- 给单位添加技能
-- type: 技能类型（'隐藏'、'普通'、'命令'、'英雄'）
-- ability_id: 技能物编ID（从编辑器获取）
-- slot: 技能位（可选，默认 -1 表示自动分配）
-- level: 技能等级（可选，默认 1）
local ability = unit:add_ability(type, ability_id, slot, level)

-- 示例：添加一个普通技能
local skill = unit:add_ability('普通', 134217859)

-- 示例：添加一个英雄技能到指定槽位
local hero_skill = unit:add_ability('英雄', 134217860, 0, 1)
```

**技能类型说明：**
| 类型 | 值 | 说明 |
|------|-----|------|
| `'隐藏'` | 0 | 隐藏技能，不显示在技能栏 |
| `'普通'` | 1 | 普通技能 |
| `'命令'` | 2 | 命令技能 |
| `'英雄'` | 3 | 英雄技能 |

---

## 获取技能

### 通过单位查找

```lua
-- type: 技能类型（'隐藏'、'普通'、'命令'、'英雄'）
-- ability_id: 技能物编ID
local ability = unit:find_ability(type, ability_id)

-- 示例：查找单位身上的火球术技能
local fireball = unit:find_ability('普通', 134217859)
```

### 获取单位所有技能

```lua
-- type: 必须使用 y3.const.AbilityType 整数，不能传字符串！
local abilities = unit:get_abilities_by_type(y3.const.AbilityType['普通'])
for _, ability in pairs(abilities) do
    -- 处理技能
end
```

> ⚠️ **注意**：`get_abilities_by_type` 底层直接传给 C++，不会自动将字符串转为整数。
> 必须用 `y3.const.AbilityType['普通']` / `y3.const.AbilityType['英雄']` 等传入。
> （对比：`add_ability`/`find_ability`/`remove_ability_by_key` 内部有字符串→整数兼容转换，可以传字符串）

---

## 技能等级

### 设置等级

```lua
ability:set_level(3)
```

### 获取等级

```lua
local level = ability:get_level()
```

### 升级技能

```lua
ability:add_level(1)
```

---

## 冷却时间

### 设置冷却

```lua
ability:set_cd(5.0)  -- 设置5秒冷却
```

### 获取冷却

```lua
local cd = ability:get_cd()
```

### 完成冷却

```lua
ability:complete_cd()  -- 立即结束冷却
```

---

## 技能属性

### 浮点属性

```lua
-- 设置浮点属性
ability:set_float_attr('伤害', 100)
ability:set_float_attr('范围', 500)

-- 获取浮点属性
local damage = ability:get_float_attr('伤害')
```

### 整数属性

```lua
-- 设置整数属性
ability:set_int_attr('等级需求', 5)

-- 获取整数属性
local req = ability:get_int_attr('等级需求')
```

---

## 技能状态

### 启用/禁用

```lua
ability:enable()   -- 启用技能
ability:disable()  -- 禁用技能
```

### 检查状态

```lua
if not ability.handle:api_get_is_ability_forbidden() then
    -- 技能可用
end

if ability:get_cd() > 0.0 then
    -- 正在冷却中
end
```

---

## 技能事件

**注意**：Y3 中技能施放事件挂在单位上，不是技能对象上

```lua
-- 监听单位施放技能（最常用）
unit:event('单位-施放技能', function(trg, data)
    local caster = data.unit              -- 施法者
    local ability = data.ability          -- 施放的技能对象
    local target = data.ability_target_unit  -- 技能目标单位（可能为 nil）
    log.info("单位施放技能")
end)

-- 技能获得
ability:event('技能-获得', function(trg, data)
    log.info("获得技能")
end)

-- 技能失去
ability:event('技能-失去', function(trg, data)
    log.info("失去技能")
end)

-- 技能冷却结束
ability:event('技能-冷却结束', function(trg, data)
    log.info("技能冷却结束")
end)

-- 技能升级
ability:event('技能-升级', function(trg, data)
    log.info("技能升级")
end)
```

---

## 程序化施法（脚本 / 自动测试）能做什么、不能做什么

用脚本给单位施法（`unit:cast(技能, 目标)`）是验证技能效果最快的手段，但它**不是所有技能都能放出去**。
实测边界：

| 技能指示器 | `sight_type` | 脚本 `cast(技能, 点/单位)` | 判据 |
|-----------|--------------|---------------------------|------|
| 无指示器（自身/立即） | `0` | ✅ 放得出去 | 效果可见（掉血 / 上 buff） |
| 箭头（返回角度） | `2` | 未测 | — |
| **圆形指示器（取点）** | `3` | ❌ **放不出去** | `cast()` 返回成功、无报错，但 **CD 与蓝量都不消耗**、触发器不触发 |
| 目标指示器（单位/物品） | `4` | ✅ 放得出去 | 效果可见 |

```lua
-- 读技能的真实配置，别靠猜
local ab = hero:get_ability_by_slot(3, 1)
ab:get_skill_pointer()   -- 指示器类型（= sight_type，3 就是"圆形指示器/取点"）
ab:get_cd()              -- 剩余冷却（秒）；放出去才会变成 CD
ab:get_range()           -- 施法距离（**厘米**，800 = 8 米）
```

> **结论**：`sight_type == 3` 的取点技能（例：暴风雪、箭雨）**只能人工在游戏里手点验证**。
> 脚本里反复试是浪费时间 —— 它会一直"成功但没有效果"，很容易被误判成「触发器坏了」。

### 施法类验证的三个必做前置

1. **先看 `unit:is_alive()`**：单位已死时 `cast()` 同样返回成功但什么都不发生。
   注意 `unit:set_hp(n)` **只写血量、不会复活**（`is_alive()` 仍为 false）→ 死了就是死了，
   之后所有施法测试结论全部作废。
2. **判据用"持久且不会撞车"的现象**：往一个游戏逻辑**从不写**的全局变量写魔数（如 `1234567`），
   或直接比对单位血量 / buff 数量。**不要用 CD、蓝量当判据** —— 它们会自然恢复，读晚一步
   就什么也证明不了（一次 MCP 往返约 1 秒，很容易读到已经恢复的值）。
3. **带上对照组**：同一局里放一个已知可用的技能（自身范围类最稳），用它的效果证明
   「这一轮施法链路是通的」，否则分不清「探针没生效」和「这次根本没放出去」。

---

## 移除技能

```lua
-- 方式1：通过类型和技能位移除
-- ⚠️ remove_ability 底层无字符串转换，必须用 y3.const.AbilityType！
unit:remove_ability(y3.const.AbilityType['普通'], slot)

-- 示例：移除第一个普通技能槽位的技能
unit:remove_ability(y3.const.AbilityType['普通'], 0)

-- 方式2：通过类型和物编ID移除（可移除所有同ID技能）
unit:remove_ability_by_key(type, ability_key)

-- 示例：移除所有火球术技能
unit:remove_ability_by_key('普通', 134217859)
```

---

## 完整示例：创建一个带冷却的技能

```lua
-- 给英雄添加技能（类型为 '英雄' 或 '普通'）
local fireball = hero:add_ability('普通', 134217859)

if fireball then
    -- 设置技能属性
    fireball:set_level(1)
    fireball:set_float_attr('伤害', 100)
    fireball:set_cd(3.0)  -- 3秒冷却
    
    -- 监听英雄施放技能（挂在单位上）
    hero:event('单位-施放技能', function(trg, data)
        -- 检查是否是火球术
        if data.ability == fireball then
            local target = data.ability_target_unit
            if target then
                -- 对目标造成伤害
                target:add_hp(-100)
                log.info("火球命中目标！")
            end
        end
    end)
end
```
