local class_type = y3.class.type
local class_get = y3.class.get
local New = New

local encode = require 'y3.tools.serialization'.encode
local decode = require 'y3.tools.serialization'.decode


---@class Dump
local M = Class 'Dump'

---@private
function M.encodeHook(value)
    local luaType = class_type(value)
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
    local class = class_get(tag)
    if class.__decode then
        return class:__decode(value) or New(tag, value)
    else
        return New(tag, value)
    end
end

-- 序列化数据
---@param data Serialization.SupportTypes
---@return string
function M.encode(data)
    local bin = encode(data, M.encodeHook, true)
    return bin
end

-- 反序列化数据
---@param bin string
---@return any
function M.decode(bin)
    local value = decode(bin, M.decodeHook)
    return value
end

return M
