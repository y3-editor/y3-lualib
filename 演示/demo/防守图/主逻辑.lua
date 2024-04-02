local battle_wave = require 'y3.演示.demo.防守图.刷兵'
local game_result = require 'y3.演示.demo.防守图.游戏结果'

-- 为玩家1创建主控英雄
local hero = y3.player(1):create_unit(134261387, y3.point.create(0, 0, 0), 180.0)
y3.player(1):select_unit(hero)

-- 为这个英雄添加演示用的技能
hero:add_ability('英雄', 134225581)
hero:add_ability('英雄', 134269452)

-- 玩家英雄死亡，游戏失败
hero:event('单位-死亡', function(_, _)
    game_result.lose()
end)

-- 等待2秒后开始刷兵
battle_wave.wait_next(2, function()
    -- 第一次出兵后，每5秒再出一次兵
    battle_wave.loop_next(5)
end)

y3.ltimer.loop(1, function(timer)
    -- 如果场上的怪超过50个，判定游戏失败
    if battle_wave.get_alive_count() >= 50 then
        game_result.lose()
        timer:remove()
    end
    -- 如果场上没有怪了，也没有下一波怪了，判定游戏胜利
    if battle_wave.get_alive_count() == 0 and not battle_wave.has_next() then
        game_result.win()
        timer:remove()
    end
end)
