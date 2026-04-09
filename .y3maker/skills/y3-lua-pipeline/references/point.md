# Point & Area API 规范

点和区域相关 API 的使用规范。

## 创建点

### 使用坐标创建

```lua
-- 创建一个3D点
-- x, y: 水平坐标
-- z: 高度（可选，默认为地面高度）
local point = y3.point.create(x, y, z)
```

**示例**：
```lua
local spawn_point = y3.point.create(0, 0, 0)
local high_point = y3.point.create(100, 200, 50)
```

---

## 获取点的坐标

```lua
local x = point:get_x()
local y = point:get_y()
local z = point:get_z()
```

---

## 点的运算

### 计算两点距离

```lua
local distance = point1:get_distance_with(point2)
```

### 计算方向角度

```lua
-- 获取从 point1 指向 point2 的角度（弧度）
local angle = point1:get_angle_with(point2)
```

### 偏移点

```lua
-- 在指定方向上偏移指定距离
local new_point = point:move(dx, dy, dz)
```

---

## 单位位置

### 获取单位位置

```lua
local pos = unit:get_point()
```

### 设置单位位置

```lua
unit:set_point(point)
```

---

## 区域 (Area)

### 创建圆形区域

```lua
local area = y3.area.create_circle_area(center_point, radius)
```

### 创建矩形区域

```lua
local area = y3.area.create_rectangle_area_from_two_points(point1, point2)
```

### 从编辑器获取区域

```lua
-- 通过编辑器中定义的区域ID获取
local area = y3.area.get_by_res_id(res_id, shape)
```

---

## 区域检测

### 检查点是否在区域内

```lua
if area:is_point_in_area(point) then
    -- 点在区域内
end
```

---

## 区域事件

### 单位进入区域

```lua
area:event('单位-进入区域', function(trg, data)
    local unit = data.unit
    log.info("单位进入区域")
end)
```

### 单位离开区域

```lua
area:event('单位-离开区域', function(trg, data)
    local unit = data.unit
    log.info("单位离开区域")
end)
```

---

## 选择器 (Selector)

选择器用于查找满足条件的单位。

### 基本用法

```lua
-- 创建选择器并设置条件
local units = y3.selector.create()
    :in_range(center_point, radius)   -- 范围内（圆形）
    :is_enemy(player)                  -- 敌方单位
    :pick()                            -- 执行选择，返回 Unit[]

-- 遍历结果
for _, unit in pairs(units) do
    -- 处理单位
end
```

**注意**：选择器默认排除死亡单位，如需包含死亡单位请使用 `:include_dead()`

### 常用筛选条件

```lua
y3.selector.create()
    :in_range(point, radius)       -- 点范围内（圆形）
    :in_shape(point, shape)        -- 在指定形状内
    :is_enemy(player)              -- 敌方
    :is_ally(player)               -- 友方
    :of_player(player)             -- 属于指定玩家
    :is_visible(player)            -- 对玩家可见
    :not_visible(player)           -- 对玩家不可见
    :with_tag(tag)                 -- 拥有指定标签
    :without_tag(tag)              -- 不拥有指定标签
    :not_is(unit)                  -- 排除指定单位
    :in_state(state)               -- 拥有指定状态
    :not_in_state(state)           -- 不拥有指定状态
    :is_unit_key(unit_key)         -- 指定单位类型ID
    :is_unit_type(unit_type)       -- 指定单位分类
    :include_dead()                -- 包含死亡单位
    :count(n)                      -- 限制选取数量
    :sort_type('由近到远')          -- 排序方式：'由近到远'|'由远到近'|'随机'
    :pick()                        -- 执行选择，返回 Unit[]
    :get()                         -- 执行选择，返回 UnitGroup
```

---

## 完整示例：创建传送门

```lua
-- 传送门区域
local portal_in = y3.area.create_circle_area(y3.point.create(0, 0, 0), 200)
local portal_out = y3.point.create(1000, 1000, 0)

-- 监听进入传送门
portal_in:event('单位-进入区域', function(trg, data)
    local unit = data.unit
    
    -- 传送到出口
    unit:set_point(portal_out)
    log.info("单位已传送")
end)
```

---

## 完整示例：范围伤害技能

```lua
-- 在目标点造成范围伤害
local function area_damage(caster, target_point, radius, damage)
    -- 获取范围内的敌方单位
    -- 注意：选择器默认排除死亡单位，无需额外调用 is_alive()
    local targets = y3.selector.create()
        :in_range(target_point, radius)
        :is_enemy(caster:get_owner())
        :pick()
    
    -- 对每个目标造成伤害
    for _, target in pairs(targets) do
        target:add_hp(-damage)
        log.info("对 " .. tostring(target) .. " 造成 " .. damage .. " 点伤害")
    end
    
    return #targets  -- 返回命中数量
end

-- 使用示例
local hit_count = area_damage(hero, target_point, 300, 100)
log.info("命中 " .. hit_count .. " 个目标")
```

---

## 完整示例：安全区收缩

```lua
-- 安全区系统
local safe_zone_center = y3.point.create(0, 0, 0)
local safe_zone_radius = 2000

-- 使用自定义表存储玩家英雄
local player_heroes = {}

-- 在创建英雄时存储引用
local function register_hero(player, hero)
    player_heroes[player:get_id()] = hero
    player:select_unit(hero)  -- 选中英雄
end

-- 每秒收缩安全区
y3.ltimer.loop(1.0, function(timer, count)
    safe_zone_radius = safe_zone_radius - 10
    
    if safe_zone_radius <= 100 then
        timer:remove()
        return
    end
    
    -- 检测区域外的玩家
    local allPlayers = y3.player_group.get_all_players():pick()
    for _, player in pairs(allPlayers) do
        local hero = player_heroes[player:get_id()]  -- 从自定义表获取英雄
        if hero and hero:is_alive() then
            local distance = hero:get_point():get_distance_with(safe_zone_center)
            if distance > safe_zone_radius then
                -- 在安全区外，受到伤害
                hero:add_hp(-10)
                log.info(player:get_name() .. " 在安全区外")
            end
        end
    end
end)
```
