-- 此文件由 `tools/genGameAPI` 生成，请勿手动修改。
---@meta

---@class py.GameAPI
GameAPI = {}

--生成n个值为v的ROTATION数组
---@param n integer # 长度
---@param v? py.FRotation # 值
---@return py.List # 列表
function GameAPI.get_rotation_n_list(n, v) end

--获取RIGID_BODY_GROUP数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.RigidBodyGroup # 值
function GameAPI.get_rigid_body_group_list_value(l, i) end

--设置RIGID_BODY_GROUP数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.RigidBodyGroup # 值
function GameAPI.set_rigid_body_group_list_value(l, i, v) end

--生成n个值为v的RIGID_BODY_GROUP数组
---@param n integer # 长度
---@param v? py.RigidBodyGroup # 值
---@return py.List # 列表
function GameAPI.get_rigid_body_group_n_list(n, v) end

--获取REACTION数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.Reaction # 值
function GameAPI.get_reaction_list_value(l, i) end

--设置REACTION数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.Reaction # 值
function GameAPI.set_reaction_list_value(l, i, v) end

--生成n个值为v的REACTION数组
---@param n integer # 长度
---@param v? py.Reaction # 值
---@return py.List # 列表
function GameAPI.get_reaction_n_list(n, v) end

--获取REACTION_GROUP数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.ReactionGroup # 值
function GameAPI.get_reaction_group_list_value(l, i) end

--设置REACTION_GROUP数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.ReactionGroup # 值
function GameAPI.set_reaction_group_list_value(l, i, v) end

--生成n个值为v的REACTION_GROUP数组
---@param n integer # 长度
---@param v? py.ReactionGroup # 值
---@return py.List # 列表
function GameAPI.get_reaction_group_n_list(n, v) end

--获取UI_ANIM_CURVE数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return integer # 值
function GameAPI.get_ui_anim_curve_list_value(l, i) end

--设置UI_ANIM_CURVE数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v integer # 值
function GameAPI.set_ui_anim_curve_list_value(l, i, v) end

--生成n个值为v的UI_ANIM_CURVE数组
---@param n integer # 长度
---@param v? integer # 值
---@return py.List # 列表
function GameAPI.get_ui_anim_curve_n_list(n, v) end

--获取DAMAGE_ATTACK_TYPE数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return integer # 值
function GameAPI.get_damage_attack_type_list_value(l, i) end

--设置DAMAGE_ATTACK_TYPE数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v integer # 值
function GameAPI.set_damage_attack_type_list_value(l, i, v) end

--生成n个值为v的DAMAGE_ATTACK_TYPE数组
---@param n integer # 长度
---@param v? integer # 值
---@return py.List # 列表
function GameAPI.get_damage_attack_type_n_list(n, v) end

--获取DAMAGE_ARMOR_TYPE数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return integer # 值
function GameAPI.get_damage_armor_type_list_value(l, i) end

--设置DAMAGE_ARMOR_TYPE数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v integer # 值
function GameAPI.set_damage_armor_type_list_value(l, i, v) end

--生成n个值为v的DAMAGE_ARMOR_TYPE数组
---@param n integer # 长度
---@param v? integer # 值
---@return py.List # 列表
function GameAPI.get_damage_armor_type_n_list(n, v) end

--获取GAME_MODE数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.GameMode # 值
function GameAPI.get_game_mode_list_value(l, i) end

--设置GAME_MODE数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.GameMode # 值
function GameAPI.set_game_mode_list_value(l, i, v) end

--生成n个值为v的GAME_MODE数组
---@param n integer # 长度
---@param v? py.GameMode # 值
---@return py.List # 列表
function GameAPI.get_game_mode_n_list(n, v) end

--获取IMAGE_QUALITY数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return string # 值
function GameAPI.get_image_quality_list_value(l, i) end

--设置IMAGE_QUALITY数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v string # 值
function GameAPI.set_image_quality_list_value(l, i, v) end

--生成n个值为v的IMAGE_QUALITY数组
---@param n integer # 长度
---@param v? string # 值
---@return py.List # 列表
function GameAPI.get_image_quality_n_list(n, v) end

--获取WINDOW_TYPE_SETTING数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return string # 值
function GameAPI.get_window_type_setting_list_value(l, i) end

--设置WINDOW_TYPE_SETTING数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v string # 值
function GameAPI.set_window_type_setting_list_value(l, i, v) end

--生成n个值为v的WINDOW_TYPE_SETTING数组
---@param n integer # 长度
---@param v? string # 值
---@return py.List # 列表
function GameAPI.get_window_type_setting_n_list(n, v) end

--获取KEYBOARD_KEY数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.KeyboardKey # 值
function GameAPI.get_keyboard_key_list_value(l, i) end

--设置KEYBOARD_KEY数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.KeyboardKey # 值
function GameAPI.set_keyboard_key_list_value(l, i, v) end

--生成n个值为v的KEYBOARD_KEY数组
---@param n integer # 长度
---@param v? py.KeyboardKey # 值
---@return py.List # 列表
function GameAPI.get_keyboard_key_n_list(n, v) end

--获取MOUSE_KEY数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.MouseKey # 值
function GameAPI.get_mouse_key_list_value(l, i) end

--设置MOUSE_KEY数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.MouseKey # 值
function GameAPI.set_mouse_key_list_value(l, i, v) end

--生成n个值为v的MOUSE_KEY数组
---@param n integer # 长度
---@param v? py.MouseKey # 值
---@return py.List # 列表
function GameAPI.get_mouse_key_n_list(n, v) end

--获取MOUSE_WHEEL数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.MouseWheel # 值
function GameAPI.get_mouse_wheel_list_value(l, i) end

--设置MOUSE_WHEEL数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.MouseWheel # 值
function GameAPI.set_mouse_wheel_list_value(l, i, v) end

--生成n个值为v的MOUSE_WHEEL数组
---@param n integer # 长度
---@param v? py.MouseWheel # 值
---@return py.List # 列表
function GameAPI.get_mouse_wheel_n_list(n, v) end

--获取FUNC_KEYBOARD_KEY数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.FuncKeyboardKey # 值
function GameAPI.get_func_keyboard_key_list_value(l, i) end

--设置FUNC_KEYBOARD_KEY数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.FuncKeyboardKey # 值
function GameAPI.set_func_keyboard_key_list_value(l, i, v) end

--生成n个值为v的FUNC_KEYBOARD_KEY数组
---@param n integer # 长度
---@param v? py.FuncKeyboardKey # 值
---@return py.List # 列表
function GameAPI.get_func_keyboard_key_n_list(n, v) end

--获取ROLE_RELATION数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.RoleRelation # 值
function GameAPI.get_role_relation_list_value(l, i) end

--设置ROLE_RELATION数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.RoleRelation # 值
function GameAPI.set_role_relation_list_value(l, i, v) end

--生成n个值为v的ROLE_RELATION数组
---@param n integer # 长度
---@param v? py.RoleRelation # 值
---@return py.List # 列表
function GameAPI.get_role_relation_n_list(n, v) end

--获取POINT_LIGHT数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.PointLight # 值
function GameAPI.get_point_light_list_value(l, i) end

--设置POINT_LIGHT数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.PointLight # 值
function GameAPI.set_point_light_list_value(l, i, v) end

--生成n个值为v的POINT_LIGHT数组
---@param n integer # 长度
---@param v? py.PointLight # 值
---@return py.List # 列表
function GameAPI.get_point_light_n_list(n, v) end

--获取SPOT_LIGHT数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.SpotLight # 值
function GameAPI.get_spot_light_list_value(l, i) end

--设置SPOT_LIGHT数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.SpotLight # 值
function GameAPI.set_spot_light_list_value(l, i, v) end

--生成n个值为v的SPOT_LIGHT数组
---@param n integer # 长度
---@param v? py.SpotLight # 值
---@return py.List # 列表
function GameAPI.get_spot_light_n_list(n, v) end

--获取FOG数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.Fog # 值
function GameAPI.get_fog_list_value(l, i) end

--设置FOG数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.Fog # 值
function GameAPI.set_fog_list_value(l, i, v) end

--生成n个值为v的FOG数组
---@param n integer # 长度
---@param v? py.Fog # 值
---@return py.List # 列表
function GameAPI.get_fog_n_list(n, v) end

--获取UI_COMP_ATTR数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return string # 值
function GameAPI.get_ui_comp_attr_list_value(l, i) end

--设置UI_COMP_ATTR数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v string # 值
function GameAPI.set_ui_comp_attr_list_value(l, i, v) end

--生成n个值为v的UI_COMP_ATTR数组
---@param n integer # 长度
---@param v? string # 值
---@return py.List # 列表
function GameAPI.get_ui_comp_attr_n_list(n, v) end

--获取UI_PREFAB数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return string # 值
function GameAPI.get_ui_prefab_list_value(l, i) end

--设置UI_PREFAB数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v string # 值
function GameAPI.set_ui_prefab_list_value(l, i, v) end

--生成n个值为v的UI_PREFAB数组
---@param n integer # 长度
---@param v? string # 值
---@return py.List # 列表
function GameAPI.get_ui_prefab_n_list(n, v) end

--获取POST_EFFECT数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.PostEffect # 值
function GameAPI.get_post_effect_list_value(l, i) end

--设置POST_EFFECT数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.PostEffect # 值
function GameAPI.set_post_effect_list_value(l, i, v) end

--生成n个值为v的POST_EFFECT数组
---@param n integer # 长度
---@param v? py.PostEffect # 值
---@return py.List # 列表
function GameAPI.get_post_effect_n_list(n, v) end

--获取UI_PREFAB_INSTANCE数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.UIPrefabIns # 值
function GameAPI.get_ui_prefab_instance_list_value(l, i) end

--设置UI_PREFAB_INSTANCE数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.UIPrefabIns # 值
function GameAPI.set_ui_prefab_instance_list_value(l, i, v) end

--生成n个值为v的UI_PREFAB_INSTANCE数组
---@param n integer # 长度
---@param v? py.UIPrefabIns # 值
---@return py.List # 列表
function GameAPI.get_ui_prefab_instance_n_list(n, v) end

--获取UI_PREFAB_INS_UID数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return string # 值
function GameAPI.get_ui_prefab_ins_uid_list_value(l, i) end

--设置UI_PREFAB_INS_UID数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v string # 值
function GameAPI.set_ui_prefab_ins_uid_list_value(l, i, v) end

--生成n个值为v的UI_PREFAB_INS_UID数组
---@param n integer # 长度
---@param v? string # 值
---@return py.List # 列表
function GameAPI.get_ui_prefab_ins_uid_n_list(n, v) end

--获取AUDIO_CHANNEL数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return integer # 值
function GameAPI.get_audio_channel_list_value(l, i) end

--设置AUDIO_CHANNEL数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v integer # 值
function GameAPI.set_audio_channel_list_value(l, i, v) end

--生成n个值为v的AUDIO_CHANNEL数组
---@param n integer # 长度
---@param v? integer # 值
---@return py.List # 列表
function GameAPI.get_audio_channel_n_list(n, v) end

--预设库 添加BOOLEAN键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_boolean_kv(item_key, key, value) end

--预设库 添加INTEGER键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_integer_kv(item_key, key, value) end

--预设库 添加FLOAT键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_float_kv(item_key, key, value) end

--预设库 添加STRING键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_string_kv(item_key, key, value) end

--预设库 添加UI_COMP键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_ui_comp_kv(item_key, key, value) end

--预设库 添加UI_COMP_TYPE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_ui_comp_type_kv(item_key, key, value) end

--预设库 添加UI_COMP_EVENT_TYPE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_ui_comp_event_type_kv(item_key, key, value) end

--预设库 添加UI_COMP_ATTR键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_ui_comp_attr_kv(item_key, key, value) end

--预设库 添加UI_COMP_ALIGN_TYPE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_ui_comp_align_type_kv(item_key, key, value) end

--预设库 添加UI_PREFAB键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_ui_prefab_kv(item_key, key, value) end

--预设库 添加UI_PREFAB_INSTANCE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_ui_prefab_instance_kv(item_key, key, value) end

--预设库 添加UI_PREFAB_INS_UID键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_ui_prefab_ins_uid_kv(item_key, key, value) end

--预设库 添加UI_DIRECTION键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_ui_direction_kv(item_key, key, value) end

--预设库 添加UI_ANIM键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_ui_anim_kv(item_key, key, value) end

--预设库 添加UI_ANIM_CURVE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_ui_anim_curve_kv(item_key, key, value) end

--预设库 添加AUDIO_CHANNEL键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_audio_channel_kv(item_key, key, value) end

--预设库 添加UNIT_ENTITY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_unit_entity_kv(item_key, key, value) end

--预设库 添加UNIT_GROUP键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_unit_group_kv(item_key, key, value) end

--预设库 添加UNIT_NAME键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_unit_name_kv(item_key, key, value) end

--预设库 添加UNIT_NAME_POOL键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_unit_name_pool_kv(item_key, key, value) end

--预设库 添加UNIT_WRITE_ATTRIBUTE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_unit_write_attribute_kv(item_key, key, value) end

--预设库 添加ATTR_ELEMENT键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_attr_element_kv(item_key, key, value) end

--预设库 添加ATTR_ELEMENT_READ键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_attr_element_read_kv(item_key, key, value) end

--预设库 添加MOVER_ENTITY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_mover_entity_kv(item_key, key, value) end

--预设库 添加IMAGE_QUALITY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_image_quality_kv(item_key, key, value) end

--预设库 添加WINDOW_TYPE_SETTING键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_window_type_setting_kv(item_key, key, value) end

--预设库 添加ITEM_ENTITY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_item_entity_kv(item_key, key, value) end

--预设库 添加ITEM_GROUP键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_item_group_kv(item_key, key, value) end

--预设库 添加ITEM_NAME键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_item_name_kv(item_key, key, value) end

--预设库 添加ABILITY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_ability_kv(item_key, key, value) end

--预设库 添加ABILITY_TYPE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_ability_type_kv(item_key, key, value) end

--预设库 添加ABILITY_CAST_TYPE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_ability_cast_type_kv(item_key, key, value) end

--预设库 添加ABILITY_NAME键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_ability_name_kv(item_key, key, value) end

--预设库 添加SKILL_POINTER_TYPE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_skill_pointer_type_kv(item_key, key, value) end

--预设库 添加MODIFIER_ENTITY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_modifier_entity_kv(item_key, key, value) end

--预设库 添加MODIFIER_TYPE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_modifier_type_kv(item_key, key, value) end

--预设库 添加MODIFIER_EFFECT_TYPE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_modifier_effect_type_kv(item_key, key, value) end

--预设库 添加MODIFIER键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_modifier_kv(item_key, key, value) end

--预设库 添加PROJECTILE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_projectile_kv(item_key, key, value) end

--预设库 添加PROJECTILE_3D键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_projectile_3d_kv(item_key, key, value) end

--预设库 添加PROJECTILE_ENTITY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_projectile_entity_kv(item_key, key, value) end

--预设库 添加PROJECTILE_GROUP键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_projectile_group_kv(item_key, key, value) end

--预设库 添加DESTRUCTIBLE_ENTITY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_destructible_entity_kv(item_key, key, value) end

--预设库 添加DESTRUCTIBLE_NAME键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_destructible_name_kv(item_key, key, value) end

--预设库 添加SOUND_ENTITY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_sound_entity_kv(item_key, key, value) end

--预设库 添加AUDIO_KEY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_audio_key_kv(item_key, key, value) end

--预设库 添加GAME_MODE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_game_mode_kv(item_key, key, value) end

--预设库 添加PLAYER键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_player_kv(item_key, key, value) end

--预设库 添加PLAYER_GROUP键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_player_group_kv(item_key, key, value) end

--预设库 添加ROLE_RES_KEY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_role_res_key_kv(item_key, key, value) end

--预设库 添加ROLE_STATUS键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_role_status_kv(item_key, key, value) end

--预设库 添加ROLE_TYPE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_role_type_kv(item_key, key, value) end

--预设库 添加ROLE_RELATION键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_role_relation_kv(item_key, key, value) end

--预设库 添加TEAM键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_team_kv(item_key, key, value) end

--预设库 添加POINT键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_point_kv(item_key, key, value) end

--预设库 添加VECTOR3键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_vector3_kv(item_key, key, value) end

--预设库 添加ROTATION键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_rotation_kv(item_key, key, value) end

--预设库 添加POINT_LIST键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_point_list_kv(item_key, key, value) end

--预设库 添加RECTANGLE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_rectangle_kv(item_key, key, value) end

--预设库 添加ROUND_AREA键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_round_area_kv(item_key, key, value) end

--预设库 添加POLYGON键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_polygon_kv(item_key, key, value) end

--预设库 添加CAMERA键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_camera_kv(item_key, key, value) end

--预设库 添加CAMLINE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_camline_kv(item_key, key, value) end

--预设库 添加POINT_LIGHT键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_point_light_kv(item_key, key, value) end

--预设库 添加SPOT_LIGHT键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_spot_light_kv(item_key, key, value) end

--预设库 添加FOG键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_fog_kv(item_key, key, value) end

--预设库 添加SCENE_SOUND键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_scene_sound_kv(item_key, key, value) end

--预设库 添加MODEL键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_model_kv(item_key, key, value) end

--预设库 添加SFX_ENTITY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_sfx_entity_kv(item_key, key, value) end

--预设库 添加SFX_KEY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_sfx_key_kv(item_key, key, value) end

--预设库 添加LINK_SFX_ENTITY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_link_sfx_entity_kv(item_key, key, value) end

--预设库 添加LINK_SFX_KEY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_link_sfx_key_kv(item_key, key, value) end

--预设库 添加CURSOR_KEY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_cursor_key_kv(item_key, key, value) end

--预设库 添加ANGLE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_angle_kv(item_key, key, value) end

--预设库 添加TEXTURE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_texture_kv(item_key, key, value) end

--预设库 添加SEQUENCE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_sequence_kv(item_key, key, value) end

--预设库 添加PHYSICS_OBJECT键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_physics_object_kv(item_key, key, value) end

--预设库 添加PHYSICS_ENTITY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_physics_entity_kv(item_key, key, value) end

--预设库 添加PHYSICS_OBJECT_KEY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_physics_object_key_kv(item_key, key, value) end

--预设库 添加PHYSICS_ENTITY_KEY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_physics_entity_key_kv(item_key, key, value) end

--预设库 添加RIGID_BODY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_rigid_body_kv(item_key, key, value) end

--预设库 添加RIGID_BODY_GROUP键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_rigid_body_group_kv(item_key, key, value) end

--预设库 添加COLLIDER键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_collider_kv(item_key, key, value) end

--预设库 添加JOINT键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_joint_kv(item_key, key, value) end

--预设库 添加REACTION键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_reaction_kv(item_key, key, value) end

--预设库 添加REACTION_GROUP键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_reaction_group_kv(item_key, key, value) end

--预设库 添加DYNAMIC_TRIGGER_INSTANCE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_dynamic_trigger_instance_kv(item_key, key, value) end

--预设库 添加TABLE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_table_kv(item_key, key, value) end

--预设库 添加RANDOM_POOL键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_random_pool_kv(item_key, key, value) end

--预设库 添加SCENE_UI键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_scene_ui_kv(item_key, key, value) end

--预设库 添加DAMAGE_TYPE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_damage_type_kv(item_key, key, value) end

--预设库 添加HARM_TEXT_TYPE_NEW键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_harm_text_type_new_kv(item_key, key, value) end

--预设库 添加NEW_TIMER键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_new_timer_kv(item_key, key, value) end

--预设库 添加TECH_KEY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_tech_key_kv(item_key, key, value) end

--预设库 添加STORE_KEY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_store_key_kv(item_key, key, value) end

--预设库 添加KEYBOARD_KEY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_keyboard_key_kv(item_key, key, value) end

--预设库 添加FUNC_KEYBOARD_KEY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_func_keyboard_key_kv(item_key, key, value) end

--预设库 添加MOUSE_KEY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_mouse_key_kv(item_key, key, value) end

--预设库 添加MOUSE_WHEEL键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_mouse_wheel_kv(item_key, key, value) end

--预设库 添加POST_EFFECT键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_post_effect_kv(item_key, key, value) end

--预设库 添加UNIT_TYPE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_unit_type_kv(item_key, key, value) end

--预设库 添加UNIT_COMMAND_TYPE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_unit_command_type_kv(item_key, key, value) end

--预设库 添加MINI_MAP_COLOR_TYPE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_mini_map_color_type_kv(item_key, key, value) end

--预设库 添加UNIT_BEHAVIOR键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_unit_behavior_kv(item_key, key, value) end

--预设库 添加CURVED_PATH键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_curved_path_kv(item_key, key, value) end

--预设库 添加BOOLEAN键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_boolean_kv(item_key, key, value) end

--预设库 添加INTEGER键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_integer_kv(item_key, key, value) end

--预设库 添加FLOAT键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_float_kv(item_key, key, value) end

--预设库 添加STRING键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_string_kv(item_key, key, value) end

--预设库 添加UI_COMP键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_ui_comp_kv(item_key, key, value) end

--预设库 添加UI_COMP_TYPE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_ui_comp_type_kv(item_key, key, value) end

--预设库 添加UI_COMP_EVENT_TYPE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_ui_comp_event_type_kv(item_key, key, value) end

--预设库 添加UI_COMP_ATTR键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_ui_comp_attr_kv(item_key, key, value) end

--预设库 添加UI_COMP_ALIGN_TYPE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_ui_comp_align_type_kv(item_key, key, value) end

--预设库 添加UI_PREFAB键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_ui_prefab_kv(item_key, key, value) end

--预设库 添加UI_PREFAB_INSTANCE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_ui_prefab_instance_kv(item_key, key, value) end

--预设库 添加UI_PREFAB_INS_UID键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_ui_prefab_ins_uid_kv(item_key, key, value) end

--预设库 添加UI_DIRECTION键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_ui_direction_kv(item_key, key, value) end

--预设库 添加UI_ANIM键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_ui_anim_kv(item_key, key, value) end

--预设库 添加UI_ANIM_CURVE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_ui_anim_curve_kv(item_key, key, value) end

--预设库 添加AUDIO_CHANNEL键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_audio_channel_kv(item_key, key, value) end

--预设库 添加UNIT_ENTITY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_unit_entity_kv(item_key, key, value) end

--预设库 添加UNIT_GROUP键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_unit_group_kv(item_key, key, value) end

--预设库 添加UNIT_NAME键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_unit_name_kv(item_key, key, value) end

--预设库 添加UNIT_NAME_POOL键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_unit_name_pool_kv(item_key, key, value) end

--预设库 添加UNIT_WRITE_ATTRIBUTE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_unit_write_attribute_kv(item_key, key, value) end

--预设库 添加ATTR_ELEMENT键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_attr_element_kv(item_key, key, value) end

--预设库 添加ATTR_ELEMENT_READ键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_attr_element_read_kv(item_key, key, value) end

--预设库 添加MOVER_ENTITY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_mover_entity_kv(item_key, key, value) end

--预设库 添加IMAGE_QUALITY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_image_quality_kv(item_key, key, value) end

--预设库 添加WINDOW_TYPE_SETTING键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_window_type_setting_kv(item_key, key, value) end

--预设库 添加ITEM_ENTITY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_item_entity_kv(item_key, key, value) end

--预设库 添加ITEM_GROUP键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_item_group_kv(item_key, key, value) end

--预设库 添加ITEM_NAME键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_item_name_kv(item_key, key, value) end

--预设库 添加ABILITY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_ability_kv(item_key, key, value) end

--预设库 添加ABILITY_TYPE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_ability_type_kv(item_key, key, value) end

--预设库 添加ABILITY_CAST_TYPE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_ability_cast_type_kv(item_key, key, value) end

--预设库 添加ABILITY_NAME键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_ability_name_kv(item_key, key, value) end

--预设库 添加SKILL_POINTER_TYPE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_skill_pointer_type_kv(item_key, key, value) end

--预设库 添加MODIFIER_ENTITY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_modifier_entity_kv(item_key, key, value) end

--预设库 添加MODIFIER_TYPE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_modifier_type_kv(item_key, key, value) end

--预设库 添加MODIFIER_EFFECT_TYPE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_modifier_effect_type_kv(item_key, key, value) end

--预设库 添加MODIFIER键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_modifier_kv(item_key, key, value) end

--预设库 添加PROJECTILE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_projectile_kv(item_key, key, value) end

--预设库 添加PROJECTILE_3D键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_projectile_3d_kv(item_key, key, value) end

--预设库 添加PROJECTILE_ENTITY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_projectile_entity_kv(item_key, key, value) end

--预设库 添加PROJECTILE_GROUP键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_projectile_group_kv(item_key, key, value) end

--预设库 添加DESTRUCTIBLE_ENTITY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_destructible_entity_kv(item_key, key, value) end

--预设库 添加DESTRUCTIBLE_NAME键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_destructible_name_kv(item_key, key, value) end

--预设库 添加SOUND_ENTITY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_sound_entity_kv(item_key, key, value) end

--预设库 添加AUDIO_KEY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_audio_key_kv(item_key, key, value) end

--预设库 添加GAME_MODE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_game_mode_kv(item_key, key, value) end

--预设库 添加PLAYER键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_player_kv(item_key, key, value) end

--预设库 添加PLAYER_GROUP键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_player_group_kv(item_key, key, value) end

--预设库 添加ROLE_RES_KEY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_role_res_key_kv(item_key, key, value) end

--预设库 添加ROLE_STATUS键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_role_status_kv(item_key, key, value) end

--预设库 添加ROLE_TYPE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_role_type_kv(item_key, key, value) end

--预设库 添加ROLE_RELATION键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_role_relation_kv(item_key, key, value) end

--预设库 添加TEAM键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_team_kv(item_key, key, value) end

--预设库 添加POINT键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_point_kv(item_key, key, value) end

--预设库 添加VECTOR3键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_vector3_kv(item_key, key, value) end

--预设库 添加ROTATION键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_rotation_kv(item_key, key, value) end

--预设库 添加POINT_LIST键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_point_list_kv(item_key, key, value) end

--预设库 添加RECTANGLE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_rectangle_kv(item_key, key, value) end

--预设库 添加ROUND_AREA键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_round_area_kv(item_key, key, value) end

--预设库 添加POLYGON键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_polygon_kv(item_key, key, value) end

--预设库 添加CAMERA键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_camera_kv(item_key, key, value) end

--预设库 添加CAMLINE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_camline_kv(item_key, key, value) end

--预设库 添加POINT_LIGHT键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_point_light_kv(item_key, key, value) end

--预设库 添加SPOT_LIGHT键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_spot_light_kv(item_key, key, value) end

--预设库 添加FOG键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_fog_kv(item_key, key, value) end

--预设库 添加SCENE_SOUND键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_scene_sound_kv(item_key, key, value) end

--预设库 添加MODEL键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_model_kv(item_key, key, value) end

--预设库 添加SFX_ENTITY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_sfx_entity_kv(item_key, key, value) end

--预设库 添加SFX_KEY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_sfx_key_kv(item_key, key, value) end

--预设库 添加LINK_SFX_ENTITY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_link_sfx_entity_kv(item_key, key, value) end

--预设库 添加LINK_SFX_KEY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_link_sfx_key_kv(item_key, key, value) end

--预设库 添加CURSOR_KEY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_cursor_key_kv(item_key, key, value) end

--预设库 添加ANGLE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_angle_kv(item_key, key, value) end

--预设库 添加TEXTURE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_texture_kv(item_key, key, value) end

--预设库 添加SEQUENCE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_sequence_kv(item_key, key, value) end

--预设库 添加PHYSICS_OBJECT键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_physics_object_kv(item_key, key, value) end

--预设库 添加PHYSICS_ENTITY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_physics_entity_kv(item_key, key, value) end

--预设库 添加PHYSICS_OBJECT_KEY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_physics_object_key_kv(item_key, key, value) end

--预设库 添加PHYSICS_ENTITY_KEY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_physics_entity_key_kv(item_key, key, value) end

--预设库 添加RIGID_BODY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_rigid_body_kv(item_key, key, value) end

--预设库 添加RIGID_BODY_GROUP键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_rigid_body_group_kv(item_key, key, value) end

--预设库 添加COLLIDER键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_collider_kv(item_key, key, value) end

--预设库 添加JOINT键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_joint_kv(item_key, key, value) end

--预设库 添加REACTION键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_reaction_kv(item_key, key, value) end

--预设库 添加REACTION_GROUP键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_reaction_group_kv(item_key, key, value) end

--预设库 添加DYNAMIC_TRIGGER_INSTANCE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_dynamic_trigger_instance_kv(item_key, key, value) end

--预设库 添加TABLE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_table_kv(item_key, key, value) end

--预设库 添加RANDOM_POOL键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_random_pool_kv(item_key, key, value) end

--预设库 添加SCENE_UI键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_scene_ui_kv(item_key, key, value) end

--预设库 添加DAMAGE_TYPE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_damage_type_kv(item_key, key, value) end

--预设库 添加HARM_TEXT_TYPE_NEW键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_harm_text_type_new_kv(item_key, key, value) end

--预设库 添加NEW_TIMER键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_new_timer_kv(item_key, key, value) end

--预设库 添加TECH_KEY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_tech_key_kv(item_key, key, value) end

--预设库 添加STORE_KEY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_store_key_kv(item_key, key, value) end

--预设库 添加KEYBOARD_KEY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_keyboard_key_kv(item_key, key, value) end

--预设库 添加FUNC_KEYBOARD_KEY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_func_keyboard_key_kv(item_key, key, value) end

--预设库 添加MOUSE_KEY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_mouse_key_kv(item_key, key, value) end

--预设库 添加MOUSE_WHEEL键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_mouse_wheel_kv(item_key, key, value) end

--预设库 添加POST_EFFECT键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_post_effect_kv(item_key, key, value) end

--预设库 添加UNIT_TYPE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_unit_type_kv(item_key, key, value) end

--预设库 添加UNIT_COMMAND_TYPE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_unit_command_type_kv(item_key, key, value) end

--预设库 添加MINI_MAP_COLOR_TYPE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_mini_map_color_type_kv(item_key, key, value) end

--预设库 添加UNIT_BEHAVIOR键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_unit_behavior_kv(item_key, key, value) end

--预设库 添加CURVED_PATH键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_curved_path_kv(item_key, key, value) end

--预设库 添加BOOLEAN键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_boolean_kv(item_key, key, value) end

--预设库 添加INTEGER键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_integer_kv(item_key, key, value) end

--预设库 添加FLOAT键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_float_kv(item_key, key, value) end

--预设库 添加STRING键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_string_kv(item_key, key, value) end

--预设库 添加UI_COMP键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_ui_comp_kv(item_key, key, value) end

--预设库 添加UI_COMP_TYPE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_ui_comp_type_kv(item_key, key, value) end

--预设库 添加UI_COMP_EVENT_TYPE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_ui_comp_event_type_kv(item_key, key, value) end

--预设库 添加UI_COMP_ATTR键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_ui_comp_attr_kv(item_key, key, value) end

--预设库 添加UI_COMP_ALIGN_TYPE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_ui_comp_align_type_kv(item_key, key, value) end

--预设库 添加UI_PREFAB键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_ui_prefab_kv(item_key, key, value) end

--预设库 添加UI_PREFAB_INSTANCE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_ui_prefab_instance_kv(item_key, key, value) end

--预设库 添加UI_PREFAB_INS_UID键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_ui_prefab_ins_uid_kv(item_key, key, value) end

--预设库 添加UI_DIRECTION键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_ui_direction_kv(item_key, key, value) end

--预设库 添加UI_ANIM键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_ui_anim_kv(item_key, key, value) end

--预设库 添加UI_ANIM_CURVE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_ui_anim_curve_kv(item_key, key, value) end

--预设库 添加AUDIO_CHANNEL键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_audio_channel_kv(item_key, key, value) end

--预设库 添加UNIT_ENTITY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_unit_entity_kv(item_key, key, value) end

--预设库 添加UNIT_GROUP键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_unit_group_kv(item_key, key, value) end

--预设库 添加UNIT_NAME键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_unit_name_kv(item_key, key, value) end

--预设库 添加UNIT_NAME_POOL键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_unit_name_pool_kv(item_key, key, value) end

--预设库 添加UNIT_WRITE_ATTRIBUTE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_unit_write_attribute_kv(item_key, key, value) end

--预设库 添加ATTR_ELEMENT键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_attr_element_kv(item_key, key, value) end

--预设库 添加ATTR_ELEMENT_READ键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_attr_element_read_kv(item_key, key, value) end

--预设库 添加MOVER_ENTITY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_mover_entity_kv(item_key, key, value) end

--预设库 添加IMAGE_QUALITY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_image_quality_kv(item_key, key, value) end

--预设库 添加WINDOW_TYPE_SETTING键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_window_type_setting_kv(item_key, key, value) end

--预设库 添加ITEM_ENTITY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_item_entity_kv(item_key, key, value) end

--预设库 添加ITEM_GROUP键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_item_group_kv(item_key, key, value) end

--预设库 添加ITEM_NAME键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_item_name_kv(item_key, key, value) end

--预设库 添加ABILITY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_ability_kv(item_key, key, value) end

--预设库 添加ABILITY_TYPE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_ability_type_kv(item_key, key, value) end

--预设库 添加ABILITY_CAST_TYPE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_ability_cast_type_kv(item_key, key, value) end

--预设库 添加ABILITY_NAME键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_ability_name_kv(item_key, key, value) end

--预设库 添加SKILL_POINTER_TYPE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_skill_pointer_type_kv(item_key, key, value) end

--预设库 添加MODIFIER_ENTITY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_modifier_entity_kv(item_key, key, value) end

--预设库 添加MODIFIER_TYPE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_modifier_type_kv(item_key, key, value) end

--预设库 添加MODIFIER_EFFECT_TYPE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_modifier_effect_type_kv(item_key, key, value) end

--预设库 添加MODIFIER键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_modifier_kv(item_key, key, value) end

--预设库 添加PROJECTILE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_projectile_kv(item_key, key, value) end

--预设库 添加PROJECTILE_3D键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_projectile_3d_kv(item_key, key, value) end

--预设库 添加PROJECTILE_ENTITY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_projectile_entity_kv(item_key, key, value) end

--预设库 添加PROJECTILE_GROUP键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_projectile_group_kv(item_key, key, value) end

--预设库 添加DESTRUCTIBLE_ENTITY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_destructible_entity_kv(item_key, key, value) end

--预设库 添加DESTRUCTIBLE_NAME键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_destructible_name_kv(item_key, key, value) end

--预设库 添加SOUND_ENTITY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_sound_entity_kv(item_key, key, value) end

--预设库 添加AUDIO_KEY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_audio_key_kv(item_key, key, value) end

--预设库 添加GAME_MODE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_game_mode_kv(item_key, key, value) end

--预设库 添加PLAYER键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_player_kv(item_key, key, value) end

--预设库 添加PLAYER_GROUP键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_player_group_kv(item_key, key, value) end

--预设库 添加ROLE_RES_KEY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_role_res_key_kv(item_key, key, value) end

--预设库 添加ROLE_STATUS键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_role_status_kv(item_key, key, value) end

--预设库 添加ROLE_TYPE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_role_type_kv(item_key, key, value) end

--预设库 添加ROLE_RELATION键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_role_relation_kv(item_key, key, value) end

--预设库 添加TEAM键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_team_kv(item_key, key, value) end

--预设库 添加POINT键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_point_kv(item_key, key, value) end

--预设库 添加VECTOR3键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_vector3_kv(item_key, key, value) end

--预设库 添加ROTATION键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_rotation_kv(item_key, key, value) end

--预设库 添加POINT_LIST键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_point_list_kv(item_key, key, value) end

--预设库 添加RECTANGLE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_rectangle_kv(item_key, key, value) end

--预设库 添加ROUND_AREA键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_round_area_kv(item_key, key, value) end

--预设库 添加POLYGON键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_polygon_kv(item_key, key, value) end

--预设库 添加CAMERA键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_camera_kv(item_key, key, value) end

--预设库 添加CAMLINE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_camline_kv(item_key, key, value) end

--预设库 添加POINT_LIGHT键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_point_light_kv(item_key, key, value) end

--预设库 添加SPOT_LIGHT键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_spot_light_kv(item_key, key, value) end

--预设库 添加FOG键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_fog_kv(item_key, key, value) end

--预设库 添加SCENE_SOUND键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_scene_sound_kv(item_key, key, value) end

--预设库 添加MODEL键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_model_kv(item_key, key, value) end

--预设库 添加SFX_ENTITY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_sfx_entity_kv(item_key, key, value) end

--预设库 添加SFX_KEY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_sfx_key_kv(item_key, key, value) end

--预设库 添加LINK_SFX_ENTITY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_link_sfx_entity_kv(item_key, key, value) end

--预设库 添加LINK_SFX_KEY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_link_sfx_key_kv(item_key, key, value) end

--预设库 添加CURSOR_KEY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_cursor_key_kv(item_key, key, value) end

--预设库 添加ANGLE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_angle_kv(item_key, key, value) end

--预设库 添加TEXTURE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_texture_kv(item_key, key, value) end

--预设库 添加SEQUENCE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_sequence_kv(item_key, key, value) end

--预设库 添加PHYSICS_OBJECT键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_physics_object_kv(item_key, key, value) end

--预设库 添加PHYSICS_ENTITY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_physics_entity_kv(item_key, key, value) end

--预设库 添加PHYSICS_OBJECT_KEY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_physics_object_key_kv(item_key, key, value) end

--预设库 添加PHYSICS_ENTITY_KEY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_physics_entity_key_kv(item_key, key, value) end

--预设库 添加RIGID_BODY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_rigid_body_kv(item_key, key, value) end

--预设库 添加RIGID_BODY_GROUP键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_rigid_body_group_kv(item_key, key, value) end

--预设库 添加COLLIDER键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_collider_kv(item_key, key, value) end

--预设库 添加JOINT键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_joint_kv(item_key, key, value) end

--预设库 添加REACTION键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_reaction_kv(item_key, key, value) end

--预设库 添加REACTION_GROUP键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_reaction_group_kv(item_key, key, value) end

--预设库 添加DYNAMIC_TRIGGER_INSTANCE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_dynamic_trigger_instance_kv(item_key, key, value) end

--预设库 添加TABLE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_table_kv(item_key, key, value) end

--预设库 添加RANDOM_POOL键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_random_pool_kv(item_key, key, value) end

--预设库 添加SCENE_UI键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_scene_ui_kv(item_key, key, value) end

--预设库 添加DAMAGE_TYPE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_damage_type_kv(item_key, key, value) end

--预设库 添加HARM_TEXT_TYPE_NEW键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_harm_text_type_new_kv(item_key, key, value) end

--预设库 添加NEW_TIMER键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_new_timer_kv(item_key, key, value) end

--预设库 添加TECH_KEY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_tech_key_kv(item_key, key, value) end

--预设库 添加STORE_KEY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_store_key_kv(item_key, key, value) end

--预设库 添加KEYBOARD_KEY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_keyboard_key_kv(item_key, key, value) end

--预设库 添加FUNC_KEYBOARD_KEY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_func_keyboard_key_kv(item_key, key, value) end

--预设库 添加MOUSE_KEY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_mouse_key_kv(item_key, key, value) end

--预设库 添加MOUSE_WHEEL键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_mouse_wheel_kv(item_key, key, value) end

--预设库 添加POST_EFFECT键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_post_effect_kv(item_key, key, value) end

--预设库 添加UNIT_TYPE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_unit_type_kv(item_key, key, value) end

--预设库 添加UNIT_COMMAND_TYPE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_unit_command_type_kv(item_key, key, value) end

--预设库 添加MINI_MAP_COLOR_TYPE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_mini_map_color_type_kv(item_key, key, value) end

--预设库 添加UNIT_BEHAVIOR键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_unit_behavior_kv(item_key, key, value) end

--预设库 添加CURVED_PATH键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_curved_path_kv(item_key, key, value) end

--判断BUFF是否是目标BUFFID的实例
---@param modifier1 py.ModifierEntity # BUFF实例
---@param modifier_key py.ModifierKey # BUFFID
---@return boolean # 是否是目标buff的实例
function GameAPI.is_modifier_id(modifier1, modifier_key) end

--判断BUFF是否是目标BUFF实例
---@param modifier1 py.ModifierEntity # BUFF实例
---@param modifier2 py.ModifierEntity # BUFF实例
---@return boolean # 是否是目标实例
function GameAPI.is_modifier_instance(modifier1, modifier2) end

--判断BUFF是否是为目标类型的buff(正面负面等)
---@param modifier1 py.ModifierEntity # BUFF实例
---@param modifier_type py.ModifierEffectType # BUFF效果类型
---@return boolean # 是否是目标效果类型
function GameAPI.judge_modifier_effect_type(modifier1, modifier_type) end

--获取目标效果(BUFF)的效果类型
---@param modifier1 py.ModifierEntity # BUFF实例
---@return py.ModifierKey # 效果编号
function GameAPI.get_type_of_modifier_entity(modifier1) end

--转换目标数字ID到效果类型
---@param modifier_key integer # 数字编号
---@return py.ModifierKey # 效果编号
function GameAPI.transfer_num_into_modifier_key(modifier_key) end

--获取魔法效果类型的名称
---@param modifier_key py.ModifierKey # 魔法效果编号
---@return string # 名称
function GameAPI.api_get_name_of_modifier_key(modifier_key) end

--创建新魔法效果物编
---@param old_entity_no py.ModifierKey # 魔法效果物编
---@return py.ModifierKey # 魔法效果物编
function GameAPI.create_modifier_editor_data(old_entity_no) end

--最近合成物品的单位
---@return py.Unit # 单位实体
function GameAPI.get_last_compose_unit() end

--最近添加物品
---@return py.Item # 物品实体
function GameAPI.get_last_add_item() end

--最近移除物品
---@return py.Item # 物品实体
function GameAPI.get_last_remove_item() end

--最近使用物品
---@return py.Item # 物品实体
function GameAPI.get_last_use_item() end

--最近堆叠变化物品
---@return py.Item # 物品实体
function GameAPI.get_last_stack_changed_item() end

--最近充能变化物品
---@return py.Item # 物品实体
function GameAPI.get_last_charge_changed_item() end

--最近添加物品单位
---@return py.Unit # 单位实体
function GameAPI.get_last_add_item_unit() end

--最近移除物品单位
---@return py.Unit # 单位实体
function GameAPI.get_last_remove_item_unit() end

--最近使用物品单位
---@return py.Unit # 单位实体
function GameAPI.get_last_use_item_unit() end

--最近物品层数变化单位
---@return py.Unit # 单位实体
function GameAPI.get_last_change_item_stack_unit() end

--获取物品类型附加属性
---@param item_key py.ItemKey # 物品类型编号
---@param attr_element_field string # 属性名
---@param attr_key string # 属性成分名
function GameAPI.api_get_attr_of_item_key(item_key, attr_element_field, attr_key) end

--获取物品类型的模型
---@param item_key py.ItemKey # 物品类型编号
---@return py.ModelKey # 模型编号
function GameAPI.api_get_item_type_model(item_key) end

--遍历物品类型合成所需的物品类型数量
---@param item_key py.ItemKey # 物品类型编号
---@param comp_item_key py.ItemKey # 物品类型编号
---@return integer # 个数
function GameAPI.api_get_value_of_item_name_comp_mat(item_key, comp_item_key) end

--遍历物品类型合成所需的玩家属性数量
---@param item_key py.ItemKey # 物品类型编号
---@param role_res_key py.RoleResKey # 玩家属性
---@return number # 取值
function GameAPI.api_get_value_of_item_name_comp_res(item_key, role_res_key) end

--创建新物品物编
---@param old_entity_no py.ItemKey # 物品物编
---@return py.ItemKey # 物品物编
function GameAPI.create_item_editor_data(old_entity_no) end

--最近被购买物品
---@return py.Item # 物品实体
function GameAPI.get_last_buy_shop_item() end

--最近被出售物品
---@return py.Item # 物品实体
function GameAPI.get_last_sell_shop_item() end

--最近购买者
---@return py.Unit # 单位实体
function GameAPI.get_last_buyer_unit() end

--最近出售者
---@return py.Unit # 单位实体
function GameAPI.get_last_seller_unit() end

--最近被购买单位
---@return py.Unit # 单位实体
function GameAPI.get_last_buy_shop_unit() end

--最近升级科技
---@return py.TechKey # 科技编号
function GameAPI.get_last_upgraded_tech() end

--最近升降科技
---@return py.TechKey # 科技编号
function GameAPI.get_last_operated_tech() end

--最近变化科技
---@return py.TechKey # 科技编号
function GameAPI.get_last_changed_tech() end

--最近变化科技等级
---@return integer # 科技变化等级
function GameAPI.get_last_changed_tech_level() end

--最近获得科技
---@return py.TechKey # 科技编号
function GameAPI.get_last_added_tech() end

--最近失去科技
---@return py.TechKey # 科技编号
function GameAPI.get_last_removed_tech() end

--最近研究科技单位
---@return py.Unit # 研究科技单位
function GameAPI.get_last_upgrade_tech_unit() end

--最近获得科技单位
---@return py.Unit # 获得科技单位
function GameAPI.get_last_add_tech_unit() end

--最近失去科技单位
---@return py.Unit # 失去科技单位
function GameAPI.get_last_remove_tech_unit() end

--获取科技对应等级名字
---@param tech_no py.TechKey # 科技编号
---@param level integer # 等级
---@return string # 名字
function GameAPI.get_tech_name(tech_no, level) end

--获取科技对应等级icon
---@param tech_no py.TechKey # 科技编号
---@param level integer # 等级
---@return integer # 图片id
function GameAPI.get_tech_icon(tech_no, level) end

--获取科技对应等级的花费
---@param tech_no py.TechKey # 科技编号
---@param level integer # 等级
---@return integer # 图片id
function GameAPI.get_tech_cost(tech_no, level) end

--获取科技最大等级
---@param tech_no py.TechKey # 科技编号
---@return integer # 科技最大等级
function GameAPI.get_tech_max_level(tech_no) end

--创建新科技物编
---@param old_entity_no py.TechKey # 科技物编
---@return py.TechKey # 科技物编
function GameAPI.create_technology_editor_data(old_entity_no) end

--最近成功使用收费道具玩家
---@return py.Role # 玩家
function GameAPI.get_last_use_store_item_role() end

--调用函数
---@param func_id string # 函数
---@param actor py.Actor # 调用者
---@param context py.Dict # 参数和上下文
---@return py.DynamicTypeMeta # 返回值
function GameAPI.call_function(func_id, actor, context) end

--设置函数返回值
function GameAPI.set_function_return() end

--发送自定义事件
---@param event_id integer # 事件ID
---@param params_dict py.Dict # 参数字典
function GameAPI.send_event_custom(event_id, params_dict) end

--生成字典
---@param ori_dict py.Dict # 字典
---@param key string # 参数key
---@param param string # 参数value
---@return py.Dict # 字典返回值
function GameAPI.gen_param_dict(ori_dict, key, param) end

--获取字典中的值
---@param params_dict py.Dict # 字典
---@param key string # 参数key
---@return py.DynamicTypeMeta # 字典中的值
function GameAPI.get_custom_param(params_dict, key) end

--获取函数返回值
---@param func_id string # 函数ID
---@param actor py.Actor # 调用者
---@param context py.Dict # 上下文
---@param params_expr py.List # 参数列表
---@param call_rt_idx integer # 返回值Index
---@return py.DynamicTypeMeta # 某一返回值
function GameAPI.get_function_return_value(func_id, actor, context, params_expr, call_rt_idx) end

--删除单位运动器
---@param unit py.Unit # 单位
function GameAPI.remove_unit_mover(unit) end

--打断单位运动器
---@param unit py.Unit # 单位
function GameAPI.break_unit_mover(unit) end

--运动器碰撞单位
---@return py.Unit # 单位实体
function GameAPI.get_mover_collide_unit() end

--创建追踪运动器
---@param unit py.Unit # 单位
---@param target_unit py.Unit # 目标单位
---@param stop_distance_to_target number # 停止距离
---@param init_velocity number # 初始速度
---@param acceleration number # 加速度
---@param max_velocity? number # 最大速度
---@param min_velocity? number # 最小速度
---@param init_height? number # 起始高度
---@param parabola_height? number # 抛物线高度
---@param bind_point? string # 附着点
---@param collision_type? integer # 碰撞类型
---@param collision_radius? number # 碰撞范围
---@param is_face_angle? boolean # 是否始终面向运动方向
---@param is_multi_collision? boolean # 是否能多次碰撞同一个物体
---@param terrain_block? boolean # 地形阻挡
---@param priority? integer # 优先级数
---@param is_absolute_height? boolean # 使用绝对高度
---@param f_mover_finish? function # 运动完成事件
---@param f_mover_interrupt? function # 运动打断事件
---@param f_mover_removed? function # 运动移除事件
---@param f_terrain_collide? function # 地形碰撞事件
---@param f_unit_collide? function # 单位碰撞事件
---@return py.Mover # 运动器ID
function GameAPI.create_chasing_mover(unit, target_unit, stop_distance_to_target, init_velocity, acceleration, max_velocity, min_velocity, init_height, parabola_height, bind_point, collision_type, collision_radius, is_face_angle, is_multi_collision, terrain_block, priority, is_absolute_height, f_mover_finish, f_mover_interrupt, f_mover_removed, f_terrain_collide, f_unit_collide) end

--创建直线运动器
---@param unit py.Unit # 单位
---@param angle number # 运动方向
---@param max_dist number # 最大距离
---@param init_velocity number # 初始速度
---@param acceleration number # 加速度
---@param max_velocity? number # 最大速度
---@param min_velocity? number # 最小速度
---@param init_height? number # 起始高度
---@param fin_height? number # 终点高度
---@param parabola_height? number # 抛物线高度
---@param collision_type? integer # 碰撞类型
---@param collision_radius? number # 碰撞范围
---@param is_face_angle? boolean # 是否始终面向运动方向
---@param is_multi_collision? boolean # 是否能多次碰撞同一个物体
---@param terrain_block? boolean # 地形阻挡
---@param priority? integer # 优先级数
---@param is_absolute_height? boolean # 使用绝对高度
---@param f_mover_finish? function # 运动完成事件
---@param f_mover_interrupt? function # 运动打断事件
---@param f_mover_removed? function # 运动移除事件
---@param f_terrain_collide? function # 地形碰撞事件
---@param f_unit_collide? function # 单位碰撞事件
---@return py.Mover # 运动器ID
function GameAPI.create_straight_mover(unit, angle, max_dist, init_velocity, acceleration, max_velocity, min_velocity, init_height, fin_height, parabola_height, collision_type, collision_radius, is_face_angle, is_multi_collision, terrain_block, priority, is_absolute_height, f_mover_finish, f_mover_interrupt, f_mover_removed, f_terrain_collide, f_unit_collide) end

--创建环绕运动器
---@param unit py.Unit # 单位
---@param target_unit py.Unit # 目标单位
---@param circle_radius number # 圆周半径
---@param angle_velocity number # 角速度
---@param init_angle? number # 初始角度
---@param counterclockwise? number # 方向
---@param round_time? number # 环绕时间
---@param centrifugal_velocity? number # 离心速度
---@param lifting_velocity? number # 提升速度
---@param init_height? number # 环绕高度
---@param collision_type? integer # 碰撞类型
---@param collision_radius? number # 碰撞范围
---@param is_face_angle? boolean # 是否始终面向运动方向
---@param is_multi_collision? boolean # 是否能多次碰撞同一个物体
---@param terrain_block? boolean # 地形阻挡
---@param priority? integer # 优先级数
---@param is_absolute_height? boolean # 使用绝对高度
---@param target_pos? py.Vector3 # 目标坐标
---@param f_mover_finish? function # 运动完成事件
---@param f_mover_interrupt? function # 运动打断事件
---@param f_mover_removed? function # 运动移除事件
---@param f_terrain_collide? function # 地形碰撞事件
---@param f_unit_collide? function # 单位碰撞事件
---@return py.Mover # 运动器ID
function GameAPI.create_round_mover(unit, target_unit, circle_radius, angle_velocity, init_angle, counterclockwise, round_time, centrifugal_velocity, lifting_velocity, init_height, collision_type, collision_radius, is_face_angle, is_multi_collision, terrain_block, priority, is_absolute_height, target_pos, f_mover_finish, f_mover_interrupt, f_mover_removed, f_terrain_collide, f_unit_collide) end

--创建曲线运动器
---@param unit py.Unit # 单位
---@param angle number # 运动方向
---@param max_dist number # 最大距离
---@param init_velocity number # 初始速度
---@param acceleration number # 加速度
---@param max_velocity? number # 最大速度
---@param min_velocity? number # 最小速度
---@param init_height? number # 起始高度
---@param fin_height? number # 终点高度
---@param collision_type? integer # 碰撞类型
---@param collision_radius? number # 碰撞范围
---@param is_face_angle? boolean # 是否始终面向运动方向
---@param is_multi_collision? boolean # 是否能多次碰撞同一个物体
---@param terrain_block? boolean # 地形阻挡
---@param priority? integer # 优先级数
---@param is_absolute_height? boolean # 使用绝对高度
---@param path? py.CurvedPath # 路径
---@param f_mover_finish? function # 运动完成事件
---@param f_mover_interrupt? function # 运动打断事件
---@param f_mover_removed? function # 运动移除事件
---@param f_terrain_collide? function # 地形碰撞事件
---@param f_unit_collide? function # 单位碰撞事件
---@return py.Mover # 运动器ID
function GameAPI.create_curved_mover(unit, angle, max_dist, init_velocity, acceleration, max_velocity, min_velocity, init_height, fin_height, collision_type, collision_radius, is_face_angle, is_multi_collision, terrain_block, priority, is_absolute_height, path, f_mover_finish, f_mover_interrupt, f_mover_removed, f_terrain_collide, f_unit_collide) end

--获得运动器类型
---@param mover_id py.Mover # 运动器
---@return integer # 运动器类型
function GameAPI.get_mover_type(mover_id) end

--删除运动器
---@param mover_id py.Mover # 运动器
function GameAPI.remove_mover(mover_id) end

--打断运动器
---@param mover_id py.Mover # 运动器
function GameAPI.break_mover(mover_id) end

--获得单位的运动器
---@param unit py.Unit # 单位
---@return py.Mover # 运动器
function GameAPI.get_unit_mover(unit) end

--获取运动器的优先级
---@param mover_id py.Mover # 运动器
---@return integer # 优先级
function GameAPI.get_mover_priority(mover_id) end

--设置运动器的优先级
---@param mover_id py.Mover # 运动器
---@param priority integer # 优先级
function GameAPI.set_mover_priority(mover_id, priority) end

--设置运动器的属性
---@param mover_id py.Mover # 运动器
---@param key integer # 属性名
---@param value py.Fixed # 属性值
function GameAPI.set_mover_property(mover_id, key, value) end

--获取运动器的属性
---@param mover_id py.Mover # 运动器
---@param key integer # 属性名
---@return py.Fixed # 属性值
function GameAPI.get_mover_property(mover_id, key) end

--获得运动器的运动方向
---@param mover_id py.Mover # 运动器
---@return py.Fixed # 角度
function GameAPI.get_mover_angle(mover_id) end

--设置运动器的运动方向
---@param mover_id py.Mover # 运动器
---@param angle py.Fixed # 方向
function GameAPI.set_mover_angle(mover_id, angle) end

--设置运动器的碰撞范围
---@param mover_id py.Mover # 运动器
---@param radius py.Fixed # 碰撞范围
function GameAPI.set_mover_collision_radius(mover_id, radius) end

--获得运动器的碰撞范围
---@param mover_id py.Mover # 运动器
---@return py.Fixed # 碰撞范围
function GameAPI.get_mover_collision_radius(mover_id) end

--设置运动器的关联单位
---@param mover_id py.Mover # 运动器
---@param unit py.Unit # 关联单位
function GameAPI.set_mover_relate_unit(mover_id, unit) end

--获得运动器的关联单位
---@param mover_id py.Mover # 运动器
---@return py.Unit # 关联单位
function GameAPI.get_mover_relate_unit(mover_id) end

--设置运动器的关联技能
---@param mover_id py.Mover # 运动器
---@param ability py.Ability # 关联技能
function GameAPI.set_mover_relate_ability(mover_id, ability) end

--获得运动器的关联技能
---@param mover_id py.Mover # 运动器
---@return py.Ability # 关联技能
function GameAPI.get_mover_relate_ability(mover_id) end

--移动
---@param pos py.FVector3 # 位置
---@param nav_range? py.Fixed # 寻路范围
---@return py.UnitCommand # 单位命令
function GameAPI.create_unit_command_move_to_pos(pos, nav_range) end

--停止
---@return py.UnitCommand # 单位命令
function GameAPI.create_unit_command_stop() end

--空状态
---@return py.UnitCommand # 单位命令
function GameAPI.create_unit_command_empty() end

--驻守
---@param pos py.FVector3 # 位置
---@return py.UnitCommand # 单位命令
function GameAPI.create_unit_command_hold(pos) end

--攻击移动
---@param pos py.FVector3 # 位置
---@param nav_range? py.Fixed # 寻路范围
---@return py.UnitCommand # 单位命令
function GameAPI.create_unit_command_attack_move(pos, nav_range) end

--攻击
---@param target py.Actor # 目标
---@param nav_range? py.Fixed # 寻路范围
---@return py.UnitCommand # 单位命令
function GameAPI.create_unit_command_attack_target(target, nav_range) end

--沿路径移动
---@param road py.Road # 路径
---@param patrol_mode integer # 移动方式
---@param can_attack boolean # 是否主动攻击
---@param start_from_nearest? boolean # 是否就近开始
---@param back_to_nearest? boolean # 是否就近返回
---@return py.UnitCommand # 单位命令
function GameAPI.create_unit_command_move_along_road(road, patrol_mode, can_attack, start_from_nearest, back_to_nearest) end

--释放技能
---@param ability py.Ability # 技能
---@param tar_point_1? py.Point # 释放点1
---@param tar_point_2? py.Point # 释放点2
---@param tar_unit? py.Unit # 释放目标单位
---@param tar_item? py.Item # 释放目标物品
---@param tar_dest? py.Destructible # 目标可破坏物
---@return py.UnitCommand # 单位命令
function GameAPI.create_unit_command_use_skill(ability, tar_point_1, tar_point_2, tar_unit, tar_item, tar_dest) end

--使用物品
---@param item py.Item # 物品
---@param tar_point_1? py.Point # 释放点1
---@param tar_point_2? py.Point # 释放点2
---@param tar_unit? py.Unit # 目标单位
---@param tar_item? py.Item # 目标物品
---@param tar_dest? py.Destructible # 目标可破坏物
---@return py.UnitCommand # 单位命令
function GameAPI.create_unit_command_use_item(item, tar_point_1, tar_point_2, tar_unit, tar_item, tar_dest) end

--拾取物品
---@param item py.Item # 物品
---@return py.UnitCommand # 单位命令
function GameAPI.create_unit_command_pick_item(item) end

--丢弃物品
---@param item py.Item # 物品
---@param pos py.FVector3 # 位置
---@return py.UnitCommand # 单位命令
function GameAPI.create_unit_command_drop_item(item, pos) end

--转移物品
---@param item py.Item # 物品
---@param target py.Unit # 对象
---@return py.UnitCommand # 单位命令
function GameAPI.create_unit_command_transfer_item(item, target) end

--跟随
---@param target py.Unit # 目标
---@return py.UnitCommand # 单位命令
function GameAPI.create_unit_command_follow(target) end

--特效播放开关
---@param role py.Role # 玩家
---@param switch boolean # 开关
function GameAPI.set_player_sfx_switch(role, switch) end

--在某点播放特效
---@param point py.FVector3 # 点
---@param sfx py.SfxKey # 特效编号
---@param scale py.Fixed # 缩放
---@param duratime py.Fixed # 持续时间
---@param offset py.Fixed # 竖直方向偏移
---@param role? py.Role # 玩家
---@param visible_type? integer # 显示类型（1：全体，2：自己 3：仅自己和友方 4：非自己和友方
---@param rotation? py.Fixed # 初始旋转角度
---@return py.Sfx # 特效
function GameAPI.play_sfx_on_point(point, sfx, scale, duratime, offset, role, visible_type, rotation) end

--创建单位到点闪电特效
---@param sfx_res_id py.SfxKey # 特效编号
---@param source_unit py.Unit # 起点单位
---@param source_socket string # 起点单位挂接点名称
---@param target_point py.FVector3 # 终点
---@param target_height py.Fixed # 终点高度
---@param duration? number # 持续时间
---@param immediately? boolean # 是否立即删除
---@param use_sys_d_destroy_way? boolean # 特效删除的方式是否读表
---@return py.LinkSfx # 特效
function GameAPI.create_link_sfx_from_unit_to_point(sfx_res_id, source_unit, source_socket, target_point, target_height, duration, immediately, use_sys_d_destroy_way) end

--创建单位到单位闪电特效
---@param sfx_res_id py.SfxKey # 特效编号
---@param source_unit py.Unit # 起点单位
---@param source_socket string # 起点单位挂接点名称
---@param target_unit py.Unit # 终点单位
---@param target_socket string # 起点单位挂接点名称
---@param duration? number # 持续时间
---@param immediately? boolean # 是否立即删除
---@param use_sys_d_destroy_way? boolean # 特效删除的方式是否读表
---@return py.LinkSfx # 特效
function GameAPI.create_link_sfx_from_unit_to_unit(sfx_res_id, source_unit, source_socket, target_unit, target_socket, duration, immediately, use_sys_d_destroy_way) end

--创建点到单位闪电特效
---@param sfx_res_id py.SfxKey # 特效编号
---@param source_point py.FVector3 # 起点
---@param source_height py.Fixed # 起点高度
---@param source_unit py.Unit # 终点单位
---@param source_socket string # 起点单位挂接点名称
---@param duration? number # 持续时间
---@param immediately? boolean # 是否立即删除
---@param use_sys_d_destroy_way? boolean # 特效删除的方式是否读表
---@return py.LinkSfx # 特效
function GameAPI.create_link_sfx_from_point_to_unit(sfx_res_id, source_point, source_height, source_unit, source_socket, duration, immediately, use_sys_d_destroy_way) end

--创建点到点闪电特效
---@param sfx_res_id py.SfxKey # 特效编号
---@param source_point py.FVector3 # 起点
---@param source_height py.Fixed # 起点高度
---@param target_point py.FVector3 # 终点
---@param target_height py.Fixed # 终点高度
---@param duration? number # 持续时间
---@param immediately? boolean # 是否立即删除
---@param use_sys_d_destroy_way? boolean # 特效删除的方式是否读表
---@return py.LinkSfx # 特效
function GameAPI.create_link_sfx_from_point_to_point(sfx_res_id, source_point, source_height, target_point, target_height, duration, immediately, use_sys_d_destroy_way) end

--设置闪电特效的位置点
---@param sfx_entity py.LinkSfx # 特效
---@param source_or_target py.LinkSfxPointType # 起点/终点
---@param point py.Point # 点
---@param height number # 高度
function GameAPI.set_link_sfx_point(sfx_entity, source_or_target, point, height) end

--设置闪电特效单位附加点
---@param sfx_entity py.LinkSfx # 特效
---@param source_or_target py.LinkSfxPointType # 起点/终点
---@param unit py.Unit # 单位
---@param socket string # 单位挂接点
function GameAPI.set_link_sfx_unit_socket(sfx_entity, source_or_target, unit, socket) end

--移除特效
---@param sfx_entity py.LinkSfx # 特效
---@param immediately? boolean # 立即移除表现
---@param use_sys_d_destroy_way? boolean # 特效删除的方式是否读表
function GameAPI.remove_link_sfx(sfx_entity, immediately, use_sys_d_destroy_way) end

--设置特效是否显示
---@param sfx_entity py.LinkSfx # 特效
---@param b_show boolean # 是否显示
function GameAPI.enable_link_sfx_show(sfx_entity, b_show) end

--创建特效到点
---@param sfx_id py.SfxKey # 特效编号
---@param point py.Point # 点
---@param face_angle number # 面向角度
---@param scale number # 缩放比例
---@param height number # 高度
---@param duration number # 持续时间
---@param immediately? boolean # 是否立即删除
---@param use_sys_d_destroy_way? boolean # 特效删除的方式是否读表
---@return py.Sfx # 特效
function GameAPI.create_sfx_on_point(sfx_id, point, face_angle, scale, height, duration, immediately, use_sys_d_destroy_way) end

--创建特效到单位附加点
---@param sfx_id py.SfxKey # 特效编号
---@param unit py.Unit # 单位
---@param socket string # 单位挂接点
---@param b_follow_rotate boolean # 是否跟随单位旋转
---@param b_follow_scale boolean # 是否跟随单位缩放
---@param scale? number # 缩放比例
---@param duration? number # 持续时间
---@param angle? number # 角度
---@param immediately? boolean # 是否立即删除
---@param use_sys_d_destroy_way? boolean # 特效删除的方式是否读表
---@return py.Sfx # 特效
function GameAPI.create_sfx_on_unit(sfx_id, unit, socket, b_follow_rotate, b_follow_scale, scale, duration, angle, immediately, use_sys_d_destroy_way) end

--创建特效到单位附加点（跟随旋转使用枚举）
---@param sfx_id py.SfxKey # 特效编号
---@param unit py.Unit # 单位
---@param socket string # 单位挂接点
---@param rotate_type integer # 跟随旋转方式
---@param b_follow_scale boolean # 是否跟随单位缩放
---@param scale? number # 缩放比例
---@param duration? number # 持续时间
---@param angle? number # 角度
---@param immediately? boolean # 是否立即删除
---@param use_sys_d_destroy_way? boolean # 特效删除的方式是否读表
---@return py.Sfx # 特效
function GameAPI.create_sfx_on_unit_new(sfx_id, unit, socket, rotate_type, b_follow_scale, scale, duration, angle, immediately, use_sys_d_destroy_way) end

--删除特效
---@param sfx_entity? py.Sfx # 特效
---@param immediately? boolean # 立即移除表现
---@param use_sys_d? boolean # 删除时是否读取系统默认特效
function GameAPI.delete_sfx(sfx_entity, immediately, use_sys_d) end

--设置特效旋转
---@param sfx_entity py.Sfx # 特效
---@param rotate_x number # x轴旋转
---@param rotate_y number # y轴旋转
---@param rotate_z number # z轴旋转
function GameAPI.set_sfx_rotate(sfx_entity, rotate_x, rotate_y, rotate_z) end

--设置特效朝向
---@param sfx_entity py.Sfx # 特效
---@param face_angle number # 朝向
function GameAPI.set_sfx_angle(sfx_entity, face_angle) end

--设置特效颜色
---@param sfx_entity py.Sfx # 特效
---@param x number # x
---@param y number # y
---@param z number # z
---@param w number # w
function GameAPI.set_sfx_color(sfx_entity, x, y, z, w) end

--设置特效缩放
---@param sfx_entity py.Sfx # 特效
---@param scale_x number # x轴缩放
---@param scale_y number # y轴缩放
---@param scale_z number # z轴缩放
function GameAPI.set_sfx_scale(sfx_entity, scale_x, scale_y, scale_z) end

--设置特效高度
---@param sfx_entity py.Sfx # 特效
---@param height number # 高度
function GameAPI.set_sfx_height(sfx_entity, height) end

--设置特效到点
---@param sfx_entity py.Sfx # 特效
---@param point py.Point # 点
---@param fluent_move? boolean # 平滑移动
function GameAPI.set_sfx_position(sfx_entity, point, fluent_move) end

--设置特效动画速度
---@param sfx_entity py.Sfx # 特效
---@param speed number # 动画速度
function GameAPI.set_sfx_animation_speed(sfx_entity, speed) end

--设置特效持续时间
---@param sfx_entity py.Sfx # 特效
---@param duration number # 持续时间
function GameAPI.set_sfx_duration(sfx_entity, duration) end

--播放屏幕特效
---@param sfx_key py.SfxKey # 特效编号
---@param keep_time number # 持续时间
---@param role? py.Role # 玩家
---@param render_after_post? boolean # 是否后处理之后渲染
function GameAPI.add_sfx_to_camera(sfx_key, keep_time, role, render_after_post) end

--播放屏幕特效并返回特效实体
---@param sfx_key py.SfxKey # 特效编号
---@param keep_time number # 持续时间
---@param role? py.Role # 玩家
---@param render_after_post? boolean # 是否后处理之后渲染
---@param immediately? boolean # 是否立即删除
---@param use_sys_d_destroy_way? boolean # 特效删除的方式是否读表
---@return py.Sfx # 特效
function GameAPI.add_sfx_to_camera_with_return(sfx_key, keep_time, role, render_after_post, immediately, use_sys_d_destroy_way) end

--震动屏幕
---@param role py.Role # 玩家
---@param period number # 震动周期
---@param amplitude_vector py.FVector3 # 振幅大小
---@param increase_vector py.FVector3 # 增幅值
---@param keep_time number # 震动持续时间
function GameAPI.start_shake(role, period, amplitude_vector, increase_vector, keep_time) end

--链接特效路径转字符串
---@param val py.SfxKey # 特效编号
---@return string # 字符串
function GameAPI.link_sfx_key_to_str(val) end

--字符串转链接特效路径
---@param val string # 字符串
---@return py.SfxKey # 特效编号
function GameAPI.str_to_link_sfx_key(val) end

--特效转字符串
---@param obj py.Sfx # 特效
---@return string # 字符串
function GameAPI.sfx_to_str(obj) end

--粒子特效路径转字符串
---@param val py.SfxKey # 特效编号
---@return string # 字符串
function GameAPI.particle_sfx_key_to_str(val) end

--字符串转粒子特效路径
---@param val string # 特效编号
---@return py.SfxKey # 特效编号
function GameAPI.str_to_particle_sfx_key(val) end

--链接特效转字符串
---@param obj py.LinkSfx # 链接特效
---@return string # 字符串
function GameAPI.link_sfx_to_str(obj) end

--get_table
---@param table_name string # table_name
---@return py.Table # table
function GameAPI.get_table(table_name) end

--set_table_value
---@param table py.Table # table
---@param value py.Actor # value
---@param key1 string # key1
---@param key2 string # key2
---@param key3 string # key3
---@param key4 string # key4
---@param key5 string # key5
---@param value_convert_func string # value_convert_func
function GameAPI.set_table_value(table, value, key1, key2, key3, key4, key5, value_convert_func) end

--table_has_key
---@param table py.Table # table
---@param key string # key
---@return boolean # bool
function GameAPI.table_has_key(table, key) end

--get_table_var
---@param table py.Table # table
---@param key1 string # key1
---@param key2 string # key2
---@param key3 string # key3
---@param key4 string # key4
---@param key5 string # key5
---@param default_value py.Actor # default
---@param value_convert_func string # value_convert_func
---@param extra_info? py.Dict # extra_info(for debug)
---@return py.Actor # value
function GameAPI.get_table_var(table, key1, key2, key3, key4, key5, default_value, value_convert_func, extra_info) end

--remove_table_value
---@param table py.Table # table
---@param key1 string # key1
---@param key2 string # key2
---@param key3 string # key3
---@param key4 string # key4
---@param key5 string # key5
function GameAPI.remove_table_value(table, key1, key2, key3, key4, key5) end

--remove_table_value_n
---@param table py.Table # table
---@param n integer # N
function GameAPI.remove_table_value_n(table, n) end

--insert_table_value
---@param table py.Table # table
---@param value py.Actor # value
---@param value_convert_func string # value_convert_func
---@param pos integer # pos
function GameAPI.insert_table_value(table, value, value_convert_func, pos) end

--get_new_table
---@return py.Table # table
function GameAPI.get_new_table() end

--clear_table
---@param table py.Table # table
function GameAPI.clear_table(table) end

--encrypt_table
---@param table py.Table # table
function GameAPI.encrypt_table(table) end

--get_copy_of_table
---@param table py.Table # table
---@return py.Table # table
function GameAPI.get_copy_of_table(table) end

--dump_table
---@param table py.Table # table
function GameAPI.dump_table(table) end

--get_table_length
---@param table py.Table # table
---@return integer # length
function GameAPI.get_table_length(table) end

--get_iter_table_value_by_type
---@param item py.List # table iter item
---@param default_value py.Actor # default
---@param value_convert_func string # value_convert_func
---@return py.Actor # value
function GameAPI.get_iter_table_value(item, default_value, value_convert_func) end

--table迭代器
---@param t py.Table # TAB
---@return py.Iterator # Python迭代器
function GameAPI.table_iterator(t) end

--table迭代器（保序）
---@param t py.Table # TAB
---@return py.Iterator # Python迭代器
function GameAPI.ordered_table_iterator(t) end

--serialize_to_string
---@param table py.Table # table
---@return string # value
function GameAPI.serialize_to_string(table) end

--unserialize_by_string
---@param lua string # lua
---@return py.Table # table
function GameAPI.unserialize_by_string(lua) end

--sort_table_by
---@param table py.Table # table
---@param key string # key
---@param order py.TableOrder # order
---@param save_as? py.Table # save_as
function GameAPI.sort_table_by(table, key, order, save_as) end

--调试-Dialog窗口输出帧计时器信息
---@param show_tasks boolean # 显示任务
function GameAPI.dbg_dialog_print_frame_timer_info(show_tasks) end

--获取最近创建的计时器
---@return py.Timer # 计时器
function GameAPI.get_last_created_timer() end

--开启计时器
---@param name string # 计时器名称
---@param once boolean # 是否单次
---@param interval py.Fixed # 时间
---@param context py.Dict # 上下文
function GameAPI.start_timer(name, once, interval, context) end

--关闭计时器
---@param name string # 计时器名称
function GameAPI.stop_timer(name) end

--开启计时器（新）
---@param time_delay py.Fixed # 延迟时间
---@param repeat_count integer # 循环次数
---@param run_at_start boolean # 启动时立即运行
---@param timer_callback function # 回调函数
---@param context py.Dict # 上下文
---@return py.Timer # 计时器编号
function GameAPI.run_lua_timer(time_delay, repeat_count, run_at_start, timer_callback, context) end

--计时器是否正在运行
---@param timer_id py.Timer # 计时器编号
---@return boolean # 是否合法
function GameAPI.is_timer_valid(timer_id) end

--删除计时器
---@param timer_id py.Timer # 计时器编号
function GameAPI.delete_timer(timer_id) end

--暂停计时器
---@param timer_id py.Timer # 计时器编号
function GameAPI.pause_timer(timer_id) end

--恢复计时器
---@param timer_id py.Timer # 计时器编号
function GameAPI.resume_timer(timer_id) end

--获取计时器设置的时间
---@param timer_id py.Timer # 计时器
---@return number # 时间
function GameAPI.get_timer_time_out_time(timer_id) end

--获取计时器经过的时间
---@param timer_id py.Timer # 计时器
---@return number # 时间
function GameAPI.get_timer_elapsed_time(timer_id) end

--获取计时器剩余时间
---@param timer_id py.Timer # 计时器
---@return number # 时间
function GameAPI.get_timer_remaining_time(timer_id) end

--获取计时器初始计数
---@param timer_id py.Timer # 计时器
---@return integer # 次数
function GameAPI.get_timer_init_count(timer_id) end

--获取计时器剩余计数
---@param timer_id py.Timer # 计时器
---@return integer # 次数
function GameAPI.get_timer_remaining_count(timer_id) end

--获取独立计时器当前计时秒数
---@param name string # 倒计时名称
---@return py.Fixed # 计时秒数
function GameAPI.get_actor_timer_run_time(name) end

--获取当前到期的计时器
---@param timer_id py.Timer # 计时器
---@return py.Timer # 计时器
function GameAPI.get_current_expired_timer(timer_id) end

--计时器是否存在
---@param timer_id py.Timer # 计时器编号
---@return boolean # 是否合法
function GameAPI.timer_is_exist(timer_id) end

--添加定时回调
---@param interval py.Fixed # 间隔时间
---@param is_repeat boolean # 是否重复
---@param func function # 回调
---@param desc? string # 描述
---@return integer # timer_id
function GameAPI.add_timer(interval, is_repeat, func, desc) end

--取消定时回调
---@param timer_id integer # timer_id
function GameAPI.cancel_timer(timer_id) end

--游戏当前昼夜时间
---@return number # 时间
function GameAPI.get_cur_day_and_night_time() end

--设置昼夜游戏时间
---@param time number # 时间（0-24）
function GameAPI.set_day_and_night_time(time) end

--设置昼夜游戏时间的流逝速度（倍数）
---@param time_multiple number # 倍数，非负数
function GameAPI.set_day_and_night_time_speed(time_multiple) end

--设置昼夜游戏时间的流逝速度（百分比）
---@param time_per number # 百分比，非负数
function GameAPI.set_day_and_night_time_speed_per(time_per) end

--打开/关闭时间流逝
---@param flag boolean # 布尔值
function GameAPI.open_or_close_time_speed(flag) end

--创建人造时间，并持续一段时间
---@param create_time number # 创建的时间
---@param time_delay number # 持续的时间
function GameAPI.create_day_and_night_human_time(create_time, time_delay) end

--获取当前游戏模式
---@return py.GameMode # 游戏模式
function GameAPI.get_game_mode() end

--暂停游戏
function GameAPI.pause_game() end

--为玩家结束游戏
---@param role py.Role # 玩家
---@param result string # 战斗结果
---@param show boolean # 显示结束面板
---@param send? boolean # 是否上传玩家排行榜分数
---@param score? integer # 排行榜分数
---@param accumulate? boolean # 是否累积计算分数
function GameAPI.set_melee_result_by_role(role, result, show, send, score, accumulate) end

--上传玩家排行榜分数
---@param role py.Role # 玩家
---@param score integer # 排行榜分数
---@param accumulate? boolean # 是否累积计算分数
function GameAPI.upload_role_billboard_score(role, score, accumulate) end

--结束游戏
---@param player_results? py.Dict # 玩家结算信息
function GameAPI.game_end(player_results) end

--申请开始下一轮
---@param fast_restart? boolean # 是否快速重置
function GameAPI.request_new_round(fast_restart) end

--切换至关卡
---@param level_id integer # 关卡ID
function GameAPI.request_switch_level(level_id) end

--获取当前地图的指定key的存档值
---@param key string # 指定的全局存档key值
---@return integer # 全局存档值
function GameAPI.get_global_map_archive(key) end

--获取地图全局指定key存档的第n名玩家的昵称
---@param rank_key string # key值
---@param num integer # 第n名
---@return string # 昵称
function GameAPI.get_rank_player_nickname(rank_key, num) end

--获取地图全局指定key存档的第n名玩家的存档值
---@param rank_key string # key值
---@param num integer # 第n名
---@return integer # 存档值
function GameAPI.get_rank_player_global_archive_value(rank_key, num) end

--获取玩家指定的个人存档栏位的第n名玩家的昵称
---@param archive_key integer # 玩家存档栏位
---@param num integer # 第n名
---@return string # 昵称
function GameAPI.get_archive_rank_player_nickname(archive_key, num) end

--获取玩家指定的个人存档栏位的第n名玩家的存档值
---@param archive_key integer # 玩家存档栏位
---@param num integer # 第n名
---@return integer # 存档值
function GameAPI.get_archive_rank_player_archive_value(archive_key, num) end

--调整逻辑帧率
---@param fps integer # 目标帧率
function GameAPI.api_change_logic_fps(fps) end

--开启软暂停
function GameAPI.api_soft_pause_game() end

--关闭软暂停
function GameAPI.api_soft_resume_game() end

--本地玩家编号
---@return py.RoleID # 玩家编号
function GameAPI.get_owner_role_id() end

--本地玩家鼠标位置
---@return py.Point # 鼠标位置
function GameAPI.get_local_player_pointing_pos() end

--本地玩家鼠标屏幕位置X
---@return integer # 鼠标屏幕位置X
function GameAPI.get_local_player_ui_pos_x() end

--本地玩家鼠标屏幕位置Y
---@return integer # 鼠标屏幕位置Y
function GameAPI.get_local_player_ui_pos_y() end

--本地玩家鼠标屏幕位置X的窗口占比
---@return number # 占比值
function GameAPI.get_local_role_ui_x_per() end

--本地玩家鼠标屏幕位置y的窗口占比
---@return number # 占比值
function GameAPI.get_local_role_ui_y_per() end

--本地玩家摄像机朝向
---@return py.Point # 摄像机朝向
function GameAPI.get_local_player_camera_direction() end

--本地玩家摄像机中心射线检测
---@return py.Point # 交点
function GameAPI.get_local_player_camera_center_raycast() end

--获取游戏开始时间戳
---@return integer # 游戏开始时间戳
function GameAPI.get_game_init_time_stamp() end

--获取本地时间戳
---@return integer # 本地时间戳
function GameAPI.get_local_time_stamp() end

--添加本地计时器
---@param delay number # 延迟
---@param callback function # 回调
---@return integer # 计时器编号
function GameAPI.add_local_timer(delay, callback) end

--添加本地循环计时器
---@param interval number # 间隔
---@param callback function # 回调
---@return integer # 计时器编号
function GameAPI.add_local_repeat_timer(interval, callback) end

--取消本地计时器
---@param timer_id integer # 计时器编号
function GameAPI.cancel_local_timer(timer_id) end

--强制开启/关闭鼠标同步
---@param enable boolean # 开关
function GameAPI.force_enable_mouse_sync(enable) end

--强制开启/关闭按键同步
---@param enable boolean # 开关
function GameAPI.force_enable_keyboard_sync(enable) end

--强制开启/关闭镜头同步
---@param enable boolean # 开关
function GameAPI.force_enable_camera_sync(enable) end

--启动云信并绑定对象
---@param role py.Role # 玩家
---@param entity py.Unit # 单位
function GameAPI.init_bind_nim(role, entity) end

--判断玩家单位类型前置条件满足需求
---@param player py.Role # 玩家
---@param unity_key py.UnitKey # 单位类型
---@return boolean # 是否满足
function GameAPI.check_unit_key_precondition(player, unity_key) end

--判断玩家物品类型前置条件满足需求
---@param player py.Role # 玩家
---@param item_key py.ItemKey # 物品类型
---@return boolean # 是否满足
function GameAPI.check_item_key_precondition(player, item_key) end

--判断玩家科技类型前置条件满足需求
---@param player py.Role # 玩家
---@param tech_key py.TechKey # 科技类型
---@return boolean # 是否满足
function GameAPI.check_tech_key_precondition(player, tech_key) end

--判断玩家技能类型前置条件满足需求
---@param player py.Role # 玩家
---@param ability_key py.AbilityKey # 技能类型
---@return boolean # 是否满足
function GameAPI.check_ability_key_precondition(player, ability_key) end

--获取技能类型的前置条件列表
---@param ability_key py.AbilityKey # 技能类型
---@return py.List # 前置条件列表
function GameAPI.get_ability_key_precondition_list(ability_key) end

--获取单位类型的前置条件列表
---@param unit_key py.UnitKey # 单位类型
---@return py.List # 前置条件列表
function GameAPI.get_unit_key_precondition_list(unit_key) end

--获取物品类型的前置条件列表
---@param item_key py.ItemKey # 物品类型
---@return py.List # 前置条件列表
function GameAPI.get_item_key_precondition_list(item_key) end

--获取前置条件遍历到的单位类型
---@param iter_data py.Actor # 数据
---@return py.UnitKey # 单位类型
function GameAPI.get_pre_condition_iter_unit_key(iter_data) end

--获取前置条件遍历到的科技类型
---@param iter_data py.Actor # 数据
---@return py.TechKey # 科技类型
function GameAPI.get_pre_condition_iter_tech_key(iter_data) end

--获取前置条件遍历到的单位标签
---@param iter_data py.Actor # 数据
---@return string # 单位标签
function GameAPI.get_pre_condition_iter_unit_tag(iter_data) end

--获取前置条件遍历到的科技标签
---@param iter_data py.Actor # 数据
---@return string # 科技标签
function GameAPI.get_pre_condition_iter_tech_tag(iter_data) end

--获取单位单位类型前置条件的需求值
---@param source_item_key py.UnitKey # 检测的单位
---@param target_item_key py.UnitKey # 查询的单位类型
---@return integer # 需求值
function GameAPI.get_unit_type_unit_key_pre_condition_require_count(source_item_key, target_item_key) end

--获取单位单位标签前置条件的需求值
---@param source_item_key py.UnitKey # 检测的单位
---@param target_item_key string # 查询的单位标签
---@return integer # 需求值
function GameAPI.get_unit_type_unit_tag_pre_condition_require_count(source_item_key, target_item_key) end

--获取单位科技类型前置条件的需求值
---@param source_item_key py.UnitKey # 检测的单位
---@param target_item_key py.TechKey # 查询的科技类型
---@return integer # 需求值
function GameAPI.get_unit_type_tech_key_pre_condition_require_count(source_item_key, target_item_key) end

--获取单位科技标签前置条件的需求值
---@param source_item_key py.UnitKey # 检测的单位
---@param target_item_key string # 查询的科技标签
---@return integer # 需求值
function GameAPI.get_unit_type_tech_tag_pre_condition_require_count(source_item_key, target_item_key) end

--获取技能单位类型前置条件的需求值
---@param source_item_key py.AbilityKey # 检测的技能
---@param target_item_key py.UnitKey # 查询的单位类型
---@return integer # 需求值
function GameAPI.get_ability_type_unit_key_pre_condition_require_count(source_item_key, target_item_key) end

--获取技能单位标签前置条件的需求值
---@param source_item_key py.AbilityKey # 检测的技能
---@param target_item_key string # 查询的单位标签
---@return integer # 需求值
function GameAPI.get_ability_type_unit_tag_pre_condition_require_count(source_item_key, target_item_key) end

--获取技能科技类型前置条件的需求值
---@param source_item_key py.AbilityKey # 检测的技能
---@param target_item_key py.TechKey # 查询的科技类型
---@return integer # 需求值
function GameAPI.get_ability_type_tech_key_pre_condition_require_count(source_item_key, target_item_key) end

--获取技能科技标签前置条件的需求值
---@param source_item_key py.AbilityKey # 检测的技能
---@param target_item_key string # 查询的科技标签
---@return integer # 需求值
function GameAPI.get_ability_type_tech_tag_pre_condition_require_count(source_item_key, target_item_key) end

--获取物品单位类型前置条件的需求值
---@param source_item_key py.ItemKey # 检测的物品
---@param target_item_key py.UnitKey # 查询的单位类型
---@return integer # 需求值
function GameAPI.get_item_type_unit_key_pre_condition_require_count(source_item_key, target_item_key) end

--获取物品单位标签前置条件的需求值
---@param source_item_key py.ItemKey # 检测的物品
---@param target_item_key string # 查询的单位标签
---@return integer # 需求值
function GameAPI.get_item_type_unit_tag_pre_condition_require_count(source_item_key, target_item_key) end

--获取物品科技类型前置条件的需求值
---@param source_item_key py.ItemKey # 检测的物品
---@param target_item_key py.TechKey # 查询的科技类型
---@return integer # 需求值
function GameAPI.get_item_type_tech_key_pre_condition_require_count(source_item_key, target_item_key) end

--获取物品科技标签前置条件的需求值
---@param source_item_key py.ItemKey # 检测的物品
---@param target_item_key string # 查询的科技标签
---@return integer # 需求值
function GameAPI.get_item_type_tech_tag_pre_condition_require_count(source_item_key, target_item_key) end

--设置控件适配
---@param role py.Role # 玩家
---@param comp_name string # 控件uid
---@param direction integer # 方向
---@param offset number # offset
function GameAPI.set_ui_comp_adapt_option(role, comp_name, direction, offset) end

--使玩家触发界面事件
---@param role py.Role # 玩家
---@param comp_name string # 控件uid
---@param event_name string # 事件名
function GameAPI.trigger_ui_event(role, comp_name, event_name) end

--控制控件跟随鼠标
---@param role py.Role # 玩家
---@param comp_name string # 控件uid
---@param is_follow string # 事件名
function GameAPI.set_ui_comp_follow_mouse(role, comp_name, is_follow) end

--获得坐标是否在控件内
---@param role py.Role # 玩家
---@param x number # x
---@param y number # y
---@param comp_name string # 控件uid
---@return boolean # 是否在其中
function GameAPI.pos_in_comp_box(role, x, y, comp_name) end

--创建新单位物编
---@param old_entity_no py.UnitKey # 单位物编
---@return py.UnitKey # 单位物编key
function GameAPI.create_unit_editor_data(old_entity_no) end

--设置相机透视射线的焦点单位
---@param role py.Role # 所属玩家
---@param unit py.Unit # 单位
function GameAPI.set_camera_perspective_ray_unit(role, unit) end

--创建新技能物编
---@param old_entity_no py.AbilityKey # 技能物编
---@return py.AbilityKey # 技能物编
function GameAPI.create_ability_editor_data(old_entity_no) end

--创建新投射物物编
---@param old_entity_no py.ProjectileKey # 投射物物编
---@return py.ProjectileKey # 投射物物编
function GameAPI.create_projectile_editor_data(old_entity_no) end

--创建新可破坏物物编
---@param old_entity_no py.DestructibleKey # 可破坏物物编
---@return py.DestructibleKey # 可破坏物物编
function GameAPI.create_destructible_editor_data(old_entity_no) end

--添加球形碰撞器
---@param body py.RigidBody # 刚体
---@param pos py.FVector3 # pos
---@param radius py.Fixed # radius
---@param euler_angle? py.FVector3 # euler_angle
---@param is_trigger? boolean # is_trigger
function GameAPI.api_add_sphere_collider(body, pos, radius, euler_angle, is_trigger) end

--设置碰撞体的布尔类型属性
---@param collider py.RigidBody # 刚体
---@param attr_name string # 布尔类型属性
---@param value py.Fixed # 值
function GameAPI.api_set_collider_bool_attr(collider, attr_name, value) end

--获取碰撞体的布尔类型属性
---@param collider py.RigidBody # 刚体
---@param attr_name string # 布尔类型属性
function GameAPI.api_get_collider_bool_attr(collider, attr_name) end

--设置碰撞体的实数类型属性
---@param collider py.RigidBody # 刚体
---@param attr_name string # 实数类型属性
---@param value boolean # 值
function GameAPI.api_set_collider_float_attr(collider, attr_name, value) end

--碰撞器的自身碰撞类别是否有指定类型
---@param collider py.Collider # 碰撞器
---@param mask py.Fixed # mask
---@return boolean # 布尔值
function GameAPI.api_is_collider_collision_category(collider, mask) end

--碰撞器的目标碰撞类别是否有指定类型
---@param collider py.Collider # 碰撞器
---@param mask py.Fixed # mask
---@return boolean # 布尔值
function GameAPI.api_is_collider_collide_with_mask(collider, mask) end

--碰撞器的自身碰撞类别是否有玩家
---@param collider py.Collider # 碰撞器
---@return boolean # 布尔值
function GameAPI.api_is_collider_collision_category_player(collider) end

--碰撞器的自身碰撞类别是否有地面
---@param collider py.Collider # 碰撞器
---@return boolean # 布尔值
function GameAPI.api_is_collider_collision_category_floor(collider) end

--获得碰撞器的自身碰撞类别
---@param collider py.Collider # 碰撞器
---@return py.Fixed # mask
function GameAPI.api_get_collider_collision_category(collider) end

--获得碰撞器的目标碰撞类别
---@param collider py.Collider # 碰撞器
---@return py.Fixed # mask
function GameAPI.api_get_collider_collide_with_mask(collider) end

--根据jid获取joint
---@param jid integer # joint ID
---@return py.Joint # Joint
function GameAPI.api_get_joint_by_bid(jid) end

--获得刚体中指定名字的碰撞器
---@param rigid py.RigidBody # 刚体
---@param name string # 碰撞器名字
---@return py.Collider # Collider
function GameAPI.api_get_rigid_body_collider(rigid, name) end

--创建固定关节
---@param pos py.FVector3 # 创建位置
---@param body_1 py.RigidBody # 刚体
---@param body_2 py.RigidBody # 刚体
---@param enable_collision? boolean # 检测碰撞
---@return py.RigidBody # Body
function GameAPI.api_create_fixed_joint(pos, body_1, body_2, enable_collision) end

--销毁关节
---@param joint py.Joint # 关节
function GameAPI.api_destroy_joint(joint) end

--根据id获取物理组件
---@param comp_id integer # joint ID
---@return py.PhysicsObject # PhysicsObject
function GameAPI.api_get_physics_object_by_id(comp_id) end

--获取单位或者物理组件的位置
---@param unit py.Actor # 单位或物理组件
---@return py.FVector3 # Position
function GameAPI.api_get_unit_or_physics_entity_pos(unit) end

--把刚体的本地坐标转到全局坐标
---@param body py.RigidBody # 刚体
---@param local_pos py.FVector3 # local_pos
function GameAPI.api_transform_local_to_global_coords(body, local_pos) end

--射线检测
---@param start_point py.FVector3 # 起点
---@param end_point py.FVector3 # 终点
---@return py.RigidBodyGroup # 是否有重叠
function GameAPI.api_physics_raycast(start_point, end_point) end

--设置物理组件可见性(以及是否为生效状态)
---@param physics_object_id py.Actor # 物理组件
---@param is_visible boolean # 是否可见
function GameAPI.api_set_physics_object_activated_and_visible(physics_object_id, is_visible) end

--设置逻辑物理组件可见性(以及是否为生效状态)
---@param physics_entity_id py.Actor # 物理组件
---@param is_visible boolean # 是否可见
function GameAPI.api_set_physics_entity_activated_and_visible(physics_entity_id, is_visible) end

--单位/逻辑物理组件之间是否有重叠
---@param entity_1 py.Actor # 单位/逻辑物理组件
---@param entity_2 py.Actor # 单位/逻辑物理组件
---@return boolean # 是否有重叠
function GameAPI.api_check_physics_is_overlapping(entity_1, entity_2) end

--单位/逻辑物理组件之间是否有碰撞
---@param entity_1 py.Actor # 单位/逻辑物理组件
---@param entity_2 py.Actor # 单位/逻辑物理组件
---@return boolean # 是否有重叠
function GameAPI.api_check_physics_is_contacting(entity_1, entity_2) end

--创建物理组件
---@param physics_object_id py.PhysicsObjectKey # 物理组件类型
---@param translation py.FVector3 # 位置
---@param direction py.FVector3 # 朝向
---@return py.PhysicsObject # 物理组件
function GameAPI.api_create_physics_object(physics_object_id, translation, direction) end

--创建逻辑物理组件
---@param physics_entity_id py.PhysicsObjectKey # 物理组件类型
---@param translation py.FVector3 # 位置
---@param direction py.FVector3 # 朝向
---@param scale? py.Fixed # 缩放
function GameAPI.api_create_physics_entity(physics_entity_id, translation, direction, scale) end

--删除物理组件
---@param physics_object_id py.Actor # 逻辑物理组件
function GameAPI.api_del_physics_object(physics_object_id) end

--删除逻辑物理组件
---@param physics_entity_id py.Actor # 逻辑物理组件
function GameAPI.api_del_physics_entity(physics_entity_id) end

--设置逻辑物理组件开启状态
---@param entity py.PhysicsEntity # 物理组件
---@param is_active boolean # 开启状态
---@param visible? boolean # 可见性
function GameAPI.api_set_entity_active(entity, is_active, visible) end

--获得逻辑物理组件开启状态
---@param entity py.PhysicsEntity # 物理组件
function GameAPI.api_get_entity_active(entity) end

--逻辑物理组件是否存在
---@param entity? py.PhysicsEntity # 逻辑物理组件
---@return boolean # 布尔值
function GameAPI.api_physics_entity_is_exist(entity) end

--逻辑物理组件中指定刚体的模型播放动画
---@param entity py.PhysicsEntity # 物理组件
---@param rigid py.RigidBody # 刚体
---@param anim_name string # 动画名称
---@param loop boolean # 是否循环
function GameAPI.api_physics_play_animation(entity, rigid, anim_name, loop) end

--获得逻辑物理组件当前状态
---@param entity py.PhysicsEntity # 物理组件
---@return integer # 状态
function GameAPI.api_get_entity_state(entity) end

--设置逻辑物理组件当前状态
---@param entity py.PhysicsEntity # 物理组件
---@param state integer # 状态
function GameAPI.api_set_entity_state(entity, state) end

--设置爆炸器属性
---@param exploder py.PhysicsEntity # 爆炸器组件
---@param damage py.Fixed # 爆炸伤害
---@param radius py.Fixed # 爆炸半径
---@param collision_category? integer # 自身碰撞类别
---@param collide_with_mask? integer # 目标碰撞类别
---@param ignore_trigger? boolean # 忽略触发器
---@param ignore_non_trigger? boolean # 忽略非触发器
---@param ignore_non_rigid? boolean # 忽略非刚体
---@param ignore_static? boolean # 忽略动态物体
---@param ignore_kinematic? boolean # 忽略运动学物体
---@param ignore_dynamic? boolean # 忽略静态物体
---@param ignore_logic_body? boolean # 忽略逻辑物体
---@param ignore_non_logic_body? boolean # 忽略非逻辑物体
function GameAPI.api_set_exploder_attribute(exploder, damage, radius, collision_category, collide_with_mask, ignore_trigger, ignore_non_trigger, ignore_non_rigid, ignore_static, ignore_kinematic, ignore_dynamic, ignore_logic_body, ignore_non_logic_body) end

--设置爆炸器友军伤害
---@param exploder py.PhysicsEntity # 爆炸器组件
---@param camp py.Camp # 阵营
---@param friendly_fire boolean # 友军伤害
function GameAPI.api_set_exploder_friendly_fire(exploder, camp, friendly_fire) end

--引爆爆炸器
---@param exploder py.PhysicsEntity # 爆炸器组件
---@param position py.FVector3 # 位置
---@param delay? py.Fixed # 延时
---@param sfx? py.Fixed # 特效
---@param sfx_duration? py.Fixed # 特效持续时间
function GameAPI.api_explode(exploder, position, delay, sfx, sfx_duration) end

--设置爆炸器击倒值
---@param exploder py.PhysicsEntity # 爆炸器组件
---@param down_value py.Fixed # 击倒值
function GameAPI.api_set_exploder_down_value(exploder, down_value) end

--设置爆炸器击飞力
---@param exploder py.PhysicsEntity # 爆炸器组件
---@param force py.Fixed # 击飞力
function GameAPI.api_set_exploder_force(exploder, force) end

--设置物理主控单位
---@param ctrl_unit py.Unit # 单位
function GameAPI.set_physics_ctrl_unit(ctrl_unit) end

--获取物理主控单位
---@param role py.Role # 玩家
---@return py.Unit # 单位
function GameAPI.get_physics_ctrl_unit(role) end

--创建单位
---@param key py.UnitKey # 单位编号
---@param location py.FVector3 # 位置
---@param direction py.FVector3 # 朝向
---@param role_or_unit py.Role # 所属玩家
---@return py.Unit # 创建出的单位
function GameAPI.create_unit_at_vector3(key, location, direction, role_or_unit) end

--单位传送到指定坐标
---@param unit py.Unit # 单位
---@param position py.FVector3 # 目标坐标
---@param clear_speed boolean # 是否清除速度
function GameAPI.api_unit_transmit_3d(unit, position, clear_speed) end

--复活单位
---@param unit py.Unit # 单位
---@param position py.FVector3 # 复活位置
---@param clear_speed boolean # 清除速度
function GameAPI.api_revive_unit_3d(unit, position, clear_speed) end

--获取角色所处状态机节点名称
---@param unit py.Unit # 单位
---@return string # 状态机节点名称
function GameAPI.api_get_character_state_name(unit) end

--获取单位碰撞盒里最近的抓取单位（测试用）
---@param unit py.Unit # 单位
---@return py.Unit # 距离最近的单位
function GameAPI.api_get_grab_character(unit) end

--抓取技能
---@param source py.Unit # 施法单位
---@param target py.Unit # 目标单位
function GameAPI.api_grab(source, target) end

--暴揍技能
---@param source py.Unit # 施法单位
---@param target py.Unit # 目标单位
function GameAPI.api_physics_catch(source, target) end

--移除手部黏连状态
---@param unit py.Unit # 单位
---@param handtype py.CcHandID # 左手/右手
function GameAPI.api_disconnect_hand(unit, handtype) end

--移除双手的黏连状态
---@param unit py.Unit # 单位
function GameAPI.api_disconnect_both_hands(unit) end

--检查手部是否处于黏连状态
---@param unit py.Unit # 单位
---@param handtype py.CcHandID # 左手/右手
---@return boolean # 是否黏连
function GameAPI.api_check_hand_connection(unit, handtype) end

--主控角色做预定义行为
---@param unit py.Unit # 角色
---@param cc_action py.CcActionID # 预定义行为ID
---@param cc_hand? py.CcHandID # 左手/右手
function GameAPI.cc_do_predefined_action(unit, cc_action, cc_hand) end

--重载角色动画状态
---@param unit py.Unit # 角色
---@param anim_status py.CcAnimationMachineStatus # 动画机节点名字
---@param anim_name string # 动画名
function GameAPI.api_override_anim_status(unit, anim_status, anim_name) end

--判断单位上半身行动受限
---@param unit py.Unit # 单位
---@return boolean # 是否受限
function GameAPI.is_upper_body_limited(unit) end

--投掷技能
---@param source py.Unit # 施法单位
function GameAPI.api_physics_throw(source) end

--拾取物品
---@param source py.Unit # 施法单位
function GameAPI.api_physics_pick_up(source) end

--施加倒地状态
---@param unit py.Unit # 施加目标
---@param duration py.Fixed # 持续时间
function GameAPI.api_physics_hit_down_unit(unit, duration) end

--获取抓举单位
---@param unit py.Unit # 单位
function GameAPI.api_get_grab_unit(unit) end

--检查是否处于抓举状态
---@param unit py.Unit # 单位
---@return boolean # 是否处于抓举状态
function GameAPI.api_check_grab_state(unit) end

--获取手持物品
---@param unit py.Unit # 单位
function GameAPI.api_get_pick_item(unit) end

--检查是否手持物品
---@param unit py.Unit # 单位
---@return boolean # 是否手持物品
function GameAPI.api_check_physics_unit_pick_item_exist(unit) end

--增加击倒值
---@param unit py.Unit # 单位
---@param down_value py.Fixed # 击倒值
function GameAPI.api_add_unit_down_value(unit, down_value) end

--开始使用手持道具
---@param unit py.Unit # 单位
function GameAPI.api_character_try_begin_use(unit) end

--结束使用手持道具
---@param unit py.Unit # 单位
function GameAPI.api_character_try_end_use(unit) end

--设置动画状态机为物理状态
---@param entity py.Unit # 单位
---@param duration py.Fixed # 持续时间
function GameAPI.api_set_entity_anim_state_machine_physics(entity, duration) end

--获取角色移动速度
---@param entity py.Unit # 单位
---@return py.FVector3 # 速度
function GameAPI.api_physics_unit_get_move_speed(entity) end

--根据bid获取rigidBody
---@param bid integer # body ID
---@return py.RigidBody # RigidBody
function GameAPI.api_get_rigid_body_by_bid(bid) end

--根据名称获取逻辑物理组件中的rigidbody
---@param physics_entity py.PhysicsEntity # 物理组件
---@param name string # 名称
---@return py.RigidBody # RigidBody
function GameAPI.api_get_rigid_body_in_physics_entity(physics_entity, name) end

--根据名称获取物理组件中的rigidbody
---@param physics_object py.PhysicsEntity # 物理组件
---@param name string # 名称
---@return py.RigidBody # RigidBody
function GameAPI.api_get_rigid_body_in_physics_object(physics_object, name) end

--获取单位的rigidBody
---@param unit py.Unit # 单位
---@return py.RigidBody # RigidBody
function GameAPI.api_get_rigid_body_in_unit(unit) end

--获取刚体所属的单位
---@param rigid_body py.RigidBody # 刚体
---@return py.Unit # Owner
function GameAPI.api_get_rigid_body_owner_unit(rigid_body) end

--获取刚体所属的逻辑物理组件
---@param rigid_body py.RigidBody # 刚体
---@return py.PhysicsEntity # Owner
function GameAPI.api_get_rigid_body_owner_physics_entity(rigid_body) end

--向刚体施加力
---@param body py.RigidBody # 刚体
---@param force py.Fixed # 力度
---@param direction py.FVector3 # 方向
---@return py.RigidBody # RigidBody
function GameAPI.api_add_force_to_rigid_body(body, force, direction) end

--给刚体叠加速度
---@param body py.RigidBody # 刚体
---@param speed py.Fixed # 速度的大小
---@param direction py.FVector3 # 速度的方向
---@return py.RigidBody # RigidBody
function GameAPI.api_add_velocity_to_rigid_body(body, speed, direction) end

--获取刚体的位置
---@param body py.RigidBody # 刚体
---@return py.FVector3 # Position
function GameAPI.api_get_rigid_body_pos(body) end

--设置刚体的位置
---@param body py.RigidBody # 刚体
---@param pos py.FVector3 # pos
function GameAPI.api_set_rigid_body_pos(body, pos) end

--设置刚体的朝向
---@param body py.RigidBody # 刚体
---@param direction py.FRotation # direction
function GameAPI.api_set_rigid_body_direction(body, direction) end

--设置刚体的刚体类型
---@param body py.RigidBody # 刚体
---@param body_type string # 刚体类型
function GameAPI.api_set_rigid_body_type(body, body_type) end

--设置刚体的布尔类型属性
---@param body py.RigidBody # 刚体
---@param attr_name string # 布尔类型属性
---@param value boolean # 值
function GameAPI.api_set_rigid_body_bool_attr(body, attr_name, value) end

--获取COLLIDER所属的刚体
---@param collider py.Collider # Collider
---@return py.RigidBody # Body
function GameAPI.api_get_collider_body(collider) end

--设置刚体有效性
---@param rigid py.RigidBody # 刚体
---@param is_active boolean # 是否有效
function GameAPI.api_set_rigidbody_active(rigid, is_active) end

--设置刚体模型可见性
---@param rigid py.PhysicsEntity # 物理组件
---@param visible py.RigidBody # 刚体
function GameAPI.api_set_rigidbody_visible(rigid, visible) end

--获取刚体有效性
---@param rigid py.RigidBody # 刚体
---@return boolean # 是否有效
function GameAPI.api_get_rigidbody_active(rigid) end

--设置刚体速度
---@param body py.RigidBody # 刚体
---@param speed py.Fixed # 速度大小
---@param direction py.FVector3 # 速度方向
function GameAPI.api_set_rigidbody_velocity(body, speed, direction) end

--设置刚体速度
---@param body py.RigidBody # 刚体
---@param angular_velocity py.FVector3 # 角速度
function GameAPI.api_set_rigidbody_angular_velocity(body, angular_velocity) end

--获得刚体朝向
---@param rigid py.RigidBody # 刚体
---@return py.FVector3 # 朝向
function GameAPI.api_get_rigidbody_forward(rigid) end

--获得范围内的刚体组
---@param position py.FVector3 # 位置
---@param radius number # 半径
---@param collision_category? integer # 自身碰撞类别
---@param collide_with_mask? integer # 目标碰撞类别
---@param ignore_trigger? boolean # 忽略触发器
---@param ignore_non_trigger? boolean # 忽略非触发器
---@param ignore_non_rigid? boolean # 忽略非刚体
---@param ignore_static? boolean # 忽略动态物体
---@param ignore_kinematic? boolean # 忽略运动学物体
---@param ignore_dynamic? boolean # 忽略静态物体
---@param ignore_logic_body? boolean # 忽略逻辑物体
---@param ignore_non_logic_body? boolean # 忽略非逻辑物体
---@return py.RigidBodyGroup # 刚体组
function GameAPI.api_get_rigid_body_group_in_range(position, radius, collision_category, collide_with_mask, ignore_trigger, ignore_non_trigger, ignore_non_rigid, ignore_static, ignore_kinematic, ignore_dynamic, ignore_logic_body, ignore_non_logic_body) end

--替换刚体模型
---@param rigid py.RigidBody # 刚体
---@param id py.Fixed # 模型id
function GameAPI.api_replace_rigid_body_model(rigid, id) end

--还原刚体上一个模型
---@param rigid py.RigidBody # 刚体
function GameAPI.api_restore_rigid_body_last_model(rigid) end

--刚体是否有指定tag
---@param rigid py.RigidBody # 刚体
---@param tag string # tag
---@return boolean # 布尔值
function GameAPI.api_is_rigid_has_tag(rigid, tag) end

--删除REACTION
---@param reaction py.Reaction # Reaction
function GameAPI.api_delete_reaction(reaction) end

--删除REACTION Group
---@param reactions py.ReactionGroup # ReactionGroup
function GameAPI.api_delete_reaction_group(reactions) end

--物理物品抛出
---@param physics_item py.Unit # 物品单位
---@param length py.Fixed # 抛出距离
---@param vel py.Fixed # 水平速度
---@param socket_name string # 出手绑点
function GameAPI.throw_physics_item(physics_item, length, vel, socket_name) end

--获取物理物品的刚体
---@param physics_item py.Unit # 物品单位
function GameAPI.get_physics_item_body_object(physics_item) end

--删除逻辑物理物品
---@param physics_item py.Unit # 物品单位
function GameAPI.api_remove_physics_item(physics_item) end

--逻辑物理物品模型解绑持有者
---@param physics_item py.Unit # 物品单位
function GameAPI.api_physics_item_viewer_detach(physics_item) end

--获取逻辑物理物品绑定技能
---@param physics_item py.Unit # 物品单位
function GameAPI.api_physics_item_get_ability(physics_item) end

--逻辑物理物品创建特效
---@param physics_item py.PhysicsEntity # 物理组件
---@param sfx_id py.Fixed # 特效ID
---@param position py.FVector3 # 位置
---@param duration? py.Fixed # 持续时间
function GameAPI.api_physics_item_create_sfx(physics_item, sfx_id, position, duration) end

--逻辑物理物品播放动画
---@param physics_item py.Unit # 物理组件
---@param anim string # 动画名称
---@param play_speed number # 播放倍率
---@param begin_t number # 开始时间(s)
---@param end_t number # 结束时间(s)，正数 -1 表示不结束
---@param loop boolean # 是否循环
---@param return_idle boolean # 播放结束后是否恢复idle
function GameAPI.api_physics_item_play_animation(physics_item, anim, play_speed, begin_t, end_t, loop, return_idle) end

--创建特效到三维坐标
---@param sfx_id py.SfxKey # 特效编号
---@param position py.FVector3 # 位置
---@param direction? py.FVector3 # 朝向
---@param scale? number # 缩放比例
---@param duration? number # 持续时间
---@param immediately? boolean # 是否立即删除
---@return py.Sfx # 特效
function GameAPI.create_sfx_on_point_3d(sfx_id, position, direction, scale, duration, immediately) end

--LUA层初始化参数
---@param name string # name
---@param value string # value
---@param if_list boolean # 是否数组
---@return py.Actor # 变量
function GameAPI.init_lua_var(name, value, if_list) end

--从lua设置变量
---@param func_name string # 函数名称
---@param actor py.Actor # actor
---@param key integer # index
---@param index string # key
---@param value string # value
function GameAPI.set_lua_var(func_name, actor, key, index, value) end

--从lua读取变量
---@param func_name string # 函数名称
---@param actor py.Actor # actor
---@param key string # key
---@param index? integer # index
function GameAPI.get_lua_var(func_name, actor, key, index) end

--设置随机数种子
---@param v integer # 随机数种子
function GameAPI.set_random_seed(v) end

--获取随机数种子
---@return integer # 随机数种子
function GameAPI.get_random_seed() end

--创建单位
---@param key py.UnitKey # 单位编号
---@param pos py.FVector3 # 位置
---@param angle py.Fixed # 朝向
---@param role_or_unit py.Role # 所属玩家
---@return py.Unit # 创建出的单位
function GameAPI.create_unit(key, pos, angle, role_or_unit) end

--改变单位所属玩家
---@param unit py.Unit # 单位
---@param role py.Role # 所属玩家
function GameAPI.change_unit_role(unit, role) end

--改变投射物所属单位
---@param projectile py.ProjectileEntity # 投射物
---@param unit py.Unit # 单位
function GameAPI.change_projectile_owner(projectile, unit) end

--改变投射物所属技能
---@param projectile py.ProjectileEntity # 投射物
---@param related_ability py.Ability # 单位
function GameAPI.change_projectile_ability(projectile, related_ability) end

--修改玩家资源图标
---@param res_key py.RoleResKey # 资源名称
---@param icon_id integer # 图标编号
function GameAPI.change_role_res_icon(res_key, icon_id) end

--修改玩家资源图标(图片类型)
---@param res_key py.RoleResKey # 资源名称
---@param icon_id py.Texture # 图标
function GameAPI.change_role_res_icon_with_icon(res_key, icon_id) end

--移除控制列表中的某个单位
---@param role py.Role # 玩家
---@param unit py.Unit # 单位
function GameAPI.remove_control_unit(role, unit) end

--获取队伍内单位列表
---@param role py.Role # 玩家
---@param team_id integer # 队伍编号
function GameAPI.get_unit_ids_in_team(role, team_id) end

--给队伍添加单位
---@param role py.Role # 玩家
---@param team_id integer # 队伍编号
---@param unit py.Unit # 单位
function GameAPI.add_unit_to_team(role, team_id, unit) end

--从队伍中去除单位
---@param role py.Role # 玩家
---@param team_id integer # 队伍编号
---@param unit py.Unit # 单位
function GameAPI.remove_unit_from_team(role, team_id, unit) end

--创建幻象
---@param clone_unit py.Unit # 复制目标
---@param caller_unit py.Unit # 召唤者
---@param role py.Role # 玩家
---@param pos py.FVector3 # 位置
---@param angle py.Fixed # 朝向
---@param clone_hp_mp? boolean # 是否继承生命与魔法
function GameAPI.create_illusion(clone_unit, caller_unit, role, pos, angle, clone_hp_mp) end

--判断单位是否是幻象单位
---@param unit py.Unit # 单位
---@return boolean # 是否是幻象
function GameAPI.is_unit_illusion(unit) end

--获取幻象召唤者
---@param illusion_unit py.Unit # 幻象单位
---@return py.Unit # 召唤单位
function GameAPI.get_illusion_caller_unit(illusion_unit) end

--在单位的挂接点创建一个投掷物
---@param p_key py.ProjectileKey # 投掷物编号
---@param socket_unit py.Unit # 挂节点所属单位
---@param socket_name string # 挂接点名称
---@param face py.Fixed # 朝向
---@param owner_unit_or_player? py.Actor # 所属单位或玩家
---@param related_ability? py.Ability # 关联技能
---@param visibility? integer # 粒子特效可见性规则
---@param duration? py.Fixed # 持续时间
---@param is_open_duration? boolean # 是否启用持续时间
---@param immediately? boolean # 立即移除表现
---@param use_sys_d_destroy_way? boolean # 特效删除的方式是否读表
---@return py.ProjectileEntity # 创建出的投掷物
function GameAPI.create_projectile_on_socket(p_key, socket_unit, socket_name, face, owner_unit_or_player, related_ability, visibility, duration, is_open_duration, immediately, use_sys_d_destroy_way) end

--创建一个投掷物
---@param p_key py.ProjectileKey # 投掷物编号
---@param location py.FVector3 # 位置
---@param face? py.Fixed # 朝向
---@param owner_unit_or_player? py.Unit # 所属单位
---@param related_ability? py.Ability # 关联技能
---@param duration? py.Fixed # 持续时间
---@param is_open_duration? boolean # 是否启用持续时间
---@param height? py.Fixed # 高度
---@param visibility? integer # 粒子特效可见性规则
---@param immediately? boolean # 立即移除表现
---@param use_sys_d_destroy_way? boolean # 特效删除的方式是否读表
---@return py.ProjectileEntity # 创建出的投掷物
function GameAPI.create_projectile_in_scene(p_key, location, face, owner_unit_or_player, related_ability, duration, is_open_duration, height, visibility, immediately, use_sys_d_destroy_way) end

--创建一个投掷物
---@param p_key py.ProjectileKey # 投掷物编号
---@param location py.FVector3 # 位置
---@param owner_unit_or_player py.Actor # 所属单位或玩家
---@param face? py.Fixed # 朝向
---@param related_ability? py.Ability # 关联技能
---@param duration? py.Fixed # 持续时间
---@param is_open_duration? boolean # 是否启用持续时间
---@param height? py.Fixed # 高度
---@param visibility? integer # 粒子特效可见性规则
---@param immediately? boolean # 立即移除表现
---@param use_sys_d_destroy_way? boolean # 特效删除的方式是否读表
---@return py.ProjectileEntity # 创建出的投掷物
function GameAPI.create_projectile_in_scene_new(p_key, location, owner_unit_or_player, face, related_ability, duration, is_open_duration, height, visibility, immediately, use_sys_d_destroy_way) end

--播放音乐
---@param role py.Role # 玩家
---@param sid py.AudioKey # 乐曲编号
---@param loop boolean # 是否循环
---@param fade_in_time? number # 淡入时间
---@param fade_out_time? number # 淡出时间
function GameAPI.play_sound_for_player(role, sid, loop, fade_in_time, fade_out_time) end

--对目标播放音乐
---@param unit_key py.UnitKey # 单位编号
---@param camp_target py.RoleRelation # 玩家关系
---@param sid py.AudioKey # 乐曲编号
---@param loop boolean # 是否循环
function GameAPI.play_sound_for_role_relation(unit_key, camp_target, sid, loop) end

--播放3d音乐
---@param role py.Role # 玩家
---@param sid py.AudioKey # 乐曲编号
---@param position py.Point # 播放位置
---@param height number # 高度
---@param fade_in_time? boolean # 是否循环
---@param fade_out_time? number # 淡入时间
---@param ensure_play? number # 淡出时间
---@param loop? boolean # 确保播放
function GameAPI.play_3d_sound_for_player(role, sid, position, height, fade_in_time, fade_out_time, ensure_play, loop) end

--跟随单位播放3d音乐
---@param role py.Role # 玩家
---@param sid py.AudioKey # 乐曲编号
---@param unit py.Unit # 单位
---@param fade_in_time? boolean # 是否循环
---@param fade_out_time? number # 淡入时间
---@param ensure_play? number # 淡出时间
---@param loop? boolean # 确保播放
---@param offset_x? number # 偏移x
---@param offset_y? number # 偏移y
---@param offset_z? number # 偏移z
function GameAPI.follow_object_play_3d_sound_for_player(role, sid, unit, fade_in_time, fade_out_time, ensure_play, loop, offset_x, offset_y, offset_z) end

--停止播放音乐
---@param role py.Role # 玩家
---@param sound py.SoundEntity # 声音
---@param immediately_stop? boolean # 是否立即停止
function GameAPI.stop_sound(role, sound, immediately_stop) end

--播放控制
---@param role py.Role # 玩家
---@param sound py.SoundEntity # 声音
---@param play_operation integer # 播放操作
function GameAPI.sound_play_controller(role, sound, play_operation) end

--将玩家添加到玩家组
---@param role py.Role # 玩家
---@param group py.RoleGroup # 玩家组
function GameAPI.add_role_to_group(role, group) end

--玩家组中删除玩家
---@param role py.Role # 玩家
---@param group py.RoleGroup # 玩家组
function GameAPI.rem_role_from_group(role, group) end

--根据单位ID获取单位
---@param unit_id py.UnitID # 单位id
---@return py.Unit # 单位
function GameAPI.get_unit_by_id(unit_id) end

--根据特效ID获取特效
---@param projectile_id py.ProjectileID # 特效id
---@return py.ProjectileEntity # 特效
function GameAPI.get_projectile_by_id(projectile_id) end

--判断单位是否在单位组
---@param unit py.Unit # 单位
---@param group py.UnitGroup # 单位组
---@return boolean # 是否在单位组
function GameAPI.judge_unit_in_group(unit, group) end

--获取科技图标
---@param tech_key py.TechKey # 科技编号
---@param target_level integer # 等级
---@return py.Texture # 图片
function GameAPI.api_get_tech_icon(tech_key, target_level) end

--点与点的角度
---@param p1 py.Point # 点
---@param p2 py.Point # 目标点
---@return py.Fixed # 角度
function GameAPI.get_points_angle(p1, p2) end

--点与点的距离
---@param p1 py.Point # 点
---@param p2 py.Point # 目标点
---@return py.Fixed # 距离
function GameAPI.get_points_dis(p1, p2) end

--获取当前点的地面高度
---@param point py.Point # 点
---@return py.Fixed # 地面高度
function GameAPI.get_point_ground_height(point) end

--获取当前点的碰撞类型
---@param point py.Point # 点
---@return integer # 碰撞类型
function GameAPI.get_point_ground_collision(point) end

--获取当前点的视野隔断类型
---@param point py.Point # 点
---@return integer # 隔断类型
function GameAPI.get_point_view_block_type(point) end

--判断点是否在区域内
---@param point py.FVector3 # 点
---@param area py.Area # 区域
---@return boolean # 点是否在区域中
function GameAPI.judge_point_in_area(point, area) end

--判断点是否在正方形内
---@param point py.FVector3 # 点
---@param center py.FVector3 # 中心点
---@param width py.Fixed # 正方形边长
---@return boolean # 点是否在正方形中
function GameAPI.judge_point_in_rec(point, center, width) end

--给区域添加tag
---@param area py.Area # 区域
---@param tag string # tag
function GameAPI.add_area_tag(area, tag) end

--给区域移除tag
---@param area py.Area # 区域
---@param tag string # tag
function GameAPI.remove_area_tag(area, tag) end

--给路径添加tag
---@param road py.Road # 路径
---@param tag string # tag
function GameAPI.add_road_tag(road, tag) end

--给路径移除tag
---@param road py.Road # 路径
---@param tag string # tag
function GameAPI.remove_road_tag(road, tag) end

--圆形区域是否拥有某tags
---@param area py.Area # 区域
---@param tag string # tag
---@return boolean # 布尔值
function GameAPI.if_cir_area_has_tag(area, tag) end

--矩形区域是否拥有某tags
---@param area py.Area # 区域
---@param tag string # tag
---@return boolean # 布尔值
function GameAPI.if_rect_area_has_tag(area, tag) end

--路径是否拥有某tags
---@param road py.Road # 路径
---@param tag string # tag
---@return boolean # 布尔值
function GameAPI.if_road_has_tag(road, tag) end

--根据tag获取对应的圆形区域
---@param tag string # tag
---@return py.List # 列表
function GameAPI.get_cir_areas_by_tag(tag) end

--根据tag获取对应的矩形区域
---@param tag string # tag
---@return py.List # 列表
function GameAPI.get_rect_areas_by_tag(tag) end

--根据tag获取对应的不规则区域
---@param tag string # tag
---@return py.List # 列表
function GameAPI.get_polygon_areas_by_tag(tag) end

--根据tag获取对应的路径
---@param tag string # tag
---@return py.List # 列表
function GameAPI.get_roads_by_tag(tag) end

--获取不规则区域顶点列表
---@param poly_area py.PolyArea # 不规则区域
---@return py.List # 顶点列表
function GameAPI.get_poly_area_point_list(poly_area) end

--通过路点返回点
---@param road_point py.DynamicTypeMeta # 路点
---@return py.FVector3 # 点
function GameAPI.get_point_by_road_point(road_point) end

--创建矩形区域
---@param point py.FVector3 # 左下方起始点
---@param width py.Fixed # 宽
---@param height py.Fixed # 高
---@return py.RecArea # 矩形区域
function GameAPI.create_new_rec_area(point, width, height) end

--创建矩形区域
---@param center py.FVector3 # 中心点
---@param width py.Fixed # 宽
---@param height py.Fixed # 高
---@return py.RecArea # 矩形区域
function GameAPI.create_rect_area_by_center(center, width, height) end

--创建矩形区域
---@param point_begin py.Point # 起始点
---@param point_end py.Point # 终点
---@return py.RecArea # 矩形区域
function GameAPI.create_rec_area_from_two_points(point_begin, point_end) end

--创建圆形区域
---@param point py.FVector3 # 中心点
---@param radius py.Fixed # 半径
---@return py.CirArea # 圆形区域
function GameAPI.create_new_cir_area(point, radius) end

--创建多边形区域
---@param point0 py.Point # 点
---@param point1 py.Point # 点
---@param point2 py.Point # 点
---@param point3? py.Point # 点
---@param point4? py.Point # 点
---@param point5? py.Point # 点
---@param point6? py.Point # 点
---@param point7? py.Point # 点
---@return py.PolyArea # 多边形区域
function GameAPI.create_polygon_area(point0, point1, point2, point3, point4, point5, point6, point7) end

--创建多边形区域(新)
---@param point0 py.Point # 点
---@param point1 py.Point # 点
---@param point2 py.Point # 点
---@param point3? py.Point # 点
---@param point4? py.Point # 点
---@param point5? py.Point # 点
---@param point6? py.Point # 点
---@param point7? py.Point # 点
---@param point8? py.Point # 点
---@param point9? py.Point # 点
---@param point10? py.Point # 点
---@param point11? py.Point # 点
---@param point12? py.Point # 点
---@return py.PolyArea # 多边形区域
function GameAPI.create_polygon_area_new(point0, point1, point2, point3, point4, point5, point6, point7, point8, point9, point10, point11, point12) end

--设置圆形区域大小
---@param area py.CirArea # 圆形区域
---@param radius py.Fixed # 半径
function GameAPI.set_cir_area_radius(area, radius) end

--获取圆形区域半径
---@param area py.CirArea # 圆形区域
---@return py.Fixed # 半径
function GameAPI.get_circle_area_radius(area) end

--获取圆形区域内最小X坐标
---@param area py.CirArea # 圆形区域
---@return py.Fixed # 最小的X坐标
function GameAPI.get_circle_area_min_x(area) end

--获取圆形区域内最小y坐标
---@param area py.CirArea # 圆形区域
---@return py.Fixed # 最小的Y坐标
function GameAPI.get_circle_area_min_y(area) end

--获取圆形区域内最大X坐标
---@param area py.CirArea # 圆形区域
---@return py.Fixed # 最大的X坐标
function GameAPI.get_circle_area_max_x(area) end

--获取圆形区域内最大y坐标
---@param area py.CirArea # 圆形区域
---@return py.Fixed # 最大的Y坐标
function GameAPI.get_circle_area_max_y(area) end

--设置矩形区域大小
---@param area py.RecArea # 矩形区域
---@param length py.Fixed # 长
---@param width py.Fixed # 宽
function GameAPI.set_rect_area_radius(area, length, width) end

--获取矩形区域内最小X坐标
---@param area py.RecArea # 矩形区域
---@return py.Fixed # 最小的X坐标
function GameAPI.get_rect_area_min_x(area) end

--获取矩形区域内最小Y坐标
---@param area py.RecArea # 矩形区域
---@return py.Fixed # 最小的Y坐标
function GameAPI.get_rect_area_min_y(area) end

--获取矩形区域内最大X坐标
---@param area py.RecArea # 矩形区域
---@return py.Fixed # 最大的X坐标
function GameAPI.get_rect_area_max_x(area) end

--获取矩形区域内最大Y坐标
---@param area py.RecArea # 矩形区域
---@return py.Fixed # 最大的Y坐标
function GameAPI.get_rect_area_max_y(area) end

--获取可用地图范围
---@return py.RecArea # 区域
function GameAPI.get_usable_map_range() end

--通过区域ID返回矩形区域
---@param res_id py.AreaID # 区域ID
---@return py.RecArea # 矩形区域
function GameAPI.get_rec_area_by_res_id(res_id) end

--通过区域ID返回圆形区域
---@param res_id py.AreaID # 区域ID
---@return py.CirArea # 圆形区域
function GameAPI.get_circle_area_by_res_id(res_id) end

--通过区域ID返回自定义多边形区域
---@param res_id py.AreaID # 区域ID
---@return py.PolyArea # 多边形区域
function GameAPI.get_polygon_area_by_res_id(res_id) end

--最近创建的矩形区域
---@return py.RecArea # 矩形区域
function GameAPI.get_rec_area_last_created() end

--点是否在矩形区域内
---@param point py.FPoint # 点
---@param area py.RecArea # 矩形区域
---@return boolean # 点是否在矩形区域内
function GameAPI.judge_point_in_rec_area(point, area) end

--点是否在圆形区域内
---@param point py.FPoint # 点
---@param area py.CirArea # 圆形区域
---@return boolean # 点是否在圆形区域内
function GameAPI.judge_point_in_cir_area(point, area) end

--点是否在不规则区域内
---@param point py.FPoint # 点
---@param area py.CirArea # 不规则区域
---@return boolean # 点是否在不规则区域内
function GameAPI.judge_point_in_polygon_area(point, area) end

--通过资源id返回点
---@param res_id integer # 资源ID
---@return py.FPoint # 点
function GameAPI.get_point_by_res_id(res_id) end

--获取区域内单位数量
---@param area py.Area # 区域
---@return integer # 单位数量
function GameAPI.get_unit_num_in_area(area) end

--矩形区域内单位数量
---@param area py.RecArea # 矩形区域
---@return integer # 单位数量
function GameAPI.get_unit_num_in_rec_area(area) end

--圆形区域内单位数量
---@param area py.CirArea # 圆形区域
---@return integer # 单位数量
function GameAPI.get_unit_num_in_cir_area(area) end

--不规则区域内单位数量
---@param area py.PolyArea # 不规则区域
---@return integer # 单位数量
function GameAPI.get_unit_num_in_poly_area(area) end

--矩形区域内所有未销毁单位单位
---@param area py.RecArea # 矩形区域
---@return py.UnitGroup # 单位组
function GameAPI.get_unit_group_in_rec_area(area) end

--圆形区域内所有未销毁单位
---@param area py.CirArea # 圆形区域
---@return py.UnitGroup # 单位组
function GameAPI.get_unit_group_in_cir_area(area) end

--不规则区域内所有未销毁单位
---@param area py.CirArea # 不规则区域
---@return py.UnitGroup # 单位组
function GameAPI.get_unit_group_in_poly_area(area) end

--矩形区域内所有物品
---@param area py.RecArea # 矩形区域
---@return py.ItemGroup # 物品组
function GameAPI.get_item_group_in_rec_area(area) end

--圆形区域内所有物品
---@param area py.CirArea # 圆形区域
---@return py.ItemGroup # 物品组
function GameAPI.get_item_group_in_cir_area(area) end

--不规则区域内所有物品
---@param area py.PolyArea # 不规则区域
---@return py.ItemGroup # 物品组
function GameAPI.get_item_group_in_poly_area(area) end

--删除区域
---@param area py.Area # 区域
function GameAPI.remove_area(area) end

--获得区域天气
---@param area py.Area # 区域
---@return integer # 天气类型
function GameAPI.get_area_weather(area) end

--设置区域天气
---@param area py.Area # 区域
---@param weather_type integer # 天气类型
function GameAPI.update_area_weather(area, weather_type) end

--设置点碰撞
---@param point py.Point # 点
---@param is_add boolean # 添加/去除
---@param ground_channel boolean # 地面碰撞
---@param air_channel boolean # 飞行碰撞
function GameAPI.set_point_collision(point, is_add, ground_channel, air_channel) end

--设置区域碰撞
---@param area py.Area # 区域
---@param is_add boolean # 添加/去除
---@param ground_channel boolean # 地面碰撞
---@param air_channel boolean # 飞行碰撞
function GameAPI.set_area_collision(area, is_add, ground_channel, air_channel) end

--编辑区域碰撞
---@param area py.Area # 区域
---@param collision_layer integer # 碰撞类型
---@param is_add boolean # 添加/去除
function GameAPI.edit_area_collision(area, collision_layer, is_add) end

--编辑区域视野阻挡
---@param area py.Area # 区域
---@param fov_block_type integer # 视野阻挡类型
---@param is_add boolean # 添加/去除
function GameAPI.edit_area_fov_block(area, fov_block_type, is_add) end

--设置全局天气
---@param weather_type integer # 天气类型
function GameAPI.update_global_weather(weather_type) end

--获得全局天气
---@return integer # 天气类型
function GameAPI.get_global_weather() end

--打开技能指示器
---@param role py.Role # 玩家
---@param ability py.Ability # 技能
function GameAPI.start_skill_pointer(role, ability) end

--关闭技能指示器
---@param role py.Role # 玩家
---@param ability py.Ability # 技能
function GameAPI.stop_skill_pointer(role, ability) end

--打开技能指示器
---@param role py.Role # 玩家
---@param ability py.Ability # 技能
function GameAPI.create_preview_skill_pointer(role, ability) end

--关闭技能指示器
---@param role py.Role # 玩家
function GameAPI.clear_preview_skill_pointer(role) end

--技能类型指示器
---@param ability_id py.AbilityKey # 技能ID
---@return integer # 指示器类型
function GameAPI.get_ability_key_skill_pointer(ability_id) end

--发送信号
---@param role_or_role_id py.RoleID # 玩家ID
---@param signal_type py.SignalType # 信号类型
---@param world_pos py.Point # 位置
---@param visible_type py.SignalVisibleType # 显示类型
function GameAPI.send_signal(role_or_role_id, signal_type, world_pos, visible_type) end

--根据点光源ID返回点光源
---@param res_id py.LightID # 光源ID
---@return py.PointLight # 点光源
function GameAPI.get_point_light_res_by_res_id(res_id) end

--根据方向光源ID返回方向光源
---@param res_id py.LightID # 光源ID
---@return py.SpotLight # 方向光源
function GameAPI.get_spot_light_res_by_res_id(res_id) end

--创建点光源到点
---@param point py.Point # 点
---@param offset_y? py.Fixed # 偏移高度
---@return py.PointLight # 点光源
function GameAPI.create_point_light_to_point(point, offset_y) end

--创建点光源到单位绑点
---@param unit py.Unit # 单位
---@param socket_name string # 挂节点
---@param offset_y? py.Fixed # 偏移高度
---@return py.PointLight # 点光源
function GameAPI.create_point_light_to_unit_socket(unit, socket_name, offset_y) end

--创建方向光源到点
---@param point py.Point # 点
---@param pos_offset_y? py.Fixed # 起点偏移高度
---@param target? py.Actor # 朝向目标
---@param target_offset_y? py.Fixed # 朝向目标偏移高度
---@return py.SpotLight # 方向光源
function GameAPI.create_spot_light_to_point(point, pos_offset_y, target, target_offset_y) end

--创建方向光源到单位绑点
---@param unit py.Unit # 单位
---@param socket_name string # 挂节点
---@param pos_offset_y? py.Fixed # 起点偏移高度
---@param target? py.Actor # 朝向目标
---@param target_offset_y? py.Fixed # 朝向目标偏移高度
---@return py.SpotLight # 方向光源
function GameAPI.create_spot_light_to_unit_socket(unit, socket_name, pos_offset_y, target, target_offset_y) end

--删除光源
---@param light py.Light # 光源
function GameAPI.remove_light(light) end

--设置光源Float属性
---@param light py.Light # 光源
---@param attr_name string # 属性名
---@param value py.Fixed # 值
function GameAPI.set_light_float_attr_value(light, attr_name, value) end

--获取光源Float属性
---@param light py.Light # 光源
---@param attr_name string # 属性名
---@return py.Fixed # 值
function GameAPI.get_light_float_attr_value(light, attr_name) end

--设置光源是否产生阴影
---@param light py.Light # 光源
---@param value boolean # 值
function GameAPI.set_light_cast_shadow_attr_value(light, value) end

--获取光源是否产生阴影
---@param light py.Light # 光源
---@return boolean # 值
function GameAPI.get_light_cast_shadow_attr_value(light) end

--根据局部雾ID返回局部雾
---@param res_id py.FogID # 雾ID
---@return py.Fog # 雾
function GameAPI.get_fog_res_by_res_id(res_id) end

--修改雾效属性
---@param fog py.Fog # 雾
---@param op_flag integer # 默认参数
---@param yaw? number # 朝向
---@param pos_x? number # 位置x
---@param pos_y? number # 位置y
---@param pos_z? number # 位置z
---@param scale_x? number # 缩放x
---@param scale_y? number # 缩放y
---@param scale_z? number # 缩放z
---@param color_r? number # 颜色r
---@param color_g? number # 颜色g
---@param color_b? number # 颜色b
---@param density? number # 浓度
---@param flow_speed? number # 流速
function GameAPI.set_fog_attr(fog, op_flag, yaw, pos_x, pos_y, pos_z, scale_x, scale_y, scale_z, color_r, color_g, color_b, density, flow_speed) end

--获取固定单位编号的单位组
---@param unit_key py.UnitKey # 单位编号
---@return py.UnitGroup # 单位组
function GameAPI.get_units_by_key(unit_key) end

--单位组内随机整数个单位
---@param units py.UnitGroup # 单位组
---@param n integer # 随机个数
---@return py.UnitGroup # 随机的单位组
function GameAPI.get_random_n_unit_in_group(units, n) end

--单位组内第一个单位
---@param units py.UnitGroup # 单位组
---@return py.Unit # 第一个单位
function GameAPI.get_first_unit_in_group(units) end

--单位组内最后一个单位
---@param units py.UnitGroup # 单位组
---@return py.Unit # 最后一个单位
function GameAPI.get_last_unit_in_group(units) end

--根据属性值从单位组中取整数个单位
---@param units py.UnitGroup # 单位组
---@param attr string # 属性
---@param rise boolean # 是否升序排列
---@param num integer # 单位个数
---@return py.UnitGroup # 单位组
function GameAPI.get_unit_sort_by_attr(units, attr, rise, num) end

--根据距离从单位组中取整数个单位
---@param units py.UnitGroup # 单位组
---@param point py.FPoint # 点
---@param rise boolean # 是否升序排列
---@param num integer # 单位个数
---@return py.UnitGroup # 单位组
function GameAPI.get_unit_sort_by_position(units, point, rise, num) end

--单位组内随机一个单位
---@param units py.UnitGroup # 单位组
---@return py.Unit # 单位
function GameAPI.get_random_unit_in_unit_group(units) end

--技能类型是否受冷却缩减影响
---@param ability_id py.AbilityKey # 技能类型
---@return boolean # 布尔值
function GameAPI.api_get_influenced_by_cd_reduce(ability_id) end

--技能类型的字符串属性
---@param ability_id py.AbilityKey # 技能类型
---@param attr_name py.AbilityStrAttr # 字符串属性
---@return string # 字符串
function GameAPI.get_ability_conf_str_attr(ability_id, attr_name) end

--技能类型的布尔属性
---@param ability_id py.AbilityKey # 技能类型
---@param attr_name string # 布尔属性
---@return boolean # 布尔属性
function GameAPI.get_ability_conf_bool_attr(ability_id, attr_name) end

--技能类型的实数属性
---@param ability_id py.AbilityKey # 技能类型
---@param attr_name string # 实数属性
---@return py.Fixed # 实数
function GameAPI.get_ability_conf_float_attr(ability_id, attr_name) end

--技能类型的整数属性
---@param ability_id py.AbilityKey # 技能类型
---@param attr_name string # 整数属性
---@return integer # 实数
function GameAPI.get_ability_conf_int_attr(ability_id, attr_name) end

--技能类型的公式属性
---@param ability_id py.AbilityKey # 技能类型
---@param attr_name string # 公式属性
---@param level integer # 当前等级
---@param stack_count integer # 当前充能层数
---@param unit_hp_max? py.Fixed # 施法者最大生命值
---@param unit_hp_cur? py.Fixed # 施法者当前生命值
---@return py.Fixed # 实数
function GameAPI.get_ability_conf_formula_attr(ability_id, attr_name, level, stack_count, unit_hp_max, unit_hp_cur) end

--技能类型的公式属性
---@param ability_id py.AbilityKey # 技能类型
---@param attr_name string # 公式属性
---@param level integer # 当前等级
---@param stack_count integer # 当前充能层数
---@param unit? py.Unit # 施法计算单位
---@return py.Fixed # 实数
function GameAPI.get_ability_conf_formula_attr_with_unit(ability_id, attr_name, level, stack_count, unit) end

--技能选取的目标单位
---@param ability py.Ability # 技能
---@param runtime_id? integer # runtime_id
---@return py.Unit # 单位
function GameAPI.get_target_unit_in_ability(ability, runtime_id) end

--技能选取的目标物品
---@param ability py.Ability # 技能
---@param runtime_id? integer # runtime_id
---@return py.Item # 物品
function GameAPI.get_target_item_in_ability(ability, runtime_id) end

--技能选取的目标可破坏物
---@param ability py.Ability # 技能
---@param runtime_id? integer # runtime_id
---@return py.Destructible # 可破坏物
function GameAPI.get_target_dest_in_ability(ability, runtime_id) end

--筛选范围内单位(废弃)
---@param pos py.Vector3 # 坐标
---@param shape py.Shape # 形状
---@return py.UnitGroup # 单位组
function GameAPI.filter_unit_id_list_in_area(pos, shape) end

--筛选范围内单位
---@param pos py.Vector3 # 坐标
---@param shape py.Shape # 形状
---@param belong_role_group? py.Role # 属于玩家或玩家组
---@param visible_role? py.Role # 对玩家可见
---@param invisible_role? py.Role # 对玩家不可见
---@param exclude_unit_group? py.UnitGroup # 不在单位组内
---@param with_tag? string # 具有标签
---@param without_tag? string # 不具有标签
---@param entity_no? py.UnitKey # 单位名称
---@param exclude_unit? py.Unit # 排除单位
---@param unit_type? py.UnitType # 单位种类
---@param in_state? integer # 具有状态
---@param not_in_state? integer # 不具有状态
---@param include_dead? boolean # 是否包括死亡单位
---@param max_count? integer # 数量上限
---@param sort_type? py.SortType # 排序类型
---@return py.UnitGroup # 单位组
function GameAPI.filter_unit_id_list_in_area_v2(pos, shape, belong_role_group, visible_role, invisible_role, exclude_unit_group, with_tag, without_tag, entity_no, exclude_unit, unit_type, in_state, not_in_state, include_dead, max_count, sort_type) end

--筛选范围内投射物
---@param pos py.Vector3 # 坐标
---@param shape py.Shape # 形状
---@param sort_type? py.SortType # 排序类型
---@return py.ProjectileGroup # 投射物组
function GameAPI.filter_projectile_id_list_in_area(pos, shape, sort_type) end

--筛选带有tag的投射物
---@param tag string # tag
---@return py.ProjectileGroup # 投射物组
function GameAPI.get_all_projectiles_with_tag(tag) end

--按阵营编号获取阵营对象
---@param camp_id py.CampID # 阵营编号
---@return py.Camp # 阵营对象
function GameAPI.get_camp_by_camp_id(camp_id) end

--按玩家编号获取阵营编号
---@param role_id py.RoleID # 玩家编号
---@return py.Camp # 阵营编号
function GameAPI.get_camp_id_by_role_id(role_id) end

--按玩家编号获取玩家对象
---@param role_id py.RoleID # 玩家编号
---@return py.Role # 玩家
function GameAPI.get_role_by_role_id(role_id) end

--按整型获取玩家对象
---@param role_id integer # 玩家编号
---@return py.Role # 玩家
function GameAPI.get_role_by_int(role_id) end

--获取阵营存活单位数量
---@param camp_id py.CampID # 阵营编号
---@return integer # 单位数量
function GameAPI.get_alive_unit_num_by_camp_id(camp_id) end

--所有玩家
---@return py.RoleGroup # 玩家组
function GameAPI.get_all_role_ids() end

--阵营所有玩家
---@param camp py.Camp # 阵营对象
---@return py.RoleGroup # 玩家组
function GameAPI.get_role_ids_by_camp(camp) end

--特定类型玩家
---@param role_type integer # 玩家类型
---@return py.RoleGroup # 玩家组
function GameAPI.get_role_ids_by_type(role_type) end

--同盟玩家
---@param role py.Role # 玩家
---@return py.RoleGroup # 玩家组
function GameAPI.get_ally_ids_by_role(role) end

--获取某玩家敌对玩家组
---@param role py.Role # 玩家
---@return py.RoleGroup # 玩家组
function GameAPI.get_enemy_ids_by_role(role) end

--获取获胜玩家组
---@return py.RoleGroup # 玩家组
function GameAPI.get_victorious_role_ids() end

--获取失利玩家组
---@return py.RoleGroup # 玩家组
function GameAPI.get_defeated_role_ids() end

--三维属性是否开启
---@return boolean # 是否开启
function GameAPI.api_if_pri_attr_state_open() end

--判断单位敌对关系
---@param unit1 py.Unit # 单位
---@param unit2 py.Unit # 单位
---@return boolean # 是否敌对
function GameAPI.is_enemy(unit1, unit2) end

--判断单位友军关系
---@param unit1 py.Unit # 单位
---@param unit2 py.Unit # 单位
---@return boolean # 是否友军
function GameAPI.is_ally(unit1, unit2) end

--玩家或单位是否拥有单位的可见性
---@param role_or_unit py.Role # 玩家
---@param unit py.Unit # 单位
---@return boolean # 是否可见
function GameAPI.get_visibility_of_unit(role_or_unit, unit) end

--玩家是否加入游戏
---@param role py.Role # 玩家
---@return boolean # 玩家是否加入游戏
function GameAPI.role_in_game(role) end

--玩家是否拥有收费道具
---@param role py.Role # 玩家
---@param no py.StoreKey # 收费道具key
---@return boolean # 玩家是否拥有收费道具
function GameAPI.role_has_store_item(role, no) end

--玩家下载存档是否回调
---@param role py.Role # 玩家
---@return boolean # 玩家下载存档是否回调
function GameAPI.has_download_save_data_callback(role) end

--获取最近创建的物品
---@return py.Item # 物品对象
function GameAPI.get_last_created_item() end

--创建物品
---@param position py.FVector3 # 位置
---@param num integer # 数量
---@param eid py.ItemKey # 物品编号
---@param player py.Role # 所属玩家
function GameAPI.create_items(position, num, eid, player) end

--根据id获取物品
---@param id py.ItemID # 物品ID
---@return py.Item # 物品
function GameAPI.get_item(id) end

--根据物品id获取物品
---@param item_unit_id integer # unit_id
---@return py.Item # 物品
function GameAPI.get_item_by_unit_id(item_unit_id) end

--获取物品配置名称
---@param key py.ItemKey # item_id
---@return string # 物品名称
function GameAPI.get_item_conf_name(key) end

--创建单个物品
---@param position py.FVector3 # 位置
---@param item_key py.ItemKey # 物品编号
---@param player py.Role # 所属玩家
---@return py.Item # 创建出的物品
function GameAPI.create_item_by_id(position, item_key, player) end

--根据ID获取图片
---@param icon_id integer # 图片ID
---@return py.Texture # 图片
function GameAPI.get_texture_by_icon_id(icon_id) end

--根据图片获取ID
---@param texture py.Texture # 图片
---@return integer # 图片ID
function GameAPI.get_icon_id_by_texture(texture) end

--刷新触发器
function GameAPI.refresh_triggers() end

--激活Lua动态触发器
---@param lua_conf py.Dict # Lua触发器
function GameAPI.enable_global_lua_trigger(lua_conf) end

--根据预设id获取可破坏物
---@param dest_unit_id py.DestructibleID # 预设可破坏物unit_id
---@return py.Destructible # 可破坏物
function GameAPI.get_dest_by_id(dest_unit_id) end

--获取可破坏物类型
---@param dest py.Destructible # 可破坏物
---@return py.DestructibleKey # 可破坏物类型
function GameAPI.get_dest_type(dest) end

--判断可破坏物是否在区域中
---@param dest_id py.Destructible # 可破坏物
---@param area py.Area # 区域
---@return boolean # 布尔值
function GameAPI.is_dest_in_area(dest_id, area) end

--创建可破坏物
---@param location py.FVector3 # 位置
---@param dest_key py.DestructibleKey # 物品编号
---@param angle py.Fixed # 面向角度
---@param size number # 大小
---@return py.Destructible # 创建出的可破坏物
function GameAPI.create_destructible(location, dest_key, angle, size) end

--创建可破坏物
---@param dest_key py.DestructibleKey # 物品编号
---@param location py.FVector3 # 位置
---@param angle py.Fixed # 面向角度
---@param scale_x? py.Fixed # 缩放x
---@param scale_y? py.Fixed # 缩放y
---@param scale_z? py.Fixed # 缩放z
---@param height_offset? py.Fixed # 高度
---@return py.Destructible # 创建出的可破坏物
function GameAPI.create_destructible_new(dest_key, location, angle, scale_x, scale_y, scale_z, height_offset) end

--获取区域内的可破坏物列表
---@param area py.Area # 区域对象
---@return py.List # 可破坏物列表
function GameAPI.get_all_dest_in_area(area) end

--获取点范围内的可破坏物列表
---@param point py.Point # 区域对象
---@param rng number # 半径
---@return py.List # 可破坏物列表
function GameAPI.get_all_dest_in_point_rng(point, rng) end

--获取不同形状范围内的可破坏物列表
---@param point py.Point # 区域对象
---@param shape py.Shape # 形状
---@return py.List # 可破坏物列表
function GameAPI.get_all_dest_in_shapes(point, shape) end

--创建镜头
---@param focus_point py.FVector3 # 点
---@param dis number # 焦距
---@param focus_y? number # 焦点高度
---@param yaw? number # yaw
---@param pitch? number # pitch
---@param fov? number # fov
---@return integer # 镜头ID
function GameAPI.add_camera_conf(focus_point, dis, focus_y, yaw, pitch, fov) end

--应用镜头配置
---@param role py.Role # 玩家
---@param conf_id py.Camera # 镜头配置
---@param duration number # 过渡时间
---@param slope_mode? integer # 镜头移动类型
function GameAPI.apply_camera_conf(role, conf_id, duration, slope_mode) end

--线性移动镜头(时间)
---@param role py.Role # 玩家
---@param point py.FVector3 # 点
---@param duration py.Fixed # 持续时间
---@param acc integer # 加速度
function GameAPI.camera_linear_move_duration(role, point, duration, acc) end

--线性移动镜头(初速度)
---@param role py.Role # 玩家
---@param point py.FVector3 # 点
---@param speed py.Fixed # 初速度
---@param acc integer # 加速度
function GameAPI.camera_linear_move_speed(role, point, speed, acc) end

--让镜头看向某点（镜头位置不变）
---@param role py.Role # 玩家
---@param point py.FVector3 # 点
---@param move_time? py.Fixed # 时间
function GameAPI.camera_look_at(role, point, move_time) end

--设置镜头参数roll
---@param role py.Role # 玩家
---@param roll py.Fixed # 滚动角
---@param move_time? py.Fixed # 时间
function GameAPI.camera_set_param_roll(role, roll, move_time) end

--设置镜头参数pitch
---@param role py.Role # 玩家
---@param pitch py.Fixed # 俯仰角
---@param move_time? py.Fixed # 时间
function GameAPI.camera_set_param_pitch(role, pitch, move_time) end

--设置镜头参数yaw
---@param role py.Role # 玩家
---@param yaw py.Fixed # 导航角
---@param move_time? py.Fixed # 时间
function GameAPI.camera_set_param_yaw(role, yaw, move_time) end

--设置镜头角度参数
---@param role py.Role # 玩家
---@param rotate_type py.CameraRotate # 角度类型
---@param angle py.Fixed # 角度值
---@param move_time? py.Fixed # 时间
function GameAPI.camera_set_param_rotate(role, rotate_type, angle, move_time) end

--设置镜头参数distance
---@param role py.Role # 玩家
---@param distance py.Fixed # 焦点距离
---@param move_time? py.Fixed # 时间
function GameAPI.camera_set_param_distance(role, distance, move_time) end

--旋转镜头俯仰角（角度，时间）
---@param role py.Role # 玩家
---@param angle py.Fixed # 角度
---@param duration py.Fixed # 时间
function GameAPI.camera_rotate_pitch_angle_duration(role, angle, duration) end

--旋转镜头俯仰角（角速度，时间）
---@param role py.Role # 玩家
---@param angle_speed py.Fixed # 角速度
---@param duration py.Fixed # 时间
function GameAPI.camera_rotate_pitch_speed_duration(role, angle_speed, duration) end

--旋转镜头俯仰角（角速度，角度）
---@param role py.Role # 玩家
---@param angle_speed py.Fixed # 角速度
---@param angle py.Fixed # 角度
function GameAPI.camera_rotate_pitch_speed_angle(role, angle_speed, angle) end

--旋转镜头导航角（角度，时间）
---@param role py.Role # 玩家
---@param angle py.Fixed # 角度
---@param duration py.Fixed # 时间
function GameAPI.camera_rotate_yaw_angle_duration(role, angle, duration) end

--旋转镜头导航角（角速度，时间）
---@param role py.Role # 玩家
---@param angle_speed py.Fixed # 角速度
---@param duration py.Fixed # 时间
function GameAPI.camera_rotate_yaw_speed_duration(role, angle_speed, duration) end

--旋转镜头导航角（角速度，角度）
---@param role py.Role # 玩家
---@param angle_speed py.Fixed # 角速度
---@param angle py.Fixed # 角度
function GameAPI.camera_rotate_yaw_speed_angle(role, angle_speed, angle) end

--旋转镜头滚角（角度，时间）
---@param role py.Role # 玩家
---@param angle py.Fixed # 角度
---@param duration py.Fixed # 时间
function GameAPI.camera_rotate_roll_angle_duration(role, angle, duration) end

--旋转镜头滚角（角速度，时间）
---@param role py.Role # 玩家
---@param angle_speed py.Fixed # 角速度
---@param duration py.Fixed # 时间
function GameAPI.camera_rotate_roll_speed_duration(role, angle_speed, duration) end

--旋转镜头滚角（角速度，角度）
---@param role py.Role # 玩家
---@param angle_speed py.Fixed # 角速度
---@param angle py.Fixed # 角度
function GameAPI.camera_rotate_roll_speed_angle(role, angle_speed, angle) end

--镜头摇晃xy
---@param role py.Role # 玩家
---@param amplitude py.Fixed # 摇晃幅度
---@param speed py.Fixed # 摇晃速率
---@param duration py.Fixed # 持续时间
---@param t integer # 摇晃方式
function GameAPI.camera_shake_xy(role, amplitude, speed, duration, t) end

--镜头摇晃z
---@param role py.Role # 玩家
---@param amplitude py.Fixed # 摇晃幅度
---@param speed py.Fixed # 摇晃速率
---@param duration py.Fixed # 持续时间
function GameAPI.camera_shake_z(role, amplitude, speed, duration) end

--镜头摇晃xy
---@param role py.Role # 玩家
---@param amplitude py.Fixed # 摇晃幅度
---@param speed py.Fixed # 摇晃速率
---@param duration py.Fixed # 持续时间
---@param shake_mode integer # 摇晃方式
function GameAPI.camera_shake(role, amplitude, speed, duration, shake_mode) end

--镜头带衰减震动
---@param role py.Role # 玩家
---@param amplitude py.Fixed # 震动幅度
---@param decay py.Fixed # 衰减速率
---@param frequency py.Fixed # 频率
---@param duration py.Fixed # 持续时间
---@param shake_type integer # 震动方式
function GameAPI.camera_shake_with_decay(role, amplitude, decay, frequency, duration, shake_type) end

--镜头限制移动区域
---@param role py.Role # 玩家
---@param area py.Area # 限制区域
function GameAPI.camera_limit_area(role, area) end

--镜头限制移动区域
---@param role py.Role # 玩家
function GameAPI.camera_limit_area_close(role) end

--镜头跟随某个单位
---@param role py.Role # 玩家
---@param unit py.Unit # 跟随单位
---@param offset_x? number # 偏移距离x
---@param offset_y? number # 偏移距离y
---@param offset_height? number # 偏移高度
function GameAPI.camera_set_follow_unit(role, unit, offset_x, offset_y, offset_height) end

--镜头tps跟随某个单位
---@param role py.Role # 玩家
---@param unit py.Unit # 跟随单位
---@param sensitive? number # 灵敏度
---@param pitch? number # 俯仰角
---@param yaw? number # 偏航角
---@param offset_x? number # 偏移距离x
---@param offset_y? number # 偏移距离y
---@param offset_z? number # 偏移高度
---@param distance? number # 摄像机距离
function GameAPI.camera_set_tps_follow_unit(role, unit, sensitive, pitch, yaw, offset_x, offset_y, offset_z, distance) end

--取消镜头tps跟随单位
---@param role py.Role # 玩家
function GameAPI.camera_cancel_tps_follow_unit(role) end

--将玩家相机解除绑定
---@param role py.Role # 玩家
function GameAPI.camera_cancel_follow_unit(role) end

--本地镜头在跟随状态
---@return boolean # 是否跟随
function GameAPI.camera_is_following_target() end

--设置玩家镜头焦点高度
---@param role py.Role # 玩家
---@param y py.Fixed # 高度
---@param move_time? py.Fixed # 时间
function GameAPI.camera_set_focus_y(role, y, move_time) end

--设置玩家相机允许移动
---@param role py.Role # 玩家
function GameAPI.camera_set_move_enable(role) end

--设置玩家相机禁止移动
---@param role py.Role # 玩家
function GameAPI.camera_set_move_not_enable(role) end

--玩家镜头是否正在播放动画
---@param role py.Role # 玩家
---@return boolean # 是否播放动画
function GameAPI.is_cameraIS_playing_timeline(role) end

--播放镜头动画
---@param role py.Role # 玩家
---@param camline_id py.CamlineID # 镜头TimelineID
function GameAPI.play_camera_timeline(role, camline_id) end

--停止播放镜头动画
---@param role py.Role # 玩家
function GameAPI.stop_camera_timeline(role) end

--设置第三人称跟随镜头鼠标控制开关
---@param role py.Role # 玩家
---@param enable boolean # 开关
function GameAPI.set_tps_mode_ctrl(role, enable) end

--向玩家正上方显示提示信息
---@param role py.Role # 玩家
---@param seconds? number # 持续时间
---@param text string # 信息
---@param localize? boolean # 多语言转化
function GameAPI.api_show_text(role, seconds, text, localize) end

--向玩家显示多语言信息
---@param role py.Role # 玩家
---@param text string # 显示信息
---@param second py.Fixed # 持续时间, 单位秒
---@param localize? boolean # 多语言转化
function GameAPI.show_tips_text(role, text, second, localize) end

--API测试记录日志并可选显示
---@param text string # 信息
---@param seconds py.Fixed # 持续时间, 单位秒
---@param show boolean # 是否在屏幕显示
function GameAPI.api_test_log_msg(text, seconds, show) end

--API测试显示UI信息
---@param text string # 信息
---@param seconds py.Fixed # 持续时间, 单位秒
function GameAPI.api_test_show_msg_tip(text, seconds) end

--API测试-向Log添加Assert结果
---@param is_pass boolean # 是否通过
---@param info_str string # 信息
function GameAPI.api_test_add_log_assert_result(is_pass, info_str) end

--Dialog窗口输出信息
---@param type integer # 窗口等级
---@param text string # 打印信息
---@param trigger_info? py.Dict # 字典
function GameAPI.print_to_dialog(type, text, trigger_info) end

--向玩家显示单位对话
---@param unit py.Unit # 单位
---@param role py.Role # 玩家
---@param text string # 信息
---@param second py.Fixed # 持续时间
---@param localize? boolean # 多语言转化
function GameAPI.show_unit_text_to_role(unit, role, text, second, localize) end

--向玩家左下角显示信息
---@param role py.Role # 玩家
---@param text string # 信息
---@param localize? boolean # 多语言转化
function GameAPI.show_msg_to_role(role, text, localize) end

--设置当前聊天框控件
---@param role py.Role # 玩家
---@param comp_uid string # 聊天框id
function GameAPI.set_cur_chatbox(role, comp_uid) end

--按阵营显示游戏结束信息
---@param camp_id py.CampID # 阵营编号
---@param result string # 结束信息
function GameAPI.show_game_end_ui_by_camp_id(camp_id, result) end

--范围内随机整数
---@param min_num integer # 最小值
---@param max_num integer # 最大值
---@return integer # 随机整数
function GameAPI.get_random_int(min_num, max_num) end

--范围内随机定点数
---@param min_num py.Fixed # 最小值
---@param max_num py.Fixed # 最大值
---@return py.Fixed # 随机定点数
function GameAPI.get_random_fixed(min_num, max_num) end

--随机角度
---@return py.Fixed # 随机定点数
function GameAPI.get_random_angle() end

--计算公式类型KV
---@param actor py.Actor # 公式所属对象
---@param k string # key
---@return py.Fixed # 值
function GameAPI.api_calc_formula_kv(actor, k) end

--单位组内所有状态的单位数量
---@param unit_group py.UnitGroup # 单位组
---@return integer # 单位数量
function GameAPI.get_unit_group_num(unit_group) end

--遍历时过滤单位组
---@param unit_group py.UnitGroup # 单位组
---@return py.UnitGroup # 单位组
function GameAPI.refresh_unit_group(unit_group) end

--遍历时过滤投射物组
---@param proj_group py.UnitGroup # 投射物组
---@return py.UnitGroup # 投射物组
function GameAPI.refresh_projectile_group(proj_group) end

--单位组某状态的单位数量
---@param unit_group py.UnitGroup # 单位组
---@param status string # 状态名称
---@return integer # 单位数量
function GameAPI.get_state_unit_num_in_group(unit_group, status) end

--单位组中特定单位编号的单位数量
---@param unit_group py.UnitGroup # 单位组
---@param unit_key py.UnitKey # 单位编号
---@return integer # 无符号整型
function GameAPI.get_num_of_unit_key_in_group(unit_group, unit_key) end

--删除单位组中某种单位
---@param unit_group py.UnitGroup # 单位组
---@param unit_key py.UnitKey # 单位编号
function GameAPI.remove_unit_in_group_by_key(unit_group, unit_key) end

--删除单位组中某个单位
---@param unit_group py.UnitGroup # 单位组
---@param unit py.Unit # 单位
function GameAPI.remove_unit_in_group(unit_group, unit) end

--设置单位组中单位选中
---@param unit_group_id py.UnitGroup # 单位组
function GameAPI.set_unit_group_selected(unit_group_id) end

--单位编号池添加单位编号
---@param pool py.UnitKeyPool # 单位编号池
---@param key py.UnitKey # 单位编号
---@param pro py.Fixed # 定点数
function GameAPI.unit_key_pool_add_key(pool, key, pro) end

--单位编号池删除单位编号
---@param pool py.UnitKeyPool # 单位编号池
---@param key py.UnitKey # 单位编号
function GameAPI.unit_key_pool_rem_key(pool, key) end

--单位编号池返回单位编号
---@param pool py.UnitKeyPool # 单位编号池
---@return py.UnitKey # 单位编号
function GameAPI.get_unit_key_from_pool(pool) end

--获取单位预设库配置的图标路径
---@param key py.UnitKey # 单位编号
---@return string # 图标
function GameAPI.get_unit_key_icon(key) end

--获取物品预设库配置的图标路径
---@param key py.ItemKey # 物品编号
---@return string # 图标
function GameAPI.get_item_key_icon(key) end

--获取单位预设库配置的图片路径
---@param key py.UnitKey # 单位编号
---@param pic_type string # 图片类型
---@return string # 图片
function GameAPI.get_unit_key_pic(key, pic_type) end

--获取单位预设库配置的类型为字符串的属性
---@param unit_key py.UnitKey # 单位编号
---@param attr string # 属性名称
---@return string # 字符串属性值
function GameAPI.get_unit_key_str(unit_key, attr) end

--获取单位预设库配置的类型为实数的属性
---@param unit_key py.UnitKey # 单位编号
---@param attr string # 属性名称
---@return py.Fixed # 实数属性值
function GameAPI.get_unit_key_fixed(unit_key, attr) end

--根据UID获取预设库配置的图标路径
---@param icon_uid string # 图标唯一ID
---@return string # 图标
function GameAPI.get_icon_by_uid(icon_uid) end

--获取技能预设库配置的图标路径
---@param key py.AbilityKey # 技能编号
---@return string # 图标
function GameAPI.get_ability_key_icon(key) end

--变量长度
---@param var py.List # 变量
---@return integer # 变量长度
function GameAPI.len_of_var(var) end

--获取三维属性的slave系数
---@param pri string # 三维属性
---@param slave string # slave属性
---@return py.Fixed # slave系数
function GameAPI.get_slave_coeff(pri, slave) end

--设置三维属性的slave系数
---@param pri string # 三维属性
---@param slave string # slave属性
---@param coeff py.Fixed # slave系数
function GameAPI.set_slave_coeff(pri, slave, coeff) end

--攻击类型和防御类型对应的伤害系数
---@param attack_idx integer # 攻击类型
---@param armor_idx integer # 防御类型
---@return py.Fixed # 伤害系数
function GameAPI.get_damage_ratio(attack_idx, armor_idx) end

--设置攻击类型和防御类型对应的伤害系数
---@param attack_idx integer # 攻击类型
---@param armor_idx integer # 防御类型
---@param damage_ratio py.Fixed # 伤害系数
function GameAPI.set_damage_ratio(attack_idx, armor_idx, damage_ratio) end

--应用伤害
---@param source_unit? py.Unit # 伤害者
---@param ability? py.Ability # 来源关联技能
---@param target_unit? py.Unit # 单位或者物品
---@param damage_type? integer # 伤害类型
---@param damage? py.Fixed # 伤害值
---@param jump_word? boolean # 是否跳字
---@param extra_context? py.Actor # extra_data
---@param as_normal_hit? boolean # 视为普攻
---@param critical? boolean # 必定暴击
---@param no_miss? boolean # 无视闪避
---@param hit_sfx? py.SfxKey # 受击特效
---@param hit_socket string # 挂接点
---@param harm_text_enum string # 跳字枚举
function GameAPI.apply_damage(source_unit, ability, target_unit, damage_type, damage, jump_word, extra_context, as_normal_hit, critical, no_miss, hit_sfx, hit_socket, harm_text_enum) end

--攻击伤害绝对值
---@param damage py.Fixed # 伤害值
---@return py.Fixed # 伤害绝对值
function GameAPI.get_hurt_damage(damage) end

--设置当前攻击伤害的数值
---@param damage py.Fixed # 伤害值
function GameAPI.set_cur_damage(damage) end

--获取当次攻击是否闪避
---@param damage_result_state integer # damage_result_state
---@return boolean # 伤害绝对值
function GameAPI.get_cur_damage_is_miss(damage_result_state) end

--设置当前是否闪避
---@param is_miss boolean # 是否闪避
function GameAPI.set_cur_damage_is_miss(is_miss) end

--设置当前治疗的数值
---@param value py.Fixed # 治疗值
function GameAPI.set_cur_cure_value(value) end

--启动行为树
---@param unit py.Unit # 单位
---@param tree_name string # 行为树名称
---@param tree_args py.Dict # 行为树参数
function GameAPI.assign_behavior_tree(unit, tree_name, tree_args) end

--停止一棵行为树
---@param unit py.Unit # 单位
---@param tree_name string # 行为树名称
function GameAPI.stop_behavior_tree(unit, tree_name) end

--停止所有行为树
---@param unit py.Unit # 单位
function GameAPI.stop_all_behavior_tree(unit) end

--运行一次行为树
---@param unit py.Unit # 单位
---@param tree_name string # 行为树名称
---@param tree_args py.Dict # 行为树参数
function GameAPI.run_behavior_tree_once(unit, tree_name, tree_args) end

--预设库单位删除键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键值名称
function GameAPI.unit_key_del_kv(unit_key, key) end

--预设库技能删除键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键值名称
function GameAPI.ability_key_del_kv(ability_key, key) end

--预设库物品删除键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键值名称
function GameAPI.item_key_del_kv(item_key, key) end

--设置物品商品售价
---@param item_no py.ItemKey # 物品编号
---@param res_type py.RoleResKey # 资源类型
---@param price number # 售价
function GameAPI.set_item_buy_price(item_no, res_type, price) end

--设置物品商品出售资源获得
---@param item_no py.ItemKey # 物品编号
---@param res_type py.RoleResKey # 资源类型
---@param price number # 出售资源获得
function GameAPI.set_item_sell_price(item_no, res_type, price) end

--设置单位商品售价
---@param entity_no py.UnitKey # 单位编号
---@param res_type py.RoleResKey # 资源类型
---@param price number # 售价
function GameAPI.set_unit_buy_price(entity_no, res_type, price) end

--设置单位商品出售资源获得
---@param entity_no py.UnitKey # 单位编号
---@param res_type py.RoleResKey # 资源类型
---@param price number # 出售资源获得
function GameAPI.set_unit_sell_price(entity_no, res_type, price) end

--获取物品商品售价
---@param item_no py.ItemKey # 物品编号
---@param res_type py.RoleResKey # 资源类型
---@return py.Fixed # 售价
function GameAPI.get_item_buy_price(item_no, res_type) end

--获取物品商品出售资源获得
---@param item_no py.ItemKey # 物品编号
---@param res_type py.RoleResKey # 资源类型
---@return py.Fixed # 出售资源获得
function GameAPI.get_item_sell_price(item_no, res_type) end

--获取单位商品售价
---@param entity_no py.UnitKey # 单位编号
---@param res_type py.RoleResKey # 资源类型
---@return py.Fixed # 售价
function GameAPI.get_unit_buy_price(entity_no, res_type) end

--获取单位商品出售资源获得
---@param entity_no py.UnitKey # 单位编号
---@param res_type py.RoleResKey # 资源类型
---@return py.Fixed # 出售资源获得
function GameAPI.get_unit_sell_price(entity_no, res_type) end

--返回矩形区域中心点
---@param rec py.RecArea # 矩形区域
---@return py.FVector3 # 中心点
function GameAPI.get_rec_center_point(rec) end

--返回圆形区域中心点
---@param cir py.CirArea # 圆形区域
---@return py.FVector3 # 中心点
function GameAPI.get_circle_center_point(cir) end

--返回矩形区域内随机点
---@param area py.RecArea # 矩形区域
---@return py.FVector3 # 随机点
function GameAPI.get_random_point_in_rec_area(area) end

--返回圆形区域内随机点
---@param area py.CirArea # 圆形区域
---@return py.FVector3 # 随机点
function GameAPI.get_random_point_in_circular_area(area) end

--返回多边形区域内随机点
---@param area py.PolyArea # 不规则区域
---@return py.FVector3 # 随机点
function GameAPI.get_random_point_in_poly_area(area) end

--最近创建的圆型区域
---@return py.CirArea # 圆型区域
function GameAPI.get_cir_area_last_created() end

--通过资源id返回路径
---@param res_id integer # 资源ID
---@return py.Road # 路径
function GameAPI.get_road_point_list_by_res_id(res_id) end

--在某点创建一条路径
---@param point py.Point # 点
---@return py.Road # 路径
function GameAPI.create_road_point_list(point) end

--移除路径
---@param road py.Road # 路径
function GameAPI.remove_road_point_list(road) end

--给路径添加点
---@param road_point_list py.Road # 路径
---@param num integer # 序号
---@param point py.Point # 点
function GameAPI.add_road_point(road_point_list, num, point) end

--移除路径点
---@param road_point_list py.Road # 路径
---@param num integer # 序号
function GameAPI.remove_road_point(road_point_list, num) end

--获取某点的最近路径
---@param point py.Point # 位置
---@return py.Road # 路径
function GameAPI.get_nearest_road_point_list_by_pos(point) end

--获取某路径偏移后的路径
---@param origin_roads py.Road # 原始路径
---@param offset py.Fixed # 偏移距离
---@return py.Road # 路径
function GameAPI.get_road_point_list_by_offset(origin_roads, offset) end

--获取某路径循环n次后的路径
---@param point_list py.Road # 原始路径
---@param n integer # 循环次数
---@return py.Road # 路径
function GameAPI.get_road_point_list_loop(point_list, n) end

--获取两路径拼接后的路径
---@param pl1 py.Road # 原始路径
---@param pl2 py.Road # 原始路径
---@return py.Road # 路径
function GameAPI.get_road_point_list_join(pl1, pl2) end

--获取某路径反转后的路径
---@param point_list py.Road # 原始路径
---@return py.Road # 路径
function GameAPI.get_road_point_list_inversion(point_list) end

--获取路径中点的数量
---@param road_point_list py.Road # 路径
---@return integer # 数量
function GameAPI.get_road_point_num(road_point_list) end

--最近创建单位实体
---@return py.Unit # 单位实体
function GameAPI.get_last_created_unit() end

--最近创建子触发器
---@return integer # 子触发器ID
function GameAPI.get_last_created_trigger() end

--最近创建投射物
---@return py.Unit # 投射物
function GameAPI.get_last_created_projectile() end

--得到区域内的单位id列表
---@param area py.Area # 区域对象
---@return py.List # 单位ID列表
function GameAPI.get_unit_group_in_area(area) end

--获取区域内玩家所有单位id列表
---@param area py.Area # 区域对象
---@param role py.Role # 玩家
---@return py.UnitGroup # 单位id列表
function GameAPI.get_unit_group_belong_to_player_in_area(area, role) end

--得到区域内的物品对象id列表
---@param area py.Area # 区域对象
---@return py.ItemGroup # 物品组
function GameAPI.get_item_group_in_area(area) end

--获取指定形状内的所有物品
---@param point py.Point # 区域对象
---@param shape py.Shape # 形状
---@param sort_type? py.SortType # 排序类型
---@return py.ItemGroup # 物品组
function GameAPI.get_all_items_in_shapes(point, shape, sort_type) end
