local seri = require 'y3.tools.serialization'

---@class Dump
local M = Class 'Dump'

---@private
function M.encodeHook(value)
    local luaType = y3.class.type(value)
    if not luaType then
        return
    end
    if value.__encode then
        return value:__encode(), luaType
    else
        return value, luaType
    end
end

---@private
function M.decodeHook(value, tag)
    local class = y3.class.get(tag)
    if class.__decode then
        return class:__decode(value) or y3.class.new(tag, value)
    else
        return y3.class.new(tag, value)
    end
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
