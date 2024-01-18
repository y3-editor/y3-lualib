--界面元件
---@class UIPrefab
---@field handle string
---@field player Player
---@overload fun(player: Player, py_ui_prefab: string): self
local M = Class "UIPrefab"

---@type UIPrefab[]
M.元件表 = {}

M.type = "ui_prefab"

---@private
---@param player Player
---@param ui_name string
---@return self
function M:__init(player, ui_name)
    self.handle = ui_name
    self.player = player
    return self
end

---@private
function M:__del()
    GameAPI.del_ui_prefab(self.handle)
end

---通过py层的界面实例获取lua层的界面实例
---@param  player Player 玩家
---@param  prefab_name string
---@return UIPrefab # 返回在lua层初始化后的lua层技能实例
function M.从handle获取(player, prefab_name)
    local ui_prefab = New "UIPrefab" (player, prefab_name)
    return ui_prefab
end

--创建界面模块实例
---@param  player Player 玩家
---@param  prefab_name string 界面模块id
---@param  parent_ui UI 父控件
---@return UIPrefab
function M.创建(player, prefab_name, parent_ui)
    local py_ui_prefab = GameAPI.create_ui_prefab_instance(player.handle, y3.ui.comp_id[prefab_name], parent_ui.handle)
    local 元件 = M.从handle获取(player, py_ui_prefab)
    table.insert(M.元件表, 元件)
    return 元件
end

--删除界面模块实例
function M:移除()
    Delete(self)
end

-- 获取 UIPrefab 的 UI 实例
---@param path string 路径
---@return UI
function M:获取子控件(path)
    ---@diagnostic disable-next-line: param-type-mismatch
    return y3.ui.从handle获取(self.player, GameAPI.get_ui_prefab_child_by_path(self.handle, path))
end

y3.reload.onBeforeReload(function(reload, willReload)
    for index, value in ipairs(M.元件表) do
        value:移除()
    end
end)

return M
