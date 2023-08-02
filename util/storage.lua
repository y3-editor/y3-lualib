---@class Storage
---@overload fun(): self
local M = Class 'Storage'

function M:constructor()
    ---@private
    self.storage_table = {}
end

-- 存储任意值
---@param key any
---@param value any
function M:storage_set(key, value)
    self.storage_table[key] = value
end

-- 获取存储的值
---@param key any
---@return any
function M:storage_get(key)
    return self.storage_table[key]
end
