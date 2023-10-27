local seri = require 'y3.tools.serialization'

---@class Dump
local M = Class 'Dump'

---@private
function M.encodeHook(value)
    if type(value) ~= 'table' then
        return
    end
    local luaType = y3.class.type(value)
    if not luaType then
        return
    end
    local class = y3.class.get(luaType)
    if not class.get_by_id then
        return
    end
    local id = value.id
    if not id then
        return
    end
    return {
        class = luaType,
        id    = id,
    }
end

---@private
function M.decodeHook(value)
    local class = y3.class.get(value.class)
    local obj = class.get_by_id(value.id)
    return obj
end

-- 序列化数据
---@param data Serialization.SupportTypes
---@return string
function M.encode(data)
    local bin = seri.encode(data, M.encodeHook)
    return bin
end

-- 反序列化数据
---@param bin string
---@return any
function M.decode(bin)
    local value = seri.decode(bin, M.decodeHook)
    return value
end

return M
