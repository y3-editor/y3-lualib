local M = {}

local generate_monsters_config = {
    -- 怪物类型                  刷怪数
    { monster_type = 134251991, count = 10 }, --蝎子
    { monster_type = 134246732, count = 10 }, --树人
    { monster_type = 134251991, count = 12 }, --蝎子
    { monster_type = 134246732, count = 12 }, --树人
    { monster_type = 134251991, count = 15 }, --蝎子
    { monster_type = 134246732, count = 15 }, --树人
}
-- 怪物出生坐标
local spawn_point = y3.point.create(0, -2000, 0)
-- 怪物进攻目标
local attack_point = y3.point.create(0, -2000, 0)

-- 初始为第0波怪物
local wave_index = 0

-- 总共几波
local total_batch_count = #generate_monsters_config

-- 场上存活的怪物
local alive_count = 0

local stopped = false

-- 刷下一波怪
function M.next_wave()
    if not M.has_next() then
        return
    end

    if stopped then
        return
    end

    wave_index = wave_index + 1

    -- 怪物类型
    local monster_type = generate_monsters_config[wave_index].monster_type

    -- 这一波要刷的怪物数量
    local count = generate_monsters_config[wave_index].count

    -- 每间隔一秒刷一个怪物
    y3.timer.count_loop(1, count, function()
        if stopped then
            return
        end

        -- 生成怪物
        local monster = y3.unit.create_unit(y3.player(31), monster_type, spawn_point, 0)

        -- 命令怪物攻击移动到目标位置
        monster:attack_move(attack_point)

        alive_count = alive_count + 1

        monster:event('单位-死亡', function(_, data)
            alive_count = alive_count - 1
        end)
    end)
end

---@return boolean 有无下波怪
function M.has_next()
    return wave_index < total_batch_count
end

function M.get_alive_count()
    return alive_count
end

function M.stop()
    stopped = true
end

return M
