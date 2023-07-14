local event_data = require 'y3.meta.event'
local game_event = require 'y3.meta.gameevent'

---@class PYEventRegister
---@field package need_enable_trigger_manualy boolean
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
    -- TODO 见问题10，改为用户访问时才会实际访问py层的字段
    --local lua_params = M.convert_py_params_instant(event_name, event_config, event_params)
    local lua_params = M.convert_py_params_lazy(event_name, event_config, event_params)
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
    local config_map = {}
    for _, param in ipairs(event_config) do
        local lua_name  = param.lua_name
        config_map[lua_name] = param
    end
    local mt = {
        __index = function(t, k)
            local param = config_map[k]
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
    if #event_config == 0 then
        return {}
    end
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

---@private
---@type table<any, EventManager>
M.event_mark_map = setmetatable({}, y3.util.MODE_K)

---@param event_name string
---@return string
local function get_py_event_name(event_name)
    local alias = game_event.alias_map[event_name]
    if not alias then
        return event_name
    end
    return alias.key
end

-- 很奇怪的设计，部分参数要包裹成函数返回值放到addition参数里。
-- 如果提取出了需要的参数，会原地修改extra_args。
---@param event_name string
---@param extra_args? any[]
---@return function?
local function extract_addition(event_name, extra_args)
    if not extra_args then
        return nil
    end
    local alias = game_event.alias_map[event_name]
    if not alias then
        return nil
    end
    for i, param in ipairs(alias.params) do
        if param.call then
            local lua_value = extra_args[i]
            table.remove(extra_args, i)
            local lua_type  = param.type
            local py_type   = y3.py_converter.get_py_type(lua_type)
            local py_value  = y3.py_converter.lua_to_py(py_type, lua_value)
            return function ()
                return py_value
            end
        end
    end
    return nil
end

---@param object any
---@param event_name y3.Const.EventType # 注册给引擎的事件名
---@param extra_args? any[] # 额外参数
---@return EventManager
function M.event_register(object, event_name, extra_args)
    local py_event_name = get_py_event_name(event_name)
    local event_manager = M.event_mark_map[object]
    if not event_manager then
        event_manager = New 'EventManager' ()
        M.event_mark_map[object] = event_manager
    end
    if event_manager:has_event(event_name, extra_args) then
        return event_manager
    end
    ---@type y3.Const.EventType | { [1]: y3.Const.EventType, [integer]: any }
    local py_event = py_event_name
    local py_addition = extract_addition(event_name, extra_args)
    if extra_args and #extra_args > 0 then
        table.insert(extra_args, 1, py_event_name)
        py_event = extra_args
    end

    local trigger_id = M.trigger_id_counter()
    local py_trigger = new_global_trigger(trigger_id, event_name, py_event, true, py_addition)

    py_trigger.on_event = function (trigger, event, actor, data)
        local lua_params = M.convert_py_params(py_event_name, data)
        if extra_args then
            event_manager:notify_with_args(event_name, extra_args, lua_params)
        else
            event_manager:notify(event_name, lua_params)
        end
    end

    -- 在初始化时注册的事件会自动启用，但之后注册的事件需要手动启用
    if M.need_enable_trigger_manualy then
        GameAPI.enable_global_lua_trigger(py_trigger)
    end

    return event_manager
end

new_global_trigger(M.trigger_id_counter(), 'GAME_INIT', 'ET_GAME_INIT', true).on_event = function ()
    M.need_enable_trigger_manualy = true
end

return M
