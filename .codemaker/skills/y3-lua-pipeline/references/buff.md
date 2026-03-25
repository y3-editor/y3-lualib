# Buff API 规范

魔法效果（Buff）相关 API 的使用规范。

## 添加 Buff

```lua
-- 给单位添加 Buff
local buff = unit:add_buff({
    key = buff_id,           -- Buff类型ID（从编辑器获取）
    source = caster,         -- 来源单位（可选）
    time = 10.0,             -- 持续时间（秒）
    stacks = 1               -- 初始层数
})
```

---

## 获取 Buff

### 通过单位查找

```lua
local buff = unit:find_buff(buff_id)
```

### 获取单位所有 Buff

```lua
local buffs = unit:get_buffs()
for _, buff in pairs(buffs) do
    -- 处理 Buff
end
```

---

## Buff 层数

### 设置层数

```lua
buff:set_stack(3)
```

### 获取层数

```lua
local stacks = buff:get_stack()
```

### 增加层数

```lua
buff:add_stack(1)
```

---

## Buff 持续时间

### 延长持续时间

```lua
buff:add_time(5.0)  -- 延长5秒
```

### 设置持续时间

```lua
buff:set_time(10.0)  -- 设置为10秒
```

### 获取剩余时间

```lua
local remaining = buff:get_time()
```

---

## 护盾

某些 Buff 可以提供护盾效果：

```lua
-- 设置护盾值
buff:set_shield(100)

-- 获取护盾值
local shield = buff:get_shield()
```

---

## 移除 Buff

```lua
buff:remove()
```

### 移除单位所有 Buff

```lua
-- 移除所有指定id的魔法效果
unit:remove_buffs_by_key(buff_key)

-- 移除所有指定类型的魔法效果
unit:remove_buffs_by_effect_type(effect_type)
```

---

## Buff 事件

```lua
-- Buff 获得（添加）
buff:event('效果-获得', function(trg, data)
    log.info("Buff已添加")
end)

-- Buff 失去（移除）
buff:event('效果-失去', function(trg, data)
    log.info("Buff已移除")
end)

-- Buff 层数变化
buff:event('效果-层数变化', function(trg, data)
    local change = data.layer_change_values  -- 层数变化值
    local owner = data.owner_unit            -- 效果携带者
    log.info("Buff层数变化: " .. change)
end)
```

---

## 完整示例：中毒 Buff

```lua
-- 添加中毒效果
local poison = unit:add_buff({
    key = 134217860,
    source = caster,
    time = 10.0,
    stacks = 1
})

if poison then
    -- 每秒造成伤害
    y3.ltimer.loop(1.0, function(timer, count)
        local stacks = poison:get_stack()
        if stacks == 0 then
            timer:remove()
            return
        end
        
        unit:add_hp(-10 * stacks)  -- 每层每秒10点伤害
        
        log.info("中毒伤害: " .. (10 * stacks))
    end)
end
```

---

## 完整示例：护盾 Buff

```lua
-- 添加护盾
local shield_buff = unit:add_buff({
    key = 134217861,
    source = caster,
    time = 8.0,
    stacks = 1
})

if shield_buff then
    shield_buff:set_shield(200)  -- 200点护盾
    
    -- 监听护盾被破
    shield_buff:event('效果-失去', function(trg, data)
        log.info("护盾已消失")
    end)
end
```
