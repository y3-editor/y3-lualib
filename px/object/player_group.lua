---@class PlayerGroup
local m = y3.玩家组

---@param 玩家或玩家组 PlayerGroup|Player
---@return PlayerGroup
function m.创建于玩家或玩家组(玩家或玩家组)
    if 玩家或玩家组.type == "player" then
        -- local 返回玩家组 = m.创建空玩家组()
        local 返回玩家组 = y3.玩家组.获取所有非中立玩家():清空()
        返回玩家组:添加玩家(玩家或玩家组)
        return 返回玩家组
    else
        return 玩家或玩家组
    end
end
