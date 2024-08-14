local event_datas   = require 'y3.meta.event'
local event_configs = require 'y3.meta.eventconfig'
local game_event    = require 'y3.game.game_event'
local object_event  = require 'y3.game.object_event'

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
    if not event_data then
        return event_params
        --error(string.format('event %s not found', event_key))
    end
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
    local config = event_configs.config[event_name]
    if not config then
        return nil, nil
    end

    local extra_count = extra_args and #extra_args or 0
    if extra_count < #config.params then
        error('事件的参数不足！')
    end
    if not extra_args then
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
        if param.resolve then
            py_args[i] = param.resolve(py_args[i])
        end
    end
    return nil, py_args
end

---@class PYEventRef
---@field count integer
---@field trg_id integer
---@field args? any[]

---@private
---@type table<string, PYEventRef[]>
M.ref_map = y3.util.multiTable(2)

local function args_eq(a, b)
    if a == b then
        return true
    end
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

-- 为参数增加引用计数，返回引用
---@private
---@param name  string
---@param args? any[]
---@return PYEventRef
function M.ref_args(name, args)
    local refs = M.ref_map[name]

    for _, ref in ipairs(refs) do
        if args_eq(ref.args, args) then
            ref.count = ref.count + 1
            return ref
        end
    end

    local ref = {
        count = 1,
        args  = args,
    }
    refs[#refs+1] = ref

    return ref
end

-- 为参数减少引用计数，返回引用
---@private
---@param name  string
---@param args? any[]
---@return PYEventRef
function M.unref_args(name, args)
    local refs = M.ref_map[name]

    for i, ref in ipairs(refs) do
        if args_eq(ref.args, args) then
            ref.count = ref.count - 1
            if ref.count == 0 then
                table.remove(refs, i)
            end
            return ref
        end
    end

    error('未找到事件的引用！' .. tostring(name))
end

--引擎没有提供移除触发器的接口，但是使用已有id注册事件时会移除之前
--使用此id的触发器。因此可以通过复用id来达到移除触发器的目的。

---@private
M.removed_ids = {}

---@private
---@return integer
function M.next_id()
    if #M.removed_ids == 0 then
        return M.trigger_id_counter()
    else
        return table.remove(M.removed_ids)
    end
end

---@private
function M.remove_py_trigger(trigger_id)
    M.removed_ids[#M.removed_ids+1] = trigger_id
end

---@param event_name y3.Const.EventType # 注册给引擎的事件名
---@param extra_args? any[] # 额外参数
function M.event_register(event_name, extra_args)
    local py_event_name = get_py_event_name(event_name)

    local ref = M.ref_args(py_event_name, extra_args)
    if ref.count > 1 then
        return
    end

    ---@type y3.Const.EventType | { [1]: y3.Const.EventType, [integer]: any }
    local py_event = py_event_name
    local py_addition, py_args = extract_addition(event_name, extra_args)
    if py_args and #py_args > 0 then
        table.insert(py_args, 1, py_event_name)
        py_event = py_args
    end

    local trigger_id = M.next_id()
    ref.trg_id = trigger_id
    local py_trigger = new_global_trigger(trigger_id, event_name, py_event, true, py_addition)

    py_trigger.on_event = function (trigger, event, actor, data)
        local lua_params = M.convert_py_params(py_event_name, data)
        game_event.event_notify(event_name, extra_args, lua_params)
        object_event.event_notify(event_name, extra_args, lua_params)
    end

    -- 在初始化时注册的事件会自动启用，但之后注册的事件需要手动启用
    if M.need_enable_trigger_manualy then
        GameAPI.enable_global_lua_trigger(py_trigger)
    end
end

function M.event_unregister(event_name, extra_args)
    local py_event_name = get_py_event_name(event_name)

    local ref = M.unref_args(py_event_name, extra_args)
    if ref.count > 0 then
        return
    end

    local trigger_id = ref.trg_id
    table.insert(M.removed_ids, trigger_id)

    -- 建一个占位的触发器，以尽快释放引用
    local dummy_trigger = new_global_trigger(trigger_id, 'GAME_INIT', 'ET_GAME_INIT', false)
    if M.need_enable_trigger_manualy then
        GameAPI.enable_global_lua_trigger(dummy_trigger)
    end
end

---@param event_id string
---@param callback fun(data: table)
function M.new_global_trigger(event_id, callback)
    local trigger_id = M.next_id()
    local py_trigger = new_global_trigger(trigger_id, event_id, event_id, true)

    py_trigger.on_event = function (trigger, event, actor, data)
        callback(data)
    end
end

y3.ctimer.wait_frame(1, function ()
    M.need_enable_trigger_manualy = true
end)

return M
