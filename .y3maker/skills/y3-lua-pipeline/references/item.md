# Item API 规范

物品相关 API 的使用规范。

## 创建物品

```lua
-- 在地面创建物品
-- point: 掉落位置
-- item_key: 物品类型ID（从编辑器获取）
-- player: 所属玩家（可选）
local item = y3.item.create_item(point, item_key, player)
```

---

## 获取物品

### 通过 ID 获取

```lua
local item = y3.item.get_by_id(id)
```

### 通过 Handle 获取

```lua
local item = y3.item.get_by_handle(handle)
```

---

## 物品属性

### 堆叠数

```lua
-- 设置堆叠数
item:set_stack(5)

-- 获取堆叠数
local stack = item:get_stack()
```

### 充能数

```lua
-- 设置充能数
item:set_charge(3)

-- 获取充能数
local charge = item:get_charge()
```

---

## 物品操作

### 掉落物品

```lua
item:drop(point, count)
```

### 获取持有单位

```lua
local owner = item:get_owner()
if owner then
    -- 物品被某单位持有
end
```

### 移除物品

```lua
item:remove()
```

---

## 单位与物品

### 给单位添加物品

```lua
unit:add_item(item_id)
```

### 获取单位的物品列表

```lua
local items = unit:get_all_items():pick()
for _, item in pairs(items) do
    -- 处理物品
end
```

---

## 物品事件

```lua
-- 物品获得（被拾取）
item:event('物品-获得', function(trg, data)
    local picker = data.unit
    log.info("物品被 " .. picker:get_name() .. " 拾取")
end)

-- 物品使用
item:event('物品-使用', function(trg, data)
    log.info("物品被使用")
end)

-- 物品失去
item:event('物品-失去', function(trg, data)
    log.info("物品失去")
end)

-- 物品进入物品栏
item:event('物品-进入物品栏', function(trg, data)
    log.info("物品进入物品栏")
end)
```

---

## 完整示例：掉落宝箱物品

```lua
-- 在单位死亡时掉落物品
unit:event('单位-死亡', function(trg, data)
    local pos = unit:get_point()
    
    -- 掉落金币物品
    local gold_item = y3.item.create_item(pos, 134217858, nil)
    
    if gold_item then
        gold_item:set_stack(10)
        log.info("掉落了10个金币")
    end
end)
```
