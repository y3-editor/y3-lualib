---@class Storage
---@overload fun(): self
local M = Class 'Storage'

-- 存储任意值
---@param key any
---@param value any
function M:storage_set(key, value)
    if not self.storage_table then
        ---@private
        self.storage_table = {}
    end
    self.storage_table[key] = value
end

-- 获取存储的值
---@param key any
---@return any
function M:storage_get(key)
    if not self.storage_table then
        return nil
    end
    return self.storage_table[key]
end
