---@class SceneUI
---@field handle py.SceneNode
---@field res_id? integer
---@overload fun(py_scene_node: py.SceneNode): self
local M = Class 'SceneUI'

M.type = 'scene_ui'

---@param py_scene_node py.SceneNode
---@return self
function M:constructor(py_scene_node)
    self.handle = py_scene_node
    return self
end

M.map = {}

---通过py层的界面实例获取lua层的界面实例
---@param py_scene_node py.SceneNode
---@return SceneUI
function M.get_lua_scene_ui_from_py(py_scene_node)
    local scene_ui = New 'SceneUI' (py_scene_node)
    return scene_ui
end

y3.py_converter.register_type_alias('py.SceneNode', 'SceneUI')
y3.py_converter.register_py_to_lua('py.SceneNode', M.get_lua_scene_ui_from_py)
y3.py_converter.register_lua_to_py('py.SceneNode', function (lua_value)
    return lua_value.handle
end)

---创建场景界面到场景点
---@param  sceneui string 控件
---@param  point Point 点
---@param  range? number 可见距离
---@param  height? number 离地高度
---@return SceneUI scene_ui 场景ui
function M.create_scene_ui_at_point(sceneui, point, range, height)
    -- TODO 见问题2
    ---@diagnostic disable-next-line: param-type-mismatch
    local py_scene_node = GameAPI.create_scene_node_on_point(sceneui, point.handle, range, height)
    local scene_ui = M.get_lua_scene_ui_from_py(py_scene_node)
    return scene_ui
end

--创建场景界面到玩家单位挂点
---@param scene_ui_type string 场景ui类型
---@param player Player 玩家
---@param unit Unit 单位
---@param socket_name string 挂接点名称
---@param distance? number 可见距离
---@return SceneUI scene_ui 场景ui
function M.create_scene_ui_at_player_unit_socket(scene_ui_type, player, unit, socket_name, distance)
    local py_scene_node = GameAPI.create_scene_node_on_unit(scene_ui_type, player.handle, unit.handle, socket_name, distance)
    return M.get_lua_scene_ui_from_py(py_scene_node)
end

--删除场景界面
function M:remove_scene_ui()
    GameAPI.delete_scene_node(self.handle)
end

--设置场景界面对玩家的可见距离
---@param player Player 玩家
---@param dis number 可见距离
function M:set_scene_ui_visible_distance(player,dis)
    GameAPI.set_scene_node_visible_distance(self.handle,player.handle,dis)
end

return M
