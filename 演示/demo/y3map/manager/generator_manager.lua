local M = {}

function M:init()
    -- 怪物波次表
    self.config = y3map.config_manager.get_monster_generate_config()

    -- 刷怪总波数
    self.total_batch_count = y3map.config_manager.get_batch_count()

    ---@param batch_index integer 刷第几波怪
    y3.game:event_on('刷怪', function(_, batch_index)
        -- 怪物出生坐标
        local spawn_point = y3map.config_manager.get_monster_spawn_point()

        -- 第几波
        local batch_index = batch_index

        -- 这一波要刷的怪物类型
        local monster_type = self.config[batch_index]['怪物类型']

        -- 这一波要刷的怪物数量
        local monster_count = self.config[batch_index]['刷怪数']

        -- 这一波死的怪物数量
        local dead_count = 0

        y3.timer.count_loop(0.5, monster_count, function()
            local monster = y3.unit.create_unit(y3.player(31), monster_type, spawn_point, 0)
            monster:event('单位-死亡', function(_, data)
                dead_count = dead_count + 1
                if dead_count == monster_count then
                    -- 如果已经是最后一波
                    if batch_index == self.total_batch_count then
                        y3.game:event_dispatch(EventEnum.Game.玩家胜利)
                    else
                        y3.game:event_dispatch('刷怪', batch_index + 1)
                    end
                end
            end)
        end)
    end)
end

function M:start()
    -- 先刷第一波怪
    y3.game:event_dispatch('刷怪', 1)
end

return M
