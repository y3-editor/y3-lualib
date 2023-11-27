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
        end
        self.uv_values[i] = value
    end
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
---@param v any
local function build_global_error_message(t, k, v)
    local info = getinfo(3, 'Sl')
    log.warn(string.format('你在本地环境中把全局变量【%s】的值从【%s】修改为了【%s】。\n修改位置：%s:%d'
        , k
        , t[k]
        , v
        , info.short_src
        , info.linedefined
    ))
end

function M:__close()
    for i, old_value in ipairs(self.uv_values) do
        local name, value = getupvalue(self.func, i)
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

M.LOCAL_PLAYER = y3.player.get_by_handle(GameAPI.get_client_role())

---@private
---@param func function
---@return function
function M.wrap_function(func)
    print('wrap function')
    return function (...)
        local _ <close> = New 'LocalPlayer' (func)
        return func(...)
    end
end

---@type Proxy.Config
M.proxy_config = {
    cache = true,
    anyGetter = function (self, raw, key, config, custom)
        local value = raw[key]
        if type(value) == 'table' then
            return y3.proxy.new(value, M.proxy_config, custom .. '.' .. tostring(key))
        elseif type(value) == 'function' then
            M.check_function_in_sandbox(custom, value)
            return value
        else
            return value
        end
    end,
    anySetter = function (self, raw, key, value, config, custom)
        build_global_error_message(self, key, value)
        return value
    end
}

---@param name string
---@param func function
function M.check_function_in_sandbox(name, func)
    --
end

M.sandbox = y3.proxy.new(y3, M.proxy_config, 'y3')

---@param env table
---@return table
function M.wrap_env(env)
    return M.sandbox
end

---@class Player
local Player = Class 'Player'

--在本地玩家环境中执行代码。  
--在开发模式中会阻止这些代码修改上值、修改全局变量、调用同步函数，因此也会产生额外的开销。  
--在平台上不会检测，也不会有额外开销。
---@param callback fun(local_player: Player)
function Player.with_local(callback)
    if not can_use_debug
    or not y3.game.is_debug_mode() then
        callback(M.LOCAL_PLAYER)
        return
    end
    local func = M.wrap_function(callback)
    func(M.LOCAL_PLAYER)
end

return M
