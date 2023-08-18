--- File Name : destructible.lua
--- Description: 可破坏物

---@class Destructible
---@field handle py.Destructible
---@field id integer
---@overload fun(py_destructible: py.Destructible): self
local M = Class 'Destructible'
M.type = 'destructible'

---@class Destructible: ObjectEvent
Extends('Destructible', 'ObjectEvent')

---@param py_destructible py.Destructible
---@return self
function M:constructor(py_destructible)
    self.handle = py_destructible
    self.id     = py_destructible:api_get_id()
    return self
end

function M:destructor()
    self.handle:api_delete()
end

---所有可破坏物实例
M.map = setmetatable({}, { __mode = 'kv' })

---通过py层的可破坏物实例获取lua层的可破坏物对象
---@param  py_destructible py.Destructible
---@return Destructible
function M.get_by_handle(py_destructible)
    local id = py_destructible:api_get_id()
    if not M.map[id] then
        M.map[id] = New 'Destructible' (py_destructible)
    end
    return M.map[id]
end

y3.py_converter.register_py_to_lua('py.Destructible', M.get_by_handle)
y3.py_converter.register_lua_to_py('py.Destructible', function (lua_value)
    return lua_value.handle
end)

-- 通过可破坏物的唯一ID获取lua的可破坏物对象
---@param id py.DestructibleID
---@return Destructible
function M.get_by_id(id)
    local py_destructible = GameAPI.get_dest_by_id(id)
    return M.get_by_handle(py_destructible)
end

y3.py_converter.register_py_to_lua('py.DestructibleID', M.get_by_id)

---是否存在
---@return boolean is_exist 是否存在
function M:is_exist()
    return  GameAPI.destructible_is_exist(self.handle)
end

-- 获取唯一ID
---@return integer
function M:get_id()
    return self.id
end

---可破坏物能否被技能指示器选中
---@return boolean is_lockable 能否被选中
function M:can_be_ability_target()
    return self.handle:api_is_ability_target()
end

---可破坏物能否被攻击
---@return boolean is_attackable 能否被攻击
function M:can_be_attacked()
    return self.handle:api_is_attacked()
end

---可破坏物能否被选中
---@return boolean is_selectable 能否被选中
function M:can_be_selected()
    return self.handle:api_is_selected()
end

---可破坏物能否被采集
---@return boolean is_collectable 能否被选中
function M:can_be_collected()
    return self.handle:api_is_collected()
end

---可破坏物是否可见
---@return boolean is_visible 是否可见
function M:is_visible()
    return self.handle:api_is_visible()
end

---可破坏物是否存活
---@return boolean is_alive 是否存活
function M:is_alive()
    return self.handle:api_is_alive()
end

---@param killer_unit Unit 凶手
---杀死可破坏物
function M:kill(killer_unit)
    self.handle:api_kill(killer_unit.handle)
end

---删除可破坏物
function M:remove()
    Delete(self)
end

---复活可破坏物
function M:reborn()
    self.handle:api_revivie_new()
end

---移动到点
---@param point Point 目标点
function M:set_point(point)
    -- TODO 见问题2
    ---@diagnostic disable-next-line: param-type-mismatch
    self.handle:api_transmit(point.handle)
end

---设置生命值
---@param value number 生命值
function M:set_hp(value)
    self.handle:api_set_hp(Fix32(value))
end

---@param value number 生命值
---增加当前生命值
function M:add_hp(value)
    self.handle:api_add_hp_cur_value(Fix32(value))
end

---@param value number 生命值
---设置最大生命值
function M:set_max_hp(value)
    self.handle:api_set_max_hp(Fix32(value))
end

---@param value number 生命值
---增加最大生命值
function M:add_max_hp(value)
    self.handle:api_add_hp_max_value(Fix32(value))
end

---@param value number 资源数
---设置当前资源数
function M:set_resource(value)
    self.handle:api_set_cur_source_nums(Fix32(value))
end

---@param value number 资源数
---增加当前资源数
function M:add_resource(value)
    self.handle:api_add_sp_cur_value(Fix32(value))
end

---@param value number 资源数
---设置最大资源数
function M:set_max_resource(value)
    self.handle:api_set_max_source_nums(Fix32(value))
end

---@param value number 资源数
---增加最大资源数
function M:add_max_resource(value)
    self.handle:api_add_sp_max_value(Fix32(value))
end

---@param name string 名字
---设置名称
function M:set_name(name)
    self.handle:api_set_name(name)
end

---@param description string 描述
---设置描述
function M:set_description(description)
    self.handle:api_set_str_attr("description", description)
end

---设置缩放
---@param x number x轴缩放
---@param y number y轴缩放
---@param z number z轴缩放
function M:set_scale(x, y, z)
    self.handle:api_set_scale(Fix32(x), Fix32(y), Fix32(z))
end

---设置朝向
---@param angle number 朝向角度
function M:set_facing(angle)
    self.handle:api_set_face_angle(Fix32(angle))
end

---设置高度
---@param height number 高度
function M:set_height(height)
    self.handle:api_set_height_offset(Fix32(height))
end

---增加高度
---@param height number 高度
function M:add_height(height)
    self.handle:api_add_height_offset(Fix32(height))
end

---设置能否被技能指示器锁定
---@param can_be_ability_target boolean 能否被技能指示器锁定
function M:set_can_be_ability_target(can_be_ability_target)
    self.handle:api_set_dest_is_ability_target(can_be_ability_target)
end

---设置能否被攻击
---@param is_attackable boolean 能否被攻击
function M:set_can_be_attacked(is_attackable)
    self.handle:api_set_dest_is_attacked(is_attackable)
end

---设置能否被选中
---@param is_selectable boolean 能否被选中
function M:set_can_be_selected(is_selectable)
    self.handle:api_set_dest_is_selected(is_selectable)
end

---设置能否被采集
---@param is_collectable boolean 能否被采集
function M:set_can_be_collected(is_collectable)
    self.handle:api_set_dest_is_collected(is_collectable)
end

---增加标签
---@param tag string 标签
function M:add_tag(tag)
    self.handle:api_add_tag(tag)
end

---移除标签
---@param tag string 标签
function M:remove_tag(tag)
    self.handle:api_remove_tag(tag)
end

---播放动画
---@param anim_name string 动画名字
---@param start_time number 开始时间
---@param end_time number 结束时间
---@param is_loop boolean 是否循环
---@param speed number 速度
function M:play_animation(anim_name, start_time, end_time, is_loop, speed)
    self.handle:api_play_animation(anim_name, start_time, end_time, is_loop, speed)
end

---停止动画
---@param anim_name string 动画名字
function M:stop_animation(anim_name)
    self.handle:api_stop_animation(anim_name)
end

---替换模型
---@param model_id py.ModelKey 模型id
function M:replace_model(model_id)
    self.handle:api_replace_model(model_id)
end

---取消替换模型
---@param model_id py.ModelKey 模型id
function M:cancel_replace_model(model_id)
    self.handle:api_cancel_replace_model(model_id)
end

---显示/隐藏
---@param is_visible boolean 是否显示
function M:set_visible(is_visible)
    self.handle:api_show_hide(is_visible)
end

---获取可破坏物类型
---@return py.DestructibleKey type 可破坏物类型
function M:get_key()
    return GameAPI.get_dest_type(self.handle)
end

---获取可破坏物的名称
---@return string name 可破坏物的名称
function M:get_name()
    return self.handle:api_get_str_attr("name")
end

---获取可破坏物描述
---@return string description 描述
function M:get_description()
    return self.handle:api_get_str_attr("description")
end

---获取可破坏物的生命值
---@return number cur_hp 生命值
function M:get_hp()
    return self.handle:api_get_float_attr("hp_cur"):float()
end

---获取可破坏物的资源名称
---@return string source_name 资源名称
function M:get_resource_name()
    return self.handle:api_get_str_attr("source_desc")
end

---获取可破坏物的生命值
---@return number hp 可破坏物的生命值
function M:get_max_hp()
    return self.handle:api_get_float_attr("hp_max"):float()
end

---获取可破坏物的当前资源数
---@return number source_number 当前资源数
function M:get_resource()
    return self.handle:api_get_dest_cur_source_nums()
end

---获取可破坏物的最大资源数
---@return number max_number 最大资源数
function M:get_max_resource()
    return self.handle:api_get_dest_max_source_nums()
end

---获取可破坏物的玩家属性名
---@return py.RoleResKey player_res_key 玩家属性
function M:get_resource_type()
    return self.handle:api_get_role_res_of_dest()
end

---获取可破坏物的物品类型ID
---@return py.ItemKey item_key 物品类型ID
function M:get_item_type()
    return self.handle:api_get_item_type_of_dest()
end

---获取可破坏物的模型
---@return py.ModelKey model_key 模型id
function M:get_model()
    return self.handle:api_get_dest_model()
end

---获取可破坏物的高度
---@return number height 高度
function M:get_height()
    return self.handle:api_get_dest_height_offset():float()
end

---获取可破坏物的面向角度
---@return number rotation 面向角度
function M:get_facing()
    return self.handle:api_get_dest_face_angle():float()
end

---获取可破坏物对象的位置
---@return Point point 可破坏物的位置
function M:get_position()
    local py_point = self.handle:api_get_position()
    -- TODO 见问题2
    ---@diagnostic disable-next-line: param-type-mismatch
    return y3.point.get_by_handle(py_point)
end

--------------------------------------------类的方法--------------------------------------------

---创建可破坏物
---@param type_id py.DestructibleKey 可破坏物类型id
---@param point Point 创建到点
---@param angle number 面向角度
---@param scale_x? number 缩放x
---@param scale_y? number 缩放y
---@param scale_z? number 缩放z
---@param height? number 高度
---@return Destructible destructible 可破坏物
function M.create_destructible(type_id, point, angle, scale_x, scale_y, scale_z, height)
    if not scale_x then scale_x = 1 end
    if not scale_y then scale_y = 1 end
    if not scale_z then scale_z = 1 end
    if not height then height = 0 end
    local py_destructible = GameAPI.create_destructible_new(type_id, point.handle, Fix32(angle), Fix32(scale_x), Fix32(scale_y), Fix32(scale_z), Fix32(height))

    return y3.destructible.get_by_handle(py_destructible)
end

---获取可破坏物类型的名称
---@param key py.DestructibleKey 类型id
---@return string name 名称
function M.get_name_by_key(key)
    return GameAPI.get_dest_name_by_type(key)
end

---获取可破坏物类型的描述
---@param key py.DestructibleKey 类型id
---@return string description 描述
function M.get_description_by_key(key)
    return GameAPI.get_dest_desc_by_type(key)
end

---获取可破坏物类型的模型
---@param key py.DestructibleKey 类型id
---@return py.ModelKey model 模型id
function M.get_model_by_type(key)
    return GameAPI.get_model_key_of_dest_key(key)
end

---遍历区域中的所有可破坏物
---@param area Area 区域对象
---@return Destructible[]
function M.pick(area)
    ---@type Destructible[]
    local destructibles = {}
    local py_list = GameAPI.get_all_dest_in_area(area.handle)
    for i = 0, python_len(py_list) - 1 do
        local iter_destructible = python_index(py_list, i)
        table.insert(destructibles,y3.destructible.get_by_handle(iter_destructible))
    end
    return destructibles
end

---@param point Point 点
---@param shape Shape 区域
---@return table destructible_list 可破坏物列表
---获取不同形状范围内的可破坏物列表
function M.pick_in_shape(point, shape)
    -- TODO 见问题2
    ---@diagnostic disable-next-line: param-type-mismatch
    local py_list = GameAPI.get_all_dest_in_shapes(point.handle, shape.handle)
    local lua_table = {}
    for i = 0, python_len(py_list)-1 do
        local iter_destructible = python_index(py_list, i)
        table.insert(lua_table,y3.destructible.get_by_handle(iter_destructible))
    end
    return lua_table
end

return M
