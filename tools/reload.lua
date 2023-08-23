local require = require

---@class Reload
---@overload fun(optional?: Reload.Optional): self
local M = Class 'Reload'

---@private
---@type table<string, string>
M.includedNameMap = {}

---@private
---@type string[]
M.includedNames = {}

---@alias Reload.beforeReloadCallback fun(reload: Reload, willReload: boolean)

---@private
---@type Reload.beforeReloadCallback[]
M.beforeReloadCallbacks = {}

---@alias Reload.afterReloadCallback fun(reload: Reload, hasReloaded: boolean)

---@private
---@type Reload.afterReloadCallback[]
M.afterReloadCallbacks = {}

---@class Reload.Optional
---@field list? string[] -- 要重载的模块列表
---@field filter? fun(name: string, reload: Reload): boolean -- 过滤函数

---@private
---@type Reload.Optional?
M.defaultReloadOptional = nil

---@param optional? Reload.Optional
function M:__init(optional)
    self.optional = optional

    ---@private
    ---@type table<string, any>
    self.validMap = optional and optional.list and y3.util.revertMap(optional.list) --[[@as table<string, any>]]

    ---@private
    self.filter = self.optional and self.optional.filter

    ---@private
    ---@type table<string, string>
    self.includedPathMap = y3.util.revertMap(M.includedNameMap)
end

-- 模块名是否会被重载
---@param name string
---@return boolean
function M:isValidName(name)
    if not self.includedNameMap[name] then
        return false
    end
    if not self.validMap and not self.filter then
        return true
    end
    if self.validMap and self.validMap[name] then
        return true
    end
    if not self.filter then
        return false
    end
    local suc, result = xpcall(self.filter, log.error, name, self)
    if not suc then
        return false
    end
    return result
end

-- 文件名是否会被重载
---@param path string
---@return boolean
function M:isValidPath(path)
    local name = self.includedPathMap[path]
    if not name then
        return false
    end
    return self:isValidName(name)
end

function M:fire()
    local function canBeReload(callback)
        local path = debug.getinfo(callback, 'S').source:match '^@(.+)'
        return self:isValidPath(path)
    end

    log.info('=========== reload start ===========')

    local beforeReloadCallbacksNoReload = {}
    local afterReloadCallbacksNoReload  = {}

    for _, callback in ipairs(M.beforeReloadCallbacks) do
        local willReload = canBeReload(callback)
        if not willReload then
            beforeReloadCallbacksNoReload[#beforeReloadCallbacksNoReload+1] = callback
        end
        xpcall(callback, log.error, self, willReload)
    end

    for _, callback in ipairs(M.afterReloadCallbacks) do
        local willReload = canBeReload(callback)
        if not willReload then
            afterReloadCallbacksNoReload[#afterReloadCallbacksNoReload+1] = callback
        end
    end

    M.beforeReloadCallbacks = beforeReloadCallbacksNoReload
    M.afterReloadCallbacks  = afterReloadCallbacksNoReload

    local needReload = {}
    for _, name in ipairs(M.includedNames) do
        if self:isValidName(name) then
            needReload[#needReload+1] = name
        end
    end

    for _, name in ipairs(needReload) do
        package.loaded[name] = nil
    end

    for _, name in ipairs(needReload) do
        M.include(name)
    end

    self.includedPathMap = y3.util.revertMap(M.includedNameMap)
    for _, callback in ipairs(M.afterReloadCallbacks) do
        xpcall(callback, log.error, self, canBeReload(callback))
    end
    log.info('=========== reload finish ===========')
end

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

-- 设置默认的重载选项
---@param optional? Reload.Optional
function M.setDefaultOptional(optional)
    M.defaultReloadOptional = optional
end

-- 进行重载
---@param optional? Reload.Optional
function M.reload(optional)
    optional = optional or M.defaultReloadOptional
    local reload = New 'Reload' (optional)
    reload:fire()
end

-- 注册在重载之前的回调
---@param callback Reload.beforeReloadCallback
function M.onBeforeReload(callback)
    M.beforeReloadCallbacks[#M.beforeReloadCallbacks+1] = callback
end

-- 注册在重载之后的回调
---@param callback Reload.afterReloadCallback
function M.onAfterReload(callback)
    M.afterReloadCallbacks[#M.afterReloadCallbacks+1] = callback
end

return M
