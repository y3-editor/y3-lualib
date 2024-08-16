---@alias Point.HandleType py.FPoint

--点
---@class Point
---@field handle Point.HandleType
---@field res_id? integer
---@overload fun(py_point: Point.HandleType): self
---@overload fun(x: number, y: number, z?: number): self
local M = Class 'Point'

M.type = 'point'

function M:__tostring()
    return string.format('{Point|%.3f,%.3f,%.3f}'
        , self:get_x()
        , self:get_y()
        , self:get_z()
    )
end

---@param py_point Point.HandleType
---@return self
function M:__init(py_point)
    self.handle = py_point
    return self
end

---@private
---@param x number
---@param y number
---@param z? number
---@return Point
function M:__alloc(x, y, z)
    return M.create(x, y, z)
end

---@private
M.map = {}

---@param res_id integer
---@return Point
function M.get_point_by_res_id(res_id)
    if not M.map[res_id] then
        local py_point = GameAPI.get_point_by_res_id(res_id)
        local point = M.get_by_handle(py_point)
        point.res_id = res_id
        M.map[res_id] = point
    end
    return M.map[res_id]
end

---根据py对象创建点
---@param py_point Point.HandleType
---@return Point
function M.get_by_handle(py_point)
    local point = New 'Point' (py_point)
    return point
end

y3.py_converter.register_type_alias('py.Point', 'Point')
y3.py_converter.register_py_to_lua('py.Point', M.get_by_handle)
y3.py_converter.register_lua_to_py('py.Point', function (lua_value)
    return lua_value.handle
end)
y3.py_converter.register_py_to_lua('py.Vector3', M.get_by_handle)
y3.py_converter.register_lua_to_py('py.Vector3', function (lua_value)
    return lua_value.handle
end)

---点的x坐标
---@return number
function M:get_x()
    if not self.x then
        self.x = GlobalAPI.get_fixed_coord_index(self.handle, 0):float()
    end
    return self.x
end

---点的y坐标
---@return number
function M:get_y()
    if not self.y then
        self.y = GlobalAPI.get_fixed_coord_index(self.handle, 2):float()
    end
    return self.y
end

---点的z坐标
---@return number
function M:get_z()
    if not self.z then
        self.z = GlobalAPI.get_fixed_coord_index(self.handle, 1):float()
    end
    return self.z
end

---@return Point
function M:get_point()
    return self
end

-- 移动点
---@param x number?
---@param y number?
---@param z number?
---@return Point
function M:move(x, y, z)
    local nx = self:get_x() + (x or 0)
    local ny = self:get_y() + (y or 0)
    local nz = self:get_z() + (z or 0)
    return M.create(nx, ny, nz)
end

---坐标转化为点
---@param x number 点X坐标
---@param y number 点Y坐标
---@param z? number 点Z坐标
---@return Point
function M.create(x, y, z)
    ---@diagnostic disable-next-line: param-type-mismatch
    local py_point = GlobalAPI.float_to_vector3(x, z or 0, y)
    -- TODO 见问题2
    ---@diagnostic disable-next-line: param-type-mismatch
    local p = M.get_by_handle(py_point)
    p.x = x
    p.y = y
    p.z = z or 0
    return p
end

---点向方向偏移
---@param point Point 点
---@param direction number 偏移方向点
---@param offset number 偏移量
---@return Point
function M.get_point_offset_vector(point, direction, offset)
    local py_point = GlobalAPI.get_point_offset_vector(point.handle, Fix32(direction), Fix32(offset))
    -- TODO 见问题2
    ---@diagnostic disable-next-line: param-type-mismatch
    return M.get_by_handle(py_point)
end

---路径中的点
---@param path table 目标路径
---@param index integer 索引
---@return Point
function M.get_point_in_path(path,index)
    local py_point = GlobalAPI.get_point_in_route(path.handle, index)
    return M.get_by_handle(py_point)
end

-- 获取与另一个点的方向
---@param other Point
---@return number
function M:get_angle_with(other)
    -- TODO 见问题2
    ---@diagnostic disable-next-line: param-type-mismatch
    return y3.helper.tonumber(GameAPI.get_points_angle(self.handle, other.handle)) or 0.0
end

-- 获取与另一个点的距离
---@param other Point
---@return number
function M:get_distance_with(other)
    -- TODO 见问题2
    ---@diagnostic disable-next-line: param-type-mismatch
    return y3.helper.tonumber(GameAPI.get_points_dis(self.handle, other.handle)) or 0.0
end

--获取圆形范围内的随机点
function M:get_random_point(radius)
    local p = GameAPI.get_random_point_in_circular(self.handle, Fix32(radius))
    ---@diagnostic disable-next-line: param-type-mismatch
    return M.get_by_handle(p)
end

return M
