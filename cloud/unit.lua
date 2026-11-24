-- 云端单位表现：y3.cloud.unit
-- 收到全量与增量后创建 / 移除表现单位并写入属性；单位只做表现，禁止自动攻击

---@class Cloud.Unit.Data
---@field key py.UnitKey 物编单位 key
---@field x number
---@field y number
---@field face? number 朝向
---@field owner? integer 归属玩家 id

---@class Cloud.Unit
local M = {}

-- 没有归属玩家时用中立玩家创建
local NEUTRAL_PLAYER_ID = 31

---@type table<integer, Unit>
local units = {}

---@type fun(unit: Unit, name: string, value: number): boolean?
local hook

---@param unit Unit
---@param attrs table<string, number>?
local function apply_attrs(unit, attrs)
    if type(attrs) ~= 'table' then
        return
    end
    for name, value in pairs(attrs) do
        local handled = hook and hook(unit, name, value)
        if not handled then
            unit:set_attr(name, value)
        end
    end
end

---@param uid integer
local function remove(uid)
    local unit = units[uid]
    if not unit then
        return
    end
    units[uid] = nil
    unit:remove()
end

---@param uid integer
---@param data Cloud.Unit.Data
local function create(uid, data)
    remove(uid)

    local owner = y3.player.get_by_id(data.owner or NEUTRAL_PLAYER_ID)
    if not owner then
        log.warn('y3.cloud.unit: owner not found, uid=' .. tostring(uid))
        return
    end

    local unit = y3.unit.create_unit(owner, data.key, y3.point(data.x, data.y), data.face or 0)
    unit:add_state('禁止普攻')
    units[uid] = unit
end

---@param list table<integer, Cloud.Unit.Data>?
local function apply_create(list)
    if type(list) ~= 'table' then
        return
    end
    for uid, data in pairs(list) do
        create(uid, data)
    end
end

---@param list table<integer, true>?
local function apply_remove(list)
    if type(list) ~= 'table' then
        return
    end
    for uid in pairs(list) do
        remove(uid)
    end
end

---@param list table<integer, table<string, number>>?
local function apply_attribute(list)
    if type(list) ~= 'table' then
        return
    end
    for uid, attrs in pairs(list) do
        local unit = units[uid]
        if unit then
            apply_attrs(unit, attrs)
        end
    end
end

---@param data any
local function on_sync(data)
    if type(data) ~= 'table' then
        return
    end
    apply_create(data.create)
    apply_remove(data.remove)
    apply_attribute(data.attribute)
end

y3.cloud.rpc.register('Unit.Sync', on_sync)

local function pull()
    y3.cloud.rpc.request('Unit.GetAll', nil, function (suc, data, err)
        if not suc then
            log.warn('y3.cloud.unit: request failed, ' .. tostring(err))
            return
        end

        local list = data and data.units
        if type(list) ~= 'table' then
            return
        end
        for uid in pairs(units) do
            if not list[uid] then
                remove(uid)
            end
        end
        apply_create(list)
        apply_attribute(data.attribute)
    end)
end

y3.cloud.on_ready(pull)

---设置属性钩子；返回 true 表示已由钩子处理，该属性不再写入 Y3
---@param callback fun(unit: Unit, name: string, value: number): boolean?
function M.set_unit_hook(callback)
    hook = callback
end

y3.cloud.unit = M