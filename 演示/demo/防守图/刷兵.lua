local M = {}

local generate_monsters_config = {
    -- 怪物类型                  刷怪数
    { monster_type = 134246732, count = 5 }, --树人
    { monster_type = 134251991, count = 1 }, --蝎子
    { monster_type = 134246732, count = 2 }, --树人
    { monster_type = 134251991, count = 3 }, --蝎子
    { monster_type = 134246732, count = 5 }, --树人
}
-- 怪物出生坐标
local spawn_point = y3.point.create(0, -1000, 0)

-- 初始为第0波怪物
local batch_index = 0

-- 总共几波
local total_batch_count = #generate_monsters_config

-- 场上存活的怪物
local alive_count = 0

function M.wait_next(time, on_timer)
    y3.timer.wait(time, on_timer)
end

-- 每隔time秒刷一波怪物
function M.loop_next(time)
    y3.timer.count_loop(time, total_batch_count, function(timer, count)
        batch_index = batch_index + 1

        y3.game:event_dispatch('刷怪', { 波次 = batch_index, 总波次 = total_batch_count })

        -- 怪物类型
        local monster_type = generate_monsters_config[batch_index].monster_type

        -- 这一波要刷的怪物数量
        local count = generate_monsters_config[batch_index].count

        -- 每间隔一秒刷一个怪物
        y3.timer.count_loop(1, count, function()
            -- 生成怪物
            local monster = y3.unit.create_unit(y3.player(31), monster_type, spawn_point, 0)

            alive_count = alive_count + 1

            monster:event('单位-死亡', function(_, data)
                alive_count = alive_count - 1
            end)
        end)
    end)
end

---@return boolean 有无下波怪
function M.has_next()
    return batch_index < total_batch_count
end

function M.get_alive_count()
    return alive_count
end

return M
