--[[
维护引擎对象的生命状态
目前策略如下：

1. 引擎对象第一次进Lua时，生成对应的Lua对象并添加强引用
2. 引擎对象被引擎回收后，将Lua对象从强引用改为弱引用
--]]

---@class Ref
---@overload fun(className: string, new: (fun(key: Ref.ValidKeyType, ...): any)): self
local M = Class 'Ref'

---@alias Ref.ValidKeyType any

---@type table<string, Ref>
M.all_managers = {}

---@generic T: string
---@param className `T`
---@param new fun(key: Ref.ValidKeyType, ...): T
function M:__init(className, new)
    -- 用于管理的对象类名
    ---@private
    self.className = className
    -- 创建新对象的方法
    ---@private
    self.newMethod = new
    -- 强引用
    ---@private
    self.strongRefMap = {}
    -- 弱引用
    ---@private
    self.weakRefMap = setmetatable({}, y3.util.MODE_K)

    M.all_managers[className] = self
end

---获取指定key的对象，如果不存在，则使用所有的参数创建并返回
---@param key Ref.ValidKeyType
---@param ... any
---@return any
function M:get(key, ...)
    if not key then
        return nil
    end
    local obj = self:fetch(key)
    if obj then
        return obj
    end
    obj = self.newMethod(key, ...)
    if not obj then
        return nil
    end
    self.strongRefMap[key] = obj
    self.weakRefMap[obj] = nil
    return obj
end

---获取指定key
---@param key Ref.ValidKeyType
---@return any
function M:fetch(key)
    local strongRefMap = self.strongRefMap
    if strongRefMap[key] then
        return strongRefMap[key]
    end
    return nil
end

local doNothing = function () end
local dummyHandle = setmetatable({}, {
    __index = function (t, k)
        return doNothing
    end,
    __tostring = function (t)
        return '<DUMMY_HANDLE>'
    end
})

---立即移除指定的key
function M:removeNow(key)
    local obj = self.strongRefMap[key]
    if not obj then
        return
    end
    obj._removed_by_py = true
    obj.handle = dummyHandle
    Delete(obj)
    self.strongRefMap[key] = nil
    self.weakRefMap[obj] = true
end

local logicEntityModuleMap = {
    [2] = 'Unit',
    [3] = 'Projectile',
    [4] = 'LogicItem',
    [5] = 'Destructible',
    [7] = 'Ability',
    [8] = 'Buff',
    [9] = 'Area',
    [10] = 'Item'
}

---黑盒销毁逻辑实体时，使用该方法同步通知Lua层
---@param entity_module integer
---@param entity_uid integer
---@param is_return_to_pool boolean
_G['notify_entity_destroyed'] = function (entity_module, entity_uid, is_return_to_pool)
    local manager = M.all_managers[logicEntityModuleMap[entity_module]]
    if not manager then
        return
    end
    if entity_module == 2 and y3.config.ref.clear_ref_when_unit_return_to_pool and is_return_to_pool then
        local unit = manager:fetch(entity_uid)
        if unit then
            local modifier_manager = M.all_managers["Buff"]
            if modifier_manager then
                for _, uid in pairs(unit.handle:api_get_all_modifier_ids()) do
                    modifier_manager:removeNow(uid);
                end
            end
            
            local ability_manager = M.all_managers["Ability"]
            if ability_manager then
                for _, uid in pairs(unit.handle:api_get_all_ability_id()) do
                    ability_manager:removeNow(uid);
                end
            end
        end
    end
    manager:removeNow(entity_uid)
end

return M
