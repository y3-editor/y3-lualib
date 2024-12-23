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
    return value:__encode(), luaType
end

---@private
function M.decodeHook(value, tag)
    local class = y3.class.get(tag)
    local obj = class:__decode(value)
    return obj
end

-- 序列化数据
---@param data Serialization.SupportTypes
---@return string
function M.encode(data)
    local bin = seri.encode(data, M.encodeHook, true)
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
