# Timer API 规范

计时器相关 API 的使用规范。

## 计时器类型

Y3 框架提供本地计时器 `y3.ltimer`，用于处理延迟和循环执行。

---

## 延迟执行

### 等待指定时间后执行

```lua
-- delay 秒后执行一次
y3.ltimer.wait(delay, function(timer, count)
    log.info("延迟执行完成")
end)
```

**示例**：
```lua
-- 3秒后执行
y3.ltimer.wait(3.0, function(timer, count)
    log.info("3秒已过")
end)
```

---

## 循环执行

### 无限循环

```lua
-- 每隔 interval 秒执行一次
y3.ltimer.loop(interval, function(timer, count)
    log.info("执行次数: " .. count)
    
    -- 需要停止时调用
    -- timer:remove()
end)
```

**示例**：
```lua
-- 每秒执行一次
y3.ltimer.loop(1.0, function(timer, count)
    log.info("每秒执行，当前次数: " .. count)
end)
```

### 循环指定次数

```lua
-- 执行 count 次后自动停止
y3.ltimer.loop_count(interval, count, function(timer, current)
    log.info("第 " .. current .. " 次执行")
end)
```

**示例**：
```lua
-- 每秒执行，共执行5次
y3.ltimer.loop_count(1.0, 5, function(timer, current)
    log.info("执行 " .. current .. "/5")
end)
```

---

## 帧计时器

### 等待指定帧数

```lua
-- 等待 frame_count 帧后执行
y3.ltimer.wait_frame(frame_count, function()
    log.info("帧等待完成")
end)
```

### 每帧执行

```lua
-- 每帧执行（用于平滑动画等）
y3.ltimer.loop_frame(1, function(timer, count)
    -- 每帧执行的代码
    
    -- 需要停止时
    -- timer:remove()
end)
```

---

## 停止计时器

```lua
-- 保存计时器引用
local my_timer = y3.ltimer.loop(1.0, function(timer, count)
    log.info("循环中...")
end)

-- 需要停止时
my_timer:remove()
```

### 在回调中停止

```lua
y3.ltimer.loop(1.0, function(timer, count)
    if count >= 10 then
        timer:remove()  -- 执行10次后停止
        log.info("计时器已停止")
        return
    end
    
    log.info("执行次数: " .. count)
end)
```

---

## 获取游戏时间

```lua
-- 获取当前游戏已运行时间（秒）
local game_time = y3.game.current_game_run_time()
```

---

## 完整示例：倒计时系统

```lua
-- 10秒倒计时
local countdown = 10

y3.ltimer.loop(1.0, function(timer, count)
    countdown = countdown - 1
    
    log.info("倒计时: " .. countdown)
    
    if countdown <= 0 then
        timer:remove()
        log.info("倒计时结束！")
        -- 执行倒计时结束后的逻辑
    end
end)
```

---

## 完整示例：技能冷却显示

```lua
-- 技能冷却动画
local function show_cooldown(ui_progress, duration)
    local start_time = y3.game.current_game_run_time()
    
    y3.ltimer.loop_frame(1, function(timer, count)
        local elapsed = y3.game.current_game_run_time() - start_time
        local progress = math.min(elapsed / duration, 1.0)
        
        -- 更新进度条
        ui_progress:set_current_progress_bar_value(progress * 100, 0)
        
        if progress >= 1.0 then
            timer:remove()
            log.info("冷却完成")
        end
    end)
end
```

---

## 完整示例：周期性检测

```lua
-- 使用自定义表存储玩家英雄
local player_heroes = {}

-- 在创建英雄时调用此函数存储引用
local function register_hero(player, hero)
    player_heroes[player:get_id()] = hero
    player:select_unit(hero)  -- 选中英雄
end

-- 为指定玩家启动敌人检测
local function start_enemy_detection(player)
    y3.ltimer.loop(0.5, function(timer, count)
        local hero = player_heroes[player:get_id()]  -- 从自定义表获取英雄
        if not hero or not hero:is_alive() then return end
        
        -- 获取周围敌人
        local enemies = y3.selector.create()
            :in_range(hero:get_point(), 500)
            :is_enemy(player)
            :pick()
        
        for _, enemy in pairs(enemies) do
            log.info("检测到敌人: " .. tostring(enemy))
        end
    end)
end
```

---

## 注意事项

1. **避免过短间隔**：间隔过短可能影响性能
2. **及时移除**：不再需要的计时器要及时 `remove()`
3. **检查有效性**：在回调中操作对象前检查其是否有效
4. **帧计时器谨慎使用**：每帧执行消耗较大，用完即移除
