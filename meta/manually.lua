---@meta

---@class py.Unit
local Unit = Class 'py.Unit'

---@class py.ProjectileEntity
local Projectile = Class 'py.ProjectileEntity'

---@param luaNumber number
---@return py.Fixed Fixed
function Fix32(luaNumber) end

---@class py.Fixed
---@field float fun(self: self): number

---@alias y3.Const.EventType
---| y3.Const.GlobalEventType
---| y3.Const.UIEventType
---| y3.Const.UnitEventType
---| y3.Const.ItemEventType
---| y3.Const.AbilityEventType
---| y3.Const.ModifierEventType
---| y3.Const.ProjectileEventType
---| y3.Const.PlatformEventType
---| y3.Const.DestructibleEventType

---@param id integer
---@param name string
---@param event y3.Const.EventType | { [1]: y3.Const.EventType, [integer]: any }
---@param init_enabled boolean
---@param addition any
---@return {on_event: fun(trigger: table, event: y3.Const.EventType, actor, data)}
function new_global_trigger(id, name, event, init_enabled, addition) end

---@param unit_id integer
---@param id integer
---@param name string
---@param event y3.Const.EventType | { [1]: y3.Const.EventType, [2]: integer }
---@param init_enabled boolean
function new_unit_trigger(unit_id, id, name, event, init_enabled) end

-- 获取容器大小
---@param obj py.DynamicTypeMeta
---@return integer
function python_len(obj) end

-- 获取容器元素
---@param obj py.DynamicTypeMeta
---@param index integer
---@return any
function python_index(obj, index) end

--------------- 运动器构造 ------------------

---@class py.MoverLineBuilder
---@field set_angle               fun(angle: py.Fixed)
---@field set_max_dist            fun(max_dist: py.Fixed)
---@field set_init_velocity       fun(init_velocity: py.Fixed)
---@field set_acceleration        fun(acceleration: py.Fixed)
---@field set_max_velocity        fun(max_velocity: py.Fixed)
---@field set_min_velocity        fun(min_velocity: py.Fixed)
---@field set_init_height         fun(init_height: py.Fixed)
---@field set_fin_height          fun(fin_height: py.Fixed)
---@field set_parabola_height     fun(parabola_height: py.Fixed)
---@field set_collision_type      fun(collision_type: integer)
---@field set_collision_radius    fun(collision_radius: py.Fixed)
---@field set_is_face_angle       fun(is_face_angle: boolean)
---@field set_is_multi_collision  fun(is_multi_collision: boolean)
---@field set_terrain_block       fun(terrain_block: boolean)
---@field set_priority            fun(priority: integer)
---@field set_is_parabola_height  fun(is_parabola_height: boolean)
---@field set_is_absolute_height  fun(is_absolute_height: boolean)
---@field set_is_open_init_height fun(is_open_init_height: boolean)
---@field set_is_open_fin_height  fun(is_open_fin_height: boolean)

---@class py.MoverTargetBuilder
---@field set_stop_distance_to_target fun(stop_distance: py.Fixed)
---@field set_init_velocity           fun(init_velocity: py.Fixed)
---@field set_acceleration            fun(acceleration: py.Fixed)
---@field set_max_velocity            fun(max_velocity: py.Fixed)
---@field set_min_velocity            fun(min_velocity: py.Fixed)
---@field set_init_height             fun(init_height: py.Fixed)
---@field set_bind_point              fun(bind_point: string)
---@field set_collision_type          fun(collision_type: integer)
---@field set_collision_radius        fun(collision_radius: py.Fixed)
---@field set_is_face_angle           fun(is_face_angle: boolean)
---@field set_is_multi_collision      fun(is_multi_collision: boolean)
---@field set_terrain_block           fun(terrain_block: boolean)
---@field set_priority                fun(priority: integer)
---@field set_is_absolute_height      fun(is_absolute_height: boolean)
---@field set_is_open_init_height     fun(is_open_init_height: boolean)
---@field set_is_parabola_height      fun(is_parabola_height: boolean)
---@field set_parabola_height         fun(parabola_height: py.Fixed)
---@field set_is_open_bind_point      fun(is_open_bind_point: boolean)
---@field set_target_unit_id          fun(target_unit_id: integer)

---@class py.MoverCurveBuilder
---@field set_angle                fun(angle: py.Fixed)
---@field set_max_dist             fun(max_dist: py.Fixed)
---@field set_init_velocity        fun(init_velocity: py.Fixed)
---@field set_acceleration         fun(acceleration: py.Fixed)
---@field set_path                 fun(path: py.CurvedPath)
---@field set_max_velocity         fun(max_velocity: py.Fixed)
---@field set_min_velocity         fun(min_velocity: py.Fixed)
---@field set_init_height          fun(init_height: py.Fixed)
---@field set_fin_height           fun(fin_height: py.Fixed)
---@field set_collision_type       fun(collision_type: integer)
---@field set_collision_radius     fun(collision_radius: py.Fixed)
---@field set_is_face_angle        fun(is_face_angle: boolean)
---@field set_is_multi_collision   fun(is_multi_collision: boolean)
---@field set_terrain_block        fun(terrain_block: boolean)
---@field set_priority             fun(priority: integer)
---@field set_is_absolute_height   fun(is_absolute_height: boolean)
---@field set_is_open_init_height  fun(is_open_init_height: boolean)

---@class py.MoverRoundBuilder
---@field set_is_to_unit             fun(is_to_unit: boolean)
---@field set_target_unit_id         fun(target_unit_id: py.Unit)
---@field set_target_pos             fun(target_pos: py.Point)
---@field set_circle_radius          fun(circle_radius: py.Fixed)
---@field set_angle_velocity         fun(angle_velocity: py.Fixed)
---@field set_init_angle             fun(init_angle: py.Fixed)
---@field set_counterclockwise       fun(counterclockwise: integer)
---@field set_round_time             fun(round_time: py.Fixed)
---@field set_centrifugal_velocity   fun(centrifugal_velocity: py.Fixed)
---@field set_lifting_velocity       fun(lifting_velocity: py.Fixed)
---@field set_around_init_height     fun(around_init_height: py.Fixed)
---@field set_collision_type         fun(collision_type: integer)
---@field set_collision_radius       fun(collision_radius: py.Fixed)
---@field set_is_face_angle          fun(is_face_angle: boolean)
---@field set_is_multi_collision     fun(is_multi_collision: boolean)
---@field set_terrain_block          fun(terrain_block: boolean)
---@field set_priority               fun(priority: integer)
---@field set_is_absolute_height     fun(is_absolute_height: boolean)

-- 直线运动参数生成器
---@return py.MoverLineBuilder
function StraightMoverArgs() end

-- 追踪运动参数生成器
---@return py.MoverTargetBuilder
function ChasingMoverArgs() end

-- 曲线运动参数生成器
---@return py.MoverCurveBuilder
function CurvedMoverArgs() end

-- 环绕运动参数生成器
---@return py.MoverRoundBuilder
function RoundMoverArgs() end

---@param mover_data      table
---@param mode            'StraightMover' | 'ChasingMover' | 'CurvedMover' | 'RoundMover'
---@param unit_collide    fun(mover: py.Mover, unit: py.Unit)
---@param mover_finish    fun(mover: py.Mover)
---@param terrain_collide fun(mover: py.Mover)
---@param mover_interrupt fun(mover: py.Mover)
---@param mover_removed   fun(mover: py.Mover)
---@return py.Mover
function Unit:create_mover_trigger(mover_data, mode, unit_collide, mover_finish, terrain_collide, mover_interrupt, mover_removed) end

---@param mover_data      table
---@param mode            'StraightMover' | 'ChasingMover' | 'CurvedMover' | 'RoundMover'
---@param unit_collide    fun(mover: py.Mover, unit: py.Unit)
---@param mover_finish    fun(mover: py.Mover)
---@param terrain_collide fun(mover: py.Mover)
---@param mover_interrupt fun(mover: py.Mover)
---@param mover_removed   fun(mover: py.Mover)
---@return py.Mover
function Projectile:create_mover_trigger(mover_data, mode, unit_collide, mover_finish, terrain_collide, mover_interrupt, mover_removed) end
