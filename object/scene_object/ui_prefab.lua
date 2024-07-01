--界面元件
---@class UIPrefab
---@field handle string
---@field player Player
---@overload fun(player: Player, py_ui_prefab: string): self
local M = Class 'UIPrefab'

---@class UIPrefab: KV
Extends('UIPrefab', 'KV')

M.type = 'ui_prefab'

---@param player Player
---@param ui_name string
---@return self
function M:__init(player, ui_name)
    self.handle = ui_name
    self.player = player
    return self
end

function M:__del()
    GameAPI.del_ui_prefab(self.handle)
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
    local py_ui_prefab = GameAPI.create_ui_prefab_instance(player.handle, y3.ui.comp_id[prefab_name], parent_ui.handle)
    return M.get_by_handle(player, py_ui_prefab)
end

--删除界面模块实例
function M:remove()
    Delete(self)
end

-- 获取 UIPrefab 的 UI 实例
-->请改用 `get_child` 方法
---@deprecated
---@param  player Player 玩家
---@return UI
function M:get_ui(player)
    ---@diagnostic disable-next-line: param-type-mismatch
    return y3.ui.get_by_handle(player, GameAPI.get_ui_prefab_child_by_path(self.handle, ""))
end

--获取 UIPrefab 的 UI 实例
-->注意！这里的 path 是相对于 *节点第一层之后* 的（就是节点列表里有个默认不能删的节点，那个是第一层）
---@param child_path? string 路径，默认为根节点。
---@return UI?
function M:get_child(child_path)
    ---@diagnostic disable-next-line: param-type-mismatch
    local py_ui = GameAPI.get_ui_prefab_child_by_path(self.handle, '')
    if not py_ui then
        return nil
    end

    local ui = y3.ui.get_by_handle(self.player, py_ui)
    if child_path and #child_path > 0 then
        return ui:get_child(child_path)
    end

    return ui
end

return M
