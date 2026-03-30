# 塔防游戏示例

本示例展示了一个基础塔防游戏的核心实现，包括建筑点放置、塔创建、敌人波次等。

---

## 📋 系统概述

| 模块 | 功能 |
|------|------|
| `config.lua` | 配置数据（塔属性、波次、路径点） |
| `game_manager.lua` | 核心逻辑（波次管理、塔建造、战斗） |
| `input_handler.lua` | 玩家输入处理（点击建造） |

---

## 🔧 config.lua - 配置模块

```lua
--[[
    塔防游戏配置
    包含塔数据、敌人数据、路径配置等
]]

---@class Config
local Config = {}

-- 地图尺寸（重要：影响建筑点分布和粒子可见性）
Config.MapSize = 12800

-- 建筑点配置（使用粒子标记位置）
Config.BuildPoints = {
    { x = -4000, y = 0, z = 50 },
    { x = -2000, y = 0, z = 50 },
    { x = 0,     y = 0, z = 50 },
    { x = 2000,  y = 0, z = 50 },
    { x = 4000,  y = 0, z = 50 },
}

-- 塔数据配置
-- ⚠️ 注意：这些值需要在创建单位后通过 set_attr 应用到引擎
Config.TowerData = {
    -- key 对应物编 ID
    [134219948] = {  -- 基础箭塔
        name = "箭塔",
        damage = 100,
        range = 800,
        attackSpeed = 1.0,
        cost = 50,
    },
    [134219949] = {  -- 魔法塔
        name = "魔法塔",
        damage = 150,
        range = 600,
        attackSpeed = 1.5,
        cost = 80,
    },
}

-- 敌人数据
Config.EnemyData = {
    [134219946] = {  -- 基础怪物
        name = "史莱姆",
        hp = 500,
        speed = 200,
        reward = 10,
    },
}

-- 波次配置
Config.Waves = {
    {
        enemies = { { id = 134219946, count = 5 } },
        interval = 1.0,  -- 每个敌人间隔
        delay = 5.0,     -- 波次开始延迟
    },
    {
        enemies = { { id = 134219946, count = 8 } },
        interval = 0.8,
        delay = 10.0,
    },
}

-- 路径点（敌人移动路径）
Config.PathPoints = {
    { x = -6000, y = 0, z = 50 },  -- 起点
    { x = -3000, y = 0, z = 50 },
    { x = 0,     y = 2000, z = 50 },
    { x = 3000,  y = 0, z = 50 },
    { x = 6000,  y = 0, z = 50 },  -- 终点
}

return Config
```

---

## 🎮 game_manager.lua - 核心逻辑

```lua
--[[
    塔防游戏核心管理器
    处理波次、建造、战斗等核心逻辑
]]

local Config = include 'td_game.config'

---@class GameManager
local GameManager = {
    buildPointMarkers = {},   -- 建筑点粒子标记
    buildPointOccupied = {},  -- 建筑点占用状态
    towers = {},              -- 已建造的塔
    enemies = {},             -- 当前敌人
    currentWave = 0,
    gold = 100,
    lives = 10,
}

-- ====== 初始化 ======

function GameManager:init()
    log.info("[TD] 初始化塔防游戏")
    self:createBuildPointMarkers()
    self:startGame()
end

-- 创建建筑点标记（使用粒子）
-- ⚠️ 大地图注意：scale 和 height 需要调整以保证可见性
function GameManager:createBuildPointMarkers()
    for i, bp in ipairs(Config.BuildPoints) do
        local point = y3.point.create(bp.x, bp.y, bp.z)
        
        -- ✅ 正确的粒子创建方式
        local marker = y3.particle.create({
            type = 101117,     -- 圆形脉冲特效
            target = point,
            scale = 1.0,       -- 大地图用 1.0，小地图可用 0.3
            time = -1,         -- -1 表示永久存在
            height = 10.0,     -- 离地高度，避免被地形遮挡
        })
        
        self.buildPointMarkers[i] = {
            point = point,
            marker = marker,
            occupied = false,
        }
        self.buildPointOccupied[i] = false
    end
    log.info("[TD] 创建 " .. #Config.BuildPoints .. " 个建筑点")
end

-- ====== 建造系统 ======

-- 在指定建筑点建造塔
-- ⚠️ 关键：必须使用 set_attr 同步配置到引擎属性
function GameManager:buildTower(player, buildPointIndex, towerType)
    local bp = self.buildPointMarkers[buildPointIndex]
    if not bp or bp.occupied then
        player:send_msg("请在空闲的建筑点上放置塔")
        return false
    end
    
    local towerData = Config.TowerData[towerType]
    if not towerData then
        log.error("[TD] 未知塔类型: " .. tostring(towerType))
        return false
    end
    
    -- 检查金币
    if self.gold < towerData.cost then
        player:send_msg("金币不足！需要 " .. towerData.cost)
        return false
    end
    
    -- 扣除金币
    self.gold = self.gold - towerData.cost
    
    -- 创建塔单位
    local tower = y3.unit.create_unit(player, towerType, bp.point, 0)
    
    if tower then
        -- ⚠️ 关键：必须手动设置属性，否则使用模板默认值
        tower:set_attr("attack_phy", towerData.damage)
        tower:set_attr("attack_range", towerData.range)
        tower:set_attr("attack_cd", towerData.attackSpeed)
        
        -- 标记建筑点已占用
        bp.occupied = true
        self.buildPointOccupied[buildPointIndex] = true
        
        -- 移除建筑点标记
        if bp.marker then
            bp.marker:remove()
            bp.marker = nil
        end
        
        -- 记录塔
        table.insert(self.towers, {
            unit = tower,
            type = towerType,
            data = towerData,
        })
        
        log.info("[TD] 建造 " .. towerData.name .. " 成功")
        return true
    end
    
    return false
end

-- ====== 波次系统 ======

function GameManager:startGame()
    y3.ltimer.wait(3.0, function()
        self:startNextWave()
    end)
end

function GameManager:startNextWave()
    self.currentWave = self.currentWave + 1
    local waveData = Config.Waves[self.currentWave]
    
    if not waveData then
        log.info("[TD] 所有波次完成！")
        return
    end
    
    log.info("[TD] 开始第 " .. self.currentWave .. " 波")
    
    y3.ltimer.wait(waveData.delay, function()
        self:spawnWaveEnemies(waveData)
    end)
end

function GameManager:spawnWaveEnemies(waveData)
    local spawnIndex = 1
    local totalSpawned = 0
    
    for _, enemyGroup in ipairs(waveData.enemies) do
        for i = 1, enemyGroup.count do
            y3.ltimer.wait(waveData.interval * totalSpawned, function()
                self:spawnEnemy(enemyGroup.id)
            end)
            totalSpawned = totalSpawned + 1
        end
    end
    
    -- 波次结束检测
    local waveCheckTimer
    waveCheckTimer = y3.ltimer.loop(2.0, function()
        if #self.enemies == 0 and totalSpawned > 0 then
            waveCheckTimer:remove()
            y3.ltimer.wait(3.0, function()
                self:startNextWave()
            end)
        end
    end)
end

-- ====== 敌人系统 ======

function GameManager:spawnEnemy(enemyId)
    local spawnPoint = Config.PathPoints[1]
    local point = y3.point.create(spawnPoint.x, spawnPoint.y, spawnPoint.z)
    
    -- ✅ 使用中立敌对玩家（31）创建敌人
    local enemyPlayer = y3.player(31)
    local enemy = y3.unit.create_unit(enemyPlayer, enemyId, point, 0)
    
    if enemy then
        local enemyData = Config.EnemyData[enemyId]
        
        -- 设置属性
        if enemyData then
            enemy:set_attr("hp_max", enemyData.hp)
            enemy:set_attr("hp_cur", enemyData.hp)
            enemy:set_attr("speed", enemyData.speed)
        end
        
        -- 记录敌人
        table.insert(self.enemies, {
            unit = enemy,
            pathIndex = 1,
            data = enemyData,
        })
        
        -- 开始移动
        self:moveEnemyToNextPoint(enemy, 2)
        
        -- 监听死亡
        enemy:event('单位-死亡', function()
            self:onEnemyDeath(enemy)
        end)
    end
end

function GameManager:moveEnemyToNextPoint(enemy, pathIndex)
    if pathIndex > #Config.PathPoints then
        -- 到达终点，扣除生命
        self:onEnemyReachEnd(enemy)
        return
    end
    
    local targetPoint = Config.PathPoints[pathIndex]
    local point = y3.point.create(targetPoint.x, targetPoint.y, targetPoint.z)
    
    -- 命令单位移动
    enemy:move_to(point)
    
    -- 检测到达后继续移动
    local checkTimer
    checkTimer = y3.ltimer.loop(0.5, function()
        if not enemy:is_alive() then
            checkTimer:remove()
            return
        end
        
        local dist = enemy:get_point():get_distance_with(point)
        if dist < 100 then
            checkTimer:remove()
            self:moveEnemyToNextPoint(enemy, pathIndex + 1)
        end
    end)
end

function GameManager:onEnemyDeath(enemy)
    -- 从列表移除
    for i, e in ipairs(self.enemies) do
        if e.unit == enemy then
            -- 奖励金币
            local reward = e.data and e.data.reward or 10
            self.gold = self.gold + reward
            log.info("[TD] 击杀敌人，获得 " .. reward .. " 金币")
            
            table.remove(self.enemies, i)
            break
        end
    end
end

function GameManager:onEnemyReachEnd(enemy)
    self.lives = self.lives - 1
    log.info("[TD] 敌人到达终点！剩余生命: " .. self.lives)
    
    enemy:kill_by(nil)
    
    if self.lives <= 0 then
        log.info("[TD] 游戏结束！")
    end
end

-- ====== 辅助方法 ======

-- 查找最近的空闲建筑点
function GameManager:findNearestBuildPoint(clickPoint)
    local nearestIndex = nil
    local nearestDist = 500  -- 点击范围
    
    for i, bp in ipairs(self.buildPointMarkers) do
        if not bp.occupied then
            local dist = bp.point:get_distance_with(clickPoint)
            if dist < nearestDist then
                nearestDist = dist
                nearestIndex = i
            end
        end
    end
    
    return nearestIndex
end

return GameManager
```

---

## 🖱️ input_handler.lua - 输入处理

```lua
--[[
    玩家输入处理
    处理建造塔的点击事件
]]

local GameManager = include 'td_game.game_manager'
local Config = include 'td_game.config'

---@class InputHandler
local InputHandler = {
    player_selected_units = {},  -- 存储玩家选中的单位
}

function InputHandler:init()
    -- 监听单位选中事件，存储玩家选中的单位
    y3.game:event('选中-单位', function(trg, data)
        local player = data.player
        local unit = data.unit
        if player and unit then
            self.player_selected_units[player:get_id()] = unit
        end
    end)
    
    -- 监听键盘按键建造
    -- 按 1 建造箭塔，按 2 建造魔法塔
    y3.game:event('键盘-按下', 'KEY_1', function(trg, data)
        local player = data.player
        self:tryBuildTower(player, 134219948)  -- 箭塔ID
    end)
    
    y3.game:event('键盘-按下', 'KEY_2', function(trg, data)
        local player = data.player
        self:tryBuildTower(player, 134219949)  -- 魔法塔ID
    end)
end

-- 获取玩家选中的单位
function InputHandler:getSelectedUnit(player)
    return self.player_selected_units[player:get_id()]
end

function InputHandler:tryBuildTower(player, towerType)
    -- 从自定义表获取玩家选中的单位
    local selectedUnit = self:getSelectedUnit(player)
    if not selectedUnit then
        player:send_msg("请先选择一个建筑点")
        return
    end
    
    local clickPoint = selectedUnit:get_point()
    local buildPointIndex = GameManager:findNearestBuildPoint(clickPoint)
    
    if buildPointIndex then
        GameManager:buildTower(player, buildPointIndex, towerType)
    else
        player:send_msg("附近没有可用的建筑点")
    end
end

return InputHandler
```

---

## ⚠️ 关键经验总结

### 1. 属性必须手动同步

```lua
-- ❌ 错误：期望 config 值自动生效
local tower = y3.unit.create_unit(player, towerType, point, 0)
-- 塔的攻击力是模板默认值，不是 config 中定义的值

-- ✅ 正确：创建后立即设置属性
local tower = y3.unit.create_unit(player, towerType, point, 0)
tower:set_attr("attack_phy", towerData.damage)
tower:set_attr("attack_range", towerData.range)
tower:set_attr("attack_cd", towerData.attackSpeed)
```

### 2. 大地图粒子可见性

```lua
-- ❌ 错误：小 scale 在大地图上几乎不可见
y3.particle.create({
    type = 101117,
    target = point,
    scale = 0.1,  -- 12800 地图上看不到
})

-- ✅ 正确：根据地图大小调整
y3.particle.create({
    type = 101117,
    target = point,
    scale = 1.0,    -- 大地图用较大 scale
    height = 10.0,  -- 提升高度避免被地形遮挡
    time = -1,      -- 永久存在
})
```

### 3. 中立敌对玩家

```lua
-- ❌ 错误：敌人分配给玩家2
local enemy = y3.unit.create_unit(y3.player(2), enemyId, point, 0)
-- 玩家2不一定与玩家1敌对

-- ✅ 正确：使用中立敌对（31）
local enemy = y3.unit.create_unit(y3.player(31), enemyId, point, 0)
-- 自动与所有玩家敌对
```

### 4. API 命名规范

```lua
-- ❌ 错误：API 不存在
local unit = y3.unit.create(player, unitId, point, 0)

-- ✅ 正确：使用完整方法名
local unit = y3.unit.create_unit(player, unitId, point, 0)
```

---

## 📁 目录结构

```
maps/EntryMap/script/
├── 可重载的代码.lua      -- 入口文件
└── td_game/
    ├── config.lua        -- 配置
    ├── game_manager.lua  -- 核心逻辑
    └── input_handler.lua -- 输入处理
```

**入口文件示例**：
```lua
-- 可重载的代码.lua
include 'td_game.config'
include 'td_game.game_manager'
include 'td_game.input_handler'

local GameManager = include 'td_game.game_manager'
local InputHandler = include 'td_game.input_handler'

y3.game:event('游戏-初始化', function()
    GameManager:init()
    InputHandler:init()
end)
```

---

*最后更新: 2025-07*
