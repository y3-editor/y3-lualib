-- 此文件由 `tools/genGameAPI` 生成，请勿手动修改。
---@meta

---@class py.ModifierEntity
local ModifierEntity = {}

--增加buff最大层数
---@param attr_num integer # 整数属性值
function ModifierEntity:api_add_buff_max_layer(attr_num) end

--增加buff实例层数
---@param plus_layer integer # 整数属性值
function ModifierEntity:api_add_buff_layer(plus_layer) end

--增加buff的剩余持续时间
---@param residue_time py.Fixed # 浮点数剩余时间
function ModifierEntity:api_add_buff_residue_time(residue_time) end

--增加buff浮点属性效果
---@param attr_name string # 属性名称
---@param attr_num py.Fixed # 浮点数属性值
function ModifierEntity:api_add_float_shield(attr_name, attr_num) end

--增加循环周期事件的循环时间
---@param add_cycle_time py.Fixed # 浮点数属性值
function ModifierEntity:api_add_cycle_time(add_cycle_time) end

--阻止即将获得的魔法效果
---@return boolean? # 返回值
function ModifierEntity:api_prevent_will_modifier() end

--删除魔法效果
---@return boolean? # 返回值
function ModifierEntity:api_remove() end

--增加魔法效果光环影响范围
---@param add_value py.Fixed # 浮点数属性值
function ModifierEntity:api_add_modifier_halo_influence_rng(add_value) end

--获取效果携带者
---@return py.Unit? # 效果携带者
function ModifierEntity:api_get_owner() end

--获取效果释放者
---@return py.Unit? # 效果释放者
function ModifierEntity:api_get_releaser() end

--获取剩余持续时间
---@return py.Fixed? # 剩余持续时间
function ModifierEntity:api_get_residue_time() end

--获取已经持续时间
---@return py.Fixed? # 已经持续时间
function ModifierEntity:api_get_passed_time() end

--获取buff关联技能id
---@return integer? # 最大堆叠层数
function ModifierEntity:api_get_from_ability_id() end

--获取buff最大堆叠层数
---@return integer? # 最大堆叠层数
function ModifierEntity:api_get_layer_max() end

--获取buff类别
---@param attr_name string # 属性名称
---@return py.ModifierType? # 魔法效果类别
function ModifierEntity:api_get_modifier_type(attr_name) end

--获取buff影响类型
---@param attr_name string # 属性名称
---@return py.ModifierEffectType? # 魔法效果影响类别
function ModifierEntity:api_get_modifier_effect_type(attr_name) end

--获取buff浮点属性效果
---@param attr_name string # 属性名称
---@return py.Fixed? # 浮点数返回类型
function ModifierEntity:api_get_float_attr(attr_name) end

--获取buff循环周期
---@return py.Fixed? # 浮点数返回类型
function ModifierEntity:api_get_cycle_time() end

--获取光环魔法效果的子光环类型
---@return py.ModifierKey? # 魔法效果编号
function ModifierEntity:api_get_sub_halo_modifier_key() end

--获取子光环的光环实体
---@return py.ModifierEntity? # 魔法效果对象
function ModifierEntity:api_get_halo_modifier_instance() end

--获取光环的范围
---@return number? # 光环影响范围
function ModifierEntity:api_get_halo_inf_rng() end

--获取即将获得魔法效果的单位
---@return py.Unit? # 单位
function ModifierEntity:api_get_will_modifier_unit() end

--获取即将获得魔法效果类型
---@return py.ModifierKey? # 魔法效果编号
function ModifierEntity:api_get_will_modifier_key() end

--获取buff的唯一id
---@return integer? # 魔法效果唯一ID
function ModifierEntity:api_get_modifier_unique_id() end

--获取buff的类型key
---@return py.ModifierKey? # 魔法效果key
function ModifierEntity:api_get_modifier_key() end

--获取buff整数属性效果
---@param attr_name string # 属性名称
---@return integer? # 整数类型返回值
function ModifierEntity:api_get_int_attr(attr_name) end

--获取buff字符属性效果
---@param attr_name string # 属性名称
---@return string? # 字符类型返回值
function ModifierEntity:api_get_str_attr(attr_name) end

--获取buff图标是否可见
---@return boolean? # 布尔值
function ModifierEntity:api_get_icon_is_visible() end

--获取魔法效果等级
---@return integer? # 等级
function ModifierEntity:api_get_modifier_level() end

--获取魔法效果的堆叠层数
---@return integer? # 堆叠层数
function ModifierEntity:api_get_modifier_layer() end

--设置buff整数属性效果
---@param attr_num integer # 整数属性值
function ModifierEntity:api_set_buff_max_layer(attr_num) end

--设置buff实例层数
---@param attr_num integer # 整数属性值
function ModifierEntity:api_set_buff_layer(attr_num) end

--设置buff的剩余持续时间
---@param residue_time py.Fixed # 浮点数剩余时间
function ModifierEntity:api_set_buff_residue_time(residue_time) end

--设置buff浮点属性效果
---@param attr_name string # 属性名称
---@param attr_num py.Fixed # 浮点数属性值
function ModifierEntity:api_set_float_shield(attr_name, attr_num) end

--设置循环周期事件
---@param new_cycle_time py.Fixed # 浮点数属性值
function ModifierEntity:api_set_cycle_time(new_cycle_time) end

--设置魔法效果的持续时间
---@param residue_time py.Fixed # 非负数实数值
function ModifierEntity:api_set_duration(residue_time) end

--设置buff的字符串属性
---@param name string # 属性名称
---@param value string # 属性值
function ModifierEntity:api_set_buff_str_attr(name, value) end

--对魔法效果所属单位的所属玩家关系播放音乐
---@param camp_target py.RoleRelation # 玩家关系
---@param sid py.AudioKey # 乐曲编号
---@param loop boolean # 是否循环
function ModifierEntity:api_play_sound_by_mod_for_role_relation(camp_target, sid, loop) end

--设置魔法效果光环影响范围
---@param value py.Fixed # 浮点数属性值
function ModifierEntity:api_set_modifier_halo_influence_rng(value) end

--设置魔法效果的图标
---@param icon integer # 图标
function ModifierEntity:api_set_modifier_icon(icon) end

--魔法效果添加标签
---@param tag string # 标签
function ModifierEntity:api_add_modifier_tag(tag) end

--魔法效果去除标签
---@param tag string # 标签
function ModifierEntity:api_remove_modifier_tag(tag) end
