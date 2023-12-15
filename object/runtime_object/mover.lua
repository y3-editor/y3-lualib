---@class Mover
---@field handle py.Mover
---@overload fun(handle: py.Mover): self
local M = Class 'Mover'

---@class Mover: Storage
Extends('Mover', 'Storage')
---@class Mover: GCHost
Extends('Mover', 'GCHost')

---@param handle py.Mover
---@return Mover
function M:__init(handle)
    self.handle = handle
    return self
end

function M:__del()
    GameAPI.remove_mover(self.handle)
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
---@field absolute_height? boolean # 是否使用绝对高度
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
---@field target Unit|Destructible|Item # 追踪目标
---@field speed number # 初始速度
---@field target_distance number # 撞击目标的距离
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
---@field path (Point|py.FixedVec2)[] # 路径点
---@field acceleration? number # 加速度
---@field max_speed? number # 最大速度
---@field min_speed? number # 最小速度
---@field init_height? number # 初始高度
---@field fin_height? number # 终点高度

---@class Mover.CreateData.Round: Mover.CreateData.Base
---@field target Unit|Point # 环绕目标
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
---@return fun()? # on_hit
---@return fun()? # on_block
---@return fun()? # on_finish
---@return fun()? # on_break
---@return fun()  # on_remove
function M.wrap_callbacks(mover_data)
    ---@type Mover
    local mover

    ---@param m Mover
    local function update_mover(m)
        mover = m
    end

    ---@type fun(mover: py.Mover, unit: py.Unit)?
    local on_hit
    if mover_data.on_hit then
        on_hit = function ()
            local py_unit = GameAPI.get_mover_collide_unit()
            local unit = y3.unit.get_by_handle(py_unit)
            xpcall(mover_data.on_hit, log.error, mover, unit)
        end
    end

    ---@type fun(mover: py.Mover)?
    local on_block
    if mover_data.on_block then
        on_block = function ()
            xpcall(mover_data.on_block, log.error, mover)
        end
    end

    ---@type fun(mover: py.Mover)?
    local on_finish
    if mover_data.on_finish then
        on_finish = function ()
            xpcall(mover_data.on_finish, log.error, mover)
        end
    end

    ---@type fun(mover: py.Mover)?
    local on_break
    if mover_data.on_break then
        on_break = function ()
            xpcall(mover_data.on_break, log.error, mover)
        end
    end

    -- TODO 目前没有运动移除的全局事件，因此在每个运动的移除回调中析构自己
    ---@type fun(mover: py.Mover)
    local on_remove = function ()
        Delete(mover)
        if mover_data.on_remove then
            xpcall(mover_data.on_remove, log.error, mover)
        end
    end

    return update_mover, on_hit, on_block, on_finish, on_break, on_remove
end

---@private
---@param args Mover.CreateData.Line
---@return table
function M.wrap_line_args(args)
    local builder = StraightMoverArgs()
    builder.set_angle              (Fix32(args.angle))
    builder.set_max_dist           (Fix32(args.distance))
    builder.set_init_velocity      (Fix32(args.speed))
    builder.set_acceleration       (Fix32(args.acceleration or 0.0))
    builder.set_max_velocity       (Fix32(args.max_speed or 99999.0))
    builder.set_min_velocity       (Fix32(args.min_speed or 0.0))
    builder.set_init_height        (Fix32(args.init_height or 0.0))
    builder.set_fin_height         (Fix32(args.fin_height or 0.0))
    builder.set_parabola_height    (Fix32(args.parabola_height or 0.0))
    builder.set_collision_type     (args.hit_type or 0)
    builder.set_collision_radius   (Fix32(args.hit_radius or 0.0))
    builder.set_is_face_angle      (args.face_angle or false)
    builder.set_is_multi_collision (args.hit_same or false)
    builder.set_terrain_block      (args.terrain_block or false)
    builder.set_priority           (args.priority or 1)
    builder.set_is_parabola_height (args.parabola_height ~= nil)
    builder.set_is_absolute_height (args.absolute_height or false)
    builder.set_is_open_init_height(args.init_height ~= nil)
    builder.set_is_open_fin_height (args.fin_height ~= nil)

    return builder
end

---@private
---@param args Mover.CreateData.Target
---@return table
function M.wrap_target_args(args)
    local builder = ChasingMoverArgs()
    builder.set_stop_distance_to_target(Fix32(args.target_distance or 0.0))
    builder.set_init_velocity          (Fix32(args.speed))
    builder.set_acceleration           (Fix32(args.acceleration or 0.0))
    builder.set_max_velocity           (Fix32(args.max_speed or 99999.0))
    builder.set_min_velocity           (Fix32(args.min_speed or 0.0))
    builder.set_init_height            (Fix32(args.height or 0.0))
    builder.set_bind_point             (args.bind_point or '')
    builder.set_collision_type         (args.hit_type or 0)
    builder.set_collision_radius       (Fix32(args.hit_radius or 0.0))
    builder.set_is_face_angle          (args.face_angle or false)
    builder.set_is_multi_collision     (args.hit_same or false)
    builder.set_terrain_block          (args.terrain_block or false)
    builder.set_priority               (args.priority or 1)
    builder.set_is_absolute_height     (args.absolute_height or false)
    builder.set_is_open_init_height    (args.height ~= nil)
    builder.set_is_parabola_height     (args.parabola_height ~= nil)
    builder.set_parabola_height        (Fix32(args.parabola_height or 0.0))
    builder.set_is_open_bind_point     (args.bind_point ~= nil)
    builder.set_target_unit_id         (args.target:get_id())

    return builder
end

---@private
---@param args Mover.CreateData.Curve
---@return table
function M.wrap_curve_args(args)
    ---@param lua_object Point | py.FixedVec2
    ---@return py.FixedVec2
    ---@type py.CurvedPath
    local path = y3.helper.pack_list(args.path, function (lua_object)
        if type(lua_object) == 'userdata' then
            return lua_object
        end
        ---@cast lua_object Point
        return Fix32Vec2(lua_object:get_x(), lua_object:get_y())
    end)

    local builder = CurvedMoverArgs()
    builder.set_angle              (Fix32(args.angle))
    builder.set_max_dist           (Fix32(args.distance))
    builder.set_init_velocity      (Fix32(args.speed))
    builder.set_acceleration       (Fix32(args.acceleration or 0.0))
    builder.set_path               (path)
    builder.set_max_velocity       (Fix32(args.max_speed or 99999.0))
    builder.set_min_velocity       (Fix32(args.min_speed or 0.0))
    builder.set_init_height        (Fix32(args.init_height or 0.0))
    builder.set_fin_height         (Fix32(args.fin_height or 0.0))
    builder.set_collision_type     (args.hit_type or 0)
    builder.set_collision_radius   (Fix32(args.hit_radius or 0.0))
    builder.set_is_face_angle      (args.face_angle or false)
    builder.set_is_multi_collision (args.hit_same or false)
    builder.set_terrain_block      (args.terrain_block or false)
    builder.set_priority           (args.priority or 1)
    builder.set_is_absolute_height (args.absolute_height or false)
    builder.set_is_open_init_height(args.init_height ~= nil)

    return builder
end

---@private
---@param args Mover.CreateData.Round
---@return table
function M.wrap_round_args(args)
    local target = args.target
    local builder = RoundMoverArgs()
    if target.type == 'unit' then
        ---@cast target Unit
        builder.set_is_to_unit(true)
        builder.set_target_unit_id(target:get_id())
    else
        ---@cast target Point
        builder.set_is_to_unit(false)
        -- TODO 见问题2
        ---@diagnostic disable-next-line: param-type-mismatch
        local x, y = target:get_x(), target:get_y()
        builder.set_target_pos(Fix32Vec2(x / 100.0, y / 100.0))
    end
    builder.set_circle_radius          (Fix32(args.radius or 0.0))
    builder.set_angle_velocity         (Fix32(args.angle_speed or 0.0))
    builder.set_init_angle             (Fix32(args.init_angle or 0.0))
    builder.set_counterclockwise       (args.clock_wise == false and 2 or 1)
    builder.set_round_time             (Fix32(args.round_time or 0))
    builder.set_centrifugal_velocity   (Fix32(args.radius_speed or 0.0))
    builder.set_lifting_velocity       (Fix32(args.lifting_speed or 0.0))
    --builder.set_init_height            (Fix32(args.height or 0.0))
    builder.set_collision_type         (args.hit_type or 0)
    builder.set_collision_radius       (Fix32(args.hit_radius or 0.0))
    builder.set_is_face_angle          (args.face_angle or false)
    builder.set_is_multi_collision     (args.hit_same or false)
    builder.set_terrain_block          (args.terrain_block or false)
    builder.set_priority               (args.priority or 1)
    builder.set_is_absolute_height     (args.absolute_height or false)

    return builder
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
    Delete(self)
end

local DUMMY_FUNCTION = function() end

---@param mover_unit Unit|Projectile
---@param mover_data Mover.CreateData.Line
---@return Mover
function M.mover_line(mover_unit, mover_data)
    assert(mover_data.speed,    '缺少字段：speed')
    assert(mover_data.angle,    '缺少字段：angle')
    assert(mover_data.distance, '缺少字段：distance')
    local update_mover, on_hit, on_block, on_finish, on_break, on_remove = M.wrap_callbacks(mover_data)
    local wrapped_args = M.wrap_line_args(mover_data)
    local py_mover = mover_unit.handle:create_mover_trigger(
        wrapped_args,
        'StraightMover',
        on_hit    or DUMMY_FUNCTION,
        on_finish or DUMMY_FUNCTION,
        on_block  or DUMMY_FUNCTION,
        on_break  or DUMMY_FUNCTION,
        on_remove or DUMMY_FUNCTION
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
    assert(mover_data.speed,        '缺少字段：speed')
    assert(mover_data.target_distance, '缺少字段：target_distance')
    assert(mover_data.target,       '缺少字段：target')
    local update_mover, on_hit, on_block, on_finish, on_break, on_remove = M.wrap_callbacks(mover_data)
    local wrapped_args = M.wrap_target_args(mover_data)
    local py_mover = mover_unit.handle:create_mover_trigger(
        wrapped_args,
        'ChasingMover',
        on_hit    or DUMMY_FUNCTION,
        on_finish or DUMMY_FUNCTION,
        on_block  or DUMMY_FUNCTION,
        on_break  or DUMMY_FUNCTION,
        on_remove or DUMMY_FUNCTION
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
    assert(mover_data.speed,    '缺少字段：speed')
    assert(mover_data.angle,    '缺少字段：angle')
    assert(mover_data.distance, '缺少字段：distance')
    local update_mover, on_hit, on_block, on_finish, on_break, on_remove = M.wrap_callbacks(mover_data)
    local wrapped_args = M.wrap_curve_args(mover_data)
    local py_mover = mover_unit.handle:create_mover_trigger(
        wrapped_args,
        'CurvedMover',
        on_hit    or DUMMY_FUNCTION,
        on_finish or DUMMY_FUNCTION,
        on_block  or DUMMY_FUNCTION,
        on_break  or DUMMY_FUNCTION,
        on_remove or DUMMY_FUNCTION
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
    assert(mover_data.target, '缺少字段：target')
    local update_mover, on_hit, on_block, on_finish, on_break, on_remove = M.wrap_callbacks(mover_data)
    local wrapped_args = M.wrap_round_args(mover_data)
    local py_mover = mover_unit.handle:create_mover_trigger(
        wrapped_args,
        'RoundMover',
        on_hit    or DUMMY_FUNCTION,
        on_finish or DUMMY_FUNCTION,
        on_block  or DUMMY_FUNCTION,
        on_break  or DUMMY_FUNCTION,
        on_remove or DUMMY_FUNCTION
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
