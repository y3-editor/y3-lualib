---@class PyProxy
local M = Class 'PyProxy'

local RAW = {'<RAW>'}

local proxyMT = { __index = function (self, key)
    local raw = self[RAW]
    local f = raw[key]
    if type(f) ~= 'userdata' then
        return f
    end
    local mt = getmetatable(f)
    if not mt then
        return f
    end
    local call = mt.__call
    if not call then
        return f
    end
    local proxyMethod = function (_, ...)
        return call(f, raw, ...)
    end
    self[key] = proxyMethod
    return proxyMethod
end }

local cachedMap = setmetatable({}, { __mode = 'k' })

---@generic T
---@param handle T
---@return T
function M.wrap(handle)
    local p = cachedMap[handle]
    if not p then
        if type(handle) ~= 'userdata' then
            return handle
        end
        p = setmetatable({ [RAW] = handle }, proxyMT)
        cachedMap[handle] = p
    end
    return p
end

---@generic T
---@param handle T
---@return T
function M.unwrap(handle)
    if type(handle) == 'table' then
        return handle[RAW] or handle
    end
    return handle
end

return M
