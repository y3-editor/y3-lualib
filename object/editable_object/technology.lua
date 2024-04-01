--科技
---@class Technology
local M = Class 'Technology'

---检查科技类型前置条件
---@param player Player 玩家
---@param tech_key py.TechKey 技能类型id (物编id)
---@return boolean is_meet 技能类型前置条件是否满足
function M.check_precondition_by_key(player, tech_key)
    return GameAPI.check_tech_key_precondition(player.handle, tech_key)
end

return M
