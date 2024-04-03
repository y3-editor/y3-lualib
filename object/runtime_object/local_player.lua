local must_sync = require 'y3.meta.must_sync'

---@class LocalPlayer
local M = Class 'LocalPlayer'

local getupvalue  = debug and debug.getupvalue
local setupvalue  = debug and debug.setupvalue
local upvaluejoin = debug and debug.upvaluejoin
local getinfo     = debug and debug.getinfo

local can_use_debug = getupvalue ~= nil
                and   setupvalue ~= nil
                and   upvaluejoin ~= nil
                and   getinfo ~= nil
                and   true
                or    false

---@param func function
function M:__init(func)
    self.func = func
    self.uv_values = {}

    for i = 1, 255 do
        local name, value = getupvalue(func, i)
        if not name then
            break
        end
        if value == _ENV then
            value = self:wrap_env_in_upvalue(func, i, value)
        elseif type(value) == 'function' then
            value = self:wrap_function_in_upvalue(func, i, value)
        elseif type(value) == 'table' then
            value = self:wrap_table_in_upvalue(func, i, name, value)
        end
        self.uv_values[i] = value
    end
end

---@param name string
---@return boolean
function M.is_name_must_sync(name)
    if not M.must_sync_name_map then
        M.must_sync_name_map = y3.util.revertMap(must_sync)
    end
    return M.must_sync_name_map[name] ~= nil
end

---@param func function
---@param name string
---@param old_value any
---@param new_value any
local function build_upvalue_error_message(func, name, old_value, new_value)
    local info = getinfo(func, 'Sl')
    log.warn(string.format('你在本地玩家环境中把上值【%s】的值从【%s】修改为了【%s】。为了保证同步已将值恢复。\n环境位置：%s:%d'
        , name
        , old_value
        , new_value
        , info.short_src
        , info.linedefined
    ))
end

---@param t table
---@param k any
---@param old_value any
---@param new_value any
local function build_variable_error_message(t, k, old_value, new_value)
    local info = getinfo(3, 'Sl')
    log.warn(string.format('你在本地环境中把变量【%s】的值从【%s】修改为了【%s】。\n修改位置：%s:%d'
        , k
        , old_value
        , new_value
        , info.short_src
        , info.linedefined
    ))
end

---@param name string
local function build_call_error_message(name)
    log.warn(string.format('不能在本地环境中调用API【%s】\n%s'
        , name
        , debug.traceback()
    ))
end

function M:__close()
    -- TODO
    --目前无法判断本地环境内的局部变量被子函数修改的情况，
    --暂时屏蔽此功能
    do return end
    for i, old_value in ipairs(self.uv_values) do
        local name, value = getupvalue(self.func, i)
        --如果是没代理过的上值，则恢复原样；
        --如果是已经代理过的上值，它的引用已经
        --和真正的上值不是同一个引用了，所以
        --也可以直接修改
        if old_value ~= value then
            setupvalue(self.func, i, old_value)
            build_upvalue_error_message(self.func, name, old_value, value)
        end
    end
end

---@param func function
---@param i integer
---@param value function
---@return function
function M:wrap_function_in_upvalue(func, i, value)
    local wrapped_func = M.wrap_function(value)
    local dummy = function () return wrapped_func end
    upvaluejoin(func, i, dummy, 1)
    return wrapped_func
end

---@param func function
---@param i integer
---@param value table
---@return table
function M:wrap_env_in_upvalue(func, i, value)
    local wrapped_env = M.wrap_env(value)
    local dummy = function () return wrapped_env end
    upvaluejoin(func, i, dummy, 1)
    return wrapped_env
end

---@param func function
---@param i integer
---@param name string
---@param value table
---@return table
function M:wrap_table_in_upvalue(func, i, name, value)
    local wrapped_table = M.wrap_table(name, value)
    local dummy = function () return wrapped_table end
    upvaluejoin(func, i, dummy, 1)
    return wrapped_table
end

M.LOCAL_PLAYER = y3.player.get_by_handle(GameAPI.get_client_role())

M.dont_wrap_this = setmetatable({}, { __mode = 'k' })

---@private
---@param func function
---@return function
function M.wrap_function(func)
    if M.dont_wrap_this[func] then
        return func
    end
    local f = function (...)
        local _ <close> = New 'LocalPlayer' (func)
        return func(...)
    end
    M.dont_wrap_this[f] = true
    return f
end

---@private
---@param name string
---@param tbl table
---@return table
function M.wrap_table(name, tbl)
    if M.dont_wrap_this[tbl] then
        return tbl
    end
    local wrapped_table = y3.proxy.new(tbl, M.proxy_config, name)
    M.dont_wrap_this[wrapped_table] = true
    return wrapped_table
end

---@type Proxy.Config
M.proxy_config = {
    cache = true,
    anyGetter = function (self, raw, key, config, parent_path)
        local value = raw[key]
        if type(value) == 'table' then
            local new_path
            if parent_path == '' then
                new_path = tostring(key)
            else
                new_path = parent_path .. '.' .. tostring(key)
            end
            return y3.proxy.new(value, M.proxy_config, new_path)
        elseif type(value) == 'function' then
            value = M.check_function_in_sandbox(parent_path, value)
            return value
        else
            return value
        end
    end,
    anySetter = function (self, raw, key, value, config, parent_path)
        build_variable_error_message(self, parent_path .. '.' .. tostring(key), self[key], value)
        return value
    end
}

---@param name string
---@param func function
---@return function
function M.check_function_in_sandbox(name, func)
    --检查是否是“有害”函数，如果是则拒绝执行
    if M.is_name_must_sync(name) then
        build_call_error_message(name)
        return function () end
    end
    --包装回调函数
    local info = getinfo(func, 'u')
    if info.nparams == 0 then
        return func
    end
    local wrapped_func = function (...)
        local params = table.pack(...)
        for i, p in ipairs(params) do
            if type(p) == 'function' then
                params[i] = M.wrap_function(p)
            end
        end
        return func(table.unpack(params, 1, params.n))
    end
    return wrapped_func
end

M.sandbox = y3.proxy.new(_G, M.proxy_config, '')

y3.reload.onAfterReload(function ()
    M.sandbox = y3.proxy.new(_G, M.proxy_config, '')
end)

---@param env table
---@return table
function M.wrap_env(env)
    return M.sandbox
end

---@class Player
local Player = Class 'Player'

--在本地玩家环境中执行代码。  
--在开发模式中会阻止这些代码修改上值、修改全局变量、调用同步函数，因此也会产生额外的开销。（暂时失效）  
--在平台上不会检测，也不会有额外开销。
--
------
--
--```lua
--y3.player.with_local(function (local_player)
--    -- 在此回调函数中修改上值、修改全局变量、调用同步函数会给出警告
--    print(local_player)
--end)
--```
---@param callback fun(local_player: Player)
function Player.with_local(callback)
    do
        callback(M.LOCAL_PLAYER)
        return
    end
    if not can_use_debug
    or not y3.game.is_debug_mode() then
        callback(M.LOCAL_PLAYER)
        return
    end
    local func = M.wrap_function(callback)
    func(M.LOCAL_PLAYER)
end

return M
