-- 天火 W技能
local M = y3.object.ability[134269452]

--施法开始
---@param ability Ability
---@param cast Cast
function M.on_cast_start(ability, cast)
    -- log.info('天火 施法开始')
    local owner = ability:get_owner()
    if owner then
        owner:play_animation('attack2', 1.0, 0.0, -1.0, false, true)
    end
end

--施法出手
---@param ability Ability
---@param cast Cast
function M.on_cast_shot(ability, cast)
    -- log.info('天火 施法出手')
    local owner = ability:get_owner()
    if owner then
        local target_point = cast:get_target_point()
        y3.particle.create({
            type = 105009, -- 特效类型id
            target = target_point,
            angle = nil,
            scale = 1.3,
            height = 20.0,
            time = 2.0,
            immediate = true
        })
        y3.timer.wait(0.6, function(timer)
            local damage = ability:get_float_attr('ability_damage')

            -- 筛选出圆形技能范围内的单位
            local selector = y3.selector.create()
            local circular_shape = y3.shape.create_circular_shape(300)
            selector:in_shape(target_point, circular_shape)

            local units = selector:get():pick()
            for _, unit in pairs(units) do
                -- 如果是敌人
                if owner:is_enemy(unit) then
                    owner:damage(
                        {
                            --- Unit.DamageData
                            target = unit,
                            type = '法术',
                            damage = damage,
                            ability = ability,     -- 关联技能
                            text_type = 'magic',   -- 跳字类型
                            text_track = 0,        -- 跳字轨迹类型
                            common_attack = false, -- 视为普攻
                            critical = false,      -- 必定暴击
                            no_miss = true,        -- 必定命中
                            particle = nil,        -- 特效
                            socket = nil,          -- 特效挂点
                        }
                    )
                end
            end
        end)
    end
end

return M
