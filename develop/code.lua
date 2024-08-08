---@class Develop.Code
local M = {}

---@class Develop.Code.SyncHandler
---@field env? fun(data: any): table? # 返回一个表，用于作为执行环境
---@field complete? fun(suc: boolean, result: any, data: any) # 代码执行后带着结果调用此函数

---@package
---@type table<string, Develop.Code.SyncHandler>
M._sync_handler = {}

local keywords = { 'and', 'break', 'do', 'else', 'elseif', 'end', 'for', 'function', 'if', 'in', 'local', 'or', 'repeat', 'return', 'then', 'until', 'while' }

---@private
function M.wrap_code(code, env)
    local first_token = code:match('^%s*([%w_]+)')
    if not first_token or not y3.util.arrayHas(keywords, first_token) then
        local returnedCode = 'return ' .. code
        local f, err = load(returnedCode, '=code', 't', env or _ENV)
        if f then
            return f, returnedCode
        end
    end
    local f, err = load(code, '=code', 't', env or _ENV)
    if f then
        return f, code
    end
    ---@cast err string
    return nil, nil, (err:gsub('^code:1:', '[Error]: '))
end

---执行本地代码
---@param code string # 要执行的代码
---@param env? table # 执行环境
---@return boolean # 是否执行成功
---@return any # 执行结果
function M.run(code, env)
    local debug_mode = y3.game.is_debug_mode()

    if not debug_mode then
        if not y3.config.code.enable_local then
            log.error('不允许执行本地代码：\n' .. tostring(code))
            return false, '不允许执行本地代码'
        end
    end

    local f, fcode, err = M.wrap_code(code, env)
    if not f then
        return false, err
    end

    if not debug_mode then
        log.warn('执行本地代码：\n' .. fcode)
    end

    local ok, result = pcall(f)
    if not ok then
        return false, result
    end

    if not debug_mode then
        log.debug('执行结果：' .. tostring(result))
    end

    return true, result
end

---广播后同步执行代码，必须由本地发起
---@param code string # 要执行的代码
---@param data? table<string, any> # 数据，代码里可以直接访问到
---@param id? string # 处理器ID
---@return boolean # 是否执行成功
---@return string? # 错误消息
function M.sync_run(code, data, id)
    local debug_mode = y3.game.is_debug_mode()

    if not debug_mode then
        if not y3.config.code.enable_remote then
            log.error('不允许执行远程代码：\n' .. tostring(code))
            return false, '不允许执行远程代码'
        end
    end

    local f, fcode, err = M.wrap_code(code)
    if not f then
        return false, err
    end

    if not debug_mode then
        log.warn('发起远程代码：\n' .. code)
    end

    y3.sync.send('$sync_run', {
        code = code,
        data = data,
        id = id,
    })

    return true
end

y3.sync.onSync('$sync_run', function (data, source)
    ---@cast data table
    local debug_mode = y3.game.is_debug_mode()
    local handler = M._sync_handler[data.id]

    if not debug_mode then
        if not y3.config.code.enable_remote then
            log.error(string.format('%s 广播了远程代码，已拒绝：\n%s'
                , source
                , tostring(data.code)
            ))
            return
        end
        log.warn(string.format('%s 广播了远程代码：\n%s'
            , source
            , tostring(data.code)
        ))
    end

    local env
    if handler and handler.env then
        env = handler.env(data)
    elseif data.data then
        env = setmetatable(data.data, { __index = _ENV })
    end

    local f, fcode, err = M.wrap_code(data.code, env)
    if not f then
        log.error(err)
        return
    end

    local ok, result = pcall(f, data.data)
    if not ok then
        log.error(result)
        if handler and handler.complete then
            handler.complete(false, result, data)
        end
        return
    end

    if not debug_mode then
        log.debug('执行结果：' .. tostring(result))
    end

    if handler and handler.complete then
        handler.complete(true, result, data)
    end
end)

---注册同步处理器
---@param id string
---@param handler Develop.Code.SyncHandler
function M.on_sync(id, handler)
    M._sync_handler[id] = handler
end

return M
