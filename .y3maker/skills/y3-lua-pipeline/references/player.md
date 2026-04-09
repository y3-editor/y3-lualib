# Player API 规范

玩家相关 API 的使用规范。

## 玩家遍历

遍历所有玩家时，使用 `y3.player_group.get_all_players():pick()` 获取玩家列表：

```lua
-- 获取所有玩家并遍历
local allPlayers = y3.player_group.get_all_players():pick()
for _, player in pairs(allPlayers) do
    -- 处理每个玩家
    log.info("玩家: " .. tostring(player:get_name()))
end
```

---

## 获取玩家

### 通过 ID 获取

```lua
-- 通过玩家 ID 获取玩家对象
local player = y3.player.get_by_id(player_id)
```

### 获取本地玩家

```lua
-- 获取本地玩家（仅客户端逻辑中使用）
-- 必须使用 with_local 回调方式，避免同步问题
y3.player.with_local(function(local_player)
    -- 在此回调中使用 local_player
    -- 注意：不要在此修改全局变量或调用同步函数
    log.info("本地玩家: " .. local_player:get_name())
end)
```

> ⚠️ **警告**：`with_local` 仅用于纯客户端逻辑（如 UI 显示）。
> 在回调中修改上值、全局变量或调用同步函数可能导致不同步问题！

---

## 选中单位

### 选中单位

```lua
-- 选中玩家的主控单位（英雄），会自动跟随和高亮显示
player:select_unit(unit)
```

> ```lua
> local player_heroes = {}  -- 自定义存储
> player_heroes[player:get_id()] = hero  -- 存储引用
> player:select_unit(hero)  -- 选中英雄
> ```

---

## 玩家属性

### 获取玩家名称

```lua
local name = player:get_name()
```

### 获取玩家 ID

```lua
local id = player:get_id()
```

### 获取玩家所属阵营

```lua
local camp = player:get_camp()
```

---

## 资源相关

### 设置资源

```lua
player:set('金币', 1000)
```

### 获取资源

```lua
local gold = player:get('金币')
```

### 增加资源

```lua
player:add('金币', 100)
```

---

## 玩家组

### 获取所有玩家组

```lua
local all_players = y3.player_group.get_all_players()
```

### 遍历玩家组

```lua
local players = y3.player_group.get_all_players():pick()
for _, player in pairs(players) do
    -- 处理玩家
end
```

### 获取玩家组数量

```lua
local count = y3.player_group.get_all_players():count()
```

---

## 完整示例：游戏初始化时为所有玩家创建英雄

```lua
-- 自定义表存储玩家英雄
local player_heroes = {}

y3.game:event('游戏-初始化', function(trg, data)
    -- 遍历所有玩家（只处理玩家1-12，排除中立玩家31/32）
    local allPlayers = y3.player_group.get_all_players():pick()
    for _, player in pairs(allPlayers) do
        local player_id = player:get_id()
        if player_id >= 1 and player_id <= 12 then
            -- 创建单位
            local spawn_point = y3.point.create(0, 0, 0)
            local hero = y3.unit.create_unit(player, 134217857, spawn_point, 0)
            
            if hero then
                -- 存储英雄引用
                player_heroes[player_id] = hero
                -- 选中英雄
                player:select_unit(hero)
                log.info("玩家 " .. player:get_name() .. " 的英雄已创建")
            end
        end
    end
end)

-- 获取玩家英雄的辅助函数
local function get_player_hero(player)
    return player_heroes[player:get_id()]
end
```
