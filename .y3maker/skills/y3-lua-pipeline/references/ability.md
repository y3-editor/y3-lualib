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
-- type: 技能类型（'隐藏'、'普通'、'命令'、'英雄'）
local abilities = unit:get_abilities_by_type('普通')
for _, ability in pairs(abilities) do
    -- 处理技能
end
```

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

## 移除技能

```lua
-- 方式1：通过类型和技能位移除
-- type: 技能类型（'隐藏'、'普通'、'命令'、'英雄'）
-- slot: 技能位索引
unit:remove_ability(type, slot)

-- 示例：移除第一个普通技能槽位的技能
unit:remove_ability('普通', 0)

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
