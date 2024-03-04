local M = {}

function M.get_monster_generate_config()
    return y3.game.get_table('怪物波次表')
end

function M.get_global_config()
    return y3.game.get_table('全局配置表')
end

function M.get_game_end_time()
    return M.get_global_config()['游戏时长']
end

function M.get_batch_count()
    return M.get_global_config()['总波次']
end

function M.get_monster_spawn_point()
    local x = M.get_global_config()['怪物出生坐标_X']
    local y = M.get_global_config()['怪物出生坐标_Y']
    local z = M.get_global_config()['怪物出生坐标_Z']
    return y3.point.create(x, y, z)
end

return M
