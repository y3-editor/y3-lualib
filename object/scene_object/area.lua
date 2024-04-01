--区域
---@class Area
---@field handle py.Area
---@field shape Area.Shape
---@field res_id? integer
---@overload fun(py_area: py.Area, shape: Area.Shape): self
local M = Class "Area"

---@class Area: ObjectEvent
Extends("Area", "ObjectEvent")
---@class Area: KV
Extends("Area", "KV")
---@class Area: GCHost
Extends("Area", "GCHost")

M.type = "area"

---@package
---@param id py.AreaID
---@param shape Area.Shape 见area.enum
---@return Area
M.ref_manager = New "Ref" ("Area", function(id, shape)
    local py_area
    if shape == M.SHAPE.CIRCLE then
        py_area = GameAPI.get_circle_area_by_res_id(id)
    elseif shape == M.SHAPE.RECTANGLE then
        py_area = GameAPI.get_rec_area_by_res_id(id)
    elseif shape == M.SHAPE.POLYGON then
        py_area = GameAPI.get_polygon_area_by_res_id(id)
    elseif shape == nil then
        py_area = GameAPI.get_circle_area_by_res_id(id)
            or GameAPI.get_rec_area_by_res_id(id)
            or GameAPI.get_polygon_area_by_res_id(id)
        assert(py_area)
    else
        error("不支持的区域类型")
    end
    local area = New "Area" (py_area, shape)
    return area
end)

---@private
---@param py_area py.Area
---@param shape Area.Shape
---@return self
function M:__init(py_area, shape)
    self.handle = py_area
    self.shape  = shape
    return self
end

---@private
function M:__del()
    GameAPI.remove_area(self.handle)
    if self.res_id then
        M.map[self.res_id] = nil
    end
end

---@private
---@type table<py.AreaID, Area>
M.map = {}

---@enum Area.Shape
M.SHAPE = {
    CIRCLE    = 1,
    RECTANGLE = 2,
    POLYGON   = 3,
}

---根据py对象创建区域
---@param py_area py.Area py层对象
---@param shape? Area.Shape 见area.enum
---@return Area
function M.从handle获取(py_area, shape)
    local id = GameAPI.get_area_resource_id(py_area) --[[@as py.AreaID]]
    local area = M.从id获取(id, shape)
    return area
end

y3.py_converter.register_py_to_lua("py.Area", M.从handle获取)
y3.py_converter.register_lua_to_py("py.Area", function(lua_value)
    return lua_value.handle
end)

---@private
---@param res_id py.AreaID 编辑场景中的id
---@param shape? Area.Shape 见area.enum
---@return Area
function M.从id获取(res_id, shape)
    local area = M.ref_manager:get(res_id, shape)
    return area
end

y3.py_converter.register_py_to_lua("py.AreaID", M.从id获取)

---根据场景id获得圆形区域
---@param res_id py.AreaID 编辑场景中的id
---@return Area
function M.从场景id获取圆形区域(res_id)
    return M.从id获取(res_id, M.SHAPE.CIRCLE)
end

---根据场景id获得矩形区域
---@param res_id py.AreaID 编辑场景中的id
---@return Area
function M.从场景id获取矩形区域(res_id)
    return M.从id获取(res_id, M.SHAPE.RECTANGLE)
end

---根据场景id获得多边形区域
---@param res_id py.AreaID|integer 编辑场景中的id
---@return Area
function M.从场景id获取多边形区域(res_id)
    return M.从id获取(res_id, M.SHAPE.POLYGON)
end

---删除区域
function M:移除()
    Delete(self)
end

---设置区域碰撞
---@param is_collision_effect boolean  碰撞是否生效
---@param is_land_effect boolean  地面碰撞开关
---@param is_air_effect boolean  空中碰撞开关
function M:设置碰撞(is_collision_effect, is_land_effect, is_air_effect)
    GameAPI.set_area_collision(self.handle, is_collision_effect, is_land_effect, is_air_effect)
end

---给区域添加标签
---@param tag string tag
function M:提交标签(tag)
    GameAPI.add_area_tag(self.handle, tag)
end

---给区域移除标签
---@param tag string tag
function M:移除标签(tag)
    GameAPI.remove_area_tag(self.handle, tag)
end

---区域是否有tag
---@param tag string tag
---@return boolean 区域是否有tag
function M:是否存在标签(tag)
    if M.SHAPE == M.SHAPE.CIRCLE then
        return GameAPI.if_cir_area_has_tag(self.handle, tag)
    elseif M.SHAPE == M.SHAPE.RECTANGLE then
        return GameAPI.if_rect_area_has_tag(self.handle, tag)
    end
    return false
end

---设置多边形区域对玩家可见性
---@param player Player 玩家
---@param is_visibility boolean 是否开启视野
---@param is_real_visibility boolean 是否开启真实视野
function M:设置对玩家可见性(player, is_visibility, is_real_visibility)
    local handle = self.handle
    if self.shape == M.SHAPE.CIRCLE then
        ---@cast handle py.CirArea
        GameAPI.set_circle_vision_visibility(handle, player.handle, is_visibility, is_real_visibility)
    elseif self.shape == M.SHAPE.RECTANGLE then
        ---@cast handle py.RecArea
        GameAPI.set_rect_vision_visibility(handle, player.handle, is_visibility, is_real_visibility)
    elseif self.shape == M.SHAPE.POLYGON then
        ---@cast handle py.PolyArea
        GameAPI.set_poly_vision_visibility(handle, player.handle, is_visibility, is_real_visibility)
    end
end

---设置圆形区域半径
---@param radius number 半径
function M:设置圆形区域半径(radius)
    if self.shape == M.SHAPE.CIRCLE then
        GameAPI.set_cir_area_radius(self.handle --[[@as py.CirArea]], Fix32(radius))
    end
end

---设置矩形区域半径
---@param horizontal_length number 长度
---@param vertical_length number 宽度
function M:设置矩形区域半径(horizontal_length, vertical_length)
    if self.shape == M.SHAPE.RECTANGLE then
        GameAPI.set_rect_area_radius(self.handle --[[@as py.RecArea]], Fix32(horizontal_length), Fix32(vertical_length))
    end
end

---获得圆形区域半径
---@return number 半径
function M:获取圆形区域半径()
    if self.shape == M.SHAPE.CIRCLE then
        return GameAPI.get_circle_area_radius(self.handle --[[@as py.CirArea]]):float()
    end
    return 0
end

---获取区域内最小X坐标
---@return number X坐标
function M:获取最小X坐标()
    if self.shape == M.SHAPE.CIRCLE then
        return GameAPI.get_circle_area_min_x(self.handle --[[@as py.CirArea]]):float()
    end
    if self.shape == M.SHAPE.RECTANGLE then
        return GameAPI.get_rect_area_min_x(self.handle --[[@as py.RecArea]]):float()
    end
    return 0
end

---获取区域内最小Y坐标
---@return number Y坐标
function M:获取最小Y坐标()
    if self.shape == M.SHAPE.CIRCLE then
        return GameAPI.get_circle_area_min_y(self.handle --[[@as py.CirArea]]):float()
    end
    if self.shape == M.SHAPE.RECTANGLE then
        return GameAPI.get_rect_area_min_y(self.handle --[[@as py.RecArea]]):float()
    end
    return 0
end

---获取区域内最大X坐标
---@return number X坐标
function M:获取最大X坐标()
    if self.shape == M.SHAPE.CIRCLE then
        return GameAPI.get_circle_area_max_x(self.handle --[[@as py.CirArea]]):float()
    end
    if self.shape == M.SHAPE.RECTANGLE then
        return GameAPI.get_rect_area_max_x(self.handle --[[@as py.RecArea]]):float()
    end
    return 0
end

---获取区域内最大Y坐标
---@return number Y坐标
function M:获取最大Y坐标()
    if self.shape == M.SHAPE.CIRCLE then
        return GameAPI.get_circle_area_max_y(self.handle --[[@as py.CirArea]]):float()
    end
    if self.shape == M.SHAPE.RECTANGLE then
        return GameAPI.get_rect_area_max_y(self.handle --[[@as py.RecArea]]):float()
    end
    return 0
end

-- 获取中心点 只支持圆形, 矩形
---@return Point 中心点
function M:获取中心点()
    if self.shape == M.SHAPE.CIRCLE then
        local py_point = GameAPI.get_circle_center_point(self.handle --[[@as py.CirArea]])
        -- TODO 见问题2
        ---@diagnostic disable-next-line: param-type-mismatch
        return y3.点.从handle获取(py_point)
    end
    if self.shape == M.SHAPE.RECTANGLE then
        local py_point = GameAPI.get_rec_center_point(self.handle --[[@as py.RecArea]])
        -- TODO 见问题2
        ---@diagnostic disable-next-line: param-type-mismatch
        return y3.点.从handle获取(py_point)
    end
    error("不支持的区域类型")
end

-- 获取随机点
---@return Point
function M:获取随机点()
    if self.shape == M.SHAPE.CIRCLE then
        local py_point = GameAPI.get_random_point_in_circular_area(self.handle --[[@as py.CirArea]])
        -- TODO 见问题2
        ---@diagnostic disable-next-line: param-type-mismatch
        return y3.点.从handle获取(py_point)
    end
    if self.shape == M.SHAPE.POLYGON then
        local py_point = GameAPI.get_random_point_in_poly_area(self.handle --[[@as py.PolyArea]])
        -- TODO 见问题2
        ---@diagnostic disable-next-line: param-type-mismatch
        return y3.点.从handle获取(py_point)
    end
    if self.shape == M.SHAPE.RECTANGLE then
        local py_point = GameAPI.get_random_point_in_rec_area(self.handle --[[@as py.RecArea]])
        -- TODO 见问题2
        ---@diagnostic disable-next-line: param-type-mismatch
        return y3.点.从handle获取(py_point)
    end
    error("不支持的区域类型")
end

---获得区域天气
---@return integer 天气枚举
function M:获取天气()
    return GameAPI.get_area_weather(self.handle)
end

---区域内的所有单位
---@return Unit[] 单位组
function M:获取所有单位()
    local py_unit_list = GameAPI.get_unit_group_in_area(self.handle)
    local units = y3.helper.unpack_list(py_unit_list, y3.单位.从唯一id获取)
    return units
end

---区域内玩家单位(单位组)
---@param player Player 玩家
---@return UnitGroup 单位组
function M:获取指定玩家所有单位(player)
    local py_unit_group = GameAPI.get_unit_group_belong_to_player_in_area(self.handle, player.handle)
    return y3.单位组.从handle获取(py_unit_group)
end

---区域中单位的数量
---@return integer 数量
function M:获取单位数量()
    return GameAPI.get_unit_num_in_area(self.handle)
end

---编辑区域碰撞
---@param collision_layer integer 碰撞类型
---@param is_add boolean  添加/去除
function M:edit_area_collision(collision_layer, is_add)
    GameAPI.edit_area_collision(self.handle, collision_layer, is_add)
end

---编辑区域视野阻挡
---@param fov_block_type integer 视野阻挡类型
---@param is_add boolean  添加/去除
function M:edit_area_fov_block(fov_block_type, is_add)
    GameAPI.edit_area_fov_block(self.handle, fov_block_type, is_add)
end

-- 点是否在区域内
---@param point Point 点
---@return boolean
function M:是否包含点(point)
    return GameAPI.judge_point_in_area(point.handle, self.handle)
end

--------------------------------------------------------类的方法--------------------------------------------------------

---获取完整地图区域
---@return Area
function M.获取地图区域()
    local py_area = GameAPI.get_usable_map_range()
    return M.从handle获取(py_area, M.SHAPE.RECTANGLE)
end

---获得最后创建的矩形区域
---@private
---@return Area
function M.get_rectangle_area_last_created()
    local py_area = GameAPI.get_rec_area_last_created()
    return M.从handle获取(py_area, M.SHAPE.RECTANGLE)
end

---创建圆形区域
---@param point Point 点
---@param radius number 半径
---@return Area 圆形区域
function M.创建圆形区域(point, radius)
    local py_area = GameAPI.create_new_cir_area(point.handle, Fix32(radius))
    return M.从handle获取(py_area, M.SHAPE.CIRCLE)
end

---创建矩形区域
---@param point Point 点
---@param horizontal_length number 长度
---@param vertical_length number 宽度
---@return Area area 矩形区域
function M.创建矩形区域(point, horizontal_length, vertical_length)
    local py_area = GameAPI.create_rect_area_by_center(point.handle, Fix32(horizontal_length), Fix32(vertical_length))
    return M.从handle获取(py_area, M.SHAPE.RECTANGLE)
end

---以起点终点创建矩形区域
---@param point_one Point 点1
---@param point_two Point 点2
---@return Area area 矩形区域
function M.创建矩形区域_由两点(point_one, point_two)
    -- TODO 见问题2
    ---@diagnostic disable-next-line: param-type-mismatch
    local py_area = GameAPI.create_rec_area_from_two_points(point_one.handle, point_two.handle)
    return M.从handle获取(py_area, M.SHAPE.RECTANGLE)
end

---沿点创建多边形
---@param ... Point
---@return Area polygon 多边形区域
function M.创建多边形区域_由多点(...)
    local points = { ... }
    local py_points = {}
    for i, p in ipairs(points) do
        py_points[i] = p.handle
    end
    local py_area = GameAPI.create_polygon_area_new(table.unpack(py_points))
    return M.从handle获取(py_area, M.SHAPE.POLYGON)
end

---按标签获取所有的圆形区域
---@param tag string 标签
---@return Area[] area 矩形区域
function M.获取所有指定标签圆形区域(tag)
    local py_list = GameAPI.get_cir_areas_by_tag(tag)
    local areas = y3.helper.unpack_list(py_list, function(py_object)
        return M.从handle获取(py_object, M.SHAPE.CIRCLE)
    end)
    return areas
end

---按标签获取所有的矩形区域
---@param tag string 标签
---@return Area[] area 矩形区域表
function M.获取所有具有标签的矩形区域(tag)
    local py_list = GameAPI.get_rect_areas_by_tag(tag)
    local areas = y3.helper.unpack_list(py_list, function(py_object)
        return M.从handle获取(py_object, M.SHAPE.RECTANGLE)
    end)
    return areas
end

---按标签获取所有的多边形区域
---@param tag string 标签
---@return Area[] area 多边形区域表
function M.获取所有具有标签的多边形区域(tag)
    local py_list = GameAPI.get_polygon_areas_by_tag(tag)
    local areas = y3.helper.unpack_list(py_list, function(py_object)
        return M.从handle获取(py_object, M.SHAPE.POLYGON)
    end)
    return areas
end

---获取多边形的所有顶点
---@param polygon Area 多边形区域
---@return  Point[]  多边形顶点表
function M.获取多边形区域所有顶点(polygon)
    assert(polygon.shape == M.SHAPE.POLYGON, "不是多边形区域")
    local handle = polygon.handle
    ---@cast handle py.PolyArea
    local py_list = GameAPI.get_poly_area_point_list(handle)
    local points = y3.helper.unpack_list(py_list, y3.点.从handle获取)
    return points
end

return M
