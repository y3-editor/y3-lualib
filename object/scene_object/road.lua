--路径
---@class Road
---@field handle py.Road
---@field res_id integer
---@overload fun(py_road: py.Road): self
local M = Class 'Road'

---@private
M.map = {}

---@param py_road py.Road
---@return self
function M:__init(py_road)
    self.handle = py_road
    return self
end

---@param res_id integer
---@return Road
function M.get_road_by_res_id(res_id)
    if not M.map[res_id] then
        local py_road = GameAPI.get_road_point_list_by_res_id(res_id)
        local road = M.get_by_handle(py_road)
        road.res_id = res_id
        M.map[res_id] = road
    end
    return M.map[res_id]
end

---@param py_road py.Road
---@return Road
function M.get_by_handle(py_road)
    local road = New 'Road' (py_road)
    return road
end

y3.py_converter.register_py_to_lua('py.Road', M.get_by_handle)
y3.py_converter.register_lua_to_py('py.Road', function (lua_value)
    return lua_value.handle
end)

---路径是否有tag
---@param tag string tag
---@return boolean 路径是否有tag
function M:has_tag(tag)
    return GameAPI.if_road_has_tag(self.handle, tag)
end

---删除路径
function M:remove_path()
    GameAPI.remove_road_point_list(self.handle)
end


---给路径添加点
---@param index integer 序号
---@param point Point 点
function M:add_point(index, point)
    -- TODO 见问题2
    ---@diagnostic disable-next-line: param-type-mismatch
    GameAPI.add_road_point(self.handle, index, point.handle)
end


---给路径移除点
---@param index integer 序号
function M:remove_point(index)
    GameAPI.remove_road_point(self.handle, index)
end


---给路径添加标签
---@param tag string 序号
function M:add_tag(tag)
    GameAPI.add_road_tag(self.handle, tag)
end


---给路径移除标签
---@param tag string 序号
function M:remove_tag(tag)
    GameAPI.remove_road_tag(self.handle, tag)
end

---获取路径中点的个数
---@return integer
function M:get_point_count()
    return GameAPI.get_road_point_num(self.handle)
end




--------------------------------------------------------类的方法--------------------------------------------------------


---以点为起点创建路径
---@param start_point Point 起点
---@return Road 创建的路径
function M.create_path(start_point)
    -- TODO 见问题2
    ---@diagnostic disable-next-line: param-type-mismatch
    local py_path = GameAPI.create_road_point_list(start_point.handle)
    return M.get_by_handle(py_path)
end

---按标签获取所有的路径
---@param tag string 标签
---@return Road[] 路径
function M.get_path_areas_by_tag(tag)
    local py_list = GameAPI.get_roads_by_tag(tag)
    local roads = y3.helper.unpack_list(py_list, M.get_by_handle)
    return roads
end

return M
