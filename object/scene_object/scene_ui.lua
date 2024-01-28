---@class SceneUI
---@field handle py.SceneNode
---@field res_id? integer
---@overload fun(py_scene_node: py.SceneNode): self
local M = Class "SceneUI"

---@type SceneUI[]
M.缓存表 = {}

---@param 当前场景 SceneUI
---@return SceneUI
local function 缓存场景(当前场景)
    return 当前场景
end

M.type = "scene_ui"

---@private
---@param py_scene_node py.SceneNode
---@return self
function M:__init(py_scene_node)
    self.handle = py_scene_node
    return self
end

---@private
function M:__del()
    GameAPI.delete_scene_node(self.handle)
end

M.map = {}

---通过py层的界面实例获取lua层的界面实例
---@param py_scene_node py.SceneNode
---@return SceneUI
function M.从handle获取(py_scene_node)
    local scene_ui = New "SceneUI" (py_scene_node)
    return scene_ui
end

y3.py_converter.register_type_alias("py.SceneNode", "SceneUI")
y3.py_converter.register_py_to_lua("py.SceneNode", M.从handle获取)
y3.py_converter.register_lua_to_py("py.SceneNode", function(lua_value)
    return lua_value.handle
end)

---创建场景界面到场景点
---@param  sceneui string 控件
---@param  point Point 点
---@param  range? number 可见距离
---@param  height? number 离地高度
---@return SceneUI scene_ui 场景ui
function M.创建到点(sceneui, point, range, height)
    -- TODO 见问题2
    ---@diagnostic disable-next-line: param-type-mismatch
    local py_scene_node = GameAPI.create_scene_node_on_point(y3.控件.comp_id[sceneui], point.handle, range or 10000,
                                                             height or 0)
    local scene_ui = M.从handle获取(py_scene_node)
    return 缓存场景(scene_ui)
end

--获取指定玩家场景ui中的控件
---@param comp_path string # 控件路径
---@param player Player 玩家
---@return UI # UI控件
function M:获取子控件(player, comp_path)
    local temp_ui = GameAPI.get_ui_comp_in_scene_ui(self.handle, comp_path)
    return y3.控件.从handle获取(player, temp_ui)
end

--创建场景界面到玩家单位挂点
---@param scene_ui_type string 场景ui类型
---@param player Player 玩家
---@param unit Unit 单位
---@param socket_name string 挂接点名称
---@param distance? number 可见距离
---@return SceneUI scene_ui 场景ui
function M.创建到单位挂接点(scene_ui_type, player, unit, socket_name, distance)
    local py_scene_node = GameAPI.create_scene_node_on_unit(y3.控件.comp_id[scene_ui_type], player.handle, unit.handle,
                                                            socket_name, distance or 10000)
    return 缓存场景(M.从handle获取(py_scene_node))
end

--删除场景界面
function M:移除()
    Delete(self)
end

--设置场景界面对玩家的可见距离
---@param player Player 玩家
---@param dis number 可见距离
function M:设置对玩家的可见距离(player, dis)
    GameAPI.set_scene_node_visible_distance(self.handle, player.handle, dis)
end

y3.reload.onBeforeReload(function(reload, willReload)
    for index, value in ipairs(M.缓存表) do
        value:移除()
    end
end)

return M
