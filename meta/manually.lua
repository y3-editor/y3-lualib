---@meta

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
---@param event y3.Const.EventType | { [1]: y3.Const.EventType, [2]: integer }
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
