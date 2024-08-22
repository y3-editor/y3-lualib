--技能
---@class Ability
---@field handle py.Ability
---@field phandle py.Ability
---@field package _removed_by_py? boolean
---@overload fun(id: integer, py_ability: py.Ability): self
local M = Class 'Ability'

---@class Ability: GCHost
Extends('Ability', 'GCHost')
---@class Ability: Storage
Extends('Ability', 'Storage')
---@class Ability: CustomEvent
Extends('Ability', 'CustomEvent')
---@class Ability: ObjectEvent
Extends('Ability', 'ObjectEvent')
---@class Ability: KV
Extends('Ability', 'KV')

function M:__tostring()
    return string.format('{ability|%s|%s} @ %s'
        , self:get_name()
        , self.handle
        , self:get_owner()
    )
end

---@param id integer
---@param py_ability py.Ability
---@return self
function M:__init(id, py_ability)
    self.id     = id
    self.handle = py_ability
    self.phandle = y3.py_proxy.wrap(py_ability, GameAPI.ability_is_exist)
    return self
end

function M:__del()
    M.ref_manager:remove(self.id)
    y3.py_proxy.kill(self.phandle)
    if self._removed_by_py then
        return
    end
    self.phandle:api_remove()
    --TODO
    --技能正在放的时候删不掉，需要不停尝试删除
    if GameAPI.ability_is_exist(self.handle) then
        y3.ltimer.loop_frame(1, function (timer, count)
            if not GameAPI.ability_is_exist(self.handle)
            or self._removed_by_py then
                timer:remove()
                return
            end
            self.phandle:api_remove()
        end)
    end
end

---@private
---@param id integer
---@param py_ability py.Ability
---@return Ability
M.ref_manager = New 'Ref' ('Ability', function (id, py_ability)
    return New 'Ability' (id, py_ability)
end)

---通过py层的技能实例获取lua层的技能实例
---@param py_ability py.Ability # py层的技能实例
---@return Ability? ability # 返回在lua层初始化后的lua层技能实例
function M.get_by_handle(py_ability)
    if not py_ability then
        return nil
    end
    local id = y3.py_proxy.wrap(py_ability, GameAPI.ability_is_exist):api_get_ability_global_id()
    return M.ref_manager:get(id, py_ability)
end

---@private
---@param id integer
---@return Ability
function M.get_by_id(id)
    return M.ref_manager:get(id)
end

y3.py_converter.register_py_to_lua('py.Ability', M.get_by_handle)
y3.py_converter.register_lua_to_py('py.Ability', function (lua_value)
    return lua_value.handle
end)

y3.py_event_sub.new_global_trigger('ET_ABILITY_LOSE', function (data)
    ---@type py.Ability
    local py_ability = data['__ability']
    if not py_ability then
        return
    end
    py_ability = y3.py_proxy.fetch(py_ability) or py_ability
    local id = py_ability:api_get_ability_global_id()
    local ability = M.ref_manager:fetch(id)
    if not ability then
        return
    end
    ability._removed_by_py = true
    ability:remove()
end)

function M:get_key()
    return self.phandle:api_get_ability_id()
end

---是否受冷却缩减影响
---@return boolean is_influenced 是否受冷却缩减影响
function M:is_cd_reduce()
    return self.phandle:api_get_influenced_by_cd_reduce() or false
end

---消耗生命是否会死亡
---@return boolean is_cost 消耗生命是否会死亡
function M:is_cost_hp_can_die()
    return self.phandle:api_get_cost_hp_can_die() or false
end

---生命不足是否可以释放
---@return boolean can_cast 生命不足是否可以释放
function M:can_cast_when_hp_insufficient()
    return self.phandle:api_get_can_cast_when_hp_insufficient() or false
end

---是否具有标签
---@param tag string 标签
---@return boolean
function M:has_tag(tag)
    return GlobalAPI.has_tag(self.handle,tag)
end

--添加标签
---@param tag string 标签
function M:add_tag(tag)
    self.phandle:api_add_tag(tag)
end

---移除标签
---@param tag string 标签
function M:remove_tag(tag)
    self.phandle:api_remove_tag(tag)
end

---启用技能
function M:enable()
    self.phandle:api_enable()
end

---禁用技能
function M:disable()
    self.phandle:api_disable()
end

---进入冷却
function M:restart_cd()
    self.phandle:api_restart_cd()
end

---完成冷却
function M:complete_cd()
    self.phandle:api_immediately_clear_cd()
end

---移除技能
function M:remove()
    Delete(self)
end

---设置技能等级
---@param level integer 等级
function M:set_level(level)
    self.phandle:api_set_level(level)
end

-- 获取技能等级
---@return integer level 等级
function M:get_level()
    return self.phandle:api_get_level() or 0
end

---增加冷却时间
---@param value number 冷却
function M:add_cd(value)
    self.phandle:api_change_ability_cd_cold_down(Fix32(value))
end

---设置充能层数
---@param value integer 层数
function M:set_stack(value)
    self.phandle:api_set_ability_stack_count(value)
end

function M:get_name()
    return self.phandle:api_get_name()
end

---设置实数属性
---@param key y3.Const.AbilityFloatAttr | string 属性key
---@param value number 属性值
function M:set_float_attr(key, value)
    self.phandle:api_set_float_attr(y3.const.AbilityFloatAttr[key] or key, Fix32(value))
end

---设置整数属性
---@param key y3.Const.AbilityIntAttr | string 属性key
---@param value integer 属性值
function M:set_int_attr(key, value)
    self.phandle:api_set_int_attr(y3.const.AbilityIntAttr[key] or key, value)
end

---设置剩余冷却时间
---@param value number 剩余冷却时间
function M:set_cd(value)
    self.phandle:api_set_ability_cd(Fix32(value))
end

---增加技能等级
---@param value integer 等级
function M:add_level(value)
    self.phandle:api_add_level(value)
end

---增加技能充能层数
---@param value integer 层数
function M:add_stack(value)
    self.phandle:api_add_ability_stack_count(value)
end

---增加技能剩余冷却时间
---@param value number 剩余冷却时间
function M:add_remaining_cd(value)
    self.phandle:api_add_ability_cd(Fix32(value))
end

---增加实数属性
---@param key string 属性key
---@param value number 属性值
function M:add_float_attr(key, value)
    self.phandle:api_add_float_attr(key, Fix32(value))
end

---增加整数属性
---@param key string 属性key
---@param value integer 属性值
function M:add_int_attr(key, value)
    self.phandle:api_add_int_attr(key, value)
end

---设置技能名字
---@param name string 技能名字
function M:set_name(name)
    self.phandle:api_set_name(name)
end

---设置技能描述
---@param des string 描述
function M:set_description(des)
    -- TODO 见问题1
    ---@diagnostic disable-next-line: param-type-mismatch
    self.phandle:api_set_str_attr("desc", des)
end

--获取技能描述
---@return string
function M:get_description()
    ---@diagnostic disable-next-line: param-type-mismatch
    return self.phandle:api_get_str_attr("desc") or ''
end

---学习技能
function M:learn()
    self.phandle:api_learn_ability()
end

---设置技能剩余充能时间
---@param value number 剩余充能时间
function M:set_charge_time(value)
    self.phandle:api_set_ability_cur_stack_cd(Fix32(value))
end

---设置技能施法范围
---@param value number 施法范围
function M:set_range(value)
    self.phandle:api_set_ability_cast_range(Fix32(value))
end

---获取技能施法范围
---@return number # 施法范围
function M:get_range()
    return y3.helper.tonumber(self.phandle:api_get_ability_cast_range()) or 0.0
end

---设置技能玩家属性消耗
---@param key string 属性key
---@param value number 属性值
function M:set_player_attr_cost(key, value)
    self.phandle:api_set_ability_player_attr_cost(key, Fix32(value))
end

---增加技能玩家属性消耗
---@param key string 属性key
---@param value number 属性值
function M:add_player_attr_cost(key, value)
    self.phandle:api_add_ability_player_attr_cost(key, Fix32(value))
end

---设置技能是否受冷却缩减的影响
---@param is_influenced boolean 属性key
function M:set_cd_reduce(is_influenced)
    self.phandle:api_set_influenced_by_cd_reduce(is_influenced)
end

---设置消耗生命是否会死亡
---@param can_die boolean 是否会死亡
function M:set_is_cost_hp_can_die(can_die)
    self.phandle:api_set_cost_hp_can_die(can_die)
end

---设置生命不足时是否可以释放技能
---@param can_cast boolean 是否可以释放
function M:set_can_cast_when_hp_insufficient(can_cast)
    self.phandle:api_set_can_cast_when_hp_insufficient(can_cast)
end

---设置扇形指示器半径
---@param value number 半径
function M:set_sector_radius(value)
    self.phandle:api_set_ability_sector_radius(Fix32(value))
end

---设置扇形指示器夹角
---@param value number 角度
function M:set_sector_angle(value)
    self.phandle:api_set_ability_sector_angle(Fix32(value))
end

---设置箭头/多段指示器长度
---@param value number 长度
function M:set_arrow_length(value)
    self.phandle:api_set_ability_arrow_length(Fix32(value))
end

---设置箭头/多段指示器宽度
---@param value number 宽度
function M:set_arrow_width(value)
    self.phandle:api_set_ability_arrow_width(Fix32(value))
end


---设置箭圆形指示器半径
---@param value number 半径
function M:set_circle_radius(value)
    self.phandle:api_set_ability_circle_radius(Fix32(value))
end

---设置技能指示器类型
---@param type y3.Const.AbilityPointerType 技能指示器类型
function M:set_pointer_type(type)
    self.phandle:api_set_ability_pointer_type(type)
end

---获取技能当前剩余充能时间
---@return number
function M:get_charge_time()
    return y3.helper.tonumber(self.phandle:api_get_stack_cd_left_time()) or 0.0
end

---获取技能种类
---@return y3.Const.AbilityType type 技能种类
function M:get_type()
    return self.phandle:api_get_type() or 0
end

---获取技能所在技能位
---@return y3.Const.AbilityIndex index 技能所在技能位
function M:get_slot()
    return self.phandle:api_get_ability_index() or 0
end

---获取技能消耗的玩家属性值
---@param key string 属性key
---@return number cost 玩家属性值
function M:get_player_attr_cost(key)
    return y3.helper.tonumber(self.phandle:api_get_ability_player_attr_cost(key)) or 0.0
end

---获取技能释放类型 AbilityCastType
---@return py.AbilityCastType type 技能释放类型
function M:get_cast_type()
    return self.phandle:api_get_ability_cast_type() or 0
end

---自动施法是否开启
---@return boolean is_enabled 是否开启
function M:is_autocast_enabled()
    return self.phandle:api_is_autocast_enabled() or false
end

---获取技能公式类型的kv
---@param key string 键值key
---@return number value 值
function M:get_formula_kv(key)
    return y3.helper.tonumber(self.phandle:api_calc_ability_formula_kv(key)) or 0.0
end

---获取实数属性
---@param key y3.Const.AbilityFloatAttr | string 键值key
---@return number value 值
function M:get_float_attr(key)
    return y3.helper.tonumber(self.phandle:api_get_float_attr(y3.const.AbilityFloatAttr[key] or key)) or 0.0
end

---获取整数属性
---@param key y3.Const.AbilityIntAttr | string 键值key
---@return number value 值
function M:get_int_attr(key)
    return self.phandle:api_get_int_attr(y3.const.AbilityIntAttr[key] or key) or 0
end

---获取字符串属性
---@param key string 键值key
---@return string value 值
function M:get_string_attr(key)
    ---@diagnostic disable-next-line: param-type-mismatch
    return self.phandle:api_get_str_attr(key) or ''
end

---获取技能的拥有者
---@return Unit? owner 技能拥有者
function M:get_owner()
    local py_unit = self.phandle:api_get_owner()
    if not py_unit then
        return nil
    end
    return y3.unit.get_by_handle(py_unit)
end

---获取当前冷却时间
---@return number time 当前冷却时间
function M:get_cd()
    return y3.helper.tonumber(self.phandle:api_get_cd_left_time()) or 0.0
end

---是否存在
---@return boolean is_exist 是否存在
function M:is_exist()
    return GameAPI.ability_is_exist(self.handle)
end

---@param cast integer 施法ID
---@return Unit|Destructible|Item|Point|nil target 目标
function M:get_target(cast)
    local unit = GameAPI.get_target_unit_in_ability(self.handle,cast)
    if unit then
        return y3.unit.get_by_handle(unit)
    end

    local dest = GameAPI.get_target_dest_in_ability(self.handle, cast)
    if dest then
        return y3.destructible.get_by_handle(dest)
    end

    local item = GameAPI.get_target_item_in_ability(self.handle,cast)
    if item then
        return y3.item.get_by_handle(item)
    end

    local point = self.phandle:api_get_release_position(cast)
    if point then
        return y3.point.get_by_handle(point)
    end

    return nil
end

---显示技能指示器
---@param player Player 玩家
function M:show_indicator(player)
    GameAPI.create_preview_skill_pointer(player.handle, self.handle)
end

---开关自动施法
---@param enable boolean 开关
function M:set_autocast(enable)
    self.phandle:api_set_autocast_enabled(enable)
end

--------------------------------------------------------类的方法--------------------------------------------------------

---检查技能类型前置条件
---@param player Player 玩家
---@param ability_key py.AbilityKey 技能类型id (物编id)
---@return boolean is_meet 技能类型前置条件是否满足
function M.check_precondition_by_key(player, ability_key)
    return GameAPI.check_ability_key_precondition(player.handle, ability_key)
end

---技能类型是否受冷却缩减影响
---@param ability_key py.AbilityKey 技能类型id (物编id)
---@return boolean is_influenced 技能类型是否受冷却缩减影响
function M.is_cd_reduce_by_key(ability_key)
    return GameAPI.api_get_influenced_by_cd_reduce(ability_key)
end

--获取技能类型实数属性
--> 请使用 `y3.object.ability[ability_key].data` 代替
---@deprecated
---@param ability_key py.AbilityKey 技能类型id (物编id)
---@param key string 键值key
---@return number value 值
function M.get_float_attr_by_key(ability_key, key)
    return y3.helper.tonumber(GameAPI.get_ability_conf_float_attr(ability_key, key)) or 0.0
end

--获取技能类型整数属性
--> 请使用 `y3.object.ability[ability_key].data` 代替
---@deprecated
---@param ability_key py.AbilityKey 技能类型id (物编id)
---@param key string 键值key
---@return integer value 值
function M.get_int_attr_by_key(ability_key, key)
    return GameAPI.get_ability_conf_int_attr(ability_key,key)
end

---设置玩家的普攻预览状态
---@param player Player 玩家
---@param state boolean 状态 开/关
function M.set_normal_attack_preview_state(player, state)
    GameAPI.set_preview_common_atk_range(player.handle, state)
end

---设置玩家的指示器在智能施法时是否显示
---@param player Player 玩家
---@param state boolean 状态 开/关
function M.set_smart_cast_with_pointer(player, state)
    GameAPI.set_smart_cast_with_pointer(player.handle, state)
end

---关闭技能指示器
---@param player Player 玩家
function M.hide_pointer(player)
    GameAPI.clear_preview_skill_pointer(player.handle)
end

---获取技能类型的icon图标的图片ID
---@param ability_key py.AbilityKey 技能类型id (物编id)
---@return py.Texture id 图片ID
function M.get_icon_by_key(ability_key)
    return GameAPI.get_icon_id_by_ability_type(ability_key) --[[@as py.Texture]]
end

--获取技能图标
---@return py.Texture id 图片ID
function M:get_icon()
    return M.get_icon_by_key(self:get_key())
end

---获取技能类型公式属性
---@param ability_id py.AbilityKey 技能类型id(物编id)
---@param attr_name string 属性名称
---@param level integer 技能等级
---@param stack_count integer 技能层数
---@param unit_hp_max number 单位最大生命
---@param unit_hp_cur number 单位当前生命
---@return number value 值
function M.get_formula_attr_by_key(ability_id, attr_name, level, stack_count, unit_hp_max, unit_hp_cur)
    return y3.helper.tonumber(GameAPI.get_ability_conf_formula_attr(ability_id, attr_name, level, stack_count, Fix32(unit_hp_max), Fix32(unit_hp_cur))) or 0.0
end

--获取技能类型字符串属性
--> 请改用 `y3.object.ability[ability_key].data` 代替
---@deprecated
---@param ability_key py.AbilityKey 技能类型id (物编id)
---@param key py.AbilityStrAttr 键值key
---@return string str 值
function M.get_str_attr_by_key(ability_key, key)
    return GameAPI.get_ability_conf_str_attr(ability_key, key)
end

--根据技能的key获取技能名字
---@param ability_key py.AbilityKey
---@return string name 技能名字
function M.get_name_by_key(ability_key)
    ---@diagnostic disable-next-line: param-type-mismatch
    return GameAPI.get_ability_conf_str_attr(ability_key, 'name')
end

--根据技能的key获取技能描述
---@param ability_key py.AbilityKey
---@return string des 描述
function M.get_description_by_key(ability_key)
    ---@diagnostic disable-next-line: param-type-mismatch
    return GameAPI.get_ability_conf_str_attr(ability_key, 'description')
end

---设置技能图标
---@param icon_id integer 图片id
function M:set_icon(icon_id)
    self.phandle:api_set_ability_icon(icon_id)
end

---设置技能的建造朝向
---@param angle number 角度
function M:set_build_rotate(angle)
    self.phandle:api_set_ability_build_rotate(Fix32(angle))
end

---获取技能的指示器类型
---@return y3.Const.AbilityPointerType
function M:get_skill_pointer()
    return self.phandle:api_get_ability_skill_pointer() or 0
end

---获取技能类型的指示器类型
---@param name py.AbilityKey
---@return y3.Const.AbilityPointerType
function M.get_skill_type_pointer(name)
    return GameAPI.get_ability_key_skill_pointer(name)
end

---设置技能最大CD
---@param value number
function M:set_max_cd(value)
    self:set_float_attr("cold_down_time", value)
end

--获取技能最大CD
---@return number
function M:get_max_cd()
    return self:get_float_attr("cold_down_time")
end

---进入技能准备施法状态
---@param player Player 玩家
function M:pre_cast(player)
	GameAPI.start_skill_pointer(player.handle, self.handle)
end

--获取技能绑定的物品（技能对象在哪个物品对象上）
---@return Item?
function M:get_item()
    local py_item = self.phandle:api_get_item()
    if not py_item then
        return nil
    end
    return y3.item.get_by_handle(py_item)
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
