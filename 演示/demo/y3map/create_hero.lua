local M = {}

-- 玩家控制的英雄的物编id
local hero_template_id = 134261387

function M:init()
    local player = y3.player(1)
    local heroUnit = player:create_unit(hero_template_id, y3.point.create(0, 0, 0), 180.0)
    player:select_unit(heroUnit)
    heroUnit:event('单位-死亡', function()
        print('玩家死亡')
        y3.game:event_dispatch(EventEnum.Game.玩家失败)
    end)
end

return M
