-- 此文件由 `tools/genGameAPI` 生成，请勿手动修改。
---@meta

---@class py.GameAPI
GameAPI = {}

--添加快速标签
---@param tag_idx integer # 标签ID
function GameAPI.api_add_quick_tag(tag_idx) end

--移除快速标签
---@param tag_idx integer # 标签ID
function GameAPI.api_remove_quick_tag(tag_idx) end

--检查是否有快速标签
---@param tag_idx integer # 标签ID
---@return boolean # 是否有该标签
function GameAPI.api_has_quick_tag(tag_idx) end

--预设库单位删除键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键值名称
function GameAPI.del_unit_key_kv(unit_key, key) end

--预设库技能删除键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键值名称
function GameAPI.del_ability_key_kv(ability_key, key) end

--预设库物品删除键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键值名称
function GameAPI.del_item_key_kv(item_key, key) end

--预设库物品删除键值对
---@param item_key integer # 物品编号
---@param key string # 键值名称
---@param prefab_conf_key integer # prefab库ID
function GameAPI.del_prefab_key_kv(item_key, key, prefab_conf_key) end

--预设库 添加BOOLEAN键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value boolean # value
function GameAPI.set_prefab_key_boolean_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加INTEGER键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value integer # value
function GameAPI.set_prefab_key_integer_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加FLOAT键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.Fixed # value
function GameAPI.set_prefab_key_float_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加STRING键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value string # value
function GameAPI.set_prefab_key_string_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加UI_COMP键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value string # value
function GameAPI.set_prefab_key_ui_comp_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加UI_COMP_TYPE键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value integer # value
function GameAPI.set_prefab_key_ui_comp_type_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加UI_COMP_EVENT_TYPE键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value integer # value
function GameAPI.set_prefab_key_ui_comp_event_type_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加UI_COMP_ATTR键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value string # value
function GameAPI.set_prefab_key_ui_comp_attr_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加UI_COMP_ALIGN_TYPE键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value integer # value
function GameAPI.set_prefab_key_ui_comp_align_type_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加UI_PREFAB键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value string # value
function GameAPI.set_prefab_key_ui_prefab_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加UI_PREFAB_INSTANCE键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.UIPrefabIns # value
function GameAPI.set_prefab_key_ui_prefab_instance_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加UI_PREFAB_INS_UID键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value string # value
function GameAPI.set_prefab_key_ui_prefab_ins_uid_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加UI_DIRECTION键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value integer # value
function GameAPI.set_prefab_key_ui_direction_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加UI_MODEL_CAMERA_MOD键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value integer # value
function GameAPI.set_prefab_key_ui_model_camera_mod_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加UI_BTN_STATUS键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value integer # value
function GameAPI.set_prefab_key_ui_btn_status_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加UI_SCROLLVIEW_TYPE键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value integer # value
function GameAPI.set_prefab_key_ui_scrollview_type_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加UI_GRIDVIEW_TYPE键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value integer # value
function GameAPI.set_prefab_key_ui_gridview_type_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加UI_GRIDVIEW_BAR_TYPE键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value integer # value
function GameAPI.set_prefab_key_ui_gridview_bar_type_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加UI_EFFECT_CAMERA_MODE键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value integer # value
function GameAPI.set_prefab_key_ui_effect_camera_mode_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加UI_EQUIP_SLOT_USE_TYPE键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value integer # value
function GameAPI.set_prefab_key_ui_equip_slot_use_type_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加UI_EQUIP_SLOT_DRAG_TYPE键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value integer # value
function GameAPI.set_prefab_key_ui_equip_slot_drag_type_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加UI_LAYOUT_CLIPPING_TYPE键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value integer # value
function GameAPI.set_prefab_key_ui_layout_clipping_type_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加UI_TEXT_OVER_LENGTH_HANDLING_TYPE键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value integer # value
function GameAPI.set_prefab_key_ui_text_over_length_handling_type_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加UI_POS_ADAPT_MODE键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value integer # value
function GameAPI.set_prefab_key_ui_pos_adapt_mode_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加UI_ANIM键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.UIAnimKey # value
function GameAPI.set_prefab_key_ui_anim_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加UI_ANIM_CURVE键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value integer # value
function GameAPI.set_prefab_key_ui_anim_curve_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加UI_ANIM_PLAY_MODE键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value integer # value
function GameAPI.set_prefab_key_ui_anim_play_mode_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加UI_TEXT_FONT_NAME键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value string # value
function GameAPI.set_prefab_key_ui_text_font_name_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加UI_ECA_ANIM_TYPE键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value integer # value
function GameAPI.set_prefab_key_ui_eca_anim_type_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加AUDIO_CHANNEL键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value integer # value
function GameAPI.set_prefab_key_audio_channel_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加UNIT_ENTITY键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.Unit # value
function GameAPI.set_prefab_key_unit_entity_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加UNIT_GROUP键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.UnitGroup # value
function GameAPI.set_prefab_key_unit_group_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加UNIT_NAME键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.UnitKey # value
function GameAPI.set_prefab_key_unit_name_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加UNIT_NAME_POOL键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.UnitKeyPool # value
function GameAPI.set_prefab_key_unit_name_pool_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加UNIT_WRITE_ATTRIBUTE键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value string # value
function GameAPI.set_prefab_key_unit_write_attribute_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加ATTR_ELEMENT键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value string # value
function GameAPI.set_prefab_key_attr_element_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加ATTR_ELEMENT_READ键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value string # value
function GameAPI.set_prefab_key_attr_element_read_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加MOVER_ENTITY键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.Mover # value
function GameAPI.set_prefab_key_mover_entity_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加IMAGE_QUALITY键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value string # value
function GameAPI.set_prefab_key_image_quality_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加WINDOW_TYPE_SETTING键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value string # value
function GameAPI.set_prefab_key_window_type_setting_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加DAMAGE_ATTACK_TYPE键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value integer # value
function GameAPI.set_prefab_key_damage_attack_type_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加ITEM_ENTITY键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.Item # value
function GameAPI.set_prefab_key_item_entity_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加ITEM_GROUP键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.ItemGroup # value
function GameAPI.set_prefab_key_item_group_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加ITEM_NAME键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.ItemKey # value
function GameAPI.set_prefab_key_item_name_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加ITEM_STACK_TYPE键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.ItemStackType # value
function GameAPI.set_prefab_key_item_stack_type_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加ABILITY键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.Ability # value
function GameAPI.set_prefab_key_ability_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加ABILITY_TYPE键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value integer # value
function GameAPI.set_prefab_key_ability_type_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加ABILITY_CAST_TYPE键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value integer # value
function GameAPI.set_prefab_key_ability_cast_type_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加ABILITY_NAME键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.AbilityKey # value
function GameAPI.set_prefab_key_ability_name_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加SLOT_TYPE键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.SlotType # value
function GameAPI.set_prefab_key_slot_type_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加SKILL_POINTER_TYPE键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value integer # value
function GameAPI.set_prefab_key_skill_pointer_type_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加MODIFIER_ENTITY键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.ModifierEntity # value
function GameAPI.set_prefab_key_modifier_entity_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加MODIFIER_TYPE键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.ModifierType # value
function GameAPI.set_prefab_key_modifier_type_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加MODIFIER_EFFECT_TYPE键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.ModifierEffectType # value
function GameAPI.set_prefab_key_modifier_effect_type_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加MODIFIER键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.ModifierKey # value
function GameAPI.set_prefab_key_modifier_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加PROJECTILE键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.ProjectileKey # value
function GameAPI.set_prefab_key_projectile_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加PROJECTILE_ENTITY键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.ProjectileEntity # value
function GameAPI.set_prefab_key_projectile_entity_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加PROJECTILE_GROUP键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.ProjectileGroup # value
function GameAPI.set_prefab_key_projectile_group_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加DESTRUCTIBLE_ENTITY键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.Destructible # value
function GameAPI.set_prefab_key_destructible_entity_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加DESTRUCTIBLE_NAME键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.DestructibleKey # value
function GameAPI.set_prefab_key_destructible_name_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加SOUND_ENTITY键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.SoundEntity # value
function GameAPI.set_prefab_key_sound_entity_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加AUDIO_KEY键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.AudioKey # value
function GameAPI.set_prefab_key_audio_key_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加GAME_MODE键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.GameMode # value
function GameAPI.set_prefab_key_game_mode_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加PLAYER键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.Role # value
function GameAPI.set_prefab_key_player_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加PLAYER_GROUP键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.RoleGroup # value
function GameAPI.set_prefab_key_player_group_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加ROLE_RES_KEY键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.RoleResKey # value
function GameAPI.set_prefab_key_role_res_key_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加ROLE_STATUS键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.RoleStatus # value
function GameAPI.set_prefab_key_role_status_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加ROLE_TYPE键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.RoleType # value
function GameAPI.set_prefab_key_role_type_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加ROLE_RELATION键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.RoleRelation # value
function GameAPI.set_prefab_key_role_relation_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加TEAM键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.Camp # value
function GameAPI.set_prefab_key_team_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加POINT键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.FPoint # value
function GameAPI.set_prefab_key_point_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加VECTOR3键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.FVector3 # value
function GameAPI.set_prefab_key_vector3_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加ROTATION键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.FRotation # value
function GameAPI.set_prefab_key_rotation_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加POINT_LIST键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.Road # value
function GameAPI.set_prefab_key_point_list_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加RECTANGLE键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.RecArea # value
function GameAPI.set_prefab_key_rectangle_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加ROUND_AREA键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.CirArea # value
function GameAPI.set_prefab_key_round_area_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加POLYGON键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.PolyArea # value
function GameAPI.set_prefab_key_polygon_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加CAMERA键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.Camera # value
function GameAPI.set_prefab_key_camera_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加CAMLINE键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.CamlineID # value
function GameAPI.set_prefab_key_camline_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加POINT_LIGHT键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.PointLight # value
function GameAPI.set_prefab_key_point_light_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加SPOT_LIGHT键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.SpotLight # value
function GameAPI.set_prefab_key_spot_light_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加FOG键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.Fog # value
function GameAPI.set_prefab_key_fog_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加SCENE_SOUND键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.SceneSound # value
function GameAPI.set_prefab_key_scene_sound_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加ATTACH_MODEL_ENTITY键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.AttachModelEntity # value
function GameAPI.set_prefab_key_attach_model_entity_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加MODEL键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.ModelKey # value
function GameAPI.set_prefab_key_model_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加LIVE2D键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.Live2dKey # value
function GameAPI.set_prefab_key_live2d_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加SFX_ENTITY键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.Sfx # value
function GameAPI.set_prefab_key_sfx_entity_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加SFX_KEY键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.SfxKey # value
function GameAPI.set_prefab_key_sfx_key_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加LINK_SFX_ENTITY键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.LinkSfx # value
function GameAPI.set_prefab_key_link_sfx_entity_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加LINK_SFX_KEY键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.LinkSfxKey # value
function GameAPI.set_prefab_key_link_sfx_key_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加CURSOR_KEY键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.CursorKey # value
function GameAPI.set_prefab_key_cursor_key_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加ANGLE键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.Fixed # value
function GameAPI.set_prefab_key_angle_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加TEXTURE键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.Texture # value
function GameAPI.set_prefab_key_texture_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加SEQUENCE键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.Sequence # value
function GameAPI.set_prefab_key_sequence_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加SPINE键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.Spine # value
function GameAPI.set_prefab_key_spine_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加PHYSICS_OBJECT键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.PhysicsObject # value
function GameAPI.set_prefab_key_physics_object_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加PHYSICS_ENTITY键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.PhysicsEntity # value
function GameAPI.set_prefab_key_physics_entity_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加PHYSICS_OBJECT_KEY键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.PhysicsObjectKey # value
function GameAPI.set_prefab_key_physics_object_key_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加PHYSICS_ENTITY_KEY键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.PhysicsEntityKey # value
function GameAPI.set_prefab_key_physics_entity_key_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加RIGID_BODY键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.RigidBody # value
function GameAPI.set_prefab_key_rigid_body_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加RIGID_BODY_GROUP键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.RigidBodyGroup # value
function GameAPI.set_prefab_key_rigid_body_group_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加COLLIDER键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.Collider # value
function GameAPI.set_prefab_key_collider_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加JOINT键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.Joint # value
function GameAPI.set_prefab_key_joint_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加REACTION键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.Reaction # value
function GameAPI.set_prefab_key_reaction_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加REACTION_GROUP键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.ReactionGroup # value
function GameAPI.set_prefab_key_reaction_group_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加DYNAMIC_TRIGGER_INSTANCE键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.DynamicTriggerInstance # value
function GameAPI.set_prefab_key_dynamic_trigger_instance_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加TABLE键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.Table # value
function GameAPI.set_prefab_key_table_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加RANDOM_POOL键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.RandomPool # value
function GameAPI.set_prefab_key_random_pool_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加SCENE_UI键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.SceneNode # value
function GameAPI.set_prefab_key_scene_ui_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加DAMAGE_TYPE键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value integer # value
function GameAPI.set_prefab_key_damage_type_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加HARM_TEXT_TYPE_NEW键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value string # value
function GameAPI.set_prefab_key_harm_text_type_new_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加FONT_TYPE键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value string # value
function GameAPI.set_prefab_key_font_type_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加JUMP_WORD_TRACK键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value integer # value
function GameAPI.set_prefab_key_jump_word_track_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加NEW_TIMER键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.Timer # value
function GameAPI.set_prefab_key_new_timer_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加TECH_KEY键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.TechKey # value
function GameAPI.set_prefab_key_tech_key_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加STORE_KEY键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.StoreKey # value
function GameAPI.set_prefab_key_store_key_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加KEYBOARD_KEY键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.KeyboardKey # value
function GameAPI.set_prefab_key_keyboard_key_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加FUNC_KEYBOARD_KEY键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.FuncKeyboardKey # value
function GameAPI.set_prefab_key_func_keyboard_key_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加MOUSE_KEY键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.MouseKey # value
function GameAPI.set_prefab_key_mouse_key_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加MOUSE_WHEEL键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.MouseWheel # value
function GameAPI.set_prefab_key_mouse_wheel_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加MAP键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.Map # value
function GameAPI.set_prefab_key_map_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加POST_EFFECT键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.PostEffect # value
function GameAPI.set_prefab_key_post_effect_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加UNIT_TYPE键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.UnitType # value
function GameAPI.set_prefab_key_unit_type_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加UNIT_COMMAND_TYPE键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.UnitCommandType # value
function GameAPI.set_prefab_key_unit_command_type_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加UNIT_GROUP_COMMAND_TYPE键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.UnitGroupCommandType # value
function GameAPI.set_prefab_key_unit_group_command_type_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加MINI_MAP_COLOR_TYPE键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.MiniMapColorType # value
function GameAPI.set_prefab_key_mini_map_color_type_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加UNIT_BEHAVIOR键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.UnitBehavior # value
function GameAPI.set_prefab_key_unit_behavior_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加CURVED_PATH键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.CurvedPath # value
function GameAPI.set_prefab_key_curved_path_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加CURVED_PATH_3D键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.CurvedPath3D # value
function GameAPI.set_prefab_key_curved_path_3d_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加RESCUE_SEEKER_TYPE键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.ERescueSeekerType # value
function GameAPI.set_prefab_key_rescue_seeker_type_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加RESCUER_TYPE键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.ERescuerType # value
function GameAPI.set_prefab_key_rescuer_type_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加STORE_ITEM_TYPE键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.StoreItemType # value
function GameAPI.set_prefab_key_store_item_type_kv(prefab_conf_key, item_key, key, value) end

--添加BOOLEAN键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? boolean # value
function GameAPI.add_boolean_kv(kvbase, key, item) end

--添加INTEGER键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? integer # value
function GameAPI.add_integer_kv(kvbase, key, item) end

--添加FLOAT键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.Fixed # value
function GameAPI.add_float_kv(kvbase, key, item) end

--添加STRING键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? string # value
function GameAPI.add_string_kv(kvbase, key, item) end

--添加UI_COMP键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? string # value
function GameAPI.add_ui_comp_kv(kvbase, key, item) end

--添加UI_COMP_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? integer # value
function GameAPI.add_ui_comp_type_kv(kvbase, key, item) end

--添加UI_COMP_EVENT_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? integer # value
function GameAPI.add_ui_comp_event_type_kv(kvbase, key, item) end

--添加UI_COMP_ATTR键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? string # value
function GameAPI.add_ui_comp_attr_kv(kvbase, key, item) end

--添加UI_COMP_ALIGN_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? integer # value
function GameAPI.add_ui_comp_align_type_kv(kvbase, key, item) end

--添加UI_PREFAB键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? string # value
function GameAPI.add_ui_prefab_kv(kvbase, key, item) end

--添加UI_PREFAB_INSTANCE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.UIPrefabIns # value
function GameAPI.add_ui_prefab_instance_kv(kvbase, key, item) end

--添加UI_PREFAB_INS_UID键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? string # value
function GameAPI.add_ui_prefab_ins_uid_kv(kvbase, key, item) end

--添加UI_DIRECTION键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? integer # value
function GameAPI.add_ui_direction_kv(kvbase, key, item) end

--添加UI_MODEL_CAMERA_MOD键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? integer # value
function GameAPI.add_ui_model_camera_mod_kv(kvbase, key, item) end

--添加UI_BTN_STATUS键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? integer # value
function GameAPI.add_ui_btn_status_kv(kvbase, key, item) end

--添加UI_SCROLLVIEW_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? integer # value
function GameAPI.add_ui_scrollview_type_kv(kvbase, key, item) end

--添加UI_GRIDVIEW_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? integer # value
function GameAPI.add_ui_gridview_type_kv(kvbase, key, item) end

--添加UI_GRIDVIEW_BAR_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? integer # value
function GameAPI.add_ui_gridview_bar_type_kv(kvbase, key, item) end

--添加UI_EFFECT_CAMERA_MODE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? integer # value
function GameAPI.add_ui_effect_camera_mode_kv(kvbase, key, item) end

--添加UI_EQUIP_SLOT_USE_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? integer # value
function GameAPI.add_ui_equip_slot_use_type_kv(kvbase, key, item) end

--添加UI_EQUIP_SLOT_DRAG_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? integer # value
function GameAPI.add_ui_equip_slot_drag_type_kv(kvbase, key, item) end

--添加UI_LAYOUT_CLIPPING_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? integer # value
function GameAPI.add_ui_layout_clipping_type_kv(kvbase, key, item) end

--添加UI_TEXT_OVER_LENGTH_HANDLING_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? integer # value
function GameAPI.add_ui_text_over_length_handling_type_kv(kvbase, key, item) end

--添加UI_POS_ADAPT_MODE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? integer # value
function GameAPI.add_ui_pos_adapt_mode_kv(kvbase, key, item) end

--添加UI_ANIM键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.UIAnimKey # value
function GameAPI.add_ui_anim_kv(kvbase, key, item) end

--添加UI_ANIM_CURVE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? integer # value
function GameAPI.add_ui_anim_curve_kv(kvbase, key, item) end

--添加UI_ANIM_PLAY_MODE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? integer # value
function GameAPI.add_ui_anim_play_mode_kv(kvbase, key, item) end

--添加UI_TEXT_FONT_NAME键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? string # value
function GameAPI.add_ui_text_font_name_kv(kvbase, key, item) end

--添加UI_ECA_ANIM_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? integer # value
function GameAPI.add_ui_eca_anim_type_kv(kvbase, key, item) end

--添加AUDIO_CHANNEL键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? integer # value
function GameAPI.add_audio_channel_kv(kvbase, key, item) end

--添加UNIT_ENTITY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.Unit # value
function GameAPI.add_unit_entity_kv(kvbase, key, item) end

--添加UNIT_GROUP键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.UnitGroup # value
function GameAPI.add_unit_group_kv(kvbase, key, item) end

--添加UNIT_NAME键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.UnitKey # value
function GameAPI.add_unit_name_kv(kvbase, key, item) end

--添加UNIT_NAME_POOL键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.UnitKeyPool # value
function GameAPI.add_unit_name_pool_kv(kvbase, key, item) end

--添加UNIT_WRITE_ATTRIBUTE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? string # value
function GameAPI.add_unit_write_attribute_kv(kvbase, key, item) end

--添加ATTR_ELEMENT键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? string # value
function GameAPI.add_attr_element_kv(kvbase, key, item) end

--添加ATTR_ELEMENT_READ键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? string # value
function GameAPI.add_attr_element_read_kv(kvbase, key, item) end

--添加MOVER_ENTITY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.Mover # value
function GameAPI.add_mover_entity_kv(kvbase, key, item) end

--添加IMAGE_QUALITY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? string # value
function GameAPI.add_image_quality_kv(kvbase, key, item) end

--添加WINDOW_TYPE_SETTING键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? string # value
function GameAPI.add_window_type_setting_kv(kvbase, key, item) end

--添加DAMAGE_ATTACK_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? integer # value
function GameAPI.add_damage_attack_type_kv(kvbase, key, item) end

--添加ITEM_ENTITY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.Item # value
function GameAPI.add_item_entity_kv(kvbase, key, item) end

--添加ITEM_GROUP键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.ItemGroup # value
function GameAPI.add_item_group_kv(kvbase, key, item) end

--添加ITEM_NAME键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.ItemKey # value
function GameAPI.add_item_name_kv(kvbase, key, item) end

--添加ITEM_STACK_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.ItemStackType # value
function GameAPI.add_item_stack_type_kv(kvbase, key, item) end

--添加ABILITY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.Ability # value
function GameAPI.add_ability_kv(kvbase, key, item) end

--添加ABILITY_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? integer # value
function GameAPI.add_ability_type_kv(kvbase, key, item) end

--添加ABILITY_CAST_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? integer # value
function GameAPI.add_ability_cast_type_kv(kvbase, key, item) end

--添加ABILITY_NAME键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.AbilityKey # value
function GameAPI.add_ability_name_kv(kvbase, key, item) end

--添加SLOT_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.SlotType # value
function GameAPI.add_slot_type_kv(kvbase, key, item) end

--添加SKILL_POINTER_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? integer # value
function GameAPI.add_skill_pointer_type_kv(kvbase, key, item) end

--添加MODIFIER_ENTITY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.ModifierEntity # value
function GameAPI.add_modifier_entity_kv(kvbase, key, item) end

--添加MODIFIER_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.ModifierType # value
function GameAPI.add_modifier_type_kv(kvbase, key, item) end

--添加MODIFIER_EFFECT_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.ModifierEffectType # value
function GameAPI.add_modifier_effect_type_kv(kvbase, key, item) end

--添加MODIFIER键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.ModifierKey # value
function GameAPI.add_modifier_kv(kvbase, key, item) end

--添加PROJECTILE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.ProjectileKey # value
function GameAPI.add_projectile_kv(kvbase, key, item) end

--添加PROJECTILE_ENTITY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.ProjectileEntity # value
function GameAPI.add_projectile_entity_kv(kvbase, key, item) end

--添加PROJECTILE_GROUP键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.ProjectileGroup # value
function GameAPI.add_projectile_group_kv(kvbase, key, item) end

--添加DESTRUCTIBLE_ENTITY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.Destructible # value
function GameAPI.add_destructible_entity_kv(kvbase, key, item) end

--添加DESTRUCTIBLE_NAME键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.DestructibleKey # value
function GameAPI.add_destructible_name_kv(kvbase, key, item) end

--添加SOUND_ENTITY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.SoundEntity # value
function GameAPI.add_sound_entity_kv(kvbase, key, item) end

--添加AUDIO_KEY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.AudioKey # value
function GameAPI.add_audio_key_kv(kvbase, key, item) end

--添加GAME_MODE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.GameMode # value
function GameAPI.add_game_mode_kv(kvbase, key, item) end

--添加PLAYER键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.Role # value
function GameAPI.add_player_kv(kvbase, key, item) end

--添加PLAYER_GROUP键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.RoleGroup # value
function GameAPI.add_player_group_kv(kvbase, key, item) end

--添加ROLE_RES_KEY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.RoleResKey # value
function GameAPI.add_role_res_key_kv(kvbase, key, item) end

--添加ROLE_STATUS键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.RoleStatus # value
function GameAPI.add_role_status_kv(kvbase, key, item) end

--添加ROLE_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.RoleType # value
function GameAPI.add_role_type_kv(kvbase, key, item) end

--添加ROLE_RELATION键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.RoleRelation # value
function GameAPI.add_role_relation_kv(kvbase, key, item) end

--添加TEAM键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.Camp # value
function GameAPI.add_team_kv(kvbase, key, item) end

--添加POINT键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.FPoint # value
function GameAPI.add_point_kv(kvbase, key, item) end

--添加VECTOR3键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.FVector3 # value
function GameAPI.add_vector3_kv(kvbase, key, item) end

--添加ROTATION键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.FRotation # value
function GameAPI.add_rotation_kv(kvbase, key, item) end

--添加POINT_LIST键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.Road # value
function GameAPI.add_point_list_kv(kvbase, key, item) end

--添加RECTANGLE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.RecArea # value
function GameAPI.add_rectangle_kv(kvbase, key, item) end

--添加ROUND_AREA键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.CirArea # value
function GameAPI.add_round_area_kv(kvbase, key, item) end

--添加POLYGON键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.PolyArea # value
function GameAPI.add_polygon_kv(kvbase, key, item) end

--添加CAMERA键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.Camera # value
function GameAPI.add_camera_kv(kvbase, key, item) end

--添加CAMLINE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.CamlineID # value
function GameAPI.add_camline_kv(kvbase, key, item) end

--添加POINT_LIGHT键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.PointLight # value
function GameAPI.add_point_light_kv(kvbase, key, item) end

--添加SPOT_LIGHT键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.SpotLight # value
function GameAPI.add_spot_light_kv(kvbase, key, item) end

--添加FOG键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.Fog # value
function GameAPI.add_fog_kv(kvbase, key, item) end

--添加SCENE_SOUND键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.SceneSound # value
function GameAPI.add_scene_sound_kv(kvbase, key, item) end

--添加ATTACH_MODEL_ENTITY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.AttachModelEntity # value
function GameAPI.add_attach_model_entity_kv(kvbase, key, item) end

--添加MODEL键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.ModelKey # value
function GameAPI.add_model_kv(kvbase, key, item) end

--添加LIVE2D键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.Live2dKey # value
function GameAPI.add_live2d_kv(kvbase, key, item) end

--添加SFX_ENTITY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.Sfx # value
function GameAPI.add_sfx_entity_kv(kvbase, key, item) end

--添加SFX_KEY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.SfxKey # value
function GameAPI.add_sfx_key_kv(kvbase, key, item) end

--添加LINK_SFX_ENTITY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.LinkSfx # value
function GameAPI.add_link_sfx_entity_kv(kvbase, key, item) end

--添加LINK_SFX_KEY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.LinkSfxKey # value
function GameAPI.add_link_sfx_key_kv(kvbase, key, item) end

--添加CURSOR_KEY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.CursorKey # value
function GameAPI.add_cursor_key_kv(kvbase, key, item) end

--添加ANGLE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.Fixed # value
function GameAPI.add_angle_kv(kvbase, key, item) end

--添加TEXTURE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.Texture # value
function GameAPI.add_texture_kv(kvbase, key, item) end

--添加SEQUENCE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.Sequence # value
function GameAPI.add_sequence_kv(kvbase, key, item) end

--添加SPINE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.Spine # value
function GameAPI.add_spine_kv(kvbase, key, item) end

--添加PHYSICS_OBJECT键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.PhysicsObject # value
function GameAPI.add_physics_object_kv(kvbase, key, item) end

--添加PHYSICS_ENTITY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.PhysicsEntity # value
function GameAPI.add_physics_entity_kv(kvbase, key, item) end

--添加PHYSICS_OBJECT_KEY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.PhysicsObjectKey # value
function GameAPI.add_physics_object_key_kv(kvbase, key, item) end

--添加PHYSICS_ENTITY_KEY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.PhysicsEntityKey # value
function GameAPI.add_physics_entity_key_kv(kvbase, key, item) end

--添加RIGID_BODY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.RigidBody # value
function GameAPI.add_rigid_body_kv(kvbase, key, item) end

--添加RIGID_BODY_GROUP键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.RigidBodyGroup # value
function GameAPI.add_rigid_body_group_kv(kvbase, key, item) end

--添加COLLIDER键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.Collider # value
function GameAPI.add_collider_kv(kvbase, key, item) end

--添加JOINT键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.Joint # value
function GameAPI.add_joint_kv(kvbase, key, item) end

--添加REACTION键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.Reaction # value
function GameAPI.add_reaction_kv(kvbase, key, item) end

--添加REACTION_GROUP键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.ReactionGroup # value
function GameAPI.add_reaction_group_kv(kvbase, key, item) end

--添加DYNAMIC_TRIGGER_INSTANCE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.DynamicTriggerInstance # value
function GameAPI.add_dynamic_trigger_instance_kv(kvbase, key, item) end

--添加TABLE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.Table # value
function GameAPI.add_table_kv(kvbase, key, item) end

--添加RANDOM_POOL键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.RandomPool # value
function GameAPI.add_random_pool_kv(kvbase, key, item) end

--添加SCENE_UI键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.SceneNode # value
function GameAPI.add_scene_ui_kv(kvbase, key, item) end

--添加DAMAGE_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? integer # value
function GameAPI.add_damage_type_kv(kvbase, key, item) end

--添加HARM_TEXT_TYPE_NEW键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? string # value
function GameAPI.add_harm_text_type_new_kv(kvbase, key, item) end

--添加FONT_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? string # value
function GameAPI.add_font_type_kv(kvbase, key, item) end

--添加JUMP_WORD_TRACK键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? integer # value
function GameAPI.add_jump_word_track_kv(kvbase, key, item) end

--添加NEW_TIMER键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.Timer # value
function GameAPI.add_new_timer_kv(kvbase, key, item) end

--添加TECH_KEY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.TechKey # value
function GameAPI.add_tech_key_kv(kvbase, key, item) end

--添加STORE_KEY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.StoreKey # value
function GameAPI.add_store_key_kv(kvbase, key, item) end

--添加KEYBOARD_KEY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.KeyboardKey # value
function GameAPI.add_keyboard_key_kv(kvbase, key, item) end

--添加FUNC_KEYBOARD_KEY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.FuncKeyboardKey # value
function GameAPI.add_func_keyboard_key_kv(kvbase, key, item) end

--添加MOUSE_KEY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.MouseKey # value
function GameAPI.add_mouse_key_kv(kvbase, key, item) end

--添加MOUSE_WHEEL键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.MouseWheel # value
function GameAPI.add_mouse_wheel_kv(kvbase, key, item) end

--添加MAP键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.Map # value
function GameAPI.add_map_kv(kvbase, key, item) end

--添加POST_EFFECT键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.PostEffect # value
function GameAPI.add_post_effect_kv(kvbase, key, item) end

--添加UNIT_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.UnitType # value
function GameAPI.add_unit_type_kv(kvbase, key, item) end

--添加UNIT_COMMAND_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.UnitCommandType # value
function GameAPI.add_unit_command_type_kv(kvbase, key, item) end

--添加UNIT_GROUP_COMMAND_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.UnitGroupCommandType # value
function GameAPI.add_unit_group_command_type_kv(kvbase, key, item) end

--添加MINI_MAP_COLOR_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.MiniMapColorType # value
function GameAPI.add_mini_map_color_type_kv(kvbase, key, item) end

--添加UNIT_BEHAVIOR键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.UnitBehavior # value
function GameAPI.add_unit_behavior_kv(kvbase, key, item) end

--添加CURVED_PATH键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.CurvedPath # value
function GameAPI.add_curved_path_kv(kvbase, key, item) end

--添加CURVED_PATH_3D键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.CurvedPath3D # value
function GameAPI.add_curved_path_3d_kv(kvbase, key, item) end

--添加RESCUE_SEEKER_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.ERescueSeekerType # value
function GameAPI.add_rescue_seeker_type_kv(kvbase, key, item) end

--添加RESCUER_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.ERescuerType # value
function GameAPI.add_rescuer_type_kv(kvbase, key, item) end

--添加STORE_ITEM_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.StoreItemType # value
function GameAPI.add_store_item_type_kv(kvbase, key, item) end

--判断是否存在键值对(忽略类型)
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名
---@return boolean # 布尔值
function GameAPI.has_kv_pair(kvbase, key) end

--判断预设类型是否存在键值对(忽略类型)
---@param prefab_type string # 预设种类表
---@param prefab_key integer # 预设编号
---@param key string # 键名
---@return boolean # 布尔值
function GameAPI.has_prefab_kv_any(prefab_type, prefab_key, key) end

--判断是否存在BOOLEAN键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_boolean(kvbase, key) end

--判断预设是否存在BOOLEAN键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_boolean_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在BOOLEAN键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_boolean_kv(prefab_key, key) end

--判断物品编号是否存在BOOLEAN键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_boolean_kv(prefab_key, key) end

--判断技能编号是否存在BOOLEAN键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_boolean_kv(prefab_key, key) end

--判断是否存在INTEGER键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_integer(kvbase, key) end

--判断预设是否存在INTEGER键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_integer_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在INTEGER键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_integer_kv(prefab_key, key) end

--判断物品编号是否存在INTEGER键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_integer_kv(prefab_key, key) end

--判断技能编号是否存在INTEGER键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_integer_kv(prefab_key, key) end

--判断是否存在FLOAT键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_float(kvbase, key) end

--判断预设是否存在FLOAT键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_float_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在FLOAT键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_float_kv(prefab_key, key) end

--判断物品编号是否存在FLOAT键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_float_kv(prefab_key, key) end

--判断技能编号是否存在FLOAT键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_float_kv(prefab_key, key) end

--判断是否存在STRING键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_string(kvbase, key) end

--判断预设是否存在STRING键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_string_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在STRING键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_string_kv(prefab_key, key) end

--判断物品编号是否存在STRING键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_string_kv(prefab_key, key) end

--判断技能编号是否存在STRING键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_string_kv(prefab_key, key) end

--判断是否存在UI_COMP键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_ui_comp(kvbase, key) end

--判断预设是否存在UI_COMP键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_ui_comp_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在UI_COMP键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_ui_comp_kv(prefab_key, key) end

--判断物品编号是否存在UI_COMP键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_ui_comp_kv(prefab_key, key) end

--判断技能编号是否存在UI_COMP键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_ui_comp_kv(prefab_key, key) end

--判断是否存在UI_COMP_TYPE键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_ui_comp_type(kvbase, key) end

--判断预设是否存在UI_COMP_TYPE键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_ui_comp_type_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在UI_COMP_TYPE键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_ui_comp_type_kv(prefab_key, key) end

--判断物品编号是否存在UI_COMP_TYPE键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_ui_comp_type_kv(prefab_key, key) end

--判断技能编号是否存在UI_COMP_TYPE键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_ui_comp_type_kv(prefab_key, key) end

--判断是否存在UI_COMP_EVENT_TYPE键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_ui_comp_event_type(kvbase, key) end

--判断预设是否存在UI_COMP_EVENT_TYPE键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_ui_comp_event_type_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在UI_COMP_EVENT_TYPE键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_ui_comp_event_type_kv(prefab_key, key) end

--判断物品编号是否存在UI_COMP_EVENT_TYPE键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_ui_comp_event_type_kv(prefab_key, key) end

--判断技能编号是否存在UI_COMP_EVENT_TYPE键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_ui_comp_event_type_kv(prefab_key, key) end

--判断是否存在UI_COMP_ATTR键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_ui_comp_attr(kvbase, key) end

--判断预设是否存在UI_COMP_ATTR键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_ui_comp_attr_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在UI_COMP_ATTR键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_ui_comp_attr_kv(prefab_key, key) end

--判断物品编号是否存在UI_COMP_ATTR键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_ui_comp_attr_kv(prefab_key, key) end

--判断技能编号是否存在UI_COMP_ATTR键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_ui_comp_attr_kv(prefab_key, key) end

--判断是否存在UI_COMP_ALIGN_TYPE键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_ui_comp_align_type(kvbase, key) end

--判断预设是否存在UI_COMP_ALIGN_TYPE键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_ui_comp_align_type_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在UI_COMP_ALIGN_TYPE键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_ui_comp_align_type_kv(prefab_key, key) end

--判断物品编号是否存在UI_COMP_ALIGN_TYPE键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_ui_comp_align_type_kv(prefab_key, key) end

--判断技能编号是否存在UI_COMP_ALIGN_TYPE键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_ui_comp_align_type_kv(prefab_key, key) end

--判断是否存在UI_PREFAB键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_ui_prefab(kvbase, key) end

--判断预设是否存在UI_PREFAB键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_ui_prefab_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在UI_PREFAB键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_ui_prefab_kv(prefab_key, key) end

--判断物品编号是否存在UI_PREFAB键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_ui_prefab_kv(prefab_key, key) end

--判断技能编号是否存在UI_PREFAB键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_ui_prefab_kv(prefab_key, key) end

--判断是否存在UI_PREFAB_INSTANCE键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_ui_prefab_instance(kvbase, key) end

--判断预设是否存在UI_PREFAB_INSTANCE键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_ui_prefab_instance_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在UI_PREFAB_INSTANCE键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_ui_prefab_instance_kv(prefab_key, key) end

--判断物品编号是否存在UI_PREFAB_INSTANCE键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_ui_prefab_instance_kv(prefab_key, key) end

--判断技能编号是否存在UI_PREFAB_INSTANCE键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_ui_prefab_instance_kv(prefab_key, key) end

--判断是否存在UI_PREFAB_INS_UID键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_ui_prefab_ins_uid(kvbase, key) end

--判断预设是否存在UI_PREFAB_INS_UID键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_ui_prefab_ins_uid_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在UI_PREFAB_INS_UID键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_ui_prefab_ins_uid_kv(prefab_key, key) end

--判断物品编号是否存在UI_PREFAB_INS_UID键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_ui_prefab_ins_uid_kv(prefab_key, key) end

--判断技能编号是否存在UI_PREFAB_INS_UID键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_ui_prefab_ins_uid_kv(prefab_key, key) end

--判断是否存在UI_DIRECTION键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_ui_direction(kvbase, key) end

--判断预设是否存在UI_DIRECTION键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_ui_direction_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在UI_DIRECTION键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_ui_direction_kv(prefab_key, key) end

--判断物品编号是否存在UI_DIRECTION键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_ui_direction_kv(prefab_key, key) end

--判断技能编号是否存在UI_DIRECTION键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_ui_direction_kv(prefab_key, key) end

--判断是否存在UI_MODEL_CAMERA_MOD键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_ui_model_camera_mod(kvbase, key) end

--判断预设是否存在UI_MODEL_CAMERA_MOD键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_ui_model_camera_mod_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在UI_MODEL_CAMERA_MOD键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_ui_model_camera_mod_kv(prefab_key, key) end

--判断物品编号是否存在UI_MODEL_CAMERA_MOD键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_ui_model_camera_mod_kv(prefab_key, key) end

--判断技能编号是否存在UI_MODEL_CAMERA_MOD键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_ui_model_camera_mod_kv(prefab_key, key) end

--判断是否存在UI_BTN_STATUS键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_ui_btn_status(kvbase, key) end

--判断预设是否存在UI_BTN_STATUS键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_ui_btn_status_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在UI_BTN_STATUS键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_ui_btn_status_kv(prefab_key, key) end

--判断物品编号是否存在UI_BTN_STATUS键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_ui_btn_status_kv(prefab_key, key) end

--判断技能编号是否存在UI_BTN_STATUS键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_ui_btn_status_kv(prefab_key, key) end

--判断是否存在UI_SCROLLVIEW_TYPE键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_ui_scrollview_type(kvbase, key) end

--判断预设是否存在UI_SCROLLVIEW_TYPE键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_ui_scrollview_type_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在UI_SCROLLVIEW_TYPE键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_ui_scrollview_type_kv(prefab_key, key) end

--判断物品编号是否存在UI_SCROLLVIEW_TYPE键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_ui_scrollview_type_kv(prefab_key, key) end

--判断技能编号是否存在UI_SCROLLVIEW_TYPE键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_ui_scrollview_type_kv(prefab_key, key) end

--判断是否存在UI_GRIDVIEW_TYPE键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_ui_gridview_type(kvbase, key) end

--判断预设是否存在UI_GRIDVIEW_TYPE键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_ui_gridview_type_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在UI_GRIDVIEW_TYPE键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_ui_gridview_type_kv(prefab_key, key) end

--判断物品编号是否存在UI_GRIDVIEW_TYPE键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_ui_gridview_type_kv(prefab_key, key) end

--判断技能编号是否存在UI_GRIDVIEW_TYPE键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_ui_gridview_type_kv(prefab_key, key) end

--判断是否存在UI_GRIDVIEW_BAR_TYPE键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_ui_gridview_bar_type(kvbase, key) end

--判断预设是否存在UI_GRIDVIEW_BAR_TYPE键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_ui_gridview_bar_type_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在UI_GRIDVIEW_BAR_TYPE键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_ui_gridview_bar_type_kv(prefab_key, key) end

--判断物品编号是否存在UI_GRIDVIEW_BAR_TYPE键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_ui_gridview_bar_type_kv(prefab_key, key) end

--判断技能编号是否存在UI_GRIDVIEW_BAR_TYPE键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_ui_gridview_bar_type_kv(prefab_key, key) end

--判断是否存在UI_EFFECT_CAMERA_MODE键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_ui_effect_camera_mode(kvbase, key) end

--判断预设是否存在UI_EFFECT_CAMERA_MODE键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_ui_effect_camera_mode_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在UI_EFFECT_CAMERA_MODE键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_ui_effect_camera_mode_kv(prefab_key, key) end

--判断物品编号是否存在UI_EFFECT_CAMERA_MODE键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_ui_effect_camera_mode_kv(prefab_key, key) end

--判断技能编号是否存在UI_EFFECT_CAMERA_MODE键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_ui_effect_camera_mode_kv(prefab_key, key) end

--判断是否存在UI_EQUIP_SLOT_USE_TYPE键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_ui_equip_slot_use_type(kvbase, key) end

--判断预设是否存在UI_EQUIP_SLOT_USE_TYPE键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_ui_equip_slot_use_type_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在UI_EQUIP_SLOT_USE_TYPE键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_ui_equip_slot_use_type_kv(prefab_key, key) end

--判断物品编号是否存在UI_EQUIP_SLOT_USE_TYPE键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_ui_equip_slot_use_type_kv(prefab_key, key) end

--判断技能编号是否存在UI_EQUIP_SLOT_USE_TYPE键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_ui_equip_slot_use_type_kv(prefab_key, key) end

--判断是否存在UI_EQUIP_SLOT_DRAG_TYPE键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_ui_equip_slot_drag_type(kvbase, key) end

--判断预设是否存在UI_EQUIP_SLOT_DRAG_TYPE键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_ui_equip_slot_drag_type_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在UI_EQUIP_SLOT_DRAG_TYPE键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_ui_equip_slot_drag_type_kv(prefab_key, key) end

--判断物品编号是否存在UI_EQUIP_SLOT_DRAG_TYPE键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_ui_equip_slot_drag_type_kv(prefab_key, key) end

--判断技能编号是否存在UI_EQUIP_SLOT_DRAG_TYPE键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_ui_equip_slot_drag_type_kv(prefab_key, key) end

--判断是否存在UI_LAYOUT_CLIPPING_TYPE键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_ui_layout_clipping_type(kvbase, key) end

--判断预设是否存在UI_LAYOUT_CLIPPING_TYPE键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_ui_layout_clipping_type_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在UI_LAYOUT_CLIPPING_TYPE键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_ui_layout_clipping_type_kv(prefab_key, key) end

--判断物品编号是否存在UI_LAYOUT_CLIPPING_TYPE键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_ui_layout_clipping_type_kv(prefab_key, key) end

--判断技能编号是否存在UI_LAYOUT_CLIPPING_TYPE键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_ui_layout_clipping_type_kv(prefab_key, key) end

--判断是否存在UI_TEXT_OVER_LENGTH_HANDLING_TYPE键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_ui_text_over_length_handling_type(kvbase, key) end

--判断预设是否存在UI_TEXT_OVER_LENGTH_HANDLING_TYPE键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_ui_text_over_length_handling_type_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在UI_TEXT_OVER_LENGTH_HANDLING_TYPE键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_ui_text_over_length_handling_type_kv(prefab_key, key) end

--判断物品编号是否存在UI_TEXT_OVER_LENGTH_HANDLING_TYPE键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_ui_text_over_length_handling_type_kv(prefab_key, key) end

--判断技能编号是否存在UI_TEXT_OVER_LENGTH_HANDLING_TYPE键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_ui_text_over_length_handling_type_kv(prefab_key, key) end

--判断是否存在UI_POS_ADAPT_MODE键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_ui_pos_adapt_mode(kvbase, key) end

--判断预设是否存在UI_POS_ADAPT_MODE键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_ui_pos_adapt_mode_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在UI_POS_ADAPT_MODE键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_ui_pos_adapt_mode_kv(prefab_key, key) end

--判断物品编号是否存在UI_POS_ADAPT_MODE键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_ui_pos_adapt_mode_kv(prefab_key, key) end

--判断技能编号是否存在UI_POS_ADAPT_MODE键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_ui_pos_adapt_mode_kv(prefab_key, key) end

--判断是否存在UI_ANIM键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_ui_anim(kvbase, key) end

--判断预设是否存在UI_ANIM键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_ui_anim_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在UI_ANIM键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_ui_anim_kv(prefab_key, key) end

--判断物品编号是否存在UI_ANIM键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_ui_anim_kv(prefab_key, key) end

--判断技能编号是否存在UI_ANIM键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_ui_anim_kv(prefab_key, key) end

--判断是否存在UI_ANIM_CURVE键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_ui_anim_curve(kvbase, key) end

--判断预设是否存在UI_ANIM_CURVE键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_ui_anim_curve_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在UI_ANIM_CURVE键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_ui_anim_curve_kv(prefab_key, key) end

--判断物品编号是否存在UI_ANIM_CURVE键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_ui_anim_curve_kv(prefab_key, key) end

--判断技能编号是否存在UI_ANIM_CURVE键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_ui_anim_curve_kv(prefab_key, key) end

--判断是否存在UI_ANIM_PLAY_MODE键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_ui_anim_play_mode(kvbase, key) end

--判断预设是否存在UI_ANIM_PLAY_MODE键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_ui_anim_play_mode_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在UI_ANIM_PLAY_MODE键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_ui_anim_play_mode_kv(prefab_key, key) end

--判断物品编号是否存在UI_ANIM_PLAY_MODE键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_ui_anim_play_mode_kv(prefab_key, key) end

--判断技能编号是否存在UI_ANIM_PLAY_MODE键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_ui_anim_play_mode_kv(prefab_key, key) end

--判断是否存在UI_TEXT_FONT_NAME键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_ui_text_font_name(kvbase, key) end

--判断预设是否存在UI_TEXT_FONT_NAME键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_ui_text_font_name_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在UI_TEXT_FONT_NAME键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_ui_text_font_name_kv(prefab_key, key) end

--判断物品编号是否存在UI_TEXT_FONT_NAME键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_ui_text_font_name_kv(prefab_key, key) end

--判断技能编号是否存在UI_TEXT_FONT_NAME键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_ui_text_font_name_kv(prefab_key, key) end

--判断是否存在UI_ECA_ANIM_TYPE键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_ui_eca_anim_type(kvbase, key) end

--判断预设是否存在UI_ECA_ANIM_TYPE键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_ui_eca_anim_type_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在UI_ECA_ANIM_TYPE键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_ui_eca_anim_type_kv(prefab_key, key) end

--判断物品编号是否存在UI_ECA_ANIM_TYPE键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_ui_eca_anim_type_kv(prefab_key, key) end

--判断技能编号是否存在UI_ECA_ANIM_TYPE键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_ui_eca_anim_type_kv(prefab_key, key) end

--判断是否存在AUDIO_CHANNEL键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_audio_channel(kvbase, key) end

--判断预设是否存在AUDIO_CHANNEL键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_audio_channel_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在AUDIO_CHANNEL键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_audio_channel_kv(prefab_key, key) end

--判断物品编号是否存在AUDIO_CHANNEL键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_audio_channel_kv(prefab_key, key) end

--判断技能编号是否存在AUDIO_CHANNEL键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_audio_channel_kv(prefab_key, key) end

--判断是否存在UNIT_ENTITY键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_unit_entity(kvbase, key) end

--判断预设是否存在UNIT_ENTITY键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_unit_entity_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在UNIT_ENTITY键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_unit_entity_kv(prefab_key, key) end

--判断物品编号是否存在UNIT_ENTITY键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_unit_entity_kv(prefab_key, key) end

--判断技能编号是否存在UNIT_ENTITY键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_unit_entity_kv(prefab_key, key) end

--判断是否存在UNIT_GROUP键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_unit_group(kvbase, key) end

--判断预设是否存在UNIT_GROUP键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_unit_group_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在UNIT_GROUP键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_unit_group_kv(prefab_key, key) end

--判断物品编号是否存在UNIT_GROUP键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_unit_group_kv(prefab_key, key) end

--判断技能编号是否存在UNIT_GROUP键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_unit_group_kv(prefab_key, key) end

--判断是否存在UNIT_NAME键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_unit_name(kvbase, key) end

--判断预设是否存在UNIT_NAME键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_unit_name_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在UNIT_NAME键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_unit_name_kv(prefab_key, key) end

--判断物品编号是否存在UNIT_NAME键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_unit_name_kv(prefab_key, key) end

--判断技能编号是否存在UNIT_NAME键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_unit_name_kv(prefab_key, key) end

--判断是否存在UNIT_NAME_POOL键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_unit_name_pool(kvbase, key) end

--判断预设是否存在UNIT_NAME_POOL键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_unit_name_pool_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在UNIT_NAME_POOL键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_unit_name_pool_kv(prefab_key, key) end

--判断物品编号是否存在UNIT_NAME_POOL键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_unit_name_pool_kv(prefab_key, key) end

--判断技能编号是否存在UNIT_NAME_POOL键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_unit_name_pool_kv(prefab_key, key) end

--判断是否存在UNIT_WRITE_ATTRIBUTE键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_unit_write_attribute(kvbase, key) end

--判断预设是否存在UNIT_WRITE_ATTRIBUTE键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_unit_write_attribute_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在UNIT_WRITE_ATTRIBUTE键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_unit_write_attribute_kv(prefab_key, key) end

--判断物品编号是否存在UNIT_WRITE_ATTRIBUTE键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_unit_write_attribute_kv(prefab_key, key) end

--判断技能编号是否存在UNIT_WRITE_ATTRIBUTE键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_unit_write_attribute_kv(prefab_key, key) end

--判断是否存在ATTR_ELEMENT键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_attr_element(kvbase, key) end

--判断预设是否存在ATTR_ELEMENT键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_attr_element_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在ATTR_ELEMENT键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_attr_element_kv(prefab_key, key) end

--判断物品编号是否存在ATTR_ELEMENT键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_attr_element_kv(prefab_key, key) end

--判断技能编号是否存在ATTR_ELEMENT键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_attr_element_kv(prefab_key, key) end

--判断是否存在ATTR_ELEMENT_READ键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_attr_element_read(kvbase, key) end

--判断预设是否存在ATTR_ELEMENT_READ键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_attr_element_read_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在ATTR_ELEMENT_READ键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_attr_element_read_kv(prefab_key, key) end

--判断物品编号是否存在ATTR_ELEMENT_READ键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_attr_element_read_kv(prefab_key, key) end

--判断技能编号是否存在ATTR_ELEMENT_READ键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_attr_element_read_kv(prefab_key, key) end

--判断是否存在MOVER_ENTITY键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_mover_entity(kvbase, key) end

--判断预设是否存在MOVER_ENTITY键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_mover_entity_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在MOVER_ENTITY键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_mover_entity_kv(prefab_key, key) end

--判断物品编号是否存在MOVER_ENTITY键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_mover_entity_kv(prefab_key, key) end

--判断技能编号是否存在MOVER_ENTITY键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_mover_entity_kv(prefab_key, key) end

--判断是否存在IMAGE_QUALITY键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_image_quality(kvbase, key) end

--判断预设是否存在IMAGE_QUALITY键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_image_quality_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在IMAGE_QUALITY键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_image_quality_kv(prefab_key, key) end

--判断物品编号是否存在IMAGE_QUALITY键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_image_quality_kv(prefab_key, key) end

--判断技能编号是否存在IMAGE_QUALITY键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_image_quality_kv(prefab_key, key) end

--判断是否存在WINDOW_TYPE_SETTING键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_window_type_setting(kvbase, key) end

--判断预设是否存在WINDOW_TYPE_SETTING键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_window_type_setting_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在WINDOW_TYPE_SETTING键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_window_type_setting_kv(prefab_key, key) end

--判断物品编号是否存在WINDOW_TYPE_SETTING键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_window_type_setting_kv(prefab_key, key) end

--判断技能编号是否存在WINDOW_TYPE_SETTING键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_window_type_setting_kv(prefab_key, key) end

--判断是否存在DAMAGE_ATTACK_TYPE键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_damage_attack_type(kvbase, key) end

--判断预设是否存在DAMAGE_ATTACK_TYPE键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_damage_attack_type_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在DAMAGE_ATTACK_TYPE键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_damage_attack_type_kv(prefab_key, key) end

--判断物品编号是否存在DAMAGE_ATTACK_TYPE键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_damage_attack_type_kv(prefab_key, key) end

--判断技能编号是否存在DAMAGE_ATTACK_TYPE键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_damage_attack_type_kv(prefab_key, key) end

--判断是否存在ITEM_ENTITY键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_item_entity(kvbase, key) end

--判断预设是否存在ITEM_ENTITY键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_item_entity_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在ITEM_ENTITY键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_item_entity_kv(prefab_key, key) end

--判断物品编号是否存在ITEM_ENTITY键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_item_entity_kv(prefab_key, key) end

--判断技能编号是否存在ITEM_ENTITY键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_item_entity_kv(prefab_key, key) end

--判断是否存在ITEM_GROUP键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_item_group(kvbase, key) end

--判断预设是否存在ITEM_GROUP键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_item_group_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在ITEM_GROUP键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_item_group_kv(prefab_key, key) end

--判断物品编号是否存在ITEM_GROUP键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_item_group_kv(prefab_key, key) end

--判断技能编号是否存在ITEM_GROUP键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_item_group_kv(prefab_key, key) end

--判断是否存在ITEM_NAME键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_item_name(kvbase, key) end

--判断预设是否存在ITEM_NAME键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_item_name_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在ITEM_NAME键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_item_name_kv(prefab_key, key) end

--判断物品编号是否存在ITEM_NAME键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_item_name_kv(prefab_key, key) end

--判断技能编号是否存在ITEM_NAME键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_item_name_kv(prefab_key, key) end

--判断是否存在ITEM_STACK_TYPE键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_item_stack_type(kvbase, key) end

--判断预设是否存在ITEM_STACK_TYPE键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_item_stack_type_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在ITEM_STACK_TYPE键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_item_stack_type_kv(prefab_key, key) end

--判断物品编号是否存在ITEM_STACK_TYPE键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_item_stack_type_kv(prefab_key, key) end

--判断技能编号是否存在ITEM_STACK_TYPE键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_item_stack_type_kv(prefab_key, key) end

--判断是否存在ABILITY键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_ability(kvbase, key) end

--判断预设是否存在ABILITY键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_ability_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在ABILITY键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_ability_kv(prefab_key, key) end

--判断物品编号是否存在ABILITY键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_ability_kv(prefab_key, key) end

--判断技能编号是否存在ABILITY键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_ability_kv(prefab_key, key) end

--判断是否存在ABILITY_TYPE键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_ability_type(kvbase, key) end

--判断预设是否存在ABILITY_TYPE键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_ability_type_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在ABILITY_TYPE键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_ability_type_kv(prefab_key, key) end

--判断物品编号是否存在ABILITY_TYPE键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_ability_type_kv(prefab_key, key) end

--判断技能编号是否存在ABILITY_TYPE键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_ability_type_kv(prefab_key, key) end

--判断是否存在ABILITY_CAST_TYPE键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_ability_cast_type(kvbase, key) end

--判断预设是否存在ABILITY_CAST_TYPE键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_ability_cast_type_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在ABILITY_CAST_TYPE键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_ability_cast_type_kv(prefab_key, key) end

--判断物品编号是否存在ABILITY_CAST_TYPE键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_ability_cast_type_kv(prefab_key, key) end

--判断技能编号是否存在ABILITY_CAST_TYPE键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_ability_cast_type_kv(prefab_key, key) end

--判断是否存在ABILITY_NAME键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_ability_name(kvbase, key) end

--判断预设是否存在ABILITY_NAME键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_ability_name_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在ABILITY_NAME键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_ability_name_kv(prefab_key, key) end

--判断物品编号是否存在ABILITY_NAME键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_ability_name_kv(prefab_key, key) end

--判断技能编号是否存在ABILITY_NAME键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_ability_name_kv(prefab_key, key) end

--判断是否存在SLOT_TYPE键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_slot_type(kvbase, key) end

--判断预设是否存在SLOT_TYPE键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_slot_type_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在SLOT_TYPE键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_slot_type_kv(prefab_key, key) end

--判断物品编号是否存在SLOT_TYPE键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_slot_type_kv(prefab_key, key) end

--判断技能编号是否存在SLOT_TYPE键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_slot_type_kv(prefab_key, key) end

--判断是否存在SKILL_POINTER_TYPE键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_skill_pointer_type(kvbase, key) end

--判断预设是否存在SKILL_POINTER_TYPE键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_skill_pointer_type_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在SKILL_POINTER_TYPE键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_skill_pointer_type_kv(prefab_key, key) end

--判断物品编号是否存在SKILL_POINTER_TYPE键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_skill_pointer_type_kv(prefab_key, key) end

--判断技能编号是否存在SKILL_POINTER_TYPE键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_skill_pointer_type_kv(prefab_key, key) end

--判断是否存在MODIFIER_ENTITY键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_modifier_entity(kvbase, key) end

--判断预设是否存在MODIFIER_ENTITY键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_modifier_entity_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在MODIFIER_ENTITY键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_modifier_entity_kv(prefab_key, key) end

--判断物品编号是否存在MODIFIER_ENTITY键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_modifier_entity_kv(prefab_key, key) end

--判断技能编号是否存在MODIFIER_ENTITY键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_modifier_entity_kv(prefab_key, key) end

--判断是否存在MODIFIER_TYPE键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_modifier_type(kvbase, key) end

--判断预设是否存在MODIFIER_TYPE键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_modifier_type_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在MODIFIER_TYPE键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_modifier_type_kv(prefab_key, key) end

--判断物品编号是否存在MODIFIER_TYPE键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_modifier_type_kv(prefab_key, key) end

--判断技能编号是否存在MODIFIER_TYPE键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_modifier_type_kv(prefab_key, key) end

--判断是否存在MODIFIER_EFFECT_TYPE键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_modifier_effect_type(kvbase, key) end

--判断预设是否存在MODIFIER_EFFECT_TYPE键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_modifier_effect_type_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在MODIFIER_EFFECT_TYPE键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_modifier_effect_type_kv(prefab_key, key) end

--判断物品编号是否存在MODIFIER_EFFECT_TYPE键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_modifier_effect_type_kv(prefab_key, key) end

--判断技能编号是否存在MODIFIER_EFFECT_TYPE键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_modifier_effect_type_kv(prefab_key, key) end

--判断是否存在MODIFIER键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_modifier(kvbase, key) end

--判断预设是否存在MODIFIER键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_modifier_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在MODIFIER键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_modifier_kv(prefab_key, key) end

--判断物品编号是否存在MODIFIER键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_modifier_kv(prefab_key, key) end

--判断技能编号是否存在MODIFIER键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_modifier_kv(prefab_key, key) end

--判断是否存在PROJECTILE键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_projectile(kvbase, key) end

--判断预设是否存在PROJECTILE键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_projectile_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在PROJECTILE键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_projectile_kv(prefab_key, key) end

--判断物品编号是否存在PROJECTILE键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_projectile_kv(prefab_key, key) end

--判断技能编号是否存在PROJECTILE键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_projectile_kv(prefab_key, key) end

--判断是否存在PROJECTILE_ENTITY键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_projectile_entity(kvbase, key) end

--判断预设是否存在PROJECTILE_ENTITY键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_projectile_entity_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在PROJECTILE_ENTITY键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_projectile_entity_kv(prefab_key, key) end

--判断物品编号是否存在PROJECTILE_ENTITY键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_projectile_entity_kv(prefab_key, key) end

--判断技能编号是否存在PROJECTILE_ENTITY键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_projectile_entity_kv(prefab_key, key) end

--判断是否存在PROJECTILE_GROUP键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_projectile_group(kvbase, key) end

--判断预设是否存在PROJECTILE_GROUP键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_projectile_group_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在PROJECTILE_GROUP键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_projectile_group_kv(prefab_key, key) end

--判断物品编号是否存在PROJECTILE_GROUP键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_projectile_group_kv(prefab_key, key) end

--判断技能编号是否存在PROJECTILE_GROUP键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_projectile_group_kv(prefab_key, key) end

--判断是否存在DESTRUCTIBLE_ENTITY键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_destructible_entity(kvbase, key) end

--判断预设是否存在DESTRUCTIBLE_ENTITY键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_destructible_entity_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在DESTRUCTIBLE_ENTITY键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_destructible_entity_kv(prefab_key, key) end

--判断物品编号是否存在DESTRUCTIBLE_ENTITY键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_destructible_entity_kv(prefab_key, key) end

--判断技能编号是否存在DESTRUCTIBLE_ENTITY键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_destructible_entity_kv(prefab_key, key) end

--判断是否存在DESTRUCTIBLE_NAME键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_destructible_name(kvbase, key) end

--判断预设是否存在DESTRUCTIBLE_NAME键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_destructible_name_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在DESTRUCTIBLE_NAME键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_destructible_name_kv(prefab_key, key) end

--判断物品编号是否存在DESTRUCTIBLE_NAME键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_destructible_name_kv(prefab_key, key) end

--判断技能编号是否存在DESTRUCTIBLE_NAME键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_destructible_name_kv(prefab_key, key) end

--判断是否存在SOUND_ENTITY键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_sound_entity(kvbase, key) end

--判断预设是否存在SOUND_ENTITY键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_sound_entity_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在SOUND_ENTITY键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_sound_entity_kv(prefab_key, key) end

--判断物品编号是否存在SOUND_ENTITY键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_sound_entity_kv(prefab_key, key) end

--判断技能编号是否存在SOUND_ENTITY键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_sound_entity_kv(prefab_key, key) end

--判断是否存在AUDIO_KEY键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_audio_key(kvbase, key) end

--判断预设是否存在AUDIO_KEY键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_audio_key_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在AUDIO_KEY键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_audio_key_kv(prefab_key, key) end

--判断物品编号是否存在AUDIO_KEY键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_audio_key_kv(prefab_key, key) end

--判断技能编号是否存在AUDIO_KEY键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_audio_key_kv(prefab_key, key) end

--判断是否存在GAME_MODE键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_game_mode(kvbase, key) end

--判断预设是否存在GAME_MODE键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_game_mode_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在GAME_MODE键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_game_mode_kv(prefab_key, key) end

--判断物品编号是否存在GAME_MODE键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_game_mode_kv(prefab_key, key) end

--判断技能编号是否存在GAME_MODE键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_game_mode_kv(prefab_key, key) end

--判断是否存在PLAYER键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_player(kvbase, key) end

--判断预设是否存在PLAYER键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_player_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在PLAYER键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_player_kv(prefab_key, key) end

--判断物品编号是否存在PLAYER键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_player_kv(prefab_key, key) end

--判断技能编号是否存在PLAYER键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_player_kv(prefab_key, key) end

--判断是否存在PLAYER_GROUP键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_player_group(kvbase, key) end

--判断预设是否存在PLAYER_GROUP键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_player_group_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在PLAYER_GROUP键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_player_group_kv(prefab_key, key) end

--判断物品编号是否存在PLAYER_GROUP键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_player_group_kv(prefab_key, key) end

--判断技能编号是否存在PLAYER_GROUP键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_player_group_kv(prefab_key, key) end

--判断是否存在ROLE_RES_KEY键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_role_res_key(kvbase, key) end

--判断预设是否存在ROLE_RES_KEY键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_role_res_key_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在ROLE_RES_KEY键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_role_res_key_kv(prefab_key, key) end

--判断物品编号是否存在ROLE_RES_KEY键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_role_res_key_kv(prefab_key, key) end

--判断技能编号是否存在ROLE_RES_KEY键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_role_res_key_kv(prefab_key, key) end

--判断是否存在ROLE_STATUS键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_role_status(kvbase, key) end

--判断预设是否存在ROLE_STATUS键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_role_status_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在ROLE_STATUS键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_role_status_kv(prefab_key, key) end

--判断物品编号是否存在ROLE_STATUS键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_role_status_kv(prefab_key, key) end

--判断技能编号是否存在ROLE_STATUS键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_role_status_kv(prefab_key, key) end

--判断是否存在ROLE_TYPE键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_role_type(kvbase, key) end

--判断预设是否存在ROLE_TYPE键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_role_type_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在ROLE_TYPE键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_role_type_kv(prefab_key, key) end

--判断物品编号是否存在ROLE_TYPE键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_role_type_kv(prefab_key, key) end

--判断技能编号是否存在ROLE_TYPE键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_role_type_kv(prefab_key, key) end

--判断是否存在ROLE_RELATION键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_role_relation(kvbase, key) end

--判断预设是否存在ROLE_RELATION键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_role_relation_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在ROLE_RELATION键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_role_relation_kv(prefab_key, key) end

--判断物品编号是否存在ROLE_RELATION键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_role_relation_kv(prefab_key, key) end

--判断技能编号是否存在ROLE_RELATION键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_role_relation_kv(prefab_key, key) end

--判断是否存在TEAM键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_team(kvbase, key) end

--判断预设是否存在TEAM键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_team_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在TEAM键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_team_kv(prefab_key, key) end

--判断物品编号是否存在TEAM键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_team_kv(prefab_key, key) end

--判断技能编号是否存在TEAM键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_team_kv(prefab_key, key) end

--判断是否存在POINT键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_point(kvbase, key) end

--判断预设是否存在POINT键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_point_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在POINT键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_point_kv(prefab_key, key) end

--判断物品编号是否存在POINT键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_point_kv(prefab_key, key) end

--判断技能编号是否存在POINT键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_point_kv(prefab_key, key) end

--判断是否存在VECTOR3键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_vector3(kvbase, key) end

--判断预设是否存在VECTOR3键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_vector3_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在VECTOR3键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_vector3_kv(prefab_key, key) end

--判断物品编号是否存在VECTOR3键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_vector3_kv(prefab_key, key) end

--判断技能编号是否存在VECTOR3键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_vector3_kv(prefab_key, key) end

--判断是否存在ROTATION键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_rotation(kvbase, key) end

--判断预设是否存在ROTATION键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_rotation_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在ROTATION键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_rotation_kv(prefab_key, key) end

--判断物品编号是否存在ROTATION键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_rotation_kv(prefab_key, key) end

--判断技能编号是否存在ROTATION键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_rotation_kv(prefab_key, key) end

--判断是否存在POINT_LIST键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_point_list(kvbase, key) end

--判断预设是否存在POINT_LIST键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_point_list_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在POINT_LIST键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_point_list_kv(prefab_key, key) end

--判断物品编号是否存在POINT_LIST键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_point_list_kv(prefab_key, key) end

--判断技能编号是否存在POINT_LIST键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_point_list_kv(prefab_key, key) end

--判断是否存在RECTANGLE键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_rectangle(kvbase, key) end

--判断预设是否存在RECTANGLE键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_rectangle_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在RECTANGLE键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_rectangle_kv(prefab_key, key) end

--判断物品编号是否存在RECTANGLE键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_rectangle_kv(prefab_key, key) end

--判断技能编号是否存在RECTANGLE键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_rectangle_kv(prefab_key, key) end

--判断是否存在ROUND_AREA键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_round_area(kvbase, key) end

--判断预设是否存在ROUND_AREA键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_round_area_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在ROUND_AREA键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_round_area_kv(prefab_key, key) end

--判断物品编号是否存在ROUND_AREA键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_round_area_kv(prefab_key, key) end

--判断技能编号是否存在ROUND_AREA键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_round_area_kv(prefab_key, key) end

--判断是否存在POLYGON键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_polygon(kvbase, key) end

--判断预设是否存在POLYGON键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_polygon_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在POLYGON键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_polygon_kv(prefab_key, key) end

--判断物品编号是否存在POLYGON键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_polygon_kv(prefab_key, key) end

--判断技能编号是否存在POLYGON键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_polygon_kv(prefab_key, key) end

--判断是否存在CAMERA键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_camera(kvbase, key) end

--判断预设是否存在CAMERA键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_camera_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在CAMERA键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_camera_kv(prefab_key, key) end

--判断物品编号是否存在CAMERA键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_camera_kv(prefab_key, key) end

--判断技能编号是否存在CAMERA键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_camera_kv(prefab_key, key) end

--判断是否存在CAMLINE键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_camline(kvbase, key) end

--判断预设是否存在CAMLINE键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_camline_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在CAMLINE键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_camline_kv(prefab_key, key) end

--判断物品编号是否存在CAMLINE键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_camline_kv(prefab_key, key) end

--判断技能编号是否存在CAMLINE键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_camline_kv(prefab_key, key) end

--判断是否存在POINT_LIGHT键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_point_light(kvbase, key) end

--判断预设是否存在POINT_LIGHT键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_point_light_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在POINT_LIGHT键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_point_light_kv(prefab_key, key) end

--判断物品编号是否存在POINT_LIGHT键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_point_light_kv(prefab_key, key) end

--判断技能编号是否存在POINT_LIGHT键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_point_light_kv(prefab_key, key) end

--判断是否存在SPOT_LIGHT键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_spot_light(kvbase, key) end

--判断预设是否存在SPOT_LIGHT键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_spot_light_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在SPOT_LIGHT键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_spot_light_kv(prefab_key, key) end

--判断物品编号是否存在SPOT_LIGHT键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_spot_light_kv(prefab_key, key) end

--判断技能编号是否存在SPOT_LIGHT键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_spot_light_kv(prefab_key, key) end

--判断是否存在FOG键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_fog(kvbase, key) end

--判断预设是否存在FOG键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_fog_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在FOG键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_fog_kv(prefab_key, key) end

--判断物品编号是否存在FOG键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_fog_kv(prefab_key, key) end

--判断技能编号是否存在FOG键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_fog_kv(prefab_key, key) end

--判断是否存在SCENE_SOUND键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_scene_sound(kvbase, key) end

--判断预设是否存在SCENE_SOUND键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_scene_sound_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在SCENE_SOUND键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_scene_sound_kv(prefab_key, key) end

--判断物品编号是否存在SCENE_SOUND键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_scene_sound_kv(prefab_key, key) end

--判断技能编号是否存在SCENE_SOUND键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_scene_sound_kv(prefab_key, key) end

--判断是否存在ATTACH_MODEL_ENTITY键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_attach_model_entity(kvbase, key) end

--判断预设是否存在ATTACH_MODEL_ENTITY键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_attach_model_entity_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在ATTACH_MODEL_ENTITY键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_attach_model_entity_kv(prefab_key, key) end

--判断物品编号是否存在ATTACH_MODEL_ENTITY键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_attach_model_entity_kv(prefab_key, key) end

--判断技能编号是否存在ATTACH_MODEL_ENTITY键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_attach_model_entity_kv(prefab_key, key) end

--判断是否存在MODEL键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_model(kvbase, key) end

--判断预设是否存在MODEL键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_model_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在MODEL键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_model_kv(prefab_key, key) end

--判断物品编号是否存在MODEL键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_model_kv(prefab_key, key) end

--判断技能编号是否存在MODEL键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_model_kv(prefab_key, key) end

--判断是否存在LIVE2D键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_live2d(kvbase, key) end

--判断预设是否存在LIVE2D键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_live2d_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在LIVE2D键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_live2d_kv(prefab_key, key) end

--判断物品编号是否存在LIVE2D键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_live2d_kv(prefab_key, key) end

--判断技能编号是否存在LIVE2D键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_live2d_kv(prefab_key, key) end

--判断是否存在SFX_ENTITY键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_sfx_entity(kvbase, key) end

--判断预设是否存在SFX_ENTITY键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_sfx_entity_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在SFX_ENTITY键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_sfx_entity_kv(prefab_key, key) end

--判断物品编号是否存在SFX_ENTITY键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_sfx_entity_kv(prefab_key, key) end

--判断技能编号是否存在SFX_ENTITY键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_sfx_entity_kv(prefab_key, key) end

--判断是否存在SFX_KEY键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_sfx_key(kvbase, key) end

--判断预设是否存在SFX_KEY键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_sfx_key_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在SFX_KEY键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_sfx_key_kv(prefab_key, key) end

--判断物品编号是否存在SFX_KEY键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_sfx_key_kv(prefab_key, key) end

--判断技能编号是否存在SFX_KEY键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_sfx_key_kv(prefab_key, key) end

--判断是否存在LINK_SFX_ENTITY键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_link_sfx_entity(kvbase, key) end

--判断预设是否存在LINK_SFX_ENTITY键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_link_sfx_entity_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在LINK_SFX_ENTITY键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_link_sfx_entity_kv(prefab_key, key) end

--判断物品编号是否存在LINK_SFX_ENTITY键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_link_sfx_entity_kv(prefab_key, key) end

--判断技能编号是否存在LINK_SFX_ENTITY键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_link_sfx_entity_kv(prefab_key, key) end

--判断是否存在LINK_SFX_KEY键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_link_sfx_key(kvbase, key) end

--判断预设是否存在LINK_SFX_KEY键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_link_sfx_key_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在LINK_SFX_KEY键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_link_sfx_key_kv(prefab_key, key) end

--判断物品编号是否存在LINK_SFX_KEY键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_link_sfx_key_kv(prefab_key, key) end

--判断技能编号是否存在LINK_SFX_KEY键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_link_sfx_key_kv(prefab_key, key) end

--判断是否存在CURSOR_KEY键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_cursor_key(kvbase, key) end

--判断预设是否存在CURSOR_KEY键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_cursor_key_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在CURSOR_KEY键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_cursor_key_kv(prefab_key, key) end

--判断物品编号是否存在CURSOR_KEY键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_cursor_key_kv(prefab_key, key) end

--判断技能编号是否存在CURSOR_KEY键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_cursor_key_kv(prefab_key, key) end

--判断是否存在ANGLE键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_angle(kvbase, key) end

--判断预设是否存在ANGLE键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_angle_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在ANGLE键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_angle_kv(prefab_key, key) end

--判断物品编号是否存在ANGLE键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_angle_kv(prefab_key, key) end

--判断技能编号是否存在ANGLE键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_angle_kv(prefab_key, key) end

--判断是否存在TEXTURE键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_texture(kvbase, key) end

--判断预设是否存在TEXTURE键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_texture_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在TEXTURE键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_texture_kv(prefab_key, key) end

--判断物品编号是否存在TEXTURE键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_texture_kv(prefab_key, key) end

--判断技能编号是否存在TEXTURE键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_texture_kv(prefab_key, key) end

--判断是否存在SEQUENCE键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_sequence(kvbase, key) end

--判断预设是否存在SEQUENCE键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_sequence_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在SEQUENCE键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_sequence_kv(prefab_key, key) end

--判断物品编号是否存在SEQUENCE键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_sequence_kv(prefab_key, key) end

--判断技能编号是否存在SEQUENCE键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_sequence_kv(prefab_key, key) end

--判断是否存在SPINE键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_spine(kvbase, key) end

--判断预设是否存在SPINE键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_spine_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在SPINE键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_spine_kv(prefab_key, key) end

--判断物品编号是否存在SPINE键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_spine_kv(prefab_key, key) end

--判断技能编号是否存在SPINE键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_spine_kv(prefab_key, key) end

--判断是否存在PHYSICS_OBJECT键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_physics_object(kvbase, key) end

--判断预设是否存在PHYSICS_OBJECT键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_physics_object_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在PHYSICS_OBJECT键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_physics_object_kv(prefab_key, key) end

--判断物品编号是否存在PHYSICS_OBJECT键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_physics_object_kv(prefab_key, key) end

--判断技能编号是否存在PHYSICS_OBJECT键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_physics_object_kv(prefab_key, key) end

--判断是否存在PHYSICS_ENTITY键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_physics_entity(kvbase, key) end

--判断预设是否存在PHYSICS_ENTITY键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_physics_entity_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在PHYSICS_ENTITY键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_physics_entity_kv(prefab_key, key) end

--判断物品编号是否存在PHYSICS_ENTITY键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_physics_entity_kv(prefab_key, key) end

--判断技能编号是否存在PHYSICS_ENTITY键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_physics_entity_kv(prefab_key, key) end

--判断是否存在PHYSICS_OBJECT_KEY键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_physics_object_key(kvbase, key) end

--判断预设是否存在PHYSICS_OBJECT_KEY键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_physics_object_key_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在PHYSICS_OBJECT_KEY键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_physics_object_key_kv(prefab_key, key) end

--判断物品编号是否存在PHYSICS_OBJECT_KEY键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_physics_object_key_kv(prefab_key, key) end

--判断技能编号是否存在PHYSICS_OBJECT_KEY键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_physics_object_key_kv(prefab_key, key) end

--判断是否存在PHYSICS_ENTITY_KEY键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_physics_entity_key(kvbase, key) end

--判断预设是否存在PHYSICS_ENTITY_KEY键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_physics_entity_key_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在PHYSICS_ENTITY_KEY键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_physics_entity_key_kv(prefab_key, key) end

--判断物品编号是否存在PHYSICS_ENTITY_KEY键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_physics_entity_key_kv(prefab_key, key) end

--判断技能编号是否存在PHYSICS_ENTITY_KEY键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_physics_entity_key_kv(prefab_key, key) end

--判断是否存在RIGID_BODY键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_rigid_body(kvbase, key) end

--判断预设是否存在RIGID_BODY键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_rigid_body_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在RIGID_BODY键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_rigid_body_kv(prefab_key, key) end

--判断物品编号是否存在RIGID_BODY键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_rigid_body_kv(prefab_key, key) end

--判断技能编号是否存在RIGID_BODY键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_rigid_body_kv(prefab_key, key) end

--判断是否存在RIGID_BODY_GROUP键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_rigid_body_group(kvbase, key) end

--判断预设是否存在RIGID_BODY_GROUP键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_rigid_body_group_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在RIGID_BODY_GROUP键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_rigid_body_group_kv(prefab_key, key) end

--判断物品编号是否存在RIGID_BODY_GROUP键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_rigid_body_group_kv(prefab_key, key) end

--判断技能编号是否存在RIGID_BODY_GROUP键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_rigid_body_group_kv(prefab_key, key) end

--判断是否存在COLLIDER键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_collider(kvbase, key) end

--判断预设是否存在COLLIDER键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_collider_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在COLLIDER键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_collider_kv(prefab_key, key) end

--判断物品编号是否存在COLLIDER键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_collider_kv(prefab_key, key) end

--判断技能编号是否存在COLLIDER键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_collider_kv(prefab_key, key) end

--判断是否存在JOINT键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_joint(kvbase, key) end

--判断预设是否存在JOINT键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_joint_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在JOINT键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_joint_kv(prefab_key, key) end

--判断物品编号是否存在JOINT键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_joint_kv(prefab_key, key) end

--判断技能编号是否存在JOINT键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_joint_kv(prefab_key, key) end

--判断是否存在REACTION键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_reaction(kvbase, key) end

--判断预设是否存在REACTION键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_reaction_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在REACTION键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_reaction_kv(prefab_key, key) end

--判断物品编号是否存在REACTION键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_reaction_kv(prefab_key, key) end

--判断技能编号是否存在REACTION键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_reaction_kv(prefab_key, key) end

--判断是否存在REACTION_GROUP键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_reaction_group(kvbase, key) end

--判断预设是否存在REACTION_GROUP键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_reaction_group_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在REACTION_GROUP键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_reaction_group_kv(prefab_key, key) end

--判断物品编号是否存在REACTION_GROUP键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_reaction_group_kv(prefab_key, key) end

--判断技能编号是否存在REACTION_GROUP键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_reaction_group_kv(prefab_key, key) end

--判断是否存在DYNAMIC_TRIGGER_INSTANCE键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_dynamic_trigger_instance(kvbase, key) end

--判断预设是否存在DYNAMIC_TRIGGER_INSTANCE键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_dynamic_trigger_instance_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在DYNAMIC_TRIGGER_INSTANCE键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_dynamic_trigger_instance_kv(prefab_key, key) end

--判断物品编号是否存在DYNAMIC_TRIGGER_INSTANCE键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_dynamic_trigger_instance_kv(prefab_key, key) end

--判断技能编号是否存在DYNAMIC_TRIGGER_INSTANCE键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_dynamic_trigger_instance_kv(prefab_key, key) end

--判断是否存在TABLE键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_table(kvbase, key) end

--判断预设是否存在TABLE键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_table_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在TABLE键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_table_kv(prefab_key, key) end

--判断物品编号是否存在TABLE键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_table_kv(prefab_key, key) end

--判断技能编号是否存在TABLE键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_table_kv(prefab_key, key) end

--判断是否存在RANDOM_POOL键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_random_pool(kvbase, key) end

--判断预设是否存在RANDOM_POOL键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_random_pool_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在RANDOM_POOL键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_random_pool_kv(prefab_key, key) end

--判断物品编号是否存在RANDOM_POOL键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_random_pool_kv(prefab_key, key) end

--判断技能编号是否存在RANDOM_POOL键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_random_pool_kv(prefab_key, key) end

--判断是否存在SCENE_UI键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_scene_ui(kvbase, key) end

--判断预设是否存在SCENE_UI键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_scene_ui_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在SCENE_UI键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_scene_ui_kv(prefab_key, key) end

--判断物品编号是否存在SCENE_UI键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_scene_ui_kv(prefab_key, key) end

--判断技能编号是否存在SCENE_UI键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_scene_ui_kv(prefab_key, key) end

--判断是否存在DAMAGE_TYPE键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_damage_type(kvbase, key) end

--判断预设是否存在DAMAGE_TYPE键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_damage_type_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在DAMAGE_TYPE键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_damage_type_kv(prefab_key, key) end

--判断物品编号是否存在DAMAGE_TYPE键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_damage_type_kv(prefab_key, key) end

--判断技能编号是否存在DAMAGE_TYPE键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_damage_type_kv(prefab_key, key) end

--判断是否存在HARM_TEXT_TYPE_NEW键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_harm_text_type_new(kvbase, key) end

--判断预设是否存在HARM_TEXT_TYPE_NEW键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_harm_text_type_new_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在HARM_TEXT_TYPE_NEW键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_harm_text_type_new_kv(prefab_key, key) end

--判断物品编号是否存在HARM_TEXT_TYPE_NEW键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_harm_text_type_new_kv(prefab_key, key) end

--判断技能编号是否存在HARM_TEXT_TYPE_NEW键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_harm_text_type_new_kv(prefab_key, key) end

--判断是否存在FONT_TYPE键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_font_type(kvbase, key) end

--判断预设是否存在FONT_TYPE键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_font_type_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在FONT_TYPE键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_font_type_kv(prefab_key, key) end

--判断物品编号是否存在FONT_TYPE键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_font_type_kv(prefab_key, key) end

--判断技能编号是否存在FONT_TYPE键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_font_type_kv(prefab_key, key) end

--判断是否存在JUMP_WORD_TRACK键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_jump_word_track(kvbase, key) end

--判断预设是否存在JUMP_WORD_TRACK键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_jump_word_track_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在JUMP_WORD_TRACK键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_jump_word_track_kv(prefab_key, key) end

--判断物品编号是否存在JUMP_WORD_TRACK键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_jump_word_track_kv(prefab_key, key) end

--判断技能编号是否存在JUMP_WORD_TRACK键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_jump_word_track_kv(prefab_key, key) end

--判断是否存在NEW_TIMER键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_new_timer(kvbase, key) end

--判断预设是否存在NEW_TIMER键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_new_timer_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在NEW_TIMER键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_new_timer_kv(prefab_key, key) end

--判断物品编号是否存在NEW_TIMER键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_new_timer_kv(prefab_key, key) end

--判断技能编号是否存在NEW_TIMER键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_new_timer_kv(prefab_key, key) end

--判断是否存在TECH_KEY键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_tech_key(kvbase, key) end

--判断预设是否存在TECH_KEY键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_tech_key_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在TECH_KEY键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_tech_key_kv(prefab_key, key) end

--判断物品编号是否存在TECH_KEY键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_tech_key_kv(prefab_key, key) end

--判断技能编号是否存在TECH_KEY键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_tech_key_kv(prefab_key, key) end

--判断是否存在STORE_KEY键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_store_key(kvbase, key) end

--判断预设是否存在STORE_KEY键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_store_key_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在STORE_KEY键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_store_key_kv(prefab_key, key) end

--判断物品编号是否存在STORE_KEY键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_store_key_kv(prefab_key, key) end

--判断技能编号是否存在STORE_KEY键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_store_key_kv(prefab_key, key) end

--判断是否存在KEYBOARD_KEY键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_keyboard_key(kvbase, key) end

--判断预设是否存在KEYBOARD_KEY键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_keyboard_key_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在KEYBOARD_KEY键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_keyboard_key_kv(prefab_key, key) end

--判断物品编号是否存在KEYBOARD_KEY键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_keyboard_key_kv(prefab_key, key) end

--判断技能编号是否存在KEYBOARD_KEY键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_keyboard_key_kv(prefab_key, key) end

--判断是否存在FUNC_KEYBOARD_KEY键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_func_keyboard_key(kvbase, key) end

--判断预设是否存在FUNC_KEYBOARD_KEY键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_func_keyboard_key_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在FUNC_KEYBOARD_KEY键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_func_keyboard_key_kv(prefab_key, key) end

--判断物品编号是否存在FUNC_KEYBOARD_KEY键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_func_keyboard_key_kv(prefab_key, key) end

--判断技能编号是否存在FUNC_KEYBOARD_KEY键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_func_keyboard_key_kv(prefab_key, key) end

--判断是否存在MOUSE_KEY键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_mouse_key(kvbase, key) end

--判断预设是否存在MOUSE_KEY键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_mouse_key_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在MOUSE_KEY键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_mouse_key_kv(prefab_key, key) end

--判断物品编号是否存在MOUSE_KEY键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_mouse_key_kv(prefab_key, key) end

--判断技能编号是否存在MOUSE_KEY键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_mouse_key_kv(prefab_key, key) end

--判断是否存在MOUSE_WHEEL键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_mouse_wheel(kvbase, key) end

--判断预设是否存在MOUSE_WHEEL键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_mouse_wheel_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在MOUSE_WHEEL键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_mouse_wheel_kv(prefab_key, key) end

--判断物品编号是否存在MOUSE_WHEEL键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_mouse_wheel_kv(prefab_key, key) end

--判断技能编号是否存在MOUSE_WHEEL键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_mouse_wheel_kv(prefab_key, key) end

--判断是否存在MAP键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_map(kvbase, key) end

--判断预设是否存在MAP键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_map_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在MAP键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_map_kv(prefab_key, key) end

--判断物品编号是否存在MAP键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_map_kv(prefab_key, key) end

--判断技能编号是否存在MAP键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_map_kv(prefab_key, key) end

--判断是否存在POST_EFFECT键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_post_effect(kvbase, key) end

--判断预设是否存在POST_EFFECT键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_post_effect_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在POST_EFFECT键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_post_effect_kv(prefab_key, key) end

--判断物品编号是否存在POST_EFFECT键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_post_effect_kv(prefab_key, key) end

--判断技能编号是否存在POST_EFFECT键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_post_effect_kv(prefab_key, key) end

--判断是否存在UNIT_TYPE键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_unit_type(kvbase, key) end

--判断预设是否存在UNIT_TYPE键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_unit_type_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在UNIT_TYPE键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_unit_type_kv(prefab_key, key) end

--判断物品编号是否存在UNIT_TYPE键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_unit_type_kv(prefab_key, key) end

--判断技能编号是否存在UNIT_TYPE键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_unit_type_kv(prefab_key, key) end

--判断是否存在UNIT_COMMAND_TYPE键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_unit_command_type(kvbase, key) end

--判断预设是否存在UNIT_COMMAND_TYPE键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_unit_command_type_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在UNIT_COMMAND_TYPE键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_unit_command_type_kv(prefab_key, key) end

--判断物品编号是否存在UNIT_COMMAND_TYPE键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_unit_command_type_kv(prefab_key, key) end

--判断技能编号是否存在UNIT_COMMAND_TYPE键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_unit_command_type_kv(prefab_key, key) end

--判断是否存在UNIT_GROUP_COMMAND_TYPE键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_unit_group_command_type(kvbase, key) end

--判断预设是否存在UNIT_GROUP_COMMAND_TYPE键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_unit_group_command_type_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在UNIT_GROUP_COMMAND_TYPE键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_unit_group_command_type_kv(prefab_key, key) end

--判断物品编号是否存在UNIT_GROUP_COMMAND_TYPE键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_unit_group_command_type_kv(prefab_key, key) end

--判断技能编号是否存在UNIT_GROUP_COMMAND_TYPE键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_unit_group_command_type_kv(prefab_key, key) end

--判断是否存在MINI_MAP_COLOR_TYPE键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_mini_map_color_type(kvbase, key) end

--判断预设是否存在MINI_MAP_COLOR_TYPE键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_mini_map_color_type_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在MINI_MAP_COLOR_TYPE键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_mini_map_color_type_kv(prefab_key, key) end

--判断物品编号是否存在MINI_MAP_COLOR_TYPE键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_mini_map_color_type_kv(prefab_key, key) end

--判断技能编号是否存在MINI_MAP_COLOR_TYPE键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_mini_map_color_type_kv(prefab_key, key) end

--判断是否存在UNIT_BEHAVIOR键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_unit_behavior(kvbase, key) end

--判断预设是否存在UNIT_BEHAVIOR键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_unit_behavior_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在UNIT_BEHAVIOR键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_unit_behavior_kv(prefab_key, key) end

--判断物品编号是否存在UNIT_BEHAVIOR键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_unit_behavior_kv(prefab_key, key) end

--判断技能编号是否存在UNIT_BEHAVIOR键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_unit_behavior_kv(prefab_key, key) end

--判断是否存在CURVED_PATH键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_curved_path(kvbase, key) end

--判断预设是否存在CURVED_PATH键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_curved_path_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在CURVED_PATH键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_curved_path_kv(prefab_key, key) end

--判断物品编号是否存在CURVED_PATH键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_curved_path_kv(prefab_key, key) end

--判断技能编号是否存在CURVED_PATH键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_curved_path_kv(prefab_key, key) end

--判断是否存在CURVED_PATH_3D键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_curved_path_3d(kvbase, key) end

--判断预设是否存在CURVED_PATH_3D键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_curved_path_3d_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在CURVED_PATH_3D键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_curved_path_3d_kv(prefab_key, key) end

--判断物品编号是否存在CURVED_PATH_3D键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_curved_path_3d_kv(prefab_key, key) end

--判断技能编号是否存在CURVED_PATH_3D键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_curved_path_3d_kv(prefab_key, key) end

--判断是否存在RESCUE_SEEKER_TYPE键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_rescue_seeker_type(kvbase, key) end

--判断预设是否存在RESCUE_SEEKER_TYPE键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_rescue_seeker_type_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在RESCUE_SEEKER_TYPE键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_rescue_seeker_type_kv(prefab_key, key) end

--判断物品编号是否存在RESCUE_SEEKER_TYPE键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_rescue_seeker_type_kv(prefab_key, key) end

--判断技能编号是否存在RESCUE_SEEKER_TYPE键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_rescue_seeker_type_kv(prefab_key, key) end

--判断是否存在RESCUER_TYPE键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_rescuer_type(kvbase, key) end

--判断预设是否存在RESCUER_TYPE键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_rescuer_type_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在RESCUER_TYPE键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_rescuer_type_kv(prefab_key, key) end

--判断物品编号是否存在RESCUER_TYPE键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_rescuer_type_kv(prefab_key, key) end

--判断技能编号是否存在RESCUER_TYPE键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_rescuer_type_kv(prefab_key, key) end

--判断是否存在STORE_ITEM_TYPE键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_store_item_type(kvbase, key) end

--判断预设是否存在STORE_ITEM_TYPE键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_store_item_type_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在STORE_ITEM_TYPE键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_store_item_type_kv(prefab_key, key) end

--判断物品编号是否存在STORE_ITEM_TYPE键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_store_item_type_kv(prefab_key, key) end

--判断技能编号是否存在STORE_ITEM_TYPE键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_store_item_type_kv(prefab_key, key) end

--获取单位编号BOOLEAN键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return boolean # 键值
function GameAPI.get_unit_key_boolean_kv(unit_key, key) end

--获取物品编号BOOLEAN键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return boolean # 键值
function GameAPI.get_item_key_boolean_kv(item_key, key) end

--获取技能编号BOOLEAN键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return boolean # 键值
function GameAPI.get_ability_key_boolean_kv(ability_key, key) end

--获取魔法效果特效编号BOOLEAN键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return boolean # 键值
function GameAPI.get_modifier_key_boolean_kv(modifier_key, key) end

--获取特效编号BOOLEAN键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return boolean # 键值
function GameAPI.get_projectile_key_boolean_kv(projectile_key, key) end

--获取可破坏物编号BOOLEAN键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return boolean # 键值
function GameAPI.get_destructible_key_boolean_kv(destructible_key, key) end

--获取科技编号BOOLEAN键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return boolean # 键值
function GameAPI.get_tech_key_boolean_kv(tech_key, key) end

--获取图片BOOLEAN键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return boolean # 键值
function GameAPI.get_icon_id_boolean_kv(icon_id, key) end

--获取逻辑物理组件类型BOOLEAN键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return boolean # 键值
function GameAPI.get_physics_entity_key_boolean_kv(physics_entity_key, key) end

--获取BOOLEAN键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return boolean # 键值
function GameAPI.get_kv_pair_value_boolean(kvbase, key) end

--获取单位编号INTEGER键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_unit_key_integer_kv(unit_key, key) end

--获取物品编号INTEGER键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_item_key_integer_kv(item_key, key) end

--获取技能编号INTEGER键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_ability_key_integer_kv(ability_key, key) end

--获取魔法效果特效编号INTEGER键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_modifier_key_integer_kv(modifier_key, key) end

--获取特效编号INTEGER键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_projectile_key_integer_kv(projectile_key, key) end

--获取可破坏物编号INTEGER键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_destructible_key_integer_kv(destructible_key, key) end

--获取科技编号INTEGER键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_tech_key_integer_kv(tech_key, key) end

--获取图片INTEGER键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_icon_id_integer_kv(icon_id, key) end

--获取逻辑物理组件类型INTEGER键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_physics_entity_key_integer_kv(physics_entity_key, key) end

--获取INTEGER键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_kv_pair_value_integer(kvbase, key) end

--获取单位编号FLOAT键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.Fixed # 键值
function GameAPI.get_unit_key_float_kv(unit_key, key) end

--获取物品编号FLOAT键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.Fixed # 键值
function GameAPI.get_item_key_float_kv(item_key, key) end

--获取技能编号FLOAT键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.Fixed # 键值
function GameAPI.get_ability_key_float_kv(ability_key, key) end

--获取魔法效果特效编号FLOAT键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.Fixed # 键值
function GameAPI.get_modifier_key_float_kv(modifier_key, key) end

--获取特效编号FLOAT键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.Fixed # 键值
function GameAPI.get_projectile_key_float_kv(projectile_key, key) end

--获取可破坏物编号FLOAT键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.Fixed # 键值
function GameAPI.get_destructible_key_float_kv(destructible_key, key) end

--获取科技编号FLOAT键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.Fixed # 键值
function GameAPI.get_tech_key_float_kv(tech_key, key) end

--获取图片FLOAT键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.Fixed # 键值
function GameAPI.get_icon_id_float_kv(icon_id, key) end

--获取逻辑物理组件类型FLOAT键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.Fixed # 键值
function GameAPI.get_physics_entity_key_float_kv(physics_entity_key, key) end

--获取FLOAT键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.Fixed # 键值
function GameAPI.get_kv_pair_value_float(kvbase, key) end

--获取单位编号STRING键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_unit_key_string_kv(unit_key, key) end

--获取物品编号STRING键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_item_key_string_kv(item_key, key) end

--获取技能编号STRING键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_ability_key_string_kv(ability_key, key) end

--获取魔法效果特效编号STRING键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_modifier_key_string_kv(modifier_key, key) end

--获取特效编号STRING键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_projectile_key_string_kv(projectile_key, key) end

--获取可破坏物编号STRING键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_destructible_key_string_kv(destructible_key, key) end

--获取科技编号STRING键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_tech_key_string_kv(tech_key, key) end

--获取图片STRING键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_icon_id_string_kv(icon_id, key) end

--获取逻辑物理组件类型STRING键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_physics_entity_key_string_kv(physics_entity_key, key) end

--获取STRING键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_kv_pair_value_string(kvbase, key) end

--获取单位编号UI_COMP键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_unit_key_ui_comp_kv(unit_key, key) end

--获取物品编号UI_COMP键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_item_key_ui_comp_kv(item_key, key) end

--获取技能编号UI_COMP键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_ability_key_ui_comp_kv(ability_key, key) end

--获取魔法效果特效编号UI_COMP键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_modifier_key_ui_comp_kv(modifier_key, key) end

--获取特效编号UI_COMP键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_projectile_key_ui_comp_kv(projectile_key, key) end

--获取可破坏物编号UI_COMP键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_destructible_key_ui_comp_kv(destructible_key, key) end

--获取科技编号UI_COMP键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_tech_key_ui_comp_kv(tech_key, key) end

--获取图片UI_COMP键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_icon_id_ui_comp_kv(icon_id, key) end

--获取逻辑物理组件类型UI_COMP键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_physics_entity_key_ui_comp_kv(physics_entity_key, key) end

--获取UI_COMP键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_kv_pair_value_ui_comp(kvbase, key) end

--获取单位编号UI_COMP_TYPE键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_unit_key_ui_comp_type_kv(unit_key, key) end

--获取物品编号UI_COMP_TYPE键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_item_key_ui_comp_type_kv(item_key, key) end

--获取技能编号UI_COMP_TYPE键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_ability_key_ui_comp_type_kv(ability_key, key) end

--获取魔法效果特效编号UI_COMP_TYPE键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_modifier_key_ui_comp_type_kv(modifier_key, key) end

--获取特效编号UI_COMP_TYPE键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_projectile_key_ui_comp_type_kv(projectile_key, key) end

--获取可破坏物编号UI_COMP_TYPE键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_destructible_key_ui_comp_type_kv(destructible_key, key) end

--获取科技编号UI_COMP_TYPE键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_tech_key_ui_comp_type_kv(tech_key, key) end

--获取图片UI_COMP_TYPE键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_icon_id_ui_comp_type_kv(icon_id, key) end

--获取逻辑物理组件类型UI_COMP_TYPE键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_physics_entity_key_ui_comp_type_kv(physics_entity_key, key) end

--获取UI_COMP_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_kv_pair_value_ui_comp_type(kvbase, key) end

--获取单位编号UI_COMP_EVENT_TYPE键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_unit_key_ui_comp_event_type_kv(unit_key, key) end

--获取物品编号UI_COMP_EVENT_TYPE键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_item_key_ui_comp_event_type_kv(item_key, key) end

--获取技能编号UI_COMP_EVENT_TYPE键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_ability_key_ui_comp_event_type_kv(ability_key, key) end

--获取魔法效果特效编号UI_COMP_EVENT_TYPE键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_modifier_key_ui_comp_event_type_kv(modifier_key, key) end

--获取特效编号UI_COMP_EVENT_TYPE键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_projectile_key_ui_comp_event_type_kv(projectile_key, key) end

--获取可破坏物编号UI_COMP_EVENT_TYPE键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_destructible_key_ui_comp_event_type_kv(destructible_key, key) end

--获取科技编号UI_COMP_EVENT_TYPE键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_tech_key_ui_comp_event_type_kv(tech_key, key) end
