---@class KV
---@field handle unknown
local M = Class 'KV'

-- 保存自定义键值对。可以与ECA互通。
---@param key string
---@param value boolean|integer|number|string
function M:kv_save(key, value)
    local tp = type(value)
    if tp == 'boolean' then
        GameAPI.add_boolean_kv(self.handle, key, value)
        return
    end
    if tp == 'string' then
        GameAPI.add_string_kv(self.handle, key, value)
        return
    end
    if tp == 'number' then
        if math.type(value) == 'float' then
            GameAPI.add_float_kv(self.handle, key, Fix32(value))
        else
            ---@cast value integer
            GameAPI.add_integer_kv(self.handle, key, value)
        end
        return
    end
    error('不支持的类型：' .. tp)
end

-- 是否拥有指定键值对。可以与ECA互通。
---@param key string
---@return boolean
function M:kv_has(key)
    return GlobalAPI.api_has_kv_any(self.handle, key)
end

---@alias KV.SupportType 'boolean'|'integer'|'number'|'string'

---@param key string
---@param tp KV.SupportType
---@return any
function M:kv_load(key, tp)
    if tp == 'boolean' then
        return GameAPI.get_kv_pair_value_boolean(self.handle, key)
    end
    if tp == 'integer' then
        return GameAPI.get_kv_pair_value_integer(self.handle, key)
    end
    if tp == 'number' then
        return GameAPI.get_kv_pair_value_float(self.handle, key):float()
    end
    if tp == 'string' then
        return GameAPI.get_kv_pair_value_string(self.handle, key)
    end
    error('不支持的类型：' .. tp)
end

return M
