-- 此文件由 `tools/genGameAPI` 生成，请勿手动修改。
---@meta

---@class py.GameAPI
GameAPI = {}

--获取全局触发器UNIT_NAME数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.UnitKey # 值
function GameAPI.get_trigger_list_variable_unit_name(key, index) end

--获取触发器UNIT_NAME数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.UnitKey # 值
function GameAPI.get_trigger_list_actor_variable_unit_name(actor, key, index) end

--获取全局触发器UNIT_NAME数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_unit_name(key) end

--获取触发器UNIT_NAME 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_unit_name(actor, key) end

--获取全局触发器UNIT_NAME_POOL非数组变量
---@param key string # 变量名称
---@return py.UnitKeyPool # 值
function GameAPI.get_trigger_variable_unit_name_pool(key) end

--获取触发器UNIT_NAME_POOL非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.UnitKeyPool # 值
function GameAPI.get_trigger_actor_variable_unit_name_pool(actor, key) end

--获取全局触发器UNIT_NAME_POOL数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.UnitKeyPool # 值
function GameAPI.get_trigger_list_variable_unit_name_pool(key, index) end

--获取触发器UNIT_NAME_POOL数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.UnitKeyPool # 值
function GameAPI.get_trigger_list_actor_variable_unit_name_pool(actor, key, index) end

--获取全局触发器UNIT_NAME_POOL数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_unit_name_pool(key) end

--获取触发器UNIT_NAME_POOL 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_unit_name_pool(actor, key) end

--获取全局触发器UNIT_WRITE_ATTRIBUTE非数组变量
---@param key string # 变量名称
---@return string # 值
function GameAPI.get_trigger_variable_unit_write_attribute(key) end

--获取触发器UNIT_WRITE_ATTRIBUTE非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return string # 值
function GameAPI.get_trigger_actor_variable_unit_write_attribute(actor, key) end

--获取全局触发器UNIT_WRITE_ATTRIBUTE数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return string # 值
function GameAPI.get_trigger_list_variable_unit_write_attribute(key, index) end

--获取触发器UNIT_WRITE_ATTRIBUTE数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return string # 值
function GameAPI.get_trigger_list_actor_variable_unit_write_attribute(actor, key, index) end

--获取全局触发器UNIT_WRITE_ATTRIBUTE数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_unit_write_attribute(key) end

--获取触发器UNIT_WRITE_ATTRIBUTE 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_unit_write_attribute(actor, key) end

--获取全局触发器ATTR_ELEMENT非数组变量
---@param key string # 变量名称
---@return string # 值
function GameAPI.get_trigger_variable_attr_element(key) end

--获取触发器ATTR_ELEMENT非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return string # 值
function GameAPI.get_trigger_actor_variable_attr_element(actor, key) end

--获取全局触发器ATTR_ELEMENT数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return string # 值
function GameAPI.get_trigger_list_variable_attr_element(key, index) end

--获取触发器ATTR_ELEMENT数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return string # 值
function GameAPI.get_trigger_list_actor_variable_attr_element(actor, key, index) end

--获取全局触发器ATTR_ELEMENT数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_attr_element(key) end

--获取触发器ATTR_ELEMENT 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_attr_element(actor, key) end

--获取全局触发器ATTR_ELEMENT_READ非数组变量
---@param key string # 变量名称
---@return string # 值
function GameAPI.get_trigger_variable_attr_element_read(key) end

--获取触发器ATTR_ELEMENT_READ非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return string # 值
function GameAPI.get_trigger_actor_variable_attr_element_read(actor, key) end

--获取全局触发器ATTR_ELEMENT_READ数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return string # 值
function GameAPI.get_trigger_list_variable_attr_element_read(key, index) end

--获取触发器ATTR_ELEMENT_READ数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return string # 值
function GameAPI.get_trigger_list_actor_variable_attr_element_read(actor, key, index) end

--获取全局触发器ATTR_ELEMENT_READ数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_attr_element_read(key) end

--获取触发器ATTR_ELEMENT_READ 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_attr_element_read(actor, key) end

--获取全局触发器MOVER_ENTITY非数组变量
---@param key string # 变量名称
---@return py.Mover # 值
function GameAPI.get_trigger_variable_mover_entity(key) end

--获取触发器MOVER_ENTITY非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.Mover # 值
function GameAPI.get_trigger_actor_variable_mover_entity(actor, key) end

--获取全局触发器MOVER_ENTITY数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.Mover # 值
function GameAPI.get_trigger_list_variable_mover_entity(key, index) end

--获取触发器MOVER_ENTITY数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.Mover # 值
function GameAPI.get_trigger_list_actor_variable_mover_entity(actor, key, index) end

--获取全局触发器MOVER_ENTITY数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_mover_entity(key) end

--获取触发器MOVER_ENTITY 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_mover_entity(actor, key) end

--获取全局触发器IMAGE_QUALITY非数组变量
---@param key string # 变量名称
---@return string # 值
function GameAPI.get_trigger_variable_image_quality(key) end

--获取触发器IMAGE_QUALITY非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return string # 值
function GameAPI.get_trigger_actor_variable_image_quality(actor, key) end

--获取全局触发器IMAGE_QUALITY数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return string # 值
function GameAPI.get_trigger_list_variable_image_quality(key, index) end

--获取触发器IMAGE_QUALITY数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return string # 值
function GameAPI.get_trigger_list_actor_variable_image_quality(actor, key, index) end

--获取全局触发器IMAGE_QUALITY数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_image_quality(key) end

--获取触发器IMAGE_QUALITY 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_image_quality(actor, key) end

--获取全局触发器WINDOW_TYPE_SETTING非数组变量
---@param key string # 变量名称
---@return string # 值
function GameAPI.get_trigger_variable_window_type_setting(key) end

--获取触发器WINDOW_TYPE_SETTING非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return string # 值
function GameAPI.get_trigger_actor_variable_window_type_setting(actor, key) end

--获取全局触发器WINDOW_TYPE_SETTING数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return string # 值
function GameAPI.get_trigger_list_variable_window_type_setting(key, index) end

--获取触发器WINDOW_TYPE_SETTING数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return string # 值
function GameAPI.get_trigger_list_actor_variable_window_type_setting(actor, key, index) end

--获取全局触发器WINDOW_TYPE_SETTING数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_window_type_setting(key) end

--获取触发器WINDOW_TYPE_SETTING 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_window_type_setting(actor, key) end

--获取全局触发器DAMAGE_ATTACK_TYPE非数组变量
---@param key string # 变量名称
---@return integer # 值
function GameAPI.get_trigger_variable_damage_attack_type(key) end

--获取触发器DAMAGE_ATTACK_TYPE非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return integer # 值
function GameAPI.get_trigger_actor_variable_damage_attack_type(actor, key) end

--获取全局触发器DAMAGE_ATTACK_TYPE数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return integer # 值
function GameAPI.get_trigger_list_variable_damage_attack_type(key, index) end

--获取触发器DAMAGE_ATTACK_TYPE数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return integer # 值
function GameAPI.get_trigger_list_actor_variable_damage_attack_type(actor, key, index) end

--获取全局触发器DAMAGE_ATTACK_TYPE数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_damage_attack_type(key) end

--获取触发器DAMAGE_ATTACK_TYPE 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_damage_attack_type(actor, key) end

--获取全局触发器DAMAGE_ARMOR_TYPE非数组变量
---@param key string # 变量名称
---@return integer # 值
function GameAPI.get_trigger_variable_damage_armor_type(key) end

--获取触发器DAMAGE_ARMOR_TYPE非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return integer # 值
function GameAPI.get_trigger_actor_variable_damage_armor_type(actor, key) end

--获取全局触发器DAMAGE_ARMOR_TYPE数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return integer # 值
function GameAPI.get_trigger_list_variable_damage_armor_type(key, index) end

--获取触发器DAMAGE_ARMOR_TYPE数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return integer # 值
function GameAPI.get_trigger_list_actor_variable_damage_armor_type(actor, key, index) end

--获取全局触发器DAMAGE_ARMOR_TYPE数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_damage_armor_type(key) end

--获取触发器DAMAGE_ARMOR_TYPE 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_damage_armor_type(actor, key) end

--获取全局触发器ITEM_ENTITY非数组变量
---@param key string # 变量名称
---@return py.Item # 值
function GameAPI.get_trigger_variable_item_entity(key) end

--获取触发器ITEM_ENTITY非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.Item # 值
function GameAPI.get_trigger_actor_variable_item_entity(actor, key) end

--获取全局触发器ITEM_ENTITY数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.Item # 值
function GameAPI.get_trigger_list_variable_item_entity(key, index) end

--获取触发器ITEM_ENTITY数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.Item # 值
function GameAPI.get_trigger_list_actor_variable_item_entity(actor, key, index) end

--获取全局触发器ITEM_ENTITY数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_item_entity(key) end

--获取触发器ITEM_ENTITY 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_item_entity(actor, key) end

--获取全局触发器ITEM_GROUP非数组变量
---@param key string # 变量名称
---@return py.ItemGroup # 值
function GameAPI.get_trigger_variable_item_group(key) end

--获取触发器ITEM_GROUP非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.ItemGroup # 值
function GameAPI.get_trigger_actor_variable_item_group(actor, key) end

--获取全局触发器ITEM_GROUP数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.ItemGroup # 值
function GameAPI.get_trigger_list_variable_item_group(key, index) end

--获取触发器ITEM_GROUP数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.ItemGroup # 值
function GameAPI.get_trigger_list_actor_variable_item_group(actor, key, index) end

--获取全局触发器ITEM_GROUP数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_item_group(key) end

--获取触发器ITEM_GROUP 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_item_group(actor, key) end

--获取全局触发器ITEM_NAME非数组变量
---@param key string # 变量名称
---@return py.ItemKey # 值
function GameAPI.get_trigger_variable_item_name(key) end

--获取触发器ITEM_NAME非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.ItemKey # 值
function GameAPI.get_trigger_actor_variable_item_name(actor, key) end

--获取全局触发器ITEM_NAME数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.ItemKey # 值
function GameAPI.get_trigger_list_variable_item_name(key, index) end

--获取触发器ITEM_NAME数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.ItemKey # 值
function GameAPI.get_trigger_list_actor_variable_item_name(actor, key, index) end

--获取全局触发器ITEM_NAME数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_item_name(key) end

--获取触发器ITEM_NAME 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_item_name(actor, key) end

--获取全局触发器ABILITY非数组变量
---@param key string # 变量名称
---@return py.Ability # 值
function GameAPI.get_trigger_variable_ability(key) end

--获取触发器ABILITY非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.Ability # 值
function GameAPI.get_trigger_actor_variable_ability(actor, key) end

--获取全局触发器ABILITY数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.Ability # 值
function GameAPI.get_trigger_list_variable_ability(key, index) end

--获取触发器ABILITY数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.Ability # 值
function GameAPI.get_trigger_list_actor_variable_ability(actor, key, index) end

--获取全局触发器ABILITY数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_ability(key) end

--获取触发器ABILITY 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_ability(actor, key) end

--获取全局触发器ABILITY_TYPE非数组变量
---@param key string # 变量名称
---@return integer # 值
function GameAPI.get_trigger_variable_ability_type(key) end

--获取触发器ABILITY_TYPE非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return integer # 值
function GameAPI.get_trigger_actor_variable_ability_type(actor, key) end

--获取全局触发器ABILITY_TYPE数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return integer # 值
function GameAPI.get_trigger_list_variable_ability_type(key, index) end

--获取触发器ABILITY_TYPE数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return integer # 值
function GameAPI.get_trigger_list_actor_variable_ability_type(actor, key, index) end

--获取全局触发器ABILITY_TYPE数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_ability_type(key) end

--获取触发器ABILITY_TYPE 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_ability_type(actor, key) end

--获取全局触发器ABILITY_CAST_TYPE非数组变量
---@param key string # 变量名称
---@return integer # 值
function GameAPI.get_trigger_variable_ability_cast_type(key) end

--获取触发器ABILITY_CAST_TYPE非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return integer # 值
function GameAPI.get_trigger_actor_variable_ability_cast_type(actor, key) end

--获取全局触发器ABILITY_CAST_TYPE数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return integer # 值
function GameAPI.get_trigger_list_variable_ability_cast_type(key, index) end

--获取触发器ABILITY_CAST_TYPE数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return integer # 值
function GameAPI.get_trigger_list_actor_variable_ability_cast_type(actor, key, index) end

--获取全局触发器ABILITY_CAST_TYPE数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_ability_cast_type(key) end

--获取触发器ABILITY_CAST_TYPE 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_ability_cast_type(actor, key) end

--获取全局触发器ABILITY_NAME非数组变量
---@param key string # 变量名称
---@return py.AbilityKey # 值
function GameAPI.get_trigger_variable_ability_name(key) end

--获取触发器ABILITY_NAME非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.AbilityKey # 值
function GameAPI.get_trigger_actor_variable_ability_name(actor, key) end

--获取全局触发器ABILITY_NAME数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.AbilityKey # 值
function GameAPI.get_trigger_list_variable_ability_name(key, index) end

--获取触发器ABILITY_NAME数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.AbilityKey # 值
function GameAPI.get_trigger_list_actor_variable_ability_name(actor, key, index) end

--获取全局触发器ABILITY_NAME数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_ability_name(key) end

--获取触发器ABILITY_NAME 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_ability_name(actor, key) end

--获取全局触发器MODIFIER_ENTITY非数组变量
---@param key string # 变量名称
---@return py.ModifierEntity # 值
function GameAPI.get_trigger_variable_modifier_entity(key) end

--获取触发器MODIFIER_ENTITY非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.ModifierEntity # 值
function GameAPI.get_trigger_actor_variable_modifier_entity(actor, key) end

--获取全局触发器MODIFIER_ENTITY数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.ModifierEntity # 值
function GameAPI.get_trigger_list_variable_modifier_entity(key, index) end

--获取触发器MODIFIER_ENTITY数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.ModifierEntity # 值
function GameAPI.get_trigger_list_actor_variable_modifier_entity(actor, key, index) end

--获取全局触发器MODIFIER_ENTITY数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_modifier_entity(key) end

--获取触发器MODIFIER_ENTITY 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_modifier_entity(actor, key) end

--获取全局触发器MODIFIER非数组变量
---@param key string # 变量名称
---@return py.ModifierKey # 值
function GameAPI.get_trigger_variable_modifier(key) end

--获取触发器MODIFIER非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.ModifierKey # 值
function GameAPI.get_trigger_actor_variable_modifier(actor, key) end

--获取全局触发器MODIFIER数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.ModifierKey # 值
function GameAPI.get_trigger_list_variable_modifier(key, index) end

--获取触发器MODIFIER数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.ModifierKey # 值
function GameAPI.get_trigger_list_actor_variable_modifier(actor, key, index) end

--获取全局触发器MODIFIER数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_modifier(key) end

--获取触发器MODIFIER 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_modifier(actor, key) end

--获取全局触发器PROJECTILE非数组变量
---@param key string # 变量名称
---@return py.ProjectileKey # 值
function GameAPI.get_trigger_variable_projectile(key) end

--获取触发器PROJECTILE非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.ProjectileKey # 值
function GameAPI.get_trigger_actor_variable_projectile(actor, key) end

--获取全局触发器PROJECTILE数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.ProjectileKey # 值
function GameAPI.get_trigger_list_variable_projectile(key, index) end

--获取触发器PROJECTILE数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.ProjectileKey # 值
function GameAPI.get_trigger_list_actor_variable_projectile(actor, key, index) end

--获取全局触发器PROJECTILE数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_projectile(key) end

--获取触发器PROJECTILE 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_projectile(actor, key) end

--获取全局触发器PROJECTILE_ENTITY非数组变量
---@param key string # 变量名称
---@return py.ProjectileEntity # 值
function GameAPI.get_trigger_variable_projectile_entity(key) end

--获取触发器PROJECTILE_ENTITY非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.ProjectileEntity # 值
function GameAPI.get_trigger_actor_variable_projectile_entity(actor, key) end

--获取全局触发器PROJECTILE_ENTITY数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.ProjectileEntity # 值
function GameAPI.get_trigger_list_variable_projectile_entity(key, index) end

--获取触发器PROJECTILE_ENTITY数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.ProjectileEntity # 值
function GameAPI.get_trigger_list_actor_variable_projectile_entity(actor, key, index) end

--获取全局触发器PROJECTILE_ENTITY数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_projectile_entity(key) end

--获取触发器PROJECTILE_ENTITY 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_projectile_entity(actor, key) end

--获取全局触发器PROJECTILE_GROUP非数组变量
---@param key string # 变量名称
---@return py.ProjectileGroup # 值
function GameAPI.get_trigger_variable_projectile_group(key) end

--获取触发器PROJECTILE_GROUP非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.ProjectileGroup # 值
function GameAPI.get_trigger_actor_variable_projectile_group(actor, key) end

--获取全局触发器PROJECTILE_GROUP数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.ProjectileGroup # 值
function GameAPI.get_trigger_list_variable_projectile_group(key, index) end

--获取触发器PROJECTILE_GROUP数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.ProjectileGroup # 值
function GameAPI.get_trigger_list_actor_variable_projectile_group(actor, key, index) end

--获取全局触发器PROJECTILE_GROUP数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_projectile_group(key) end

--获取触发器PROJECTILE_GROUP 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_projectile_group(actor, key) end

--获取全局触发器DESTRUCTIBLE_ENTITY非数组变量
---@param key string # 变量名称
---@return py.Destructible # 值
function GameAPI.get_trigger_variable_destructible_entity(key) end

--获取触发器DESTRUCTIBLE_ENTITY非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.Destructible # 值
function GameAPI.get_trigger_actor_variable_destructible_entity(actor, key) end

--获取全局触发器DESTRUCTIBLE_ENTITY数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.Destructible # 值
function GameAPI.get_trigger_list_variable_destructible_entity(key, index) end

--获取触发器DESTRUCTIBLE_ENTITY数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.Destructible # 值
function GameAPI.get_trigger_list_actor_variable_destructible_entity(actor, key, index) end

--获取全局触发器DESTRUCTIBLE_ENTITY数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_destructible_entity(key) end

--获取触发器DESTRUCTIBLE_ENTITY 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_destructible_entity(actor, key) end

--获取全局触发器DESTRUCTIBLE_NAME非数组变量
---@param key string # 变量名称
---@return py.DestructibleKey # 值
function GameAPI.get_trigger_variable_destructible_name(key) end

--获取触发器DESTRUCTIBLE_NAME非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.DestructibleKey # 值
function GameAPI.get_trigger_actor_variable_destructible_name(actor, key) end

--获取全局触发器DESTRUCTIBLE_NAME数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.DestructibleKey # 值
function GameAPI.get_trigger_list_variable_destructible_name(key, index) end

--获取触发器DESTRUCTIBLE_NAME数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.DestructibleKey # 值
function GameAPI.get_trigger_list_actor_variable_destructible_name(actor, key, index) end

--获取全局触发器DESTRUCTIBLE_NAME数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_destructible_name(key) end

--获取触发器DESTRUCTIBLE_NAME 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_destructible_name(actor, key) end

--获取全局触发器SOUND_ENTITY非数组变量
---@param key string # 变量名称
---@return py.SoundEntity # 值
function GameAPI.get_trigger_variable_sound_entity(key) end

--获取触发器SOUND_ENTITY非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.SoundEntity # 值
function GameAPI.get_trigger_actor_variable_sound_entity(actor, key) end

--获取全局触发器SOUND_ENTITY数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.SoundEntity # 值
function GameAPI.get_trigger_list_variable_sound_entity(key, index) end

--获取触发器SOUND_ENTITY数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.SoundEntity # 值
function GameAPI.get_trigger_list_actor_variable_sound_entity(actor, key, index) end

--获取全局触发器SOUND_ENTITY数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_sound_entity(key) end

--获取触发器SOUND_ENTITY 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_sound_entity(actor, key) end

--获取全局触发器AUDIO_KEY非数组变量
---@param key string # 变量名称
---@return py.AudioKey # 值
function GameAPI.get_trigger_variable_audio_key(key) end

--获取触发器AUDIO_KEY非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.AudioKey # 值
function GameAPI.get_trigger_actor_variable_audio_key(actor, key) end

--获取全局触发器AUDIO_KEY数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.AudioKey # 值
function GameAPI.get_trigger_list_variable_audio_key(key, index) end

--获取触发器AUDIO_KEY数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.AudioKey # 值
function GameAPI.get_trigger_list_actor_variable_audio_key(actor, key, index) end

--获取全局触发器AUDIO_KEY数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_audio_key(key) end

--获取触发器AUDIO_KEY 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_audio_key(actor, key) end

--获取全局触发器GAME_MODE非数组变量
---@param key string # 变量名称
---@return py.GameMode # 值
function GameAPI.get_trigger_variable_game_mode(key) end

--获取触发器GAME_MODE非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.GameMode # 值
function GameAPI.get_trigger_actor_variable_game_mode(actor, key) end

--获取全局触发器GAME_MODE数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.GameMode # 值
function GameAPI.get_trigger_list_variable_game_mode(key, index) end

--获取触发器GAME_MODE数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.GameMode # 值
function GameAPI.get_trigger_list_actor_variable_game_mode(actor, key, index) end

--获取全局触发器GAME_MODE数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_game_mode(key) end

--获取触发器GAME_MODE 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_game_mode(actor, key) end

--获取全局触发器PLAYER非数组变量
---@param key string # 变量名称
---@return py.Role # 值
function GameAPI.get_trigger_variable_player(key) end

--获取触发器PLAYER非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.Role # 值
function GameAPI.get_trigger_actor_variable_player(actor, key) end

--获取全局触发器PLAYER数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.Role # 值
function GameAPI.get_trigger_list_variable_player(key, index) end

--获取触发器PLAYER数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.Role # 值
function GameAPI.get_trigger_list_actor_variable_player(actor, key, index) end

--获取全局触发器PLAYER数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_player(key) end

--获取触发器PLAYER 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_player(actor, key) end

--获取全局触发器PLAYER_GROUP非数组变量
---@param key string # 变量名称
---@return py.RoleGroup # 值
function GameAPI.get_trigger_variable_player_group(key) end

--获取触发器PLAYER_GROUP非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.RoleGroup # 值
function GameAPI.get_trigger_actor_variable_player_group(actor, key) end

--获取全局触发器PLAYER_GROUP数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.RoleGroup # 值
function GameAPI.get_trigger_list_variable_player_group(key, index) end

--获取触发器PLAYER_GROUP数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.RoleGroup # 值
function GameAPI.get_trigger_list_actor_variable_player_group(actor, key, index) end

--获取全局触发器PLAYER_GROUP数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_player_group(key) end

--获取触发器PLAYER_GROUP 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_player_group(actor, key) end

--获取全局触发器ROLE_RES_KEY非数组变量
---@param key string # 变量名称
---@return py.RoleResKey # 值
function GameAPI.get_trigger_variable_role_res_key(key) end

--获取触发器ROLE_RES_KEY非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.RoleResKey # 值
function GameAPI.get_trigger_actor_variable_role_res_key(actor, key) end

--获取全局触发器ROLE_RES_KEY数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.RoleResKey # 值
function GameAPI.get_trigger_list_variable_role_res_key(key, index) end

--获取触发器ROLE_RES_KEY数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.RoleResKey # 值
function GameAPI.get_trigger_list_actor_variable_role_res_key(actor, key, index) end

--获取全局触发器ROLE_RES_KEY数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_role_res_key(key) end

--获取触发器ROLE_RES_KEY 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_role_res_key(actor, key) end

--获取全局触发器ROLE_STATUS非数组变量
---@param key string # 变量名称
---@return py.RoleStatus # 值
function GameAPI.get_trigger_variable_role_status(key) end

--获取触发器ROLE_STATUS非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.RoleStatus # 值
function GameAPI.get_trigger_actor_variable_role_status(actor, key) end

--获取全局触发器ROLE_STATUS数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.RoleStatus # 值
function GameAPI.get_trigger_list_variable_role_status(key, index) end

--获取触发器ROLE_STATUS数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.RoleStatus # 值
function GameAPI.get_trigger_list_actor_variable_role_status(actor, key, index) end

--获取全局触发器ROLE_STATUS数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_role_status(key) end

--获取触发器ROLE_STATUS 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_role_status(actor, key) end

--获取全局触发器ROLE_TYPE非数组变量
---@param key string # 变量名称
---@return py.RoleType # 值
function GameAPI.get_trigger_variable_role_type(key) end

--获取触发器ROLE_TYPE非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.RoleType # 值
function GameAPI.get_trigger_actor_variable_role_type(actor, key) end

--获取全局触发器ROLE_TYPE数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.RoleType # 值
function GameAPI.get_trigger_list_variable_role_type(key, index) end

--获取触发器ROLE_TYPE数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.RoleType # 值
function GameAPI.get_trigger_list_actor_variable_role_type(actor, key, index) end

--获取全局触发器ROLE_TYPE数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_role_type(key) end

--获取触发器ROLE_TYPE 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_role_type(actor, key) end

--获取全局触发器TEAM非数组变量
---@param key string # 变量名称
---@return py.Camp # 值
function GameAPI.get_trigger_variable_team(key) end

--获取触发器TEAM非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.Camp # 值
function GameAPI.get_trigger_actor_variable_team(actor, key) end

--获取全局触发器TEAM数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.Camp # 值
function GameAPI.get_trigger_list_variable_team(key, index) end

--获取触发器TEAM数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.Camp # 值
function GameAPI.get_trigger_list_actor_variable_team(actor, key, index) end

--获取全局触发器TEAM数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_team(key) end

--获取触发器TEAM 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_team(actor, key) end

--获取全局触发器POINT非数组变量
---@param key string # 变量名称
---@return py.FPoint # 值
function GameAPI.get_trigger_variable_point(key) end

--获取触发器POINT非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.FPoint # 值
function GameAPI.get_trigger_actor_variable_point(actor, key) end

--获取全局触发器POINT数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.FPoint # 值
function GameAPI.get_trigger_list_variable_point(key, index) end

--获取触发器POINT数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.FPoint # 值
function GameAPI.get_trigger_list_actor_variable_point(actor, key, index) end

--获取全局触发器POINT数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_point(key) end

--获取触发器POINT 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_point(actor, key) end

--获取全局触发器VECTOR3非数组变量
---@param key string # 变量名称
---@return py.FVector3 # 值
function GameAPI.get_trigger_variable_vector3(key) end

--获取触发器VECTOR3非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.FVector3 # 值
function GameAPI.get_trigger_actor_variable_vector3(actor, key) end

--获取全局触发器VECTOR3数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.FVector3 # 值
function GameAPI.get_trigger_list_variable_vector3(key, index) end

--获取触发器VECTOR3数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.FVector3 # 值
function GameAPI.get_trigger_list_actor_variable_vector3(actor, key, index) end

--获取全局触发器VECTOR3数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_vector3(key) end

--获取触发器VECTOR3 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_vector3(actor, key) end

--获取全局触发器ROTATION非数组变量
---@param key string # 变量名称
---@return py.FRotation # 值
function GameAPI.get_trigger_variable_rotation(key) end

--获取触发器ROTATION非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.FRotation # 值
function GameAPI.get_trigger_actor_variable_rotation(actor, key) end

--获取全局触发器ROTATION数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.FRotation # 值
function GameAPI.get_trigger_list_variable_rotation(key, index) end

--获取触发器ROTATION数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.FRotation # 值
function GameAPI.get_trigger_list_actor_variable_rotation(actor, key, index) end

--获取全局触发器ROTATION数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_rotation(key) end

--获取触发器ROTATION 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_rotation(actor, key) end

--获取全局触发器POINT_LIST非数组变量
---@param key string # 变量名称
---@return py.Road # 值
function GameAPI.get_trigger_variable_point_list(key) end

--获取触发器POINT_LIST非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.Road # 值
function GameAPI.get_trigger_actor_variable_point_list(actor, key) end

--获取全局触发器POINT_LIST数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.Road # 值
function GameAPI.get_trigger_list_variable_point_list(key, index) end

--获取触发器POINT_LIST数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.Road # 值
function GameAPI.get_trigger_list_actor_variable_point_list(actor, key, index) end

--获取全局触发器POINT_LIST数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_point_list(key) end

--获取触发器POINT_LIST 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_point_list(actor, key) end

--获取全局触发器ROAD_GROUP非数组变量
---@param key string # 变量名称
---@return py.RoadGroup # 值
function GameAPI.get_trigger_variable_road_group(key) end

--获取触发器ROAD_GROUP非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.RoadGroup # 值
function GameAPI.get_trigger_actor_variable_road_group(actor, key) end

--获取全局触发器ROAD_GROUP数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.RoadGroup # 值
function GameAPI.get_trigger_list_variable_road_group(key, index) end

--获取触发器ROAD_GROUP数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.RoadGroup # 值
function GameAPI.get_trigger_list_actor_variable_road_group(actor, key, index) end

--获取全局触发器ROAD_GROUP数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_road_group(key) end

--获取触发器ROAD_GROUP 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_road_group(actor, key) end

--获取全局触发器RECTANGLE非数组变量
---@param key string # 变量名称
---@return py.RecArea # 值
function GameAPI.get_trigger_variable_rectangle(key) end

--获取触发器RECTANGLE非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.RecArea # 值
function GameAPI.get_trigger_actor_variable_rectangle(actor, key) end

--获取全局触发器RECTANGLE数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.RecArea # 值
function GameAPI.get_trigger_list_variable_rectangle(key, index) end

--获取触发器RECTANGLE数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.RecArea # 值
function GameAPI.get_trigger_list_actor_variable_rectangle(actor, key, index) end

--获取全局触发器RECTANGLE数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_rectangle(key) end

--获取触发器RECTANGLE 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_rectangle(actor, key) end

--获取全局触发器ROUND_AREA非数组变量
---@param key string # 变量名称
---@return py.CirArea # 值
function GameAPI.get_trigger_variable_round_area(key) end

--获取触发器ROUND_AREA非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.CirArea # 值
function GameAPI.get_trigger_actor_variable_round_area(actor, key) end

--获取全局触发器ROUND_AREA数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.CirArea # 值
function GameAPI.get_trigger_list_variable_round_area(key, index) end

--获取触发器ROUND_AREA数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.CirArea # 值
function GameAPI.get_trigger_list_actor_variable_round_area(actor, key, index) end

--获取全局触发器ROUND_AREA数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_round_area(key) end

--获取触发器ROUND_AREA 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_round_area(actor, key) end

--获取全局触发器POLYGON非数组变量
---@param key string # 变量名称
---@return py.PolyArea # 值
function GameAPI.get_trigger_variable_polygon(key) end

--获取触发器POLYGON非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.PolyArea # 值
function GameAPI.get_trigger_actor_variable_polygon(actor, key) end

--获取全局触发器POLYGON数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.PolyArea # 值
function GameAPI.get_trigger_list_variable_polygon(key, index) end

--获取触发器POLYGON数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.PolyArea # 值
function GameAPI.get_trigger_list_actor_variable_polygon(actor, key, index) end

--获取全局触发器POLYGON数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_polygon(key) end

--获取触发器POLYGON 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_polygon(actor, key) end

--获取全局触发器CAMERA非数组变量
---@param key string # 变量名称
---@return py.Camera # 值
function GameAPI.get_trigger_variable_camera(key) end

--获取触发器CAMERA非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.Camera # 值
function GameAPI.get_trigger_actor_variable_camera(actor, key) end

--获取全局触发器CAMERA数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.Camera # 值
function GameAPI.get_trigger_list_variable_camera(key, index) end

--获取触发器CAMERA数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.Camera # 值
function GameAPI.get_trigger_list_actor_variable_camera(actor, key, index) end

--获取全局触发器CAMERA数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_camera(key) end

--获取触发器CAMERA 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_camera(actor, key) end

--获取全局触发器CAMLINE非数组变量
---@param key string # 变量名称
---@return py.CamlineID # 值
function GameAPI.get_trigger_variable_camline(key) end

--获取触发器CAMLINE非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.CamlineID # 值
function GameAPI.get_trigger_actor_variable_camline(actor, key) end

--获取全局触发器CAMLINE数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.CamlineID # 值
function GameAPI.get_trigger_list_variable_camline(key, index) end

--获取触发器CAMLINE数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.CamlineID # 值
function GameAPI.get_trigger_list_actor_variable_camline(actor, key, index) end

--获取全局触发器CAMLINE数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_camline(key) end

--获取触发器CAMLINE 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_camline(actor, key) end

--获取全局触发器POINT_LIGHT非数组变量
---@param key string # 变量名称
---@return py.PointLight # 值
function GameAPI.get_trigger_variable_point_light(key) end

--获取触发器POINT_LIGHT非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.PointLight # 值
function GameAPI.get_trigger_actor_variable_point_light(actor, key) end

--获取全局触发器POINT_LIGHT数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.PointLight # 值
function GameAPI.get_trigger_list_variable_point_light(key, index) end

--获取触发器POINT_LIGHT数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.PointLight # 值
function GameAPI.get_trigger_list_actor_variable_point_light(actor, key, index) end

--获取全局触发器POINT_LIGHT数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_point_light(key) end

--获取触发器POINT_LIGHT 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_point_light(actor, key) end

--获取全局触发器SPOT_LIGHT非数组变量
---@param key string # 变量名称
---@return py.SpotLight # 值
function GameAPI.get_trigger_variable_spot_light(key) end

--获取触发器SPOT_LIGHT非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.SpotLight # 值
function GameAPI.get_trigger_actor_variable_spot_light(actor, key) end

--获取全局触发器SPOT_LIGHT数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.SpotLight # 值
function GameAPI.get_trigger_list_variable_spot_light(key, index) end

--获取触发器SPOT_LIGHT数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.SpotLight # 值
function GameAPI.get_trigger_list_actor_variable_spot_light(actor, key, index) end

--获取全局触发器SPOT_LIGHT数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_spot_light(key) end

--获取触发器SPOT_LIGHT 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_spot_light(actor, key) end

--获取全局触发器FOG非数组变量
---@param key string # 变量名称
---@return py.Fog # 值
function GameAPI.get_trigger_variable_fog(key) end

--获取触发器FOG非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.Fog # 值
function GameAPI.get_trigger_actor_variable_fog(actor, key) end

--获取全局触发器FOG数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.Fog # 值
function GameAPI.get_trigger_list_variable_fog(key, index) end

--获取触发器FOG数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.Fog # 值
function GameAPI.get_trigger_list_actor_variable_fog(actor, key, index) end

--获取全局触发器FOG数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_fog(key) end

--获取触发器FOG 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_fog(actor, key) end

--获取全局触发器MODEL非数组变量
---@param key string # 变量名称
---@return py.ModelKey # 值
function GameAPI.get_trigger_variable_model(key) end

--获取触发器MODEL非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.ModelKey # 值
function GameAPI.get_trigger_actor_variable_model(actor, key) end

--获取全局触发器MODEL数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.ModelKey # 值
function GameAPI.get_trigger_list_variable_model(key, index) end

--获取触发器MODEL数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.ModelKey # 值
function GameAPI.get_trigger_list_actor_variable_model(actor, key, index) end

--获取全局触发器MODEL数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_model(key) end

--获取触发器MODEL 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_model(actor, key) end

--获取全局触发器SFX_ENTITY非数组变量
---@param key string # 变量名称
---@return py.Sfx # 值
function GameAPI.get_trigger_variable_sfx_entity(key) end

--获取触发器SFX_ENTITY非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.Sfx # 值
function GameAPI.get_trigger_actor_variable_sfx_entity(actor, key) end

--获取全局触发器SFX_ENTITY数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.Sfx # 值
function GameAPI.get_trigger_list_variable_sfx_entity(key, index) end

--获取触发器SFX_ENTITY数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.Sfx # 值
function GameAPI.get_trigger_list_actor_variable_sfx_entity(actor, key, index) end

--获取全局触发器SFX_ENTITY数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_sfx_entity(key) end

--获取触发器SFX_ENTITY 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_sfx_entity(actor, key) end

--获取全局触发器SFX_KEY非数组变量
---@param key string # 变量名称
---@return py.SfxKey # 值
function GameAPI.get_trigger_variable_sfx_key(key) end

--获取触发器SFX_KEY非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.SfxKey # 值
function GameAPI.get_trigger_actor_variable_sfx_key(actor, key) end

--获取全局触发器SFX_KEY数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.SfxKey # 值
function GameAPI.get_trigger_list_variable_sfx_key(key, index) end

--获取触发器SFX_KEY数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.SfxKey # 值
function GameAPI.get_trigger_list_actor_variable_sfx_key(actor, key, index) end

--获取全局触发器SFX_KEY数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_sfx_key(key) end

--获取触发器SFX_KEY 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_sfx_key(actor, key) end

--获取全局触发器LINK_SFX_ENTITY非数组变量
---@param key string # 变量名称
---@return py.LinkSfx # 值
function GameAPI.get_trigger_variable_link_sfx_entity(key) end

--获取触发器LINK_SFX_ENTITY非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.LinkSfx # 值
function GameAPI.get_trigger_actor_variable_link_sfx_entity(actor, key) end

--获取全局触发器LINK_SFX_ENTITY数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.LinkSfx # 值
function GameAPI.get_trigger_list_variable_link_sfx_entity(key, index) end

--获取触发器LINK_SFX_ENTITY数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.LinkSfx # 值
function GameAPI.get_trigger_list_actor_variable_link_sfx_entity(actor, key, index) end

--获取全局触发器LINK_SFX_ENTITY数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_link_sfx_entity(key) end

--获取触发器LINK_SFX_ENTITY 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_link_sfx_entity(actor, key) end

--获取全局触发器LINK_SFX_KEY非数组变量
---@param key string # 变量名称
---@return py.LinkSfxKey # 值
function GameAPI.get_trigger_variable_link_sfx_key(key) end

--获取触发器LINK_SFX_KEY非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.LinkSfxKey # 值
function GameAPI.get_trigger_actor_variable_link_sfx_key(actor, key) end

--获取全局触发器LINK_SFX_KEY数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.LinkSfxKey # 值
function GameAPI.get_trigger_list_variable_link_sfx_key(key, index) end

--获取触发器LINK_SFX_KEY数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.LinkSfxKey # 值
function GameAPI.get_trigger_list_actor_variable_link_sfx_key(actor, key, index) end

--获取全局触发器LINK_SFX_KEY数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_link_sfx_key(key) end

--获取触发器LINK_SFX_KEY 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_link_sfx_key(actor, key) end

--获取全局触发器CURSOR_KEY非数组变量
---@param key string # 变量名称
---@return py.CursorKey # 值
function GameAPI.get_trigger_variable_cursor_key(key) end

--获取触发器CURSOR_KEY非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.CursorKey # 值
function GameAPI.get_trigger_actor_variable_cursor_key(actor, key) end

--获取全局触发器CURSOR_KEY数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.CursorKey # 值
function GameAPI.get_trigger_list_variable_cursor_key(key, index) end

--获取触发器CURSOR_KEY数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.CursorKey # 值
function GameAPI.get_trigger_list_actor_variable_cursor_key(actor, key, index) end

--获取全局触发器CURSOR_KEY数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_cursor_key(key) end

--获取触发器CURSOR_KEY 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_cursor_key(actor, key) end

--获取全局触发器IMAGE_KEY非数组变量
---@param key string # 变量名称
---@return integer # 值
function GameAPI.get_trigger_variable_image_key(key) end

--获取触发器IMAGE_KEY非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return integer # 值
function GameAPI.get_trigger_actor_variable_image_key(actor, key) end

--获取全局触发器IMAGE_KEY数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return integer # 值
function GameAPI.get_trigger_list_variable_image_key(key, index) end

--获取触发器IMAGE_KEY数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return integer # 值
function GameAPI.get_trigger_list_actor_variable_image_key(actor, key, index) end

--获取全局触发器IMAGE_KEY数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_image_key(key) end

--获取触发器IMAGE_KEY 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_image_key(actor, key) end

--获取全局触发器ANGLE非数组变量
---@param key string # 变量名称
---@return py.Fixed # 值
function GameAPI.get_trigger_variable_angle(key) end

--获取触发器ANGLE非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.Fixed # 值
function GameAPI.get_trigger_actor_variable_angle(actor, key) end

--获取全局触发器ANGLE数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.Fixed # 值
function GameAPI.get_trigger_list_variable_angle(key, index) end

--获取触发器ANGLE数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.Fixed # 值
function GameAPI.get_trigger_list_actor_variable_angle(actor, key, index) end

--获取全局触发器ANGLE数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_angle(key) end

--获取触发器ANGLE 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_angle(actor, key) end

--获取全局触发器TEXTURE非数组变量
---@param key string # 变量名称
---@return py.Texture # 值
function GameAPI.get_trigger_variable_texture(key) end

--获取触发器TEXTURE非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.Texture # 值
function GameAPI.get_trigger_actor_variable_texture(actor, key) end

--获取全局触发器TEXTURE数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.Texture # 值
function GameAPI.get_trigger_list_variable_texture(key, index) end

--获取触发器TEXTURE数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.Texture # 值
function GameAPI.get_trigger_list_actor_variable_texture(actor, key, index) end

--获取全局触发器TEXTURE数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_texture(key) end

--获取触发器TEXTURE 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_texture(actor, key) end

--获取全局触发器SEQUENCE非数组变量
---@param key string # 变量名称
---@return py.Sequence # 值
function GameAPI.get_trigger_variable_sequence(key) end

--获取触发器SEQUENCE非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.Sequence # 值
function GameAPI.get_trigger_actor_variable_sequence(actor, key) end

--获取全局触发器SEQUENCE数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.Sequence # 值
function GameAPI.get_trigger_list_variable_sequence(key, index) end

--获取触发器SEQUENCE数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.Sequence # 值
function GameAPI.get_trigger_list_actor_variable_sequence(actor, key, index) end

--获取全局触发器SEQUENCE数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_sequence(key) end

--获取触发器SEQUENCE 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_sequence(actor, key) end

--获取全局触发器PHYSICS_OBJECT非数组变量
---@param key string # 变量名称
---@return py.PhysicsObject # 值
function GameAPI.get_trigger_variable_physics_object(key) end

--获取触发器PHYSICS_OBJECT非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.PhysicsObject # 值
function GameAPI.get_trigger_actor_variable_physics_object(actor, key) end

--获取全局触发器PHYSICS_OBJECT数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.PhysicsObject # 值
function GameAPI.get_trigger_list_variable_physics_object(key, index) end

--获取触发器PHYSICS_OBJECT数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.PhysicsObject # 值
function GameAPI.get_trigger_list_actor_variable_physics_object(actor, key, index) end

--获取全局触发器PHYSICS_OBJECT数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_physics_object(key) end

--获取触发器PHYSICS_OBJECT 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_physics_object(actor, key) end

--获取全局触发器PHYSICS_ENTITY非数组变量
---@param key string # 变量名称
---@return py.PhysicsEntity # 值
function GameAPI.get_trigger_variable_physics_entity(key) end

--获取触发器PHYSICS_ENTITY非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.PhysicsEntity # 值
function GameAPI.get_trigger_actor_variable_physics_entity(actor, key) end

--获取全局触发器PHYSICS_ENTITY数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.PhysicsEntity # 值
function GameAPI.get_trigger_list_variable_physics_entity(key, index) end

--获取触发器PHYSICS_ENTITY数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.PhysicsEntity # 值
function GameAPI.get_trigger_list_actor_variable_physics_entity(actor, key, index) end

--获取全局触发器PHYSICS_ENTITY数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_physics_entity(key) end

--获取触发器PHYSICS_ENTITY 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_physics_entity(actor, key) end

--获取全局触发器PHYSICS_OBJECT_KEY非数组变量
---@param key string # 变量名称
---@return py.PhysicsObjectKey # 值
function GameAPI.get_trigger_variable_physics_object_key(key) end

--获取触发器PHYSICS_OBJECT_KEY非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.PhysicsObjectKey # 值
function GameAPI.get_trigger_actor_variable_physics_object_key(actor, key) end

--获取全局触发器PHYSICS_OBJECT_KEY数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.PhysicsObjectKey # 值
function GameAPI.get_trigger_list_variable_physics_object_key(key, index) end

--获取触发器PHYSICS_OBJECT_KEY数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.PhysicsObjectKey # 值
function GameAPI.get_trigger_list_actor_variable_physics_object_key(actor, key, index) end

--获取全局触发器PHYSICS_OBJECT_KEY数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_physics_object_key(key) end

--获取触发器PHYSICS_OBJECT_KEY 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_physics_object_key(actor, key) end

--获取全局触发器PHYSICS_ENTITY_KEY非数组变量
---@param key string # 变量名称
---@return py.PhysicsEntityKey # 值
function GameAPI.get_trigger_variable_physics_entity_key(key) end

--获取触发器PHYSICS_ENTITY_KEY非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.PhysicsEntityKey # 值
function GameAPI.get_trigger_actor_variable_physics_entity_key(actor, key) end

--获取全局触发器PHYSICS_ENTITY_KEY数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.PhysicsEntityKey # 值
function GameAPI.get_trigger_list_variable_physics_entity_key(key, index) end

--获取触发器PHYSICS_ENTITY_KEY数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.PhysicsEntityKey # 值
function GameAPI.get_trigger_list_actor_variable_physics_entity_key(actor, key, index) end

--获取全局触发器PHYSICS_ENTITY_KEY数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_physics_entity_key(key) end

--获取触发器PHYSICS_ENTITY_KEY 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_physics_entity_key(actor, key) end

--获取全局触发器RIGID_BODY非数组变量
---@param key string # 变量名称
---@return py.RigidBody # 值
function GameAPI.get_trigger_variable_rigid_body(key) end

--获取触发器RIGID_BODY非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.RigidBody # 值
function GameAPI.get_trigger_actor_variable_rigid_body(actor, key) end

--获取全局触发器RIGID_BODY数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.RigidBody # 值
function GameAPI.get_trigger_list_variable_rigid_body(key, index) end

--获取触发器RIGID_BODY数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.RigidBody # 值
function GameAPI.get_trigger_list_actor_variable_rigid_body(actor, key, index) end

--获取全局触发器RIGID_BODY数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_rigid_body(key) end

--获取触发器RIGID_BODY 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_rigid_body(actor, key) end

--获取全局触发器RIGID_BODY_GROUP非数组变量
---@param key string # 变量名称
---@return py.RigidBodyGroup # 值
function GameAPI.get_trigger_variable_rigid_body_group(key) end

--获取触发器RIGID_BODY_GROUP非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.RigidBodyGroup # 值
function GameAPI.get_trigger_actor_variable_rigid_body_group(actor, key) end

--获取全局触发器RIGID_BODY_GROUP数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.RigidBodyGroup # 值
function GameAPI.get_trigger_list_variable_rigid_body_group(key, index) end

--获取触发器RIGID_BODY_GROUP数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.RigidBodyGroup # 值
function GameAPI.get_trigger_list_actor_variable_rigid_body_group(actor, key, index) end

--获取全局触发器RIGID_BODY_GROUP数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_rigid_body_group(key) end

--获取触发器RIGID_BODY_GROUP 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_rigid_body_group(actor, key) end

--获取全局触发器COLLIDER非数组变量
---@param key string # 变量名称
---@return py.Collider # 值
function GameAPI.get_trigger_variable_collider(key) end

--获取触发器COLLIDER非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.Collider # 值
function GameAPI.get_trigger_actor_variable_collider(actor, key) end

--获取全局触发器COLLIDER数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.Collider # 值
function GameAPI.get_trigger_list_variable_collider(key, index) end

--获取触发器COLLIDER数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.Collider # 值
function GameAPI.get_trigger_list_actor_variable_collider(actor, key, index) end

--获取全局触发器COLLIDER数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_collider(key) end

--获取触发器COLLIDER 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_collider(actor, key) end

--获取全局触发器JOINT非数组变量
---@param key string # 变量名称
---@return py.Joint # 值
function GameAPI.get_trigger_variable_joint(key) end

--获取触发器JOINT非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.Joint # 值
function GameAPI.get_trigger_actor_variable_joint(actor, key) end

--获取全局触发器JOINT数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.Joint # 值
function GameAPI.get_trigger_list_variable_joint(key, index) end

--获取触发器JOINT数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.Joint # 值
function GameAPI.get_trigger_list_actor_variable_joint(actor, key, index) end

--获取全局触发器JOINT数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_joint(key) end

--获取触发器JOINT 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_joint(actor, key) end

--获取全局触发器REACTION非数组变量
---@param key string # 变量名称
---@return py.Reaction # 值
function GameAPI.get_trigger_variable_reaction(key) end

--获取触发器REACTION非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.Reaction # 值
function GameAPI.get_trigger_actor_variable_reaction(actor, key) end

--获取全局触发器REACTION数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.Reaction # 值
function GameAPI.get_trigger_list_variable_reaction(key, index) end

--获取触发器REACTION数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.Reaction # 值
function GameAPI.get_trigger_list_actor_variable_reaction(actor, key, index) end

--获取全局触发器REACTION数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_reaction(key) end

--获取触发器REACTION 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_reaction(actor, key) end

--获取全局触发器REACTION_GROUP非数组变量
---@param key string # 变量名称
---@return py.ReactionGroup # 值
function GameAPI.get_trigger_variable_reaction_group(key) end

--获取触发器REACTION_GROUP非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.ReactionGroup # 值
function GameAPI.get_trigger_actor_variable_reaction_group(actor, key) end

--获取全局触发器REACTION_GROUP数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.ReactionGroup # 值
function GameAPI.get_trigger_list_variable_reaction_group(key, index) end

--获取触发器REACTION_GROUP数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.ReactionGroup # 值
function GameAPI.get_trigger_list_actor_variable_reaction_group(actor, key, index) end

--获取全局触发器REACTION_GROUP数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_reaction_group(key) end

--获取触发器REACTION_GROUP 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_reaction_group(actor, key) end

--获取全局触发器PHYSICS_FILTER非数组变量
---@param key string # 变量名称
---@return py.PhysicsFilter # 值
function GameAPI.get_trigger_variable_physics_filter(key) end

--获取触发器PHYSICS_FILTER非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.PhysicsFilter # 值
function GameAPI.get_trigger_actor_variable_physics_filter(actor, key) end

--获取全局触发器PHYSICS_FILTER数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.PhysicsFilter # 值
function GameAPI.get_trigger_list_variable_physics_filter(key, index) end

--获取触发器PHYSICS_FILTER数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.PhysicsFilter # 值
function GameAPI.get_trigger_list_actor_variable_physics_filter(actor, key, index) end

--获取全局触发器PHYSICS_FILTER数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_physics_filter(key) end

--获取触发器PHYSICS_FILTER 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_physics_filter(actor, key) end

--获取全局触发器INT_SAVE非数组变量
---@param key string # 变量名称
---@return integer # 值
function GameAPI.get_trigger_variable_int_save(key) end

--获取触发器INT_SAVE非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return integer # 值
function GameAPI.get_trigger_actor_variable_int_save(actor, key) end

--获取全局触发器INT_SAVE数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return integer # 值
function GameAPI.get_trigger_list_variable_int_save(key, index) end

--获取触发器INT_SAVE数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return integer # 值
function GameAPI.get_trigger_list_actor_variable_int_save(actor, key, index) end

--获取全局触发器INT_SAVE数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_int_save(key) end

--获取触发器INT_SAVE 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_int_save(actor, key) end

--获取全局触发器STR_SAVE非数组变量
---@param key string # 变量名称
---@return string # 值
function GameAPI.get_trigger_variable_str_save(key) end

--获取触发器STR_SAVE非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return string # 值
function GameAPI.get_trigger_actor_variable_str_save(actor, key) end

--获取全局触发器STR_SAVE数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return string # 值
function GameAPI.get_trigger_list_variable_str_save(key, index) end

--获取触发器STR_SAVE数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return string # 值
function GameAPI.get_trigger_list_actor_variable_str_save(actor, key, index) end

--获取全局触发器STR_SAVE数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_str_save(key) end

--获取触发器STR_SAVE 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_str_save(actor, key) end

--获取全局触发器FLOAT_SAVE非数组变量
---@param key string # 变量名称
---@return py.Fixed # 值
function GameAPI.get_trigger_variable_float_save(key) end

--获取触发器FLOAT_SAVE非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.Fixed # 值
function GameAPI.get_trigger_actor_variable_float_save(actor, key) end

--获取全局触发器FLOAT_SAVE数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.Fixed # 值
function GameAPI.get_trigger_list_variable_float_save(key, index) end

--获取触发器FLOAT_SAVE数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.Fixed # 值
function GameAPI.get_trigger_list_actor_variable_float_save(actor, key, index) end

--获取全局触发器FLOAT_SAVE数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_float_save(key) end

--获取触发器FLOAT_SAVE 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_float_save(actor, key) end

--获取全局触发器BOOL_SAVE非数组变量
---@param key string # 变量名称
---@return boolean # 值
function GameAPI.get_trigger_variable_bool_save(key) end

--获取触发器BOOL_SAVE非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return boolean # 值
function GameAPI.get_trigger_actor_variable_bool_save(actor, key) end

--获取全局触发器BOOL_SAVE数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return boolean # 值
function GameAPI.get_trigger_list_variable_bool_save(key, index) end

--获取触发器BOOL_SAVE数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return boolean # 值
function GameAPI.get_trigger_list_actor_variable_bool_save(actor, key, index) end

--获取全局触发器BOOL_SAVE数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_bool_save(key) end

--获取触发器BOOL_SAVE 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_bool_save(actor, key) end

--获取全局触发器TABLE_SAVE非数组变量
---@param key string # 变量名称
---@return py.Table # 值
function GameAPI.get_trigger_variable_table_save(key) end

--获取触发器TABLE_SAVE非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.Table # 值
function GameAPI.get_trigger_actor_variable_table_save(actor, key) end

--获取全局触发器TABLE_SAVE数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.Table # 值
function GameAPI.get_trigger_list_variable_table_save(key, index) end

--获取触发器TABLE_SAVE数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.Table # 值
function GameAPI.get_trigger_list_actor_variable_table_save(actor, key, index) end

--获取全局触发器TABLE_SAVE数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_table_save(key) end

--获取触发器TABLE_SAVE 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_table_save(actor, key) end

--获取全局触发器GLOBAL_ARCHIVE_SLOT非数组变量
---@param key string # 变量名称
---@return string # 值
function GameAPI.get_trigger_variable_global_archive_slot(key) end

--获取触发器GLOBAL_ARCHIVE_SLOT非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return string # 值
function GameAPI.get_trigger_actor_variable_global_archive_slot(actor, key) end

--获取全局触发器GLOBAL_ARCHIVE_SLOT数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return string # 值
function GameAPI.get_trigger_list_variable_global_archive_slot(key, index) end

--获取触发器GLOBAL_ARCHIVE_SLOT数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return string # 值
function GameAPI.get_trigger_list_actor_variable_global_archive_slot(actor, key, index) end

--获取全局触发器GLOBAL_ARCHIVE_SLOT数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_global_archive_slot(key) end

--获取触发器GLOBAL_ARCHIVE_SLOT 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_global_archive_slot(actor, key) end

--获取全局触发器RANDOM_POOL_DROP非数组变量
---@param key string # 变量名称
---@return integer # 值
function GameAPI.get_trigger_variable_random_pool_drop(key) end

--获取触发器RANDOM_POOL_DROP非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return integer # 值
function GameAPI.get_trigger_actor_variable_random_pool_drop(actor, key) end

--获取全局触发器RANDOM_POOL_DROP数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return integer # 值
function GameAPI.get_trigger_list_variable_random_pool_drop(key, index) end

--获取触发器RANDOM_POOL_DROP数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return integer # 值
function GameAPI.get_trigger_list_actor_variable_random_pool_drop(actor, key, index) end

--获取全局触发器RANDOM_POOL_DROP数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_random_pool_drop(key) end

--获取触发器RANDOM_POOL_DROP 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_random_pool_drop(actor, key) end

--获取全局触发器DYNAMIC_TRIGGER_INSTANCE非数组变量
---@param key string # 变量名称
---@return py.DynamicTriggerInstance # 值
function GameAPI.get_trigger_variable_dynamic_trigger_instance(key) end

--获取触发器DYNAMIC_TRIGGER_INSTANCE非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.DynamicTriggerInstance # 值
function GameAPI.get_trigger_actor_variable_dynamic_trigger_instance(actor, key) end

--获取全局触发器DYNAMIC_TRIGGER_INSTANCE数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.DynamicTriggerInstance # 值
function GameAPI.get_trigger_list_variable_dynamic_trigger_instance(key, index) end

--获取触发器DYNAMIC_TRIGGER_INSTANCE数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.DynamicTriggerInstance # 值
function GameAPI.get_trigger_list_actor_variable_dynamic_trigger_instance(actor, key, index) end

--获取全局触发器DYNAMIC_TRIGGER_INSTANCE数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_dynamic_trigger_instance(key) end

--获取触发器DYNAMIC_TRIGGER_INSTANCE 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_dynamic_trigger_instance(actor, key) end

--获取全局触发器TABLE非数组变量
---@param key string # 变量名称
---@return py.Table # 值
function GameAPI.get_trigger_variable_table(key) end

--获取触发器TABLE非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.Table # 值
function GameAPI.get_trigger_actor_variable_table(actor, key) end

--获取全局触发器TABLE数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.Table # 值
function GameAPI.get_trigger_list_variable_table(key, index) end

--获取触发器TABLE数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.Table # 值
function GameAPI.get_trigger_list_actor_variable_table(actor, key, index) end

--获取全局触发器TABLE数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_table(key) end

--获取触发器TABLE 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_table(actor, key) end

--获取全局触发器RANDOM_POOL非数组变量
---@param key string # 变量名称
---@return py.RandomPool # 值
function GameAPI.get_trigger_variable_random_pool(key) end

--获取触发器RANDOM_POOL非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.RandomPool # 值
function GameAPI.get_trigger_actor_variable_random_pool(actor, key) end

--获取全局触发器RANDOM_POOL数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.RandomPool # 值
function GameAPI.get_trigger_list_variable_random_pool(key, index) end

--获取触发器RANDOM_POOL数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.RandomPool # 值
function GameAPI.get_trigger_list_actor_variable_random_pool(actor, key, index) end

--获取全局触发器RANDOM_POOL数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_random_pool(key) end

--获取触发器RANDOM_POOL 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_random_pool(actor, key) end

--获取全局触发器SCENE_UI非数组变量
---@param key string # 变量名称
---@return py.SceneNode # 值
function GameAPI.get_trigger_variable_scene_ui(key) end

--获取触发器SCENE_UI非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.SceneNode # 值
function GameAPI.get_trigger_actor_variable_scene_ui(actor, key) end

--获取全局触发器SCENE_UI数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.SceneNode # 值
function GameAPI.get_trigger_list_variable_scene_ui(key, index) end

--获取触发器SCENE_UI数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.SceneNode # 值
function GameAPI.get_trigger_list_actor_variable_scene_ui(actor, key, index) end

--获取全局触发器SCENE_UI数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_scene_ui(key) end

--获取触发器SCENE_UI 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_scene_ui(actor, key) end

--获取全局触发器DAMAGE_TYPE非数组变量
---@param key string # 变量名称
---@return integer # 值
function GameAPI.get_trigger_variable_damage_type(key) end

--获取触发器DAMAGE_TYPE非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return integer # 值
function GameAPI.get_trigger_actor_variable_damage_type(actor, key) end

--获取全局触发器DAMAGE_TYPE数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return integer # 值
function GameAPI.get_trigger_list_variable_damage_type(key, index) end

--获取触发器DAMAGE_TYPE数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return integer # 值
function GameAPI.get_trigger_list_actor_variable_damage_type(actor, key, index) end

--获取全局触发器DAMAGE_TYPE数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_damage_type(key) end

--获取触发器DAMAGE_TYPE 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_damage_type(actor, key) end

--获取全局触发器NEW_TIMER非数组变量
---@param key string # 变量名称
---@return py.Timer # 值
function GameAPI.get_trigger_variable_new_timer(key) end

--获取触发器NEW_TIMER非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.Timer # 值
function GameAPI.get_trigger_actor_variable_new_timer(actor, key) end

--获取全局触发器NEW_TIMER数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.Timer # 值
function GameAPI.get_trigger_list_variable_new_timer(key, index) end

--获取触发器NEW_TIMER数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.Timer # 值
function GameAPI.get_trigger_list_actor_variable_new_timer(actor, key, index) end

--获取全局触发器NEW_TIMER数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_new_timer(key) end

--获取触发器NEW_TIMER 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_new_timer(actor, key) end

--获取全局触发器TECH_KEY非数组变量
---@param key string # 变量名称
---@return py.TechKey # 值
function GameAPI.get_trigger_variable_tech_key(key) end

--获取触发器TECH_KEY非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.TechKey # 值
function GameAPI.get_trigger_actor_variable_tech_key(actor, key) end

--获取全局触发器TECH_KEY数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.TechKey # 值
function GameAPI.get_trigger_list_variable_tech_key(key, index) end

--获取触发器TECH_KEY数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.TechKey # 值
function GameAPI.get_trigger_list_actor_variable_tech_key(actor, key, index) end

--获取全局触发器TECH_KEY数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_tech_key(key) end

--获取触发器TECH_KEY 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_tech_key(actor, key) end

--获取全局触发器STORE_KEY非数组变量
---@param key string # 变量名称
---@return py.StoreKey # 值
function GameAPI.get_trigger_variable_store_key(key) end

--获取触发器STORE_KEY非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.StoreKey # 值
function GameAPI.get_trigger_actor_variable_store_key(actor, key) end

--获取全局触发器STORE_KEY数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.StoreKey # 值
function GameAPI.get_trigger_list_variable_store_key(key, index) end

--获取触发器STORE_KEY数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.StoreKey # 值
function GameAPI.get_trigger_list_actor_variable_store_key(actor, key, index) end

--获取全局触发器STORE_KEY数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_store_key(key) end

--获取触发器STORE_KEY 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_store_key(actor, key) end

--获取全局触发器KEYBOARD_KEY非数组变量
---@param key string # 变量名称
---@return py.KeyboardKey # 值
function GameAPI.get_trigger_variable_keyboard_key(key) end

--获取触发器KEYBOARD_KEY非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.KeyboardKey # 值
function GameAPI.get_trigger_actor_variable_keyboard_key(actor, key) end

--获取全局触发器KEYBOARD_KEY数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.KeyboardKey # 值
function GameAPI.get_trigger_list_variable_keyboard_key(key, index) end

--获取触发器KEYBOARD_KEY数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.KeyboardKey # 值
function GameAPI.get_trigger_list_actor_variable_keyboard_key(actor, key, index) end

--获取全局触发器KEYBOARD_KEY数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_keyboard_key(key) end

--获取触发器KEYBOARD_KEY 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_keyboard_key(actor, key) end

--获取全局触发器UNIT_TYPE非数组变量
---@param key string # 变量名称
---@return py.UnitType # 值
function GameAPI.get_trigger_variable_unit_type(key) end

--获取触发器UNIT_TYPE非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.UnitType # 值
function GameAPI.get_trigger_actor_variable_unit_type(actor, key) end

--获取全局触发器UNIT_TYPE数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.UnitType # 值
function GameAPI.get_trigger_list_variable_unit_type(key, index) end

--获取触发器UNIT_TYPE数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.UnitType # 值
function GameAPI.get_trigger_list_actor_variable_unit_type(actor, key, index) end

--获取全局触发器UNIT_TYPE数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_unit_type(key) end

--获取触发器UNIT_TYPE 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_unit_type(actor, key) end

--获取全局触发器CURVED_PATH非数组变量
---@param key string # 变量名称
---@return py.CurvedPath # 值
function GameAPI.get_trigger_variable_curved_path(key) end

--获取触发器CURVED_PATH非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.CurvedPath # 值
function GameAPI.get_trigger_actor_variable_curved_path(actor, key) end

--获取全局触发器CURVED_PATH数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.CurvedPath # 值
function GameAPI.get_trigger_list_variable_curved_path(key, index) end

--获取触发器CURVED_PATH数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.CurvedPath # 值
function GameAPI.get_trigger_list_actor_variable_curved_path(actor, key, index) end

--获取全局触发器CURVED_PATH数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_curved_path(key) end

--获取触发器CURVED_PATH 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_curved_path(actor, key) end

--获取全局触发器CURVED_PATH_3D非数组变量
---@param key string # 变量名称
---@return py.CurvedPath3D # 值
function GameAPI.get_trigger_variable_curved_path_3d(key) end

--获取触发器CURVED_PATH_3D非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.CurvedPath3D # 值
function GameAPI.get_trigger_actor_variable_curved_path_3d(actor, key) end

--获取全局触发器CURVED_PATH_3D数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.CurvedPath3D # 值
function GameAPI.get_trigger_list_variable_curved_path_3d(key, index) end

--获取触发器CURVED_PATH_3D数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.CurvedPath3D # 值
function GameAPI.get_trigger_list_actor_variable_curved_path_3d(actor, key, index) end

--获取全局触发器CURVED_PATH_3D数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_curved_path_3d(key) end

--获取触发器CURVED_PATH_3D 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_curved_path_3d(actor, key) end

--设置全局触发器非数组变量（指定类型）
---@param key string # 变量名称
---@param value py.Actor # 值
---@param var_type string # 类型
function GameAPI.set_trigger_variable_by_type(key, value, var_type) end

--设置全局触发器数组变量子项（指定类型）
---@param key string # 变量名称
---@param index integer # 下标
---@param value py.Actor # 值
---@param var_type string # 类型
function GameAPI.set_trigger_list_variable_by_type(key, index, value, var_type) end

--设置全局触发器BOOLEAN数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? boolean # 值
function GameAPI.set_trigger_list_variable_boolean(key, index, value) end

--设置全局触发器BOOLEAN数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? boolean # 值
function GameAPI.set_trigger_list_actor_variable_boolean(actor, key, index, value) end

--设置全局触发器BOOLEAN非数组变量
---@param key string # 变量名称
---@param value? boolean # 值
function GameAPI.set_trigger_variable_boolean(key, value) end

--设置全局触发器BOOLEAN非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? boolean # 值
function GameAPI.set_trigger_actor_variable_boolean(actor, key, value) end

--设置全局触发器INTEGER数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? integer # 值
function GameAPI.set_trigger_list_variable_integer(key, index, value) end

--设置全局触发器INTEGER数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? integer # 值
function GameAPI.set_trigger_list_actor_variable_integer(actor, key, index, value) end

--设置全局触发器INTEGER非数组变量
---@param key string # 变量名称
---@param value? integer # 值
function GameAPI.set_trigger_variable_integer(key, value) end

--设置全局触发器INTEGER非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? integer # 值
function GameAPI.set_trigger_actor_variable_integer(actor, key, value) end

--设置全局触发器FLOAT数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.Fixed # 值
function GameAPI.set_trigger_list_variable_float(key, index, value) end

--设置全局触发器FLOAT数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.Fixed # 值
function GameAPI.set_trigger_list_actor_variable_float(actor, key, index, value) end

--设置全局触发器FLOAT非数组变量
---@param key string # 变量名称
---@param value? py.Fixed # 值
function GameAPI.set_trigger_variable_float(key, value) end

--设置全局触发器FLOAT非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.Fixed # 值
function GameAPI.set_trigger_actor_variable_float(actor, key, value) end

--设置全局触发器STRING数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? string # 值
function GameAPI.set_trigger_list_variable_string(key, index, value) end

--设置全局触发器STRING数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? string # 值
function GameAPI.set_trigger_list_actor_variable_string(actor, key, index, value) end

--设置全局触发器STRING非数组变量
---@param key string # 变量名称
---@param value? string # 值
function GameAPI.set_trigger_variable_string(key, value) end

--设置全局触发器STRING非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? string # 值
function GameAPI.set_trigger_actor_variable_string(actor, key, value) end

--设置全局触发器UI_COMP数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? string # 值
function GameAPI.set_trigger_list_variable_ui_comp(key, index, value) end

--设置全局触发器UI_COMP数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? string # 值
function GameAPI.set_trigger_list_actor_variable_ui_comp(actor, key, index, value) end

--设置全局触发器UI_COMP非数组变量
---@param key string # 变量名称
---@param value? string # 值
function GameAPI.set_trigger_variable_ui_comp(key, value) end

--设置全局触发器UI_COMP非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? string # 值
function GameAPI.set_trigger_actor_variable_ui_comp(actor, key, value) end

--设置全局触发器UI_COMP_TYPE数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? integer # 值
function GameAPI.set_trigger_list_variable_ui_comp_type(key, index, value) end

--设置全局触发器UI_COMP_TYPE数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? integer # 值
function GameAPI.set_trigger_list_actor_variable_ui_comp_type(actor, key, index, value) end

--设置全局触发器UI_COMP_TYPE非数组变量
---@param key string # 变量名称
---@param value? integer # 值
function GameAPI.set_trigger_variable_ui_comp_type(key, value) end

--设置全局触发器UI_COMP_TYPE非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? integer # 值
function GameAPI.set_trigger_actor_variable_ui_comp_type(actor, key, value) end

--设置全局触发器UI_COMP_EVENT_TYPE数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? integer # 值
function GameAPI.set_trigger_list_variable_ui_comp_event_type(key, index, value) end

--设置全局触发器UI_COMP_EVENT_TYPE数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? integer # 值
function GameAPI.set_trigger_list_actor_variable_ui_comp_event_type(actor, key, index, value) end

--设置全局触发器UI_COMP_EVENT_TYPE非数组变量
---@param key string # 变量名称
---@param value? integer # 值
function GameAPI.set_trigger_variable_ui_comp_event_type(key, value) end

--设置全局触发器UI_COMP_EVENT_TYPE非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? integer # 值
function GameAPI.set_trigger_actor_variable_ui_comp_event_type(actor, key, value) end

--设置全局触发器UI_COMP_ALIGN_TYPE数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? integer # 值
function GameAPI.set_trigger_list_variable_ui_comp_align_type(key, index, value) end

--设置全局触发器UI_COMP_ALIGN_TYPE数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? integer # 值
function GameAPI.set_trigger_list_actor_variable_ui_comp_align_type(actor, key, index, value) end

--设置全局触发器UI_COMP_ALIGN_TYPE非数组变量
---@param key string # 变量名称
---@param value? integer # 值
function GameAPI.set_trigger_variable_ui_comp_align_type(key, value) end

--设置全局触发器UI_COMP_ALIGN_TYPE非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? integer # 值
function GameAPI.set_trigger_actor_variable_ui_comp_align_type(actor, key, value) end

--设置全局触发器UI_PREFAB数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? string # 值
function GameAPI.set_trigger_list_variable_ui_prefab(key, index, value) end

--设置全局触发器UI_PREFAB数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? string # 值
function GameAPI.set_trigger_list_actor_variable_ui_prefab(actor, key, index, value) end

--设置全局触发器UI_PREFAB非数组变量
---@param key string # 变量名称
---@param value? string # 值
function GameAPI.set_trigger_variable_ui_prefab(key, value) end

--设置全局触发器UI_PREFAB非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? string # 值
function GameAPI.set_trigger_actor_variable_ui_prefab(actor, key, value) end

--设置全局触发器UI_PREFAB_INSTANCE数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.UIPrefabIns # 值
function GameAPI.set_trigger_list_variable_ui_prefab_instance(key, index, value) end

--设置全局触发器UI_PREFAB_INSTANCE数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.UIPrefabIns # 值
function GameAPI.set_trigger_list_actor_variable_ui_prefab_instance(actor, key, index, value) end

--设置全局触发器UI_PREFAB_INSTANCE非数组变量
---@param key string # 变量名称
---@param value? py.UIPrefabIns # 值
function GameAPI.set_trigger_variable_ui_prefab_instance(key, value) end

--设置全局触发器UI_PREFAB_INSTANCE非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.UIPrefabIns # 值
function GameAPI.set_trigger_actor_variable_ui_prefab_instance(actor, key, value) end

--设置全局触发器UI_PREFAB_INS_UID数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? string # 值
function GameAPI.set_trigger_list_variable_ui_prefab_ins_uid(key, index, value) end

--设置全局触发器UI_PREFAB_INS_UID数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? string # 值
function GameAPI.set_trigger_list_actor_variable_ui_prefab_ins_uid(actor, key, index, value) end

--设置全局触发器UI_PREFAB_INS_UID非数组变量
---@param key string # 变量名称
---@param value? string # 值
function GameAPI.set_trigger_variable_ui_prefab_ins_uid(key, value) end

--设置全局触发器UI_PREFAB_INS_UID非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? string # 值
function GameAPI.set_trigger_actor_variable_ui_prefab_ins_uid(actor, key, value) end

--设置全局触发器UI_DIRECTION数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? integer # 值
function GameAPI.set_trigger_list_variable_ui_direction(key, index, value) end

--设置全局触发器UI_DIRECTION数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? integer # 值
function GameAPI.set_trigger_list_actor_variable_ui_direction(actor, key, index, value) end

--设置全局触发器UI_DIRECTION非数组变量
---@param key string # 变量名称
---@param value? integer # 值
function GameAPI.set_trigger_variable_ui_direction(key, value) end

--设置全局触发器UI_DIRECTION非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? integer # 值
function GameAPI.set_trigger_actor_variable_ui_direction(actor, key, value) end

--设置全局触发器UI_MODEL_CAMERA_MOD数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? integer # 值
function GameAPI.set_trigger_list_variable_ui_model_camera_mod(key, index, value) end

--设置全局触发器UI_MODEL_CAMERA_MOD数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? integer # 值
function GameAPI.set_trigger_list_actor_variable_ui_model_camera_mod(actor, key, index, value) end

--设置全局触发器UI_MODEL_CAMERA_MOD非数组变量
---@param key string # 变量名称
---@param value? integer # 值
function GameAPI.set_trigger_variable_ui_model_camera_mod(key, value) end

--设置全局触发器UI_MODEL_CAMERA_MOD非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? integer # 值
function GameAPI.set_trigger_actor_variable_ui_model_camera_mod(actor, key, value) end

--设置全局触发器UI_BTN_STATUS数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? integer # 值
function GameAPI.set_trigger_list_variable_ui_btn_status(key, index, value) end

--设置全局触发器UI_BTN_STATUS数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? integer # 值
function GameAPI.set_trigger_list_actor_variable_ui_btn_status(actor, key, index, value) end

--设置全局触发器UI_BTN_STATUS非数组变量
---@param key string # 变量名称
---@param value? integer # 值
function GameAPI.set_trigger_variable_ui_btn_status(key, value) end

--设置全局触发器UI_BTN_STATUS非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? integer # 值
function GameAPI.set_trigger_actor_variable_ui_btn_status(actor, key, value) end

--设置全局触发器UI_SCROLLVIEW_TYPE数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? integer # 值
function GameAPI.set_trigger_list_variable_ui_scrollview_type(key, index, value) end

--设置全局触发器UI_SCROLLVIEW_TYPE数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? integer # 值
function GameAPI.set_trigger_list_actor_variable_ui_scrollview_type(actor, key, index, value) end

--设置全局触发器UI_SCROLLVIEW_TYPE非数组变量
---@param key string # 变量名称
---@param value? integer # 值
function GameAPI.set_trigger_variable_ui_scrollview_type(key, value) end

--设置全局触发器UI_SCROLLVIEW_TYPE非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? integer # 值
function GameAPI.set_trigger_actor_variable_ui_scrollview_type(actor, key, value) end

--设置全局触发器UI_ANIM数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.UIAnimKey # 值
function GameAPI.set_trigger_list_variable_ui_anim(key, index, value) end

--设置全局触发器UI_ANIM数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.UIAnimKey # 值
function GameAPI.set_trigger_list_actor_variable_ui_anim(actor, key, index, value) end

--设置全局触发器UI_ANIM非数组变量
---@param key string # 变量名称
---@param value? py.UIAnimKey # 值
function GameAPI.set_trigger_variable_ui_anim(key, value) end

--设置全局触发器UI_ANIM非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.UIAnimKey # 值
function GameAPI.set_trigger_actor_variable_ui_anim(actor, key, value) end

--设置全局触发器UI_ANIM_CURVE数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? integer # 值
function GameAPI.set_trigger_list_variable_ui_anim_curve(key, index, value) end

--设置全局触发器UI_ANIM_CURVE数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? integer # 值
function GameAPI.set_trigger_list_actor_variable_ui_anim_curve(actor, key, index, value) end

--设置全局触发器UI_ANIM_CURVE非数组变量
---@param key string # 变量名称
---@param value? integer # 值
function GameAPI.set_trigger_variable_ui_anim_curve(key, value) end

--设置全局触发器UI_ANIM_CURVE非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? integer # 值
function GameAPI.set_trigger_actor_variable_ui_anim_curve(actor, key, value) end

--设置全局触发器AUDIO_CHANNEL数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? integer # 值
function GameAPI.set_trigger_list_variable_audio_channel(key, index, value) end

--设置全局触发器AUDIO_CHANNEL数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? integer # 值
function GameAPI.set_trigger_list_actor_variable_audio_channel(actor, key, index, value) end

--设置全局触发器AUDIO_CHANNEL非数组变量
---@param key string # 变量名称
---@param value? integer # 值
function GameAPI.set_trigger_variable_audio_channel(key, value) end

--设置全局触发器AUDIO_CHANNEL非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? integer # 值
function GameAPI.set_trigger_actor_variable_audio_channel(actor, key, value) end

--设置全局触发器UNIT_ENTITY数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.Unit # 值
function GameAPI.set_trigger_list_variable_unit_entity(key, index, value) end

--设置全局触发器UNIT_ENTITY数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.Unit # 值
function GameAPI.set_trigger_list_actor_variable_unit_entity(actor, key, index, value) end

--设置全局触发器UNIT_ENTITY非数组变量
---@param key string # 变量名称
---@param value? py.Unit # 值
function GameAPI.set_trigger_variable_unit_entity(key, value) end

--设置全局触发器UNIT_ENTITY非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.Unit # 值
function GameAPI.set_trigger_actor_variable_unit_entity(actor, key, value) end

--设置全局触发器UNIT_GROUP数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.UnitGroup # 值
function GameAPI.set_trigger_list_variable_unit_group(key, index, value) end

--设置全局触发器UNIT_GROUP数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.UnitGroup # 值
function GameAPI.set_trigger_list_actor_variable_unit_group(actor, key, index, value) end

--设置全局触发器UNIT_GROUP非数组变量
---@param key string # 变量名称
---@param value? py.UnitGroup # 值
function GameAPI.set_trigger_variable_unit_group(key, value) end

--设置全局触发器UNIT_GROUP非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.UnitGroup # 值
function GameAPI.set_trigger_actor_variable_unit_group(actor, key, value) end

--设置全局触发器UNIT_NAME数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.UnitKey # 值
function GameAPI.set_trigger_list_variable_unit_name(key, index, value) end

--设置全局触发器UNIT_NAME数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.UnitKey # 值
function GameAPI.set_trigger_list_actor_variable_unit_name(actor, key, index, value) end

--设置全局触发器UNIT_NAME非数组变量
---@param key string # 变量名称
---@param value? py.UnitKey # 值
function GameAPI.set_trigger_variable_unit_name(key, value) end

--设置全局触发器UNIT_NAME非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.UnitKey # 值
function GameAPI.set_trigger_actor_variable_unit_name(actor, key, value) end

--设置全局触发器UNIT_NAME_POOL数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.UnitKeyPool # 值
function GameAPI.set_trigger_list_variable_unit_name_pool(key, index, value) end

--设置全局触发器UNIT_NAME_POOL数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.UnitKeyPool # 值
function GameAPI.set_trigger_list_actor_variable_unit_name_pool(actor, key, index, value) end

--设置全局触发器UNIT_NAME_POOL非数组变量
---@param key string # 变量名称
---@param value? py.UnitKeyPool # 值
function GameAPI.set_trigger_variable_unit_name_pool(key, value) end

--设置全局触发器UNIT_NAME_POOL非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.UnitKeyPool # 值
function GameAPI.set_trigger_actor_variable_unit_name_pool(actor, key, value) end

--设置全局触发器UNIT_WRITE_ATTRIBUTE数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? string # 值
function GameAPI.set_trigger_list_variable_unit_write_attribute(key, index, value) end

--设置全局触发器UNIT_WRITE_ATTRIBUTE数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? string # 值
function GameAPI.set_trigger_list_actor_variable_unit_write_attribute(actor, key, index, value) end

--设置全局触发器UNIT_WRITE_ATTRIBUTE非数组变量
---@param key string # 变量名称
---@param value? string # 值
function GameAPI.set_trigger_variable_unit_write_attribute(key, value) end

--设置全局触发器UNIT_WRITE_ATTRIBUTE非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? string # 值
function GameAPI.set_trigger_actor_variable_unit_write_attribute(actor, key, value) end

--设置全局触发器ATTR_ELEMENT数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? string # 值
function GameAPI.set_trigger_list_variable_attr_element(key, index, value) end

--设置全局触发器ATTR_ELEMENT数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? string # 值
function GameAPI.set_trigger_list_actor_variable_attr_element(actor, key, index, value) end

--设置全局触发器ATTR_ELEMENT非数组变量
---@param key string # 变量名称
---@param value? string # 值
function GameAPI.set_trigger_variable_attr_element(key, value) end

--设置全局触发器ATTR_ELEMENT非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? string # 值
function GameAPI.set_trigger_actor_variable_attr_element(actor, key, value) end

--设置全局触发器ATTR_ELEMENT_READ数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? string # 值
function GameAPI.set_trigger_list_variable_attr_element_read(key, index, value) end

--设置全局触发器ATTR_ELEMENT_READ数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? string # 值
function GameAPI.set_trigger_list_actor_variable_attr_element_read(actor, key, index, value) end

--设置全局触发器ATTR_ELEMENT_READ非数组变量
---@param key string # 变量名称
---@param value? string # 值
function GameAPI.set_trigger_variable_attr_element_read(key, value) end

--设置全局触发器ATTR_ELEMENT_READ非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? string # 值
function GameAPI.set_trigger_actor_variable_attr_element_read(actor, key, value) end

--设置全局触发器MOVER_ENTITY数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.Mover # 值
function GameAPI.set_trigger_list_variable_mover_entity(key, index, value) end

--设置全局触发器MOVER_ENTITY数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.Mover # 值
function GameAPI.set_trigger_list_actor_variable_mover_entity(actor, key, index, value) end

--设置全局触发器MOVER_ENTITY非数组变量
---@param key string # 变量名称
---@param value? py.Mover # 值
function GameAPI.set_trigger_variable_mover_entity(key, value) end

--设置全局触发器MOVER_ENTITY非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.Mover # 值
function GameAPI.set_trigger_actor_variable_mover_entity(actor, key, value) end

--设置全局触发器IMAGE_QUALITY数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? string # 值
function GameAPI.set_trigger_list_variable_image_quality(key, index, value) end

--设置全局触发器IMAGE_QUALITY数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? string # 值
function GameAPI.set_trigger_list_actor_variable_image_quality(actor, key, index, value) end

--设置全局触发器IMAGE_QUALITY非数组变量
---@param key string # 变量名称
---@param value? string # 值
function GameAPI.set_trigger_variable_image_quality(key, value) end

--设置全局触发器IMAGE_QUALITY非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? string # 值
function GameAPI.set_trigger_actor_variable_image_quality(actor, key, value) end

--设置全局触发器WINDOW_TYPE_SETTING数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? string # 值
function GameAPI.set_trigger_list_variable_window_type_setting(key, index, value) end

--设置全局触发器WINDOW_TYPE_SETTING数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? string # 值
function GameAPI.set_trigger_list_actor_variable_window_type_setting(actor, key, index, value) end

--设置全局触发器WINDOW_TYPE_SETTING非数组变量
---@param key string # 变量名称
---@param value? string # 值
function GameAPI.set_trigger_variable_window_type_setting(key, value) end

--设置全局触发器WINDOW_TYPE_SETTING非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? string # 值
function GameAPI.set_trigger_actor_variable_window_type_setting(actor, key, value) end

--设置全局触发器DAMAGE_ATTACK_TYPE数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? integer # 值
function GameAPI.set_trigger_list_variable_damage_attack_type(key, index, value) end

--设置全局触发器DAMAGE_ATTACK_TYPE数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? integer # 值
function GameAPI.set_trigger_list_actor_variable_damage_attack_type(actor, key, index, value) end

--设置全局触发器DAMAGE_ATTACK_TYPE非数组变量
---@param key string # 变量名称
---@param value? integer # 值
function GameAPI.set_trigger_variable_damage_attack_type(key, value) end

--设置全局触发器DAMAGE_ATTACK_TYPE非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? integer # 值
function GameAPI.set_trigger_actor_variable_damage_attack_type(actor, key, value) end

--设置全局触发器DAMAGE_ARMOR_TYPE数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? integer # 值
function GameAPI.set_trigger_list_variable_damage_armor_type(key, index, value) end

--设置全局触发器DAMAGE_ARMOR_TYPE数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? integer # 值
function GameAPI.set_trigger_list_actor_variable_damage_armor_type(actor, key, index, value) end

--设置全局触发器DAMAGE_ARMOR_TYPE非数组变量
---@param key string # 变量名称
---@param value? integer # 值
function GameAPI.set_trigger_variable_damage_armor_type(key, value) end

--设置全局触发器DAMAGE_ARMOR_TYPE非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? integer # 值
function GameAPI.set_trigger_actor_variable_damage_armor_type(actor, key, value) end

--设置全局触发器ITEM_ENTITY数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.Item # 值
function GameAPI.set_trigger_list_variable_item_entity(key, index, value) end

--设置全局触发器ITEM_ENTITY数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.Item # 值
function GameAPI.set_trigger_list_actor_variable_item_entity(actor, key, index, value) end

--设置全局触发器ITEM_ENTITY非数组变量
---@param key string # 变量名称
---@param value? py.Item # 值
function GameAPI.set_trigger_variable_item_entity(key, value) end

--设置全局触发器ITEM_ENTITY非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.Item # 值
function GameAPI.set_trigger_actor_variable_item_entity(actor, key, value) end

--设置全局触发器ITEM_GROUP数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.ItemGroup # 值
function GameAPI.set_trigger_list_variable_item_group(key, index, value) end

--设置全局触发器ITEM_GROUP数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.ItemGroup # 值
function GameAPI.set_trigger_list_actor_variable_item_group(actor, key, index, value) end

--设置全局触发器ITEM_GROUP非数组变量
---@param key string # 变量名称
---@param value? py.ItemGroup # 值
function GameAPI.set_trigger_variable_item_group(key, value) end

--设置全局触发器ITEM_GROUP非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.ItemGroup # 值
function GameAPI.set_trigger_actor_variable_item_group(actor, key, value) end

--设置全局触发器ITEM_NAME数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.ItemKey # 值
function GameAPI.set_trigger_list_variable_item_name(key, index, value) end

--设置全局触发器ITEM_NAME数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.ItemKey # 值
function GameAPI.set_trigger_list_actor_variable_item_name(actor, key, index, value) end

--设置全局触发器ITEM_NAME非数组变量
---@param key string # 变量名称
---@param value? py.ItemKey # 值
function GameAPI.set_trigger_variable_item_name(key, value) end

--设置全局触发器ITEM_NAME非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.ItemKey # 值
function GameAPI.set_trigger_actor_variable_item_name(actor, key, value) end

--设置全局触发器ABILITY数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.Ability # 值
function GameAPI.set_trigger_list_variable_ability(key, index, value) end

--设置全局触发器ABILITY数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.Ability # 值
function GameAPI.set_trigger_list_actor_variable_ability(actor, key, index, value) end

--设置全局触发器ABILITY非数组变量
---@param key string # 变量名称
---@param value? py.Ability # 值
function GameAPI.set_trigger_variable_ability(key, value) end

--设置全局触发器ABILITY非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.Ability # 值
function GameAPI.set_trigger_actor_variable_ability(actor, key, value) end

--设置全局触发器ABILITY_TYPE数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? integer # 值
function GameAPI.set_trigger_list_variable_ability_type(key, index, value) end

--设置全局触发器ABILITY_TYPE数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? integer # 值
function GameAPI.set_trigger_list_actor_variable_ability_type(actor, key, index, value) end

--设置全局触发器ABILITY_TYPE非数组变量
---@param key string # 变量名称
---@param value? integer # 值
function GameAPI.set_trigger_variable_ability_type(key, value) end

--设置全局触发器ABILITY_TYPE非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? integer # 值
function GameAPI.set_trigger_actor_variable_ability_type(actor, key, value) end

--设置全局触发器ABILITY_CAST_TYPE数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? integer # 值
function GameAPI.set_trigger_list_variable_ability_cast_type(key, index, value) end

--设置全局触发器ABILITY_CAST_TYPE数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? integer # 值
function GameAPI.set_trigger_list_actor_variable_ability_cast_type(actor, key, index, value) end

--设置全局触发器ABILITY_CAST_TYPE非数组变量
---@param key string # 变量名称
---@param value? integer # 值
function GameAPI.set_trigger_variable_ability_cast_type(key, value) end

--设置全局触发器ABILITY_CAST_TYPE非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? integer # 值
function GameAPI.set_trigger_actor_variable_ability_cast_type(actor, key, value) end

--设置全局触发器ABILITY_NAME数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.AbilityKey # 值
function GameAPI.set_trigger_list_variable_ability_name(key, index, value) end

--设置全局触发器ABILITY_NAME数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.AbilityKey # 值
function GameAPI.set_trigger_list_actor_variable_ability_name(actor, key, index, value) end

--设置全局触发器ABILITY_NAME非数组变量
---@param key string # 变量名称
---@param value? py.AbilityKey # 值
function GameAPI.set_trigger_variable_ability_name(key, value) end

--设置全局触发器ABILITY_NAME非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.AbilityKey # 值
function GameAPI.set_trigger_actor_variable_ability_name(actor, key, value) end

--设置全局触发器MODIFIER_ENTITY数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.ModifierEntity # 值
function GameAPI.set_trigger_list_variable_modifier_entity(key, index, value) end

--设置全局触发器MODIFIER_ENTITY数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.ModifierEntity # 值
function GameAPI.set_trigger_list_actor_variable_modifier_entity(actor, key, index, value) end

--设置全局触发器MODIFIER_ENTITY非数组变量
---@param key string # 变量名称
---@param value? py.ModifierEntity # 值
function GameAPI.set_trigger_variable_modifier_entity(key, value) end

--设置全局触发器MODIFIER_ENTITY非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.ModifierEntity # 值
function GameAPI.set_trigger_actor_variable_modifier_entity(actor, key, value) end

--设置全局触发器MODIFIER数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.ModifierKey # 值
function GameAPI.set_trigger_list_variable_modifier(key, index, value) end

--设置全局触发器MODIFIER数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.ModifierKey # 值
function GameAPI.set_trigger_list_actor_variable_modifier(actor, key, index, value) end

--设置全局触发器MODIFIER非数组变量
---@param key string # 变量名称
---@param value? py.ModifierKey # 值
function GameAPI.set_trigger_variable_modifier(key, value) end

--设置全局触发器MODIFIER非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.ModifierKey # 值
function GameAPI.set_trigger_actor_variable_modifier(actor, key, value) end

--设置全局触发器PROJECTILE数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.ProjectileKey # 值
function GameAPI.set_trigger_list_variable_projectile(key, index, value) end

--设置全局触发器PROJECTILE数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.ProjectileKey # 值
function GameAPI.set_trigger_list_actor_variable_projectile(actor, key, index, value) end

--设置全局触发器PROJECTILE非数组变量
---@param key string # 变量名称
---@param value? py.ProjectileKey # 值
function GameAPI.set_trigger_variable_projectile(key, value) end

--设置全局触发器PROJECTILE非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.ProjectileKey # 值
function GameAPI.set_trigger_actor_variable_projectile(actor, key, value) end

--设置全局触发器PROJECTILE_ENTITY数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.ProjectileEntity # 值
function GameAPI.set_trigger_list_variable_projectile_entity(key, index, value) end

--设置全局触发器PROJECTILE_ENTITY数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.ProjectileEntity # 值
function GameAPI.set_trigger_list_actor_variable_projectile_entity(actor, key, index, value) end

--设置全局触发器PROJECTILE_ENTITY非数组变量
---@param key string # 变量名称
---@param value? py.ProjectileEntity # 值
function GameAPI.set_trigger_variable_projectile_entity(key, value) end

--设置全局触发器PROJECTILE_ENTITY非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.ProjectileEntity # 值
function GameAPI.set_trigger_actor_variable_projectile_entity(actor, key, value) end

--设置全局触发器PROJECTILE_GROUP数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.ProjectileGroup # 值
function GameAPI.set_trigger_list_variable_projectile_group(key, index, value) end

--设置全局触发器PROJECTILE_GROUP数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.ProjectileGroup # 值
function GameAPI.set_trigger_list_actor_variable_projectile_group(actor, key, index, value) end

--设置全局触发器PROJECTILE_GROUP非数组变量
---@param key string # 变量名称
---@param value? py.ProjectileGroup # 值
function GameAPI.set_trigger_variable_projectile_group(key, value) end

--设置全局触发器PROJECTILE_GROUP非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.ProjectileGroup # 值
function GameAPI.set_trigger_actor_variable_projectile_group(actor, key, value) end

--设置全局触发器DESTRUCTIBLE_ENTITY数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.Destructible # 值
function GameAPI.set_trigger_list_variable_destructible_entity(key, index, value) end

--设置全局触发器DESTRUCTIBLE_ENTITY数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.Destructible # 值
function GameAPI.set_trigger_list_actor_variable_destructible_entity(actor, key, index, value) end

--设置全局触发器DESTRUCTIBLE_ENTITY非数组变量
---@param key string # 变量名称
---@param value? py.Destructible # 值
function GameAPI.set_trigger_variable_destructible_entity(key, value) end

--设置全局触发器DESTRUCTIBLE_ENTITY非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.Destructible # 值
function GameAPI.set_trigger_actor_variable_destructible_entity(actor, key, value) end

--设置全局触发器DESTRUCTIBLE_NAME数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.DestructibleKey # 值
function GameAPI.set_trigger_list_variable_destructible_name(key, index, value) end

--设置全局触发器DESTRUCTIBLE_NAME数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.DestructibleKey # 值
function GameAPI.set_trigger_list_actor_variable_destructible_name(actor, key, index, value) end

--设置全局触发器DESTRUCTIBLE_NAME非数组变量
---@param key string # 变量名称
---@param value? py.DestructibleKey # 值
function GameAPI.set_trigger_variable_destructible_name(key, value) end

--设置全局触发器DESTRUCTIBLE_NAME非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.DestructibleKey # 值
function GameAPI.set_trigger_actor_variable_destructible_name(actor, key, value) end

--设置全局触发器SOUND_ENTITY数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.SoundEntity # 值
function GameAPI.set_trigger_list_variable_sound_entity(key, index, value) end

--设置全局触发器SOUND_ENTITY数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.SoundEntity # 值
function GameAPI.set_trigger_list_actor_variable_sound_entity(actor, key, index, value) end

--设置全局触发器SOUND_ENTITY非数组变量
---@param key string # 变量名称
---@param value? py.SoundEntity # 值
function GameAPI.set_trigger_variable_sound_entity(key, value) end

--设置全局触发器SOUND_ENTITY非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.SoundEntity # 值
function GameAPI.set_trigger_actor_variable_sound_entity(actor, key, value) end

--设置全局触发器AUDIO_KEY数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.AudioKey # 值
function GameAPI.set_trigger_list_variable_audio_key(key, index, value) end

--设置全局触发器AUDIO_KEY数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.AudioKey # 值
function GameAPI.set_trigger_list_actor_variable_audio_key(actor, key, index, value) end

--设置全局触发器AUDIO_KEY非数组变量
---@param key string # 变量名称
---@param value? py.AudioKey # 值
function GameAPI.set_trigger_variable_audio_key(key, value) end

--设置全局触发器AUDIO_KEY非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.AudioKey # 值
function GameAPI.set_trigger_actor_variable_audio_key(actor, key, value) end

--设置全局触发器GAME_MODE数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.GameMode # 值
function GameAPI.set_trigger_list_variable_game_mode(key, index, value) end

--设置全局触发器GAME_MODE数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.GameMode # 值
function GameAPI.set_trigger_list_actor_variable_game_mode(actor, key, index, value) end

--设置全局触发器GAME_MODE非数组变量
---@param key string # 变量名称
---@param value? py.GameMode # 值
function GameAPI.set_trigger_variable_game_mode(key, value) end

--设置全局触发器GAME_MODE非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.GameMode # 值
function GameAPI.set_trigger_actor_variable_game_mode(actor, key, value) end

--设置全局触发器PLAYER数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.Role # 值
function GameAPI.set_trigger_list_variable_player(key, index, value) end

--设置全局触发器PLAYER数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.Role # 值
function GameAPI.set_trigger_list_actor_variable_player(actor, key, index, value) end

--设置全局触发器PLAYER非数组变量
---@param key string # 变量名称
---@param value? py.Role # 值
function GameAPI.set_trigger_variable_player(key, value) end

--设置全局触发器PLAYER非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.Role # 值
function GameAPI.set_trigger_actor_variable_player(actor, key, value) end

--设置全局触发器PLAYER_GROUP数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.RoleGroup # 值
function GameAPI.set_trigger_list_variable_player_group(key, index, value) end

--设置全局触发器PLAYER_GROUP数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.RoleGroup # 值
function GameAPI.set_trigger_list_actor_variable_player_group(actor, key, index, value) end

--设置全局触发器PLAYER_GROUP非数组变量
---@param key string # 变量名称
---@param value? py.RoleGroup # 值
function GameAPI.set_trigger_variable_player_group(key, value) end

--设置全局触发器PLAYER_GROUP非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.RoleGroup # 值
function GameAPI.set_trigger_actor_variable_player_group(actor, key, value) end

--设置全局触发器ROLE_RES_KEY数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.RoleResKey # 值
function GameAPI.set_trigger_list_variable_role_res_key(key, index, value) end

--设置全局触发器ROLE_RES_KEY数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.RoleResKey # 值
function GameAPI.set_trigger_list_actor_variable_role_res_key(actor, key, index, value) end

--设置全局触发器ROLE_RES_KEY非数组变量
---@param key string # 变量名称
---@param value? py.RoleResKey # 值
function GameAPI.set_trigger_variable_role_res_key(key, value) end

--设置全局触发器ROLE_RES_KEY非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.RoleResKey # 值
function GameAPI.set_trigger_actor_variable_role_res_key(actor, key, value) end

--设置全局触发器ROLE_STATUS数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.RoleStatus # 值
function GameAPI.set_trigger_list_variable_role_status(key, index, value) end

--设置全局触发器ROLE_STATUS数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.RoleStatus # 值
function GameAPI.set_trigger_list_actor_variable_role_status(actor, key, index, value) end

--设置全局触发器ROLE_STATUS非数组变量
---@param key string # 变量名称
---@param value? py.RoleStatus # 值
function GameAPI.set_trigger_variable_role_status(key, value) end

--设置全局触发器ROLE_STATUS非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.RoleStatus # 值
function GameAPI.set_trigger_actor_variable_role_status(actor, key, value) end

--设置全局触发器ROLE_TYPE数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.RoleType # 值
function GameAPI.set_trigger_list_variable_role_type(key, index, value) end

--设置全局触发器ROLE_TYPE数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.RoleType # 值
function GameAPI.set_trigger_list_actor_variable_role_type(actor, key, index, value) end

--设置全局触发器ROLE_TYPE非数组变量
---@param key string # 变量名称
---@param value? py.RoleType # 值
function GameAPI.set_trigger_variable_role_type(key, value) end

--设置全局触发器ROLE_TYPE非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.RoleType # 值
function GameAPI.set_trigger_actor_variable_role_type(actor, key, value) end

--设置全局触发器TEAM数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.Camp # 值
function GameAPI.set_trigger_list_variable_team(key, index, value) end

--设置全局触发器TEAM数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.Camp # 值
function GameAPI.set_trigger_list_actor_variable_team(actor, key, index, value) end

--设置全局触发器TEAM非数组变量
---@param key string # 变量名称
---@param value? py.Camp # 值
function GameAPI.set_trigger_variable_team(key, value) end

--设置全局触发器TEAM非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.Camp # 值
function GameAPI.set_trigger_actor_variable_team(actor, key, value) end

--设置全局触发器POINT数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.FPoint # 值
function GameAPI.set_trigger_list_variable_point(key, index, value) end

--设置全局触发器POINT数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.FPoint # 值
function GameAPI.set_trigger_list_actor_variable_point(actor, key, index, value) end

--设置全局触发器POINT非数组变量
---@param key string # 变量名称
---@param value? py.FPoint # 值
function GameAPI.set_trigger_variable_point(key, value) end

--设置全局触发器POINT非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.FPoint # 值
function GameAPI.set_trigger_actor_variable_point(actor, key, value) end

--设置全局触发器VECTOR3数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.FVector3 # 值
function GameAPI.set_trigger_list_variable_vector3(key, index, value) end

--设置全局触发器VECTOR3数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.FVector3 # 值
function GameAPI.set_trigger_list_actor_variable_vector3(actor, key, index, value) end

--设置全局触发器VECTOR3非数组变量
---@param key string # 变量名称
---@param value? py.FVector3 # 值
function GameAPI.set_trigger_variable_vector3(key, value) end

--设置全局触发器VECTOR3非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.FVector3 # 值
function GameAPI.set_trigger_actor_variable_vector3(actor, key, value) end

--设置全局触发器ROTATION数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.FRotation # 值
function GameAPI.set_trigger_list_variable_rotation(key, index, value) end

--设置全局触发器ROTATION数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.FRotation # 值
function GameAPI.set_trigger_list_actor_variable_rotation(actor, key, index, value) end

--设置全局触发器ROTATION非数组变量
---@param key string # 变量名称
---@param value? py.FRotation # 值
function GameAPI.set_trigger_variable_rotation(key, value) end

--设置全局触发器ROTATION非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.FRotation # 值
function GameAPI.set_trigger_actor_variable_rotation(actor, key, value) end

--设置全局触发器POINT_LIST数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.Road # 值
function GameAPI.set_trigger_list_variable_point_list(key, index, value) end

--设置全局触发器POINT_LIST数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.Road # 值
function GameAPI.set_trigger_list_actor_variable_point_list(actor, key, index, value) end

--设置全局触发器POINT_LIST非数组变量
---@param key string # 变量名称
---@param value? py.Road # 值
function GameAPI.set_trigger_variable_point_list(key, value) end

--设置全局触发器POINT_LIST非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.Road # 值
function GameAPI.set_trigger_actor_variable_point_list(actor, key, value) end

--设置全局触发器ROAD_GROUP数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.RoadGroup # 值
function GameAPI.set_trigger_list_variable_road_group(key, index, value) end

--设置全局触发器ROAD_GROUP数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.RoadGroup # 值
function GameAPI.set_trigger_list_actor_variable_road_group(actor, key, index, value) end

--设置全局触发器ROAD_GROUP非数组变量
---@param key string # 变量名称
---@param value? py.RoadGroup # 值
function GameAPI.set_trigger_variable_road_group(key, value) end

--设置全局触发器ROAD_GROUP非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.RoadGroup # 值
function GameAPI.set_trigger_actor_variable_road_group(actor, key, value) end

--设置全局触发器RECTANGLE数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.RecArea # 值
function GameAPI.set_trigger_list_variable_rectangle(key, index, value) end

--设置全局触发器RECTANGLE数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.RecArea # 值
function GameAPI.set_trigger_list_actor_variable_rectangle(actor, key, index, value) end

--设置全局触发器RECTANGLE非数组变量
---@param key string # 变量名称
---@param value? py.RecArea # 值
function GameAPI.set_trigger_variable_rectangle(key, value) end

--设置全局触发器RECTANGLE非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.RecArea # 值
function GameAPI.set_trigger_actor_variable_rectangle(actor, key, value) end

--设置全局触发器ROUND_AREA数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.CirArea # 值
function GameAPI.set_trigger_list_variable_round_area(key, index, value) end

--设置全局触发器ROUND_AREA数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.CirArea # 值
function GameAPI.set_trigger_list_actor_variable_round_area(actor, key, index, value) end

--设置全局触发器ROUND_AREA非数组变量
---@param key string # 变量名称
---@param value? py.CirArea # 值
function GameAPI.set_trigger_variable_round_area(key, value) end

--设置全局触发器ROUND_AREA非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.CirArea # 值
function GameAPI.set_trigger_actor_variable_round_area(actor, key, value) end

--设置全局触发器POLYGON数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.PolyArea # 值
function GameAPI.set_trigger_list_variable_polygon(key, index, value) end

--设置全局触发器POLYGON数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.PolyArea # 值
function GameAPI.set_trigger_list_actor_variable_polygon(actor, key, index, value) end

--设置全局触发器POLYGON非数组变量
---@param key string # 变量名称
---@param value? py.PolyArea # 值
function GameAPI.set_trigger_variable_polygon(key, value) end

--设置全局触发器POLYGON非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.PolyArea # 值
function GameAPI.set_trigger_actor_variable_polygon(actor, key, value) end

--设置全局触发器CAMERA数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.Camera # 值
function GameAPI.set_trigger_list_variable_camera(key, index, value) end

--设置全局触发器CAMERA数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.Camera # 值
function GameAPI.set_trigger_list_actor_variable_camera(actor, key, index, value) end

--设置全局触发器CAMERA非数组变量
---@param key string # 变量名称
---@param value? py.Camera # 值
function GameAPI.set_trigger_variable_camera(key, value) end

--设置全局触发器CAMERA非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.Camera # 值
function GameAPI.set_trigger_actor_variable_camera(actor, key, value) end

--设置全局触发器CAMLINE数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.CamlineID # 值
function GameAPI.set_trigger_list_variable_camline(key, index, value) end

--设置全局触发器CAMLINE数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.CamlineID # 值
function GameAPI.set_trigger_list_actor_variable_camline(actor, key, index, value) end

--设置全局触发器CAMLINE非数组变量
---@param key string # 变量名称
---@param value? py.CamlineID # 值
function GameAPI.set_trigger_variable_camline(key, value) end

--设置全局触发器CAMLINE非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.CamlineID # 值
function GameAPI.set_trigger_actor_variable_camline(actor, key, value) end

--设置全局触发器POINT_LIGHT数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.PointLight # 值
function GameAPI.set_trigger_list_variable_point_light(key, index, value) end

--设置全局触发器POINT_LIGHT数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.PointLight # 值
function GameAPI.set_trigger_list_actor_variable_point_light(actor, key, index, value) end

--设置全局触发器POINT_LIGHT非数组变量
---@param key string # 变量名称
---@param value? py.PointLight # 值
function GameAPI.set_trigger_variable_point_light(key, value) end

--设置全局触发器POINT_LIGHT非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.PointLight # 值
function GameAPI.set_trigger_actor_variable_point_light(actor, key, value) end

--设置全局触发器SPOT_LIGHT数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.SpotLight # 值
function GameAPI.set_trigger_list_variable_spot_light(key, index, value) end

--设置全局触发器SPOT_LIGHT数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.SpotLight # 值
function GameAPI.set_trigger_list_actor_variable_spot_light(actor, key, index, value) end

--设置全局触发器SPOT_LIGHT非数组变量
---@param key string # 变量名称
---@param value? py.SpotLight # 值
function GameAPI.set_trigger_variable_spot_light(key, value) end

--设置全局触发器SPOT_LIGHT非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.SpotLight # 值
function GameAPI.set_trigger_actor_variable_spot_light(actor, key, value) end

--设置全局触发器FOG数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.Fog # 值
function GameAPI.set_trigger_list_variable_fog(key, index, value) end

--设置全局触发器FOG数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.Fog # 值
function GameAPI.set_trigger_list_actor_variable_fog(actor, key, index, value) end

--设置全局触发器FOG非数组变量
---@param key string # 变量名称
---@param value? py.Fog # 值
function GameAPI.set_trigger_variable_fog(key, value) end

--设置全局触发器FOG非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.Fog # 值
function GameAPI.set_trigger_actor_variable_fog(actor, key, value) end

--设置全局触发器MODEL数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.ModelKey # 值
function GameAPI.set_trigger_list_variable_model(key, index, value) end

--设置全局触发器MODEL数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.ModelKey # 值
function GameAPI.set_trigger_list_actor_variable_model(actor, key, index, value) end

--设置全局触发器MODEL非数组变量
---@param key string # 变量名称
---@param value? py.ModelKey # 值
function GameAPI.set_trigger_variable_model(key, value) end

--设置全局触发器MODEL非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.ModelKey # 值
function GameAPI.set_trigger_actor_variable_model(actor, key, value) end

--设置全局触发器SFX_ENTITY数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.Sfx # 值
function GameAPI.set_trigger_list_variable_sfx_entity(key, index, value) end

--设置全局触发器SFX_ENTITY数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.Sfx # 值
function GameAPI.set_trigger_list_actor_variable_sfx_entity(actor, key, index, value) end

--设置全局触发器SFX_ENTITY非数组变量
---@param key string # 变量名称
---@param value? py.Sfx # 值
function GameAPI.set_trigger_variable_sfx_entity(key, value) end

--设置全局触发器SFX_ENTITY非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.Sfx # 值
function GameAPI.set_trigger_actor_variable_sfx_entity(actor, key, value) end

--设置全局触发器SFX_KEY数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.SfxKey # 值
function GameAPI.set_trigger_list_variable_sfx_key(key, index, value) end

--设置全局触发器SFX_KEY数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.SfxKey # 值
function GameAPI.set_trigger_list_actor_variable_sfx_key(actor, key, index, value) end

--设置全局触发器SFX_KEY非数组变量
---@param key string # 变量名称
---@param value? py.SfxKey # 值
function GameAPI.set_trigger_variable_sfx_key(key, value) end

--设置全局触发器SFX_KEY非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.SfxKey # 值
function GameAPI.set_trigger_actor_variable_sfx_key(actor, key, value) end

--设置全局触发器LINK_SFX_ENTITY数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.LinkSfx # 值
function GameAPI.set_trigger_list_variable_link_sfx_entity(key, index, value) end

--设置全局触发器LINK_SFX_ENTITY数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.LinkSfx # 值
function GameAPI.set_trigger_list_actor_variable_link_sfx_entity(actor, key, index, value) end

--设置全局触发器LINK_SFX_ENTITY非数组变量
---@param key string # 变量名称
---@param value? py.LinkSfx # 值
function GameAPI.set_trigger_variable_link_sfx_entity(key, value) end

--设置全局触发器LINK_SFX_ENTITY非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.LinkSfx # 值
function GameAPI.set_trigger_actor_variable_link_sfx_entity(actor, key, value) end

--设置全局触发器LINK_SFX_KEY数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.LinkSfxKey # 值
function GameAPI.set_trigger_list_variable_link_sfx_key(key, index, value) end

--设置全局触发器LINK_SFX_KEY数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.LinkSfxKey # 值
function GameAPI.set_trigger_list_actor_variable_link_sfx_key(actor, key, index, value) end

--设置全局触发器LINK_SFX_KEY非数组变量
---@param key string # 变量名称
---@param value? py.LinkSfxKey # 值
function GameAPI.set_trigger_variable_link_sfx_key(key, value) end

--设置全局触发器LINK_SFX_KEY非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.LinkSfxKey # 值
function GameAPI.set_trigger_actor_variable_link_sfx_key(actor, key, value) end

--设置全局触发器CURSOR_KEY数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.CursorKey # 值
function GameAPI.set_trigger_list_variable_cursor_key(key, index, value) end

--设置全局触发器CURSOR_KEY数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.CursorKey # 值
function GameAPI.set_trigger_list_actor_variable_cursor_key(actor, key, index, value) end

--设置全局触发器CURSOR_KEY非数组变量
---@param key string # 变量名称
---@param value? py.CursorKey # 值
function GameAPI.set_trigger_variable_cursor_key(key, value) end

--设置全局触发器CURSOR_KEY非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.CursorKey # 值
function GameAPI.set_trigger_actor_variable_cursor_key(actor, key, value) end

--设置全局触发器IMAGE_KEY数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? integer # 值
function GameAPI.set_trigger_list_variable_image_key(key, index, value) end

--设置全局触发器IMAGE_KEY数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? integer # 值
function GameAPI.set_trigger_list_actor_variable_image_key(actor, key, index, value) end

--设置全局触发器IMAGE_KEY非数组变量
---@param key string # 变量名称
---@param value? integer # 值
function GameAPI.set_trigger_variable_image_key(key, value) end

--设置全局触发器IMAGE_KEY非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? integer # 值
function GameAPI.set_trigger_actor_variable_image_key(actor, key, value) end

--设置全局触发器ANGLE数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.Fixed # 值
function GameAPI.set_trigger_list_variable_angle(key, index, value) end

--设置全局触发器ANGLE数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.Fixed # 值
function GameAPI.set_trigger_list_actor_variable_angle(actor, key, index, value) end

--设置全局触发器ANGLE非数组变量
---@param key string # 变量名称
---@param value? py.Fixed # 值
function GameAPI.set_trigger_variable_angle(key, value) end

--设置全局触发器ANGLE非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.Fixed # 值
function GameAPI.set_trigger_actor_variable_angle(actor, key, value) end

--设置全局触发器TEXTURE数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.Texture # 值
function GameAPI.set_trigger_list_variable_texture(key, index, value) end

--设置全局触发器TEXTURE数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.Texture # 值
function GameAPI.set_trigger_list_actor_variable_texture(actor, key, index, value) end

--设置全局触发器TEXTURE非数组变量
---@param key string # 变量名称
---@param value? py.Texture # 值
function GameAPI.set_trigger_variable_texture(key, value) end

--设置全局触发器TEXTURE非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.Texture # 值
function GameAPI.set_trigger_actor_variable_texture(actor, key, value) end

--设置全局触发器SEQUENCE数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.Sequence # 值
function GameAPI.set_trigger_list_variable_sequence(key, index, value) end

--设置全局触发器SEQUENCE数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.Sequence # 值
function GameAPI.set_trigger_list_actor_variable_sequence(actor, key, index, value) end

--设置全局触发器SEQUENCE非数组变量
---@param key string # 变量名称
---@param value? py.Sequence # 值
function GameAPI.set_trigger_variable_sequence(key, value) end

--设置全局触发器SEQUENCE非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.Sequence # 值
function GameAPI.set_trigger_actor_variable_sequence(actor, key, value) end

--设置全局触发器PHYSICS_OBJECT数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.PhysicsObject # 值
function GameAPI.set_trigger_list_variable_physics_object(key, index, value) end

--设置全局触发器PHYSICS_OBJECT数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.PhysicsObject # 值
function GameAPI.set_trigger_list_actor_variable_physics_object(actor, key, index, value) end

--设置全局触发器PHYSICS_OBJECT非数组变量
---@param key string # 变量名称
---@param value? py.PhysicsObject # 值
function GameAPI.set_trigger_variable_physics_object(key, value) end

--设置全局触发器PHYSICS_OBJECT非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.PhysicsObject # 值
function GameAPI.set_trigger_actor_variable_physics_object(actor, key, value) end

--设置全局触发器PHYSICS_ENTITY数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.PhysicsEntity # 值
function GameAPI.set_trigger_list_variable_physics_entity(key, index, value) end

--设置全局触发器PHYSICS_ENTITY数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.PhysicsEntity # 值
function GameAPI.set_trigger_list_actor_variable_physics_entity(actor, key, index, value) end

--设置全局触发器PHYSICS_ENTITY非数组变量
---@param key string # 变量名称
---@param value? py.PhysicsEntity # 值
function GameAPI.set_trigger_variable_physics_entity(key, value) end

--设置全局触发器PHYSICS_ENTITY非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.PhysicsEntity # 值
function GameAPI.set_trigger_actor_variable_physics_entity(actor, key, value) end

--设置全局触发器PHYSICS_OBJECT_KEY数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.PhysicsObjectKey # 值
function GameAPI.set_trigger_list_variable_physics_object_key(key, index, value) end

--设置全局触发器PHYSICS_OBJECT_KEY数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.PhysicsObjectKey # 值
function GameAPI.set_trigger_list_actor_variable_physics_object_key(actor, key, index, value) end

--设置全局触发器PHYSICS_OBJECT_KEY非数组变量
---@param key string # 变量名称
---@param value? py.PhysicsObjectKey # 值
function GameAPI.set_trigger_variable_physics_object_key(key, value) end

--设置全局触发器PHYSICS_OBJECT_KEY非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.PhysicsObjectKey # 值
function GameAPI.set_trigger_actor_variable_physics_object_key(actor, key, value) end

--设置全局触发器PHYSICS_ENTITY_KEY数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.PhysicsEntityKey # 值
function GameAPI.set_trigger_list_variable_physics_entity_key(key, index, value) end

--设置全局触发器PHYSICS_ENTITY_KEY数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.PhysicsEntityKey # 值
function GameAPI.set_trigger_list_actor_variable_physics_entity_key(actor, key, index, value) end

--设置全局触发器PHYSICS_ENTITY_KEY非数组变量
---@param key string # 变量名称
---@param value? py.PhysicsEntityKey # 值
function GameAPI.set_trigger_variable_physics_entity_key(key, value) end

--设置全局触发器PHYSICS_ENTITY_KEY非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.PhysicsEntityKey # 值
function GameAPI.set_trigger_actor_variable_physics_entity_key(actor, key, value) end

--设置全局触发器RIGID_BODY数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.RigidBody # 值
function GameAPI.set_trigger_list_variable_rigid_body(key, index, value) end

--设置全局触发器RIGID_BODY数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.RigidBody # 值
function GameAPI.set_trigger_list_actor_variable_rigid_body(actor, key, index, value) end

--设置全局触发器RIGID_BODY非数组变量
---@param key string # 变量名称
---@param value? py.RigidBody # 值
function GameAPI.set_trigger_variable_rigid_body(key, value) end

--设置全局触发器RIGID_BODY非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.RigidBody # 值
function GameAPI.set_trigger_actor_variable_rigid_body(actor, key, value) end

--设置全局触发器RIGID_BODY_GROUP数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.RigidBodyGroup # 值
function GameAPI.set_trigger_list_variable_rigid_body_group(key, index, value) end

--设置全局触发器RIGID_BODY_GROUP数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.RigidBodyGroup # 值
function GameAPI.set_trigger_list_actor_variable_rigid_body_group(actor, key, index, value) end

--设置全局触发器RIGID_BODY_GROUP非数组变量
---@param key string # 变量名称
---@param value? py.RigidBodyGroup # 值
function GameAPI.set_trigger_variable_rigid_body_group(key, value) end

--设置全局触发器RIGID_BODY_GROUP非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.RigidBodyGroup # 值
function GameAPI.set_trigger_actor_variable_rigid_body_group(actor, key, value) end

--设置全局触发器COLLIDER数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.Collider # 值
function GameAPI.set_trigger_list_variable_collider(key, index, value) end

--设置全局触发器COLLIDER数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.Collider # 值
function GameAPI.set_trigger_list_actor_variable_collider(actor, key, index, value) end

--设置全局触发器COLLIDER非数组变量
---@param key string # 变量名称
---@param value? py.Collider # 值
function GameAPI.set_trigger_variable_collider(key, value) end

--设置全局触发器COLLIDER非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.Collider # 值
function GameAPI.set_trigger_actor_variable_collider(actor, key, value) end

--设置全局触发器JOINT数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.Joint # 值
function GameAPI.set_trigger_list_variable_joint(key, index, value) end

--设置全局触发器JOINT数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.Joint # 值
function GameAPI.set_trigger_list_actor_variable_joint(actor, key, index, value) end

--设置全局触发器JOINT非数组变量
---@param key string # 变量名称
---@param value? py.Joint # 值
function GameAPI.set_trigger_variable_joint(key, value) end

--设置全局触发器JOINT非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.Joint # 值
function GameAPI.set_trigger_actor_variable_joint(actor, key, value) end

--设置全局触发器REACTION数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.Reaction # 值
function GameAPI.set_trigger_list_variable_reaction(key, index, value) end

--设置全局触发器REACTION数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.Reaction # 值
function GameAPI.set_trigger_list_actor_variable_reaction(actor, key, index, value) end

--设置全局触发器REACTION非数组变量
---@param key string # 变量名称
---@param value? py.Reaction # 值
function GameAPI.set_trigger_variable_reaction(key, value) end

--设置全局触发器REACTION非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.Reaction # 值
function GameAPI.set_trigger_actor_variable_reaction(actor, key, value) end

--设置全局触发器REACTION_GROUP数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.ReactionGroup # 值
function GameAPI.set_trigger_list_variable_reaction_group(key, index, value) end

--设置全局触发器REACTION_GROUP数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.ReactionGroup # 值
function GameAPI.set_trigger_list_actor_variable_reaction_group(actor, key, index, value) end

--设置全局触发器REACTION_GROUP非数组变量
---@param key string # 变量名称
---@param value? py.ReactionGroup # 值
function GameAPI.set_trigger_variable_reaction_group(key, value) end

--设置全局触发器REACTION_GROUP非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.ReactionGroup # 值
function GameAPI.set_trigger_actor_variable_reaction_group(actor, key, value) end

--设置全局触发器PHYSICS_FILTER数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.PhysicsFilter # 值
function GameAPI.set_trigger_list_variable_physics_filter(key, index, value) end

--设置全局触发器PHYSICS_FILTER数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.PhysicsFilter # 值
function GameAPI.set_trigger_list_actor_variable_physics_filter(actor, key, index, value) end

--设置全局触发器PHYSICS_FILTER非数组变量
---@param key string # 变量名称
---@param value? py.PhysicsFilter # 值
function GameAPI.set_trigger_variable_physics_filter(key, value) end

--设置全局触发器PHYSICS_FILTER非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.PhysicsFilter # 值
function GameAPI.set_trigger_actor_variable_physics_filter(actor, key, value) end

--设置全局触发器INT_SAVE数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? integer # 值
function GameAPI.set_trigger_list_variable_int_save(key, index, value) end

--设置全局触发器INT_SAVE数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? integer # 值
function GameAPI.set_trigger_list_actor_variable_int_save(actor, key, index, value) end

--设置全局触发器INT_SAVE非数组变量
---@param key string # 变量名称
---@param value? integer # 值
function GameAPI.set_trigger_variable_int_save(key, value) end

--设置全局触发器INT_SAVE非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? integer # 值
function GameAPI.set_trigger_actor_variable_int_save(actor, key, value) end

--设置全局触发器STR_SAVE数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? string # 值
function GameAPI.set_trigger_list_variable_str_save(key, index, value) end

--设置全局触发器STR_SAVE数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? string # 值
function GameAPI.set_trigger_list_actor_variable_str_save(actor, key, index, value) end

--设置全局触发器STR_SAVE非数组变量
---@param key string # 变量名称
---@param value? string # 值
function GameAPI.set_trigger_variable_str_save(key, value) end

--设置全局触发器STR_SAVE非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? string # 值
function GameAPI.set_trigger_actor_variable_str_save(actor, key, value) end

--设置全局触发器FLOAT_SAVE数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.Fixed # 值
function GameAPI.set_trigger_list_variable_float_save(key, index, value) end

--设置全局触发器FLOAT_SAVE数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.Fixed # 值
function GameAPI.set_trigger_list_actor_variable_float_save(actor, key, index, value) end

--设置全局触发器FLOAT_SAVE非数组变量
---@param key string # 变量名称
---@param value? py.Fixed # 值
function GameAPI.set_trigger_variable_float_save(key, value) end

--设置全局触发器FLOAT_SAVE非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.Fixed # 值
function GameAPI.set_trigger_actor_variable_float_save(actor, key, value) end

--设置全局触发器BOOL_SAVE数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? boolean # 值
function GameAPI.set_trigger_list_variable_bool_save(key, index, value) end

--设置全局触发器BOOL_SAVE数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? boolean # 值
function GameAPI.set_trigger_list_actor_variable_bool_save(actor, key, index, value) end

--设置全局触发器BOOL_SAVE非数组变量
---@param key string # 变量名称
---@param value? boolean # 值
function GameAPI.set_trigger_variable_bool_save(key, value) end

--设置全局触发器BOOL_SAVE非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? boolean # 值
function GameAPI.set_trigger_actor_variable_bool_save(actor, key, value) end

--设置全局触发器TABLE_SAVE数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.Table # 值
function GameAPI.set_trigger_list_variable_table_save(key, index, value) end

--设置全局触发器TABLE_SAVE数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.Table # 值
function GameAPI.set_trigger_list_actor_variable_table_save(actor, key, index, value) end

--设置全局触发器TABLE_SAVE非数组变量
---@param key string # 变量名称
---@param value? py.Table # 值
function GameAPI.set_trigger_variable_table_save(key, value) end

--设置全局触发器TABLE_SAVE非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.Table # 值
function GameAPI.set_trigger_actor_variable_table_save(actor, key, value) end

--设置全局触发器GLOBAL_ARCHIVE_SLOT数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? string # 值
function GameAPI.set_trigger_list_variable_global_archive_slot(key, index, value) end

--设置全局触发器GLOBAL_ARCHIVE_SLOT数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? string # 值
function GameAPI.set_trigger_list_actor_variable_global_archive_slot(actor, key, index, value) end

--设置全局触发器GLOBAL_ARCHIVE_SLOT非数组变量
---@param key string # 变量名称
---@param value? string # 值
function GameAPI.set_trigger_variable_global_archive_slot(key, value) end

--设置全局触发器GLOBAL_ARCHIVE_SLOT非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? string # 值
function GameAPI.set_trigger_actor_variable_global_archive_slot(actor, key, value) end

--设置全局触发器RANDOM_POOL_DROP数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? integer # 值
function GameAPI.set_trigger_list_variable_random_pool_drop(key, index, value) end

--设置全局触发器RANDOM_POOL_DROP数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? integer # 值
function GameAPI.set_trigger_list_actor_variable_random_pool_drop(actor, key, index, value) end

--设置全局触发器RANDOM_POOL_DROP非数组变量
---@param key string # 变量名称
---@param value? integer # 值
function GameAPI.set_trigger_variable_random_pool_drop(key, value) end

--设置全局触发器RANDOM_POOL_DROP非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? integer # 值
function GameAPI.set_trigger_actor_variable_random_pool_drop(actor, key, value) end

--设置全局触发器DYNAMIC_TRIGGER_INSTANCE数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.DynamicTriggerInstance # 值
function GameAPI.set_trigger_list_variable_dynamic_trigger_instance(key, index, value) end

--设置全局触发器DYNAMIC_TRIGGER_INSTANCE数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.DynamicTriggerInstance # 值
function GameAPI.set_trigger_list_actor_variable_dynamic_trigger_instance(actor, key, index, value) end

--设置全局触发器DYNAMIC_TRIGGER_INSTANCE非数组变量
---@param key string # 变量名称
---@param value? py.DynamicTriggerInstance # 值
function GameAPI.set_trigger_variable_dynamic_trigger_instance(key, value) end

--设置全局触发器DYNAMIC_TRIGGER_INSTANCE非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.DynamicTriggerInstance # 值
function GameAPI.set_trigger_actor_variable_dynamic_trigger_instance(actor, key, value) end

--设置全局触发器TABLE数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.Table # 值
function GameAPI.set_trigger_list_variable_table(key, index, value) end

--设置全局触发器TABLE数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.Table # 值
function GameAPI.set_trigger_list_actor_variable_table(actor, key, index, value) end

--设置全局触发器TABLE非数组变量
---@param key string # 变量名称
---@param value? py.Table # 值
function GameAPI.set_trigger_variable_table(key, value) end

--设置全局触发器TABLE非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.Table # 值
function GameAPI.set_trigger_actor_variable_table(actor, key, value) end

--设置全局触发器RANDOM_POOL数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.RandomPool # 值
function GameAPI.set_trigger_list_variable_random_pool(key, index, value) end

--设置全局触发器RANDOM_POOL数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.RandomPool # 值
function GameAPI.set_trigger_list_actor_variable_random_pool(actor, key, index, value) end

--设置全局触发器RANDOM_POOL非数组变量
---@param key string # 变量名称
---@param value? py.RandomPool # 值
function GameAPI.set_trigger_variable_random_pool(key, value) end

--设置全局触发器RANDOM_POOL非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.RandomPool # 值
function GameAPI.set_trigger_actor_variable_random_pool(actor, key, value) end

--设置全局触发器SCENE_UI数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.SceneNode # 值
function GameAPI.set_trigger_list_variable_scene_ui(key, index, value) end

--设置全局触发器SCENE_UI数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.SceneNode # 值
function GameAPI.set_trigger_list_actor_variable_scene_ui(actor, key, index, value) end

--设置全局触发器SCENE_UI非数组变量
---@param key string # 变量名称
---@param value? py.SceneNode # 值
function GameAPI.set_trigger_variable_scene_ui(key, value) end

--设置全局触发器SCENE_UI非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.SceneNode # 值
function GameAPI.set_trigger_actor_variable_scene_ui(actor, key, value) end

--设置全局触发器DAMAGE_TYPE数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? integer # 值
function GameAPI.set_trigger_list_variable_damage_type(key, index, value) end

--设置全局触发器DAMAGE_TYPE数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? integer # 值
function GameAPI.set_trigger_list_actor_variable_damage_type(actor, key, index, value) end

--设置全局触发器DAMAGE_TYPE非数组变量
---@param key string # 变量名称
---@param value? integer # 值
function GameAPI.set_trigger_variable_damage_type(key, value) end

--设置全局触发器DAMAGE_TYPE非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? integer # 值
function GameAPI.set_trigger_actor_variable_damage_type(actor, key, value) end

--设置全局触发器NEW_TIMER数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.Timer # 值
function GameAPI.set_trigger_list_variable_new_timer(key, index, value) end

--设置全局触发器NEW_TIMER数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.Timer # 值
function GameAPI.set_trigger_list_actor_variable_new_timer(actor, key, index, value) end

--设置全局触发器NEW_TIMER非数组变量
---@param key string # 变量名称
---@param value? py.Timer # 值
function GameAPI.set_trigger_variable_new_timer(key, value) end

--设置全局触发器NEW_TIMER非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.Timer # 值
function GameAPI.set_trigger_actor_variable_new_timer(actor, key, value) end

--设置全局触发器TECH_KEY数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.TechKey # 值
function GameAPI.set_trigger_list_variable_tech_key(key, index, value) end

--设置全局触发器TECH_KEY数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.TechKey # 值
function GameAPI.set_trigger_list_actor_variable_tech_key(actor, key, index, value) end

--设置全局触发器TECH_KEY非数组变量
---@param key string # 变量名称
---@param value? py.TechKey # 值
function GameAPI.set_trigger_variable_tech_key(key, value) end

--设置全局触发器TECH_KEY非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.TechKey # 值
function GameAPI.set_trigger_actor_variable_tech_key(actor, key, value) end

--设置全局触发器STORE_KEY数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.StoreKey # 值
function GameAPI.set_trigger_list_variable_store_key(key, index, value) end

--设置全局触发器STORE_KEY数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.StoreKey # 值
function GameAPI.set_trigger_list_actor_variable_store_key(actor, key, index, value) end

--设置全局触发器STORE_KEY非数组变量
---@param key string # 变量名称
---@param value? py.StoreKey # 值
function GameAPI.set_trigger_variable_store_key(key, value) end

--设置全局触发器STORE_KEY非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.StoreKey # 值
function GameAPI.set_trigger_actor_variable_store_key(actor, key, value) end

--设置全局触发器KEYBOARD_KEY数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.KeyboardKey # 值
function GameAPI.set_trigger_list_variable_keyboard_key(key, index, value) end

--设置全局触发器KEYBOARD_KEY数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.KeyboardKey # 值
function GameAPI.set_trigger_list_actor_variable_keyboard_key(actor, key, index, value) end

--设置全局触发器KEYBOARD_KEY非数组变量
---@param key string # 变量名称
---@param value? py.KeyboardKey # 值
function GameAPI.set_trigger_variable_keyboard_key(key, value) end

--设置全局触发器KEYBOARD_KEY非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.KeyboardKey # 值
function GameAPI.set_trigger_actor_variable_keyboard_key(actor, key, value) end

--设置全局触发器UNIT_TYPE数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.UnitType # 值
function GameAPI.set_trigger_list_variable_unit_type(key, index, value) end

--设置全局触发器UNIT_TYPE数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.UnitType # 值
function GameAPI.set_trigger_list_actor_variable_unit_type(actor, key, index, value) end

--设置全局触发器UNIT_TYPE非数组变量
---@param key string # 变量名称
---@param value? py.UnitType # 值
function GameAPI.set_trigger_variable_unit_type(key, value) end

--设置全局触发器UNIT_TYPE非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.UnitType # 值
function GameAPI.set_trigger_actor_variable_unit_type(actor, key, value) end

--设置全局触发器CURVED_PATH数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.CurvedPath # 值
function GameAPI.set_trigger_list_variable_curved_path(key, index, value) end

--设置全局触发器CURVED_PATH数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.CurvedPath # 值
function GameAPI.set_trigger_list_actor_variable_curved_path(actor, key, index, value) end

--设置全局触发器CURVED_PATH非数组变量
---@param key string # 变量名称
---@param value? py.CurvedPath # 值
function GameAPI.set_trigger_variable_curved_path(key, value) end

--设置全局触发器CURVED_PATH非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.CurvedPath # 值
function GameAPI.set_trigger_actor_variable_curved_path(actor, key, value) end

--设置全局触发器CURVED_PATH_3D数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.CurvedPath3D # 值
function GameAPI.set_trigger_list_variable_curved_path_3d(key, index, value) end

--设置全局触发器CURVED_PATH_3D数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.CurvedPath3D # 值
function GameAPI.set_trigger_list_actor_variable_curved_path_3d(actor, key, index, value) end

--设置全局触发器CURVED_PATH_3D非数组变量
---@param key string # 变量名称
---@param value? py.CurvedPath3D # 值
function GameAPI.set_trigger_variable_curved_path_3d(key, value) end

--设置全局触发器CURVED_PATH_3D非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.CurvedPath3D # 值
function GameAPI.set_trigger_actor_variable_curved_path_3d(actor, key, value) end

--获取数组中某项（指定类型）
---@param l py.List # 列表
---@param i integer # 下标
---@param var_type string # 类型
---@return py.Actor # 值
function GameAPI.get_list_value_by_type(l, i, var_type) end

--设置数组中某项（指定类型）
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.Actor # 值
---@param var_type string # 类型
function GameAPI.set_list_value_by_type(l, i, v, var_type) end

--获取FLOAT数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.Fixed # 值
function GameAPI.get_float_list_value(l, i) end

--设置FLOAT数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.Fixed # 值
function GameAPI.set_float_list_value(l, i, v) end

--生成n个值为v的FLOAT数组
---@param n integer # 长度
---@param v? py.Fixed # 值
---@return py.List # 列表
function GameAPI.get_float_n_list(n, v) end

--获取BOOLEAN数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return boolean # 值
function GameAPI.get_boolean_list_value(l, i) end

--设置BOOLEAN数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v boolean # 值
function GameAPI.set_boolean_list_value(l, i, v) end

--生成n个值为v的BOOLEAN数组
---@param n integer # 长度
---@param v? boolean # 值
---@return py.List # 列表
function GameAPI.get_boolean_n_list(n, v) end

--获取INTEGER数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return integer # 值
function GameAPI.get_integer_list_value(l, i) end

--设置INTEGER数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v integer # 值
function GameAPI.set_integer_list_value(l, i, v) end

--生成n个值为v的INTEGER数组
---@param n integer # 长度
---@param v? integer # 值
---@return py.List # 列表
function GameAPI.get_integer_n_list(n, v) end

--获取STRING数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return string # 值
function GameAPI.get_string_list_value(l, i) end

--设置STRING数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v string # 值
function GameAPI.set_string_list_value(l, i, v) end

--生成n个值为v的STRING数组
---@param n integer # 长度
---@param v? string # 值
---@return py.List # 列表
function GameAPI.get_string_n_list(n, v) end

--获取POINT数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.FPoint # 值
function GameAPI.get_point_list_value(l, i) end

--设置POINT数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.FPoint # 值
function GameAPI.set_point_list_value(l, i, v) end

--生成n个值为v的POINT数组
---@param n integer # 长度
---@param v? py.FPoint # 值
---@return py.List # 列表
function GameAPI.get_point_n_list(n, v) end

--获取UNIT_ENTITY数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.Unit # 值
function GameAPI.get_unit_entity_list_value(l, i) end

--设置UNIT_ENTITY数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.Unit # 值
function GameAPI.set_unit_entity_list_value(l, i, v) end

--生成n个值为v的UNIT_ENTITY数组
---@param n integer # 长度
---@param v? py.Unit # 值
---@return py.List # 列表
function GameAPI.get_unit_entity_n_list(n, v) end

--获取RECTANGLE数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.RecArea # 值
function GameAPI.get_rectangle_list_value(l, i) end

--设置RECTANGLE数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.RecArea # 值
function GameAPI.set_rectangle_list_value(l, i, v) end

--生成n个值为v的RECTANGLE数组
---@param n integer # 长度
---@param v? py.RecArea # 值
---@return py.List # 列表
function GameAPI.get_rectangle_n_list(n, v) end

--获取UNIT_TYPE数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.UnitType # 值
function GameAPI.get_unit_type_list_value(l, i) end

--设置UNIT_TYPE数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.UnitType # 值
function GameAPI.set_unit_type_list_value(l, i, v) end

--生成n个值为v的UNIT_TYPE数组
---@param n integer # 长度
---@param v? py.UnitType # 值
---@return py.List # 列表
function GameAPI.get_unit_type_n_list(n, v) end

--获取TABLE数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.Table # 值
function GameAPI.get_table_list_value(l, i) end

--设置TABLE数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.Table # 值
function GameAPI.set_table_list_value(l, i, v) end

--生成n个值为v的TABLE数组
---@param n integer # 长度
---@param v? py.Table # 值
---@return py.List # 列表
function GameAPI.get_table_n_list(n, v) end

--获取ABILITY数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.Ability # 值
function GameAPI.get_ability_list_value(l, i) end

--设置ABILITY数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.Ability # 值
function GameAPI.set_ability_list_value(l, i, v) end

--生成n个值为v的ABILITY数组
---@param n integer # 长度
---@param v? py.Ability # 值
---@return py.List # 列表
function GameAPI.get_ability_n_list(n, v) end

--获取TEAM数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.Camp # 值
function GameAPI.get_team_list_value(l, i) end

--设置TEAM数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.Camp # 值
function GameAPI.set_team_list_value(l, i, v) end

--生成n个值为v的TEAM数组
---@param n integer # 长度
---@param v? py.Camp # 值
---@return py.List # 列表
function GameAPI.get_team_n_list(n, v) end

--获取ROUND_AREA数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.CirArea # 值
function GameAPI.get_round_area_list_value(l, i) end

--设置ROUND_AREA数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.CirArea # 值
function GameAPI.set_round_area_list_value(l, i, v) end

--生成n个值为v的ROUND_AREA数组
---@param n integer # 长度
---@param v? py.CirArea # 值
---@return py.List # 列表
function GameAPI.get_round_area_n_list(n, v) end

--获取POINT_LIST数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.Road # 值
function GameAPI.get_point_list_list_value(l, i) end

--设置POINT_LIST数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.Road # 值
function GameAPI.set_point_list_list_value(l, i, v) end

--生成n个值为v的POINT_LIST数组
---@param n integer # 长度
---@param v? py.Road # 值
---@return py.List # 列表
function GameAPI.get_point_list_n_list(n, v) end

--获取PLAYER数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.Role # 值
function GameAPI.get_player_list_value(l, i) end

--设置PLAYER数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.Role # 值
function GameAPI.set_player_list_value(l, i, v) end

--生成n个值为v的PLAYER数组
---@param n integer # 长度
---@param v? py.Role # 值
---@return py.List # 列表
function GameAPI.get_player_n_list(n, v) end

--获取UNIT_GROUP数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.UnitGroup # 值
function GameAPI.get_unit_group_list_value(l, i) end

--设置UNIT_GROUP数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.UnitGroup # 值
function GameAPI.set_unit_group_list_value(l, i, v) end

--生成n个值为v的UNIT_GROUP数组
---@param n integer # 长度
---@param v? py.UnitGroup # 值
---@return py.List # 列表
function GameAPI.get_unit_group_n_list(n, v) end

--获取PLAYER_GROUP数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.RoleGroup # 值
function GameAPI.get_player_group_list_value(l, i) end

--设置PLAYER_GROUP数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.RoleGroup # 值
function GameAPI.set_player_group_list_value(l, i, v) end

--生成n个值为v的PLAYER_GROUP数组
---@param n integer # 长度
---@param v? py.RoleGroup # 值
---@return py.List # 列表
function GameAPI.get_player_group_n_list(n, v) end

--获取ITEM_ENTITY数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.Item # 值
function GameAPI.get_item_entity_list_value(l, i) end

--设置ITEM_ENTITY数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.Item # 值
function GameAPI.set_item_entity_list_value(l, i, v) end

--生成n个值为v的ITEM_ENTITY数组
---@param n integer # 长度
---@param v? py.Item # 值
---@return py.List # 列表
function GameAPI.get_item_entity_n_list(n, v) end

--获取ITEM_NAME数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.ItemKey # 值
function GameAPI.get_item_name_list_value(l, i) end

--设置ITEM_NAME数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.ItemKey # 值
function GameAPI.set_item_name_list_value(l, i, v) end

--生成n个值为v的ITEM_NAME数组
---@param n integer # 长度
---@param v? py.ItemKey # 值
---@return py.List # 列表
function GameAPI.get_item_name_n_list(n, v) end

--获取ROLE_RES_KEY数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.RoleResKey # 值
function GameAPI.get_role_res_key_list_value(l, i) end

--设置ROLE_RES_KEY数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.RoleResKey # 值
function GameAPI.set_role_res_key_list_value(l, i, v) end

--生成n个值为v的ROLE_RES_KEY数组
---@param n integer # 长度
---@param v? py.RoleResKey # 值
---@return py.List # 列表
function GameAPI.get_role_res_key_n_list(n, v) end

--获取UNIT_NAME_POOL数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.UnitKeyPool # 值
function GameAPI.get_unit_name_pool_list_value(l, i) end
