--可破坏物
---@class Destructible
---@field handle py.Destructible
---@field phandle py.Destructible
---@field id integer
---@field package _removed_by_py? boolean
---@overload fun(py_destructible: py.Destructible): self
local M = Class 'Destructible'
M.type = 'destructible'

---@class Destructible: ObjectEvent
Extends('Destructible', 'ObjectEvent')
---@class Destructible: KV
Extends('Destructible', 'KV')

function M:__tostring()
    return string.format('{destructible|%s|%s}'
        , self:get_name()
        , self.handle
    )
end

---@param py_destructible py.Destructible
---@return self
function M:__init(py_destructible)
    self.handle = py_destructible
    self.phandle = y3.py_proxy.wrap(py_destructible, GameAPI.destructible_is_exist)
    self.id     = py_destructible:api_get_id() or 0
    return self
end

function M:__del()
    M.ref_manager:remove(self.id)
    y3.py_proxy.kill(self.phandle)
    if self._removed_by_py then
        return
    end
    self.phandle:api_delete()
end

---@package
M.ref_manager = New 'Ref' ('Destructible', function (id)
    local py_destructible = GameAPI.get_dest_by_id(id)
    if not py_destructible then
        return nil
    end
    return New 'Destructible' (py_destructible)
end)

---通过py层的可破坏物实例获取lua层的可破坏物对象
---@param  py_destructible py.Destructible
---@return Destructible?
function M.get_by_handle(py_destructible)
    if not py_destructible then
        return nil
    end
    local id = y3.py_proxy.wrap(py_destructible, GameAPI.destructible_is_exist):api_get_id()
    local dest = M.ref_manager:get(id)
    return dest
end

y3.py_converter.register_py_to_lua('py.Destructible', M.get_by_handle)
y3.py_converter.register_lua_to_py('py.Destructible', function (lua_value)
    return lua_value.handle
end)

-- 通过可破坏物的唯一ID获取lua的可破坏物对象
---@param id py.DestructibleID
---@return Destructible?
function M.get_by_id(id)
    local py_destructible = GameAPI.get_dest_by_id(id)
    return M.get_by_handle(py_destructible)
end

y3.py_converter.register_py_to_lua('py.DestructibleID', M.get_by_id)

y3.py_event_sub.new_global_trigger('ET_DEST_DELETE', function (data)
    local id = data['__destructible_id']
    local destructible = M.ref_manager:fetch(id)
    if not destructible then
        return
    end
    destructible._removed_by_py = true
    destructible:remove()
end)

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
    return self.phandle:api_is_ability_target() or false
end

---可破坏物能否被攻击
---@return boolean is_attackable 能否被攻击
function M:can_be_attacked()
    return self.phandle:api_is_attacked() or false
end

---可破坏物能否被选中
---@return boolean is_selectable 能否被选中
function M:can_be_selected()
    return self.phandle:api_is_selected() or false
end

---可破坏物能否被采集
---@return boolean is_collectable 能否被采集
function M:can_be_collected()
    return self.phandle:api_is_collected() or false
end

---可破坏物是否可见
---@return boolean is_visible 是否可见
function M:is_visible()
    return self.phandle:api_is_visible() or false
end

---可破坏物是否存活
---@return boolean is_alive 是否存活
function M:is_alive()
    return self.phandle:api_is_alive() or false
end

---@param killer_unit Unit 凶手
---杀死可破坏物
function M:kill(killer_unit)
    self.phandle:api_kill(killer_unit.handle)
end

---删除可破坏物
function M:remove()
    Delete(self)
end

---复活可破坏物
function M:reborn()
    self.phandle:api_revivie_new()
end

---移动到点
---@param point Point 目标点
function M:set_point(point)
    -- TODO 见问题2
    ---@diagnostic disable-next-line: param-type-mismatch
    self.phandle:api_transmit(point.handle)
end

---设置生命值
---@param value number 生命值
function M:set_hp(value)
    self.phandle:api_set_hp(Fix32(value))
end

---@param value number 生命值
---增加当前生命值
function M:add_hp(value)
    self.phandle:api_add_hp_cur_value(Fix32(value))
end

---@param value number 生命值
---设置最大生命值
function M:set_max_hp(value)
    self.phandle:api_set_max_hp(Fix32(value))
end

---@param value number 生命值
---增加最大生命值
function M:add_max_hp(value)
    self.phandle:api_add_hp_max_value(Fix32(value))
end

---@param value number 资源数
---设置当前资源数
function M:set_resource(value)
    self.phandle:api_set_cur_source_nums(Fix32(value))
end

---@param value number 资源数
---增加当前资源数
function M:add_resource(value)
    self.phandle:api_add_sp_cur_value(Fix32(value))
end

---@param value number 资源数
---设置最大资源数
function M:set_max_resource(value)
    self.phandle:api_set_max_source_nums(Fix32(value))
end

---@param value number 资源数
---增加最大资源数
function M:add_max_resource(value)
    self.phandle:api_add_sp_max_value(Fix32(value))
end

---@param name string 名字
---设置名称
function M:set_name(name)
    self.phandle:api_set_name(name)
end

---@param description string 描述
---设置描述
function M:set_description(description)
    self.phandle:api_set_str_attr("description", description)
end

---设置缩放
---@param x number x轴缩放
---@param y number y轴缩放
---@param z number z轴缩放
function M:set_scale(x, y, z)
    self.phandle:api_set_scale(Fix32(x), Fix32(y), Fix32(z))
end

---设置朝向
---@param angle number 朝向角度
function M:set_facing(angle)
    self.phandle:api_set_face_angle(Fix32(angle))
end

---设置高度
---@param height number 高度
function M:set_height(height)
    self.phandle:api_set_height_offset(Fix32(height))
end

---增加高度
---@param height number 高度
function M:add_height(height)
    self.phandle:api_add_height_offset(Fix32(height))
end

---设置能否被技能指示器锁定
---@param can_be_ability_target boolean 能否被技能指示器锁定
function M:set_can_be_ability_target(can_be_ability_target)
    self.phandle:api_set_dest_is_ability_target(can_be_ability_target)
end

---设置能否被攻击
---@param is_attackable boolean 能否被攻击
function M:set_can_be_attacked(is_attackable)
    self.phandle:api_set_dest_is_attacked(is_attackable)
end

---设置能否被选中
---@param is_selectable boolean 能否被选中
function M:set_can_be_selected(is_selectable)
    self.phandle:api_set_dest_is_selected(is_selectable)
end

---设置能否被采集
---@param is_collectable boolean 能否被采集
function M:set_can_be_collected(is_collectable)
    self.phandle:api_set_dest_is_collected(is_collectable)
end

---增加标签
---@param tag string 标签
function M:add_tag(tag)
    self.phandle:api_add_tag(tag)
end

---移除标签
---@param tag string 标签
function M:remove_tag(tag)
    self.phandle:api_remove_tag(tag)
end

---播放动画
---@param anim_name string 动画名字
---@param start_time? number 开始时间
---@param end_time? number 结束时间(默认-1表示播放到最后)
---@param is_loop? boolean 是否循环
---@param speed? number 速度
function M:play_animation(anim_name, start_time, end_time, is_loop, speed)
    self.phandle:api_play_animation(
        anim_name,
        start_time or 0,
        end_time or -1,
        is_loop or false,
        speed or 1
    )
end

---停止动画
---@param anim_name string 动画名字
function M:stop_animation(anim_name)
    self.phandle:api_stop_animation(anim_name)
end

---替换模型
---@param model_id py.ModelKey 模型id
function M:replace_model(model_id)
    self.phandle:api_replace_model(model_id)
end

---取消替换模型
---@param model_id py.ModelKey 模型id
function M:cancel_replace_model(model_id)
    self.phandle:api_cancel_replace_model(model_id)
end

---显示/隐藏
---@param is_visible boolean 是否显示
function M:set_visible(is_visible)
    self.phandle:api_show_hide(is_visible)
end

---获取可破坏物类型
---@return py.DestructibleKey type 可破坏物类型
function M:get_key()
    return GameAPI.get_dest_type(self.handle)
end

---获取可破坏物的名称
---@return string name 可破坏物的名称
function M:get_name()
    return self.phandle:api_get_str_attr("name") or ''
end

---获取可破坏物描述
---@return string description 描述
function M:get_description()
    return self.phandle:api_get_str_attr("description") or ''
end

---获取可破坏物的生命值
---@return number cur_hp 生命值
function M:get_hp()
    return y3.helper.tonumber(self.phandle:api_get_float_attr("hp_cur")) or 0.0
end

---获取可破坏物的资源名称
---@return string source_name 资源名称
function M:get_resource_name()
    return self.phandle:api_get_str_attr("source_desc") or ''
end

---获取可破坏物的生命值
---@return number hp 可破坏物的生命值
function M:get_max_hp()
    return y3.helper.tonumber(self.phandle:api_get_float_attr("hp_max")) or 0.0
end

---获取可破坏物的当前资源数
---@return number source_number 当前资源数
function M:get_resource()
    return self.phandle:api_get_dest_cur_source_nums() or 0.0
end

---获取可破坏物的最大资源数
---@return number max_number 最大资源数
function M:get_max_resource()
    return self.phandle:api_get_dest_max_source_nums() or 0.0
end

---获取可破坏物的玩家属性名
---@return py.RoleResKey player_res_key 玩家属性
function M:get_resource_type()
    return self.phandle:api_get_role_res_of_dest() or ''
end

---获取可破坏物的物品类型ID
---@return py.ItemKey item_key 物品类型ID
function M:get_item_type()
    return self.phandle:api_get_item_type_of_dest() or 0
end

---获取可破坏物的模型
---@return py.ModelKey model_key 模型id
function M:get_model()
    return self.phandle:api_get_dest_model() or 0
end

---获取可破坏物的高度
---@return number height 高度
function M:get_height()
    return y3.helper.tonumber(self.phandle:api_get_dest_height_offset()) or 0.0
end

---获取可破坏物的面向角度
---@return number rotation 面向角度
function M:get_facing()
    return y3.helper.tonumber(self.phandle:api_get_dest_face_angle()) or 0.0
end

---获取可破坏物对象的位置
---@return Point point 可破坏物的位置
function M:get_position()
    local py_point = self.phandle:api_get_position()
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

    return y3.destructible.get_by_handle(py_destructible) --[[@as Destructible]]
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

function M:is_destroyed()
    ---@diagnostic disable-next-line: undefined-field
    local yes = self.phandle:api_is_destroyed()
    if yes == nil then
        return true
    end
    return yes
end

return M
