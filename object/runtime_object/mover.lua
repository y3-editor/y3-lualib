---@class Mover
---@field handle py.Mover
---@overload fun(handle: py.Mover): self
local M = Class 'Mover'

---@param handle py.Mover
---@return Mover
function M:constructor(handle)
    self.handle = handle
    return self
end

---@param py_mover py.Mover
---@return Mover
function M.get_by_handle(py_mover)
    return New 'Mover' (py_mover)
end

y3.py_converter.register_py_to_lua('py.Mover', M.get_by_handle)
y3.py_converter.register_lua_to_py('py.Mover', function (lua_value)
    return lua_value.handle
end)

---@class Mover.CreateData.Base
---@field on_hit? fun(self: Mover, unit: Unit) # 碰撞单位回调
---@field on_block? fun(self: Mover) # 碰撞地形回调
---@field on_finish? fun(self: Mover) # 运动结束回调
---@field on_break? fun(self: Mover) # 运动打断回调
---@field on_remove? fun(self: Mover) # 运动移除回调
---@field hit_type? integer # 碰撞类型
---@field hit_radius? number # 碰撞范围
---@field hit_same? boolean # 能否重复碰撞同一单位
---@field terrain_block? boolean # 是否会被地形阻挡
---@field priority? integer # 优先级
---@field is_absolute_height? boolean # 是否使用绝对高度
---@field face_angle? boolean # 是否始终面向运动方向
---@field ability? Ability # 关联技能

---@class Mover.CreateData.Line: Mover.CreateData.Base
---@field angle number # 运动方向
---@field distance number # 运动距离
---@field speed number # 初始速度
---@field acceleration? number # 加速度
---@field max_speed? number # 最大速度
---@field min_speed? number # 最小速度
---@field init_height? number # 初始高度
---@field fin_height? number # 终点高度
---@field parabola_height? number # 抛物线顶点高度

---@class Mover.CreateData.Target: Mover.CreateData.Base
---@field target Unit|Projectile|Destructible|Item # 追踪目标
---@field max_distance number # 最大距离
---@field speed number # 初始速度
---@field acceleration? number # 加速度
---@field max_speed? number # 最大速度
---@field min_speed? number # 最小速度
---@field height? number # 初始高度
---@field parabola_height? number # 抛物线顶点高度
---@field bind_point? string # 绑定点

---@class Mover.CreateData.Curve: Mover.CreateData.Base
---@field angle number # 运动方向
---@field distance number # 运动距离
---@field speed number # 初始速度
---@field path Point[] # 路径点
---@field acceleration? number # 加速度
---@field max_speed? number # 最大速度
---@field min_speed? number # 最小速度
---@field init_height? number # 初始高度
---@field fin_height? number # 终点高度

---@class Mover.CreateData.Round: Mover.CreateData.Base
---@field target Unit|Projectile|Destructible|Item # 环绕目标
---@field radius? number # 环绕半径
---@field angle_speed? number # 环绕速度
---@field init_angle? number # 初始角度
---@field clock_wise? boolean # 是否顺时针
---@field round_time? number # 环绕时间
---@field radius_speed? number # 半径变化速度
---@field lifting_speed? number # 提升速度
---@field height? number # 环绕高度
---@field target_point? Point # 目标点

---@private
---@param mover_data Mover.CreateData.Base
---@return fun(mover: Mover) # update mover
---@return fun(mover: Mover, unit: Unit)? # on_hit
---@return fun(mover: Mover)? # on_block
---@return fun(mover: Mover)? # on_finish
---@return fun(mover: Mover)? # on_break
---@return fun(mover: Mover)? # on_remove
function M.wrap_callbacks(mover_data)
    ---@type Mover
    local mover

    ---@param m Mover
    local function update_mover(m)
        mover = m
    end

    ---@type fun(mover: Mover, unit: Unit)?
    local on_hit
    if mover_data.on_hit then
        ---@param py_unit py.Unit
        on_hit = function (_, py_unit)
            local unit = y3.unit.get_by_handle(py_unit)
            xpcall(mover_data.on_hit, log.error, mover, unit)
        end
    end

    ---@type fun(mover: Mover)?
    local on_block
    if mover_data.on_block then
        on_block = function ()
            xpcall(mover_data.on_block, log.error, mover)
        end
    end

    ---@type fun(mover: Mover)?
    local on_finish
    if mover_data.on_finish then
        on_finish = function ()
            xpcall(mover_data.on_finish, log.error, mover)
        end
    end

    ---@type fun(mover: Mover)?
    local on_break
    if mover_data.on_break then
        on_break = function ()
            xpcall(mover_data.on_break, log.error, mover)
        end
    end

    ---@type fun(mover: Mover)?
    local on_remove
    if mover_data.on_remove then
        on_remove = function ()
            xpcall(mover_data.on_remove, log.error, mover)
        end
    end

    return update_mover, on_hit, on_block, on_finish, on_break, on_remove
end

---@private
---@param mover_data Mover.CreateData.Base
function M:init(mover_data)
    if mover_data.ability then
        GameAPI.set_mover_relate_ability(self.handle, mover_data.ability.handle)
    end
end

-- 打断运动器
function M:stop()
    GameAPI.break_mover(self.handle)
end

-- 移除运动器
function M:remove()
    GameAPI.remove_mover(self.handle)
end

---@param mover_unit Unit|Projectile
---@param mover_data Mover.CreateData.Line
---@return Mover
function M.mover_line(mover_unit, mover_data)
    local update_mover, on_hit, on_block, on_finish, on_break, on_remove = M.wrap_callbacks(mover_data)
    local py_mover = GameAPI.create_straight_mover(
        -- TODO 见问题8
        ---@diagnostic disable-next-line: param-type-mismatch
        mover_unit.handle,
        mover_data.angle,
        mover_data.distance,
        mover_data.speed,
        mover_data.acceleration or 0,
        mover_data.max_speed,
        mover_data.min_speed,
        mover_data.init_height,
        mover_data.fin_height,
        mover_data.parabola_height,
        mover_data.hit_type,
        mover_data.hit_radius,
        mover_data.face_angle,
        mover_data.hit_same,
        mover_data.terrain_block,
        mover_data.priority,
        mover_data.is_absolute_height,
        on_finish,
        on_break,
        on_remove,
        on_block,
        on_hit
    )
    local mover = M.get_by_handle(py_mover)
    update_mover(mover)
    mover:init(mover_data)
    return mover
end

---@param mover_unit Unit|Projectile
---@param mover_data Mover.CreateData.Target
---@return Mover
function M.mover_target(mover_unit, mover_data)
    local update_mover, on_hit, on_block, on_finish, on_break, on_remove = M.wrap_callbacks(mover_data)
    local py_mover = GameAPI.create_chasing_mover(
        -- TODO 见问题8
        ---@diagnostic disable-next-line: param-type-mismatch
        mover_unit.handle,
        -- TODO 见问题8
        ---@diagnostic disable-next-line: param-type-mismatch
        mover_data.target.handle,
        mover_data.max_distance,
        mover_data.speed,
        mover_data.acceleration or 0,
        mover_data.max_speed,
        mover_data.min_speed,
        mover_data.height,
        mover_data.parabola_height,
        mover_data.bind_point,
        mover_data.hit_type,
        mover_data.hit_radius,
        mover_data.face_angle,
        mover_data.hit_same,
        mover_data.terrain_block,
        mover_data.priority,
        mover_data.is_absolute_height,
        on_finish,
        on_break,
        on_remove,
        on_block,
        on_hit
    )
    local mover = M.get_by_handle(py_mover)
    update_mover(mover)
    mover:init(mover_data)
    return mover
end

---@param mover_unit Unit|Projectile
---@param mover_data Mover.CreateData.Curve
---@return Mover
function M.mover_curve(mover_unit, mover_data)
    ---@type py.CurvedPath
    local path = y3.helper.unwrap_list(mover_data.path, y3.py_converter.lua_to_py_factory 'py.Point')
    local update_mover, on_hit, on_block, on_finish, on_break, on_remove = M.wrap_callbacks(mover_data)
    local py_mover = GameAPI.create_curved_mover(
        -- TODO 见问题8
        ---@diagnostic disable-next-line: param-type-mismatch
        mover_unit.handle,
        mover_data.angle,
        mover_data.distance,
        mover_data.speed,
        mover_data.acceleration or 0,
        mover_data.max_speed,
        mover_data.min_speed,
        mover_data.init_height,
        mover_data.fin_height,
        mover_data.hit_type,
        mover_data.hit_radius,
        mover_data.face_angle,
        mover_data.hit_same,
        mover_data.terrain_block,
        mover_data.priority,
        mover_data.is_absolute_height,
        path,
        on_finish,
        on_break,
        on_remove,
        on_block,
        on_hit
    )
    local mover = M.get_by_handle(py_mover)
    update_mover(mover)
    mover:init(mover_data)
    return mover
end

---@param mover_unit Unit|Projectile
---@param mover_data Mover.CreateData.Round
---@return Mover
function M.mover_round(mover_unit, mover_data)
    local update_mover, on_hit, on_block, on_finish, on_break, on_remove = M.wrap_callbacks(mover_data)
    local py_mover = GameAPI.create_round_mover(
        -- TODO 见问题8
        ---@diagnostic disable-next-line: param-type-mismatch
        mover_unit.handle,
        -- TODO 见问题8
        ---@diagnostic disable-next-line: param-type-mismatch
        mover_data.target.handle,
        mover_data.radius or 0,
        mover_data.angle_speed or 0,
        mover_data.init_angle,
        mover_data.clock_wise == false and 2 or 1,
        mover_data.round_time,
        mover_data.radius_speed,
        mover_data.lifting_speed,
        mover_data.height,
        mover_data.hit_type,
        mover_data.hit_radius,
        mover_data.face_angle,
        mover_data.hit_same,
        mover_data.terrain_block,
        mover_data.priority,
        mover_data.is_absolute_height,
        -- TODO 见问题2
        ---@diagnostic disable-next-line: param-type-mismatch
        mover_data.target_point and mover_data.target_point.handle or nil,
        on_finish,
        on_break,
        on_remove,
        on_block,
        on_hit
    )
    local mover = M.get_by_handle(py_mover)
    update_mover(mover)
    mover:init(mover_data)
    return mover
end

---@class Unit
local Unit = Class 'Unit'

---@class Projectile
local Projectile = Class 'Projectile'

---创建直线运动器
---@param mover_data Mover.CreateData.Line
---@return Mover
function Unit:mover_line(mover_data)
    local mover = M.mover_line(self, mover_data)
    return mover
end

---创建直线运动器
---@param mover_data Mover.CreateData.Line
---@return Mover
function Projectile:mover_line(mover_data)
    local mover = M.mover_line(self, mover_data)
    return mover
end

---创建追踪运动器
---@param mover_data Mover.CreateData.Target
---@return Mover
function Unit:mover_target(mover_data)
    local mover = M.mover_target(self, mover_data)
    return mover
end

---创建追踪运动器
---@param mover_data Mover.CreateData.Target
---@return Mover
function Projectile:mover_target(mover_data)
    local mover = M.mover_target(self, mover_data)
    return mover
end

---创建曲线运动器
---@param mover_data Mover.CreateData.Curve
---@return Mover
function Unit:mover_curve(mover_data)
    local mover = M.mover_curve(self, mover_data)
    return mover
end

---创建曲线运动器
---@param mover_data Mover.CreateData.Curve
---@return Mover
function Projectile:mover_curve(mover_data)
    local mover = M.mover_curve(self, mover_data)
    return mover
end

---创建环绕运动器
---@param mover_data Mover.CreateData.Round
---@return Mover
function Unit:mover_round(mover_data)
    local mover = M.mover_round(self, mover_data)
    return mover
end

---创建环绕运动器
---@param mover_data Mover.CreateData.Round
---@return Mover
function Projectile:mover_round(mover_data)
    local mover = M.mover_round(self, mover_data)
    return mover
end

---打断运动器
function Unit:break_mover()
    GameAPI.break_unit_mover(self.handle)
end

---移除运动器
function Unit:remove_mover()
    GameAPI.remove_unit_mover(self.handle)
end

---打断运动器
function Projectile:break_mover()
    -- TODO 见问题8
    ---@diagnostic disable-next-line: param-type-mismatch
    GameAPI.break_unit_mover(self.handle)
end

---移除运动器
function Projectile:remove_mover()
    -- TODO 见问题8
    ---@diagnostic disable-next-line: param-type-mismatch
    GameAPI.remove_unit_mover(self.handle)
end

return M
