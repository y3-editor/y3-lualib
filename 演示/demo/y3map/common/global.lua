local M = {}

---获取本地玩家，注意这可能会导致不同步！
---@return Player
function M:get_local_player()
    return y3.player.get_by_handle(GameAPI.get_client_role())
end

return M
