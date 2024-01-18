local require = require

--热重载
--
--热重载相关的方法，详细请看 `演示/热重载`。
---@class Reload
---@overload fun(optional?: Reload.Optional): self
local M = Class "Reload"

---@private
---@type table<string, boolean>
M.includedNameMap = {}

---@private
---@type string[]
M.includedNames = {}

---@alias Reload.beforeReloadCallback fun(reload: Reload, willReload: boolean)

---@private
---@type {name?: string, callback: Reload.beforeReloadCallback}[]
M.beforeReloadCallbacks = {}

---@alias Reload.afterReloadCallback fun(reload: Reload, hasReloaded: boolean)

---@private
---@type {name?: string, callback: Reload.afterReloadCallback}[]
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
end

-- 模块名是否会被重载
---@param name? string
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

function M:fire()
    log.info("=========== 开始清理 ===========")

    local beforeReloadCallbacksNoReload = {}
    local afterReloadCallbacksNoReload  = {}

    for _, data in ipairs(M.beforeReloadCallbacks) do
        local willReload = self:isValidName(data.name)
        if not willReload then
            beforeReloadCallbacksNoReload[#beforeReloadCallbacksNoReload + 1] = data
        end
        xpcall(data.callback, log.error, self, willReload)
    end

    for _, data in ipairs(M.afterReloadCallbacks) do
        local willReload = self:isValidName(data.name)
        if not willReload then
            afterReloadCallbacksNoReload[#afterReloadCallbacksNoReload + 1] = data
        end
    end

    M.beforeReloadCallbacks = beforeReloadCallbacksNoReload
    M.afterReloadCallbacks  = afterReloadCallbacksNoReload

    local needReload        = {}
    for _, name in ipairs(M.includedNames) do
        if self:isValidName(name) then
            needReload[#needReload + 1] = name
        end
    end

    for _, name in ipairs(needReload) do
        package.loaded[name] = nil
    end

    for _, name in ipairs(needReload) do
        M.include(name)
    end

    log.info("=========== 开始重载 ===========")
    for _, data in ipairs(M.afterReloadCallbacks) do
        xpcall(data.callback, log.error, self, self:isValidName(data.name))
    end
end

---@private
M.includeStack = {}

-- 类似于 `require` ，但是会在重载时重新加载文件。
---@param name string
---@return any
function M.include(name)
    if not M.includedNameMap[name] then
        M.includedNameMap[name] = true
        M.includedNames[#M.includedNames + 1] = name
    end
    M.includeStack[#M.includeStack + 1] = name
    local suc, result = xpcall(require, log.error, name)
    M.includeStack[#M.includeStack] = nil
    if not suc then
        return false
    end
    return result
end

---@return string?
function M.getCurrentIncludeName()
    return M.includeStack[#M.includeStack]
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
    local reload = New "Reload" (optional)
    reload:fire()
end

-- 注册在重载之前的回调
---@param callback Reload.beforeReloadCallback
function M.onBeforeReload(callback)
    M.beforeReloadCallbacks[#M.beforeReloadCallbacks + 1] = {
        name     = M.getCurrentIncludeName(),
        callback = callback,
    }
end

-- 注册在重载之后的回调
---@param callback Reload.afterReloadCallback
function M.onAfterReload(callback)
    M.afterReloadCallbacks[#M.afterReloadCallbacks + 1] = {
        name     = M.getCurrentIncludeName(),
        callback = callback,
    }
end

return M
