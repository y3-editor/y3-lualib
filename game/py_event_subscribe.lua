local event_data = require 'y3.meta.event'

---@class PYEventRegister
local M = Class 'PYEventRegister'

---@private
M.trigger_id_counter = y3.util.counter()

---@private
---@param event_name y3.Const.EventType
---@param event_params py.Dict
---@return table
function M.convert_py_params(event_name, event_params)
    local event_config = event_data[event_name]
    assert(event_config, string.format('event %s not found', event_name))
    local lua_params = M.convert_py_params_instant(event_name, event_config, event_params)
    --local lua_params = M.convert_py_params_lazy(event_name, event_config, event_params)
    return lua_params
end

---@private
---@param event_name y3.Const.EventType
---@param event_config table
---@param event_params py.Dict
---@return table
function M.convert_py_params_instant(event_name, event_config, event_params)
    local lua_params = {}
    for _, param in ipairs(event_config) do
        local lua_name  = param.lua_name
        local py_name   = param.name
        local py_type   = param.type
        local py_value  = event_params[py_name]
        local lua_value = y3.py_converter.py_to_lua(py_type, py_value)
        lua_params[lua_name] = lua_value
    end
    return lua_params
end

---@private
M.params_metatable_cache = {}

---@private
---@param event_config table
---@return table
function M.build_params_lazy_mt(event_config)
    local mt = {
        __index = function(t, k)
            local param = event_config[k]
            if not param then
                return nil
            end
            local params   = t._py_params
            local py_name  = param.name
            local py_type  = param.type
            local py_value = params[py_name]
            local lua_value = y3.py_converter.py_to_lua(py_type, py_value)
            t[k] = lua_value
            return lua_value
        end,
    }
    return mt
end

---@private
---@param event_name y3.Const.EventType
---@param event_config table
---@param event_params py.Dict
---@return table
function M.convert_py_params_lazy(event_name, event_config, event_params)
    local mt = M.params_metatable_cache[event_name]
    if not mt then
        mt = M.build_params_lazy_mt(event_config)
        M.params_metatable_cache[event_name] = mt
    end
    local lua_params = setmetatable({
        _py_params = event_params
    }, mt)
    return lua_params
end

---@class PYEventRegister.Mark
---@field _event_manager EventManager
---@field [string] true

---@private
---@type table<any, PYEventRegister.Mark>
M.event_mark_map = setmetatable({}, y3.util.MODE_K)

---@param object any
---@param event_name y3.Const.EventType
---@return EventManager
function M.event_register(object, event_name)
    local event_mark = M.event_mark_map[object]
    if not event_mark then
        event_mark = {
            _event_manager = New 'EventManager',
        }
        M.event_mark_map[object] = event_mark
    end
    if event_mark[event_name] then
        return event_mark._event_manager
    end
    event_mark[event_name] = true

    local trigger_id = M.trigger_id_counter()
    local py_trigger = new_global_trigger(trigger_id, event_name, event_name, true)
    local event_manager = event_mark._event_manager

    py_trigger.on_event = function (trigger, event, actor, data)
        local lua_params = M.convert_py_params(event_name, data)
        event_manager:notify(event_name, lua_params)
    end

    return event_manager
end

return M
