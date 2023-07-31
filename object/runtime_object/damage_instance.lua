---@class DamageInstance
---@overload fun(data: EventParam.单位-受到伤害后, mode: string): self
local M = Class 'DamageInstance'

---@param data EventParam.单位-受到伤害后
---@param mode '伤害前' | '伤害时' | '伤害后'
function M:constructor(data, mode)
    ---@private
    self.data = data
    ---@private
    self.mode = mode
end

-- 获取关联技能
---@return Ability?
function M:get_ability()
    return self.data.ability
end

-- 获取当前伤害
---@return number
function M:get_damage()
    return self.data.damage:float()
end

-- 修改当前伤害
---@param damage number
function M:set_damage(damage)
    assert(self.mode ~= '伤害后', '不能在伤害后修改伤害')
    GameAPI.set_cur_damage(Fix32(damage))
end

-- 获取当前伤害是否闪避
---@return boolean
function M:is_missed()
    local damage_state = self.data['_py_params']['__damage_result_state']
    return GameAPI.get_cur_damage_is_miss(damage_state)
end

-- 设置当前伤害是否闪避
---@param missed boolean
function M:set_missed(missed)
    assert(self.mode == '伤害前', '只能在伤害前修改伤害是否闪避')
    GameAPI.set_cur_damage_is_miss(missed)
end
