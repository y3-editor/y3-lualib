---@class Proxy
local M = {}

local RAW    = {'<RAW>'}
local CONFIG = {'CONFIG'}

---@alias Proxy.Setter fun(self: table, raw: any, key: any, value: any, config: Proxy.Config): any
---@alias Proxy.Getter fun(self: table, raw: any, key: any, config: Proxy.Config): any

---@class Proxy.Config
---@field cache? boolean # 将读写的结果缓存起来，下次读写时不会再触发`setter`,`getter`（除非上次的结果是`nil`
---@field updateRaw? boolean # 是否将赋值写入到 `raw` 中
---@field setter? { [any]: Proxy.Setter }
---@field getter? { [any]: Proxy.Getter }
---@field anySetter? Proxy.Setter # 只有没有对应的 `setter` 才会触发 `anySetter`
---@field anyGetter? Proxy.Getter # 只有没有对应的 `getter` 才会触发 `anyGetter`
local defaultConfig = {
    cache     = true,
    updateRaw = true,
}

local metatable = {
    __newindex = function (self, key, value)
        local raw    = rawget(self, RAW)
        ---@type Proxy.Config
        local config = rawget(self, CONFIG)
        local setter = config.setter and config.setter[key]
        local nvalue
        if setter then
            nvalue = setter(self, raw, key, value, config)
        elseif config.anySetter then
            nvalue = config.anySetter(self, raw, key, value, config)
        else
            nvalue = value
        end
        if config.cache then
            rawset(self, key, nvalue)
        end
        if config.updateRaw then
            raw[key] = value
        end
    end,
    __index = function (self, key)
        local raw    = rawget(self, RAW)
        ---@type Proxy.Config
        local config = rawget(self, CONFIG)
        local getter = config.getter and config.getter[key]
        local value
        if getter then
            value = getter(self, raw, key, config)
        elseif config.anyGetter then
            value = config.anyGetter(self, raw, key, config)
        else
            value = raw[key]
        end
        if config.cache then
            rawset(self, key, value)
        end
        return value
    end,
}

---@generic T
---@param obj T # 要代理的对象
---@param config? Proxy.Config # 配置
---@return T
function M.new(obj, config)
    config = config or defaultConfig
    local proxy = setmetatable({
        [RAW]    = obj,
        [CONFIG] = config,
    }, metatable)
    return proxy
end

---@param proxyObj table
---@return any
function M.raw(proxyObj)
    return proxyObj[RAW]
end

---@param proxyObj table
---@return table
function M.config(proxyObj)
    return proxyObj[CONFIG]
end

return M
