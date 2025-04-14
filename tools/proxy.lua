---@class Proxy
local M = {}

local CONFIG    = {'<CONFIG>'}
local CUSTOM    = {'<CUSTOM>'}
local RECUSIVE  = {'<RECUSIVE>'}
local PATH      = {'<PARENT>'}

local rawMap = setmetatable({}, { __mode = 'k' })

---@alias Proxy.Setter fun(parent: table, raw: any, key: any, value: any, config: Proxy.Config, custom: any): any
---@alias Proxy.Getter fun(parent: table, raw: any, key: any, config: Proxy.Config, custom: any): any

---@class Proxy.Config
---@field cache? boolean # 将读写的结果缓存起来，下次读写时不会再触发`setter`,`getter`（除非上次的结果是`nil`
---@field updateRaw? boolean # 是否将赋值写入到 `raw` 中
---@field recursive? boolean # 是否递归代理
---@field setter? { [any]: Proxy.Setter }
---@field getter? { [any]: Proxy.Getter }
---@field anySetter? Proxy.Setter # 只有没有对应的 `setter` 才会触发 `anySetter`
---@field anyGetter? Proxy.Getter # 只有没有对应的 `getter` 才会触发 `anyGetter`
local defaultConfig = {
    cache     = true,
}

local metatable

local function getRecusiveProxy(parent, key, value, config, custom, recursive)
    value = rawMap[value] or value
    local proxy = recursive[value]
    if proxy then
        return proxy
    end
    if type(value) ~= 'table' and type(value) ~= 'userdata' then
        return value
    end
    proxy = setmetatable({
        [CONFIG]   = config,
        [CUSTOM]   = custom,
        [RECUSIVE] = recursive,
        [PATH]     = { parent, key },
    }, metatable)
    recursive[value] = proxy
    rawMap[proxy] = value
    return proxy
end

metatable = {
    __newindex = function (self, key, value)
        local raw    = rawMap[self]
        ---@type Proxy.Config
        local config = rawget(self, CONFIG)
        local custom = rawget(self, CUSTOM)
        local setter = config.setter and config.setter[key]
        local nvalue
        if setter then
            nvalue = setter(self, raw, key, value, config, custom)
        elseif config.anySetter then
            nvalue = config.anySetter(self, raw, key, value, config, custom)
        else
            nvalue = value
        end
        if config.cache then
            rawset(self, key, nvalue)
        end
        if config.updateRaw then
            raw[key] = nvalue
        end
    end,
    __index = function (self, key)
        local raw    = rawMap[self]
        ---@type Proxy.Config
        local config = rawget(self, CONFIG)
        local custom = rawget(self, CUSTOM)
        local recursive = rawget(self, RECUSIVE)
        local getter = config.getter and config.getter[key]
        local value
        if getter then
            value = getter(self, raw, key, config, custom)
        elseif config.anyGetter then
            value = config.anyGetter(self, raw, key, config, custom)
        else
            value = raw[key]
        end

        if config.cache then
            rawset(self, key, value)
        end

        if recursive then
            value = getRecusiveProxy(self, key, value, config, custom, recursive)
        end

        return value
    end,
    __pairs = function (self)
        local raw = rawMap[self]
        local t = {}
        for k in pairs(raw) do
            t[k] = self[k]
        end
        for k in next, self do
            if k ~= CONFIG and k ~= CUSTOM and k ~= RECUSIVE then
                t[k] = self[k]
            end
        end
        return next, t, nil
    end,
    __len = function (self)
        local raw = rawMap[self]
        return #raw
    end
}

local metaKV = { __mode = 'kv' }

---@generic T
---@param obj T # 要代理的对象
---@param config? Proxy.Config # 配置
---@param custom? any # 自定义数据
---@return T
function M.new(obj, config, custom)
    local tp = type(obj)
    if tp ~= 'table' and tp ~= 'userdata' then
        error('只有table和userdata可以被代理')
    end
    config = config or defaultConfig

    local proxy = {
        [CONFIG] = config,
        [CUSTOM] = custom,
    }

    if config.recursive then
        local recursive = setmetatable({}, metaKV)
        proxy[RECUSIVE] = recursive
        recursive[obj] = proxy
    end

    setmetatable(proxy, metatable)
    rawMap[proxy] = obj

    return proxy
end

---@param proxyObj table
---@return any
function M.raw(proxyObj)
    return rawMap[proxyObj] or proxyObj
end

---@param proxyObj table
---@return any
function M.rawRecusive(proxyObj)
    local obj = rawMap[proxyObj] or proxyObj
    for k, v in pairs(obj) do
        if type(v) == 'table' then
            obj[k] = M.rawRecusive(v)
        end
    end
    return obj
end

---@param proxyObj table
---@return table
function M.config(proxyObj)
    return proxyObj[CONFIG]
end

-- 把数组中的元素顺序*原地*反转
---@param arr any[]
---@return any[]
local function revertArray(arr)
    local len = #arr
    if len <= 1 then
        return arr
    end
    for x = 1, len // 2 do
        local y = len - x + 1
        arr[x], arr[y] = arr[y], arr[x]
    end
    return arr
end

function M.getPath(proxyObj)
    local result = {}
    while proxyObj do
        local path = rawget(proxyObj, PATH)
        if not path then
            break
        end
        local parent, key = path[1], path[2]
        result[#result+1] = key
        proxyObj = parent
    end
    revertArray(result)
    return result
end

return M
