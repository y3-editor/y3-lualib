local function getInnerDebugger()
    local path
    pcall(function ()
        path = require 'log.debugger_path'
    end)
    return path
end

local function dofile(filename)
    local f = assert(io.open(filename))
    local str = f:read "*a"
    f:close()
    return assert(load(str, "=(debugger.lua)"))(filename)
end

local function isDebuggerValid()
    if arg['lua_multi_mode'] == 'true' then
        local id = GameAPI.get_client_role():get_role_id_num()
        for i in arg['lua_multi_debug_players']:gmatch('%d+') do
            if tonumber(i) == id then
                return true
            end
        end
        return false
    end
    return true
end

local function getDebuggerPort()
    if arg['lua_multi_mode'] == 'true' then
        local id = GameAPI.get_client_role():get_role_id_num()
        return 12399 - id
    else
        return 12399
    end
end

local function waitDebugger(forceWait)
    if arg['lua_wait_debugger'] == 'true'
    or arg['lua_multi_wait_debugger'] == 'true'
    or forceWait then
        do
            local _ <close> = io.open(script_path:match('^(.-)%?') .. '/.log/wait_debugger', 'w')
        end
        LDBG:event 'wait'
    end
end

pcall(function ()
    if not isDebuggerValid() then
        return
    end

    local path = getInnerDebugger()
    local dbg = dofile(path .. "/script/debugger.lua")

    local port = getDebuggerPort()
    LDBG = dbg:start("127.0.0.1:" .. tostring(port))
    if not LDBG then
        return
    end

    -- 关闭调试器的自动更新，之后每帧手动更新一次
    LDBG:event('autoUpdate', false)

    -- 等待调试器连接
    waitDebugger(false)
end)
