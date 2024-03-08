-- 闪电箭 Q技能
local M = y3.object.ability[134225581]

-- 施法开始
---@param ability Ability
---@param cast Cast
function M.on_cast_start(ability, cast)
    --log.info('闪电箭 施法开始')
    local owner = ability:get_owner()
    if owner then
        owner:play_animation('attack1', 1.0, 0.0, -1.0, false, true)
    end
end

-- 施法出手
---@param ability Ability
---@param cast Cast
function M.on_cast_shot(ability, cast)
    --log.info('闪电箭 施法出手')
    local owner = ability:get_owner()
    local castdir = cast:get_angle()
    if owner then
        local projectile = y3.projectile.create {
            key = 134259633,            -- 投射物类型ID
            target = owner:get_point(), -- 创建位置
            angle = castdir,            -- 投射物朝向
            height = 150.0,             -- 投射物高度
            time = 2.0,                 -- 投射物持续时间
            owner = owner,              -- 投射物拥有者
            ability = ability,          --  投射物关联技能
            remove_immediately = true   -- 是否立即移除表现，如果不填会读表
        }
        projectile:mover_line {
            -- Mover.CreateData.Line
            angle      = castdir,             -- 运动方向
            distance   = ability:get_range(), -- 运动距离
            speed      = 2000.0,              -- 初始速度
            max_speed  = 2000,                -- 最大速度
            min_speed  = 2000,                -- 最小速度

            -- Mover.CreateData.Base
            on_hit     = function(self, unit) -- 碰撞单位回调
                local damage = ability:get_float_attr('ability_damage')
                self:stop()
                projectile:remove()
                owner:damage {
                    target = unit,
                    type = '物理',
                    damage = damage,
                    ability = ability, -- 关联技能
                    no_miss = true,    -- 必定命中
                    particle = 104995, -- 特效
                }
            end,
            on_remove  = function(self) -- 运动结束回调
                self:stop()
                projectile:remove()
            end,
            hit_radius = 100,     -- 碰撞范围
            face_angle = true,    -- 是否始终面向运动方向
            ability    = ability, -- 关联技能
            unit       = owner    -- 关联单位
        }
    end
end

return M
