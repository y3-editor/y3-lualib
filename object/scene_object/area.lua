--区域
---@class Area
---@field handle py.Area
---@field shape Area.Shape
---@field res_id? integer
---@overload fun(py_area: py.Area, shape: Area.Shape): self
local M = Class 'Area'

---@class Area: ObjectEvent
Extends('Area', 'ObjectEvent')
---@class Area: KV
Extends('Area', 'KV')
---@class Area: GCHost
Extends('Area', 'GCHost')

M.type = 'area'

---@package
---@param id py.AreaID
---@param shape Area.Shape 见area.enum
---@return Area
M.ref_manager = New 'Ref' ('Area', function (id, shape)
    local py_area
    if shape == M.SHAPE.CIRCLE then
        py_area = GameAPI.get_circle_area_by_res_id(id)
    elseif shape == M.SHAPE.RECTANGLE then
        py_area = GameAPI.get_rec_area_by_res_id(id)
    elseif shape == M.SHAPE.POLYGON then
        py_area = GameAPI.get_polygon_area_by_res_id(id)
    elseif shape == nil then
        py_area = GameAPI.get_circle_area_by_res_id(id)
        if py_area then
            shape = M.SHAPE.CIRCLE
            goto FOUND
        end
        py_area = GameAPI.get_rec_area_by_res_id(id)
        if py_area then
            shape = M.SHAPE.RECTANGLE
            goto FOUND
        end
        py_area = GameAPI.get_polygon_area_by_res_id(id)
        if py_area then
            shape = M.SHAPE.POLYGON
            goto FOUND
        end
        error('未找到区域')
        ::FOUND::
    else
        error('不支持的区域类型')
    end
    local area = New 'Area' (py_area, shape)
    return area
end)

---@param py_area py.Area
---@param shape Area.Shape
---@return self
function M:__init(py_area, shape)
    self.handle = py_area
    self.shape  = shape
    return self
end

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
function M.get_by_handle(py_area, shape)
    local id = GameAPI.get_area_resource_id(py_area) --[[@as py.AreaID]]
    local area = M.get_by_res_id(id, shape)
    return area
end

y3.py_converter.register_py_to_lua('py.Area', M.get_by_handle)
y3.py_converter.register_lua_to_py('py.Area', function (lua_value)
    return lua_value.handle
end)

---@param res_id py.AreaID 编辑场景中的id
---@param shape? Area.Shape 见area.enum
---@return Area
function M.get_by_res_id(res_id, shape)
    local area = M.ref_manager:get(res_id, shape)
    return area
end

y3.py_converter.register_py_to_lua('py.AreaID', M.get_by_res_id)

---根据场景id获得圆形区域
---@param res_id py.AreaID 编辑场景中的id
---@return Area
function M.get_circle_by_res_id(res_id)
    return M.get_by_res_id(res_id, M.SHAPE.CIRCLE)
end

---根据场景id获得矩形区域
---@param res_id py.AreaID 编辑场景中的id
---@return Area
function M.get_rectangle_by_res_id(res_id)
    return M.get_by_res_id(res_id, M.SHAPE.RECTANGLE)
end

---根据场景id获得多边形区域
---@param res_id py.AreaID 编辑场景中的id
---@return Area
function M.get_polygon_by_res_id(res_id)
    return M.get_by_res_id(res_id, M.SHAPE.POLYGON)
end

---删除区域
function M:remove()
    Delete(self)
end

---设置区域碰撞
---@param is_collision_effect boolean  碰撞是否生效
---@param is_land_effect boolean  地面碰撞开关
---@param is_air_effect boolean  空中碰撞开关
function M:set_collision(is_collision_effect, is_land_effect, is_air_effect)
    GameAPI.set_area_collision(self.handle, is_collision_effect, is_land_effect, is_air_effect)
end

---给区域添加标签
---@param tag string tag
function M:add_tag(tag)
    GameAPI.add_area_tag(self.handle, tag)
end

---给区域移除标签
---@param tag string tag
function M:remove_tag(tag)
    GameAPI.remove_area_tag(self.handle, tag)
end

---区域是否有tag
---@param tag string tag
---@return boolean 区域是否有tag
function M:has_tag(tag)
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
function M:set_visible(player, is_visibility, is_real_visibility)
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
function M:set_radius(radius)
    if self.shape == M.SHAPE.CIRCLE then
        GameAPI.set_cir_area_radius(self.handle--[[@as py.CirArea]], Fix32(radius))
    end
end

---设置矩形区域半径
---@param horizontal_length number 长度
---@param vertical_length number 宽度
function M:set_size(horizontal_length, vertical_length)
    if self.shape == M.SHAPE.RECTANGLE then
        GameAPI.set_rect_area_radius(self.handle--[[@as py.RecArea]], Fix32(horizontal_length), Fix32(vertical_length))
    end
end

---获得圆形区域半径
---@return number 半径
function M:get_radius()
    if self.shape == M.SHAPE.CIRCLE then
        return y3.helper.tonumber(GameAPI.get_circle_area_radius(self.handle--[[@as py.CirArea]])) or 0.0
    end
    return 0
end

---获取区域内最小X坐标
---@return number X坐标
function M:get_min_x()
    if self.shape == M.SHAPE.CIRCLE then
        return y3.helper.tonumber(GameAPI.get_circle_area_min_x(self.handle--[[@as py.CirArea]])) or 0.0
    end
    if self.shape == M.SHAPE.RECTANGLE then
        return y3.helper.tonumber(GameAPI.get_rect_area_min_x(self.handle--[[@as py.RecArea]])) or 0.0
    end
    return 0
end

---获取区域内最小Y坐标
---@return number Y坐标
function M:get_min_y()
    if self.shape == M.SHAPE.CIRCLE then
        return y3.helper.tonumber(GameAPI.get_circle_area_min_y(self.handle--[[@as py.CirArea]])) or 0.0
    end
    if self.shape == M.SHAPE.RECTANGLE then
        return y3.helper.tonumber(GameAPI.get_rect_area_min_y(self.handle--[[@as py.RecArea]])) or 0.0
    end
    return 0
end

---获取区域内最大X坐标
---@return number X坐标
function M:get_max_x()
    if self.shape == M.SHAPE.CIRCLE then
        return y3.helper.tonumber(GameAPI.get_circle_area_max_x(self.handle--[[@as py.CirArea]])) or 0.0
    end
    if self.shape == M.SHAPE.RECTANGLE then
        return y3.helper.tonumber(GameAPI.get_rect_area_max_x(self.handle--[[@as py.RecArea]])) or 0.0
    end
    return 0
end

---获取区域内最大Y坐标
---@return number Y坐标
function M:get_max_y()
    if self.shape == M.SHAPE.CIRCLE then
        return y3.helper.tonumber(GameAPI.get_circle_area_max_y(self.handle--[[@as py.CirArea]])) or 0.0
    end
    if self.shape == M.SHAPE.RECTANGLE then
        return y3.helper.tonumber(GameAPI.get_rect_area_max_y(self.handle--[[@as py.RecArea]])) or 0.0
    end
    return 0
end

-- 获取中心点
---@return Point 中心点
function M:get_center_point()
    if self.shape == M.SHAPE.CIRCLE then
        local py_point = GameAPI.get_circle_center_point(self.handle--[[@as py.CirArea]])
        -- TODO 见问题2
        ---@diagnostic disable-next-line: param-type-mismatch
        return y3.point.get_by_handle(py_point)
    end
    if self.shape == M.SHAPE.RECTANGLE then
        local py_point = GameAPI.get_rec_center_point(self.handle--[[@as py.RecArea]])
        -- TODO 见问题2
        ---@diagnostic disable-next-line: param-type-mismatch
        return y3.point.get_by_handle(py_point)
    end
    error('不支持的区域类型')
end

-- 获取随机点
---@return Point
function M:random_point()
    if self.shape == M.SHAPE.CIRCLE then
        local py_point = GameAPI.get_random_point_in_circular_area(self.handle--[[@as py.CirArea]])
        -- TODO 见问题2
        ---@diagnostic disable-next-line: param-type-mismatch
        return y3.point.get_by_handle(py_point)
    end
    if self.shape == M.SHAPE.POLYGON then
        local py_point = GameAPI.get_random_point_in_poly_area(self.handle--[[@as py.PolyArea]])
        -- TODO 见问题2
        ---@diagnostic disable-next-line: param-type-mismatch
        return y3.point.get_by_handle(py_point)
    end
    if self.shape == M.SHAPE.RECTANGLE then
        local py_point = GameAPI.get_random_point_in_rec_area(self.handle--[[@as py.RecArea]])
        -- TODO 见问题2
        ---@diagnostic disable-next-line: param-type-mismatch
        return y3.point.get_by_handle(py_point)
    end
    error('不支持的区域类型')
end


---获得区域天气
---@return integer 天气枚举
function M:get_weather()
    return GameAPI.get_area_weather(self.handle)
end

---区域内的所有单位
---@return Unit[] 单位组
function M:get_all_unit_in_area()
    local py_unit_list = GameAPI.get_unit_group_in_area(self.handle)
    local units = y3.helper.unpack_list(py_unit_list, y3.unit.get_by_id)
    return units
end

---区域内阵营所有单位
---@param camp py.Camp
---@return Unit[] 单位组
function M:get_unit_in_area_by_camp(camp)
    local u = {}
    for _, player in ipairs(y3.player_group.get_player_group_by_camp(camp):pick()) do
        for _, unit in ipairs(self:get_unit_group_in_area(player):pick()) do
            table.insert(u, unit)
        end
    end
    return u
end

---区域内玩家单位(单位组)
---@param player Player 玩家
---@return UnitGroup 单位组
function M:get_unit_group_in_area(player)
    local py_unit_group = GameAPI.get_unit_group_belong_to_player_in_area(self.handle, player.handle)
    return y3.unit_group.get_by_handle(py_unit_group)
end

---区域中单位的数量
---@return integer 数量
function M:get_unit_num_in_area()
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
function M:is_point_in_area(point)
    return GameAPI.judge_point_in_area(point.handle, self.handle)
end

--------------------------------------------------------类的方法--------------------------------------------------------

---获取完整地图区域
---@return Area
function M.get_map_area()
    local py_area = GameAPI.get_usable_map_range()
    return M.get_by_handle(py_area, M.SHAPE.RECTANGLE)
end

---获得最后创建的矩形区域
---@return Area
function M.get_rectangle_area_last_created()
    local py_area = GameAPI.get_rec_area_last_created()
    return M.get_by_handle(py_area, M.SHAPE.RECTANGLE)
end

---创建圆形区域
---@param point Point 点
---@param radius number 半径
---@return Area 圆形区域
function M.create_circle_area(point, radius)
    local py_area = GameAPI.create_new_cir_area(point.handle, Fix32(radius))
    return M.get_by_handle(py_area, M.SHAPE.CIRCLE)
end

---创建矩形区域
---@param point Point 点
---@param horizontal_length number 长度
---@param vertical_length number 宽度
---@return Area area 矩形区域
function M.create_rectangle_area(point, horizontal_length, vertical_length)
    local py_area = GameAPI.create_rect_area_by_center(point.handle, Fix32(horizontal_length), Fix32(vertical_length))
    return M.get_by_handle(py_area, M.SHAPE.RECTANGLE)
end

---以起点终点创建矩形区域
---@param point_one Point 点1
---@param point_two Point 点2
---@return Area area 矩形区域
function M.create_rectangle_area_from_two_points(point_one, point_two)
    -- TODO 见问题2
    ---@diagnostic disable-next-line: param-type-mismatch
    local py_area = GameAPI.create_rec_area_from_two_points(point_one.handle, point_two.handle)
    return M.get_by_handle(py_area, M.SHAPE.RECTANGLE)
end

---沿点创建多边形
---@param ... Point
---@return Area polygon 多边形区域
function M.create_polygon_area_by_points(...)
    local points = {...}
    local py_points = {}
    for i, p in ipairs(points) do
        py_points[i] = p.handle
    end
    local py_area = GameAPI.create_polygon_area_new(table.unpack(py_points))
    return M.get_by_handle(py_area, M.SHAPE.POLYGON)
end

---按标签获取所有的圆形区域
---@param tag string 标签
---@return Area[] area 矩形区域
function M.get_circle_areas_by_tag(tag)
    local py_list = GameAPI.get_cir_areas_by_tag(tag)
    local areas = y3.helper.unpack_list(py_list, function (py_object)
        return M.get_by_handle(py_object, M.SHAPE.CIRCLE)
    end)
    return areas
end

---按标签获取所有的矩形区域
---@param tag string 标签
---@return Area[] area 矩形区域表
function M.get_rect_areas_by_tag(tag)
    local py_list = GameAPI.get_rect_areas_by_tag(tag)
    local areas = y3.helper.unpack_list(py_list, function (py_object)
        return M.get_by_handle(py_object, M.SHAPE.RECTANGLE)
    end)
    return areas
end

---按标签获取所有的多边形区域
---@param tag string 标签
---@return Area[] area 多边形区域表
function M.get_polygon_areas_by_tag(tag)
    local py_list = GameAPI.get_polygon_areas_by_tag(tag)
    local areas = y3.helper.unpack_list(py_list, function (py_object)
        return M.get_by_handle(py_object, M.SHAPE.POLYGON)
    end)
    return areas
end

---获取多边形的所有顶点
---@param polygon Area 多边形区域
---@return table area 多边形顶点表
function M.get_polygon_areas_point_list(polygon)
    assert(polygon.shape == M.SHAPE.POLYGON, '不是多边形区域')
    local handle = polygon.handle
    ---@cast handle py.PolyArea
    local py_list = GameAPI.get_poly_area_point_list(handle)
    local points = y3.helper.unpack_list(py_list, y3.point.get_by_handle)
    return points
end

return M
