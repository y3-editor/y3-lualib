--治疗实例
--
--在治疗相关的事件中传递
---@class HealInstance
---@overload fun(data: EventParam.单位-受到治疗后, mode: string): self
local M = Class 'HealInstance'

---@param data EventParam.单位-受到治疗后
---@param mode '治疗前' | '治疗时' | '治疗后'
function M:__init(data, mode)
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

-- 获取当前治疗
---@return number
function M:get_heal()
    return self.data.cured_value
end

-- 修改当前治疗
---@param value number
function M:set_heal(value)
    assert(self.mode ~= '治疗后', '不能在治疗后修改伤害')
    GameAPI.set_cur_cure_value(Fix32(value))
end
