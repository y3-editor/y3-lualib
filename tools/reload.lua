local require = require

---@class Reload
local M = {}

---@type table<string, string>
M.includedNameMap = {}

---@type string[]
M.includedNames = {}

---@private
---@type function[]
M.beforeReloadCallbacks = {}

---@private
---@type function[]
M.afterReloadCallbacks = {}

-- 类似于 `require` ，但是会在重载时重新加载文件。
---@param name string
---@return any
function M.include(name)
    local suc, result, path = xpcall(require, log.error, name)
    if not suc then
        return false
    end
    if not M.includedNameMap[name] then
        if not path then
            error(('不能混用 `require` 与 `include` 加载 "%s"'):format(name))
        end
        M.includedNameMap[name] = path
        M.includedNames[#M.includedNames+1] = name
    end
    return result
end

---@class Reload.Optional
---@field list? string[] -- 要重载的模块列表
---@field filter? fun(name: string): boolean -- 过滤函数

-- 进行重载
---@param optional? Reload.Optional
function M.reload(optional)
    local validMap = optional and optional.list and y3.util.revertMap(optional.list)
    local filter = optional and optional.filter
    local includedPathMap = y3.util.revertMap(M.includedNameMap)

    local function canCall(callback)
        if not validMap and not filter then
            return true
        end
        local path = debug.getinfo(callback, 'S').source:match '^@(.+)'
        if not path then
            return true
        end
        local name = includedPathMap[path]
        if not name then
            return true
        end
        if validMap and validMap[name] then
            return true
        end
        local suc, result = xpcall(callback, log.error, name)
        if not suc then
            return true
        end
        return result
    end

    log.info('=========== reload start ===========')
    for _, callback in ipairs(M.beforeReloadCallbacks) do
        if canCall(callback) then
            xpcall(callback, log.error)
        end
    end

    local includedNames   = M.includedNames
    local includedNameMap = M.includedNameMap
    M.includedNames   = {}
    M.includedNameMap = {}
    M.beforeReloadCallbacks = {}
    M.afterReloadCallbacks  = {}

    for _, name in ipairs(includedNames) do
        package.loaded[name] = nil
    end

    for _, name in ipairs(includedNames) do
        M.include(name)
    end

    includedPathMap = y3.util.revertMap(M.includedNameMap)
    for _, callback in ipairs(M.afterReloadCallbacks) do
        if canCall(callback) then
            xpcall(callback, log.error)
        end
    end
    log.info('=========== reload finish ===========')
end

-- 注册在重载之前的回调
---@param callback function
function M.onBeforeReload(callback)
    M.beforeReloadCallbacks[#M.beforeReloadCallbacks+1] = callback
end

-- 注册在重载之后的回调
---@param callback function
function M.onAfterReload(callback)
    M.afterReloadCallbacks[#M.afterReloadCallbacks+1] = callback
end

return M
