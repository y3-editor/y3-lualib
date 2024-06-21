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

---@class EditorObject.Event
---@field package type string
---@field get_key fun(self: any): integer
local Event = Class 'EditorObject.Event'

local gameEvents = {}

---@param self EditorObject.Event
---@param name string
---@return Trigger
local function initGameEventProxy(self, name)
    local otype = self.type
    local objects = M[otype]
    return y3.game:event(name, function (trg, data)
        local key = data[otype]:get_key()
        local object = objects[key]
        ---@type EventManager?
        local event_manager = object and object.event_manager
        if not event_manager then
            return
        end
        event_manager:notify(name, nil, data)
    end)
end

---@param name string
---@param callback function
---@return Trigger
function Event:event(name, callback)
    if not self.event_manager then
        ---@private
        self.event_manager = New 'EventManager' (self)
    end
    if not gameEvents[name] then
        gameEvents[name] = initGameEventProxy(self, name)
    end
   local trg = self.event_manager:event(name, nil, callback)
   return trg
end

---@class EditorObject.Unit: EditorObject.DataModule
---@field key py.UnitKey
---@field on_create? fun(unit: Unit) # 单位创建后执行
---@field on_remove? fun(unit: Unit) # 单位移除后执行
---@field on_dead? fun(unit: Unit) # 单位死亡后执行
--单位的物编数据，你可以从里面读取或修改任意物编（部分字段无法修改）  
--> 警告：请确保数据类型正确，否则可能导致崩溃  
--> 警告：如果创建过此单位再修改数据，行为是未定义的
---@field data Object.Unit
local Unit = Class 'EditorObject.Unit'

Extends('EditorObject.Unit', 'EditorObject.DataModule')
---@class EditorObject.Unit: EditorObject.Event
Extends('EditorObject.Unit', 'EditorObject.Event')
---@class EditorObject.Unit: KV
Extends('EditorObject.Unit', 'KV')
Unit.kv_key = 'unit_key'

---@private
Unit.data_key = 'editor_unit'

Unit.type = 'unit'

function Unit:__init(key)
    self.key = key
end

--以此单位为模板创建新的单位物编
---@param new_default_key? py.UnitKey
---@param data? table
---@return EditorObject.Unit
function Unit:new(new_default_key, data)
    ---@diagnostic disable: undefined-field
    local new_key = GameAPI.create_unit_editor_data_lua
                and GameAPI.create_unit_editor_data_lua(self.key, new_default_key, data)
                 or GameAPI.create_unit_editor_data(self.key)
    ---@diagnostic enable: undefined-field
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
---@field on_add_to_pkg? fun(item: Item) # 物品进入背包后执行
---@field on_add_to_bar? fun(item: Item) # 物品进入装备栏后执行
---@field on_use? fun(item: Item) # 物品使用时执行
--物品的物编数据，你可以从里面读取或修改任意物编（部分字段无法修改）  
--> 警告：请确保数据类型正确，否则可能导致崩溃  
--> 警告：如果创建过此物品再修改数据，行为是未定义的
---@field data Object.Item
local Item = Class 'EditorObject.Item'

Extends('EditorObject.Item', 'EditorObject.DataModule')
---@class EditorObject.Item: EditorObject.Event
Extends('EditorObject.Item', 'EditorObject.Event')
---@class EditorObject.Item: KV
Extends('EditorObject.Item', 'KV')
Item.kv_key = 'item_key'

---@private
Item.data_key = 'editor_item'

Item.type = 'item'

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
---@field on_stack_change? fun(buff: Buff) # 效果层数变化后执行
--魔法效果的物编数据，你可以从里面读取或修改任意物编（部分字段无法修改）  
--> 警告：请确保数据类型正确，否则可能导致崩溃  
--> 警告：如果创建过此魔法效果再修改数据，行为是未定义的
---@field data Object.Buff
local Buff = Class 'EditorObject.Buff'

Extends('EditorObject.Buff', 'EditorObject.DataModule')
---@class EditorObject.Buff: EditorObject.Event
Extends('EditorObject.Buff', 'EditorObject.Event')
---@class EditorObject.Buff: KV
Extends('EditorObject.Buff', 'KV')
Buff.kv_key = 'modifier_key'

---@private
Buff.data_key = 'modifier_all'

Buff.type = 'buff'

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
--技能的物编数据，你可以从里面读取或修改任意物编（部分字段无法修改）  
--> 警告：请确保数据类型正确，否则可能导致崩溃  
--> 警告：如果创建过此技能再修改数据，行为是未定义的
---@field data Object.Ability
local Ability = Class 'EditorObject.Ability'

Extends('EditorObject.Ability', 'EditorObject.DataModule')
---@class EditorObject.Ability: EditorObject.Event
Extends('EditorObject.Ability', 'EditorObject.Event')
---@class EditorObject.Ability: KV
Extends('EditorObject.Ability', 'KV')
Ability.kv_key = 'ability_key'

---@private
Ability.data_key = 'ability_all'

Ability.type = 'ability'

function Ability:__init(key)
    self.key = key
end

--以此技能为模板创建新的技能物编
---@param new_default_key? py.AbilityKey
---@param data? table
---@return EditorObject.Ability
function Ability:new(new_default_key, data)
    ---@diagnostic disable: undefined-field
    local new_key = GameAPI.create_ability_editor_data_lua
                and GameAPI.create_ability_editor_data_lua(self.key, new_default_key, data)
                 or GameAPI.create_ability_editor_data(self.key)
    ---@diagnostic enable: undefined-field
    return M.ability[new_key]
end

---@type table<integer, EditorObject.Ability>
M.ability = y3.util.defaultTable(function (key)
    return New 'EditorObject.Ability' (key)
end)

---@class EditorObject.Projectile: EditorObject.DataModule
---@field key py.ProjectileKey
---@field on_create? fun(projectile: Projectile) # 投射物创建时执行
---@field on_remove? fun(projectile: Projectile) # 投射物销毁时执行
--投射物的物编数据，你可以从里面读取或修改任意物编（部分字段无法修改）  
--> 警告：请确保数据类型正确，否则可能导致崩溃  
--> 警告：如果创建过此投射物再修改数据，行为是未定义的
---@field data Object.Projectile
local Projectile = Class 'EditorObject.Projectile'

Extends('EditorObject.Projectile', 'EditorObject.DataModule')
---@class EditorObject.Projectile: EditorObject.Event
Extends('EditorObject.Projectile', 'EditorObject.Event')
---@class EditorObject.Projectile: KV
Extends('EditorObject.Projectile', 'KV')
Projectile.kv_key = 'projectile_key'

---@private
Projectile.data_key = 'projectile_all'

Projectile.type = 'projectile'

function Projectile:__init(key)
    self.key = key
end

--以此投射物为模板创建新的投射物
---@return EditorObject.Projectile
function Projectile:new()
    local new_key = GameAPI.create_projectile_editor_data(self.key)
    return M.projectile[new_key]
end

---@type table<integer, EditorObject.Projectile>
M.projectile = y3.util.defaultTable(function (key)
    return New 'EditorObject.Projectile' (key)
end)

--废弃了
do
    ---@package
    M.lock_count_map = setmetatable({}, {
        __mode = 'k',
        __index = function (t, k)
            t[k] = 0
            return 0
        end,
    })
    ---@package
    M.call_stack_map = setmetatable({}, {
        __mode = 'k',
        __index = function (t, k)
            t[k] = {}
            return t[k]
        end,
    })

    local function applyMethod(stack, key, func, arg1, arg2)
        M.lock_count_map[key] = M.lock_count_map[key] + 1
        xpcall(func, log.error, arg1, arg2)
        M.lock_count_map[key] = M.lock_count_map[key] - 1
        if #stack > 0 and M.lock_count_map[key] == 0 then
            table.remove(stack, 1)()
        end
    end

    ---@package
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
                applyMethod(stack, key, func, arg1, arg2)
            end
            return
        end
        applyMethod(stack, key, func, arg1, arg2)
    end

    local function subscribe(class, method, callback)
        local mark
        class.__setter[method] = function (self, value)
            if not mark then
                mark = true
                callback()
            end
            return value
        end
    end

    subscribe(Unit, 'on_create', function ()
        y3.game:event('单位-创建', function (trg, data)
            M.callMethod('unit', 'on_create', data.unit:get_key(), data.unit, data.unit)
        end)
    end)

    subscribe(Unit, 'on_remove', function ()
        y3.game:event('单位-移除', function (trg, data)
            M.callMethod('unit', 'on_remove', data.unit:get_key(), data.unit, data.unit)
        end)
    end)

    subscribe(Unit, 'on_dead', function ()
        y3.game:event('单位-死亡', function (trg, data)
            M.callMethod('unit', 'on_dead', data.unit:get_key(), data.unit, data.unit)
        end)
    end)

    subscribe(Item, 'on_add', function ()
        y3.game:event('物品-获得', function (trg, data)
            M.callMethod('item', 'on_add', data.item:get_key(), data.item, data.item)
        end)
    end)

    subscribe(Item, 'on_lose', function ()
        y3.game:event('物品-失去', function (trg, data)
            M.callMethod('item', 'on_lose', data.item:get_key(), data.item, data.item)
        end)
    end)

    subscribe(Item, 'on_create', function ()
        y3.game:event('物品-创建', function (trg, data)
            M.callMethod('item', 'on_create', data.item:get_key(), data.item, data.item)
        end)
    end)

    subscribe(Item, 'on_remove', function ()
        y3.game:event('物品-移除', function (trg, data)
            M.callMethod('item', 'on_remove', data.item:get_key(), data.item, data.item)
        end)
    end)

    subscribe(Item, 'on_add_to_pkg', function ()
        y3.game:event('物品-进入背包', function(trg, data)
            M.callMethod('item', 'on_add_to_pkg', data.item:get_key(), data.item, data.item)
        end)
    end)

    subscribe(Item, 'on_add_to_bar', function ()
        y3.game:event('物品-进入物品栏', function(trg, data)
            M.callMethod('item', 'on_add_to_bar', data.item:get_key(), data.item, data.item)
        end)
    end)

    subscribe(Item, 'on_use', function ()
        y3.game:event('物品-使用', function(trg, data)
            M.callMethod('item', 'on_use', data.item:get_key(), data.item, data.item)
        end)
    end)

    subscribe(Buff, 'on_can_add', function ()
        y3.game:event('效果-即将获得', function (trg, data)
            M.callMethod('buff', 'on_can_add', data.buff:get_key(), data.buff, data.buff)
        end)
    end)

    subscribe(Buff, 'on_add', function ()
        y3.game:event('效果-获得', function (trg, data)
            M.callMethod('buff', 'on_add', data.buff:get_key(), data.buff, data.buff)
        end)
    end)

    subscribe(Buff, 'on_lose', function ()
        y3.game:event('效果-失去', function (trg, data)
            M.callMethod('buff', 'on_lose', data.buff:get_key(), data.buff, data.buff)
        end)
    end)

    subscribe(Buff, 'on_pulse', function ()
        y3.game:event('效果-心跳', function (trg, data)
            M.callMethod('buff', 'on_pulse', data.buff:get_key(), data.buff, data.buff)
        end)
    end)

    subscribe(Buff, 'on_stack_change', function ()
        y3.game:event('效果-层数变化', function (trg, data)
            M.callMethod('buff', 'on_stack_change', data.buff:get_key(), data.buff, data.buff)
        end)
    end)

    subscribe(Ability, 'on_add', function ()
        y3.game:event('技能-获得', function (trg, data)
            M.callMethod('ability', 'on_add', data.ability:get_key(), data.ability, data.ability)
        end)
    end)

    subscribe(Ability, 'on_lose', function ()
        y3.game:event('技能-失去', function (trg, data)
            M.callMethod('ability', 'on_lose', data.ability:get_key(), data.ability, data.ability)
        end)
    end)

    subscribe(Ability, 'on_cooldown', function ()
        y3.game:event('技能-冷却结束', function (trg, data)
            M.callMethod('ability', 'on_cooldown', data.ability:get_key(), data.ability, data.ability)
        end)
    end)

    subscribe(Ability, 'on_upgrade', function ()
        y3.game:event('技能-升级', function (trg, data)
            M.callMethod('ability', 'on_upgrade', data.ability:get_key(), data.ability, data.ability)
        end)
    end)

    subscribe(Ability, 'on_can_cast', function ()
        y3.game:event('施法-即将开始', function (trg, data)
            M.callMethod('ability', 'on_can_cast', data.ability:get_key(), nil, data.ability, data.cast)
        end)
    end)

    subscribe(Ability, 'on_cast_start', function ()
        y3.game:event('施法-开始', function (trg, data)
            M.callMethod('ability', 'on_cast_start', data.ability:get_key(), nil, data.ability, data.cast)
        end)
    end)

    subscribe(Ability, 'on_cast_channel', function ()
        y3.game:event('施法-引导', function (trg, data)
            M.callMethod('ability', 'on_cast_channel', data.ability:get_key(), nil, data.ability, data.cast)
        end)
    end)

    subscribe(Ability, 'on_cast_shot', function ()
        y3.game:event('施法-出手', function (trg, data)
            M.callMethod('ability', 'on_cast_shot', data.ability:get_key(), nil, data.ability, data.cast)
        end)
    end)

    subscribe(Ability, 'on_cast_finish', function ()
        y3.game:event('施法-完成', function (trg, data)
            M.callMethod('ability', 'on_cast_finish', data.ability:get_key(), nil, data.ability, data.cast)
        end)
    end)

    subscribe(Ability, 'on_cast_stop', function ()
        y3.game:event('施法-停止', function (trg, data)
            M.callMethod('ability', 'on_cast_stop', data.ability:get_key(), nil, data.ability, data.cast)
        end)
    end)

    subscribe(Projectile, 'on_create', function ()
        y3.game:event('投射物-创建', function (trg, data)
            M.callMethod('projectile', 'on_create', data.projectile:get_key(), data.projectile, data.projectile)
        end)
    end)

    subscribe(Projectile, 'on_remove', function ()
        y3.game:event('投射物-死亡', function (trg, data)
            M.callMethod('projectile', 'on_remove', data.projectile:get_key(), data.projectile, data.projectile)
        end)
    end)

end

return M
