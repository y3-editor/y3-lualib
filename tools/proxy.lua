---@class Proxy
local Proxy = {}

local RAW = {}

local metatable = {
    __index = function (self, key)
        local v = self[RAW][key]
        self[key] = v
        return v
    end
}


-- 创建一个代理，可以用来代理table或userdata
--
-- 代理的table会缓存访问过的字段，不会重复访问
---@param obj table|userdata
---@return table
function Proxy.new(obj)
    local proxy = setmetatable({
        [RAW] = obj,
    }, metatable)
    return proxy
end

---@param proxyObj table
---@return table|userdata
function Proxy.raw(proxyObj)
    return proxyObj[RAW]
end

return Proxy
