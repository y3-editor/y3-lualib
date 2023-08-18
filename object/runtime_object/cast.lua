---@class Cast
---@field private ability Ability
---@field private cast_id integer
---@overload fun(ability: Ability, cast_id: integer): self
local M = Class 'Cast'

---@class Cast: ObjectEvent
Extends('Cast', 'ObjectEvent')

---@param ability Ability
---@param cast_id integer
---@return self
function M:constructor(ability, cast_id)
    self.ability = ability
    self.cast_id = cast_id
    return self
end

function M:__tostring()
    return string.format('{cast|%d} @ %s'
        , self.cast_id
        , self.ability
    )
end

-- 获取技能
---@return Ability
function M:get_ability()
    return self.ability
end

-- 获取施法方向
---@return number
function M:get_angle()
    local angle = self.ability.handle:api_get_release_direction(self.cast_id)
    if not angle then
        return 0.0
    end
    return angle:float()
end

-- 获取施法目标物品
---@return Item?
function M:get_target_item()
    local py_item = GameAPI.get_target_item_in_ability(self.ability.handle, self.cast_id)
    if not py_item then
        return nil
    end
    return y3.item.get_by_handle(py_item)
end

-- 获取施法目标单位
---@return Unit?
function M:get_target_unit()
    local py_unit = GameAPI.get_target_unit_in_ability(self.ability.handle, self.cast_id)
    if not py_unit then
        return nil
    end
    return y3.unit.get_by_handle(py_unit)
end

-- 获取施法目标可破坏物
---@return Destructible?
function M:get_target_destructible()
    local py_destructible = GameAPI.get_target_dest_in_ability(self.ability.handle, self.cast_id)
    if not py_destructible then
        return nil
    end
    return y3.destructible.get_by_handle(py_destructible)
end

-- 获取施法目标点
---@return Point?
function M:get_target_point()
    local py_point = self.ability.handle:api_get_release_position(self.cast_id)
    if not py_point then
        return nil
    end
    return y3.point.get_by_handle(py_point)
end

return M
