---@meta

lua_script_path = ''

script_path = ''

---@class py.Unit
local Unit = Class 'py.Unit'

---@class py.Item: py.Actor

---@class py.Destructible: py.Actor

---@class py.ProjectileEntity
local Projectile = Class 'py.ProjectileEntity'

---@param luaNumber number
---@return py.Fixed Fixed
function Fix32(luaNumber) end

---@class py.FixedVec2

---@param x number
---@param y number
---@return py.FixedVec2
function Fix32Vec2(x, y) end

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

-- 获取容器大小
---@param obj py.DynamicTypeMeta
---@return integer
function python_len(obj) end

-- 获取容器元素
---@param obj py.DynamicTypeMeta
---@param index integer
---@return any
function python_index(obj, index) end

-- 设置容器元素
---@param obj py.DynamicTypeMeta
---@param index integer
---@param value any
function set_py_index(obj, index, value) end

python = {}

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

---@param ... any
function consoleprint(...) end

---@class py.GameAPI
GameAPI = {}

---@param comp_uid string
---@param event_type integer
---@param callback function
function GameAPI.bind_local_listener(comp_uid, event_type, callback) end

---@param prefab_name string
---@return string
function GameAPI.get_prefab_ins_id_by_name(prefab_name) end

---@return py.Dict
function GameAPI.lua_get_start_args() end

---@param id string
---@param data string
function broadcast_lua_msg(id, data) end

---@param url string
---@param post? boolean
---@param body? string
---@param port? integer
---@param timeout? number
---@param headers? table
---@param callback? fun(body?: string)
function request_url(url, post, body, port, timeout, headers, callback) end

---@class oslib
os = {}

---@return number
function os.clock_banned() end

---@class py.Dict
---@field [any] any
