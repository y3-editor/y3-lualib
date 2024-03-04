---@class UI
local ui = y3.ui

---获取本地玩家
---@return Player
local function get_local_player()
    return y3.player.get_by_handle(GameAPI.get_client_role())
end

local _get_ui = ui.get_ui

---获取UI
---@param ui_path string ui对象路径，自画板一级开始，父节点与子节点使用“.”链接
---@return UI
function ui.get_ui(ui_path)
    local player = get_local_player()
    return _get_ui(player, ui_path)
end
