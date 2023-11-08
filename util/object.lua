-- 物体编辑器
---@class Editor.Object
local M = Class 'Editor.Object'

---@class Editor.Object.DataModule
---@field private data_key string
local DataModule = Class 'Editor.Object.DataModule'

---@diagnostic disable-next-line: undefined-field
DataModule.__getter.data = function (self)
    return GameAPI.api_get_editor_type_data(self.data_key, self.key), true
end

---@class Editor.Object.Unit: Editor.Object.DataModule
---@field key py.UnitKey
---@field on_create? fun(unit: Unit) # 单位创建后执行
---@field on_remove? fun(unit: Unit) # 单位移除后执行
---@field on_dead? fun(unit: Unit) # 单位死亡后执行
--单位的物编数据，你可以从里面读取或修改任意物编  
--> 警告：请确保数据类型正确，否则可能导致崩溃  
--> 警告：如果创建过此单位再修改数据，行为是未定义的
---@field data Object.Unit
local Unit = Class 'Editor.Object.Unit'

Extends('Editor.Object.Unit', 'Editor.Object.DataModule')

---@private
Unit.data_key = 'editor_unit'

function Unit:__init(key)
    self.key = key
end

---@type table<integer, Editor.Object.Unit>
M.unit = y3.util.defaultTable(function (key)
    return New 'Editor.Object.Unit' (key)
end)

---@class Editor.Object.Item: Editor.Object.DataModule
---@field key py.ItemKey
---@field on_add? fun(item: Item) # 物品获得后执行
---@field on_lose? fun(item: Item) # 物品失去后执行
---@field on_create? fun(item: Item) # 物品创建后执行
---@field on_remove? fun(item: Item) # 物品移除后执行
--物品的物编数据，你可以从里面读取或修改任意物编  
--> 警告：请确保数据类型正确，否则可能导致崩溃  
--> 警告：如果创建过此物品再修改数据，行为是未定义的
---@field data Object.Item
local Item = Class 'Editor.Object.Item'

Extends('Editor.Object.Item', 'Editor.Object.DataModule')

function Item:__init(key)
    self.key = key
end

---@type table<integer, Editor.Object.Item>
M.item = y3.util.defaultTable(function (key)
    return New 'Editor.Object.Item' (key)
end)

---@class Editor.Object.Buff: Editor.Object.DataModule
---@field key py.ModifierKey
---@field on_can_add? fun(buff: Buff) # 效果即将获得时执行
---@field on_add? fun(buff: Buff) # 效果获得后执行
---@field on_lose? fun(buff: Buff) # 效果失去后执行
---@field on_pulse? fun(buff: Buff) # 效果心跳后执行
--魔法效果的物编数据，你可以从里面读取或修改任意物编  
--> 警告：请确保数据类型正确，否则可能导致崩溃  
--> 警告：如果创建过此魔法效果再修改数据，行为是未定义的
---@field data Object.Buff
local Buff = Class 'Editor.Object.Buff'

Extends('Editor.Object.Buff', 'Editor.Object.DataModule')

function Buff:__init(key)
    self.key = key
end

---@type table<integer, Editor.Object.Buff>
M.buff = y3.util.defaultTable(function (key)
    return New 'Editor.Object.Buff' (key)
end)

---@class Editor.Object.Ability: Editor.Object.DataModule
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
---@field data Object.Ability: Class.Base
local Ability = Class 'Editor.Object.Ability'

Extends('Editor.Object.Ability', 'Editor.Object.DataModule')

function Ability:__init(key)
    self.key = key
end

---@type table<integer, Editor.Object.Ability>
M.ability = y3.util.defaultTable(function (key)
    return New 'Editor.Object.Ability' (key)
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
    M.callMethod('item',' on_add', data.item_no, data.item, data.item)
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
