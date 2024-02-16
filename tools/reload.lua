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
---@field 移除对象? {触发器:boolean, 计时器:boolean}

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

---@class Reload.重写函数配置
---@field 缓存 table<integer,any>
---@field 类名 string
---@field 成员名 string
---@field 新方法? fun(缓存:table)
---@field 移除方法 fun(缓存对象:any)
---@field 原函数? fun(...)

---@type table < string, Reload.重写函数配置>
local 重写函数配置 = {
    事件 = {
        缓存 = {},
        类名 = "游戏",
        成员名 = "事件",
        移除方法 = function(缓存对象)
            缓存对象:移除()
        end
    },
    自定义事件 = {
        缓存 = {},
        类名 = "游戏",
        成员名 = "自定义事件",
        移除方法 = function(缓存对象)
            缓存对象:移除()
        end
    },


    计时器_循环执行 = {
        缓存 = {},
        类名 = "计时器",
        成员名 = "循环执行",
        移除方法 = function(缓存对象)
            缓存对象:移除()
        end
    },
    计时器_计次执行 = {
        缓存 = {},
        类名 = "计时器",
        成员名 = "计次执行",
        移除方法 = function(缓存对象)
            缓存对象:移除()
        end
    },

}

---@param 配置 Reload.重写函数配置
local function 函数覆盖(配置)
    y3[配置.类名][配置.成员名] = function(...)
        local 缓存对象 = 配置.原函数(...)
        local _include_name = 缓存对象._include_name
        if _include_name then
            if 配置.缓存[_include_name] == nil then
                配置.缓存[_include_name] = {}
            end
            表_插入指定位置值(配置.缓存[_include_name], 缓存对象)
        end
        return 缓存对象
    end
end

---@param 重载配置 Reload.Optional
local function 应用覆盖函数配置(重载配置)
    if y3.游戏.是否为调试模式() then
        for _, 配置 in pairs(重写函数配置) do
            if 配置.原函数 == nil then
                配置.原函数 = y3[配置.类名][配置.成员名]
            end
        end

        local 对象重载配置 = 重载配置.移除对象
        if 对象重载配置.触发器 then
            函数覆盖(重写函数配置.事件)
            函数覆盖(重写函数配置.自定义事件)
        end
        if 对象重载配置.计时器 then
            函数覆盖(重写函数配置.计时器_循环执行)
            函数覆盖(重写函数配置.计时器_计次执行)
        end
    end
end

local function 移除对象(重载名称)
    for _, 配置 in pairs(重写函数配置) do
        local 需要移除的对象 = 配置.缓存[重载名称]
        if 需要移除的对象 then
            if #需要移除的对象 > 0 then
                调试输出(字符串格式化("移除缓存 %s %s - %d", 重载名称, 配置.类名 .. "." .. 配置.成员名, #需要移除的对象))
            end
            for index, 缓存对象 in ipairs(需要移除的对象) do
                -- 调试输出(表_到字符串(缓存对象))
                if 配置.移除方法 then
                    配置.移除方法(缓存对象)
                end
            end
            配置.缓存[重载名称] = {}
        end
    end
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
        移除对象(name)
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
    应用覆盖函数配置(optional)
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
function M.事件_重载之前(callback)
    M.beforeReloadCallbacks[#M.beforeReloadCallbacks + 1] = {
        name     = M.getCurrentIncludeName(),
        callback = callback,
    }
end

-- 注册在重载之后的回调
---@param callback Reload.afterReloadCallback
function M.事件_重载之后(callback)
    M.afterReloadCallbacks[#M.afterReloadCallbacks + 1] = {
        name     = M.getCurrentIncludeName(),
        callback = callback,
    }
end

return M
