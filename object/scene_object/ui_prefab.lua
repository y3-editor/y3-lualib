---@class UIPrefab
---@field handle string
---@field player Player
---@overload fun(player: Player, py_ui_prefab: string): self
local M = Class 'UIPrefab'

M.type = 'ui_prefab'

---@param player Player
---@param ui_name string
---@return self
function M:constructor(player, ui_name)
    self.handle = ui_name
    self.player = player
    return self
end

---通过py层的界面实例获取lua层的界面实例
---@param  player Player 玩家
---@param  prefab_name string
---@return UIPrefab # 返回在lua层初始化后的lua层技能实例
function M.get_lua_ui_prefab_from_py(player, prefab_name)
    local ui_prefab = New 'UIPrefab' (player, prefab_name)
    return ui_prefab
end

--创建界面模块实例
---@param  player Player 玩家
---@param  prefab_name string 界面模块id
---@param  ui_name string ui实例
---@return UIPrefab
function M.create_ui_prefab_instance(player, prefab_name, ui_name)
    local py_ui_prefab = GameAPI.create_ui_prefab_instance(player.handle,prefab_name,ui_name)
    return M.get_lua_ui_prefab_from_py(player,py_ui_prefab)
end

--删除界面模块实例
function M:remove_ui_prefab()
    GameAPI.del_ui_prefab(self.handle)
end

return M
