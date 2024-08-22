--魔法效果
---@class Buff
---@field handle py.ModifierEntity # py层的魔法效果对象
---@field phandle py.ModifierEntity # 代理的对象，用这个调用引擎的方法会快得多
---@field id     integer
---@field package _removed_by_py? boolean
---@overload fun(id: integer, py_modifier: py.ModifierEntity): Buff
local M = Class 'Buff'

M.type = 'buff'

---@class Buff: Storage
Extends('Buff', 'Storage')
---@class Buff: GCHost
Extends('Buff', 'GCHost')
---@class Buff: CustomEvent
Extends('Buff', 'CustomEvent')
---@class Buff: ObjectEvent
Extends('Buff', 'ObjectEvent')
---@class Buff: KV
Extends('Buff', 'KV')
---@class Buff: ObjectEvent
Extends('Buff', 'ObjectEvent')

function M:__tostring()
    return string.format('{buff|%s|%s} @ %s'
        , self:get_name()
        , self.handle
        , self:get_owner()
    )
end

---@param id integer
---@param py_modifier py.ModifierEntity
---@return Buff
function M:__init(id, py_modifier)
    self.id     = id
    self.handle = py_modifier
    self.phandle = y3.py_proxy.wrap(py_modifier, GameAPI.modifier_is_exist)
    return self
end

function M:__del()
    M.ref_manager:remove(self.id)
    y3.py_proxy.kill(self.phandle)
    if self._removed_by_py then
        return
    end
    self.phandle:api_remove()
end

---所有魔法效果实例
---@private
---@param id integer
---@param py_buff py.ModifierEntity
---@return Buff
M.ref_manager = New 'Ref' ('Buff', function (id, py_buff)
    return New 'Buff' (id, py_buff)
end)

---通过py层的魔法效果实例获取lua层的魔法效果实例
---@param  py_buff py.ModifierEntity # py层的魔法效果实例
---@return Buff? # 返回在lua层初始化后的lua层魔法效果实例
function M.get_by_handle(py_buff)
    if not py_buff then
        return nil
    end
    local id = y3.py_proxy.wrap(py_buff, GameAPI.modifier_is_exist):api_get_modifier_unique_id()
    return M.ref_manager:get(id, py_buff)
end

---@param id integer
---@return Buff
function M.get_by_id(id)
    return M.ref_manager:get(id)
end

y3.py_converter.register_type_alias('py.ModifierEntity', 'Buff')
y3.py_converter.register_py_to_lua('py.ModifierEntity', M.get_by_handle)
y3.py_converter.register_lua_to_py('py.ModifierEntity', function (lua_value)
    return lua_value.handle
end)

y3.py_event_sub.new_global_trigger('ET_LOSS_MODIFIER', function (data)
    ---@type py.ModifierEntity
    local py_modifier = data['__modifier']
    if not py_modifier then
        return
    end
    py_modifier = y3.py_proxy.fetch(py_modifier) or py_modifier
    local id = py_modifier:api_get_modifier_unique_id()
    local buff = M.ref_manager:fetch(id)
    if not buff then
        return
    end
    buff._removed_by_py = true
    buff:remove()
end)

---是否具有标签
---@param tag string 标签
---@return boolean
function M:has_tag(tag)
    return GlobalAPI.has_tag(self.handle, tag)
end

---魔法效果的图标是否可见
---@return boolean is_visible 是否可见
function M:is_icon_visible()
    return self.phandle:api_get_icon_is_visible() or false
end

---移除
function M:remove()
    Delete(self)
end

---是否存在
---@return boolean is_exist 是否存在
function M:is_exist()
    return GameAPI.modifier_is_exist(self.handle)
end

---设置魔法效果的名称
---@param name string 名字
function M:set_name(name)
    self.phandle:api_set_buff_str_attr("name_str", name)
end

---设置魔法效果对象的描述
---@param description string 描述
function M:set_description(description)
    self.phandle:api_set_buff_str_attr("description", description)
end

---设置剩余持续时间
---@param time number 剩余持续时间
function M:set_time(time)
    self.phandle:api_set_buff_residue_time(Fix32(time))
end

---增加剩余持续时间
---@param time number 剩余持续时间
function M:add_time(time)
    self.phandle:api_add_buff_residue_time(Fix32(time))
end

---设置堆叠层数
---@param stack integer 层数
function M:set_stack(stack)
    self.phandle:api_set_buff_layer(stack)
end

---增加堆叠层数
---@param stack integer 层数
function M:add_stack(stack)
    self.phandle:api_add_buff_layer(stack)
end

---设置护盾值
---@param value number 护盾值
function M:set_shield(value)
    self.phandle:api_set_float_shield('', Fix32(value))
end

---增加护盾值
---@param value number 护盾值
function M:add_shield(value)
    self.phandle:api_add_float_shield('', Fix32(value))
end

---获取魔法效果的堆叠层数
---@return integer stack 层数
function M:get_stack()
    return self.phandle:api_get_modifier_layer() or 0
end

---获取魔法效果的剩余持续时间
---@return number time 剩余持续时间
function M:get_time()
    return y3.helper.tonumber(self.phandle:api_get_residue_time()) or 0.0
end

---获取魔法效果类型
---@return y3.Const.ModifierType type 魔法效果类型
function M:get_buff_type()
    return self.phandle:api_get_modifier_type("modifier_type") or 0
end

---获取魔法效果影响类型
---@return y3.Const.EffectType type 魔法效果影响类型
function M:get_buff_effect_type()
    return self.phandle:api_get_modifier_effect_type("modifier_effect") or 0
end

---获取魔法效果的最大堆叠层数
---@return integer stack 层数
function M:get_max_stack()
    return self.phandle:api_get_int_attr("layer_max") or 0
end

---获取魔法效果的护盾
---@return number shield 护盾值
function M:get_shield()
    return y3.helper.tonumber(self.phandle:api_get_float_attr("cur_properties_shield")) or 0.0
end

---获取所属光环
---@return Buff? aura 所属光环
function M:get_aura()
    local py_modifier = self.phandle:api_get_halo_modifier_instance()
    if not py_modifier then
        return nil
    end
    return M.get_by_handle(py_modifier)
end

---获取魔法效果循环周期
---@return number time 循环周期
function M:get_cycle_time()
    return y3.helper.tonumber(self.phandle:api_get_cycle_time()) or 0.0
end

---魔法效果的已持续时间
---@return number duration 持续时间
function M:get_passed_time()
    return y3.helper.tonumber(self.phandle:api_get_passed_time()) or 0.0
end

---获取魔法效果的光环效果类型ID
---@return py.ModifierKey type 光环效果类型ID
function M:get_buff_aura_effect_key()
    return self.phandle:api_get_sub_halo_modifier_key() or 0
end

---获取魔法效果的光环范围
---@return number range 光环范围
function M:get_buff_aura_range()
    return self.phandle:api_get_halo_inf_rng() or 0.0
end

---获取魔法效果的施加者
---@return Unit? provider 施加者
function M:get_source()
    local py_unit = self.phandle:api_get_releaser()
    if not py_unit then
        return nil
    end
    return y3.unit.get_by_handle(py_unit)
end

---获取魔法效果的携带者
---@return Unit? owner 携带者
function M:get_owner()
    local py_unit = self.phandle:api_get_owner()
    if not py_unit then
        return nil
    end
    return y3.unit.get_by_handle(py_unit)
end

---获取魔法效果对象的名称
---@return string name 名字
function M:get_name()
    return self.phandle:api_get_str_attr("name_str") or ''
end

---获取魔法效果对象的描述
---@return string description 描述
function M:get_description()
    return self.phandle:api_get_str_attr("description") or ''
end

---获取等级
---@return integer level 等级
function M:get_level()
    return self.phandle:api_get_modifier_level() or 0
end

---魔法效果类型的图标是否可见
---@param buff_key py.ModifierKey 类型
---@return boolean is_visible 是否可见
function M.is_icon_visible_by_key(buff_key)
    return GameAPI.is_show_on_ui_by_buff_type(buff_key)
end

---获得魔法效果的类别
---@return py.ModifierKey buff_key 类别
function M:get_key()
    return GameAPI.get_type_of_modifier_entity(self.handle)
end

---获取魔法效果类型的描述
---@param buff_key py.ModifierKey 类型
---@return string description 描述
function M.get_description_by_key(buff_key)
    return GameAPI.get_modifier_desc_by_type(buff_key)
end

---获取魔法效果类型的icon图标的图片
---@param buff_key py.ModifierKey 类型
---@return py.Texture # 图片id
function M.get_icon_by_key(buff_key)
    return GameAPI.get_icon_id_by_buff_type(buff_key) --[[@as py.Texture]]
end

---获得关联技能
---@return Ability|nil ability 投射物或魔法效果的关联技能
function M:get_ability()
    local py_ability = GlobalAPI.get_related_ability(self.handle)
    if py_ability then
        return y3.ability.get_by_handle(py_ability)
    end
    return nil
end

---增加魔法效果光环影响范围
---@param range number 影响范围
function M:add_aura_range(range)
    self.phandle:api_add_modifier_halo_influence_rng(Fix32(range))
end

---设置魔法效果光环影响范围
---@param range number 影响范围
function M:set_aura_range(range)
    self.phandle:api_set_modifier_halo_influence_rng(Fix32(range))
end

---增加魔法效果循环周期
---@param time number 变化时间
function M:add_cycle_time(time)
    self.phandle:api_add_cycle_time(Fix32(time))
end

---设置魔法效果循环周期
---@param time number 循环周期
function M:set_cycle_time(time)
    self.phandle:api_set_cycle_time(Fix32(time))
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
