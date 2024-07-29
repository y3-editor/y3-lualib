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
---| UnitGroup
---| UIPrefab

---@enum(key) KV.SupportTypeEnum
local apiAlias = {
    Unit         = 'unit_entity',
    UnitKey      = 'unit_name',
    Ability      = 'ability',
    Item         = 'item_entity',
    Buff         = 'modifier_entity',
    Point        = 'point',
    Player       = 'player',
    Projectile   = 'projectile_entity',
    Destructible = 'destructible_entity',
    Particle     = 'sfx_entity',
    Mover        = 'mover_entity',
    UnitGroup    = 'unit_group',
    UIPrefab     = 'ui_prefab',
}

---@class KV
---@field private handle? unknown
---@field private kv_key? string
---@field private key? integer
local M = Class 'KV'

---@param value KV.SupportType
---@return any
---@return string
local function get_py_value_and_type(value)
    local tp = type(value)
    if tp == 'number' then
        return value, math.type(value)
    end
    if tp == 'table' then
        local cls = class.type(value)
        local alias = apiAlias[cls]
        if cls and alias then
            local py_type = y3.py_converter.get_py_type(cls)
            local py_value = y3.py_converter.lua_to_py(py_type, value)
            return py_value, alias
        else
            return value, tp
        end
    end
    return value, tp
end

---@param handle unknown
---@param key string
---@param value KV.SupportType
local function kv_save_from_handle(handle, key, value)
    local py_value, tp = get_py_value_and_type(value)
    if py_value == nil then
        error('不支持的类型：' .. tp)
    end
    local api = GameAPI['add_' .. tp .. '_kv']
    if not api then
        error('不支持的类型：' .. tp)
    end
    api(handle, key, py_value)
end

---@param kv_key string
---@param object_key integer
---@param key string
---@param value KV.SupportType
local function kv_save_from_key(kv_key, object_key, key, value)
    local py_value, tp = get_py_value_and_type(value)
    if py_value == nil then
        error('不支持的类型：' .. tp)
    end
    local api = GameAPI['set_' .. kv_key .. '_' .. tp .. '_kv']
    if not api then
        error('不支持的类型：' .. tp)
    end
    api(object_key, key, py_value)
end

---@param handle unknown
---@param key string
---@return boolean
local function kv_has_from_handle(handle, key)
    return GlobalAPI.api_has_kv_any(handle, key)
end

---@param kv_key string
---@param object_key integer
---@param key string
---@return boolean
local function kv_has_from_key(kv_key, object_key, key)
    return GameAPI.has_prefab_kv_any(kv_key, object_key, key)
end

---@param handle unknown
---@param key string
local function kv_remove_from_handle(handle, key)
    GlobalAPI.api_remove_kv(handle, key)
end

---@param kv_key string
---@param object_key integer
---@param key string
local function kv_remove_from_key(kv_key, object_key, key)
    local api = GameAPI['del_' .. kv_key .. '_kv']
    api(object_key, key)
end

---@param handle unknown
---@param key string
---@param lua_type 'boolean' | 'number' | 'integer' | 'string' | 'table' | KV.SupportTypeEnum
---@return any
local function kv_load_from_handle(handle, key, lua_type)
    if lua_type == 'boolean' then
        return GameAPI.get_kv_pair_value_boolean(handle, key)
    end
    if lua_type == 'integer' then
        return GameAPI.get_kv_pair_value_integer(handle, key)
    end
    if lua_type == 'number' then
        return y3.helper.tonumber(GameAPI.get_kv_pair_value_float(handle, key)) or 0.0
    end
    if lua_type == 'string' then
        return GameAPI.get_kv_pair_value_string(handle, key)
    end
    if lua_type == 'table' then
        return GameAPI.get_kv_pair_value_table(handle, key)
    end
    local alias = apiAlias[lua_type]
    if alias then
        local api = GameAPI['get_kv_pair_value_' .. alias]
        if api then
            local py_type = y3.py_converter.get_py_type(lua_type)
            local py_value = api(handle, key)
            local lua_value = y3.py_converter.py_to_lua(py_type, py_value)
            return lua_value
        end
    end
    error('不支持的类型：' .. lua_type)
end

---@param kv_key string
---@param object_key integer
---@param key string
---@param lua_type 'boolean' | 'number' | 'integer' | 'string' | 'table' | KV.SupportTypeEnum
---@return any
local function kv_load_from_key(kv_key, object_key, key, lua_type)
    ---@type string
    local py_type = apiAlias[lua_type] or lua_type
    if lua_type == 'number' then
        py_type = 'float'
    end
    local api = GameAPI['get_' .. kv_key .. '_' .. py_type .. '_kv']
    if not api then
        error('不支持的类型：' .. lua_type)
    end
    local py_value = api(object_key, key)
    if py_type == 'float' then
        py_value = py_value:float()
    end
    return py_value
end

-- 保存自定义键值对。可以与ECA互通。
---@param key string
---@param value KV.SupportType
function M:kv_save(key, value)
    if self.handle then
        kv_save_from_handle(self.handle, key, value)
    end
    if self.kv_key then
        kv_save_from_key(self.kv_key, self.key, key, value)
    end
end

-- 是否拥有指定键值对。可以与ECA互通。
---@param key string
---@return boolean
function M:kv_has(key)
    if self.handle then
        return kv_has_from_handle(self.handle, key)
    end
    if self.kv_key then
        return kv_has_from_key(self.kv_key, self.key, key)
    end
    return false
end

function M:kv_remove(key)
    if self.handle then
        kv_remove_from_handle(self.handle, key)
    end
    if self.kv_key then
        kv_remove_from_key(self.kv_key, self.key, key)
    end
end

---@param key string
---@param lua_type 'boolean' | 'number' | 'integer' | 'string' | 'table' | KV.SupportTypeEnum
---@return any
function M:kv_load(key, lua_type)
    if self.handle then
        return kv_load_from_handle(self.handle, key, lua_type)
    end
    if self.kv_key then
        return kv_load_from_key(self.kv_key, self.key, key, lua_type)
    end
    return nil
end

return M
