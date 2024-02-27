-- 物体编辑器
---@class EditorObject
local M = Class 'EditorObject'

---@class EditorObject.DataModule
---@field private data_key string
local DataModule = Class 'EditorObject.DataModule'

---@diagnostic disable-next-line: undefined-field
DataModule.__getter.data = function (self)
    return GameAPI.api_get_editor_type_data(self.data_key, self.key), true
end

---@class EditorObject.Unit: EditorObject.DataModule
---@field key py.UnitKey
---@field on_create? fun(unit: Unit) # 单位创建后执行
---@field on_remove? fun(unit: Unit) # 单位移除后执行
---@field on_dead? fun(unit: Unit) # 单位死亡后执行
--单位的物编数据，你可以从里面读取或修改任意物编  
--> 警告：请确保数据类型正确，否则可能导致崩溃  
--> 警告：如果创建过此单位再修改数据，行为是未定义的
---@field data Object.Unit
local Unit = Class 'EditorObject.Unit'

Extends('EditorObject.Unit', 'EditorObject.DataModule')
---@class EditorObject.Unit: KV
Extends('EditorObject.Unit', 'KV')
Unit.kv_key = 'unit_key'

---@private
Unit.data_key = 'editor_unit'

function Unit:__init(key)
    self.key = key
end

--以此单位为模板创建新的单位物编
---@return EditorObject.Unit
function Unit:new()
    local new_key = GameAPI.create_unit_editor_data(self.key)
    return M.unit[new_key]
end

---@type table<integer, EditorObject.Unit>
M.unit = y3.util.defaultTable(function (key)
    return New 'EditorObject.Unit' (key)
end)

---@class EditorObject.Item: EditorObject.DataModule
---@field key py.ItemKey
---@field on_add? fun(item: Item) # 物品获得后执行
---@field on_lose? fun(item: Item) # 物品失去后执行
---@field on_create? fun(item: Item) # 物品创建后执行
---@field on_remove? fun(item: Item) # 物品移除后执行
--物品的物编数据，你可以从里面读取或修改任意物编  
--> 警告：请确保数据类型正确，否则可能导致崩溃  
--> 警告：如果创建过此物品再修改数据，行为是未定义的
---@field data Object.Item
local Item = Class 'EditorObject.Item'

Extends('EditorObject.Item', 'EditorObject.DataModule')
---@class EditorObject.Item: KV
Extends('EditorObject.Item', 'KV')
Item.kv_key = 'item_key'

---@private
Item.data_key = 'editor_item'

function Item:__init(key)
    self.key = key
end

--以此物品为模板创建新的物品物编
---@return EditorObject.Item
function Item:new()
    local new_key = GameAPI.create_item_editor_data(self.key)
    return M.item[new_key]
end

---@type table<integer, EditorObject.Item>
M.item = y3.util.defaultTable(function (key)
    return New 'EditorObject.Item' (key)
end)

---@class EditorObject.Buff: EditorObject.DataModule
---@field key py.ModifierKey
---@field on_can_add? fun(buff: Buff) # 效果即将获得时执行
---@field on_add? fun(buff: Buff) # 效果获得后执行
---@field on_lose? fun(buff: Buff) # 效果失去后执行
---@field on_pulse? fun(buff: Buff) # 效果心跳后执行
--魔法效果的物编数据，你可以从里面读取或修改任意物编  
--> 警告：请确保数据类型正确，否则可能导致崩溃  
--> 警告：如果创建过此魔法效果再修改数据，行为是未定义的
---@field data Object.Buff
local Buff = Class 'EditorObject.Buff'

Extends('EditorObject.Buff', 'EditorObject.DataModule')
---@class EditorObject.Buff: KV
Extends('EditorObject.Buff', 'KV')
Buff.kv_key = 'modifier_key'

---@private
Buff.data_key = 'modifier_all'

function Buff:__init(key)
    self.key = key
end

--以此魔法效果为模板创建新的魔法效果物编
---@return EditorObject.Buff
function Buff:new()
    local new_key = GameAPI.create_modifier_editor_data(self.key)
    return M.buff[new_key]
end

---@type table<integer, EditorObject.Buff>
M.buff = y3.util.defaultTable(function (key)
    return New 'EditorObject.Buff' (key)
end)

---@class EditorObject.Ability: EditorObject.DataModule
---@field key py.AbilityKey
---@field on_add? fun(ability: Ability) # 技能获得后执行
---@field on_lose? fun(ability: Ability) # 技能失去后执行
---@field on_cooldown? fun(ability: Ability) # 技能冷却结束后执行
---@field on_upgrade? fun(ability: Ability) # 技能升级后执行
---@field on_can_cast? fun(ability: Ability, cast: Cast) # 技能即将施法时执行
---@field on_cast_start? fun(ability: Ability, cast: Cast) # 技能开始施法时执行
---@field on_cast_channel? fun(ability: Ability, cast: Cast) # 技能引导施法时执行
---@field on_cast_shot? fun(ability: Ability, cast: Cast) # 技能出手施法时执行
---@field on_cast_finish? fun(ability: Ability, cast: Cast) # 技能完成施法时执行
---@field on_cast_stop? fun(ability: Ability, cast: Cast) # 技能停止施法时执行
--技能的物编数据，你可以从里面读取或修改任意物编  
--> 警告：请确保数据类型正确，否则可能导致崩溃  
--> 警告：如果创建过此技能再修改数据，行为是未定义的
---@field data Object.Ability
local Ability = Class 'EditorObject.Ability'

Extends('EditorObject.Ability', 'EditorObject.DataModule')
---@class EditorObject.Ability: KV
Extends('EditorObject.Ability', 'KV')
Ability.kv_key = 'ability_key'

---@private
Ability.data_key = 'ability_all'

function Ability:__init(key)
    self.key = key
end

--以此技能为模板创建新的技能物编
---@return EditorObject.Ability
function Ability:new()
    local new_key = GameAPI.create_ability_editor_data(self.key)
    return M.ability[new_key]
end

---@type table<integer, EditorObject.Ability>
M.ability = y3.util.defaultTable(function (key)
    return New 'EditorObject.Ability' (key)
end)

M.lock_count_map = setmetatable({}, {
    __mode = 'k',
    __index = function (t, k)
        t[k] = 0
        return 0
    end,
})
M.call_stack_map = setmetatable({}, {
    __mode = 'k',
    __index = function (t, k)
        t[k] = {}
        return t[k]
    end,
})

---@param otype string
---@param mname string
---@param key any
---@param lock_obj any
---@param arg1 any
---@param arg2 any
function M.callMethod(otype, mname, key, lock_obj, arg1, arg2)
    local def  = M[otype][key]
    local func = def[mname]
    if not func then
        return
    end
    if not lock_obj then
        xpcall(func, log.error, arg1, arg2)
        return
    end
    local stack = M.call_stack_map[lock_obj]
    if M.lock_count_map[key] > 0 then
        stack[#stack+1] = function ()
            M.callMethod(otype, mname, key, lock_obj, arg1, arg2)
        end
        return
    end
    M.lock_count_map[key] = M.lock_count_map[key] + 1
    xpcall(func, log.error, arg1, arg2)
    M.lock_count_map[key] = M.lock_count_map[key] - 1
    if #stack > 0 and M.lock_count_map[key] == 0 then
        table.remove(stack, 1)()
    end
end

y3.game:event('单位-创建', function (trg, data)
    M.callMethod('unit', 'on_create', data.unit:get_key(), data.unit, data.unit)
end)

y3.game:event('单位-移除', function (trg, data)
    M.callMethod('unit', 'on_remove', data.unit:get_key(), data.unit, data.unit)
end)

y3.game:event('单位-死亡', function (trg, data)
    M.callMethod('unit', 'on_dead', data.unit:get_key(), data.unit, data.unit)
end)

y3.game:event('物品-获得', function (trg, data)
    M.callMethod('item','on_add', data.item_no, data.item, data.item)
end)

y3.game:event('物品-失去', function (trg, data)
    M.callMethod('item', 'on_lose', data.item_no, data.item, data.item)
end)

y3.game:event('物品-创建', function (trg, data)
    M.callMethod('item', 'on_create', data.item:get_key(), data.item, data.item)
end)

y3.game:event('物品-移除', function (trg, data)
    M.callMethod('item', 'on_remove', data.item:get_key(), data.item, data.item)
end)

y3.game:event('效果-即将获得', function (trg, data)
    M.callMethod('buff', 'on_can_add', data.buff:get_key(), nil, data.buff)
end)

y3.game:event('效果-获得', function (trg, data)
    M.callMethod('buff', 'on_add', data.buff:get_key(), data.buff, data.buff)
end)

y3.game:event('效果-失去', function (trg, data)
    M.callMethod('buff', 'on_lose', data.buff:get_key(), data.buff, data.buff)
end)

y3.game:event('效果-心跳', function (trg, data)
    M.callMethod('buff', 'on_pulse', data.buff:get_key(), data.buff, data.buff)
end)

y3.game:event('技能-获得', function (trg, data)
    M.callMethod('ability', 'on_add', data.ability:get_key(), data.ability, data.ability)
end)

y3.game:event('技能-失去', function (trg, data)
    M.callMethod('ability', 'on_lose', data.ability:get_key(), data.ability, data.ability)
end)

y3.game:event('技能-冷却结束', function (trg, data)
    M.callMethod('ability', 'on_cooldown', data.ability:get_key(), data.ability, data.ability)
end)

y3.game:event('技能-升级', function (trg, data)
    M.callMethod('ability', 'on_upgrade', data.ability:get_key(), data.ability, data.ability)
end)

y3.game:event('施法-即将开始', function (trg, data)
    M.callMethod('ability', 'on_can_cast', data.ability:get_key(), nil, data.ability, data.cast)
end)

y3.game:event('施法-开始', function (trg, data)
    M.callMethod('ability', 'on_cast_start', data.ability:get_key(), data.ability, data.ability, data.cast)
end)

y3.game:event('施法-引导', function (trg, data)
    M.callMethod('ability', 'on_cast_channel', data.ability:get_key(), data.ability, data.ability, data.cast)
end)

y3.game:event('施法-出手', function (trg, data)
    M.callMethod('ability', 'on_cast_shot', data.ability:get_key(), data.ability, data.ability, data.cast)
end)

y3.game:event('施法-完成', function (trg, data)
    M.callMethod('ability', 'on_cast_finish', data.ability:get_key(), data.ability, data.ability, data.cast)
end)

y3.game:event('施法-停止', function (trg, data)
    M.callMethod('ability', 'on_cast_stop', data.ability:get_key(), data.ability, data.ability, data.cast)
end)

return M
