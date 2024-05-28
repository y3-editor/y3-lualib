---@class SceneUI
---@field handle py.SceneNode
---@field res_id? integer
---@overload fun(py_scene_node: py.SceneNode): self
local M = Class 'SceneUI'

M.type = 'scene_ui'

---@param py_scene_node py.SceneNode
---@return self
function M:__init(py_scene_node)
    self.handle = py_scene_node
    return self
end

function M:__del()
    GameAPI.delete_scene_node(self.handle)
end

function M:__eq(other)
    return IsInstanceOf(other, 'SceneUI')
        and self.handle == other.handle
end

M.map = {}

---通过py层的界面实例获取lua层的界面实例
---@param py_scene_node py.SceneNode
---@return SceneUI
function M.get_by_handle(py_scene_node)
    local scene_ui = New 'SceneUI' (py_scene_node)
    return scene_ui
end

y3.py_converter.register_type_alias('py.SceneNode', 'SceneUI')
y3.py_converter.register_py_to_lua('py.SceneNode', M.get_by_handle)
y3.py_converter.register_lua_to_py('py.SceneNode', function (lua_value)
    return lua_value.handle
end)

---创建场景界面到场景点
---@param  sceneui string | y3.Const.SceneUI 控件
---@param  point Point 点
---@param  range? number 可见距离
---@param  height? number 离地高度
---@return SceneUI scene_ui 场景ui
function M.create_scene_ui_at_point(sceneui, point, range, height)
    -- TODO 见问题2
    ---@diagnostic disable-next-line: param-type-mismatch
    local py_scene_node = GameAPI.create_scene_node_on_point(y3.const.SceneUI[sceneui] or sceneui, point.handle, range or 10000, height or 0)
    local scene_ui = M.get_by_handle(py_scene_node)
    return scene_ui
end

--获取指定玩家场景ui中的控件
---@param comp_path string # 控件路径
---@param player Player 玩家
---@return UI # UI控件
function M:get_ui_comp_in_scene_ui(player, comp_path)
    local temp_ui = GameAPI.get_ui_comp_in_scene_ui(self.handle, comp_path)
    return y3.ui.get_by_handle(player, temp_ui)
end

--创建场景界面到玩家单位挂点
---@param scene_ui_type string | y3.Const.SceneUI 场景ui类型
---@param player Player 玩家
---@param unit Unit 单位
---@param socket_name string 挂接点名称
---@param distance? number 可见距离
---@param follow_scale? boolean 是否跟随缩放
---@return SceneUI scene_ui 场景ui
function M.create_scene_ui_at_player_unit_socket(scene_ui_type, player, unit, socket_name, distance, follow_scale)
    if follow_scale == nil then
        follow_scale = true
    end
    local py_scene_node = GameAPI.create_scene_node_on_unit_ex(y3.const.SceneUI[scene_ui_type] or scene_ui_type, player.handle, unit.handle, socket_name, follow_scale, distance or 100000)
    return M.get_by_handle(py_scene_node)
end

--删除场景界面
function M:remove_scene_ui()
    Delete(self)
end

--设置场景界面对玩家的可见距离
---@param player Player 玩家
---@param dis number 可见距离
function M:set_scene_ui_visible_distance(player,dis)
    GameAPI.set_scene_node_visible_distance(self.handle,player.handle,dis)
end

return M
