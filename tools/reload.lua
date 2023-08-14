---@class Reload
local M = {}

---@private
---@type table<string, string>
M.includedNameMap = {}

---@private
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

-- 进行重载
function M.reload()
    for _, callback in ipairs(M.beforeReloadCallbacks) do
        xpcall(callback, log.error)
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

    for _, callback in ipairs(M.afterReloadCallbacks) do
        xpcall(callback, log.error)
    end
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
