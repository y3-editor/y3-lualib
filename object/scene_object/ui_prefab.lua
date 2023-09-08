---@class UIPrefab
---@field handle string
---@field player Player
---@overload fun(player: Player, py_ui_prefab: string): self
local M = Class 'UIPrefab'

M.type = 'ui_prefab'

---@param player Player
---@param ui_name string
---@return self
function M:__init(player, ui_name)
    self.handle = ui_name
    self.player = player
    return self
end

---通过py层的界面实例获取lua层的界面实例
---@param  player Player 玩家
---@param  prefab_name string
---@return UIPrefab # 返回在lua层初始化后的lua层技能实例
function M.get_by_handle(player, prefab_name)
    local ui_prefab = New 'UIPrefab' (player, prefab_name)
    return ui_prefab
end

--创建界面模块实例
---@param  player Player 玩家
---@param  prefab_name string 界面模块id
---@param  parent_ui UI 父控件
---@return UIPrefab
function M.create(player, prefab_name, parent_ui)
    local py_ui_prefab = GameAPI.create_ui_prefab_instance(player.handle, prefab_name, parent_ui.handle)
    return M.get_by_handle(player, py_ui_prefab)
end

--删除界面模块实例
function M:remove()
    GameAPI.del_ui_prefab(self.handle)
end

-- 获取 UIPrefab 的 UI 实例
---@param  player Player 玩家
---@return UI
function M:get_ui(player)
    ---@diagnostic disable-next-line: param-type-mismatch
    return y3.ui.get_by_handle(player, GameAPI.get_ui_prefab_child_by_path(self.handle, ""))
end

return M
