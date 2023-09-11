local class = require 'y3.tools.class'

---@alias KV.SupportType
---| boolean
---| integer
---| number
---| string
---| Unit
---| Ability
---| Item
---| Buff
---| Point
---| Player
---| Projectile
---| Destructible
---| Particle
---| Mover

---@enum(key) KV.SupportTypeEnum
local apiAlias = {
    Unit         = 'unit_entity',
    Ability      = 'ability',
    Item         = 'item_entity',
    Buff         = 'modifier_entity',
    Point        = 'point',
    Player       = 'player',
    Projectile   = 'projectile_entity',
    Destructible = 'destructible_entity',
    Particle     = 'sfx_entity',
    Mover        = 'mover_entity',
}

---@class KV
---@field handle unknown
local M = Class 'KV'

-- 保存自定义键值对。可以与ECA互通。
---@param key string
---@param value KV.SupportType
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
    if tp == 'table' then
        local cls = class.type(value)
        local alias = apiAlias[cls]
        if alias then
            ---@cast cls -?
            local api = GameAPI['add_' .. alias .. '_kv']
            if api then
                local py_type = y3.py_converter.get_py_type(cls)
                local py_value = y3.py_converter.lua_to_py(py_type, value)
                api(self.handle, key, py_value)
                return
            end
        end
    end
    error('不支持的类型：' .. tp)
end

-- 是否拥有指定键值对。可以与ECA互通。
---@param key string
---@return boolean
function M:kv_has(key)
    return GlobalAPI.api_has_kv_any(self.handle, key)
end

---@param key string
---@param lua_type 'boolean' | 'number' | 'integer' | 'string' | KV.SupportTypeEnum
---@return any
function M:kv_load(key, lua_type)
    if lua_type == 'boolean' then
        return GameAPI.get_kv_pair_value_boolean(self.handle, key)
    end
    if lua_type == 'integer' then
        return GameAPI.get_kv_pair_value_integer(self.handle, key)
    end
    if lua_type == 'number' then
        return GameAPI.get_kv_pair_value_float(self.handle, key):float()
    end
    if lua_type == 'string' then
        return GameAPI.get_kv_pair_value_string(self.handle, key)
    end
    local alias = apiAlias[lua_type]
    if alias then
        local api = GameAPI['get_kv_pair_value_' .. alias]
        if api then
            local py_type = y3.py_converter.get_py_type(lua_type)
            local py_value = api(self.handle, key)
            local lua_value = y3.py_converter.py_to_lua(py_type, py_value)
            return lua_value
        end
    end
    error('不支持的类型：' .. lua_type)
end

return M
