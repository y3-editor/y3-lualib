--光照
--
--用来修改光照、阴影等效果
---@class Light
---@field handle py.Light
---@field res_id? py.LightID
---@overload fun(py_light: py.Light): self
local M = Class 'Light'

M.type = 'light'

---@param py_light py.Light
---@return self
function M:__init(py_light)
    self.handle = py_light
    return self
end

---@private
M.map = {}

---根据场景id获得点光源
---@param res_id py.LightID 编辑场景中的id
---@return Light
function M.get_point_light_by_res_id(res_id)
    if not M.map[res_id] then
        local py_light = GameAPI.get_point_light_res_by_res_id(res_id)
        local light = M.create_lua_light_by_py(py_light)
        light.res_id = res_id
        M.map[res_id] = light
    end
    return M.map[res_id]
end

---根据场景id获得聚光灯
---@param res_id py.LightID 编辑场景中的id
---@return Light
function M.get_spot_light_by_res_id(res_id)
    if not M.map[res_id] then
        local py_light = GameAPI.get_spot_light_res_by_res_id(res_id)
        local light = M.create_lua_light_by_py(py_light)
        light.res_id = res_id
        M.map[res_id] = light
    end
    return M.map[res_id]
end

---@param py_light py.Light
---@return Light light
function M.create_lua_light_by_py(py_light)
    local light = New 'Light' (py_light)
    return light
end

y3.py_converter.register_py_to_lua('py.Light', M.create_lua_light_by_py)
y3.py_converter.register_lua_to_py('py.Light', function (lua_value)
    return lua_value.handle
end)

--TODO:点光源属性枚举需在Lua层处理

---获取光源属性
---@param key string 属性名
---@return number 属性值
function M:get_light_attribute(key)
    return y3.helper.tonumber(GameAPI.get_light_float_attr_value(self.handle, key)) or 0.0
end


---获取光源是否产生阴影
---@return boolean 是否产生阴影
function M:get_light_cast_shadow_state()
    return GameAPI.get_light_cast_shadow_attr_value(self.handle)
end


--创建点光源到点
---@param point Point 目标点
---@param deviation_height number 偏移高度
---@return Light
function M.create_point_light_at_point(point, deviation_height)
    local py_light = GameAPI.create_point_light_to_point(
        -- TODO 见问题2
        ---@diagnostic disable-next-line: param-type-mismatch
        point.handle,
        Fix32(deviation_height)
    )
    return M.create_lua_light_by_py(py_light)
end


--创建点光源到单位挂接点
---@param unit Unit 目标单位
---@param socket_name string 挂接点
---@param deviation_height number 偏移高度
---@return Light
function M.create_point_light_at_unit_socket(unit, socket_name, deviation_height)
    local py_obj = GameAPI.create_point_light_to_unit_socket(unit.handle, socket_name, Fix32(deviation_height))
    return M.create_lua_light_by_py(py_obj)
end


--创建方向光源到点
---@param point Point 目标点
---@param pos_offset_y? number 偏移高度
---@param unit_point_projectile? Unit|Point|Projectile 目标
---@param target_offset_y? number 目标点偏移高度
---@return Light
function M.create_spot_light_to_point(point, pos_offset_y, unit_point_projectile, target_offset_y)
    local py_obj = GameAPI.create_spot_light_to_point(
        -- TODO 见问题2
        ---@diagnostic disable-next-line: param-type-mismatch
        point.handle,
        pos_offset_y and Fix32(pos_offset_y) or nil,
        -- TODO 见问题6
        ---@diagnostic disable-next-line: param-type-mismatch
        unit_point_projectile and unit_point_projectile.handle or nil,
        target_offset_y and Fix32(target_offset_y) or nil
    )
    return M.create_lua_light_by_py(py_obj)
end


--创建方向光源到单位挂接点
---@param unit Unit 目标单位
---@param socket_name string 挂接点
---@param pos_offset_y? number 偏移高度
---@param target_unit? Unit 目标单位
---@param target_offset_y? number 目标点偏移高度
---@return Light
function M.create_spot_light_at_unit_socket(unit,socket_name,pos_offset_y,target_unit,target_offset_y)
    local py_obj = GameAPI.create_spot_light_to_unit_socket(
        unit.handle,
        socket_name,
        pos_offset_y and Fix32(pos_offset_y) or nil,
        target_unit and target_unit.handle or nil,
        target_offset_y and Fix32(target_offset_y) or nil
    )
    return M.create_lua_light_by_py(py_obj)
end

--删除光源
function M:remove_light()
    GameAPI.remove_light(self.handle)
end

--设置光源是否产生阴影
---@param value boolean 是否产生阴影
function M:set_shadow_casting_status(value)
    GameAPI.set_light_cast_shadow_attr_value(self.handle, value)
end

--设置点光源属性
---@param light_attr_type string 属性名
---@param value number 属性值
function M:set_point_light_attribute(light_attr_type,value)
    GameAPI.set_light_float_attr_value(self.handle, light_attr_type, Fix32(value))
end

--设置方向光源属性
---@param light_attr_type string 属性名
---@param value number 属性值
function M:set_directional_light_attribute(light_attr_type,value)
    GameAPI.set_light_float_attr_value(self.handle, light_attr_type, Fix32(value))
end

return M
