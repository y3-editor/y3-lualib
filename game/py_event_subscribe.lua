local event_datas   = require 'y3.meta.event'
local event_configs = require 'y3.meta.eventconfig'

---@class PYEventRegister
---@field package need_enable_trigger_manualy boolean
local M = Class 'PYEventRegister'

---@private
M.trigger_id_counter = y3.util.counter()

---@private
---@param event_key y3.Const.EventType
---@param event_params py.Dict
---@return table
function M.convert_py_params(event_key, event_params)
    local event_data = event_datas[event_key]
    assert(event_data, string.format('event %s not found', event_key))
    -- TODO 见问题10，改为用户访问时才会实际访问py层的字段
    --local lua_params = M.convert_py_params_instant(event_name, event_config, event_params)
    local lua_params = M.convert_py_params_lazy(event_key, event_data, event_params)
    return lua_params
end

---@private
---@param event_name y3.Const.EventType
---@param event_data table
---@param event_params py.Dict
---@return table
function M.convert_py_params_instant(event_name, event_data, event_params)
    local lua_params = {}
    for _, param in ipairs(event_data) do
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
---@param event_data table
---@return table
function M.build_params_lazy_mt(event_data)
    local config_map = {}
    for _, param in ipairs(event_data) do
        local lua_name = param.lua_name
        config_map[lua_name] = param
    end
    local mt = {
        __index = function(data, k)
            local param = config_map[k]
            if not param then
                return nil
            end
            local nil_map = data._nil_map
            if nil_map and nil_map[k] then
                return nil
            end
            local lua_value
            if param.lua_code then
                lua_value = param.lua_code(data)
            else
                local params   = data._py_params
                local py_name  = param.name
                local py_type  = param.type
                local py_value = params[py_name]
                lua_value = y3.py_converter.py_to_lua(py_type, py_value)
            end
            data[k] = lua_value
            if lua_value == nil then
                if not nil_map then
                    nil_map = {}
                    data._nil_map = nil_map
                end
                nil_map[k] = true
            end
            return lua_value
        end,
    }
    return mt
end

---@private
---@param event_key y3.Const.EventType
---@param event_data table
---@param event_params py.Dict
---@return table
function M.convert_py_params_lazy(event_key, event_data, event_params)
    if #event_data == 0 then
        return {}
    end
    local mt = M.params_metatable_cache[event_key]
    if not mt then
        mt = M.build_params_lazy_mt(event_data)
        M.params_metatable_cache[event_key] = mt
    end
    local lua_params = setmetatable({
        _py_params = event_params
    }, mt)
    return lua_params
end

---@param event_name string
---@return string
local function get_py_event_name(event_name)
    local config = event_configs.config[event_name]
    if not config then
        return event_name
    end
    return config.key
end

-- 很奇怪的设计，部分参数要包裹成函数返回值放到addition参数里。
-- 如果提取出了需要的参数，会原地修改extra_args。
---@param event_name string
---@param extra_args? any[]
---@return function?
---@return any[]?
local function extract_addition(event_name, extra_args)
    if not extra_args then
        return nil, nil
    end
    local config = event_configs.config[event_name]
    if not config then
        return nil, nil
    end

    local py_args = {}
    for i = 1, #extra_args do
        py_args[i] = extra_args[i]
    end

    for i, param in ipairs(config.params) do
        if param.call then
            local lua_value = extra_args[i]
            local lua_type  = param.type
            local py_type   = y3.py_converter.get_py_type(lua_type)
            local py_value  = y3.py_converter.lua_to_py(py_type, lua_value)
            local py_addition = function ()
                return py_value
            end
            table.remove(py_args, i)
            return py_addition, py_args
        end
    end
    return nil, py_args
end

---@private
---@type table<string, any[][]>
M.mark_subscribed_map = {}

-- 如果已经被标记过，会返回false
---@private
---@param name  string
---@param args? any[]
---@return boolean
function M.mark_subscribed(name, args)
    local args_arr = M.mark_subscribed_map[name]
    if args_arr then
        if not args then
            return false
        end
    else
        args_arr = {}
        M.mark_subscribed_map[name] = args_arr
        if not args then
            return true
        end
    end
    local function eq(a, b)
        if #a ~= #b then
            return false
        end
        for i = 1, #a do
            if a[i] ~= b[i] then
                return false
            end
        end
        return true
    end
    for _, iargs in ipairs(args_arr) do
        if eq(iargs, args) then
            return false
        end
    end
    args_arr[#args_arr+1] = args
    return true
end

---@param event_manager EventManager
---@param event_name y3.Const.EventType # 注册给引擎的事件名
---@param extra_args? any[] # 额外参数
function M.event_register(event_manager, event_name, extra_args)
    local py_event_name = get_py_event_name(event_name)

    if not M.mark_subscribed(py_event_name, extra_args) then
        return
    end

    ---@type y3.Const.EventType | { [1]: y3.Const.EventType, [integer]: any }
    local py_event = py_event_name
    local py_addition, py_args = extract_addition(event_name, extra_args)
    if py_args and #py_args > 0 then
        table.insert(py_args, 1, py_event_name)
        py_event = py_args
    end

    local trigger_id = M.trigger_id_counter()
    local py_trigger = new_global_trigger(trigger_id, event_name, py_event, true, py_addition)

    py_trigger.on_event = function (trigger, event, actor, data)
        local lua_params = M.convert_py_params(py_event_name, data)
        event_manager:dispatch(event_name, extra_args, lua_params)
    end

    -- 在初始化时注册的事件会自动启用，但之后注册的事件需要手动启用
    if M.need_enable_trigger_manualy then
        GameAPI.enable_global_lua_trigger(py_trigger)
    end
end

new_global_trigger(M.trigger_id_counter(), 'GAME_INIT', 'ET_GAME_INIT', true).on_event = function ()
    M.need_enable_trigger_manualy = true
end

return M
