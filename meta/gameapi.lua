-- 此文件由 `tools/genGameAPI` 生成，请勿手动修改。
---@meta

---@class py.GameAPI
GameAPI = {}

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

--预设库 添加PROJECTILE_3D键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.ProjectileKey # value
function GameAPI.set_prefab_key_projectile_3d_kv(prefab_conf_key, item_key, key, value) end

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

--预设库 添加MODEL键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.ModelKey # value
function GameAPI.set_prefab_key_model_kv(prefab_conf_key, item_key, key, value) end

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

--添加PROJECTILE_3D键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.ProjectileKey # value
function GameAPI.add_projectile_3d_kv(kvbase, key, item) end

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

--添加MODEL键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.ModelKey # value
function GameAPI.add_model_kv(kvbase, key, item) end

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

--判断是否存在PROJECTILE_3D键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_projectile_3d(kvbase, key) end

--判断预设是否存在PROJECTILE_3D键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_projectile_3d_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在PROJECTILE_3D键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_projectile_3d_kv(prefab_key, key) end

--判断物品编号是否存在PROJECTILE_3D键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_projectile_3d_kv(prefab_key, key) end

--判断技能编号是否存在PROJECTILE_3D键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_projectile_3d_kv(prefab_key, key) end

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

--获取图片UI_COMP_EVENT_TYPE键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_icon_id_ui_comp_event_type_kv(icon_id, key) end

--获取UI_COMP_EVENT_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_kv_pair_value_ui_comp_event_type(kvbase, key) end

--获取单位编号UI_COMP_ATTR键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_unit_key_ui_comp_attr_kv(unit_key, key) end

--获取物品编号UI_COMP_ATTR键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_item_key_ui_comp_attr_kv(item_key, key) end

--获取技能编号UI_COMP_ATTR键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_ability_key_ui_comp_attr_kv(ability_key, key) end

--获取魔法效果特效编号UI_COMP_ATTR键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_modifier_key_ui_comp_attr_kv(modifier_key, key) end

--获取特效编号UI_COMP_ATTR键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_projectile_key_ui_comp_attr_kv(projectile_key, key) end

--获取可破坏物编号UI_COMP_ATTR键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_destructible_key_ui_comp_attr_kv(destructible_key, key) end

--获取科技编号UI_COMP_ATTR键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_tech_key_ui_comp_attr_kv(tech_key, key) end

--获取图片UI_COMP_ATTR键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_icon_id_ui_comp_attr_kv(icon_id, key) end

--获取UI_COMP_ATTR键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_kv_pair_value_ui_comp_attr(kvbase, key) end

--获取单位编号UI_COMP_ALIGN_TYPE键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_unit_key_ui_comp_align_type_kv(unit_key, key) end

--获取物品编号UI_COMP_ALIGN_TYPE键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_item_key_ui_comp_align_type_kv(item_key, key) end

--获取技能编号UI_COMP_ALIGN_TYPE键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_ability_key_ui_comp_align_type_kv(ability_key, key) end

--获取魔法效果特效编号UI_COMP_ALIGN_TYPE键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_modifier_key_ui_comp_align_type_kv(modifier_key, key) end

--获取特效编号UI_COMP_ALIGN_TYPE键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_projectile_key_ui_comp_align_type_kv(projectile_key, key) end

--获取可破坏物编号UI_COMP_ALIGN_TYPE键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_destructible_key_ui_comp_align_type_kv(destructible_key, key) end

--获取科技编号UI_COMP_ALIGN_TYPE键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_tech_key_ui_comp_align_type_kv(tech_key, key) end

--获取图片UI_COMP_ALIGN_TYPE键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_icon_id_ui_comp_align_type_kv(icon_id, key) end

--获取UI_COMP_ALIGN_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_kv_pair_value_ui_comp_align_type(kvbase, key) end

--获取单位编号UI_PREFAB键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_unit_key_ui_prefab_kv(unit_key, key) end

--获取物品编号UI_PREFAB键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_item_key_ui_prefab_kv(item_key, key) end

--获取技能编号UI_PREFAB键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_ability_key_ui_prefab_kv(ability_key, key) end

--获取魔法效果特效编号UI_PREFAB键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_modifier_key_ui_prefab_kv(modifier_key, key) end

--获取特效编号UI_PREFAB键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_projectile_key_ui_prefab_kv(projectile_key, key) end

--获取可破坏物编号UI_PREFAB键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_destructible_key_ui_prefab_kv(destructible_key, key) end

--获取科技编号UI_PREFAB键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_tech_key_ui_prefab_kv(tech_key, key) end

--获取图片UI_PREFAB键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_icon_id_ui_prefab_kv(icon_id, key) end

--获取UI_PREFAB键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_kv_pair_value_ui_prefab(kvbase, key) end

--获取单位编号UI_PREFAB_INSTANCE键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.UIPrefabIns # 键值
function GameAPI.get_unit_key_ui_prefab_instance_kv(unit_key, key) end

--获取物品编号UI_PREFAB_INSTANCE键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.UIPrefabIns # 键值
function GameAPI.get_item_key_ui_prefab_instance_kv(item_key, key) end

--获取技能编号UI_PREFAB_INSTANCE键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.UIPrefabIns # 键值
function GameAPI.get_ability_key_ui_prefab_instance_kv(ability_key, key) end

--获取魔法效果特效编号UI_PREFAB_INSTANCE键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.UIPrefabIns # 键值
function GameAPI.get_modifier_key_ui_prefab_instance_kv(modifier_key, key) end

--获取特效编号UI_PREFAB_INSTANCE键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.UIPrefabIns # 键值
function GameAPI.get_projectile_key_ui_prefab_instance_kv(projectile_key, key) end

--获取可破坏物编号UI_PREFAB_INSTANCE键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.UIPrefabIns # 键值
function GameAPI.get_destructible_key_ui_prefab_instance_kv(destructible_key, key) end

--获取科技编号UI_PREFAB_INSTANCE键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.UIPrefabIns # 键值
function GameAPI.get_tech_key_ui_prefab_instance_kv(tech_key, key) end

--获取图片UI_PREFAB_INSTANCE键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.UIPrefabIns # 键值
function GameAPI.get_icon_id_ui_prefab_instance_kv(icon_id, key) end

--获取UI_PREFAB_INSTANCE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.UIPrefabIns # 键值
function GameAPI.get_kv_pair_value_ui_prefab_instance(kvbase, key) end

--获取单位编号UI_PREFAB_INS_UID键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_unit_key_ui_prefab_ins_uid_kv(unit_key, key) end

--获取物品编号UI_PREFAB_INS_UID键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_item_key_ui_prefab_ins_uid_kv(item_key, key) end

--获取技能编号UI_PREFAB_INS_UID键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_ability_key_ui_prefab_ins_uid_kv(ability_key, key) end

--获取魔法效果特效编号UI_PREFAB_INS_UID键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_modifier_key_ui_prefab_ins_uid_kv(modifier_key, key) end

--获取特效编号UI_PREFAB_INS_UID键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_projectile_key_ui_prefab_ins_uid_kv(projectile_key, key) end

--获取可破坏物编号UI_PREFAB_INS_UID键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_destructible_key_ui_prefab_ins_uid_kv(destructible_key, key) end

--获取科技编号UI_PREFAB_INS_UID键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_tech_key_ui_prefab_ins_uid_kv(tech_key, key) end

--获取图片UI_PREFAB_INS_UID键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_icon_id_ui_prefab_ins_uid_kv(icon_id, key) end

--获取UI_PREFAB_INS_UID键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_kv_pair_value_ui_prefab_ins_uid(kvbase, key) end

--获取单位编号UI_DIRECTION键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_unit_key_ui_direction_kv(unit_key, key) end

--获取物品编号UI_DIRECTION键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_item_key_ui_direction_kv(item_key, key) end

--获取技能编号UI_DIRECTION键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_ability_key_ui_direction_kv(ability_key, key) end

--获取魔法效果特效编号UI_DIRECTION键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_modifier_key_ui_direction_kv(modifier_key, key) end

--获取特效编号UI_DIRECTION键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_projectile_key_ui_direction_kv(projectile_key, key) end

--获取可破坏物编号UI_DIRECTION键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_destructible_key_ui_direction_kv(destructible_key, key) end

--获取科技编号UI_DIRECTION键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_tech_key_ui_direction_kv(tech_key, key) end

--获取图片UI_DIRECTION键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_icon_id_ui_direction_kv(icon_id, key) end

--获取UI_DIRECTION键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_kv_pair_value_ui_direction(kvbase, key) end

--获取单位编号UI_ANIM键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.UIAnimKey # 键值
function GameAPI.get_unit_key_ui_anim_kv(unit_key, key) end

--获取物品编号UI_ANIM键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.UIAnimKey # 键值
function GameAPI.get_item_key_ui_anim_kv(item_key, key) end

--获取技能编号UI_ANIM键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.UIAnimKey # 键值
function GameAPI.get_ability_key_ui_anim_kv(ability_key, key) end

--获取魔法效果特效编号UI_ANIM键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.UIAnimKey # 键值
function GameAPI.get_modifier_key_ui_anim_kv(modifier_key, key) end

--获取特效编号UI_ANIM键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.UIAnimKey # 键值
function GameAPI.get_projectile_key_ui_anim_kv(projectile_key, key) end

--获取可破坏物编号UI_ANIM键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.UIAnimKey # 键值
function GameAPI.get_destructible_key_ui_anim_kv(destructible_key, key) end

--获取科技编号UI_ANIM键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.UIAnimKey # 键值
function GameAPI.get_tech_key_ui_anim_kv(tech_key, key) end

--获取图片UI_ANIM键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.UIAnimKey # 键值
function GameAPI.get_icon_id_ui_anim_kv(icon_id, key) end

--获取UI_ANIM键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.UIAnimKey # 键值
function GameAPI.get_kv_pair_value_ui_anim(kvbase, key) end

--获取单位编号UI_ANIM_CURVE键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_unit_key_ui_anim_curve_kv(unit_key, key) end

--获取物品编号UI_ANIM_CURVE键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_item_key_ui_anim_curve_kv(item_key, key) end

--获取技能编号UI_ANIM_CURVE键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_ability_key_ui_anim_curve_kv(ability_key, key) end

--获取魔法效果特效编号UI_ANIM_CURVE键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_modifier_key_ui_anim_curve_kv(modifier_key, key) end

--获取特效编号UI_ANIM_CURVE键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_projectile_key_ui_anim_curve_kv(projectile_key, key) end

--获取可破坏物编号UI_ANIM_CURVE键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_destructible_key_ui_anim_curve_kv(destructible_key, key) end

--获取科技编号UI_ANIM_CURVE键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_tech_key_ui_anim_curve_kv(tech_key, key) end

--获取图片UI_ANIM_CURVE键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_icon_id_ui_anim_curve_kv(icon_id, key) end

--获取UI_ANIM_CURVE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_kv_pair_value_ui_anim_curve(kvbase, key) end

--获取单位编号AUDIO_CHANNEL键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_unit_key_audio_channel_kv(unit_key, key) end

--获取物品编号AUDIO_CHANNEL键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_item_key_audio_channel_kv(item_key, key) end

--获取技能编号AUDIO_CHANNEL键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_ability_key_audio_channel_kv(ability_key, key) end

--获取魔法效果特效编号AUDIO_CHANNEL键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_modifier_key_audio_channel_kv(modifier_key, key) end

--获取特效编号AUDIO_CHANNEL键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_projectile_key_audio_channel_kv(projectile_key, key) end

--获取可破坏物编号AUDIO_CHANNEL键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_destructible_key_audio_channel_kv(destructible_key, key) end

--获取科技编号AUDIO_CHANNEL键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_tech_key_audio_channel_kv(tech_key, key) end

--获取图片AUDIO_CHANNEL键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_icon_id_audio_channel_kv(icon_id, key) end

--获取AUDIO_CHANNEL键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_kv_pair_value_audio_channel(kvbase, key) end

--获取单位编号UNIT_ENTITY键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.Unit # 键值
function GameAPI.get_unit_key_unit_entity_kv(unit_key, key) end

--获取物品编号UNIT_ENTITY键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.Unit # 键值
function GameAPI.get_item_key_unit_entity_kv(item_key, key) end

--获取技能编号UNIT_ENTITY键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.Unit # 键值
function GameAPI.get_ability_key_unit_entity_kv(ability_key, key) end

--获取魔法效果特效编号UNIT_ENTITY键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.Unit # 键值
function GameAPI.get_modifier_key_unit_entity_kv(modifier_key, key) end

--获取特效编号UNIT_ENTITY键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.Unit # 键值
function GameAPI.get_projectile_key_unit_entity_kv(projectile_key, key) end

--获取可破坏物编号UNIT_ENTITY键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.Unit # 键值
function GameAPI.get_destructible_key_unit_entity_kv(destructible_key, key) end

--获取科技编号UNIT_ENTITY键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.Unit # 键值
function GameAPI.get_tech_key_unit_entity_kv(tech_key, key) end

--获取图片UNIT_ENTITY键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.Unit # 键值
function GameAPI.get_icon_id_unit_entity_kv(icon_id, key) end

--获取UNIT_ENTITY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.Unit # 键值
function GameAPI.get_kv_pair_value_unit_entity(kvbase, key) end

--获取单位编号UNIT_GROUP键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.UnitGroup # 键值
function GameAPI.get_unit_key_unit_group_kv(unit_key, key) end

--获取物品编号UNIT_GROUP键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.UnitGroup # 键值
function GameAPI.get_item_key_unit_group_kv(item_key, key) end

--获取技能编号UNIT_GROUP键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.UnitGroup # 键值
function GameAPI.get_ability_key_unit_group_kv(ability_key, key) end

--获取魔法效果特效编号UNIT_GROUP键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.UnitGroup # 键值
function GameAPI.get_modifier_key_unit_group_kv(modifier_key, key) end

--获取特效编号UNIT_GROUP键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.UnitGroup # 键值
function GameAPI.get_projectile_key_unit_group_kv(projectile_key, key) end

--获取可破坏物编号UNIT_GROUP键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.UnitGroup # 键值
function GameAPI.get_destructible_key_unit_group_kv(destructible_key, key) end

--获取科技编号UNIT_GROUP键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.UnitGroup # 键值
function GameAPI.get_tech_key_unit_group_kv(tech_key, key) end

--获取图片UNIT_GROUP键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.UnitGroup # 键值
function GameAPI.get_icon_id_unit_group_kv(icon_id, key) end

--获取UNIT_GROUP键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.UnitGroup # 键值
function GameAPI.get_kv_pair_value_unit_group(kvbase, key) end

--获取单位编号UNIT_NAME键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.UnitKey # 键值
function GameAPI.get_unit_key_unit_name_kv(unit_key, key) end

--获取物品编号UNIT_NAME键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.UnitKey # 键值
function GameAPI.get_item_key_unit_name_kv(item_key, key) end

--获取技能编号UNIT_NAME键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.UnitKey # 键值
function GameAPI.get_ability_key_unit_name_kv(ability_key, key) end

--获取魔法效果特效编号UNIT_NAME键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.UnitKey # 键值
function GameAPI.get_modifier_key_unit_name_kv(modifier_key, key) end

--获取特效编号UNIT_NAME键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.UnitKey # 键值
function GameAPI.get_projectile_key_unit_name_kv(projectile_key, key) end

--获取可破坏物编号UNIT_NAME键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.UnitKey # 键值
function GameAPI.get_destructible_key_unit_name_kv(destructible_key, key) end

--获取科技编号UNIT_NAME键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.UnitKey # 键值
function GameAPI.get_tech_key_unit_name_kv(tech_key, key) end

--获取图片UNIT_NAME键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.UnitKey # 键值
function GameAPI.get_icon_id_unit_name_kv(icon_id, key) end

--获取UNIT_NAME键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.UnitKey # 键值
function GameAPI.get_kv_pair_value_unit_name(kvbase, key) end

--获取单位编号UNIT_NAME_POOL键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.UnitKeyPool # 键值
function GameAPI.get_unit_key_unit_name_pool_kv(unit_key, key) end

--获取物品编号UNIT_NAME_POOL键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.UnitKeyPool # 键值
function GameAPI.get_item_key_unit_name_pool_kv(item_key, key) end

--获取技能编号UNIT_NAME_POOL键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.UnitKeyPool # 键值
function GameAPI.get_ability_key_unit_name_pool_kv(ability_key, key) end

--获取魔法效果特效编号UNIT_NAME_POOL键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.UnitKeyPool # 键值
function GameAPI.get_modifier_key_unit_name_pool_kv(modifier_key, key) end

--获取特效编号UNIT_NAME_POOL键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.UnitKeyPool # 键值
function GameAPI.get_projectile_key_unit_name_pool_kv(projectile_key, key) end

--获取可破坏物编号UNIT_NAME_POOL键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.UnitKeyPool # 键值
function GameAPI.get_destructible_key_unit_name_pool_kv(destructible_key, key) end

--获取科技编号UNIT_NAME_POOL键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.UnitKeyPool # 键值
function GameAPI.get_tech_key_unit_name_pool_kv(tech_key, key) end

--获取图片UNIT_NAME_POOL键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.UnitKeyPool # 键值
function GameAPI.get_icon_id_unit_name_pool_kv(icon_id, key) end

--获取UNIT_NAME_POOL键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.UnitKeyPool # 键值
function GameAPI.get_kv_pair_value_unit_name_pool(kvbase, key) end

--获取单位编号UNIT_WRITE_ATTRIBUTE键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_unit_key_unit_write_attribute_kv(unit_key, key) end

--获取物品编号UNIT_WRITE_ATTRIBUTE键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_item_key_unit_write_attribute_kv(item_key, key) end

--获取技能编号UNIT_WRITE_ATTRIBUTE键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_ability_key_unit_write_attribute_kv(ability_key, key) end

--获取魔法效果特效编号UNIT_WRITE_ATTRIBUTE键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_modifier_key_unit_write_attribute_kv(modifier_key, key) end

--获取特效编号UNIT_WRITE_ATTRIBUTE键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_projectile_key_unit_write_attribute_kv(projectile_key, key) end

--获取可破坏物编号UNIT_WRITE_ATTRIBUTE键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_destructible_key_unit_write_attribute_kv(destructible_key, key) end

--获取科技编号UNIT_WRITE_ATTRIBUTE键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_tech_key_unit_write_attribute_kv(tech_key, key) end

--获取图片UNIT_WRITE_ATTRIBUTE键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_icon_id_unit_write_attribute_kv(icon_id, key) end

--获取UNIT_WRITE_ATTRIBUTE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_kv_pair_value_unit_write_attribute(kvbase, key) end

--获取单位编号ATTR_ELEMENT键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_unit_key_attr_element_kv(unit_key, key) end

--获取物品编号ATTR_ELEMENT键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_item_key_attr_element_kv(item_key, key) end

--获取技能编号ATTR_ELEMENT键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_ability_key_attr_element_kv(ability_key, key) end

--获取魔法效果特效编号ATTR_ELEMENT键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_modifier_key_attr_element_kv(modifier_key, key) end

--获取特效编号ATTR_ELEMENT键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_projectile_key_attr_element_kv(projectile_key, key) end

--获取可破坏物编号ATTR_ELEMENT键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_destructible_key_attr_element_kv(destructible_key, key) end

--获取科技编号ATTR_ELEMENT键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_tech_key_attr_element_kv(tech_key, key) end

--获取图片ATTR_ELEMENT键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_icon_id_attr_element_kv(icon_id, key) end

--获取ATTR_ELEMENT键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_kv_pair_value_attr_element(kvbase, key) end

--获取单位编号ATTR_ELEMENT_READ键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_unit_key_attr_element_read_kv(unit_key, key) end

--获取物品编号ATTR_ELEMENT_READ键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_item_key_attr_element_read_kv(item_key, key) end

--获取技能编号ATTR_ELEMENT_READ键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_ability_key_attr_element_read_kv(ability_key, key) end

--获取魔法效果特效编号ATTR_ELEMENT_READ键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_modifier_key_attr_element_read_kv(modifier_key, key) end

--获取特效编号ATTR_ELEMENT_READ键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_projectile_key_attr_element_read_kv(projectile_key, key) end

--获取可破坏物编号ATTR_ELEMENT_READ键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_destructible_key_attr_element_read_kv(destructible_key, key) end

--获取科技编号ATTR_ELEMENT_READ键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_tech_key_attr_element_read_kv(tech_key, key) end

--获取图片ATTR_ELEMENT_READ键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_icon_id_attr_element_read_kv(icon_id, key) end

--获取ATTR_ELEMENT_READ键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_kv_pair_value_attr_element_read(kvbase, key) end

--获取单位编号MOVER_ENTITY键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.Mover # 键值
function GameAPI.get_unit_key_mover_entity_kv(unit_key, key) end

--获取物品编号MOVER_ENTITY键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.Mover # 键值
function GameAPI.get_item_key_mover_entity_kv(item_key, key) end

--获取技能编号MOVER_ENTITY键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.Mover # 键值
function GameAPI.get_ability_key_mover_entity_kv(ability_key, key) end

--获取魔法效果特效编号MOVER_ENTITY键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.Mover # 键值
function GameAPI.get_modifier_key_mover_entity_kv(modifier_key, key) end

--获取特效编号MOVER_ENTITY键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.Mover # 键值
function GameAPI.get_projectile_key_mover_entity_kv(projectile_key, key) end

--获取可破坏物编号MOVER_ENTITY键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.Mover # 键值
function GameAPI.get_destructible_key_mover_entity_kv(destructible_key, key) end

--获取科技编号MOVER_ENTITY键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.Mover # 键值
function GameAPI.get_tech_key_mover_entity_kv(tech_key, key) end

--获取图片MOVER_ENTITY键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.Mover # 键值
function GameAPI.get_icon_id_mover_entity_kv(icon_id, key) end

--获取MOVER_ENTITY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.Mover # 键值
function GameAPI.get_kv_pair_value_mover_entity(kvbase, key) end

--获取单位编号IMAGE_QUALITY键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_unit_key_image_quality_kv(unit_key, key) end

--获取物品编号IMAGE_QUALITY键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_item_key_image_quality_kv(item_key, key) end

--获取技能编号IMAGE_QUALITY键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_ability_key_image_quality_kv(ability_key, key) end

--获取魔法效果特效编号IMAGE_QUALITY键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_modifier_key_image_quality_kv(modifier_key, key) end

--获取特效编号IMAGE_QUALITY键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_projectile_key_image_quality_kv(projectile_key, key) end

--获取可破坏物编号IMAGE_QUALITY键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_destructible_key_image_quality_kv(destructible_key, key) end

--获取科技编号IMAGE_QUALITY键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_tech_key_image_quality_kv(tech_key, key) end

--获取图片IMAGE_QUALITY键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_icon_id_image_quality_kv(icon_id, key) end

--获取IMAGE_QUALITY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_kv_pair_value_image_quality(kvbase, key) end

--获取单位编号WINDOW_TYPE_SETTING键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_unit_key_window_type_setting_kv(unit_key, key) end

--获取物品编号WINDOW_TYPE_SETTING键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_item_key_window_type_setting_kv(item_key, key) end

--获取技能编号WINDOW_TYPE_SETTING键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_ability_key_window_type_setting_kv(ability_key, key) end

--获取魔法效果特效编号WINDOW_TYPE_SETTING键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_modifier_key_window_type_setting_kv(modifier_key, key) end

--获取特效编号WINDOW_TYPE_SETTING键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_projectile_key_window_type_setting_kv(projectile_key, key) end

--获取可破坏物编号WINDOW_TYPE_SETTING键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_destructible_key_window_type_setting_kv(destructible_key, key) end

--获取科技编号WINDOW_TYPE_SETTING键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_tech_key_window_type_setting_kv(tech_key, key) end

--获取图片WINDOW_TYPE_SETTING键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_icon_id_window_type_setting_kv(icon_id, key) end

--获取WINDOW_TYPE_SETTING键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_kv_pair_value_window_type_setting(kvbase, key) end

--获取单位编号ITEM_ENTITY键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.Item # 键值
function GameAPI.get_unit_key_item_entity_kv(unit_key, key) end

--获取物品编号ITEM_ENTITY键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.Item # 键值
function GameAPI.get_item_key_item_entity_kv(item_key, key) end

--获取技能编号ITEM_ENTITY键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.Item # 键值
function GameAPI.get_ability_key_item_entity_kv(ability_key, key) end

--获取魔法效果特效编号ITEM_ENTITY键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.Item # 键值
function GameAPI.get_modifier_key_item_entity_kv(modifier_key, key) end

--获取特效编号ITEM_ENTITY键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.Item # 键值
function GameAPI.get_projectile_key_item_entity_kv(projectile_key, key) end

--获取可破坏物编号ITEM_ENTITY键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.Item # 键值
function GameAPI.get_destructible_key_item_entity_kv(destructible_key, key) end

--获取科技编号ITEM_ENTITY键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.Item # 键值
function GameAPI.get_tech_key_item_entity_kv(tech_key, key) end

--获取图片ITEM_ENTITY键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.Item # 键值
function GameAPI.get_icon_id_item_entity_kv(icon_id, key) end

--获取ITEM_ENTITY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.Item # 键值
function GameAPI.get_kv_pair_value_item_entity(kvbase, key) end

--获取单位编号ITEM_GROUP键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.ItemGroup # 键值
function GameAPI.get_unit_key_item_group_kv(unit_key, key) end

--获取物品编号ITEM_GROUP键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.ItemGroup # 键值
function GameAPI.get_item_key_item_group_kv(item_key, key) end

--获取技能编号ITEM_GROUP键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.ItemGroup # 键值
function GameAPI.get_ability_key_item_group_kv(ability_key, key) end

--获取魔法效果特效编号ITEM_GROUP键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.ItemGroup # 键值
function GameAPI.get_modifier_key_item_group_kv(modifier_key, key) end

--获取特效编号ITEM_GROUP键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.ItemGroup # 键值
function GameAPI.get_projectile_key_item_group_kv(projectile_key, key) end

--获取可破坏物编号ITEM_GROUP键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.ItemGroup # 键值
function GameAPI.get_destructible_key_item_group_kv(destructible_key, key) end

--获取科技编号ITEM_GROUP键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.ItemGroup # 键值
function GameAPI.get_tech_key_item_group_kv(tech_key, key) end

--获取图片ITEM_GROUP键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.ItemGroup # 键值
function GameAPI.get_icon_id_item_group_kv(icon_id, key) end

--获取ITEM_GROUP键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.ItemGroup # 键值
function GameAPI.get_kv_pair_value_item_group(kvbase, key) end

--获取单位编号ITEM_NAME键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.ItemKey # 键值
function GameAPI.get_unit_key_item_name_kv(unit_key, key) end

--获取物品编号ITEM_NAME键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.ItemKey # 键值
function GameAPI.get_item_key_item_name_kv(item_key, key) end

--获取技能编号ITEM_NAME键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.ItemKey # 键值
function GameAPI.get_ability_key_item_name_kv(ability_key, key) end

--获取魔法效果特效编号ITEM_NAME键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.ItemKey # 键值
function GameAPI.get_modifier_key_item_name_kv(modifier_key, key) end

--获取特效编号ITEM_NAME键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.ItemKey # 键值
function GameAPI.get_projectile_key_item_name_kv(projectile_key, key) end

--获取可破坏物编号ITEM_NAME键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.ItemKey # 键值
function GameAPI.get_destructible_key_item_name_kv(destructible_key, key) end

--获取科技编号ITEM_NAME键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.ItemKey # 键值
function GameAPI.get_tech_key_item_name_kv(tech_key, key) end

--获取图片ITEM_NAME键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.ItemKey # 键值
function GameAPI.get_icon_id_item_name_kv(icon_id, key) end

--获取ITEM_NAME键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.ItemKey # 键值
function GameAPI.get_kv_pair_value_item_name(kvbase, key) end

--获取单位编号ABILITY键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.Ability # 键值
function GameAPI.get_unit_key_ability_kv(unit_key, key) end

--获取物品编号ABILITY键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.Ability # 键值
function GameAPI.get_item_key_ability_kv(item_key, key) end

--获取技能编号ABILITY键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.Ability # 键值
function GameAPI.get_ability_key_ability_kv(ability_key, key) end

--获取魔法效果特效编号ABILITY键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.Ability # 键值
function GameAPI.get_modifier_key_ability_kv(modifier_key, key) end

--获取特效编号ABILITY键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.Ability # 键值
function GameAPI.get_projectile_key_ability_kv(projectile_key, key) end

--获取可破坏物编号ABILITY键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.Ability # 键值
function GameAPI.get_destructible_key_ability_kv(destructible_key, key) end

--获取科技编号ABILITY键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.Ability # 键值
function GameAPI.get_tech_key_ability_kv(tech_key, key) end

--获取图片ABILITY键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.Ability # 键值
function GameAPI.get_icon_id_ability_kv(icon_id, key) end

--获取ABILITY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.Ability # 键值
function GameAPI.get_kv_pair_value_ability(kvbase, key) end

--获取单位编号ABILITY_TYPE键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_unit_key_ability_type_kv(unit_key, key) end

--获取物品编号ABILITY_TYPE键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_item_key_ability_type_kv(item_key, key) end

--获取技能编号ABILITY_TYPE键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_ability_key_ability_type_kv(ability_key, key) end

--获取魔法效果特效编号ABILITY_TYPE键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_modifier_key_ability_type_kv(modifier_key, key) end

--获取特效编号ABILITY_TYPE键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_projectile_key_ability_type_kv(projectile_key, key) end

--获取可破坏物编号ABILITY_TYPE键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_destructible_key_ability_type_kv(destructible_key, key) end

--获取科技编号ABILITY_TYPE键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_tech_key_ability_type_kv(tech_key, key) end

--获取图片ABILITY_TYPE键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_icon_id_ability_type_kv(icon_id, key) end

--获取ABILITY_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_kv_pair_value_ability_type(kvbase, key) end

--获取单位编号ABILITY_CAST_TYPE键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_unit_key_ability_cast_type_kv(unit_key, key) end

--获取物品编号ABILITY_CAST_TYPE键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_item_key_ability_cast_type_kv(item_key, key) end

--获取技能编号ABILITY_CAST_TYPE键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_ability_key_ability_cast_type_kv(ability_key, key) end

--获取魔法效果特效编号ABILITY_CAST_TYPE键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_modifier_key_ability_cast_type_kv(modifier_key, key) end

--获取特效编号ABILITY_CAST_TYPE键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_projectile_key_ability_cast_type_kv(projectile_key, key) end

--获取可破坏物编号ABILITY_CAST_TYPE键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_destructible_key_ability_cast_type_kv(destructible_key, key) end

--获取科技编号ABILITY_CAST_TYPE键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_tech_key_ability_cast_type_kv(tech_key, key) end

--获取图片ABILITY_CAST_TYPE键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_icon_id_ability_cast_type_kv(icon_id, key) end

--获取ABILITY_CAST_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_kv_pair_value_ability_cast_type(kvbase, key) end

--获取单位编号ABILITY_NAME键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.AbilityKey # 键值
function GameAPI.get_unit_key_ability_name_kv(unit_key, key) end

--获取物品编号ABILITY_NAME键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.AbilityKey # 键值
function GameAPI.get_item_key_ability_name_kv(item_key, key) end

--获取技能编号ABILITY_NAME键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.AbilityKey # 键值
function GameAPI.get_ability_key_ability_name_kv(ability_key, key) end

--获取魔法效果特效编号ABILITY_NAME键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.AbilityKey # 键值
function GameAPI.get_modifier_key_ability_name_kv(modifier_key, key) end

--获取特效编号ABILITY_NAME键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.AbilityKey # 键值
function GameAPI.get_projectile_key_ability_name_kv(projectile_key, key) end

--获取可破坏物编号ABILITY_NAME键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.AbilityKey # 键值
function GameAPI.get_destructible_key_ability_name_kv(destructible_key, key) end

--获取科技编号ABILITY_NAME键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.AbilityKey # 键值
function GameAPI.get_tech_key_ability_name_kv(tech_key, key) end

--获取图片ABILITY_NAME键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.AbilityKey # 键值
function GameAPI.get_icon_id_ability_name_kv(icon_id, key) end

--获取ABILITY_NAME键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.AbilityKey # 键值
function GameAPI.get_kv_pair_value_ability_name(kvbase, key) end

--获取单位编号SKILL_POINTER_TYPE键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_unit_key_skill_pointer_type_kv(unit_key, key) end

--获取物品编号SKILL_POINTER_TYPE键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_item_key_skill_pointer_type_kv(item_key, key) end

--获取技能编号SKILL_POINTER_TYPE键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_ability_key_skill_pointer_type_kv(ability_key, key) end

--获取魔法效果特效编号SKILL_POINTER_TYPE键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_modifier_key_skill_pointer_type_kv(modifier_key, key) end

--获取特效编号SKILL_POINTER_TYPE键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_projectile_key_skill_pointer_type_kv(projectile_key, key) end

--获取可破坏物编号SKILL_POINTER_TYPE键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_destructible_key_skill_pointer_type_kv(destructible_key, key) end

--获取科技编号SKILL_POINTER_TYPE键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_tech_key_skill_pointer_type_kv(tech_key, key) end

--获取图片SKILL_POINTER_TYPE键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_icon_id_skill_pointer_type_kv(icon_id, key) end

--获取SKILL_POINTER_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_kv_pair_value_skill_pointer_type(kvbase, key) end

--获取单位编号MODIFIER_ENTITY键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.ModifierEntity # 键值
function GameAPI.get_unit_key_modifier_entity_kv(unit_key, key) end

--获取物品编号MODIFIER_ENTITY键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.ModifierEntity # 键值
function GameAPI.get_item_key_modifier_entity_kv(item_key, key) end

--获取技能编号MODIFIER_ENTITY键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.ModifierEntity # 键值
function GameAPI.get_ability_key_modifier_entity_kv(ability_key, key) end

--获取魔法效果特效编号MODIFIER_ENTITY键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.ModifierEntity # 键值
function GameAPI.get_modifier_key_modifier_entity_kv(modifier_key, key) end

--获取特效编号MODIFIER_ENTITY键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.ModifierEntity # 键值
function GameAPI.get_projectile_key_modifier_entity_kv(projectile_key, key) end

--获取可破坏物编号MODIFIER_ENTITY键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.ModifierEntity # 键值
function GameAPI.get_destructible_key_modifier_entity_kv(destructible_key, key) end

--获取科技编号MODIFIER_ENTITY键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.ModifierEntity # 键值
function GameAPI.get_tech_key_modifier_entity_kv(tech_key, key) end

--获取图片MODIFIER_ENTITY键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.ModifierEntity # 键值
function GameAPI.get_icon_id_modifier_entity_kv(icon_id, key) end

--获取MODIFIER_ENTITY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.ModifierEntity # 键值
function GameAPI.get_kv_pair_value_modifier_entity(kvbase, key) end

--获取单位编号MODIFIER_TYPE键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.ModifierType # 键值
function GameAPI.get_unit_key_modifier_type_kv(unit_key, key) end

--获取物品编号MODIFIER_TYPE键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.ModifierType # 键值
function GameAPI.get_item_key_modifier_type_kv(item_key, key) end

--获取技能编号MODIFIER_TYPE键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.ModifierType # 键值
function GameAPI.get_ability_key_modifier_type_kv(ability_key, key) end

--获取魔法效果特效编号MODIFIER_TYPE键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.ModifierType # 键值
function GameAPI.get_modifier_key_modifier_type_kv(modifier_key, key) end

--获取特效编号MODIFIER_TYPE键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.ModifierType # 键值
function GameAPI.get_projectile_key_modifier_type_kv(projectile_key, key) end

--获取可破坏物编号MODIFIER_TYPE键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.ModifierType # 键值
function GameAPI.get_destructible_key_modifier_type_kv(destructible_key, key) end

--获取科技编号MODIFIER_TYPE键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.ModifierType # 键值
function GameAPI.get_tech_key_modifier_type_kv(tech_key, key) end

--获取图片MODIFIER_TYPE键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.ModifierType # 键值
function GameAPI.get_icon_id_modifier_type_kv(icon_id, key) end

--获取MODIFIER_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.ModifierType # 键值
function GameAPI.get_kv_pair_value_modifier_type(kvbase, key) end

--获取单位编号MODIFIER_EFFECT_TYPE键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.ModifierEffectType # 键值
function GameAPI.get_unit_key_modifier_effect_type_kv(unit_key, key) end

--获取物品编号MODIFIER_EFFECT_TYPE键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.ModifierEffectType # 键值
function GameAPI.get_item_key_modifier_effect_type_kv(item_key, key) end

--获取技能编号MODIFIER_EFFECT_TYPE键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.ModifierEffectType # 键值
function GameAPI.get_ability_key_modifier_effect_type_kv(ability_key, key) end

--获取魔法效果特效编号MODIFIER_EFFECT_TYPE键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.ModifierEffectType # 键值
function GameAPI.get_modifier_key_modifier_effect_type_kv(modifier_key, key) end

--获取特效编号MODIFIER_EFFECT_TYPE键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.ModifierEffectType # 键值
function GameAPI.get_projectile_key_modifier_effect_type_kv(projectile_key, key) end

--获取可破坏物编号MODIFIER_EFFECT_TYPE键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.ModifierEffectType # 键值
function GameAPI.get_destructible_key_modifier_effect_type_kv(destructible_key, key) end

--获取科技编号MODIFIER_EFFECT_TYPE键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.ModifierEffectType # 键值
function GameAPI.get_tech_key_modifier_effect_type_kv(tech_key, key) end

--获取图片MODIFIER_EFFECT_TYPE键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.ModifierEffectType # 键值
function GameAPI.get_icon_id_modifier_effect_type_kv(icon_id, key) end

--获取MODIFIER_EFFECT_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.ModifierEffectType # 键值
function GameAPI.get_kv_pair_value_modifier_effect_type(kvbase, key) end

--获取单位编号MODIFIER键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.ModifierKey # 键值
function GameAPI.get_unit_key_modifier_kv(unit_key, key) end

--获取物品编号MODIFIER键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.ModifierKey # 键值
function GameAPI.get_item_key_modifier_kv(item_key, key) end

--获取技能编号MODIFIER键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.ModifierKey # 键值
function GameAPI.get_ability_key_modifier_kv(ability_key, key) end

--获取魔法效果特效编号MODIFIER键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.ModifierKey # 键值
function GameAPI.get_modifier_key_modifier_kv(modifier_key, key) end

--获取特效编号MODIFIER键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.ModifierKey # 键值
function GameAPI.get_projectile_key_modifier_kv(projectile_key, key) end

--获取可破坏物编号MODIFIER键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.ModifierKey # 键值
function GameAPI.get_destructible_key_modifier_kv(destructible_key, key) end

--获取科技编号MODIFIER键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.ModifierKey # 键值
function GameAPI.get_tech_key_modifier_kv(tech_key, key) end

--获取图片MODIFIER键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.ModifierKey # 键值
function GameAPI.get_icon_id_modifier_kv(icon_id, key) end

--获取MODIFIER键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.ModifierKey # 键值
function GameAPI.get_kv_pair_value_modifier(kvbase, key) end

--获取单位编号PROJECTILE键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.ProjectileKey # 键值
function GameAPI.get_unit_key_projectile_kv(unit_key, key) end

--获取物品编号PROJECTILE键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.ProjectileKey # 键值
function GameAPI.get_item_key_projectile_kv(item_key, key) end

--获取技能编号PROJECTILE键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.ProjectileKey # 键值
function GameAPI.get_ability_key_projectile_kv(ability_key, key) end

--获取魔法效果特效编号PROJECTILE键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.ProjectileKey # 键值
function GameAPI.get_modifier_key_projectile_kv(modifier_key, key) end

--获取特效编号PROJECTILE键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.ProjectileKey # 键值
function GameAPI.get_projectile_key_projectile_kv(projectile_key, key) end

--获取可破坏物编号PROJECTILE键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.ProjectileKey # 键值
function GameAPI.get_destructible_key_projectile_kv(destructible_key, key) end

--获取科技编号PROJECTILE键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.ProjectileKey # 键值
function GameAPI.get_tech_key_projectile_kv(tech_key, key) end

--获取图片PROJECTILE键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.ProjectileKey # 键值
function GameAPI.get_icon_id_projectile_kv(icon_id, key) end

--获取PROJECTILE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.ProjectileKey # 键值
function GameAPI.get_kv_pair_value_projectile(kvbase, key) end

--获取单位编号PROJECTILE_3D键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.ProjectileKey # 键值
function GameAPI.get_unit_key_projectile_3d_kv(unit_key, key) end

--获取物品编号PROJECTILE_3D键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.ProjectileKey # 键值
function GameAPI.get_item_key_projectile_3d_kv(item_key, key) end

--获取技能编号PROJECTILE_3D键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.ProjectileKey # 键值
function GameAPI.get_ability_key_projectile_3d_kv(ability_key, key) end

--获取魔法效果特效编号PROJECTILE_3D键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.ProjectileKey # 键值
function GameAPI.get_modifier_key_projectile_3d_kv(modifier_key, key) end

--获取特效编号PROJECTILE_3D键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.ProjectileKey # 键值
function GameAPI.get_projectile_key_projectile_3d_kv(projectile_key, key) end

--获取可破坏物编号PROJECTILE_3D键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.ProjectileKey # 键值
function GameAPI.get_destructible_key_projectile_3d_kv(destructible_key, key) end

--获取科技编号PROJECTILE_3D键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.ProjectileKey # 键值
function GameAPI.get_tech_key_projectile_3d_kv(tech_key, key) end

--获取图片PROJECTILE_3D键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.ProjectileKey # 键值
function GameAPI.get_icon_id_projectile_3d_kv(icon_id, key) end

--获取PROJECTILE_3D键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.ProjectileKey # 键值
function GameAPI.get_kv_pair_value_projectile_3d(kvbase, key) end

--获取单位编号PROJECTILE_ENTITY键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.ProjectileEntity # 键值
function GameAPI.get_unit_key_projectile_entity_kv(unit_key, key) end

--获取物品编号PROJECTILE_ENTITY键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.ProjectileEntity # 键值
function GameAPI.get_item_key_projectile_entity_kv(item_key, key) end

--获取技能编号PROJECTILE_ENTITY键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.ProjectileEntity # 键值
function GameAPI.get_ability_key_projectile_entity_kv(ability_key, key) end

--获取魔法效果特效编号PROJECTILE_ENTITY键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.ProjectileEntity # 键值
function GameAPI.get_modifier_key_projectile_entity_kv(modifier_key, key) end

--获取特效编号PROJECTILE_ENTITY键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.ProjectileEntity # 键值
function GameAPI.get_projectile_key_projectile_entity_kv(projectile_key, key) end

--获取可破坏物编号PROJECTILE_ENTITY键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.ProjectileEntity # 键值
function GameAPI.get_destructible_key_projectile_entity_kv(destructible_key, key) end

--获取科技编号PROJECTILE_ENTITY键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.ProjectileEntity # 键值
function GameAPI.get_tech_key_projectile_entity_kv(tech_key, key) end

--获取图片PROJECTILE_ENTITY键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.ProjectileEntity # 键值
function GameAPI.get_icon_id_projectile_entity_kv(icon_id, key) end

--获取PROJECTILE_ENTITY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.ProjectileEntity # 键值
function GameAPI.get_kv_pair_value_projectile_entity(kvbase, key) end

--获取单位编号PROJECTILE_GROUP键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.ProjectileGroup # 键值
function GameAPI.get_unit_key_projectile_group_kv(unit_key, key) end

--获取物品编号PROJECTILE_GROUP键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.ProjectileGroup # 键值
function GameAPI.get_item_key_projectile_group_kv(item_key, key) end

--获取技能编号PROJECTILE_GROUP键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.ProjectileGroup # 键值
function GameAPI.get_ability_key_projectile_group_kv(ability_key, key) end

--获取魔法效果特效编号PROJECTILE_GROUP键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.ProjectileGroup # 键值
function GameAPI.get_modifier_key_projectile_group_kv(modifier_key, key) end

--获取特效编号PROJECTILE_GROUP键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.ProjectileGroup # 键值
function GameAPI.get_projectile_key_projectile_group_kv(projectile_key, key) end

--获取可破坏物编号PROJECTILE_GROUP键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.ProjectileGroup # 键值
function GameAPI.get_destructible_key_projectile_group_kv(destructible_key, key) end

--获取科技编号PROJECTILE_GROUP键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.ProjectileGroup # 键值
function GameAPI.get_tech_key_projectile_group_kv(tech_key, key) end

--获取图片PROJECTILE_GROUP键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.ProjectileGroup # 键值
function GameAPI.get_icon_id_projectile_group_kv(icon_id, key) end

--获取PROJECTILE_GROUP键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.ProjectileGroup # 键值
function GameAPI.get_kv_pair_value_projectile_group(kvbase, key) end

--获取单位编号DESTRUCTIBLE_ENTITY键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.Destructible # 键值
function GameAPI.get_unit_key_destructible_entity_kv(unit_key, key) end

--获取物品编号DESTRUCTIBLE_ENTITY键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.Destructible # 键值
function GameAPI.get_item_key_destructible_entity_kv(item_key, key) end

--获取技能编号DESTRUCTIBLE_ENTITY键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.Destructible # 键值
function GameAPI.get_ability_key_destructible_entity_kv(ability_key, key) end

--获取魔法效果特效编号DESTRUCTIBLE_ENTITY键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.Destructible # 键值
function GameAPI.get_modifier_key_destructible_entity_kv(modifier_key, key) end

--获取特效编号DESTRUCTIBLE_ENTITY键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.Destructible # 键值
function GameAPI.get_projectile_key_destructible_entity_kv(projectile_key, key) end

--获取可破坏物编号DESTRUCTIBLE_ENTITY键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.Destructible # 键值
function GameAPI.get_destructible_key_destructible_entity_kv(destructible_key, key) end

--获取科技编号DESTRUCTIBLE_ENTITY键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.Destructible # 键值
function GameAPI.get_tech_key_destructible_entity_kv(tech_key, key) end

--获取图片DESTRUCTIBLE_ENTITY键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.Destructible # 键值
function GameAPI.get_icon_id_destructible_entity_kv(icon_id, key) end

--获取DESTRUCTIBLE_ENTITY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.Destructible # 键值
function GameAPI.get_kv_pair_value_destructible_entity(kvbase, key) end

--获取单位编号DESTRUCTIBLE_NAME键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.DestructibleKey # 键值
function GameAPI.get_unit_key_destructible_name_kv(unit_key, key) end

--获取物品编号DESTRUCTIBLE_NAME键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.DestructibleKey # 键值
function GameAPI.get_item_key_destructible_name_kv(item_key, key) end

--获取技能编号DESTRUCTIBLE_NAME键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.DestructibleKey # 键值
function GameAPI.get_ability_key_destructible_name_kv(ability_key, key) end

--获取魔法效果特效编号DESTRUCTIBLE_NAME键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.DestructibleKey # 键值
function GameAPI.get_modifier_key_destructible_name_kv(modifier_key, key) end

--获取特效编号DESTRUCTIBLE_NAME键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.DestructibleKey # 键值
function GameAPI.get_projectile_key_destructible_name_kv(projectile_key, key) end

--获取可破坏物编号DESTRUCTIBLE_NAME键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.DestructibleKey # 键值
function GameAPI.get_destructible_key_destructible_name_kv(destructible_key, key) end

--获取科技编号DESTRUCTIBLE_NAME键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.DestructibleKey # 键值
function GameAPI.get_tech_key_destructible_name_kv(tech_key, key) end

--获取图片DESTRUCTIBLE_NAME键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.DestructibleKey # 键值
function GameAPI.get_icon_id_destructible_name_kv(icon_id, key) end

--获取DESTRUCTIBLE_NAME键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.DestructibleKey # 键值
function GameAPI.get_kv_pair_value_destructible_name(kvbase, key) end

--获取单位编号SOUND_ENTITY键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.SoundEntity # 键值
function GameAPI.get_unit_key_sound_entity_kv(unit_key, key) end

--获取物品编号SOUND_ENTITY键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.SoundEntity # 键值
function GameAPI.get_item_key_sound_entity_kv(item_key, key) end

--获取技能编号SOUND_ENTITY键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.SoundEntity # 键值
function GameAPI.get_ability_key_sound_entity_kv(ability_key, key) end

--获取魔法效果特效编号SOUND_ENTITY键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.SoundEntity # 键值
function GameAPI.get_modifier_key_sound_entity_kv(modifier_key, key) end

--获取特效编号SOUND_ENTITY键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.SoundEntity # 键值
function GameAPI.get_projectile_key_sound_entity_kv(projectile_key, key) end

--获取可破坏物编号SOUND_ENTITY键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.SoundEntity # 键值
function GameAPI.get_destructible_key_sound_entity_kv(destructible_key, key) end

--获取科技编号SOUND_ENTITY键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.SoundEntity # 键值
function GameAPI.get_tech_key_sound_entity_kv(tech_key, key) end

--获取图片SOUND_ENTITY键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.SoundEntity # 键值
function GameAPI.get_icon_id_sound_entity_kv(icon_id, key) end

--获取SOUND_ENTITY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.SoundEntity # 键值
function GameAPI.get_kv_pair_value_sound_entity(kvbase, key) end

--获取单位编号AUDIO_KEY键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.AudioKey # 键值
function GameAPI.get_unit_key_audio_key_kv(unit_key, key) end

--获取物品编号AUDIO_KEY键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.AudioKey # 键值
function GameAPI.get_item_key_audio_key_kv(item_key, key) end

--获取技能编号AUDIO_KEY键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.AudioKey # 键值
function GameAPI.get_ability_key_audio_key_kv(ability_key, key) end

--获取魔法效果特效编号AUDIO_KEY键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.AudioKey # 键值
function GameAPI.get_modifier_key_audio_key_kv(modifier_key, key) end

--获取特效编号AUDIO_KEY键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.AudioKey # 键值
function GameAPI.get_projectile_key_audio_key_kv(projectile_key, key) end

--获取可破坏物编号AUDIO_KEY键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.AudioKey # 键值
function GameAPI.get_destructible_key_audio_key_kv(destructible_key, key) end

--获取科技编号AUDIO_KEY键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.AudioKey # 键值
function GameAPI.get_tech_key_audio_key_kv(tech_key, key) end

--获取图片AUDIO_KEY键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.AudioKey # 键值
function GameAPI.get_icon_id_audio_key_kv(icon_id, key) end

--获取AUDIO_KEY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.AudioKey # 键值
function GameAPI.get_kv_pair_value_audio_key(kvbase, key) end

--获取单位编号GAME_MODE键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.GameMode # 键值
function GameAPI.get_unit_key_game_mode_kv(unit_key, key) end

--获取物品编号GAME_MODE键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.GameMode # 键值
function GameAPI.get_item_key_game_mode_kv(item_key, key) end

--获取技能编号GAME_MODE键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.GameMode # 键值
function GameAPI.get_ability_key_game_mode_kv(ability_key, key) end

--获取魔法效果特效编号GAME_MODE键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.GameMode # 键值
function GameAPI.get_modifier_key_game_mode_kv(modifier_key, key) end

--获取特效编号GAME_MODE键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.GameMode # 键值
function GameAPI.get_projectile_key_game_mode_kv(projectile_key, key) end

--获取可破坏物编号GAME_MODE键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.GameMode # 键值
function GameAPI.get_destructible_key_game_mode_kv(destructible_key, key) end

--获取科技编号GAME_MODE键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.GameMode # 键值
function GameAPI.get_tech_key_game_mode_kv(tech_key, key) end

--获取图片GAME_MODE键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.GameMode # 键值
function GameAPI.get_icon_id_game_mode_kv(icon_id, key) end

--获取GAME_MODE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.GameMode # 键值
function GameAPI.get_kv_pair_value_game_mode(kvbase, key) end

--获取单位编号PLAYER键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.Role # 键值
function GameAPI.get_unit_key_player_kv(unit_key, key) end

--获取物品编号PLAYER键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.Role # 键值
function GameAPI.get_item_key_player_kv(item_key, key) end

--获取技能编号PLAYER键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.Role # 键值
function GameAPI.get_ability_key_player_kv(ability_key, key) end

--获取魔法效果特效编号PLAYER键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.Role # 键值
function GameAPI.get_modifier_key_player_kv(modifier_key, key) end

--获取特效编号PLAYER键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.Role # 键值
function GameAPI.get_projectile_key_player_kv(projectile_key, key) end

--获取可破坏物编号PLAYER键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.Role # 键值
function GameAPI.get_destructible_key_player_kv(destructible_key, key) end

--获取科技编号PLAYER键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.Role # 键值
function GameAPI.get_tech_key_player_kv(tech_key, key) end

--获取图片PLAYER键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.Role # 键值
function GameAPI.get_icon_id_player_kv(icon_id, key) end

--获取PLAYER键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.Role # 键值
function GameAPI.get_kv_pair_value_player(kvbase, key) end

--获取单位编号PLAYER_GROUP键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.RoleGroup # 键值
function GameAPI.get_unit_key_player_group_kv(unit_key, key) end

--获取物品编号PLAYER_GROUP键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.RoleGroup # 键值
function GameAPI.get_item_key_player_group_kv(item_key, key) end

--获取技能编号PLAYER_GROUP键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.RoleGroup # 键值
function GameAPI.get_ability_key_player_group_kv(ability_key, key) end

--获取魔法效果特效编号PLAYER_GROUP键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.RoleGroup # 键值
function GameAPI.get_modifier_key_player_group_kv(modifier_key, key) end

--获取特效编号PLAYER_GROUP键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.RoleGroup # 键值
function GameAPI.get_projectile_key_player_group_kv(projectile_key, key) end

--获取可破坏物编号PLAYER_GROUP键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.RoleGroup # 键值
function GameAPI.get_destructible_key_player_group_kv(destructible_key, key) end

--获取科技编号PLAYER_GROUP键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.RoleGroup # 键值
function GameAPI.get_tech_key_player_group_kv(tech_key, key) end

--获取图片PLAYER_GROUP键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.RoleGroup # 键值
function GameAPI.get_icon_id_player_group_kv(icon_id, key) end

--获取PLAYER_GROUP键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.RoleGroup # 键值
function GameAPI.get_kv_pair_value_player_group(kvbase, key) end

--获取单位编号ROLE_RES_KEY键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.RoleResKey # 键值
function GameAPI.get_unit_key_role_res_key_kv(unit_key, key) end

--获取物品编号ROLE_RES_KEY键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.RoleResKey # 键值
function GameAPI.get_item_key_role_res_key_kv(item_key, key) end

--获取技能编号ROLE_RES_KEY键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.RoleResKey # 键值
function GameAPI.get_ability_key_role_res_key_kv(ability_key, key) end

--获取魔法效果特效编号ROLE_RES_KEY键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.RoleResKey # 键值
function GameAPI.get_modifier_key_role_res_key_kv(modifier_key, key) end

--获取特效编号ROLE_RES_KEY键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.RoleResKey # 键值
function GameAPI.get_projectile_key_role_res_key_kv(projectile_key, key) end

--获取可破坏物编号ROLE_RES_KEY键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.RoleResKey # 键值
function GameAPI.get_destructible_key_role_res_key_kv(destructible_key, key) end

--获取科技编号ROLE_RES_KEY键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.RoleResKey # 键值
function GameAPI.get_tech_key_role_res_key_kv(tech_key, key) end

--获取图片ROLE_RES_KEY键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.RoleResKey # 键值
function GameAPI.get_icon_id_role_res_key_kv(icon_id, key) end

--获取ROLE_RES_KEY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.RoleResKey # 键值
function GameAPI.get_kv_pair_value_role_res_key(kvbase, key) end

--获取单位编号ROLE_STATUS键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.RoleStatus # 键值
function GameAPI.get_unit_key_role_status_kv(unit_key, key) end

--获取物品编号ROLE_STATUS键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.RoleStatus # 键值
function GameAPI.get_item_key_role_status_kv(item_key, key) end

--获取技能编号ROLE_STATUS键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.RoleStatus # 键值
function GameAPI.get_ability_key_role_status_kv(ability_key, key) end

--获取魔法效果特效编号ROLE_STATUS键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.RoleStatus # 键值
function GameAPI.get_modifier_key_role_status_kv(modifier_key, key) end

--获取特效编号ROLE_STATUS键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.RoleStatus # 键值
function GameAPI.get_projectile_key_role_status_kv(projectile_key, key) end

--获取可破坏物编号ROLE_STATUS键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.RoleStatus # 键值
function GameAPI.get_destructible_key_role_status_kv(destructible_key, key) end

--获取科技编号ROLE_STATUS键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.RoleStatus # 键值
function GameAPI.get_tech_key_role_status_kv(tech_key, key) end

--获取图片ROLE_STATUS键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.RoleStatus # 键值
function GameAPI.get_icon_id_role_status_kv(icon_id, key) end

--获取ROLE_STATUS键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.RoleStatus # 键值
function GameAPI.get_kv_pair_value_role_status(kvbase, key) end

--获取单位编号ROLE_TYPE键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.RoleType # 键值
function GameAPI.get_unit_key_role_type_kv(unit_key, key) end

--获取物品编号ROLE_TYPE键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.RoleType # 键值
function GameAPI.get_item_key_role_type_kv(item_key, key) end

--获取技能编号ROLE_TYPE键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.RoleType # 键值
function GameAPI.get_ability_key_role_type_kv(ability_key, key) end

--获取魔法效果特效编号ROLE_TYPE键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.RoleType # 键值
function GameAPI.get_modifier_key_role_type_kv(modifier_key, key) end

--获取特效编号ROLE_TYPE键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.RoleType # 键值
function GameAPI.get_projectile_key_role_type_kv(projectile_key, key) end

--获取可破坏物编号ROLE_TYPE键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.RoleType # 键值
function GameAPI.get_destructible_key_role_type_kv(destructible_key, key) end

--获取科技编号ROLE_TYPE键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.RoleType # 键值
function GameAPI.get_tech_key_role_type_kv(tech_key, key) end

--获取图片ROLE_TYPE键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.RoleType # 键值
function GameAPI.get_icon_id_role_type_kv(icon_id, key) end

--获取ROLE_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.RoleType # 键值
function GameAPI.get_kv_pair_value_role_type(kvbase, key) end

--获取单位编号ROLE_RELATION键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.RoleRelation # 键值
function GameAPI.get_unit_key_role_relation_kv(unit_key, key) end

--获取物品编号ROLE_RELATION键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.RoleRelation # 键值
function GameAPI.get_item_key_role_relation_kv(item_key, key) end

--获取技能编号ROLE_RELATION键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.RoleRelation # 键值
function GameAPI.get_ability_key_role_relation_kv(ability_key, key) end

--获取魔法效果特效编号ROLE_RELATION键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.RoleRelation # 键值
function GameAPI.get_modifier_key_role_relation_kv(modifier_key, key) end

--获取特效编号ROLE_RELATION键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.RoleRelation # 键值
function GameAPI.get_projectile_key_role_relation_kv(projectile_key, key) end

--获取可破坏物编号ROLE_RELATION键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.RoleRelation # 键值
function GameAPI.get_destructible_key_role_relation_kv(destructible_key, key) end

--获取科技编号ROLE_RELATION键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.RoleRelation # 键值
function GameAPI.get_tech_key_role_relation_kv(tech_key, key) end

--获取图片ROLE_RELATION键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.RoleRelation # 键值
function GameAPI.get_icon_id_role_relation_kv(icon_id, key) end

--获取ROLE_RELATION键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.RoleRelation # 键值
function GameAPI.get_kv_pair_value_role_relation(kvbase, key) end

--获取单位编号TEAM键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.Camp # 键值
function GameAPI.get_unit_key_team_kv(unit_key, key) end

--获取物品编号TEAM键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.Camp # 键值
function GameAPI.get_item_key_team_kv(item_key, key) end

--获取技能编号TEAM键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.Camp # 键值
function GameAPI.get_ability_key_team_kv(ability_key, key) end

--获取魔法效果特效编号TEAM键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.Camp # 键值
function GameAPI.get_modifier_key_team_kv(modifier_key, key) end

--获取特效编号TEAM键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.Camp # 键值
function GameAPI.get_projectile_key_team_kv(projectile_key, key) end

--获取可破坏物编号TEAM键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.Camp # 键值
function GameAPI.get_destructible_key_team_kv(destructible_key, key) end

--获取科技编号TEAM键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.Camp # 键值
function GameAPI.get_tech_key_team_kv(tech_key, key) end

--获取图片TEAM键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.Camp # 键值
function GameAPI.get_icon_id_team_kv(icon_id, key) end

--获取TEAM键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.Camp # 键值
function GameAPI.get_kv_pair_value_team(kvbase, key) end

--获取单位编号POINT键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.FPoint # 键值
function GameAPI.get_unit_key_point_kv(unit_key, key) end

--获取物品编号POINT键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.FPoint # 键值
function GameAPI.get_item_key_point_kv(item_key, key) end

--获取技能编号POINT键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.FPoint # 键值
function GameAPI.get_ability_key_point_kv(ability_key, key) end

--获取魔法效果特效编号POINT键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.FPoint # 键值
function GameAPI.get_modifier_key_point_kv(modifier_key, key) end

--获取特效编号POINT键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.FPoint # 键值
function GameAPI.get_projectile_key_point_kv(projectile_key, key) end

--获取可破坏物编号POINT键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.FPoint # 键值
function GameAPI.get_destructible_key_point_kv(destructible_key, key) end

--获取科技编号POINT键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.FPoint # 键值
function GameAPI.get_tech_key_point_kv(tech_key, key) end

--获取图片POINT键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.FPoint # 键值
function GameAPI.get_icon_id_point_kv(icon_id, key) end

--获取POINT键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.FPoint # 键值
function GameAPI.get_kv_pair_value_point(kvbase, key) end

--获取单位编号VECTOR3键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.FVector3 # 键值
function GameAPI.get_unit_key_vector3_kv(unit_key, key) end

--获取物品编号VECTOR3键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.FVector3 # 键值
function GameAPI.get_item_key_vector3_kv(item_key, key) end

--获取技能编号VECTOR3键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.FVector3 # 键值
function GameAPI.get_ability_key_vector3_kv(ability_key, key) end

--获取魔法效果特效编号VECTOR3键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.FVector3 # 键值
function GameAPI.get_modifier_key_vector3_kv(modifier_key, key) end

--获取特效编号VECTOR3键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.FVector3 # 键值
function GameAPI.get_projectile_key_vector3_kv(projectile_key, key) end

--获取可破坏物编号VECTOR3键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.FVector3 # 键值
function GameAPI.get_destructible_key_vector3_kv(destructible_key, key) end

--获取科技编号VECTOR3键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.FVector3 # 键值
function GameAPI.get_tech_key_vector3_kv(tech_key, key) end

--获取图片VECTOR3键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.FVector3 # 键值
function GameAPI.get_icon_id_vector3_kv(icon_id, key) end

--获取VECTOR3键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.FVector3 # 键值
function GameAPI.get_kv_pair_value_vector3(kvbase, key) end

--获取单位编号ROTATION键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.FRotation # 键值
function GameAPI.get_unit_key_rotation_kv(unit_key, key) end

--获取物品编号ROTATION键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.FRotation # 键值
function GameAPI.get_item_key_rotation_kv(item_key, key) end

--获取技能编号ROTATION键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.FRotation # 键值
function GameAPI.get_ability_key_rotation_kv(ability_key, key) end

--获取魔法效果特效编号ROTATION键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.FRotation # 键值
function GameAPI.get_modifier_key_rotation_kv(modifier_key, key) end

--获取特效编号ROTATION键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.FRotation # 键值
function GameAPI.get_projectile_key_rotation_kv(projectile_key, key) end

--获取可破坏物编号ROTATION键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.FRotation # 键值
function GameAPI.get_destructible_key_rotation_kv(destructible_key, key) end

--获取科技编号ROTATION键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.FRotation # 键值
function GameAPI.get_tech_key_rotation_kv(tech_key, key) end

--获取图片ROTATION键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.FRotation # 键值
function GameAPI.get_icon_id_rotation_kv(icon_id, key) end

--获取ROTATION键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.FRotation # 键值
function GameAPI.get_kv_pair_value_rotation(kvbase, key) end

--获取单位编号POINT_LIST键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.Road # 键值
function GameAPI.get_unit_key_point_list_kv(unit_key, key) end

--获取物品编号POINT_LIST键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.Road # 键值
function GameAPI.get_item_key_point_list_kv(item_key, key) end

--获取技能编号POINT_LIST键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.Road # 键值
function GameAPI.get_ability_key_point_list_kv(ability_key, key) end

--获取魔法效果特效编号POINT_LIST键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.Road # 键值
function GameAPI.get_modifier_key_point_list_kv(modifier_key, key) end

--获取特效编号POINT_LIST键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.Road # 键值
function GameAPI.get_projectile_key_point_list_kv(projectile_key, key) end

--获取可破坏物编号POINT_LIST键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.Road # 键值
function GameAPI.get_destructible_key_point_list_kv(destructible_key, key) end

--获取科技编号POINT_LIST键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.Road # 键值
function GameAPI.get_tech_key_point_list_kv(tech_key, key) end

--获取图片POINT_LIST键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.Road # 键值
function GameAPI.get_icon_id_point_list_kv(icon_id, key) end

--获取POINT_LIST键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.Road # 键值
function GameAPI.get_kv_pair_value_point_list(kvbase, key) end

--获取单位编号RECTANGLE键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.RecArea # 键值
function GameAPI.get_unit_key_rectangle_kv(unit_key, key) end

--获取物品编号RECTANGLE键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.RecArea # 键值
function GameAPI.get_item_key_rectangle_kv(item_key, key) end

--获取技能编号RECTANGLE键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.RecArea # 键值
function GameAPI.get_ability_key_rectangle_kv(ability_key, key) end

--获取魔法效果特效编号RECTANGLE键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.RecArea # 键值
function GameAPI.get_modifier_key_rectangle_kv(modifier_key, key) end

--获取特效编号RECTANGLE键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.RecArea # 键值
function GameAPI.get_projectile_key_rectangle_kv(projectile_key, key) end

--获取可破坏物编号RECTANGLE键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.RecArea # 键值
function GameAPI.get_destructible_key_rectangle_kv(destructible_key, key) end

--获取科技编号RECTANGLE键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.RecArea # 键值
function GameAPI.get_tech_key_rectangle_kv(tech_key, key) end

--获取图片RECTANGLE键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.RecArea # 键值
function GameAPI.get_icon_id_rectangle_kv(icon_id, key) end

--获取RECTANGLE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.RecArea # 键值
function GameAPI.get_kv_pair_value_rectangle(kvbase, key) end

--获取单位编号ROUND_AREA键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.CirArea # 键值
function GameAPI.get_unit_key_round_area_kv(unit_key, key) end

--获取物品编号ROUND_AREA键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.CirArea # 键值
function GameAPI.get_item_key_round_area_kv(item_key, key) end

--获取技能编号ROUND_AREA键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.CirArea # 键值
function GameAPI.get_ability_key_round_area_kv(ability_key, key) end

--获取魔法效果特效编号ROUND_AREA键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.CirArea # 键值
function GameAPI.get_modifier_key_round_area_kv(modifier_key, key) end

--获取特效编号ROUND_AREA键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.CirArea # 键值
function GameAPI.get_projectile_key_round_area_kv(projectile_key, key) end

--获取可破坏物编号ROUND_AREA键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.CirArea # 键值
function GameAPI.get_destructible_key_round_area_kv(destructible_key, key) end

--获取科技编号ROUND_AREA键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.CirArea # 键值
function GameAPI.get_tech_key_round_area_kv(tech_key, key) end

--获取图片ROUND_AREA键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.CirArea # 键值
function GameAPI.get_icon_id_round_area_kv(icon_id, key) end

--获取ROUND_AREA键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.CirArea # 键值
function GameAPI.get_kv_pair_value_round_area(kvbase, key) end

--获取单位编号POLYGON键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.PolyArea # 键值
function GameAPI.get_unit_key_polygon_kv(unit_key, key) end

--获取物品编号POLYGON键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.PolyArea # 键值
function GameAPI.get_item_key_polygon_kv(item_key, key) end

--获取技能编号POLYGON键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.PolyArea # 键值
function GameAPI.get_ability_key_polygon_kv(ability_key, key) end

--获取魔法效果特效编号POLYGON键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.PolyArea # 键值
function GameAPI.get_modifier_key_polygon_kv(modifier_key, key) end

--获取特效编号POLYGON键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.PolyArea # 键值
function GameAPI.get_projectile_key_polygon_kv(projectile_key, key) end

--获取可破坏物编号POLYGON键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.PolyArea # 键值
function GameAPI.get_destructible_key_polygon_kv(destructible_key, key) end

--获取科技编号POLYGON键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.PolyArea # 键值
function GameAPI.get_tech_key_polygon_kv(tech_key, key) end

--获取图片POLYGON键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.PolyArea # 键值
function GameAPI.get_icon_id_polygon_kv(icon_id, key) end

--获取POLYGON键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.PolyArea # 键值
function GameAPI.get_kv_pair_value_polygon(kvbase, key) end

--获取单位编号CAMERA键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.Camera # 键值
function GameAPI.get_unit_key_camera_kv(unit_key, key) end

--获取物品编号CAMERA键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.Camera # 键值
function GameAPI.get_item_key_camera_kv(item_key, key) end

--获取技能编号CAMERA键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.Camera # 键值
function GameAPI.get_ability_key_camera_kv(ability_key, key) end

--获取魔法效果特效编号CAMERA键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.Camera # 键值
function GameAPI.get_modifier_key_camera_kv(modifier_key, key) end

--获取特效编号CAMERA键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.Camera # 键值
function GameAPI.get_projectile_key_camera_kv(projectile_key, key) end

--获取可破坏物编号CAMERA键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.Camera # 键值
function GameAPI.get_destructible_key_camera_kv(destructible_key, key) end

--获取科技编号CAMERA键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.Camera # 键值
function GameAPI.get_tech_key_camera_kv(tech_key, key) end

--获取图片CAMERA键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.Camera # 键值
function GameAPI.get_icon_id_camera_kv(icon_id, key) end

--获取CAMERA键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.Camera # 键值
function GameAPI.get_kv_pair_value_camera(kvbase, key) end

--获取单位编号CAMLINE键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.CamlineID # 键值
function GameAPI.get_unit_key_camline_kv(unit_key, key) end

--获取物品编号CAMLINE键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.CamlineID # 键值
function GameAPI.get_item_key_camline_kv(item_key, key) end

--获取技能编号CAMLINE键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.CamlineID # 键值
function GameAPI.get_ability_key_camline_kv(ability_key, key) end

--获取魔法效果特效编号CAMLINE键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.CamlineID # 键值
function GameAPI.get_modifier_key_camline_kv(modifier_key, key) end

--获取特效编号CAMLINE键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.CamlineID # 键值
function GameAPI.get_projectile_key_camline_kv(projectile_key, key) end

--获取可破坏物编号CAMLINE键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.CamlineID # 键值
function GameAPI.get_destructible_key_camline_kv(destructible_key, key) end

--获取科技编号CAMLINE键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.CamlineID # 键值
function GameAPI.get_tech_key_camline_kv(tech_key, key) end

--获取图片CAMLINE键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.CamlineID # 键值
function GameAPI.get_icon_id_camline_kv(icon_id, key) end

--获取CAMLINE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.CamlineID # 键值
function GameAPI.get_kv_pair_value_camline(kvbase, key) end

--获取单位编号POINT_LIGHT键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.PointLight # 键值
function GameAPI.get_unit_key_point_light_kv(unit_key, key) end

--获取物品编号POINT_LIGHT键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.PointLight # 键值
function GameAPI.get_item_key_point_light_kv(item_key, key) end

--获取技能编号POINT_LIGHT键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.PointLight # 键值
function GameAPI.get_ability_key_point_light_kv(ability_key, key) end

--获取魔法效果特效编号POINT_LIGHT键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.PointLight # 键值
function GameAPI.get_modifier_key_point_light_kv(modifier_key, key) end

--获取特效编号POINT_LIGHT键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.PointLight # 键值
function GameAPI.get_projectile_key_point_light_kv(projectile_key, key) end

--获取可破坏物编号POINT_LIGHT键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.PointLight # 键值
function GameAPI.get_destructible_key_point_light_kv(destructible_key, key) end

--获取科技编号POINT_LIGHT键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.PointLight # 键值
function GameAPI.get_tech_key_point_light_kv(tech_key, key) end

--获取图片POINT_LIGHT键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.PointLight # 键值
function GameAPI.get_icon_id_point_light_kv(icon_id, key) end

--获取POINT_LIGHT键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.PointLight # 键值
function GameAPI.get_kv_pair_value_point_light(kvbase, key) end

--获取单位编号SPOT_LIGHT键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.SpotLight # 键值
function GameAPI.get_unit_key_spot_light_kv(unit_key, key) end

--获取物品编号SPOT_LIGHT键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.SpotLight # 键值
function GameAPI.get_item_key_spot_light_kv(item_key, key) end

--获取技能编号SPOT_LIGHT键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.SpotLight # 键值
function GameAPI.get_ability_key_spot_light_kv(ability_key, key) end

--获取魔法效果特效编号SPOT_LIGHT键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.SpotLight # 键值
function GameAPI.get_modifier_key_spot_light_kv(modifier_key, key) end

--获取特效编号SPOT_LIGHT键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.SpotLight # 键值
function GameAPI.get_projectile_key_spot_light_kv(projectile_key, key) end

--获取可破坏物编号SPOT_LIGHT键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.SpotLight # 键值
function GameAPI.get_destructible_key_spot_light_kv(destructible_key, key) end

--获取科技编号SPOT_LIGHT键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.SpotLight # 键值
function GameAPI.get_tech_key_spot_light_kv(tech_key, key) end

--获取图片SPOT_LIGHT键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.SpotLight # 键值
function GameAPI.get_icon_id_spot_light_kv(icon_id, key) end

--获取SPOT_LIGHT键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.SpotLight # 键值
function GameAPI.get_kv_pair_value_spot_light(kvbase, key) end

--获取单位编号FOG键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.Fog # 键值
function GameAPI.get_unit_key_fog_kv(unit_key, key) end

--获取物品编号FOG键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.Fog # 键值
function GameAPI.get_item_key_fog_kv(item_key, key) end

--获取技能编号FOG键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.Fog # 键值
function GameAPI.get_ability_key_fog_kv(ability_key, key) end

--获取魔法效果特效编号FOG键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.Fog # 键值
function GameAPI.get_modifier_key_fog_kv(modifier_key, key) end

--获取特效编号FOG键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.Fog # 键值
function GameAPI.get_projectile_key_fog_kv(projectile_key, key) end

--获取可破坏物编号FOG键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.Fog # 键值
function GameAPI.get_destructible_key_fog_kv(destructible_key, key) end

--获取科技编号FOG键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.Fog # 键值
function GameAPI.get_tech_key_fog_kv(tech_key, key) end

--获取图片FOG键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.Fog # 键值
function GameAPI.get_icon_id_fog_kv(icon_id, key) end

--获取FOG键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.Fog # 键值
function GameAPI.get_kv_pair_value_fog(kvbase, key) end

--获取单位编号SCENE_SOUND键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.SceneSound # 键值
function GameAPI.get_unit_key_scene_sound_kv(unit_key, key) end

--获取物品编号SCENE_SOUND键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.SceneSound # 键值
function GameAPI.get_item_key_scene_sound_kv(item_key, key) end

--获取技能编号SCENE_SOUND键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.SceneSound # 键值
function GameAPI.get_ability_key_scene_sound_kv(ability_key, key) end

--获取魔法效果特效编号SCENE_SOUND键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.SceneSound # 键值
function GameAPI.get_modifier_key_scene_sound_kv(modifier_key, key) end

--获取特效编号SCENE_SOUND键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.SceneSound # 键值
function GameAPI.get_projectile_key_scene_sound_kv(projectile_key, key) end

--获取可破坏物编号SCENE_SOUND键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.SceneSound # 键值
function GameAPI.get_destructible_key_scene_sound_kv(destructible_key, key) end

--获取科技编号SCENE_SOUND键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.SceneSound # 键值
function GameAPI.get_tech_key_scene_sound_kv(tech_key, key) end

--获取图片SCENE_SOUND键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.SceneSound # 键值
function GameAPI.get_icon_id_scene_sound_kv(icon_id, key) end

--获取SCENE_SOUND键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.SceneSound # 键值
function GameAPI.get_kv_pair_value_scene_sound(kvbase, key) end

--获取单位编号MODEL键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.ModelKey # 键值
function GameAPI.get_unit_key_model_kv(unit_key, key) end

--获取物品编号MODEL键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.ModelKey # 键值
function GameAPI.get_item_key_model_kv(item_key, key) end

--获取技能编号MODEL键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.ModelKey # 键值
function GameAPI.get_ability_key_model_kv(ability_key, key) end

--获取魔法效果特效编号MODEL键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.ModelKey # 键值
function GameAPI.get_modifier_key_model_kv(modifier_key, key) end

--获取特效编号MODEL键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.ModelKey # 键值
function GameAPI.get_projectile_key_model_kv(projectile_key, key) end

--获取可破坏物编号MODEL键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.ModelKey # 键值
function GameAPI.get_destructible_key_model_kv(destructible_key, key) end

--获取科技编号MODEL键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.ModelKey # 键值
function GameAPI.get_tech_key_model_kv(tech_key, key) end

--获取图片MODEL键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.ModelKey # 键值
function GameAPI.get_icon_id_model_kv(icon_id, key) end

--获取MODEL键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.ModelKey # 键值
function GameAPI.get_kv_pair_value_model(kvbase, key) end

--获取单位编号SFX_ENTITY键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.Sfx # 键值
function GameAPI.get_unit_key_sfx_entity_kv(unit_key, key) end

--获取物品编号SFX_ENTITY键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.Sfx # 键值
function GameAPI.get_item_key_sfx_entity_kv(item_key, key) end

--获取技能编号SFX_ENTITY键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.Sfx # 键值
function GameAPI.get_ability_key_sfx_entity_kv(ability_key, key) end

--获取魔法效果特效编号SFX_ENTITY键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.Sfx # 键值
function GameAPI.get_modifier_key_sfx_entity_kv(modifier_key, key) end

--获取特效编号SFX_ENTITY键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.Sfx # 键值
function GameAPI.get_projectile_key_sfx_entity_kv(projectile_key, key) end

--获取可破坏物编号SFX_ENTITY键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.Sfx # 键值
function GameAPI.get_destructible_key_sfx_entity_kv(destructible_key, key) end

--获取科技编号SFX_ENTITY键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.Sfx # 键值
function GameAPI.get_tech_key_sfx_entity_kv(tech_key, key) end

--获取图片SFX_ENTITY键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.Sfx # 键值
function GameAPI.get_icon_id_sfx_entity_kv(icon_id, key) end

--获取SFX_ENTITY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.Sfx # 键值
function GameAPI.get_kv_pair_value_sfx_entity(kvbase, key) end

--获取单位编号SFX_KEY键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.SfxKey # 键值
function GameAPI.get_unit_key_sfx_key_kv(unit_key, key) end

--获取物品编号SFX_KEY键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.SfxKey # 键值
function GameAPI.get_item_key_sfx_key_kv(item_key, key) end

--获取技能编号SFX_KEY键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.SfxKey # 键值
function GameAPI.get_ability_key_sfx_key_kv(ability_key, key) end

--获取魔法效果特效编号SFX_KEY键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.SfxKey # 键值
function GameAPI.get_modifier_key_sfx_key_kv(modifier_key, key) end

--获取特效编号SFX_KEY键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.SfxKey # 键值
function GameAPI.get_projectile_key_sfx_key_kv(projectile_key, key) end

--获取可破坏物编号SFX_KEY键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.SfxKey # 键值
function GameAPI.get_destructible_key_sfx_key_kv(destructible_key, key) end

--获取科技编号SFX_KEY键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.SfxKey # 键值
function GameAPI.get_tech_key_sfx_key_kv(tech_key, key) end

--获取图片SFX_KEY键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.SfxKey # 键值
function GameAPI.get_icon_id_sfx_key_kv(icon_id, key) end

--获取SFX_KEY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.SfxKey # 键值
function GameAPI.get_kv_pair_value_sfx_key(kvbase, key) end

--获取单位编号LINK_SFX_ENTITY键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.LinkSfx # 键值
function GameAPI.get_unit_key_link_sfx_entity_kv(unit_key, key) end

--获取物品编号LINK_SFX_ENTITY键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.LinkSfx # 键值
function GameAPI.get_item_key_link_sfx_entity_kv(item_key, key) end

--获取技能编号LINK_SFX_ENTITY键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.LinkSfx # 键值
function GameAPI.get_ability_key_link_sfx_entity_kv(ability_key, key) end

--获取魔法效果特效编号LINK_SFX_ENTITY键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.LinkSfx # 键值
function GameAPI.get_modifier_key_link_sfx_entity_kv(modifier_key, key) end

--获取特效编号LINK_SFX_ENTITY键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.LinkSfx # 键值
function GameAPI.get_projectile_key_link_sfx_entity_kv(projectile_key, key) end

--获取可破坏物编号LINK_SFX_ENTITY键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.LinkSfx # 键值
function GameAPI.get_destructible_key_link_sfx_entity_kv(destructible_key, key) end

--获取科技编号LINK_SFX_ENTITY键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.LinkSfx # 键值
function GameAPI.get_tech_key_link_sfx_entity_kv(tech_key, key) end

--获取图片LINK_SFX_ENTITY键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.LinkSfx # 键值
function GameAPI.get_icon_id_link_sfx_entity_kv(icon_id, key) end

--获取LINK_SFX_ENTITY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.LinkSfx # 键值
function GameAPI.get_kv_pair_value_link_sfx_entity(kvbase, key) end

--获取单位编号LINK_SFX_KEY键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.LinkSfxKey # 键值
function GameAPI.get_unit_key_link_sfx_key_kv(unit_key, key) end

--获取物品编号LINK_SFX_KEY键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.LinkSfxKey # 键值
function GameAPI.get_item_key_link_sfx_key_kv(item_key, key) end

--获取技能编号LINK_SFX_KEY键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.LinkSfxKey # 键值
function GameAPI.get_ability_key_link_sfx_key_kv(ability_key, key) end

--获取魔法效果特效编号LINK_SFX_KEY键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.LinkSfxKey # 键值
function GameAPI.get_modifier_key_link_sfx_key_kv(modifier_key, key) end

--获取特效编号LINK_SFX_KEY键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.LinkSfxKey # 键值
function GameAPI.get_projectile_key_link_sfx_key_kv(projectile_key, key) end

--获取可破坏物编号LINK_SFX_KEY键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.LinkSfxKey # 键值
function GameAPI.get_destructible_key_link_sfx_key_kv(destructible_key, key) end

--获取科技编号LINK_SFX_KEY键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.LinkSfxKey # 键值
function GameAPI.get_tech_key_link_sfx_key_kv(tech_key, key) end

--获取图片LINK_SFX_KEY键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.LinkSfxKey # 键值
function GameAPI.get_icon_id_link_sfx_key_kv(icon_id, key) end

--获取LINK_SFX_KEY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.LinkSfxKey # 键值
function GameAPI.get_kv_pair_value_link_sfx_key(kvbase, key) end

--获取单位编号CURSOR_KEY键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.CursorKey # 键值
function GameAPI.get_unit_key_cursor_key_kv(unit_key, key) end

--获取物品编号CURSOR_KEY键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.CursorKey # 键值
function GameAPI.get_item_key_cursor_key_kv(item_key, key) end

--获取技能编号CURSOR_KEY键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.CursorKey # 键值
function GameAPI.get_ability_key_cursor_key_kv(ability_key, key) end

--获取魔法效果特效编号CURSOR_KEY键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.CursorKey # 键值
function GameAPI.get_modifier_key_cursor_key_kv(modifier_key, key) end

--获取特效编号CURSOR_KEY键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.CursorKey # 键值
function GameAPI.get_projectile_key_cursor_key_kv(projectile_key, key) end

--获取可破坏物编号CURSOR_KEY键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.CursorKey # 键值
function GameAPI.get_destructible_key_cursor_key_kv(destructible_key, key) end

--获取科技编号CURSOR_KEY键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.CursorKey # 键值
function GameAPI.get_tech_key_cursor_key_kv(tech_key, key) end

--获取图片CURSOR_KEY键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.CursorKey # 键值
function GameAPI.get_icon_id_cursor_key_kv(icon_id, key) end

--获取CURSOR_KEY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.CursorKey # 键值
function GameAPI.get_kv_pair_value_cursor_key(kvbase, key) end

--获取单位编号ANGLE键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.Fixed # 键值
function GameAPI.get_unit_key_angle_kv(unit_key, key) end

--获取物品编号ANGLE键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.Fixed # 键值
function GameAPI.get_item_key_angle_kv(item_key, key) end

--获取技能编号ANGLE键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.Fixed # 键值
function GameAPI.get_ability_key_angle_kv(ability_key, key) end

--获取魔法效果特效编号ANGLE键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.Fixed # 键值
function GameAPI.get_modifier_key_angle_kv(modifier_key, key) end

--获取特效编号ANGLE键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.Fixed # 键值
function GameAPI.get_projectile_key_angle_kv(projectile_key, key) end

--获取可破坏物编号ANGLE键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.Fixed # 键值
function GameAPI.get_destructible_key_angle_kv(destructible_key, key) end

--获取科技编号ANGLE键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.Fixed # 键值
function GameAPI.get_tech_key_angle_kv(tech_key, key) end

--获取图片ANGLE键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.Fixed # 键值
function GameAPI.get_icon_id_angle_kv(icon_id, key) end

--获取ANGLE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.Fixed # 键值
function GameAPI.get_kv_pair_value_angle(kvbase, key) end

--获取单位编号TEXTURE键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.Texture # 键值
function GameAPI.get_unit_key_texture_kv(unit_key, key) end

--获取物品编号TEXTURE键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.Texture # 键值
function GameAPI.get_item_key_texture_kv(item_key, key) end

--获取技能编号TEXTURE键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.Texture # 键值
function GameAPI.get_ability_key_texture_kv(ability_key, key) end

--获取魔法效果特效编号TEXTURE键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.Texture # 键值
function GameAPI.get_modifier_key_texture_kv(modifier_key, key) end

--获取特效编号TEXTURE键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.Texture # 键值
function GameAPI.get_projectile_key_texture_kv(projectile_key, key) end

--获取可破坏物编号TEXTURE键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.Texture # 键值
function GameAPI.get_destructible_key_texture_kv(destructible_key, key) end

--获取科技编号TEXTURE键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.Texture # 键值
function GameAPI.get_tech_key_texture_kv(tech_key, key) end

--获取图片TEXTURE键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.Texture # 键值
function GameAPI.get_icon_id_texture_kv(icon_id, key) end

--获取TEXTURE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.Texture # 键值
function GameAPI.get_kv_pair_value_texture(kvbase, key) end

--获取单位编号SEQUENCE键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.Sequence # 键值
function GameAPI.get_unit_key_sequence_kv(unit_key, key) end

--获取物品编号SEQUENCE键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.Sequence # 键值
function GameAPI.get_item_key_sequence_kv(item_key, key) end

--获取技能编号SEQUENCE键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.Sequence # 键值
function GameAPI.get_ability_key_sequence_kv(ability_key, key) end

--获取魔法效果特效编号SEQUENCE键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.Sequence # 键值
function GameAPI.get_modifier_key_sequence_kv(modifier_key, key) end

--获取特效编号SEQUENCE键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.Sequence # 键值
function GameAPI.get_projectile_key_sequence_kv(projectile_key, key) end

--获取可破坏物编号SEQUENCE键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.Sequence # 键值
function GameAPI.get_destructible_key_sequence_kv(destructible_key, key) end

--获取科技编号SEQUENCE键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.Sequence # 键值
function GameAPI.get_tech_key_sequence_kv(tech_key, key) end

--获取图片SEQUENCE键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.Sequence # 键值
function GameAPI.get_icon_id_sequence_kv(icon_id, key) end

--获取SEQUENCE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.Sequence # 键值
function GameAPI.get_kv_pair_value_sequence(kvbase, key) end

--获取单位编号PHYSICS_OBJECT键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.PhysicsObject # 键值
function GameAPI.get_unit_key_physics_object_kv(unit_key, key) end

--获取物品编号PHYSICS_OBJECT键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.PhysicsObject # 键值
function GameAPI.get_item_key_physics_object_kv(item_key, key) end

--获取技能编号PHYSICS_OBJECT键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.PhysicsObject # 键值
function GameAPI.get_ability_key_physics_object_kv(ability_key, key) end

--获取魔法效果特效编号PHYSICS_OBJECT键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.PhysicsObject # 键值
function GameAPI.get_modifier_key_physics_object_kv(modifier_key, key) end

--获取特效编号PHYSICS_OBJECT键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.PhysicsObject # 键值
function GameAPI.get_projectile_key_physics_object_kv(projectile_key, key) end

--获取可破坏物编号PHYSICS_OBJECT键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.PhysicsObject # 键值
function GameAPI.get_destructible_key_physics_object_kv(destructible_key, key) end

--获取科技编号PHYSICS_OBJECT键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.PhysicsObject # 键值
function GameAPI.get_tech_key_physics_object_kv(tech_key, key) end

--获取图片PHYSICS_OBJECT键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.PhysicsObject # 键值
function GameAPI.get_icon_id_physics_object_kv(icon_id, key) end

--获取PHYSICS_OBJECT键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.PhysicsObject # 键值
function GameAPI.get_kv_pair_value_physics_object(kvbase, key) end

--获取单位编号PHYSICS_ENTITY键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.PhysicsEntity # 键值
function GameAPI.get_unit_key_physics_entity_kv(unit_key, key) end

--获取物品编号PHYSICS_ENTITY键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.PhysicsEntity # 键值
function GameAPI.get_item_key_physics_entity_kv(item_key, key) end

--获取技能编号PHYSICS_ENTITY键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.PhysicsEntity # 键值
function GameAPI.get_ability_key_physics_entity_kv(ability_key, key) end

--获取魔法效果特效编号PHYSICS_ENTITY键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.PhysicsEntity # 键值
function GameAPI.get_modifier_key_physics_entity_kv(modifier_key, key) end

--获取特效编号PHYSICS_ENTITY键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.PhysicsEntity # 键值
function GameAPI.get_projectile_key_physics_entity_kv(projectile_key, key) end

--获取可破坏物编号PHYSICS_ENTITY键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.PhysicsEntity # 键值
function GameAPI.get_destructible_key_physics_entity_kv(destructible_key, key) end

--获取科技编号PHYSICS_ENTITY键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.PhysicsEntity # 键值
function GameAPI.get_tech_key_physics_entity_kv(tech_key, key) end

--获取图片PHYSICS_ENTITY键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.PhysicsEntity # 键值
function GameAPI.get_icon_id_physics_entity_kv(icon_id, key) end

--获取PHYSICS_ENTITY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.PhysicsEntity # 键值
function GameAPI.get_kv_pair_value_physics_entity(kvbase, key) end

--获取单位编号PHYSICS_OBJECT_KEY键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.PhysicsObjectKey # 键值
function GameAPI.get_unit_key_physics_object_key_kv(unit_key, key) end

--获取物品编号PHYSICS_OBJECT_KEY键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.PhysicsObjectKey # 键值
function GameAPI.get_item_key_physics_object_key_kv(item_key, key) end

--获取技能编号PHYSICS_OBJECT_KEY键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.PhysicsObjectKey # 键值
function GameAPI.get_ability_key_physics_object_key_kv(ability_key, key) end

--获取魔法效果特效编号PHYSICS_OBJECT_KEY键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.PhysicsObjectKey # 键值
function GameAPI.get_modifier_key_physics_object_key_kv(modifier_key, key) end

--获取特效编号PHYSICS_OBJECT_KEY键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.PhysicsObjectKey # 键值
function GameAPI.get_projectile_key_physics_object_key_kv(projectile_key, key) end

--获取可破坏物编号PHYSICS_OBJECT_KEY键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.PhysicsObjectKey # 键值
function GameAPI.get_destructible_key_physics_object_key_kv(destructible_key, key) end

--获取科技编号PHYSICS_OBJECT_KEY键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.PhysicsObjectKey # 键值
function GameAPI.get_tech_key_physics_object_key_kv(tech_key, key) end

--获取图片PHYSICS_OBJECT_KEY键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.PhysicsObjectKey # 键值
function GameAPI.get_icon_id_physics_object_key_kv(icon_id, key) end

--获取PHYSICS_OBJECT_KEY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.PhysicsObjectKey # 键值
function GameAPI.get_kv_pair_value_physics_object_key(kvbase, key) end

--获取单位编号PHYSICS_ENTITY_KEY键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.PhysicsEntityKey # 键值
function GameAPI.get_unit_key_physics_entity_key_kv(unit_key, key) end

--获取物品编号PHYSICS_ENTITY_KEY键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.PhysicsEntityKey # 键值
function GameAPI.get_item_key_physics_entity_key_kv(item_key, key) end

--获取技能编号PHYSICS_ENTITY_KEY键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.PhysicsEntityKey # 键值
function GameAPI.get_ability_key_physics_entity_key_kv(ability_key, key) end

--获取魔法效果特效编号PHYSICS_ENTITY_KEY键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.PhysicsEntityKey # 键值
function GameAPI.get_modifier_key_physics_entity_key_kv(modifier_key, key) end

--获取特效编号PHYSICS_ENTITY_KEY键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.PhysicsEntityKey # 键值
function GameAPI.get_projectile_key_physics_entity_key_kv(projectile_key, key) end

--获取可破坏物编号PHYSICS_ENTITY_KEY键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.PhysicsEntityKey # 键值
function GameAPI.get_destructible_key_physics_entity_key_kv(destructible_key, key) end

--获取科技编号PHYSICS_ENTITY_KEY键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.PhysicsEntityKey # 键值
function GameAPI.get_tech_key_physics_entity_key_kv(tech_key, key) end

--获取图片PHYSICS_ENTITY_KEY键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.PhysicsEntityKey # 键值
function GameAPI.get_icon_id_physics_entity_key_kv(icon_id, key) end

--获取PHYSICS_ENTITY_KEY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.PhysicsEntityKey # 键值
function GameAPI.get_kv_pair_value_physics_entity_key(kvbase, key) end

--获取单位编号RIGID_BODY键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.RigidBody # 键值
function GameAPI.get_unit_key_rigid_body_kv(unit_key, key) end

--获取物品编号RIGID_BODY键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.RigidBody # 键值
function GameAPI.get_item_key_rigid_body_kv(item_key, key) end

--获取技能编号RIGID_BODY键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.RigidBody # 键值
function GameAPI.get_ability_key_rigid_body_kv(ability_key, key) end

--获取魔法效果特效编号RIGID_BODY键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.RigidBody # 键值
function GameAPI.get_modifier_key_rigid_body_kv(modifier_key, key) end

--获取特效编号RIGID_BODY键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.RigidBody # 键值
function GameAPI.get_projectile_key_rigid_body_kv(projectile_key, key) end

--获取可破坏物编号RIGID_BODY键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.RigidBody # 键值
function GameAPI.get_destructible_key_rigid_body_kv(destructible_key, key) end

--获取科技编号RIGID_BODY键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.RigidBody # 键值
function GameAPI.get_tech_key_rigid_body_kv(tech_key, key) end

--获取图片RIGID_BODY键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.RigidBody # 键值
function GameAPI.get_icon_id_rigid_body_kv(icon_id, key) end

--获取RIGID_BODY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.RigidBody # 键值
function GameAPI.get_kv_pair_value_rigid_body(kvbase, key) end

--获取单位编号RIGID_BODY_GROUP键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.RigidBodyGroup # 键值
function GameAPI.get_unit_key_rigid_body_group_kv(unit_key, key) end

--获取物品编号RIGID_BODY_GROUP键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.RigidBodyGroup # 键值
function GameAPI.get_item_key_rigid_body_group_kv(item_key, key) end

--获取技能编号RIGID_BODY_GROUP键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.RigidBodyGroup # 键值
function GameAPI.get_ability_key_rigid_body_group_kv(ability_key, key) end

--获取魔法效果特效编号RIGID_BODY_GROUP键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.RigidBodyGroup # 键值
function GameAPI.get_modifier_key_rigid_body_group_kv(modifier_key, key) end

--获取特效编号RIGID_BODY_GROUP键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.RigidBodyGroup # 键值
function GameAPI.get_projectile_key_rigid_body_group_kv(projectile_key, key) end

--获取可破坏物编号RIGID_BODY_GROUP键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.RigidBodyGroup # 键值
function GameAPI.get_destructible_key_rigid_body_group_kv(destructible_key, key) end

--获取科技编号RIGID_BODY_GROUP键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.RigidBodyGroup # 键值
function GameAPI.get_tech_key_rigid_body_group_kv(tech_key, key) end

--获取图片RIGID_BODY_GROUP键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.RigidBodyGroup # 键值
function GameAPI.get_icon_id_rigid_body_group_kv(icon_id, key) end

--获取RIGID_BODY_GROUP键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.RigidBodyGroup # 键值
function GameAPI.get_kv_pair_value_rigid_body_group(kvbase, key) end

--获取单位编号COLLIDER键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.Collider # 键值
function GameAPI.get_unit_key_collider_kv(unit_key, key) end

--获取物品编号COLLIDER键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.Collider # 键值
function GameAPI.get_item_key_collider_kv(item_key, key) end

--获取技能编号COLLIDER键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.Collider # 键值
function GameAPI.get_ability_key_collider_kv(ability_key, key) end

--获取魔法效果特效编号COLLIDER键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.Collider # 键值
function GameAPI.get_modifier_key_collider_kv(modifier_key, key) end

--获取特效编号COLLIDER键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.Collider # 键值
function GameAPI.get_projectile_key_collider_kv(projectile_key, key) end

--获取可破坏物编号COLLIDER键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.Collider # 键值
function GameAPI.get_destructible_key_collider_kv(destructible_key, key) end

--获取科技编号COLLIDER键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.Collider # 键值
function GameAPI.get_tech_key_collider_kv(tech_key, key) end

--获取图片COLLIDER键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.Collider # 键值
function GameAPI.get_icon_id_collider_kv(icon_id, key) end

--获取COLLIDER键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.Collider # 键值
function GameAPI.get_kv_pair_value_collider(kvbase, key) end

--获取单位编号JOINT键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.Joint # 键值
function GameAPI.get_unit_key_joint_kv(unit_key, key) end

--获取物品编号JOINT键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.Joint # 键值
function GameAPI.get_item_key_joint_kv(item_key, key) end

--获取技能编号JOINT键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.Joint # 键值
function GameAPI.get_ability_key_joint_kv(ability_key, key) end

--获取魔法效果特效编号JOINT键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.Joint # 键值
function GameAPI.get_modifier_key_joint_kv(modifier_key, key) end

--获取特效编号JOINT键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.Joint # 键值
function GameAPI.get_projectile_key_joint_kv(projectile_key, key) end

--获取可破坏物编号JOINT键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.Joint # 键值
function GameAPI.get_destructible_key_joint_kv(destructible_key, key) end

--获取科技编号JOINT键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.Joint # 键值
function GameAPI.get_tech_key_joint_kv(tech_key, key) end

--获取图片JOINT键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.Joint # 键值
function GameAPI.get_icon_id_joint_kv(icon_id, key) end

--获取JOINT键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.Joint # 键值
function GameAPI.get_kv_pair_value_joint(kvbase, key) end

--获取单位编号REACTION键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.Reaction # 键值
function GameAPI.get_unit_key_reaction_kv(unit_key, key) end

--获取物品编号REACTION键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.Reaction # 键值
function GameAPI.get_item_key_reaction_kv(item_key, key) end

--获取技能编号REACTION键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.Reaction # 键值
function GameAPI.get_ability_key_reaction_kv(ability_key, key) end

--获取魔法效果特效编号REACTION键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.Reaction # 键值
function GameAPI.get_modifier_key_reaction_kv(modifier_key, key) end

--获取特效编号REACTION键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.Reaction # 键值
function GameAPI.get_projectile_key_reaction_kv(projectile_key, key) end

--获取可破坏物编号REACTION键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.Reaction # 键值
function GameAPI.get_destructible_key_reaction_kv(destructible_key, key) end

--获取科技编号REACTION键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.Reaction # 键值
function GameAPI.get_tech_key_reaction_kv(tech_key, key) end

--获取图片REACTION键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.Reaction # 键值
function GameAPI.get_icon_id_reaction_kv(icon_id, key) end

--获取REACTION键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.Reaction # 键值
function GameAPI.get_kv_pair_value_reaction(kvbase, key) end

--获取单位编号REACTION_GROUP键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.ReactionGroup # 键值
function GameAPI.get_unit_key_reaction_group_kv(unit_key, key) end

--获取物品编号REACTION_GROUP键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.ReactionGroup # 键值
function GameAPI.get_item_key_reaction_group_kv(item_key, key) end

--获取技能编号REACTION_GROUP键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.ReactionGroup # 键值
function GameAPI.get_ability_key_reaction_group_kv(ability_key, key) end

--获取魔法效果特效编号REACTION_GROUP键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.ReactionGroup # 键值
function GameAPI.get_modifier_key_reaction_group_kv(modifier_key, key) end

--获取特效编号REACTION_GROUP键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.ReactionGroup # 键值
function GameAPI.get_projectile_key_reaction_group_kv(projectile_key, key) end

--获取可破坏物编号REACTION_GROUP键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.ReactionGroup # 键值
function GameAPI.get_destructible_key_reaction_group_kv(destructible_key, key) end

--获取科技编号REACTION_GROUP键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.ReactionGroup # 键值
function GameAPI.get_tech_key_reaction_group_kv(tech_key, key) end

--获取图片REACTION_GROUP键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.ReactionGroup # 键值
function GameAPI.get_icon_id_reaction_group_kv(icon_id, key) end

--获取REACTION_GROUP键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.ReactionGroup # 键值
function GameAPI.get_kv_pair_value_reaction_group(kvbase, key) end

--获取单位编号DYNAMIC_TRIGGER_INSTANCE键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.DynamicTriggerInstance # 键值
function GameAPI.get_unit_key_dynamic_trigger_instance_kv(unit_key, key) end

--获取物品编号DYNAMIC_TRIGGER_INSTANCE键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.DynamicTriggerInstance # 键值
function GameAPI.get_item_key_dynamic_trigger_instance_kv(item_key, key) end

--获取技能编号DYNAMIC_TRIGGER_INSTANCE键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.DynamicTriggerInstance # 键值
function GameAPI.get_ability_key_dynamic_trigger_instance_kv(ability_key, key) end

--获取魔法效果特效编号DYNAMIC_TRIGGER_INSTANCE键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.DynamicTriggerInstance # 键值
function GameAPI.get_modifier_key_dynamic_trigger_instance_kv(modifier_key, key) end

--获取特效编号DYNAMIC_TRIGGER_INSTANCE键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.DynamicTriggerInstance # 键值
function GameAPI.get_projectile_key_dynamic_trigger_instance_kv(projectile_key, key) end

--获取可破坏物编号DYNAMIC_TRIGGER_INSTANCE键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.DynamicTriggerInstance # 键值
function GameAPI.get_destructible_key_dynamic_trigger_instance_kv(destructible_key, key) end

--获取科技编号DYNAMIC_TRIGGER_INSTANCE键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.DynamicTriggerInstance # 键值
function GameAPI.get_tech_key_dynamic_trigger_instance_kv(tech_key, key) end

--获取图片DYNAMIC_TRIGGER_INSTANCE键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.DynamicTriggerInstance # 键值
function GameAPI.get_icon_id_dynamic_trigger_instance_kv(icon_id, key) end

--获取DYNAMIC_TRIGGER_INSTANCE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.DynamicTriggerInstance # 键值
function GameAPI.get_kv_pair_value_dynamic_trigger_instance(kvbase, key) end

--获取单位编号TABLE键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.Table # 键值
function GameAPI.get_unit_key_table_kv(unit_key, key) end

--获取物品编号TABLE键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.Table # 键值
function GameAPI.get_item_key_table_kv(item_key, key) end

--获取技能编号TABLE键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.Table # 键值
function GameAPI.get_ability_key_table_kv(ability_key, key) end

--获取魔法效果特效编号TABLE键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.Table # 键值
function GameAPI.get_modifier_key_table_kv(modifier_key, key) end

--获取特效编号TABLE键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.Table # 键值
function GameAPI.get_projectile_key_table_kv(projectile_key, key) end

--获取可破坏物编号TABLE键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.Table # 键值
function GameAPI.get_destructible_key_table_kv(destructible_key, key) end

--获取科技编号TABLE键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.Table # 键值
function GameAPI.get_tech_key_table_kv(tech_key, key) end

--获取图片TABLE键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.Table # 键值
function GameAPI.get_icon_id_table_kv(icon_id, key) end

--获取TABLE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.Table # 键值
function GameAPI.get_kv_pair_value_table(kvbase, key) end

--获取单位编号RANDOM_POOL键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.RandomPool # 键值
function GameAPI.get_unit_key_random_pool_kv(unit_key, key) end

--获取物品编号RANDOM_POOL键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.RandomPool # 键值
function GameAPI.get_item_key_random_pool_kv(item_key, key) end

--获取技能编号RANDOM_POOL键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.RandomPool # 键值
function GameAPI.get_ability_key_random_pool_kv(ability_key, key) end

--获取魔法效果特效编号RANDOM_POOL键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.RandomPool # 键值
function GameAPI.get_modifier_key_random_pool_kv(modifier_key, key) end

--获取特效编号RANDOM_POOL键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.RandomPool # 键值
function GameAPI.get_projectile_key_random_pool_kv(projectile_key, key) end

--获取可破坏物编号RANDOM_POOL键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.RandomPool # 键值
function GameAPI.get_destructible_key_random_pool_kv(destructible_key, key) end

--获取科技编号RANDOM_POOL键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.RandomPool # 键值
function GameAPI.get_tech_key_random_pool_kv(tech_key, key) end

--获取图片RANDOM_POOL键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.RandomPool # 键值
function GameAPI.get_icon_id_random_pool_kv(icon_id, key) end

--获取RANDOM_POOL键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.RandomPool # 键值
function GameAPI.get_kv_pair_value_random_pool(kvbase, key) end

--获取单位编号SCENE_UI键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.SceneNode # 键值
function GameAPI.get_unit_key_scene_ui_kv(unit_key, key) end

--获取物品编号SCENE_UI键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.SceneNode # 键值
function GameAPI.get_item_key_scene_ui_kv(item_key, key) end

--获取技能编号SCENE_UI键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.SceneNode # 键值
function GameAPI.get_ability_key_scene_ui_kv(ability_key, key) end

--获取魔法效果特效编号SCENE_UI键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.SceneNode # 键值
function GameAPI.get_modifier_key_scene_ui_kv(modifier_key, key) end

--获取特效编号SCENE_UI键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.SceneNode # 键值
function GameAPI.get_projectile_key_scene_ui_kv(projectile_key, key) end

--获取可破坏物编号SCENE_UI键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.SceneNode # 键值
function GameAPI.get_destructible_key_scene_ui_kv(destructible_key, key) end

--获取科技编号SCENE_UI键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.SceneNode # 键值
function GameAPI.get_tech_key_scene_ui_kv(tech_key, key) end

--获取图片SCENE_UI键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.SceneNode # 键值
function GameAPI.get_icon_id_scene_ui_kv(icon_id, key) end

--获取SCENE_UI键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.SceneNode # 键值
function GameAPI.get_kv_pair_value_scene_ui(kvbase, key) end

--获取单位编号DAMAGE_TYPE键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_unit_key_damage_type_kv(unit_key, key) end

--获取物品编号DAMAGE_TYPE键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_item_key_damage_type_kv(item_key, key) end

--获取技能编号DAMAGE_TYPE键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_ability_key_damage_type_kv(ability_key, key) end

--获取魔法效果特效编号DAMAGE_TYPE键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_modifier_key_damage_type_kv(modifier_key, key) end

--获取特效编号DAMAGE_TYPE键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_projectile_key_damage_type_kv(projectile_key, key) end

--获取可破坏物编号DAMAGE_TYPE键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_destructible_key_damage_type_kv(destructible_key, key) end

--获取科技编号DAMAGE_TYPE键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_tech_key_damage_type_kv(tech_key, key) end

--获取图片DAMAGE_TYPE键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_icon_id_damage_type_kv(icon_id, key) end

--获取DAMAGE_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_kv_pair_value_damage_type(kvbase, key) end

--获取单位编号HARM_TEXT_TYPE_NEW键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_unit_key_harm_text_type_new_kv(unit_key, key) end

--获取物品编号HARM_TEXT_TYPE_NEW键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_item_key_harm_text_type_new_kv(item_key, key) end

--获取技能编号HARM_TEXT_TYPE_NEW键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_ability_key_harm_text_type_new_kv(ability_key, key) end

--获取魔法效果特效编号HARM_TEXT_TYPE_NEW键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_modifier_key_harm_text_type_new_kv(modifier_key, key) end

--获取特效编号HARM_TEXT_TYPE_NEW键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_projectile_key_harm_text_type_new_kv(projectile_key, key) end

--获取可破坏物编号HARM_TEXT_TYPE_NEW键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_destructible_key_harm_text_type_new_kv(destructible_key, key) end

--获取科技编号HARM_TEXT_TYPE_NEW键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_tech_key_harm_text_type_new_kv(tech_key, key) end

--获取图片HARM_TEXT_TYPE_NEW键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_icon_id_harm_text_type_new_kv(icon_id, key) end

--获取HARM_TEXT_TYPE_NEW键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_kv_pair_value_harm_text_type_new(kvbase, key) end

--获取单位编号NEW_TIMER键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.Timer # 键值
function GameAPI.get_unit_key_new_timer_kv(unit_key, key) end

--获取物品编号NEW_TIMER键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.Timer # 键值
function GameAPI.get_item_key_new_timer_kv(item_key, key) end

--获取技能编号NEW_TIMER键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.Timer # 键值
function GameAPI.get_ability_key_new_timer_kv(ability_key, key) end

--获取魔法效果特效编号NEW_TIMER键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.Timer # 键值
function GameAPI.get_modifier_key_new_timer_kv(modifier_key, key) end

--获取特效编号NEW_TIMER键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.Timer # 键值
function GameAPI.get_projectile_key_new_timer_kv(projectile_key, key) end

--获取可破坏物编号NEW_TIMER键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.Timer # 键值
function GameAPI.get_destructible_key_new_timer_kv(destructible_key, key) end

--获取科技编号NEW_TIMER键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.Timer # 键值
function GameAPI.get_tech_key_new_timer_kv(tech_key, key) end

--获取图片NEW_TIMER键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.Timer # 键值
function GameAPI.get_icon_id_new_timer_kv(icon_id, key) end

--获取NEW_TIMER键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.Timer # 键值
function GameAPI.get_kv_pair_value_new_timer(kvbase, key) end

--获取单位编号TECH_KEY键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.TechKey # 键值
function GameAPI.get_unit_key_tech_key_kv(unit_key, key) end

--获取物品编号TECH_KEY键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.TechKey # 键值
function GameAPI.get_item_key_tech_key_kv(item_key, key) end

--获取技能编号TECH_KEY键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.TechKey # 键值
function GameAPI.get_ability_key_tech_key_kv(ability_key, key) end

--获取魔法效果特效编号TECH_KEY键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.TechKey # 键值
function GameAPI.get_modifier_key_tech_key_kv(modifier_key, key) end

--获取特效编号TECH_KEY键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.TechKey # 键值
function GameAPI.get_projectile_key_tech_key_kv(projectile_key, key) end

--获取可破坏物编号TECH_KEY键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.TechKey # 键值
function GameAPI.get_destructible_key_tech_key_kv(destructible_key, key) end

--获取科技编号TECH_KEY键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.TechKey # 键值
function GameAPI.get_tech_key_tech_key_kv(tech_key, key) end

--获取图片TECH_KEY键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.TechKey # 键值
function GameAPI.get_icon_id_tech_key_kv(icon_id, key) end

--获取TECH_KEY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.TechKey # 键值
function GameAPI.get_kv_pair_value_tech_key(kvbase, key) end

--获取单位编号STORE_KEY键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.StoreKey # 键值
function GameAPI.get_unit_key_store_key_kv(unit_key, key) end

--获取物品编号STORE_KEY键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.StoreKey # 键值
function GameAPI.get_item_key_store_key_kv(item_key, key) end

--获取技能编号STORE_KEY键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.StoreKey # 键值
function GameAPI.get_ability_key_store_key_kv(ability_key, key) end

--获取魔法效果特效编号STORE_KEY键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.StoreKey # 键值
function GameAPI.get_modifier_key_store_key_kv(modifier_key, key) end

--获取特效编号STORE_KEY键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.StoreKey # 键值
function GameAPI.get_projectile_key_store_key_kv(projectile_key, key) end

--获取可破坏物编号STORE_KEY键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.StoreKey # 键值
function GameAPI.get_destructible_key_store_key_kv(destructible_key, key) end

--获取科技编号STORE_KEY键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.StoreKey # 键值
function GameAPI.get_tech_key_store_key_kv(tech_key, key) end

--获取图片STORE_KEY键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.StoreKey # 键值
function GameAPI.get_icon_id_store_key_kv(icon_id, key) end

--获取STORE_KEY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.StoreKey # 键值
function GameAPI.get_kv_pair_value_store_key(kvbase, key) end

--获取单位编号KEYBOARD_KEY键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.KeyboardKey # 键值
function GameAPI.get_unit_key_keyboard_key_kv(unit_key, key) end

--获取物品编号KEYBOARD_KEY键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.KeyboardKey # 键值
function GameAPI.get_item_key_keyboard_key_kv(item_key, key) end

--获取技能编号KEYBOARD_KEY键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.KeyboardKey # 键值
function GameAPI.get_ability_key_keyboard_key_kv(ability_key, key) end

--获取魔法效果特效编号KEYBOARD_KEY键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.KeyboardKey # 键值
function GameAPI.get_modifier_key_keyboard_key_kv(modifier_key, key) end

--获取特效编号KEYBOARD_KEY键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.KeyboardKey # 键值
function GameAPI.get_projectile_key_keyboard_key_kv(projectile_key, key) end

--获取可破坏物编号KEYBOARD_KEY键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.KeyboardKey # 键值
function GameAPI.get_destructible_key_keyboard_key_kv(destructible_key, key) end

--获取科技编号KEYBOARD_KEY键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.KeyboardKey # 键值
function GameAPI.get_tech_key_keyboard_key_kv(tech_key, key) end

--获取图片KEYBOARD_KEY键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.KeyboardKey # 键值
function GameAPI.get_icon_id_keyboard_key_kv(icon_id, key) end

--获取KEYBOARD_KEY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.KeyboardKey # 键值
function GameAPI.get_kv_pair_value_keyboard_key(kvbase, key) end

--获取单位编号FUNC_KEYBOARD_KEY键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.FuncKeyboardKey # 键值
function GameAPI.get_unit_key_func_keyboard_key_kv(unit_key, key) end

--获取物品编号FUNC_KEYBOARD_KEY键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.FuncKeyboardKey # 键值
function GameAPI.get_item_key_func_keyboard_key_kv(item_key, key) end

--获取技能编号FUNC_KEYBOARD_KEY键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.FuncKeyboardKey # 键值
function GameAPI.get_ability_key_func_keyboard_key_kv(ability_key, key) end

--获取魔法效果特效编号FUNC_KEYBOARD_KEY键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.FuncKeyboardKey # 键值
function GameAPI.get_modifier_key_func_keyboard_key_kv(modifier_key, key) end

--获取特效编号FUNC_KEYBOARD_KEY键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.FuncKeyboardKey # 键值
function GameAPI.get_projectile_key_func_keyboard_key_kv(projectile_key, key) end

--获取可破坏物编号FUNC_KEYBOARD_KEY键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.FuncKeyboardKey # 键值
function GameAPI.get_destructible_key_func_keyboard_key_kv(destructible_key, key) end

--获取科技编号FUNC_KEYBOARD_KEY键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.FuncKeyboardKey # 键值
function GameAPI.get_tech_key_func_keyboard_key_kv(tech_key, key) end

--获取图片FUNC_KEYBOARD_KEY键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.FuncKeyboardKey # 键值
function GameAPI.get_icon_id_func_keyboard_key_kv(icon_id, key) end

--获取FUNC_KEYBOARD_KEY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.FuncKeyboardKey # 键值
function GameAPI.get_kv_pair_value_func_keyboard_key(kvbase, key) end

--获取单位编号MOUSE_KEY键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.MouseKey # 键值
function GameAPI.get_unit_key_mouse_key_kv(unit_key, key) end

--获取物品编号MOUSE_KEY键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.MouseKey # 键值
function GameAPI.get_item_key_mouse_key_kv(item_key, key) end

--获取技能编号MOUSE_KEY键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.MouseKey # 键值
function GameAPI.get_ability_key_mouse_key_kv(ability_key, key) end

--获取魔法效果特效编号MOUSE_KEY键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.MouseKey # 键值
function GameAPI.get_modifier_key_mouse_key_kv(modifier_key, key) end

--获取特效编号MOUSE_KEY键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.MouseKey # 键值
function GameAPI.get_projectile_key_mouse_key_kv(projectile_key, key) end

--获取可破坏物编号MOUSE_KEY键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.MouseKey # 键值
function GameAPI.get_destructible_key_mouse_key_kv(destructible_key, key) end

--获取科技编号MOUSE_KEY键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.MouseKey # 键值
function GameAPI.get_tech_key_mouse_key_kv(tech_key, key) end

--获取图片MOUSE_KEY键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.MouseKey # 键值
function GameAPI.get_icon_id_mouse_key_kv(icon_id, key) end

--获取MOUSE_KEY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.MouseKey # 键值
function GameAPI.get_kv_pair_value_mouse_key(kvbase, key) end

--获取单位编号MOUSE_WHEEL键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.MouseWheel # 键值
function GameAPI.get_unit_key_mouse_wheel_kv(unit_key, key) end

--获取物品编号MOUSE_WHEEL键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.MouseWheel # 键值
function GameAPI.get_item_key_mouse_wheel_kv(item_key, key) end

--获取技能编号MOUSE_WHEEL键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.MouseWheel # 键值
function GameAPI.get_ability_key_mouse_wheel_kv(ability_key, key) end

--获取魔法效果特效编号MOUSE_WHEEL键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.MouseWheel # 键值
function GameAPI.get_modifier_key_mouse_wheel_kv(modifier_key, key) end

--获取特效编号MOUSE_WHEEL键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.MouseWheel # 键值
function GameAPI.get_projectile_key_mouse_wheel_kv(projectile_key, key) end

--获取可破坏物编号MOUSE_WHEEL键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.MouseWheel # 键值
function GameAPI.get_destructible_key_mouse_wheel_kv(destructible_key, key) end

--获取科技编号MOUSE_WHEEL键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.MouseWheel # 键值
function GameAPI.get_tech_key_mouse_wheel_kv(tech_key, key) end

--获取图片MOUSE_WHEEL键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.MouseWheel # 键值
function GameAPI.get_icon_id_mouse_wheel_kv(icon_id, key) end

--获取MOUSE_WHEEL键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.MouseWheel # 键值
function GameAPI.get_kv_pair_value_mouse_wheel(kvbase, key) end

--获取单位编号POST_EFFECT键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.PostEffect # 键值
function GameAPI.get_unit_key_post_effect_kv(unit_key, key) end

--获取物品编号POST_EFFECT键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.PostEffect # 键值
function GameAPI.get_item_key_post_effect_kv(item_key, key) end

--获取技能编号POST_EFFECT键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.PostEffect # 键值
function GameAPI.get_ability_key_post_effect_kv(ability_key, key) end

--获取魔法效果特效编号POST_EFFECT键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.PostEffect # 键值
function GameAPI.get_modifier_key_post_effect_kv(modifier_key, key) end

--获取特效编号POST_EFFECT键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.PostEffect # 键值
function GameAPI.get_projectile_key_post_effect_kv(projectile_key, key) end

--获取可破坏物编号POST_EFFECT键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.PostEffect # 键值
function GameAPI.get_destructible_key_post_effect_kv(destructible_key, key) end

--获取科技编号POST_EFFECT键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.PostEffect # 键值
function GameAPI.get_tech_key_post_effect_kv(tech_key, key) end

--获取图片POST_EFFECT键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.PostEffect # 键值
function GameAPI.get_icon_id_post_effect_kv(icon_id, key) end

--获取POST_EFFECT键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.PostEffect # 键值
function GameAPI.get_kv_pair_value_post_effect(kvbase, key) end

--获取单位编号UNIT_TYPE键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.UnitType # 键值
function GameAPI.get_unit_key_unit_type_kv(unit_key, key) end

--获取物品编号UNIT_TYPE键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.UnitType # 键值
function GameAPI.get_item_key_unit_type_kv(item_key, key) end

--获取技能编号UNIT_TYPE键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.UnitType # 键值
function GameAPI.get_ability_key_unit_type_kv(ability_key, key) end

--获取魔法效果特效编号UNIT_TYPE键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.UnitType # 键值
function GameAPI.get_modifier_key_unit_type_kv(modifier_key, key) end

--获取特效编号UNIT_TYPE键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.UnitType # 键值
function GameAPI.get_projectile_key_unit_type_kv(projectile_key, key) end

--获取可破坏物编号UNIT_TYPE键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.UnitType # 键值
function GameAPI.get_destructible_key_unit_type_kv(destructible_key, key) end

--获取科技编号UNIT_TYPE键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.UnitType # 键值
function GameAPI.get_tech_key_unit_type_kv(tech_key, key) end

--获取图片UNIT_TYPE键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.UnitType # 键值
function GameAPI.get_icon_id_unit_type_kv(icon_id, key) end

--获取UNIT_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.UnitType # 键值
function GameAPI.get_kv_pair_value_unit_type(kvbase, key) end

--获取单位编号UNIT_COMMAND_TYPE键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.UnitCommandType # 键值
function GameAPI.get_unit_key_unit_command_type_kv(unit_key, key) end

--获取物品编号UNIT_COMMAND_TYPE键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.UnitCommandType # 键值
function GameAPI.get_item_key_unit_command_type_kv(item_key, key) end

--获取技能编号UNIT_COMMAND_TYPE键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.UnitCommandType # 键值
function GameAPI.get_ability_key_unit_command_type_kv(ability_key, key) end

--获取魔法效果特效编号UNIT_COMMAND_TYPE键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.UnitCommandType # 键值
function GameAPI.get_modifier_key_unit_command_type_kv(modifier_key, key) end

--获取特效编号UNIT_COMMAND_TYPE键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.UnitCommandType # 键值
function GameAPI.get_projectile_key_unit_command_type_kv(projectile_key, key) end

--获取可破坏物编号UNIT_COMMAND_TYPE键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.UnitCommandType # 键值
function GameAPI.get_destructible_key_unit_command_type_kv(destructible_key, key) end

--获取科技编号UNIT_COMMAND_TYPE键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.UnitCommandType # 键值
function GameAPI.get_tech_key_unit_command_type_kv(tech_key, key) end

--获取图片UNIT_COMMAND_TYPE键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.UnitCommandType # 键值
function GameAPI.get_icon_id_unit_command_type_kv(icon_id, key) end

--获取UNIT_COMMAND_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.UnitCommandType # 键值
function GameAPI.get_kv_pair_value_unit_command_type(kvbase, key) end

--获取单位编号MINI_MAP_COLOR_TYPE键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.MiniMapColorType # 键值
function GameAPI.get_unit_key_mini_map_color_type_kv(unit_key, key) end

--获取物品编号MINI_MAP_COLOR_TYPE键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.MiniMapColorType # 键值
function GameAPI.get_item_key_mini_map_color_type_kv(item_key, key) end

--获取技能编号MINI_MAP_COLOR_TYPE键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.MiniMapColorType # 键值
function GameAPI.get_ability_key_mini_map_color_type_kv(ability_key, key) end

--获取魔法效果特效编号MINI_MAP_COLOR_TYPE键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.MiniMapColorType # 键值
function GameAPI.get_modifier_key_mini_map_color_type_kv(modifier_key, key) end

--获取特效编号MINI_MAP_COLOR_TYPE键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.MiniMapColorType # 键值
function GameAPI.get_projectile_key_mini_map_color_type_kv(projectile_key, key) end

--获取可破坏物编号MINI_MAP_COLOR_TYPE键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.MiniMapColorType # 键值
function GameAPI.get_destructible_key_mini_map_color_type_kv(destructible_key, key) end

--获取科技编号MINI_MAP_COLOR_TYPE键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.MiniMapColorType # 键值
function GameAPI.get_tech_key_mini_map_color_type_kv(tech_key, key) end

--获取图片MINI_MAP_COLOR_TYPE键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.MiniMapColorType # 键值
function GameAPI.get_icon_id_mini_map_color_type_kv(icon_id, key) end

--获取MINI_MAP_COLOR_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.MiniMapColorType # 键值
function GameAPI.get_kv_pair_value_mini_map_color_type(kvbase, key) end

--获取单位编号UNIT_BEHAVIOR键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.UnitBehavior # 键值
function GameAPI.get_unit_key_unit_behavior_kv(unit_key, key) end

--获取物品编号UNIT_BEHAVIOR键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.UnitBehavior # 键值
function GameAPI.get_item_key_unit_behavior_kv(item_key, key) end

--获取技能编号UNIT_BEHAVIOR键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.UnitBehavior # 键值
function GameAPI.get_ability_key_unit_behavior_kv(ability_key, key) end

--获取魔法效果特效编号UNIT_BEHAVIOR键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.UnitBehavior # 键值
function GameAPI.get_modifier_key_unit_behavior_kv(modifier_key, key) end

--获取特效编号UNIT_BEHAVIOR键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.UnitBehavior # 键值
function GameAPI.get_projectile_key_unit_behavior_kv(projectile_key, key) end

--获取可破坏物编号UNIT_BEHAVIOR键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.UnitBehavior # 键值
function GameAPI.get_destructible_key_unit_behavior_kv(destructible_key, key) end

--获取科技编号UNIT_BEHAVIOR键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.UnitBehavior # 键值
function GameAPI.get_tech_key_unit_behavior_kv(tech_key, key) end

--获取图片UNIT_BEHAVIOR键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.UnitBehavior # 键值
function GameAPI.get_icon_id_unit_behavior_kv(icon_id, key) end

--获取UNIT_BEHAVIOR键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.UnitBehavior # 键值
function GameAPI.get_kv_pair_value_unit_behavior(kvbase, key) end

--获取单位编号CURVED_PATH键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.CurvedPath # 键值
function GameAPI.get_unit_key_curved_path_kv(unit_key, key) end

--获取物品编号CURVED_PATH键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.CurvedPath # 键值
function GameAPI.get_item_key_curved_path_kv(item_key, key) end

--获取技能编号CURVED_PATH键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.CurvedPath # 键值
function GameAPI.get_ability_key_curved_path_kv(ability_key, key) end

--获取魔法效果特效编号CURVED_PATH键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.CurvedPath # 键值
function GameAPI.get_modifier_key_curved_path_kv(modifier_key, key) end

--获取特效编号CURVED_PATH键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.CurvedPath # 键值
function GameAPI.get_projectile_key_curved_path_kv(projectile_key, key) end

--获取可破坏物编号CURVED_PATH键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.CurvedPath # 键值
function GameAPI.get_destructible_key_curved_path_kv(destructible_key, key) end

--获取科技编号CURVED_PATH键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.CurvedPath # 键值
function GameAPI.get_tech_key_curved_path_kv(tech_key, key) end

--获取图片CURVED_PATH键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.CurvedPath # 键值
function GameAPI.get_icon_id_curved_path_kv(icon_id, key) end

--获取CURVED_PATH键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.CurvedPath # 键值
function GameAPI.get_kv_pair_value_curved_path(kvbase, key) end

--获取全局触发器非数组变量（指定类型）
---@param var_type string # 变量类型
---@param key string # 变量名称
---@return py.Actor # 值
function GameAPI.get_trigger_variable_by_type(var_type, key) end

--获取全局触发器数组变量子项（指定类型）
---@param var_type string # 变量类型
---@param key string # 变量名称
---@param index integer # 下标
---@return py.Actor # 值
function GameAPI.get_trigger_list_variable_by_type(var_type, key, index) end

--获取全局触发器BOOLEAN非数组变量
---@param key string # 变量名称
---@return boolean # 值
function GameAPI.get_trigger_variable_boolean(key) end

--获取触发器BOOLEAN非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return boolean # 值
function GameAPI.get_trigger_actor_variable_boolean(actor, key) end

--获取全局触发器BOOLEAN数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return boolean # 值
function GameAPI.get_trigger_list_variable_boolean(key, index) end

--获取触发器BOOLEAN数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return boolean # 值
function GameAPI.get_trigger_list_actor_variable_boolean(actor, key, index) end

--获取全局触发器BOOLEAN数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_boolean(key) end

--获取触发器BOOLEAN 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_boolean(actor, key) end

--获取全局触发器INTEGER非数组变量
---@param key string # 变量名称
---@return integer # 值
function GameAPI.get_trigger_variable_integer(key) end

--获取触发器INTEGER非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return integer # 值
function GameAPI.get_trigger_actor_variable_integer(actor, key) end

--获取全局触发器INTEGER数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return integer # 值
function GameAPI.get_trigger_list_variable_integer(key, index) end

--获取触发器INTEGER数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return integer # 值
function GameAPI.get_trigger_list_actor_variable_integer(actor, key, index) end

--获取全局触发器INTEGER数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_integer(key) end

--获取触发器INTEGER 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_integer(actor, key) end

--获取全局触发器FLOAT非数组变量
---@param key string # 变量名称
---@return py.Fixed # 值
function GameAPI.get_trigger_variable_float(key) end

--获取触发器FLOAT非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.Fixed # 值
function GameAPI.get_trigger_actor_variable_float(actor, key) end

--获取全局触发器FLOAT数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.Fixed # 值
function GameAPI.get_trigger_list_variable_float(key, index) end

--获取触发器FLOAT数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.Fixed # 值
function GameAPI.get_trigger_list_actor_variable_float(actor, key, index) end

--获取全局触发器FLOAT数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_float(key) end

--获取触发器FLOAT 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_float(actor, key) end

--获取全局触发器STRING非数组变量
---@param key string # 变量名称
---@return string # 值
function GameAPI.get_trigger_variable_string(key) end

--获取触发器STRING非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return string # 值
function GameAPI.get_trigger_actor_variable_string(actor, key) end

--获取全局触发器STRING数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return string # 值
function GameAPI.get_trigger_list_variable_string(key, index) end

--获取触发器STRING数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return string # 值
function GameAPI.get_trigger_list_actor_variable_string(actor, key, index) end

--获取全局触发器STRING数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_string(key) end

--获取触发器STRING 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_string(actor, key) end

--获取全局触发器UI_COMP非数组变量
---@param key string # 变量名称
---@return string # 值
function GameAPI.get_trigger_variable_ui_comp(key) end

--获取触发器UI_COMP非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return string # 值
function GameAPI.get_trigger_actor_variable_ui_comp(actor, key) end

--获取全局触发器UI_COMP数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return string # 值
function GameAPI.get_trigger_list_variable_ui_comp(key, index) end

--获取触发器UI_COMP数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return string # 值
function GameAPI.get_trigger_list_actor_variable_ui_comp(actor, key, index) end

--获取全局触发器UI_COMP数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_ui_comp(key) end

--获取触发器UI_COMP 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_ui_comp(actor, key) end

--获取全局触发器UI_COMP_TYPE非数组变量
---@param key string # 变量名称
---@return integer # 值
function GameAPI.get_trigger_variable_ui_comp_type(key) end

--获取触发器UI_COMP_TYPE非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return integer # 值
function GameAPI.get_trigger_actor_variable_ui_comp_type(actor, key) end

--获取全局触发器UI_COMP_TYPE数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return integer # 值
function GameAPI.get_trigger_list_variable_ui_comp_type(key, index) end

--获取触发器UI_COMP_TYPE数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return integer # 值
function GameAPI.get_trigger_list_actor_variable_ui_comp_type(actor, key, index) end

--获取全局触发器UI_COMP_TYPE数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_ui_comp_type(key) end

--获取触发器UI_COMP_TYPE 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_ui_comp_type(actor, key) end

--获取全局触发器UI_COMP_EVENT_TYPE非数组变量
---@param key string # 变量名称
---@return integer # 值
function GameAPI.get_trigger_variable_ui_comp_event_type(key) end

--获取触发器UI_COMP_EVENT_TYPE非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return integer # 值
function GameAPI.get_trigger_actor_variable_ui_comp_event_type(actor, key) end

--获取全局触发器UI_COMP_EVENT_TYPE数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return integer # 值
function GameAPI.get_trigger_list_variable_ui_comp_event_type(key, index) end

--获取触发器UI_COMP_EVENT_TYPE数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return integer # 值
function GameAPI.get_trigger_list_actor_variable_ui_comp_event_type(actor, key, index) end

--获取全局触发器UI_COMP_EVENT_TYPE数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_ui_comp_event_type(key) end

--获取触发器UI_COMP_EVENT_TYPE 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_ui_comp_event_type(actor, key) end

--获取全局触发器UI_COMP_ATTR非数组变量
---@param key string # 变量名称
---@return string # 值
function GameAPI.get_trigger_variable_ui_comp_attr(key) end

--获取触发器UI_COMP_ATTR非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return string # 值
function GameAPI.get_trigger_actor_variable_ui_comp_attr(actor, key) end

--获取全局触发器UI_COMP_ATTR数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return string # 值
function GameAPI.get_trigger_list_variable_ui_comp_attr(key, index) end

--获取触发器UI_COMP_ATTR数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return string # 值
function GameAPI.get_trigger_list_actor_variable_ui_comp_attr(actor, key, index) end

--获取全局触发器UI_COMP_ATTR数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_ui_comp_attr(key) end

--获取触发器UI_COMP_ATTR 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_ui_comp_attr(actor, key) end

--获取全局触发器UI_COMP_ALIGN_TYPE非数组变量
---@param key string # 变量名称
---@return integer # 值
function GameAPI.get_trigger_variable_ui_comp_align_type(key) end

--获取触发器UI_COMP_ALIGN_TYPE非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return integer # 值
function GameAPI.get_trigger_actor_variable_ui_comp_align_type(actor, key) end

--获取全局触发器UI_COMP_ALIGN_TYPE数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return integer # 值
function GameAPI.get_trigger_list_variable_ui_comp_align_type(key, index) end

--获取触发器UI_COMP_ALIGN_TYPE数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return integer # 值
function GameAPI.get_trigger_list_actor_variable_ui_comp_align_type(actor, key, index) end

--获取全局触发器UI_COMP_ALIGN_TYPE数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_ui_comp_align_type(key) end

--获取触发器UI_COMP_ALIGN_TYPE 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_ui_comp_align_type(actor, key) end

--获取全局触发器UI_PREFAB非数组变量
---@param key string # 变量名称
---@return string # 值
function GameAPI.get_trigger_variable_ui_prefab(key) end

--获取触发器UI_PREFAB非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return string # 值
function GameAPI.get_trigger_actor_variable_ui_prefab(actor, key) end

--获取全局触发器UI_PREFAB数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return string # 值
function GameAPI.get_trigger_list_variable_ui_prefab(key, index) end

--获取触发器UI_PREFAB数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return string # 值
function GameAPI.get_trigger_list_actor_variable_ui_prefab(actor, key, index) end

--获取全局触发器UI_PREFAB数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_ui_prefab(key) end

--获取触发器UI_PREFAB 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_ui_prefab(actor, key) end

--获取全局触发器UI_PREFAB_INSTANCE非数组变量
---@param key string # 变量名称
---@return py.UIPrefabIns # 值
function GameAPI.get_trigger_variable_ui_prefab_instance(key) end

--获取触发器UI_PREFAB_INSTANCE非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.UIPrefabIns # 值
function GameAPI.get_trigger_actor_variable_ui_prefab_instance(actor, key) end

--获取全局触发器UI_PREFAB_INSTANCE数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.UIPrefabIns # 值
function GameAPI.get_trigger_list_variable_ui_prefab_instance(key, index) end

--获取触发器UI_PREFAB_INSTANCE数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.UIPrefabIns # 值
function GameAPI.get_trigger_list_actor_variable_ui_prefab_instance(actor, key, index) end

--获取全局触发器UI_PREFAB_INSTANCE数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_ui_prefab_instance(key) end

--获取触发器UI_PREFAB_INSTANCE 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_ui_prefab_instance(actor, key) end

--获取全局触发器UI_PREFAB_INS_UID非数组变量
---@param key string # 变量名称
---@return string # 值
function GameAPI.get_trigger_variable_ui_prefab_ins_uid(key) end

--获取触发器UI_PREFAB_INS_UID非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return string # 值
function GameAPI.get_trigger_actor_variable_ui_prefab_ins_uid(actor, key) end

--获取全局触发器UI_PREFAB_INS_UID数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return string # 值
function GameAPI.get_trigger_list_variable_ui_prefab_ins_uid(key, index) end

--获取触发器UI_PREFAB_INS_UID数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return string # 值
function GameAPI.get_trigger_list_actor_variable_ui_prefab_ins_uid(actor, key, index) end

--获取全局触发器UI_PREFAB_INS_UID数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_ui_prefab_ins_uid(key) end

--获取触发器UI_PREFAB_INS_UID 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_ui_prefab_ins_uid(actor, key) end

--获取全局触发器UI_DIRECTION非数组变量
---@param key string # 变量名称
---@return integer # 值
function GameAPI.get_trigger_variable_ui_direction(key) end

--获取触发器UI_DIRECTION非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return integer # 值
function GameAPI.get_trigger_actor_variable_ui_direction(actor, key) end

--获取全局触发器UI_DIRECTION数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return integer # 值
function GameAPI.get_trigger_list_variable_ui_direction(key, index) end

--获取触发器UI_DIRECTION数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return integer # 值
function GameAPI.get_trigger_list_actor_variable_ui_direction(actor, key, index) end

--获取全局触发器UI_DIRECTION数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_ui_direction(key) end

--获取触发器UI_DIRECTION 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_ui_direction(actor, key) end

--获取全局触发器UI_ANIM非数组变量
---@param key string # 变量名称
---@return py.UIAnimKey # 值
function GameAPI.get_trigger_variable_ui_anim(key) end

--获取触发器UI_ANIM非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.UIAnimKey # 值
function GameAPI.get_trigger_actor_variable_ui_anim(actor, key) end

--获取全局触发器UI_ANIM数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.UIAnimKey # 值
function GameAPI.get_trigger_list_variable_ui_anim(key, index) end

--获取触发器UI_ANIM数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.UIAnimKey # 值
function GameAPI.get_trigger_list_actor_variable_ui_anim(actor, key, index) end

--获取全局触发器UI_ANIM数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_ui_anim(key) end

--获取触发器UI_ANIM 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_ui_anim(actor, key) end

--获取全局触发器UI_ANIM_CURVE非数组变量
---@param key string # 变量名称
---@return integer # 值
function GameAPI.get_trigger_variable_ui_anim_curve(key) end

--获取触发器UI_ANIM_CURVE非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return integer # 值
function GameAPI.get_trigger_actor_variable_ui_anim_curve(actor, key) end

--获取全局触发器UI_ANIM_CURVE数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return integer # 值
function GameAPI.get_trigger_list_variable_ui_anim_curve(key, index) end

--获取触发器UI_ANIM_CURVE数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return integer # 值
function GameAPI.get_trigger_list_actor_variable_ui_anim_curve(actor, key, index) end

--获取全局触发器UI_ANIM_CURVE数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_ui_anim_curve(key) end

--获取触发器UI_ANIM_CURVE 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_ui_anim_curve(actor, key) end

--获取全局触发器AUDIO_CHANNEL非数组变量
---@param key string # 变量名称
---@return integer # 值
function GameAPI.get_trigger_variable_audio_channel(key) end

--获取触发器AUDIO_CHANNEL非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return integer # 值
function GameAPI.get_trigger_actor_variable_audio_channel(actor, key) end

--获取全局触发器AUDIO_CHANNEL数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return integer # 值
function GameAPI.get_trigger_list_variable_audio_channel(key, index) end

--获取触发器AUDIO_CHANNEL数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return integer # 值
function GameAPI.get_trigger_list_actor_variable_audio_channel(actor, key, index) end

--获取全局触发器AUDIO_CHANNEL数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_audio_channel(key) end

--获取触发器AUDIO_CHANNEL 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_audio_channel(actor, key) end

--获取全局触发器UNIT_ENTITY非数组变量
---@param key string # 变量名称
---@return py.Unit # 值
function GameAPI.get_trigger_variable_unit_entity(key) end

--获取触发器UNIT_ENTITY非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.Unit # 值
function GameAPI.get_trigger_actor_variable_unit_entity(actor, key) end

--获取全局触发器UNIT_ENTITY数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.Unit # 值
function GameAPI.get_trigger_list_variable_unit_entity(key, index) end

--获取触发器UNIT_ENTITY数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.Unit # 值
function GameAPI.get_trigger_list_actor_variable_unit_entity(actor, key, index) end

--获取全局触发器UNIT_ENTITY数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_unit_entity(key) end

--获取触发器UNIT_ENTITY 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_unit_entity(actor, key) end

--获取全局触发器UNIT_GROUP非数组变量
---@param key string # 变量名称
---@return py.UnitGroup # 值
function GameAPI.get_trigger_variable_unit_group(key) end

--获取触发器UNIT_GROUP非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.UnitGroup # 值
function GameAPI.get_trigger_actor_variable_unit_group(actor, key) end

--获取全局触发器UNIT_GROUP数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.UnitGroup # 值
function GameAPI.get_trigger_list_variable_unit_group(key, index) end

--获取触发器UNIT_GROUP数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.UnitGroup # 值
function GameAPI.get_trigger_list_actor_variable_unit_group(actor, key, index) end

--获取全局触发器UNIT_GROUP数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_unit_group(key) end

--获取触发器UNIT_GROUP 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_unit_group(actor, key) end

--获取全局触发器UNIT_NAME非数组变量
---@param key string # 变量名称
---@return py.UnitKey # 值
function GameAPI.get_trigger_variable_unit_name(key) end

--获取触发器UNIT_NAME非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.UnitKey # 值
function GameAPI.get_trigger_actor_variable_unit_name(actor, key) end

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

--获取全局触发器MODIFIER_TYPE非数组变量
---@param key string # 变量名称
---@return py.ModifierType # 值
function GameAPI.get_trigger_variable_modifier_type(key) end

--获取触发器MODIFIER_TYPE非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.ModifierType # 值
function GameAPI.get_trigger_actor_variable_modifier_type(actor, key) end

--获取全局触发器MODIFIER_TYPE数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.ModifierType # 值
function GameAPI.get_trigger_list_variable_modifier_type(key, index) end

--获取触发器MODIFIER_TYPE数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.ModifierType # 值
function GameAPI.get_trigger_list_actor_variable_modifier_type(actor, key, index) end

--获取全局触发器MODIFIER_TYPE数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_modifier_type(key) end

--获取触发器MODIFIER_TYPE 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_modifier_type(actor, key) end

--获取全局触发器MODIFIER_EFFECT_TYPE非数组变量
---@param key string # 变量名称
---@return py.ModifierEffectType # 值
function GameAPI.get_trigger_variable_modifier_effect_type(key) end

--获取触发器MODIFIER_EFFECT_TYPE非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.ModifierEffectType # 值
function GameAPI.get_trigger_actor_variable_modifier_effect_type(actor, key) end

--获取全局触发器MODIFIER_EFFECT_TYPE数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.ModifierEffectType # 值
function GameAPI.get_trigger_list_variable_modifier_effect_type(key, index) end

--获取触发器MODIFIER_EFFECT_TYPE数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.ModifierEffectType # 值
function GameAPI.get_trigger_list_actor_variable_modifier_effect_type(actor, key, index) end

--获取全局触发器MODIFIER_EFFECT_TYPE数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_modifier_effect_type(key) end

--获取触发器MODIFIER_EFFECT_TYPE 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_modifier_effect_type(actor, key) end

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

--获取全局触发器PROJECTILE_3D非数组变量
---@param key string # 变量名称
---@return py.ProjectileKey # 值
function GameAPI.get_trigger_variable_projectile_3d(key) end

--获取触发器PROJECTILE_3D非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.ProjectileKey # 值
function GameAPI.get_trigger_actor_variable_projectile_3d(actor, key) end

--获取全局触发器PROJECTILE_3D数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.ProjectileKey # 值
function GameAPI.get_trigger_list_variable_projectile_3d(key, index) end

--获取触发器PROJECTILE_3D数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.ProjectileKey # 值
function GameAPI.get_trigger_list_actor_variable_projectile_3d(actor, key, index) end

--获取全局触发器PROJECTILE_3D数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_projectile_3d(key) end

--获取触发器PROJECTILE_3D 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_projectile_3d(actor, key) end

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

--获取全局触发器ROLE_RELATION非数组变量
---@param key string # 变量名称
---@return py.RoleRelation # 值
function GameAPI.get_trigger_variable_role_relation(key) end

--获取触发器ROLE_RELATION非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.RoleRelation # 值
function GameAPI.get_trigger_actor_variable_role_relation(actor, key) end

--获取全局触发器ROLE_RELATION数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.RoleRelation # 值
function GameAPI.get_trigger_list_variable_role_relation(key, index) end

--获取触发器ROLE_RELATION数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.RoleRelation # 值
function GameAPI.get_trigger_list_actor_variable_role_relation(actor, key, index) end

--获取全局触发器ROLE_RELATION数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_role_relation(key) end

--获取触发器ROLE_RELATION 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_role_relation(actor, key) end

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

--获取全局触发器SCENE_SOUND非数组变量
---@param key string # 变量名称
---@return py.SceneSound # 值
function GameAPI.get_trigger_variable_scene_sound(key) end

--获取触发器SCENE_SOUND非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.SceneSound # 值
function GameAPI.get_trigger_actor_variable_scene_sound(actor, key) end

--获取全局触发器SCENE_SOUND数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.SceneSound # 值
function GameAPI.get_trigger_list_variable_scene_sound(key, index) end

--获取触发器SCENE_SOUND数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.SceneSound # 值
function GameAPI.get_trigger_list_actor_variable_scene_sound(actor, key, index) end

--获取全局触发器SCENE_SOUND数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_scene_sound(key) end

--获取触发器SCENE_SOUND 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_scene_sound(actor, key) end

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

--获取全局触发器HARM_TEXT_TYPE_NEW非数组变量
---@param key string # 变量名称
---@return string # 值
function GameAPI.get_trigger_variable_harm_text_type_new(key) end

--获取触发器HARM_TEXT_TYPE_NEW非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return string # 值
function GameAPI.get_trigger_actor_variable_harm_text_type_new(actor, key) end

--获取全局触发器HARM_TEXT_TYPE_NEW数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return string # 值
function GameAPI.get_trigger_list_variable_harm_text_type_new(key, index) end

--获取触发器HARM_TEXT_TYPE_NEW数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return string # 值
function GameAPI.get_trigger_list_actor_variable_harm_text_type_new(actor, key, index) end

--获取全局触发器HARM_TEXT_TYPE_NEW数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_harm_text_type_new(key) end

--获取触发器HARM_TEXT_TYPE_NEW 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_harm_text_type_new(actor, key) end

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

--获取全局触发器FUNC_KEYBOARD_KEY非数组变量
---@param key string # 变量名称
---@return py.FuncKeyboardKey # 值
function GameAPI.get_trigger_variable_func_keyboard_key(key) end

--获取触发器FUNC_KEYBOARD_KEY非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.FuncKeyboardKey # 值
function GameAPI.get_trigger_actor_variable_func_keyboard_key(actor, key) end

--获取全局触发器FUNC_KEYBOARD_KEY数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.FuncKeyboardKey # 值
function GameAPI.get_trigger_list_variable_func_keyboard_key(key, index) end

--获取触发器FUNC_KEYBOARD_KEY数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.FuncKeyboardKey # 值
function GameAPI.get_trigger_list_actor_variable_func_keyboard_key(actor, key, index) end

--获取全局触发器FUNC_KEYBOARD_KEY数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_func_keyboard_key(key) end

--获取触发器FUNC_KEYBOARD_KEY 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_func_keyboard_key(actor, key) end

--获取全局触发器MOUSE_KEY非数组变量
---@param key string # 变量名称
---@return py.MouseKey # 值
function GameAPI.get_trigger_variable_mouse_key(key) end

--获取触发器MOUSE_KEY非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.MouseKey # 值
function GameAPI.get_trigger_actor_variable_mouse_key(actor, key) end

--获取全局触发器MOUSE_KEY数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.MouseKey # 值
function GameAPI.get_trigger_list_variable_mouse_key(key, index) end

--获取触发器MOUSE_KEY数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.MouseKey # 值
function GameAPI.get_trigger_list_actor_variable_mouse_key(actor, key, index) end

--获取全局触发器MOUSE_KEY数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_mouse_key(key) end

--获取触发器MOUSE_KEY 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_mouse_key(actor, key) end

--获取全局触发器MOUSE_WHEEL非数组变量
---@param key string # 变量名称
---@return py.MouseWheel # 值
function GameAPI.get_trigger_variable_mouse_wheel(key) end

--获取触发器MOUSE_WHEEL非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.MouseWheel # 值
function GameAPI.get_trigger_actor_variable_mouse_wheel(actor, key) end

--获取全局触发器MOUSE_WHEEL数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.MouseWheel # 值
function GameAPI.get_trigger_list_variable_mouse_wheel(key, index) end

--获取触发器MOUSE_WHEEL数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.MouseWheel # 值
function GameAPI.get_trigger_list_actor_variable_mouse_wheel(actor, key, index) end

--获取全局触发器MOUSE_WHEEL数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_mouse_wheel(key) end

--获取触发器MOUSE_WHEEL 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_mouse_wheel(actor, key) end

--获取全局触发器POST_EFFECT非数组变量
---@param key string # 变量名称
---@return py.PostEffect # 值
function GameAPI.get_trigger_variable_post_effect(key) end

--获取触发器POST_EFFECT非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.PostEffect # 值
function GameAPI.get_trigger_actor_variable_post_effect(actor, key) end

--获取全局触发器POST_EFFECT数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.PostEffect # 值
function GameAPI.get_trigger_list_variable_post_effect(key, index) end

--获取触发器POST_EFFECT数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.PostEffect # 值
function GameAPI.get_trigger_list_actor_variable_post_effect(actor, key, index) end

--获取全局触发器POST_EFFECT数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_post_effect(key) end

--获取触发器POST_EFFECT 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_post_effect(actor, key) end

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

--获取全局触发器UNIT_BEHAVIOR非数组变量
---@param key string # 变量名称
---@return py.UnitBehavior # 值
function GameAPI.get_trigger_variable_unit_behavior(key) end

--获取触发器UNIT_BEHAVIOR非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.UnitBehavior # 值
function GameAPI.get_trigger_actor_variable_unit_behavior(actor, key) end

--获取全局触发器UNIT_BEHAVIOR数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.UnitBehavior # 值
function GameAPI.get_trigger_list_variable_unit_behavior(key, index) end

--获取触发器UNIT_BEHAVIOR数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.UnitBehavior # 值
function GameAPI.get_trigger_list_actor_variable_unit_behavior(actor, key, index) end

--获取全局触发器UNIT_BEHAVIOR数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_unit_behavior(key) end

--获取触发器UNIT_BEHAVIOR 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_unit_behavior(actor, key) end

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

--设置全局触发器UI_COMP_ATTR数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? string # 值
function GameAPI.set_trigger_list_variable_ui_comp_attr(key, index, value) end

--设置全局触发器UI_COMP_ATTR数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? string # 值
function GameAPI.set_trigger_list_actor_variable_ui_comp_attr(actor, key, index, value) end

--设置全局触发器UI_COMP_ATTR非数组变量
---@param key string # 变量名称
---@param value? string # 值
function GameAPI.set_trigger_variable_ui_comp_attr(key, value) end

--设置全局触发器UI_COMP_ATTR非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? string # 值
function GameAPI.set_trigger_actor_variable_ui_comp_attr(actor, key, value) end

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

--设置全局触发器MODIFIER_TYPE数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.ModifierType # 值
function GameAPI.set_trigger_list_variable_modifier_type(key, index, value) end

--设置全局触发器MODIFIER_TYPE数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.ModifierType # 值
function GameAPI.set_trigger_list_actor_variable_modifier_type(actor, key, index, value) end

--设置全局触发器MODIFIER_TYPE非数组变量
---@param key string # 变量名称
---@param value? py.ModifierType # 值
function GameAPI.set_trigger_variable_modifier_type(key, value) end

--设置全局触发器MODIFIER_TYPE非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.ModifierType # 值
function GameAPI.set_trigger_actor_variable_modifier_type(actor, key, value) end

--设置全局触发器MODIFIER_EFFECT_TYPE数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.ModifierEffectType # 值
function GameAPI.set_trigger_list_variable_modifier_effect_type(key, index, value) end

--设置全局触发器MODIFIER_EFFECT_TYPE数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.ModifierEffectType # 值
function GameAPI.set_trigger_list_actor_variable_modifier_effect_type(actor, key, index, value) end

--设置全局触发器MODIFIER_EFFECT_TYPE非数组变量
---@param key string # 变量名称
---@param value? py.ModifierEffectType # 值
function GameAPI.set_trigger_variable_modifier_effect_type(key, value) end

--设置全局触发器MODIFIER_EFFECT_TYPE非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.ModifierEffectType # 值
function GameAPI.set_trigger_actor_variable_modifier_effect_type(actor, key, value) end

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

--设置全局触发器PROJECTILE_3D数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.ProjectileKey # 值
function GameAPI.set_trigger_list_variable_projectile_3d(key, index, value) end

--设置全局触发器PROJECTILE_3D数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.ProjectileKey # 值
function GameAPI.set_trigger_list_actor_variable_projectile_3d(actor, key, index, value) end

--设置全局触发器PROJECTILE_3D非数组变量
---@param key string # 变量名称
---@param value? py.ProjectileKey # 值
function GameAPI.set_trigger_variable_projectile_3d(key, value) end

--设置全局触发器PROJECTILE_3D非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.ProjectileKey # 值
function GameAPI.set_trigger_actor_variable_projectile_3d(actor, key, value) end

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

--设置全局触发器ROLE_RELATION数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.RoleRelation # 值
function GameAPI.set_trigger_list_variable_role_relation(key, index, value) end

--设置全局触发器ROLE_RELATION数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.RoleRelation # 值
function GameAPI.set_trigger_list_actor_variable_role_relation(actor, key, index, value) end

--设置全局触发器ROLE_RELATION非数组变量
---@param key string # 变量名称
---@param value? py.RoleRelation # 值
function GameAPI.set_trigger_variable_role_relation(key, value) end

--设置全局触发器ROLE_RELATION非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.RoleRelation # 值
function GameAPI.set_trigger_actor_variable_role_relation(actor, key, value) end

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

--设置全局触发器SCENE_SOUND数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.SceneSound # 值
function GameAPI.set_trigger_list_variable_scene_sound(key, index, value) end

--设置全局触发器SCENE_SOUND数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.SceneSound # 值
function GameAPI.set_trigger_list_actor_variable_scene_sound(actor, key, index, value) end

--设置全局触发器SCENE_SOUND非数组变量
---@param key string # 变量名称
---@param value? py.SceneSound # 值
function GameAPI.set_trigger_variable_scene_sound(key, value) end

--设置全局触发器SCENE_SOUND非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.SceneSound # 值
function GameAPI.set_trigger_actor_variable_scene_sound(actor, key, value) end

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

--设置全局触发器HARM_TEXT_TYPE_NEW数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? string # 值
function GameAPI.set_trigger_list_variable_harm_text_type_new(key, index, value) end

--设置全局触发器HARM_TEXT_TYPE_NEW数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? string # 值
function GameAPI.set_trigger_list_actor_variable_harm_text_type_new(actor, key, index, value) end

--设置全局触发器HARM_TEXT_TYPE_NEW非数组变量
---@param key string # 变量名称
---@param value? string # 值
function GameAPI.set_trigger_variable_harm_text_type_new(key, value) end

--设置全局触发器HARM_TEXT_TYPE_NEW非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? string # 值
function GameAPI.set_trigger_actor_variable_harm_text_type_new(actor, key, value) end

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

--设置全局触发器FUNC_KEYBOARD_KEY数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.FuncKeyboardKey # 值
function GameAPI.set_trigger_list_variable_func_keyboard_key(key, index, value) end

--设置全局触发器FUNC_KEYBOARD_KEY数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.FuncKeyboardKey # 值
function GameAPI.set_trigger_list_actor_variable_func_keyboard_key(actor, key, index, value) end

--设置全局触发器FUNC_KEYBOARD_KEY非数组变量
---@param key string # 变量名称
---@param value? py.FuncKeyboardKey # 值
function GameAPI.set_trigger_variable_func_keyboard_key(key, value) end

--设置全局触发器FUNC_KEYBOARD_KEY非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.FuncKeyboardKey # 值
function GameAPI.set_trigger_actor_variable_func_keyboard_key(actor, key, value) end

--设置全局触发器MOUSE_KEY数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.MouseKey # 值
function GameAPI.set_trigger_list_variable_mouse_key(key, index, value) end

--设置全局触发器MOUSE_KEY数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.MouseKey # 值
function GameAPI.set_trigger_list_actor_variable_mouse_key(actor, key, index, value) end

--设置全局触发器MOUSE_KEY非数组变量
---@param key string # 变量名称
---@param value? py.MouseKey # 值
function GameAPI.set_trigger_variable_mouse_key(key, value) end

--设置全局触发器MOUSE_KEY非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.MouseKey # 值
function GameAPI.set_trigger_actor_variable_mouse_key(actor, key, value) end

--设置全局触发器MOUSE_WHEEL数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.MouseWheel # 值
function GameAPI.set_trigger_list_variable_mouse_wheel(key, index, value) end

--设置全局触发器MOUSE_WHEEL数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.MouseWheel # 值
function GameAPI.set_trigger_list_actor_variable_mouse_wheel(actor, key, index, value) end

--设置全局触发器MOUSE_WHEEL非数组变量
---@param key string # 变量名称
---@param value? py.MouseWheel # 值
function GameAPI.set_trigger_variable_mouse_wheel(key, value) end

--设置全局触发器MOUSE_WHEEL非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.MouseWheel # 值
function GameAPI.set_trigger_actor_variable_mouse_wheel(actor, key, value) end

--设置全局触发器POST_EFFECT数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.PostEffect # 值
function GameAPI.set_trigger_list_variable_post_effect(key, index, value) end

--设置全局触发器POST_EFFECT数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.PostEffect # 值
function GameAPI.set_trigger_list_actor_variable_post_effect(actor, key, index, value) end

--设置全局触发器POST_EFFECT非数组变量
---@param key string # 变量名称
---@param value? py.PostEffect # 值
function GameAPI.set_trigger_variable_post_effect(key, value) end

--设置全局触发器POST_EFFECT非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.PostEffect # 值
function GameAPI.set_trigger_actor_variable_post_effect(actor, key, value) end

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

--设置全局触发器UNIT_BEHAVIOR数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.UnitBehavior # 值
function GameAPI.set_trigger_list_variable_unit_behavior(key, index, value) end

--设置全局触发器UNIT_BEHAVIOR数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.UnitBehavior # 值
function GameAPI.set_trigger_list_actor_variable_unit_behavior(actor, key, index, value) end

--设置全局触发器UNIT_BEHAVIOR非数组变量
---@param key string # 变量名称
---@param value? py.UnitBehavior # 值
function GameAPI.set_trigger_variable_unit_behavior(key, value) end

--设置全局触发器UNIT_BEHAVIOR非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.UnitBehavior # 值
function GameAPI.set_trigger_actor_variable_unit_behavior(actor, key, value) end

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

--设置UNIT_NAME_POOL数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.UnitKeyPool # 值
function GameAPI.set_unit_name_pool_list_value(l, i, v) end

--生成n个值为v的UNIT_NAME_POOL数组
---@param n integer # 长度
---@param v? py.UnitKeyPool # 值
---@return py.List # 列表
function GameAPI.get_unit_name_pool_n_list(n, v) end

--获取ABILITY_NAME数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.AbilityKey # 值
function GameAPI.get_ability_name_list_value(l, i) end

--设置ABILITY_NAME数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.AbilityKey # 值
function GameAPI.set_ability_name_list_value(l, i, v) end

--生成n个值为v的ABILITY_NAME数组
---@param n integer # 长度
---@param v? py.AbilityKey # 值
---@return py.List # 列表
function GameAPI.get_ability_name_n_list(n, v) end

--获取UNIT_WRITE_ATTRIBUTE数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return string # 值
function GameAPI.get_unit_write_attribute_list_value(l, i) end

--设置UNIT_WRITE_ATTRIBUTE数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v string # 值
function GameAPI.set_unit_write_attribute_list_value(l, i, v) end

--生成n个值为v的UNIT_WRITE_ATTRIBUTE数组
---@param n integer # 长度
---@param v? string # 值
---@return py.List # 列表
function GameAPI.get_unit_write_attribute_n_list(n, v) end

--获取MODIFIER数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.ModifierKey # 值
function GameAPI.get_modifier_list_value(l, i) end

--设置MODIFIER数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.ModifierKey # 值
function GameAPI.set_modifier_list_value(l, i, v) end

--生成n个值为v的MODIFIER数组
---@param n integer # 长度
---@param v? py.ModifierKey # 值
---@return py.List # 列表
function GameAPI.get_modifier_n_list(n, v) end

--获取PROJECTILE数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.ProjectileKey # 值
function GameAPI.get_projectile_list_value(l, i) end

--设置PROJECTILE数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.ProjectileKey # 值
function GameAPI.set_projectile_list_value(l, i, v) end

--生成n个值为v的PROJECTILE数组
---@param n integer # 长度
---@param v? py.ProjectileKey # 值
---@return py.List # 列表
function GameAPI.get_projectile_n_list(n, v) end

--获取DAMAGE_TYPE数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return integer # 值
function GameAPI.get_damage_type_list_value(l, i) end

--设置DAMAGE_TYPE数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v integer # 值
function GameAPI.set_damage_type_list_value(l, i, v) end

--生成n个值为v的DAMAGE_TYPE数组
---@param n integer # 长度
---@param v? integer # 值
---@return py.List # 列表
function GameAPI.get_damage_type_n_list(n, v) end

--获取SFX_KEY数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.SfxKey # 值
function GameAPI.get_sfx_key_list_value(l, i) end

--设置SFX_KEY数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.SfxKey # 值
function GameAPI.set_sfx_key_list_value(l, i, v) end

--生成n个值为v的SFX_KEY数组
---@param n integer # 长度
---@param v? py.SfxKey # 值
---@return py.List # 列表
function GameAPI.get_sfx_key_n_list(n, v) end

--获取UI_COMP数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return string # 值
function GameAPI.get_ui_comp_list_value(l, i) end

--设置UI_COMP数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v string # 值
function GameAPI.set_ui_comp_list_value(l, i, v) end

--生成n个值为v的UI_COMP数组
---@param n integer # 长度
---@param v? string # 值
---@return py.List # 列表
function GameAPI.get_ui_comp_n_list(n, v) end

--获取UI_COMP_TYPE数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return integer # 值
function GameAPI.get_ui_comp_type_list_value(l, i) end

--设置UI_COMP_TYPE数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v integer # 值
function GameAPI.set_ui_comp_type_list_value(l, i, v) end

--生成n个值为v的UI_COMP_TYPE数组
---@param n integer # 长度
---@param v? integer # 值
---@return py.List # 列表
function GameAPI.get_ui_comp_type_n_list(n, v) end

--获取UI_COMP_EVENT_TYPE数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return integer # 值
function GameAPI.get_ui_comp_event_type_list_value(l, i) end

--设置UI_COMP_EVENT_TYPE数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v integer # 值
function GameAPI.set_ui_comp_event_type_list_value(l, i, v) end

--生成n个值为v的UI_COMP_EVENT_TYPE数组
---@param n integer # 长度
---@param v? integer # 值
---@return py.List # 列表
function GameAPI.get_ui_comp_event_type_n_list(n, v) end

--获取CAMERA数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.Camera # 值
function GameAPI.get_camera_list_value(l, i) end

--设置CAMERA数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.Camera # 值
function GameAPI.set_camera_list_value(l, i, v) end

--生成n个值为v的CAMERA数组
---@param n integer # 长度
---@param v? py.Camera # 值
---@return py.List # 列表
function GameAPI.get_camera_n_list(n, v) end

--获取MODIFIER_ENTITY数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.ModifierEntity # 值
function GameAPI.get_modifier_entity_list_value(l, i) end

--设置MODIFIER_ENTITY数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.ModifierEntity # 值
function GameAPI.set_modifier_entity_list_value(l, i, v) end

--生成n个值为v的MODIFIER_ENTITY数组
---@param n integer # 长度
---@param v? py.ModifierEntity # 值
---@return py.List # 列表
function GameAPI.get_modifier_entity_n_list(n, v) end

--获取PROJECTILE_ENTITY数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.ProjectileEntity # 值
function GameAPI.get_projectile_entity_list_value(l, i) end

--设置PROJECTILE_ENTITY数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.ProjectileEntity # 值
function GameAPI.set_projectile_entity_list_value(l, i, v) end

--生成n个值为v的PROJECTILE_ENTITY数组
---@param n integer # 长度
---@param v? py.ProjectileEntity # 值
---@return py.List # 列表
function GameAPI.get_projectile_entity_n_list(n, v) end

--获取AUDIO_KEY数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.AudioKey # 值
function GameAPI.get_audio_key_list_value(l, i) end

--设置AUDIO_KEY数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.AudioKey # 值
function GameAPI.set_audio_key_list_value(l, i, v) end

--生成n个值为v的AUDIO_KEY数组
---@param n integer # 长度
---@param v? py.AudioKey # 值
---@return py.List # 列表
function GameAPI.get_audio_key_n_list(n, v) end

--获取TEXTURE数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.Texture # 值
function GameAPI.get_texture_list_value(l, i) end

--设置TEXTURE数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.Texture # 值
function GameAPI.set_texture_list_value(l, i, v) end

--生成n个值为v的TEXTURE数组
---@param n integer # 长度
---@param v? py.Texture # 值
---@return py.List # 列表
function GameAPI.get_texture_n_list(n, v) end

--获取UNIT_NAME数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.UnitKey # 值
function GameAPI.get_unit_name_list_value(l, i) end

--设置UNIT_NAME数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.UnitKey # 值
function GameAPI.set_unit_name_list_value(l, i, v) end

--生成n个值为v的UNIT_NAME数组
---@param n integer # 长度
---@param v? py.UnitKey # 值
---@return py.List # 列表
function GameAPI.get_unit_name_n_list(n, v) end

--获取MODEL数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.ModelKey # 值
function GameAPI.get_model_list_value(l, i) end

--设置MODEL数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.ModelKey # 值
function GameAPI.set_model_list_value(l, i, v) end

--生成n个值为v的MODEL数组
---@param n integer # 长度
---@param v? py.ModelKey # 值
---@return py.List # 列表
function GameAPI.get_model_n_list(n, v) end

--获取STORE_KEY数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.StoreKey # 值
function GameAPI.get_store_key_list_value(l, i) end

--设置STORE_KEY数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.StoreKey # 值
function GameAPI.set_store_key_list_value(l, i, v) end

--生成n个值为v的STORE_KEY数组
---@param n integer # 长度
---@param v? py.StoreKey # 值
---@return py.List # 列表
function GameAPI.get_store_key_n_list(n, v) end

--获取SFX_ENTITY数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.Sfx # 值
function GameAPI.get_sfx_entity_list_value(l, i) end

--设置SFX_ENTITY数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.Sfx # 值
function GameAPI.set_sfx_entity_list_value(l, i, v) end

--生成n个值为v的SFX_ENTITY数组
---@param n integer # 长度
---@param v? py.Sfx # 值
---@return py.List # 列表
function GameAPI.get_sfx_entity_n_list(n, v) end

--获取ROAD_GROUP数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.RoadGroup # 值
function GameAPI.get_road_group_list_value(l, i) end

--设置ROAD_GROUP数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.RoadGroup # 值
function GameAPI.set_road_group_list_value(l, i, v) end

--生成n个值为v的ROAD_GROUP数组
---@param n integer # 长度
---@param v? py.RoadGroup # 值
---@return py.List # 列表
function GameAPI.get_road_group_n_list(n, v) end

--获取POLYGON数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.PolyArea # 值
function GameAPI.get_polygon_list_value(l, i) end

--设置POLYGON数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.PolyArea # 值
function GameAPI.set_polygon_list_value(l, i, v) end

--生成n个值为v的POLYGON数组
---@param n integer # 长度
---@param v? py.PolyArea # 值
---@return py.List # 列表
function GameAPI.get_polygon_n_list(n, v) end

--获取ITEM_GROUP数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.ItemGroup # 值
function GameAPI.get_item_group_list_value(l, i) end

--设置ITEM_GROUP数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.ItemGroup # 值
function GameAPI.set_item_group_list_value(l, i, v) end

--生成n个值为v的ITEM_GROUP数组
---@param n integer # 长度
---@param v? py.ItemGroup # 值
---@return py.List # 列表
function GameAPI.get_item_group_n_list(n, v) end

--获取TECH_KEY数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.TechKey # 值
function GameAPI.get_tech_key_list_value(l, i) end

--设置TECH_KEY数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.TechKey # 值
function GameAPI.set_tech_key_list_value(l, i, v) end

--生成n个值为v的TECH_KEY数组
---@param n integer # 长度
---@param v? py.TechKey # 值
---@return py.List # 列表
function GameAPI.get_tech_key_n_list(n, v) end

--获取MODIFIER_EFFECT_TYPE数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.ModifierEffectType # 值
function GameAPI.get_modifier_effect_type_list_value(l, i) end

--设置MODIFIER_EFFECT_TYPE数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.ModifierEffectType # 值
function GameAPI.set_modifier_effect_type_list_value(l, i, v) end

--生成n个值为v的MODIFIER_EFFECT_TYPE数组
---@param n integer # 长度
---@param v? py.ModifierEffectType # 值
---@return py.List # 列表
function GameAPI.get_modifier_effect_type_n_list(n, v) end

--获取DYNAMIC_TRIGGER_INSTANCE数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.DynamicTriggerInstance # 值
function GameAPI.get_dynamic_trigger_instance_list_value(l, i) end

--设置DYNAMIC_TRIGGER_INSTANCE数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.DynamicTriggerInstance # 值
function GameAPI.set_dynamic_trigger_instance_list_value(l, i, v) end

--生成n个值为v的DYNAMIC_TRIGGER_INSTANCE数组
---@param n integer # 长度
---@param v? py.DynamicTriggerInstance # 值
---@return py.List # 列表
function GameAPI.get_dynamic_trigger_instance_n_list(n, v) end

--获取ROLE_TYPE数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.RoleType # 值
function GameAPI.get_role_type_list_value(l, i) end

--设置ROLE_TYPE数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.RoleType # 值
function GameAPI.set_role_type_list_value(l, i, v) end

--生成n个值为v的ROLE_TYPE数组
---@param n integer # 长度
---@param v? py.RoleType # 值
---@return py.List # 列表
function GameAPI.get_role_type_n_list(n, v) end

--获取ROLE_STATUS数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.RoleStatus # 值
function GameAPI.get_role_status_list_value(l, i) end

--设置ROLE_STATUS数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.RoleStatus # 值
function GameAPI.set_role_status_list_value(l, i, v) end

--生成n个值为v的ROLE_STATUS数组
---@param n integer # 长度
---@param v? py.RoleStatus # 值
---@return py.List # 列表
function GameAPI.get_role_status_n_list(n, v) end

--获取NEW_TIMER数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.Timer # 值
function GameAPI.get_new_timer_list_value(l, i) end

--设置NEW_TIMER数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.Timer # 值
function GameAPI.set_new_timer_list_value(l, i, v) end

--生成n个值为v的NEW_TIMER数组
---@param n integer # 长度
---@param v? py.Timer # 值
---@return py.List # 列表
function GameAPI.get_new_timer_n_list(n, v) end

--获取ABILITY_TYPE数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return integer # 值
function GameAPI.get_ability_type_list_value(l, i) end

--设置ABILITY_TYPE数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v integer # 值
function GameAPI.set_ability_type_list_value(l, i, v) end

--生成n个值为v的ABILITY_TYPE数组
---@param n integer # 长度
---@param v? integer # 值
---@return py.List # 列表
function GameAPI.get_ability_type_n_list(n, v) end

--获取MODIFIER_TYPE数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.ModifierType # 值
function GameAPI.get_modifier_type_list_value(l, i) end

--设置MODIFIER_TYPE数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.ModifierType # 值
function GameAPI.set_modifier_type_list_value(l, i, v) end

--生成n个值为v的MODIFIER_TYPE数组
---@param n integer # 长度
---@param v? py.ModifierType # 值
---@return py.List # 列表
function GameAPI.get_modifier_type_n_list(n, v) end

--获取LINK_SFX_KEY数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.LinkSfxKey # 值
function GameAPI.get_link_sfx_key_list_value(l, i) end

--设置LINK_SFX_KEY数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.LinkSfxKey # 值
function GameAPI.set_link_sfx_key_list_value(l, i, v) end

--生成n个值为v的LINK_SFX_KEY数组
---@param n integer # 长度
---@param v? py.LinkSfxKey # 值
---@return py.List # 列表
function GameAPI.get_link_sfx_key_n_list(n, v) end

--获取UI_COMP_ALIGN_TYPE数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return integer # 值
function GameAPI.get_ui_comp_align_type_list_value(l, i) end

--设置UI_COMP_ALIGN_TYPE数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v integer # 值
function GameAPI.set_ui_comp_align_type_list_value(l, i, v) end

--生成n个值为v的UI_COMP_ALIGN_TYPE数组
---@param n integer # 长度
---@param v? integer # 值
---@return py.List # 列表
function GameAPI.get_ui_comp_align_type_n_list(n, v) end

--获取UI_DIRECTION数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return integer # 值
function GameAPI.get_ui_direction_list_value(l, i) end

--设置UI_DIRECTION数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v integer # 值
function GameAPI.set_ui_direction_list_value(l, i, v) end

--生成n个值为v的UI_DIRECTION数组
---@param n integer # 长度
---@param v? integer # 值
---@return py.List # 列表
function GameAPI.get_ui_direction_n_list(n, v) end

--获取RANDOM_POOL数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.RandomPool # 值
function GameAPI.get_random_pool_list_value(l, i) end

--设置RANDOM_POOL数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.RandomPool # 值
function GameAPI.set_random_pool_list_value(l, i, v) end

--生成n个值为v的RANDOM_POOL数组
---@param n integer # 长度
---@param v? py.RandomPool # 值
---@return py.List # 列表
function GameAPI.get_random_pool_n_list(n, v) end

--获取LINK_SFX_ENTITY数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.LinkSfx # 值
function GameAPI.get_link_sfx_entity_list_value(l, i) end

--设置LINK_SFX_ENTITY数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.LinkSfx # 值
function GameAPI.set_link_sfx_entity_list_value(l, i, v) end

--生成n个值为v的LINK_SFX_ENTITY数组
---@param n integer # 长度
---@param v? py.LinkSfx # 值
---@return py.List # 列表
function GameAPI.get_link_sfx_entity_n_list(n, v) end

--获取PROJECTILE_GROUP数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.ProjectileGroup # 值
function GameAPI.get_projectile_group_list_value(l, i) end

--设置PROJECTILE_GROUP数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.ProjectileGroup # 值
function GameAPI.set_projectile_group_list_value(l, i, v) end

--生成n个值为v的PROJECTILE_GROUP数组
---@param n integer # 长度
---@param v? py.ProjectileGroup # 值
---@return py.List # 列表
function GameAPI.get_projectile_group_n_list(n, v) end

--获取DESTRUCTIBLE_ENTITY数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.Destructible # 值
function GameAPI.get_destructible_entity_list_value(l, i) end

--设置DESTRUCTIBLE_ENTITY数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.Destructible # 值
function GameAPI.set_destructible_entity_list_value(l, i, v) end

--生成n个值为v的DESTRUCTIBLE_ENTITY数组
---@param n integer # 长度
---@param v? py.Destructible # 值
---@return py.List # 列表
function GameAPI.get_destructible_entity_n_list(n, v) end

--获取DESTRUCTIBLE_NAME数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.DestructibleKey # 值
function GameAPI.get_destructible_name_list_value(l, i) end

--设置DESTRUCTIBLE_NAME数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.DestructibleKey # 值
function GameAPI.set_destructible_name_list_value(l, i, v) end

--生成n个值为v的DESTRUCTIBLE_NAME数组
---@param n integer # 长度
---@param v? py.DestructibleKey # 值
---@return py.List # 列表
function GameAPI.get_destructible_name_n_list(n, v) end

--获取SOUND_ENTITY数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.SoundEntity # 值
function GameAPI.get_sound_entity_list_value(l, i) end

--设置SOUND_ENTITY数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.SoundEntity # 值
function GameAPI.set_sound_entity_list_value(l, i, v) end

--生成n个值为v的SOUND_ENTITY数组
---@param n integer # 长度
---@param v? py.SoundEntity # 值
---@return py.List # 列表
function GameAPI.get_sound_entity_n_list(n, v) end

--获取ABILITY_CAST_TYPE数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return integer # 值
function GameAPI.get_ability_cast_type_list_value(l, i) end

--设置ABILITY_CAST_TYPE数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v integer # 值
function GameAPI.set_ability_cast_type_list_value(l, i, v) end

--生成n个值为v的ABILITY_CAST_TYPE数组
---@param n integer # 长度
---@param v? integer # 值
---@return py.List # 列表
function GameAPI.get_ability_cast_type_n_list(n, v) end

--获取CURVED_PATH数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.CurvedPath # 值
function GameAPI.get_curved_path_list_value(l, i) end

--设置CURVED_PATH数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.CurvedPath # 值
function GameAPI.set_curved_path_list_value(l, i, v) end

--生成n个值为v的CURVED_PATH数组
---@param n integer # 长度
---@param v? py.CurvedPath # 值
---@return py.List # 列表
function GameAPI.get_curved_path_n_list(n, v) end

--获取IMAGE_KEY数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return integer # 值
function GameAPI.get_image_key_list_value(l, i) end

--设置IMAGE_KEY数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v integer # 值
function GameAPI.set_image_key_list_value(l, i, v) end

--生成n个值为v的IMAGE_KEY数组
---@param n integer # 长度
---@param v? integer # 值
---@return py.List # 列表
function GameAPI.get_image_key_n_list(n, v) end

--获取ANGLE数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.Fixed # 值
function GameAPI.get_angle_list_value(l, i) end

--设置ANGLE数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.Fixed # 值
function GameAPI.set_angle_list_value(l, i, v) end

--生成n个值为v的ANGLE数组
---@param n integer # 长度
---@param v? py.Fixed # 值
---@return py.List # 列表
function GameAPI.get_angle_n_list(n, v) end

--获取SCENE_UI数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.SceneNode # 值
function GameAPI.get_scene_ui_list_value(l, i) end

--设置SCENE_UI数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.SceneNode # 值
function GameAPI.set_scene_ui_list_value(l, i, v) end

--生成n个值为v的SCENE_UI数组
---@param n integer # 长度
---@param v? py.SceneNode # 值
---@return py.List # 列表
function GameAPI.get_scene_ui_n_list(n, v) end

--获取UI_ANIM数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.UIAnimKey # 值
function GameAPI.get_ui_anim_list_value(l, i) end

--设置UI_ANIM数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.UIAnimKey # 值
function GameAPI.set_ui_anim_list_value(l, i, v) end

--生成n个值为v的UI_ANIM数组
---@param n integer # 长度
---@param v? py.UIAnimKey # 值
---@return py.List # 列表
function GameAPI.get_ui_anim_n_list(n, v) end

--获取UNIT_BEHAVIOR数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.UnitBehavior # 值
function GameAPI.get_unit_behavior_list_value(l, i) end

--设置UNIT_BEHAVIOR数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.UnitBehavior # 值
function GameAPI.set_unit_behavior_list_value(l, i, v) end

--生成n个值为v的UNIT_BEHAVIOR数组
---@param n integer # 长度
---@param v? py.UnitBehavior # 值
---@return py.List # 列表
function GameAPI.get_unit_behavior_n_list(n, v) end

--获取CAMLINE数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.CamlineID # 值
function GameAPI.get_camline_list_value(l, i) end

--设置CAMLINE数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.CamlineID # 值
function GameAPI.set_camline_list_value(l, i, v) end

--生成n个值为v的CAMLINE数组
---@param n integer # 长度
---@param v? py.CamlineID # 值
---@return py.List # 列表
function GameAPI.get_camline_n_list(n, v) end

--获取HARM_TEXT_TYPE_NEW数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return string # 值
function GameAPI.get_harm_text_type_new_list_value(l, i) end

--设置HARM_TEXT_TYPE_NEW数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v string # 值
function GameAPI.set_harm_text_type_new_list_value(l, i, v) end

--生成n个值为v的HARM_TEXT_TYPE_NEW数组
---@param n integer # 长度
---@param v? string # 值
---@return py.List # 列表
function GameAPI.get_harm_text_type_new_n_list(n, v) end

--获取SCENE_SOUND数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.SceneSound # 值
function GameAPI.get_scene_sound_list_value(l, i) end

--设置SCENE_SOUND数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.SceneSound # 值
function GameAPI.set_scene_sound_list_value(l, i, v) end

--生成n个值为v的SCENE_SOUND数组
---@param n integer # 长度
---@param v? py.SceneSound # 值
---@return py.List # 列表
function GameAPI.get_scene_sound_n_list(n, v) end

--获取MOVER_ENTITY数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.Mover # 值
function GameAPI.get_mover_entity_list_value(l, i) end

--设置MOVER_ENTITY数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.Mover # 值
function GameAPI.set_mover_entity_list_value(l, i, v) end

--生成n个值为v的MOVER_ENTITY数组
---@param n integer # 长度
---@param v? py.Mover # 值
---@return py.List # 列表
function GameAPI.get_mover_entity_n_list(n, v) end

--获取PROJECTILE_3D数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.ProjectileKey # 值
function GameAPI.get_projectile_3d_list_value(l, i) end

--设置PROJECTILE_3D数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.ProjectileKey # 值
function GameAPI.set_projectile_3d_list_value(l, i, v) end

--生成n个值为v的PROJECTILE_3D数组
---@param n integer # 长度
---@param v? py.ProjectileKey # 值
---@return py.List # 列表
function GameAPI.get_projectile_3d_n_list(n, v) end

--获取CURSOR_KEY数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.CursorKey # 值
function GameAPI.get_cursor_key_list_value(l, i) end

--设置CURSOR_KEY数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.CursorKey # 值
function GameAPI.set_cursor_key_list_value(l, i, v) end

--生成n个值为v的CURSOR_KEY数组
---@param n integer # 长度
---@param v? py.CursorKey # 值
---@return py.List # 列表
function GameAPI.get_cursor_key_n_list(n, v) end

--获取VECTOR3数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.FVector3 # 值
function GameAPI.get_vector3_list_value(l, i) end

--设置VECTOR3数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.FVector3 # 值
function GameAPI.set_vector3_list_value(l, i, v) end

--生成n个值为v的VECTOR3数组
---@param n integer # 长度
---@param v? py.FVector3 # 值
---@return py.List # 列表
function GameAPI.get_vector3_n_list(n, v) end

--获取SEQUENCE数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.Sequence # 值
function GameAPI.get_sequence_list_value(l, i) end

--设置SEQUENCE数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.Sequence # 值
function GameAPI.set_sequence_list_value(l, i, v) end

--生成n个值为v的SEQUENCE数组
---@param n integer # 长度
---@param v? py.Sequence # 值
---@return py.List # 列表
function GameAPI.get_sequence_n_list(n, v) end

--获取PHYSICS_OBJECT数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.PhysicsObject # 值
function GameAPI.get_physics_object_list_value(l, i) end

--设置PHYSICS_OBJECT数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.PhysicsObject # 值
function GameAPI.set_physics_object_list_value(l, i, v) end

--生成n个值为v的PHYSICS_OBJECT数组
---@param n integer # 长度
---@param v? py.PhysicsObject # 值
---@return py.List # 列表
function GameAPI.get_physics_object_n_list(n, v) end

--获取PHYSICS_ENTITY数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.PhysicsEntity # 值
function GameAPI.get_physics_entity_list_value(l, i) end

--设置PHYSICS_ENTITY数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.PhysicsEntity # 值
function GameAPI.set_physics_entity_list_value(l, i, v) end

--生成n个值为v的PHYSICS_ENTITY数组
---@param n integer # 长度
---@param v? py.PhysicsEntity # 值
---@return py.List # 列表
function GameAPI.get_physics_entity_n_list(n, v) end

--获取RIGID_BODY数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.RigidBody # 值
function GameAPI.get_rigid_body_list_value(l, i) end

--设置RIGID_BODY数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.RigidBody # 值
function GameAPI.set_rigid_body_list_value(l, i, v) end

--生成n个值为v的RIGID_BODY数组
---@param n integer # 长度
---@param v? py.RigidBody # 值
---@return py.List # 列表
function GameAPI.get_rigid_body_n_list(n, v) end

--获取COLLIDER数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.Collider # 值
function GameAPI.get_collider_list_value(l, i) end

--设置COLLIDER数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.Collider # 值
function GameAPI.set_collider_list_value(l, i, v) end

--生成n个值为v的COLLIDER数组
---@param n integer # 长度
---@param v? py.Collider # 值
---@return py.List # 列表
function GameAPI.get_collider_n_list(n, v) end

--获取ATTR_ELEMENT数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return string # 值
function GameAPI.get_attr_element_list_value(l, i) end

--设置ATTR_ELEMENT数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v string # 值
function GameAPI.set_attr_element_list_value(l, i, v) end

--生成n个值为v的ATTR_ELEMENT数组
---@param n integer # 长度
---@param v? string # 值
---@return py.List # 列表
function GameAPI.get_attr_element_n_list(n, v) end

--获取ATTR_ELEMENT_READ数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return string # 值
function GameAPI.get_attr_element_read_list_value(l, i) end

--设置ATTR_ELEMENT_READ数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v string # 值
function GameAPI.set_attr_element_read_list_value(l, i, v) end

--生成n个值为v的ATTR_ELEMENT_READ数组
---@param n integer # 长度
---@param v? string # 值
---@return py.List # 列表
function GameAPI.get_attr_element_read_n_list(n, v) end

--获取JOINT数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.Joint # 值
function GameAPI.get_joint_list_value(l, i) end

--设置JOINT数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.Joint # 值
function GameAPI.set_joint_list_value(l, i, v) end

--生成n个值为v的JOINT数组
---@param n integer # 长度
---@param v? py.Joint # 值
---@return py.List # 列表
function GameAPI.get_joint_n_list(n, v) end

--获取PHYSICS_OBJECT_KEY数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.PhysicsObjectKey # 值
function GameAPI.get_physics_object_key_list_value(l, i) end

--设置PHYSICS_OBJECT_KEY数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.PhysicsObjectKey # 值
function GameAPI.set_physics_object_key_list_value(l, i, v) end

--生成n个值为v的PHYSICS_OBJECT_KEY数组
---@param n integer # 长度
---@param v? py.PhysicsObjectKey # 值
---@return py.List # 列表
function GameAPI.get_physics_object_key_n_list(n, v) end

--获取PHYSICS_ENTITY_KEY数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.PhysicsEntityKey # 值
function GameAPI.get_physics_entity_key_list_value(l, i) end

--设置PHYSICS_ENTITY_KEY数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.PhysicsEntityKey # 值
function GameAPI.set_physics_entity_key_list_value(l, i, v) end

--生成n个值为v的PHYSICS_ENTITY_KEY数组
---@param n integer # 长度
---@param v? py.PhysicsEntityKey # 值
---@return py.List # 列表
function GameAPI.get_physics_entity_key_n_list(n, v) end

--获取ROTATION数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.FRotation # 值
function GameAPI.get_rotation_list_value(l, i) end

--设置ROTATION数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.FRotation # 值
function GameAPI.set_rotation_list_value(l, i, v) end

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

--创建物理运动器
---@param body py.RigidBody # 刚体
---@param direction py.Vector3 # 方向
---@param init_speed py.Fixed # 初速度
---@param acceleration py.Fixed # 加速度
---@param max_speed py.Fixed # 最大速度
---@param max_distance py.Fixed # 最大移动距离
---@param max_life_time py.Fixed # 最大持续时间
function GameAPI.create_physics_mover_3d(body, direction, init_speed, acceleration, max_speed, max_distance, max_life_time) end

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
---@param order boolean # order
function GameAPI.sort_table_by(table, key, order) end

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
---@param time_delay number # 延迟时间
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

--设置组件开启状态
---@param entity py.PhysicsEntity # 物理组件
---@param is_active boolean # 开启状态
function GameAPI.api_set_entity_active(entity, is_active) end

--返回组件中指定名字的刚体
---@param entity py.PhysicsEntity # 物理组件
---@param name string # 刚体名字
---@return py.RigidBody # 刚体
function GameAPI.api_get_rigidbody_by_name(entity, name) end

--逻辑物理组件是否存在
---@param entity? py.PhysicsEntity # 逻辑物理组件
---@return boolean # 布尔值
function GameAPI.api_physics_entity_is_exist(entity) end

--组件中指定刚体的模型播放动画
---@param entity py.PhysicsEntity # 物理组件
---@param rigid py.RigidBody # 刚体
---@param anim_name string # 动画名称
---@param loop boolean # 是否循环
function GameAPI.api_physics_play_animation(entity, rigid, anim_name, loop) end

--获得范围内指定类型的组件
---@param position py.FVector3 # 位置
---@param radius py.Fixed # 半径
---@return py.UnitGroup # 单位组
function GameAPI.api_get_physics_entity_in_range(position, radius) end

--组件创建特效
---@param entity py.PhysicsEntity # 物理组件
---@param sfx_id py.Fixed # 特效ID
---@param position py.FVector3 # 位置
---@param duration? py.Fixed # 持续时间
function GameAPI.api_physics_create_sfx(entity, sfx_id, position, duration) end

--返回刚体中指定名字的碰撞器
---@param rigid py.RigidBody # 刚体
---@param name string # 碰撞器名字
---@return py.Collider # 碰撞器
function GameAPI.api_get_collider_by_name(rigid, name) end

--设置爆炸器属性
---@param exploder py.PhysicsEntity # 爆炸器组件
---@param damage py.Fixed # 爆炸伤害
---@param radius py.Fixed # 爆炸半径
function GameAPI.api_set_exploder_attribute(exploder, damage, radius) end

--引爆爆炸器
---@param exploder py.PhysicsEntity # 爆炸器组件
---@param position py.FVector3 # 位置
---@param delay? py.Fixed # 延时
---@param sfx? py.Fixed # 特效
---@param sfx_duration? py.Fixed # 特效持续时间
function GameAPI.api_explode(exploder, position, delay, sfx, sfx_duration) end

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

--获取刚体上的Collider
---@param body py.RigidBody # 刚体
---@param name string # 名称
---@return py.Collider # Collider
function GameAPI.api_get_rigid_body_collider(body, name) end

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
---@param unit py.Unit # 主控角色
---@param cc_action py.CcActionID # 预定义行为ID
---@param cc_hand? py.CcHandID # 左手/右手
function GameAPI.cc_do_predefined_action(unit, cc_action, cc_hand) end

--判断单位上半身行动受限
---@param unit py.Unit # 单位
---@return boolean # 是否受限
function GameAPI.is_upper_body_limited(unit) end

--投掷技能
---@param source py.Unit # 施法单位
function GameAPI.api_physics_throw(source) end

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

--设置击倒值
---@param unit py.Unit # 单位
---@param down_value py.Fixed # 击倒值
function GameAPI.api_set_entity_down_value(unit, down_value) end

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

--设置刚体速度
---@param body py.RigidBody # 刚体
---@param speed py.Fixed # 速度大小
---@param direction py.FVector3 # 速度方向
function GameAPI.api_set_rigidbody_velocity(body, speed, direction) end

--获得刚体朝向
---@param rigid py.RigidBody # 刚体
---@return py.FVector3 # 朝向
function GameAPI.api_get_rigidbody_forward(rigid) end

--获得范围内的刚体组
---@param position py.FVector3 # 位置
---@param radius py.Fixed # 半径
---@return py.RigidBodyGroup # 刚体组
function GameAPI.api_get_rigid_body_group_in_range(position, radius) end

--替换刚体模型
---@param rigid py.RigidBody # 刚体
---@param id py.Fixed # 模型id
function GameAPI.api_replace_rigid_body_model(rigid, id) end

--还原刚体上一个模型
---@param rigid py.RigidBody # 刚体
function GameAPI.api_restore_rigid_body_last_model(rigid) end

--删除REACTION
---@param reaction py.Reaction # Reaction
function GameAPI.api_delete_reaction(reaction) end

--删除REACTION Group
---@param reactions py.ReactionGroup # ReactionGroup
function GameAPI.api_delete_reaction_group(reactions) end

--物理物品抛出
---@param physics_item py.Unit # 物品单位
---@param length py.Fixed # 抛出距离
---@param height py.Fixed # 最大高度
function GameAPI.throw_physics_item(physics_item, length, height) end

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

--向ui发送附带dict的事件
---@param s string # 事件名称
---@param args py.Dict # 参数
function GameAPI.send_ui_global_event_with_info_dict(s, args) end

--添加单位到单位组
---@param unit py.Unit # 单位
---@param unit_group py.UnitGroup # 单位组
function GameAPI.add_unit_to_group(unit, unit_group) end

--批量设置全局触发器数组变量
---@param table py.List # 组合列表，格式为[[数组变量名称，类型（'INTEGER', 'BOOLEAN', 'FLOAT', 'STRING'），列表值（[值，值，......]）],[.....]]
function GameAPI.set_trigger_table_list_variable(table) end

--通过分割字符串设置字符串数组
---@param key py.List # 字符串数组
---@param actor py.Actor # 类型提示
---@param content string # 分割内容
---@param split string # 分割符
function GameAPI.set_trigger_str_list_by_split(key, actor, content, split) end

--创建全局触发器数组变量
---@param key string # 数组变量名称
---@param var_type string # 值类型
---@param arr_val py.List # 列表型值
function GameAPI.create_trigger_list_variable(key, var_type, arr_val) end

--单位编号是否拥有tag
---@param key py.UnitKey # 单位编号
---@param tag string # tag
---@return boolean # 布尔值
function GameAPI.unit_key_has_tag(key, tag) end

--物品编号是否拥有tag
---@param key py.ItemKey # 物品编号
---@param tag string # tag
---@return boolean # 布尔值
function GameAPI.item_key_has_tag(key, tag) end

--技能编号是否拥有tag
---@param key py.AbilityKey # 技能编号
---@param tag string # tag
---@return boolean # 布尔值
function GameAPI.ability_key_has_tag(key, tag) end

--效果编号是否拥有tag
---@param key py.AbilityKey # 技能编号
---@param tag string # tag
---@return boolean # 布尔值
function GameAPI.modifier_key_has_tag(key, tag) end

--投射物编号是否拥有tag
---@param key py.AbilityKey # 投射物编号
---@param tag string # tag
---@return boolean # 布尔值
function GameAPI.projectile_key_has_tag(key, tag) end

--可破坏物编号是否拥有tag
---@param key py.DestructibleKey # 可破坏物编号
---@param tag string # tag
---@return boolean # 布尔值
function GameAPI.dest_key_has_tag(key, tag) end

--单位实体是否存在
---@param unit? py.Unit # 单位实体
---@return boolean # 布尔值
function GameAPI.unit_is_exist(unit) end

--效果实体是否存在
---@param modifier? py.ModifierEntity # 效果实体
---@return boolean # 布尔值
function GameAPI.modifier_is_exist(modifier) end

--投射物实体是否存在
---@param projectile? py.ProjectileEntity # 投射物
---@return boolean # 布尔值
function GameAPI.projectile_is_exist(projectile) end

--技能实体是否存在
---@param ability? py.Ability # 技能
---@return boolean # 布尔值
function GameAPI.ability_is_exist(ability) end

--可破坏物是否存在
---@param destructible? py.Destructible # 可破坏物
---@return boolean # 布尔值
function GameAPI.destructible_is_exist(destructible) end

--图片是否存在
---@param item? py.Item # 图片key
---@return boolean # 布尔值
function GameAPI.item_is_exist(item) end

--单位组是否存在
---@param unit_group py.UnitGroup # 单位组
---@return boolean # 是否存在
function GameAPI.unit_group_is_exist(unit_group) end

--玩家组是否存在
---@param role_group py.RoleGroup # 玩家组
---@return boolean # 是否存在
function GameAPI.role_group_is_exist(role_group) end

--特效是否存在
---@param sfx py.Sfx # 特效
---@return boolean # 是否存在
function GameAPI.sfx_is_exist(sfx) end

--点是否存在
---@param point py.Point # 点
---@return boolean # 是否存在
function GameAPI.point_is_exist(point) end

--路径是否存在
---@param point_list py.Road # 路径
---@return boolean # 是否存在
function GameAPI.point_list_is_exist(point_list) end

--圆形区域是否存在
---@param circle_area py.CirArea # 圆形区域
---@return boolean # 是否存在
function GameAPI.circle_area_is_exist(circle_area) end

--矩形区域是否存在
---@param rect_area py.RecArea # 矩形区域
---@return boolean # 是否存在
function GameAPI.rect_area_is_exist(rect_area) end

--镜头是否存在
---@param camera py.Camera # 镜头
---@return boolean # 是否存在
function GameAPI.camera_is_exist(camera) end

--界面组件是否存在
---@param ui_comp string # 界面组件名称
---@return boolean # 是否存在
function GameAPI.ui_comp_is_exist(ui_comp) end

--获取技能最大等级
---@param ability py.Ability # 技能
---@return integer # 最大等级
function GameAPI.get_ability_max_level(ability) end

--列表中返回随机整数个元素组成的列表
---@param list1 py.List # 列表
---@param n integer # 整数个
---@return py.List # 随机生成的列表
function GameAPI.random_list_from_list(list1, n) end

--震动设备
---@param role py.Role # 玩家
---@param time py.Fixed # 震动时间
function GameAPI.shake_phone(role, time) end

--为<玩家>输入排行榜<分数>
---@param role py.Role # 玩家
---@param score integer # 战斗内排行榜分数
function GameAPI.set_role_rank_score(role, score) end

--单位触发器向全局触发器发送事件, 附带信息
---@param event_name string # 事件名称
---@param i integer # 整型值
---@param f py.Fixed # 定点型值
---@param b boolean # 布尔型值
---@param s string # 字符串型值
---@param p py.Point # 浮点数点型值
---@param u? py.Unit # 单位对象
function GameAPI.unit_send_global_event_with_info(event_name, i, f, b, s, p, u) end

--技能触发器向全局触发器发送事件, 附带信息
---@param event_name string # 事件名称
---@param i integer # 整型值
---@param f py.Fixed # 定点型值
---@param b boolean # 布尔型值
---@param s string # 字符串型值
---@param p py.Point # 浮点数点型值
---@param u? py.Unit # 单位对象
function GameAPI.ability_send_global_event_with_info(event_name, i, f, b, s, p, u) end

--效果触发器向全局触发器发送事件, 附带信息
---@param event_name string # 事件名称
---@param i integer # 整型值
---@param f py.Fixed # 定点型值
---@param b boolean # 布尔型值
---@param s string # 字符串型值
---@param p py.Point # 浮点数点型值
---@param u? py.Unit # 单位对象
function GameAPI.modifier_send_global_event_with_info(event_name, i, f, b, s, p, u) end

--投射物触发器向全局触发器发送事件, 附带信息
---@param event_name string # 事件名称
---@param i integer # 整型值
---@param f py.Fixed # 定点型值
---@param b boolean # 布尔型值
---@param s string # 字符串型值
---@param p py.Point # 浮点数点型值
---@param u? py.Unit # 单位对象
function GameAPI.projectile_send_global_event_with_info(event_name, i, f, b, s, p, u) end

--物品触发器向全局触发器发送事件, 附带信息
---@param event_name string # 事件名称
---@param i integer # 整型值
---@param f py.Fixed # 定点型值
---@param b boolean # 布尔型值
---@param s string # 字符串型值
---@param p py.Point # 浮点数点型值
---@param u? py.Unit # 单位对象
function GameAPI.item_send_global_event_with_info(event_name, i, f, b, s, p, u) end

--获取[玩家]的玩家昵称
---@param role py.Role # 玩家
---@return string # 玩家昵称
function GameAPI.get_player_nick_name(role) end

--获取[玩家]的玩家全量昵称
---@param role py.Role # 玩家
---@return string # 玩家全量昵称
function GameAPI.get_player_full_nick_name(role) end

--获取[玩家]的玩家aid
---@param role py.Role # 玩家
---@return string # 玩家aid
function GameAPI.get_player_plat_aid(role) end

--获取[玩家]的玩家图像
---@param role py.Role # 玩家
---@return string # 玩家图像
function GameAPI.get_player_icon(role) end

--筛选单位删除状态
---@param unit? py.Unit # 单位
---@return py.Unit # 有效单位对象
function GameAPI.filter_unit_status(unit) end

--为玩家打开收费道具商店
---@param role py.Role # 玩家
function GameAPI.open_charge_item_store_for_role(role) end

--当前游戏运行时间
---@return py.Fixed # 时间
function GameAPI.get_cur_game_time() end

--检查点到点是否联通
---@param unit py.Unit # 寻路单位
---@param pointa py.Point # 起点
---@param pointb py.Point # 终点
---@return boolean # 是否联通
function GameAPI.can_point_reach_point(unit, pointa, pointb) end

--检测点是否和单位碰撞
---@param unit py.Unit # 单位
---@param point py.Point # 点
---@param radius number # 范围
---@return boolean # 是否碰撞
function GameAPI.unit_can_collide_with_point(unit, point, radius) end

--通过技能序列号获取技能
---@param unit py.Unit # 单位
---@param ability_seq py.AbilitySeq # 技能序列号
---@return py.Ability # 技能对象
function GameAPI.api_get_ability_by_seq(unit, ability_seq) end

--通过单位编号+技能序列号获取技能
---@param unit_id py.UnitID # 单位ID
---@param ability_seq py.AbilitySeq # 技能序列号
---@return py.Ability # 技能对象
function GameAPI.api_get_ability_by_unit_and_seq(unit_id, ability_seq) end

--获取【单位组】中伤害排名【整数】的单位实体
---@param unit_group py.UnitGroup # 单位组
---@param rank integer # 排名
---@return py.Unit # 单位
function GameAPI.get_damage_statistic_rank_unit(unit_group, rank) end

--获取选择圈缩放
---@param unit py.Unit # 单位
---@return py.Fixed # 缩放
function GameAPI.get_select_circle_scale(unit) end

--删除模型
---@param model py.Model # 模型
function GameAPI.delete_model_entity(model) end

--创建展示模型，面向点，朝向实数
---@param model_res_id py.ModelKey # 模型名称
---@param position py.Point # 点
---@param rotation number # 朝向
---@return py.Model # 模型
function GameAPI.create_model_on_point(model_res_id, position, rotation) end

--创建模型
---@param model_key py.ModelKey # 模型编号
---@param pos py.FPoint # 点
---@param face py.Fixed # 朝向
---@return py.Model # 模型
function GameAPI.create_model_in_scene(model_key, pos, face) end

--销毁模型
---@param model? py.Model # 模型
function GameAPI.destroy_model_in_scene(model) end

--返回指定物品名字的字符串属性值
---@param key py.ItemKey # 物品编号
---@param name string # 属性名
---@return string # 字符
function GameAPI.get_item_key_str_attr(key, name) end

--强制踢出玩家
---@param role py.Role # 玩家
---@param reason string # 踢出理由
function GameAPI.role_force_quit(role, reason) end

--修改某点的地形纹理
---@param position py.Point # 指定点
---@param texture_type integer # 纹理类型
---@param radius integer # 范围
---@param area_shape integer # 区域类型
function GameAPI.modify_point_texture(position, texture_type, radius, area_shape) end

--修改某点的地形高度
---@param position py.Point # 指定点
---@param terrain_height integer # 高度
---@param radius integer # 范围
---@param area_shape integer # 区域类型
function GameAPI.modify_point_height(position, terrain_height, radius, area_shape) end

--替换区域中的指定地形纹理
---@param area py.Area # 区域
---@param texture_type integer # 纹理类型
---@param new_texture_type integer # 新纹理类型
function GameAPI.replace_point_texture(area, texture_type, new_texture_type) end

--获取纹理类型
---@param position py.Point # 点
---@return integer # 纹理类型
function GameAPI.get_texture_type(position) end

--设置矩形区域内视野情况
---@param rect_area py.RecArea # 矩形区域
---@param player py.Role # 玩家
---@param is_vision boolean # 布尔变量
---@param is_vision_true boolean # 布尔变量
---@return py.RecArea # 矩形区域
function GameAPI.set_rect_vision_visibility(rect_area, player, is_vision, is_vision_true) end

--设置圆形区域内视野情况
---@param circle_area py.CirArea # 圆形区域
---@param player py.Role # 玩家
---@param is_vision boolean # 布尔变量
---@param is_vision_true boolean # 布尔变量
---@return py.CirArea # 圆形区域
function GameAPI.set_circle_vision_visibility(circle_area, player, is_vision, is_vision_true) end

--设置多边形区域内视野情况
---@param poly_area py.PolyArea # 多边形区域
---@param player py.Role # 玩家
---@param is_vision boolean # 布尔变量
---@param is_vision_true boolean # 布尔变量
---@return py.PolyArea # 多边形区域
function GameAPI.set_poly_vision_visibility(poly_area, player, is_vision, is_vision_true) end

--创建随机池
---@return py.RandomPool # 随机池
function GameAPI.create_random_pool() end

--设置随机池指定整数权重
---@param random_pool py.RandomPool # 随机池
---@param value integer # 整型
---@param weight integer # 整型
function GameAPI.set_random_pool_value(random_pool, value, weight) end

--随机池增加指定整数权重
---@param random_pool py.RandomPool # 随机池
---@param value integer # 整型
---@param increment integer # 整型
function GameAPI.increase_random_pool_value(random_pool, value, increment) end

--随机池移除指定整数
---@param random_pool py.RandomPool # 随机池
---@param value integer # 整型
function GameAPI.remove_random_pool_value(random_pool, value) end

--从随机池中获取一个随机整数
---@param random_pool py.RandomPool # 随机池
---@param remain? boolean # 布尔
---@return integer # 整数
function GameAPI.get_bitrary_random_pool_value(random_pool, remain) end

--获取随机池中指定整数的权重概率
---@param random_pool py.RandomPool # 随机池
---@param value integer # 整数
---@return number # 权重概率
function GameAPI.get_random_pool_probability(random_pool, value) end

--获取随机池中指定整数的权重概率
---@param random_pool py.RandomPool # 随机池
---@return integer # 总权重
function GameAPI.get_random_pool_all_weight(random_pool) end

--获取随机池中的整数数量
---@param random_pool py.RandomPool # 随机池
---@return integer # 整数数量
function GameAPI.get_random_pool_size(random_pool) end

--复制随机池
---@param random_pool py.RandomPool # 随机池
---@return py.RandomPool # 随机池
function GameAPI.copy_random_pool(random_pool) end

--成长属性
---@param entity_no py.UnitKey # 单位编号
---@param attr string # 属性名
---@return py.Fixed # 属性值
function GameAPI.api_get_attr_growth(entity_no, attr) end

--设置成长属性
---@param entity_no py.UnitKey # 单位编号
---@param attr string # 属性名
---@param value py.Fixed # 属性值
function GameAPI.api_set_attr_growth(entity_no, attr, value) end

--获取某个随机池的列表
---@param random_pool py.RandomPool # 随机池
---@return integer # 整数
function GameAPI.get_all_random_pool_value(random_pool) end

--获取某个随机池中指定整数的权重
---@param random_pool py.RandomPool # 随机池
---@param value integer # 整数
---@return integer # 整数
function GameAPI.get_random_pool_pointed_weight(random_pool, value) end

--翻译字符串
---@param string string # 字符串
function GameAPI.get_text_config(string) end

--发送触发器自定义事件
---@param event_name string # 自定义事件名称
---@param p1 integer # 参数1
---@param p2 integer # 参数2
---@param p3 integer # 参数3
---@param p4 integer # 参数4
---@param p5 integer # 参数5
function GameAPI.send_custom_event(event_name, p1, p2, p3, p4, p5) end

--显示ui组件并播放动画
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param anim_name? string # 动画名
function GameAPI.show_ui_comp_animation(role, comp_name, anim_name) end

--隐藏ui组件并播放动画
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param anim_name? string # 动画名
function GameAPI.hide_ui_comp_animation(role, comp_name, anim_name) end

--设置ui组件坐标
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param x number # x
---@param y number # y
function GameAPI.set_ui_comp_pos(role, comp_name, x, y) end

--设置ui组件坐标没有转化
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param x number # x
---@param y number # y
function GameAPI.set_ui_comp_pos_no_trans(role, comp_name, x, y) end

--设置ui组件缩放
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param width number # width
---@param height number # height
function GameAPI.set_ui_comp_scale(role, comp_name, width, height) end

--设置ui组件尺寸
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param width number # width
---@param height number # height
function GameAPI.set_ui_comp_size(role, comp_name, width, height) end

--设置ui组件深度
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param z_order integer # z_order
function GameAPI.set_ui_comp_z_order(role, comp_name, z_order) end

--设置ui组件图片
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param image_id integer # 图片id
function GameAPI.set_ui_comp_image(role, comp_name, image_id) end

--设置ui列表组件间距
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param margin integer # 间距
function GameAPI.set_ui_comp_margin(role, comp_name, margin) end

--设置ui组件图片(图片类型)
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param image_id py.Texture # 图片
function GameAPI.set_ui_comp_image_with_icon(role, comp_name, image_id) end

--设置ui组件序列帧
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param image_id py.Sequence # 图片
function GameAPI.set_ui_comp_sequence(role, comp_name, image_id) end

--播放序列帧
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param loop? py.Sequence # 图片
---@param space? boolean # 循环
---@param start_frame? number # 间隔
---@param end_frame? integer # 开始帧
function GameAPI.play_ui_comp_sequence(role, comp_name, loop, space, start_frame, end_frame) end

--停止播放序列帧
---@param role py.Role # 玩家
---@param comp_name string # 控件名
function GameAPI.stop_ui_comp_sequence(role, comp_name) end

--设置小地图替代图片
---@param role py.Role # 玩家
---@param image_id integer # 图片id
function GameAPI.change_mini_map_img(role, image_id) end

--设置小地图替代图片(图片类型)
---@param role py.Role # 玩家
---@param image_id py.Texture # 图片
function GameAPI.change_mini_map_img_with_icon(role, image_id) end

--设置小地图颜色显示模式
---@param role py.Role # 玩家
---@param color_type integer # 显示模式
function GameAPI.change_mini_map_color_type(role, color_type) end

--开启绘制单位路径线
---@param role py.Role # 玩家
---@param unit py.Unit # 单位
function GameAPI.enable_unit_path_drawing(role, unit) end

--关闭绘制单位路径线
---@param role py.Role # 玩家
---@param unit py.Unit # 单位
function GameAPI.disable_unit_path_drawing(role, unit) end

--设置小地图显示区域
---@param role py.Role # 玩家
---@param rect_area py.RecArea # 矩形区域
function GameAPI.set_min_map_show_area(role, rect_area) end

--设置进度条最大值
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param max_value number # 最大值
function GameAPI.set_progress_bar_max_value(role, comp_name, max_value) end

--设置进度条当前值
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param current_value number # 当前值
---@param time? number # 渐变时间
function GameAPI.set_progress_bar_current_value(role, comp_name, current_value, time) end

--设置ui开启/关闭
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param current_value boolean # 是否开启
function GameAPI.set_ui_comp_enable(role, comp_name, current_value) end

--设置ui显示/隐藏
---@param role py.Role # 玩家
---@param visible boolean # 显/隐
---@param comp_name string # 控件名
function GameAPI.set_ui_comp_visible(role, visible, comp_name) end

--设置ui文本颜色
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param r number # R
---@param g number # G
---@param b number # B
---@param a number # A
function GameAPI.set_ui_comp_font_color(role, comp_name, r, g, b, a) end

--设置ui文本
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param content string # 文本
function GameAPI.set_ui_comp_text(role, comp_name, content) end

--设置ui文本大小
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param size integer # 文本大小
function GameAPI.set_ui_comp_font_size(role, comp_name, size) end

--设置输入框获得焦点
---@param role py.Role # 玩家
---@param comp_name string # 控件名
function GameAPI.set_input_field_focus(role, comp_name) end

--设置输入框失去焦点
---@param role py.Role # 玩家
---@param comp_name string # 控件名
function GameAPI.set_input_field_not_focus(role, comp_name) end

--播放UI控件时间轴动画
function GameAPI.play_ui_comp_anim() end

--停止UI控件时间轴动画
---@param role py.Role # 玩家
---@param anim_id py.UIAnimKey # UI动画
function GameAPI.stop_ui_comp_anim(role, anim_id) end

--绑定技能实体到控件
---@param role py.Role # 玩家
---@param ability py.Ability # 技能对象
---@param comp_name string # 控件名
function GameAPI.set_skill_on_ui_comp(role, ability, comp_name) end

--解绑技能实体到控件
---@param role py.Role # 玩家
---@param ability py.Ability # 技能对象
---@param comp_name string # 控件名
function GameAPI.unbind_skill_on_ui_comp(role, ability, comp_name) end

--设置控件透明度
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param opacity number # 透明度
function GameAPI.set_ui_comp_opacity(role, comp_name, opacity) end

--绑定对象到BUFF控件
---@param role py.Role # 玩家
---@param unit py.Unit # 单位对象
---@param comp_name string # 控件名
function GameAPI.set_buff_on_ui_comp(role, unit, comp_name) end

--绑定物品实体到道具栏控件
---@param role py.Role # 玩家
---@param item py.Item # 物品对象
---@param comp_name string # 控件名
function GameAPI.set_item_on_ui_comp(role, item, comp_name) end

--设置道具栏控件类型和槽位号
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param slot_type py.SlotType # 类型
---@param slot_index integer # 槽位id
function GameAPI.set_ui_comp_slot(role, comp_name, slot_type, slot_index) end

--设置道具栏控件类型和槽位号
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param unit py.Unit # 单位
---@param slot_type py.SlotType # 类型
---@param slot_index integer # 槽位id
function GameAPI.set_ui_comp_unit_slot(role, comp_name, unit, slot_type, slot_index) end

--设置预设主界面UI显隐
---@param role py.Role # 玩家
---@param visible boolean # 显隐
function GameAPI.set_prefab_ui_visible(role, visible) end

--播放/停止技能按钮激活动效
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param play boolean # 播放/停止
function GameAPI.set_skill_btn_action_effect(role, comp_name, play) end

--设置按钮快捷键
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param btn integer # 按键ID
function GameAPI.set_btn_short_cut(role, comp_name, btn) end

--设置按钮辅助键
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param btn integer # 按键ID
function GameAPI.set_btn_func_short_cut(role, comp_name, btn) end

--设置技能按钮智能施法快捷键
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param btn integer # 按键ID
function GameAPI.set_skill_btn_smart_cast_key(role, comp_name, btn) end

--设置技能按钮智能施法辅助键
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param btn integer # 按键ID
function GameAPI.set_skill_btn_func_smart_cast_key(role, comp_name, btn) end

--设置UI模型控件ID
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param model_id py.Model # 模型id
function GameAPI.set_ui_model_id(role, comp_name, model_id) end

--设置玩家的商店控件的目标商店单位
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param shop_unit py.Unit # 商店单位
---@param index py.Unit # 页签索引
function GameAPI.set_shop_comp_bind_shop_unit(role, comp_name, shop_unit, index) end

--设置玩家的合成控件的参数并刷新
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param item_id py.ItemID # 合成目标物品id
---@param shop_unit py.Unit # 商店单位
---@param buy_unit py.Unit # 购买单位
function GameAPI.set_compose_comp_refresh(role, comp_name, item_id, shop_unit, buy_unit) end

--获取icon图标的图片id
---@param parameter py.Actor # 对象
---@return integer # 图片id
function GameAPI.get_icon_id(parameter) end

--获取技能icon图标的图片id
---@param key py.AbilityKey # 技能编号
---@return integer # 图片id
function GameAPI.get_icon_id_by_ability_type(key) end

--获取物品icon图标的图片id
---@param key py.ItemKey # 物品编号
---@return integer # 图片id
function GameAPI.get_icon_id_by_item_type(key) end

--获取单位icon图标的图片id
---@param key py.UnitKey # 单位编号
---@return integer # 图片id
function GameAPI.get_icon_id_by_unit_type(key) end

--获取魔法效果icon图标的图片id
---@param key py.ModifierKey # 魔法效果编号
---@return integer # 图片id
function GameAPI.get_icon_id_by_buff_type(key) end

--获取魔法效果类型图标的可见性
---@param key py.ModifierKey # 魔法效果编号
---@return boolean # 布尔值
function GameAPI.is_show_on_ui_by_buff_type(key) end

--生成漂浮文字
---@param point py.Point # 点
---@param type integer # 跳字类型
---@param value string # 跳字内容
---@param player_group py.RoleGroup # 玩家组
function GameAPI.create_harm_text(point, type, value, player_group) end

--玩家是否按下按键
---@param role py.Role # 玩家
---@param key py.KeyboardKey # 键盘按键
---@return boolean # 按下状态
function GameAPI.player_key_is_pressed(role, key) end

--玩家鼠标位置
---@param role py.Role # 玩家
---@return py.Point # 鼠标位置
function GameAPI.get_player_pointing_pos(role) end

--玩家鼠标屏幕位置X
---@param role py.Role # 玩家
---@return integer # 鼠标屏幕位置X
function GameAPI.get_player_ui_pos_x(role) end

--玩家鼠标屏幕位置Y
---@param role py.Role # 玩家
---@return integer # 鼠标屏幕位置Y
function GameAPI.get_player_ui_pos_y(role) end

--玩家摄像机朝向
---@param role py.Role # 玩家
---@return py.Point # 摄像机朝向
function GameAPI.get_player_camera_direction(role) end

--玩家摄像机中心射线检测
---@param role py.Role # 玩家
---@return py.Point # 交点
function GameAPI.get_camera_center_raycast(role) end

--玩家鼠标屏幕位置X的窗口占比
---@param role py.Role # 玩家
---@return number # 占比值
function GameAPI.get_role_ui_x_per(role) end

--玩家鼠标屏幕位置Y的窗口占比
---@param role py.Role # 玩家
---@return number # 占比值
function GameAPI.get_role_ui_y_per(role) end

--返回指定单位类型的名称
---@param unit_key py.UnitKey # 单位类型
---@return string # 描述
function GameAPI.get_unit_name_by_type(unit_key) end

--返回指定单位类型的描述
---@param unit_key py.UnitKey # 单位类型
---@return string # 描述
function GameAPI.get_unit_desc_by_type(unit_key) end

--获取单位类型建造资源消耗属性(玩家属性)
---@param unit_key py.UnitKey # 单位类型
---@param role_res_key py.RoleResKey # 玩家属性
---@return integer # 玩家属性值
function GameAPI.get_role_attr_by_unit_type(unit_key, role_res_key) end

--返回指定可破坏物类型的名称
---@param dest_key py.DestructibleKey # 可破坏物ID
---@return string # 描述
function GameAPI.get_dest_name_by_type(dest_key) end

--返回指定可破坏物类型的描述
---@param dest_key py.DestructibleKey # 可破坏物ID
---@return string # 描述
function GameAPI.get_dest_desc_by_type(dest_key) end

--返回指定投射物类型的名称
---@param projectile_key py.ProjectileKey # 投射物ID
---@return string # 描述
function GameAPI.get_projectile_name_by_type(projectile_key) end

--返回指定投射物类型的描述
---@param projectile_key py.ProjectileKey # 投射物ID
---@return string # 描述
function GameAPI.get_projectile_desc_by_type(projectile_key) end

--返回指定物品类型的描述
---@param item_key py.ItemKey # 物品ID
---@return string # 描述
function GameAPI.get_item_desc_by_type(item_key) end

--返回指定技能类型的描述
---@param ability_key py.AbilityKey # 技能ID
---@return string # 描述
function GameAPI.get_ability_desc_by_type(ability_key) end

--返回指定技能类型的名称
---@param ability_key py.AbilityKey # 技能ID
---@return string # 名称
function GameAPI.get_ability_name_by_type(ability_key) end

--返回指定科技类型的名称
---@param tech_key py.TechKey # 科技ID
---@return string # 名称
function GameAPI.get_tech_name_by_type(tech_key) end

--返回指定科技类型的描述
---@param tech_key py.TechKey # 科技ID
---@return string # 描述
function GameAPI.get_tech_desc_by_type(tech_key) end

--返回指定魔法效果类型的名称
---@param modifier_key py.ModifierKey # 魔法效果ID
---@return string # 描述
function GameAPI.get_modifier_name_by_type(modifier_key) end

--返回指定魔法效果类型的描述
---@param modifier_key py.ModifierKey # 魔法效果ID
---@return string # 描述
function GameAPI.get_modifier_desc_by_type(modifier_key) end

--返回指定物品类型的名字
---@param item_key py.ItemKey # 物品ID
---@return string # 名字
function GameAPI.get_item_name_by_type(item_key) end

--屏蔽全局键盘事件
---@param role py.Role # 玩家
---@param block boolean # 是否屏蔽
function GameAPI.block_global_key_event(role, block) end

--屏蔽全局鼠标事件
---@param role py.Role # 玩家
---@param block boolean # 是否屏蔽
function GameAPI.block_global_mouse_event(role, block) end

--屏蔽触发器键盘事件
---@param role py.Role # 玩家
---@param block boolean # 是否屏蔽
function GameAPI.block_trigger_key_event(role, block) end

--屏蔽触发器鼠标事件
---@param role py.Role # 玩家
---@param block boolean # 是否屏蔽
function GameAPI.block_trigger_mouse_event(role, block) end

--获取玩家属性Icon
---@param res_key py.RoleResKey # 玩家属性
---@return integer # 图片ID
function GameAPI.get_role_res_icon(res_key) end

--获取玩家属性名称
---@param res_key py.RoleResKey # 玩家属性
---@return string # 属性名称
function GameAPI.get_role_res_name(res_key) end

--设置ui模型控件背景色
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param r number # R
---@param g number # G
---@param b number # B
---@param a number # A
function GameAPI.set_show_room_background_color(role, comp_name, r, g, b, a) end

--设置Showroom的fov
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param fov number # fov
function GameAPI.change_showroom_fov(role, comp_name, fov) end

--设置Showroom的camera pos
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param x number # x
---@param y number # y
---@param z number # z
function GameAPI.change_showroom_cposition(role, comp_name, x, y, z) end

--设置Showroom的camera rotation
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param pitch number # pitch
---@param roll number # roll
---@param yaw number # yaw
function GameAPI.change_showroom_crotation(role, comp_name, pitch, roll, yaw) end

--设置grid_view的子item数量
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param count integer # 子节点数量
function GameAPI.set_grid_view_item_count(role, comp_name, count) end

--获得gridview的子控件
---@param comp_name string # 控件名
---@param index integer # 索引
---@return string # 子控件
function GameAPI.get_grid_view_item(comp_name, index) end

--(调试)绘制网格线
---@param role py.Role # 玩家
---@param start_x number # 起点x
---@param start_y number # 起点y
---@param height number # 高度
---@param space number # 间距
---@param line_count integer # 线数
---@param r integer # r
---@param g integer # g
---@param b integer # b
function GameAPI.draw_grid_polyline(role, start_x, start_y, height, space, line_count, r, g, b) end

--(调试)绘线
---@param point_list py.List # 点
---@param height number # 高度
---@param r integer # r
---@param g integer # g
---@param b integer # b
---@return integer # 索引
function GameAPI.draw_polyline(point_list, height, r, g, b) end

--(调试)绘制矩形
---@param point_list py.List # 点
function GameAPI.draw_box(point_list) end

--(调试)隐藏所有矩形
function GameAPI.hide_all_rect() end

--(调试)清除调试绘线
---@param index integer # 索引
function GameAPI.clear_grid_polyline(index) end

--(调试)设置billboard字体大小
---@param role py.Role # 玩家
---@param size integer # 大小
function GameAPI.set_billboard_font_size(role, size) end

--设置鼠标关闭右键点击移动
---@param b boolean # 开关
function GameAPI.set_mouse_click_control_move(b) end

--遍历所有玩家的资源属性
---@param is_iter_coin_only boolean # 是否遍历货币类型
function GameAPI.iter_role_res(is_iter_coin_only) end

--设置控件旋转
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param rotation number # 角度
function GameAPI.set_ui_comp_rotation(role, comp_name, rotation) end

--设置控件是否拦截
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param swallow boolean # 是否拦截点击
function GameAPI.set_ui_comp_swallow(role, comp_name, swallow) end

--设置控件是否可拖动
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param can_drag boolean # 是否可拖动
function GameAPI.set_ui_comp_drag(role, comp_name, can_drag) end

--设置控件世界坐标
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param x number # x
---@param y number # y
function GameAPI.set_ui_comp_world_pos(role, comp_name, x, y) end

--设置控件世界旋转
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param rotation number # rotation
function GameAPI.set_ui_comp_world_rotation(role, comp_name, rotation) end

--设置控件世界缩放
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param scale_x number # scale_x
---@param scale_y number # scale_y
function GameAPI.set_ui_comp_world_scale(role, comp_name, scale_x, scale_y) end

--获取当前玩家控件相对位置x
---@param comp_name string # 控件名
---@return number # x
function GameAPI.get_ui_comp_pos_x(comp_name) end

--获取当前玩家控件相对位置y
---@param comp_name string # 控件名
---@return number # y
function GameAPI.get_ui_comp_pos_y(comp_name) end

--获取当前玩家控件绝对位置x
---@param comp_name string # 控件名
---@return number # x
function GameAPI.get_ui_comp_world_pos_x(comp_name) end

--获取当前玩家控件绝对位置y
---@param comp_name string # 控件名
---@return number # y
function GameAPI.get_ui_comp_world_pos_y(comp_name) end

--获取当前玩家控件相对旋转
---@param comp_name string # 控件名
---@return number # rotation
function GameAPI.get_ui_comp_rotation(comp_name) end

--获取当前玩家控件绝对旋转
---@param comp_name string # 控件名
---@return number # rotation
function GameAPI.get_ui_comp_world_rotation(comp_name) end

--获取当前玩家控件相对缩放x
---@param comp_name string # 控件名
---@return number # scale_x
function GameAPI.get_ui_comp_scale_x(comp_name) end

--获取当前玩家控件相对缩放y
---@param comp_name string # 控件名
---@return number # scale_y
function GameAPI.get_ui_comp_scale_y(comp_name) end

--获取当前玩家控件绝对缩放x
---@param comp_name string # 控件名
---@return number # scale_x
function GameAPI.get_ui_comp_world_scale_x(comp_name) end

--获取当前玩家控件绝对缩放y
---@param comp_name string # 控件名
---@return number # scale_y
function GameAPI.get_ui_comp_world_scale_y(comp_name) end

--创建ui控件
---@param role py.Role # 玩家
---@param comp_name string # 父节点
---@param comp_type integer # 控件类型
---@return string # 控件uid
function GameAPI.create_ui_comp(role, comp_name, comp_type) end

--创建并绑定ui控件事件
---@param role py.Role # 玩家
---@param comp_uid string # 控件uid
---@param event_type integer # 控件事件类型
---@return string # 事件名
function GameAPI.create_ui_comp_event(role, comp_uid, event_type) end

--创建并绑定ui控件事件(指定事件名)
---@param role py.Role # 玩家
---@param comp_uid string # 控件uid
---@param event_type integer # 控件事件类型
---@param name string # 自定义事件名
---@return string # 事件名
function GameAPI.create_ui_comp_event_ex(role, comp_uid, event_type, name) end

--新版创建并绑定ui控件事件(指定事件名),不再传入玩家，同时支持普通控件和动态创建控件
---@param comp_uid string # 控件uid
---@param event_type integer # 控件事件类型
---@param name string # 自定义事件名
---@return string # 事件名
function GameAPI.create_ui_comp_event_ex_ex(comp_uid, event_type, name) end

--创建并绑定ui控件事件(指定事件名)
---@param role py.Role # 玩家
---@param comp_uid string # 控件uid
---@param event_type integer # 控件事件类型
---@param name string # 自定义事件名
---@return string # 事件名
function GameAPI.create_ui_comp_event_ex_no_check(role, comp_uid, event_type, name) end

--创建场景点并绑定UI到点
---@param comp_name string # 控件名
---@param point py.Point # 点
---@param visible_dis? number # 可见距离
---@param height_offset? number # 离地高度
---@return py.SceneNode # 场景点
function GameAPI.create_scene_node_on_point(comp_name, point, visible_dis, height_offset) end

--创建场景点并绑定UI到单位
---@param comp_name string # 控件名
---@param player py.Role # 玩家
---@param unit py.Unit # 单位
---@param socket_name string # 挂接点
---@param visible_dis? number # 可见距离
---@return py.SceneNode # 场景点
function GameAPI.create_scene_node_on_unit(comp_name, player, unit, socket_name, visible_dis) end

--设置场景点对玩家的可见距离
---@param scene_node py.SceneNode # 场景点
---@param player py.Role # 玩家
---@param visible_dis number # 可见距离
function GameAPI.set_scene_node_visible_distance(scene_node, player, visible_dis) end

--删除场景点
---@param scene_node_entity py.SceneNode # 场景点
function GameAPI.delete_scene_node(scene_node_entity) end

--获取场景ui中的控件
---@param scene_node_entity py.SceneNode # 场景点
---@param comp_path string # 控件路径
---@return string # 控件名
function GameAPI.get_ui_comp_in_scene_ui(scene_node_entity, comp_path) end

--获取场景ui中的控件
---@param scene_node_entity py.SceneNode # 场景点
---@param comp_uid string # 模板控件uid
---@return string # uid
function GameAPI.get_ui_comp_in_scene_ui_ex(scene_node_entity, comp_uid) end

--单位类型转字符串
---@param val py.UnitKey # 单位编号
---@return string # 字符串
function GameAPI.unit_key_to_str(val) end

--字符串转单位类型
---@param val string # 字符串
---@return py.UnitKey # 单位编号
function GameAPI.str_to_unit_key(val) end

--物品类型转字符串
---@param val py.ItemKey # 物品编号
---@return string # 字符串
function GameAPI.item_key_to_str(val) end

--字符串转物品类型
---@param val string # 字符串
---@return py.ItemKey # 物品编号
function GameAPI.str_to_item_key(val) end

--技能类型转字符串
---@param val py.AbilityKey # 技能编号
---@return string # 字符串
function GameAPI.ability_key_to_str(val) end

--字符串转技能类型
---@param val string # 字符串
---@return py.AbilityKey # 技能编号
function GameAPI.str_to_ability_key(val) end

--可破坏物类型转字符串
---@param obj py.DestructibleKey # 可破坏物编号
---@return string # 字符串
function GameAPI.dest_key_to_str(obj) end

--字符串转可破坏物类型
---@param obj string # 字符串
---@return py.DestructibleKey # 可破坏物编号
function GameAPI.str_to_dest_key(obj) end

--投射物类型转字符串
---@param obj py.ProjectileKey # 投射物编号
---@return string # 字符串
function GameAPI.project_key_to_str(obj) end

--字符串转投射物类型
---@param obj string # 字符串
---@return py.ProjectileKey # 投射物编号
function GameAPI.str_to_project_key(obj) end

--科技类型转字符串
---@param val py.TechKey # 科技编号
---@return string # 字符串
function GameAPI.tech_key_to_str(val) end

--字符串转科技类型
---@param val string # 字符串
---@return py.TechKey # 科技编号
function GameAPI.str_to_tech_key(val) end

--模型实体转字符串
---@param obj py.ModelEntity # 模型实体
---@return string # 字符串
function GameAPI.model_entity_to_str(obj) end

--模型类型转字符串
---@param val py.ModelKey # 模型编号
---@return string # 字符串
function GameAPI.model_key_to_str(val) end

--字符串转模型类型
---@param val string # 字符串
---@return py.ModelKey # 模型编号
function GameAPI.str_to_model_key(val) end

--魔法效果类型转字符串
---@param val py.ModifierKey # 效果编号
---@return string # 字符串
function GameAPI.modifier_key_to_str(val) end

--字符串转魔法效果类型
---@param val string # 字符串
---@return py.ModifierKey # 效果编号
function GameAPI.str_to_modifier_key(val) end

--平台道具类型转字符串
---@param obj py.StoreKey # 平台道具类型
---@return string # 字符串
function GameAPI.store_key_to_str(obj) end

--字符串转平台道具类型
---@param obj string # 字符串
---@return py.StoreKey # 平台道具类型
function GameAPI.str_to_store_key(obj) end

--镜头转字符串
---@param id_value py.Camera # 镜头
---@return string # 字符串
function GameAPI.camera_to_str(id_value) end

--声音转字符串
---@param obj py.SoundEntity # 声音对象
---@return string # 字符串
function GameAPI.sound_entity_to_str(obj) end

--声音类型转字符串
---@param obj py.AudioKey # 音效编号
---@return string # 字符串
function GameAPI.audio_key_to_str(obj) end

--字符串转声音类型
---@param obj string # 字符串
---@return py.AudioKey # 音效编号
function GameAPI.str_to_audio_key(obj) end

--界面组件转字符串
---@param obj string # 组件名称
---@return string # 字符串
function GameAPI.ui_comp_to_str(obj) end

--玩家属性转字符串
---@param val py.RoleResKey # 资源类型
---@return string # 字符串
function GameAPI.role_res_to_str(val) end

--字符串转玩家属性
---@param val string # 字符串
---@return py.RoleResKey # 资源类型
function GameAPI.str_to_role_res(val) end

--单位属性转字符串
---@param val string # 属性名称
---@return string # 字符串
function GameAPI.unit_attr_to_str(val) end

--字符串转单位属性
---@param val string # 字符串
---@return string # 单位属性
function GameAPI.str_to_unit_attr(val) end

--字符串转阵营对象
---@param obj string # 字符串
---@return py.Camp # 阵营对象
function GameAPI.str_to_camp(obj) end

--获取可破坏物类型的模型
---@param dest_key py.DestructibleKey # 字符串
---@return py.ModelKey # 模型编号
function GameAPI.get_model_key_of_dest_key(dest_key) end

--为玩家设置滤镜效果
---@param role py.Role # 玩家
---@param value integer # id
function GameAPI.set_role_color_grading(role, value) end

--通过控件+路径获得ui控件
---@param role py.Role # 玩家
---@param comp_name string # 父节点
---@param path string # 路径
---@return string # 控件uid
function GameAPI.get_comp_by_path(role, comp_name, path) end

--通过绝对路径获得ui控件
---@param role py.Role # 玩家
---@param path string # 路径
---@return string # 控件uid
function GameAPI.get_comp_by_absolute_path(role, path) end

--播放ui动效
---@param role py.Role # 玩家
---@param uid string # 控件uid
---@param fx_id integer # 控件动效工程id
---@param ani_name string # 动效名
---@param loop? boolean # 循环
function GameAPI.play_ui_comp_fx(role, uid, fx_id, ani_name, loop) end

--ui模型控件播放动画
---@param role py.Role # 玩家
---@param uid string # 控件uid
---@param anim string # 动画名
---@param play_speed? number # 动画速率
---@param begin_t? number # 开始时间
---@param end_t? number # 结束时间
---@param loop? boolean # 是否循环
---@param return_idle? boolean # 是否回到默认动画
function GameAPI.play_ui_model_anim(role, uid, anim, play_speed, begin_t, end_t, loop, return_idle) end

--设置ui组件悬浮态图片
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param image_id integer # 图片id
function GameAPI.set_ui_comp_suspend_image(role, comp_name, image_id) end

--设置ui组件按下态图片
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param image_id integer # 图片id
function GameAPI.set_ui_comp_press_image(role, comp_name, image_id) end

--设置ui组件禁用态图片
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param image_id integer # 图片id
function GameAPI.set_ui_comp_disabled_image(role, comp_name, image_id) end

--设置背景音乐开关
---@param role py.Role # 玩家
---@param value boolean # 打开/关闭
function GameAPI.open_background_music(role, value) end

--设置战斗音乐开关
---@param role py.Role # 玩家
---@param value boolean # 打开/关闭
function GameAPI.open_battle_music(role, value) end

--设置背景音乐音量
---@param role py.Role # 玩家
---@param value integer # 音量
function GameAPI.set_background_music_volume(role, value) end

--设置战斗音效音量
---@param role py.Role # 玩家
---@param value integer # 音量
function GameAPI.set_battle_music_volume(role, value) end

--设置分辨率
---@param role py.Role # 玩家
---@param x_resolution number # 横向分辨率
---@param y_resolution number # 纵向分辨率
function GameAPI.set_screen_resolution(role, x_resolution, y_resolution) end

--设置画质
---@param role py.Role # 玩家
---@param quality string # 画质
function GameAPI.set_image_quality(role, quality) end

--设置窗口
---@param role py.Role # 玩家
---@param window_type string # 样式
function GameAPI.set_window_type(role, window_type) end

--清空下拉框
---@param role py.Role # 玩家
---@param comp_id string # 下拉框
function GameAPI.clear_combo_box(role, comp_id) end

--添加下拉框选项
---@param role py.Role # 玩家
---@param comp_id string # 下拉框
---@param text string # 名称
---@param value string # 值
function GameAPI.add_combo_item(role, comp_id, text, value) end

--设置下拉框默认文本
---@param role py.Role # 玩家
---@param comp_id string # 下拉框
---@param text string # 默认文本
function GameAPI.set_combo_text(role, comp_id, text) end

--获取下拉框当前值
---@param comp_id string # 下拉框
---@return string # value
function GameAPI.get_combo_box_cur_value(comp_id) end

--获取滑动条当前值
---@param comp_id string # 滑动条
---@return number # value
function GameAPI.get_slider_cur_percent(comp_id) end

--设置滑动条当前值
---@param role py.Role # 玩家
---@param comp_id string # 滑动条
---@param value number # value
function GameAPI.set_slider_cur_percent(role, comp_id, value) end

--获得控件宽度
---@param comp_id string # UI控件
---@return integer # width
function GameAPI.get_ui_comp_width(comp_id) end

--获得控件高度
---@param comp_id string # UI控件
---@return integer # height
function GameAPI.get_ui_comp_height(comp_id) end

--开关目标点的草丛
---@param enable boolean # 开关
---@param point py.Point # 点
function GameAPI.set_grass_enable_by_pos(enable, point) end

--为玩家开关全局视野
---@param enable boolean # 开关
function GameAPI.enable_fow_for_player(enable) end

--设置ui按钮是否开启多态
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param is_open boolean # 是否开启
function GameAPI.set_ui_comp_bar_status(role, comp_name, is_open) end

--获取初始化游戏画质
---@return string # value
function GameAPI.get_graphics_quality() end

--获取初始化窗口类别
---@return string # value
function GameAPI.get_window_mode() end

--获取初始化横向分辨率
---@return integer # value
function GameAPI.get_game_x_resolution() end

--获取初始化纵向分辨率
---@return integer # value
function GameAPI.get_game_y_resolution() end

--当前窗体横向尺寸
---@return integer # value
function GameAPI.get_window_real_x_size() end

--当前窗体纵向尺寸
---@return integer # value
function GameAPI.get_window_real_y_size() end

--获取屏幕横向分辨率
---@return integer # value
function GameAPI.get_screen_x_resolution() end

--获取屏幕纵向分辨率
---@return integer # value
function GameAPI.get_screen_y_resolution() end

--获取初始化背景音乐开关状态
---@return boolean # value
function GameAPI.get_bgm_state() end

--获取初始化战斗音效开关状态
---@return boolean # value
function GameAPI.get_battle_bgm_state() end

--获取初始化背景音乐音量
---@return integer # value
function GameAPI.get_bgm_volume() end

--获取初始化战斗音效音量
---@return integer # value
function GameAPI.get_battle_volume() end

--设置声音音量
---@param player py.Role # 玩家
---@param sound py.SoundEntity # 声音
---@param volume integer # 音量
function GameAPI.set_sound_volume(player, sound, volume) end

--设置UI控件模型焦点
---@param player py.Role # 玩家
---@param comp_name string # UI控件
---@param x number # x
---@param y number # y
---@param z number # z
function GameAPI.set_ui_model_focus_pos(player, comp_name, x, y, z) end

--获取ui控件的子控件
---@param role py.Role # 玩家
---@param uid string # 控件uid
---@return py.List # 子控件uid
function GameAPI.get_ui_comp_children(role, uid) end

--获取ui控件的子控件
---@param role py.Role # 玩家
---@param uid string # 控件uid
---@return py.List # 子控件uid
function GameAPI.get_ui_comp_children_no_check(role, uid) end

--获取ui控件的名称
---@param role py.Role # 玩家
---@param comp_name string # 控件uid
---@return string # 控件名
function GameAPI.get_ui_comp_name(role, comp_name) end

--打开/关闭自动施法
---@param player py.Role # 玩家
---@param is_open boolean # 是否打开
function GameAPI.set_smart_cast_ability(player, is_open) end

--设置{玩家}的普攻预览状态为{开启/关闭}
---@param player py.Role # 玩家
---@param is_open boolean # 是否打开
function GameAPI.set_preview_common_atk_range(player, is_open) end

--是否让{玩家}的智能施法使用指示器
---@param player py.Role # 玩家
---@param use_skill_pointer boolean # 是否使用指示器
function GameAPI.set_smart_cast_with_pointer(player, use_skill_pointer) end

--设置快捷键
---@param role py.Role # 玩家
---@param plan integer # 方案
---@param key string # 快捷键key
---@param value1 integer # 键盘码1
---@param value2 integer # 键盘码2
function GameAPI.set_shortcut(role, plan, key, value1, value2) end

--获取快捷键
---@param role py.Role # 玩家
---@param plan integer # 方案
---@param key string # 快捷键key
---@return py.IntList # 键盘码
function GameAPI.get_shortcut(role, plan, key) end

--设置智能施法
---@param role py.Role # 玩家
---@param value boolean # 开启/关闭
function GameAPI.set_simple_cast(role, value) end

--获取智能施法
---@param role py.Role # 玩家
---@return boolean # 是否智能施法
function GameAPI.get_simple_cast(role) end

--获取客户端智能施法
---@param role py.Role # 玩家
---@return boolean # 是否智能施法
function GameAPI.get_client_simple_cast(role) end

--保存编辑器局内设置
---@param role py.Role # 玩家
function GameAPI.save_client_setting(role) end

--保存玩家设置
---@param role py.Role # 玩家
function GameAPI.save_game_setting(role) end

--获取本地玩家
---@return py.Role # 玩家
function GameAPI.get_client_role() end

--修改玩家的地表纹理
---@param role py.Role # 玩家
---@param bool_value boolean # 布尔值
function GameAPI.set_local_terrain_visible(role, bool_value) end

--修改材质属性
---@param obj py.Actor # 对象
---@param material_id integer # 材质id
---@param r_value number # R
---@param g_value number # G
---@param b_value number # B
---@param intensity? number # 强度
---@param alpha? number # 透明度
function GameAPI.set_material_param(obj, material_id, r_value, g_value, b_value, intensity, alpha) end

--解绑绑定控件
---@param role py.Role # 玩家
---@param comp_name string # 控件uid
function GameAPI.unbind_ui_comp(role, comp_name) end

--设置鼠标移动镜头模式
---@param role py.Role # 玩家
---@param value boolean # 开启/关闭
function GameAPI.set_mouse_move_camera_mode(role, value) end

--设置鼠标移动镜头速度
---@param role py.Role # 玩家
---@param value number # 移动速度
function GameAPI.set_mouse_move_camera_speed(role, value) end

--设置键盘移动镜头速度
---@param role py.Role # 玩家
---@param value number # 移动速度
function GameAPI.set_key_move_camera_speed(role, value) end

--绑定单位属性或者全局变量到玩家界面控件的属性
---@param role py.Role # 玩家
---@param ui_comp string # 控件uid
---@param ui_comp_attr string # 控件属性字段
---@param attr_or_var string # 属性名
---@param precision? integer # 保留小数精度
function GameAPI.set_ui_comp_bind_attr(role, ui_comp, ui_comp_attr, attr_or_var, precision) end

--绑定单位属性或者全局变量到玩家界面控件的属性
---@param role py.Role # 玩家
---@param ui_comp string # 控件uid
---@param ui_comp_attr string # 控件属性字段
---@param attr_or_var string # 属性名
---@param precision? integer # 保留小数精度
function GameAPI.set_ui_comp_bind_var(role, ui_comp, ui_comp_attr, attr_or_var, precision) end

--解绑界面控件属性绑定
---@param role py.Role # 玩家
---@param ui_comp string # 控件uid
---@param ui_comp_attr string # 控件属性字段
function GameAPI.ui_comp_unbind(role, ui_comp, ui_comp_attr) end

--界面控件属性绑定指定单位
---@param role py.Role # 玩家
---@param ui_comp string # 控件uid
---@param unit py.Unit # 单位
function GameAPI.ui_comp_bind_unit(role, ui_comp, unit) end

--界面控件属性动态绑定主控单位
---@param role py.Role # 玩家
---@param ui_comp string # 控件uid
function GameAPI.ui_comp_bind_ctrl_unit(role, ui_comp) end

--修改玩家主控单位
---@param role py.Role # 玩家
---@param unit py.Unit # 单位
function GameAPI.change_highlight_unit_of_role(role, unit) end

--玩家主控单位
---@param role py.Role # 玩家
---@param unit py.Unit # 单位
function GameAPI.set_highlight_unit_of_role(role, unit) end

--获取玩家主控单位
---@param role py.Role # 玩家
function GameAPI.get_highlight_unit_of_role(role) end

--获取本局游戏环境
---@return py.StartMode # 游戏环境
function GameAPI.api_get_start_mode() end

--获取界面控件的父控件
---@param role py.Role # 玩家
---@param comp_uid string # 界面控件
---@return string # 父控件
function GameAPI.get_ui_comp_parent(role, comp_uid) end

--绑定玩家属性到玩家界面控件的属性
---@param role py.Role # 玩家
---@param ui_comp string # 控件uid
---@param ui_comp_attr string # 控件属性字段
---@param bind_role py.Role # 玩家
---@param attr_or_var string # 玩家属性key
---@param precision? integer # 保留小数精度
function GameAPI.set_ui_comp_bind_player_prop(role, ui_comp, ui_comp_attr, bind_role, attr_or_var, precision) end

--设置控件文本对齐方式
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param align_type integer # 对齐方式
function GameAPI.set_ui_comp_align(role, comp_name, align_type) end

--攻击类型判断
---@param attack_type0 integer # 攻击类型
---@param attack_type1 integer # 攻击类型
---@return boolean # 攻击类型判断
function GameAPI.api_check_attack_type(attack_type0, attack_type1) end

--护甲类型判断
---@param armor_type0 integer # 护甲类型
---@param armor_type1 integer # 护甲类型
---@return boolean # 护甲类型判断
function GameAPI.api_check_armor_type(armor_type0, armor_type1) end

--天气系统开关
---@param weatherID integer # 天气ID
---@param time number # 时间
---@param intensity number # 强度
function GameAPI.set_weahter_enable(weatherID, time, intensity) end

--获取玩家平台头像
---@param role py.Role # 玩家
---@return integer # 图片ID
function GameAPI.get_role_platform_icon(role) end

--获取玩家平台模型
---@param role py.Role # 玩家
---@return py.ModelKey # 模型编号
function GameAPI.get_role_platform_model(role) end

--注册界面控件播放指定动效回调
---@param role py.Role # 玩家
---@param uid string # 控件uid
---@param fx_id integer # 控件动效工程id
---@param ani_name string # 动效名
---@param frame integer # 播放动效回调帧数
---@param handler string # 回调句柄
function GameAPI.register_ui_comp_fx_cb(role, uid, fx_id, ani_name, frame, handler) end

--创建界面模块
---@param role py.Role # 玩家
---@param prefab_id string # 预设uid
---@param comp_name string # 父控件
---@return string # 控件uid
function GameAPI.create_ui_prefab_instance(role, prefab_id, comp_name) end

--创建界面模块
---@param role py.Role # 玩家
---@param distance_max number # 高度上限值
function GameAPI.set_camera_distance_max(role, distance_max) end

--删除界面控件
---@param role py.Role # 玩家
---@param comp_name string # 控件uid
function GameAPI.del_ui_comp(role, comp_name) end

--设置画风
---@param role py.Role # 玩家
---@param post_style_type py.PostEffect # 画风
---@param color_r? integer # R
---@param color_g? integer # R
---@param color_b? integer # R
---@param depth_scale? number # 描边
---@param intensity? number # 强度
function GameAPI.set_post_effect(role, post_style_type, color_r, color_g, color_b, depth_scale, intensity) end

--开启字体大小跟随内容自适应
---@param role py.Role # 玩家
---@param comp_name string # 控件uid
---@param is_open boolean # 开启/关闭
function GameAPI.set_ui_comp_text_adaptive(role, comp_name, is_open) end

--设置字体大小跟随内容自适应最小值(需要重新设置文本生效)
---@param role py.Role # 玩家
---@param min_value integer # 最小值
function GameAPI.set_ui_comp_text_adaptive_min_size(role, min_value) end

--获得玩家的界面模块实例
---@param role py.Role # 玩家
---@param uid string # 界面模块实例uid
---@return py.UIPrefabIns # 界面模块实例
function GameAPI.get_ui_prefab_ins(role, uid) end

--绑定技能cd到玩家界面控件的属性
---@param role py.Role # 玩家
---@param ui_comp string # 控件uid
---@param ui_comp_attr string # 控件属性字段
---@param ability py.Ability # 技能实体对象
function GameAPI.set_ui_comp_bind_ability_cd(role, ui_comp, ui_comp_attr, ability) end

--绑定魔法效果cd到玩家界面控件的属性
---@param role py.Role # 玩家
---@param ui_comp string # 控件uid
---@param ui_comp_attr string # 控件属性字段
---@param modifier py.ModifierEntity # 技能实体对象
function GameAPI.set_ui_comp_bind_modifier_cd(role, ui_comp, ui_comp_attr, modifier) end

--开启/禁用发送聊天功能
---@param role py.Role # 玩家
---@param ui_comp string # 控件uid
---@param enabled boolean # 开关
function GameAPI.set_chat_send_enabled(role, ui_comp, enabled) end

--显示/不显示玩家聊天
---@param role py.Role # 玩家
---@param ui_comp string # 控件uid
---@param chat_role py.Role # 玩家
---@param is_show boolean # 开关
function GameAPI.set_player_chat_show(role, ui_comp, chat_role, is_show) end

--清理聊天
---@param role py.Role # 玩家
---@param ui_comp string # 控件uid
function GameAPI.clear_player_chat_panel(role, ui_comp) end

--发送聊天给玩家
---@param role py.Role # 玩家
---@param ui_comp string # 控件uid
---@param target_role py.Role # 玩家
---@param context string # 内容
function GameAPI.send_chat_to_role(role, ui_comp, target_role, context) end

--级联阴影开关
---@param is_enable boolean # 开关
function GameAPI.set_cascaded_shadow_enable(is_enable) end

--级联阴影层数
---@param levels integer # 层数
function GameAPI.set_dynamic_shadow_cascades(levels) end

--级联阴影距离
---@param distance number # 距离
function GameAPI.set_dynamic_shadow_distance_movable_light(distance) end

--阴影距离
---@param distance number # 距离
function GameAPI.set_cascaded_shadow_distance(distance) end

--获取级联阴影状态
---@return boolean # 状态
function GameAPI.get_cascaded_shadow_enable() end

--获取级联阴影层数
---@return integer # 层数
function GameAPI.get_dynamic_shadow_cascades() end

--获取级联阴影距离
---@return number # 距离
function GameAPI.get_dynamic_shadow_distance_movable_light() end

--获取阴影距离
---@return number # 距离
function GameAPI.get_cascaded_shadow_distance() end

--删除界面预制实例
---@param ui_prefab_ins string # 控件名
function GameAPI.del_ui_prefab(ui_prefab_ins) end

--通过预制实例+路径获得ui控件
---@param prefab_ins py.UIPrefabIns # 预制
---@param path string # 路径
---@return string # 控件uid
function GameAPI.get_ui_prefab_child_by_path(prefab_ins, path) end

--获得玩家输入框文本内容
---@param role py.Role # 玩家
---@param comp_name string # 控件uid
---@return string # 文本内容
function GameAPI.get_input_field_content(role, comp_name) end

--获得玩家控件显隐性
---@param role py.Role # 玩家
---@param comp_name string # 控件uid
---@return boolean # 是否显示
function GameAPI.get_ui_comp_visible(role, comp_name) end

--设置玩家的声音主单位
---@param role py.Role # 玩家
---@param unit py.Unit # 单位
function GameAPI.set_role_micro_unit(role, unit) end

--关闭【玩家】的附近语音聊天
---@param role py.Role # 玩家
function GameAPI.close_role_micro_unit(role) end

--设置【玩家】的同阵营语音聊天收听开关为【布尔】
---@param role py.Role # 玩家
---@param is_open boolean # 开关
function GameAPI.set_role_camp_sound_switch(role, is_open) end

--设置【玩家】的同阵营语音聊天发言开关为【布尔】
---@param role py.Role # 玩家
---@param is_open boolean # 开关
function GameAPI.set_role_camp_micro_switch(role, is_open) end

--设置【玩家】的附近语音聊天发言开关为【布尔】
---@param role py.Role # 玩家
---@param is_open boolean # 开关
function GameAPI.set_nearby_micro_switch(role, is_open) end

--设置【玩家】的附近语音聊天收听开关为【布尔】
---@param role py.Role # 玩家
---@param is_open boolean # 开关
function GameAPI.set_nearby_sound_switch(role, is_open) end

--设置【玩家】的所有人语音聊天收听开关为【布尔】
---@param role py.Role # 玩家
---@param is_open boolean # 开关
function GameAPI.set_role_all_sound_switch(role, is_open) end

--设置【玩家】的所有人语音聊天发言开关为【布尔】
---@param role py.Role # 玩家
---@param is_open boolean # 开关
function GameAPI.set_role_all_micro_switch(role, is_open) end

--获得界面控件所属的界面模块实例(如果是的话)
---@param role py.Role # 玩家
---@param comp_name string # 控件uid
---@return py.UIPrefabIns # 界面预制体实例
function GameAPI.get_ui_comp_prefab(role, comp_name) end

--设置聊天控件的频道为同盟或者所有人
---@param role py.Role # 玩家
---@param comp_name string # 控件uid
---@param is_ally boolean # 是否为同盟
function GameAPI.set_ui_comp_chat_channel(role, comp_name, is_ally) end

--通过场景声音ID返回场景声音
---@param res_id py.SceneSoundID # 场景声音ID
---@return py.SceneSound # 场景声音
function GameAPI.get_scene_sound_by_res_id(res_id) end

--播放场景声音
---@param scene_sound py.SceneSound # 场景声音
function GameAPI.play_scene_sound(scene_sound) end

--停止场景声音
---@param scene_sound py.SceneSound # 场景声音
function GameAPI.stop_scene_sound(scene_sound) end

--设置场景声音是否循环
---@param scene_sound py.SceneSound # 场景声音
---@param loop boolean # 是否循环
function GameAPI.set_scene_sound_loop(scene_sound, loop) end

--设置场景声音衰减距离
---@param scene_sound py.SceneSound # 场景声音
---@param min_dist number # 衰减距离
function GameAPI.set_scene_sound_min_dist(scene_sound, min_dist) end

--设置场景声音静音距离
---@param scene_sound py.SceneSound # 场景声音
---@param max_dist number # 静音距离
function GameAPI.set_scene_sound_max_dist(scene_sound, max_dist) end

--设置场景声音是否暂停
---@param scene_sound py.SceneSound # 场景声音
---@param paused boolean # 是否暂停
function GameAPI.set_scene_sound_pause(scene_sound, paused) end

--注册区域的附近语音频道
---@param area py.Area # 区域
function GameAPI.reg_sound_area(area) end

--反注册区域的附近语音频道
---@param area py.Area # 区域
function GameAPI.unreg_sound_area(area) end

--设置附近语音的区域模式开关
---@param b boolean # 区域模式开关
function GameAPI.set_nearby_voice_mode(b) end

--退出游戏
---@param role py.Role # 玩家
function GameAPI.exit_game(role) end

--创建一个物理投射物
---@param p_key py.ProjectileKey # 投射物编号
---@param position py.FVector3 # 位置
---@param rotation? py.FVector3 # 朝向
---@param owner_unit_or_player? py.Unit # 所属单位
---@param duration? py.Fixed # 持续时间
---@return py.ProjectileEntity # 创建出的投射物
function GameAPI.create_physics_projectile_in_scene(p_key, position, rotation, owner_unit_or_player, duration) end

--获取单位类型的模型
---@param unit_key py.UnitKey # 单位类型编号
---@return py.ModelKey # 模型编号
function GameAPI.api_get_unit_type_model(unit_key) end

--获取单位类型的分类
---@param unit_key py.UnitKey # 单位类型编号
---@return integer # 类型
function GameAPI.api_get_unit_type_category(unit_key) end

--玩家本地图平台等级排行榜玩家名称
---@param rank integer # 排名
---@return string # 玩家名称
function GameAPI.api_get_role_name_of_rank(rank) end

--玩家本地图平台等级排行榜玩家等级
---@param rank integer # 排名
---@return integer # 玩家等级
function GameAPI.api_get_role_level_of_rank(rank) end

--设置玩家发言频道
---@param role py.Role # 玩家
---@param channel integer # 频道
function GameAPI.set_audio_chat_channel(role, channel) end

--关闭localplayer的表现层跳字
---@param is_close boolean # 是否关闭
function GameAPI.set_local_player_jump_word_close(is_close) end

--设置界面控件锚点
---@param role py.Role # 玩家
---@param comp_name string # 控件uid
---@param x number # x
---@param y number # y
function GameAPI.set_ui_comp_anchor(role, comp_name, x, y) end

--设置对象的基础材质属性
---@param logic_obj py.Actor # 逻辑对象
---@param color_r? integer # R
---@param color_g? integer # G
---@param color_b? integer # B
---@param color_a? integer # A
---@param base_model_opacity? integer # model_opacity
function GameAPI.api_change_obj_base_color(logic_obj, color_r, color_g, color_b, color_a, base_model_opacity) end

--修改雾效属性新
---@param fog py.Fog # 雾
---@param fog_attr string # 雾效属性
---@param value number # 值
function GameAPI.set_fog_attr_new(fog, fog_attr, value) end

--设置界面控件九宫开关
---@param role py.Role # 玩家
---@param comp_name string # 控件uid
---@param switch boolean # 开关
function GameAPI.set_ui_comp_scale_9_enable(role, comp_name, switch) end

--设置界面控件九宫值
---@param role py.Role # 玩家
---@param comp_name string # 控件uid
---@param x_left integer # x
---@param x_right integer # y
---@param y_top integer # width
---@param y_bottom integer # height
function GameAPI.set_ui_comp_cap_insets(role, comp_name, x_left, x_right, y_top, y_bottom) end

--遍历物品类型的物品合成材料
---@param item_key py.ItemKey # 物品类型
function GameAPI.iter_compose_item_res_of_item_name(item_key) end

--遍历物品类型的玩家合成材料
---@param item_key py.ItemKey # 物品类型
function GameAPI.iter_compose_role_attr_of_item_name(item_key) end

--执行Lua代码
---@param code string # 字符串
---@param arg1? string # 参数1
---@param arg2? string # 参数2
---@param arg3? string # 参数3
---@param arg4? string # 参数4
---@param arg5? string # 参数5
function GameAPI.eval_lua_code(code, arg1, arg2, arg3, arg4, arg5) end

--玩家组内随机一个玩家
---@param roles py.RoleGroup # 玩家组
---@return py.Role # 玩家
function GameAPI.get_random_role_in_role_group(roles) end

--玩家组内第一个玩家
---@param roles py.RoleGroup # 玩家组
---@return py.Role # 第一个玩家
function GameAPI.get_first_role_in_group(roles) end

--玩家组内最后一个玩家
---@param roles py.RoleGroup # 玩家组
---@return py.Role # 最后一个玩家
function GameAPI.get_last_role_in_group(roles) end

--遍历物品类型的单位属性
---@param item_key py.ItemKey # 物品类型
function GameAPI.iter_unit_attr_of_item_name(item_key) end

--遍历物品的单位属性
---@param item py.Item # 物品
function GameAPI.iter_unit_attr_of_item(item) end

--设置ui控件绑定公式
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param format_str string # 公式
function GameAPI.set_ui_comp_bind_format(role, comp_name, format_str) end

--设置动画移动
---@param role py.Role # 玩家
---@param comp_name string # 控件uid
---@param start_x number # 开始x
---@param start_y number # 开始y
---@param end_x number # 结束x
---@param end_y number # 结束y
---@param duration number # 持续时间
---@param ease_type? integer # 曲线类型
function GameAPI.set_ui_comp_anim_pos(role, comp_name, start_x, start_y, end_x, end_y, duration, ease_type) end

--设置动画透明度
---@param role py.Role # 玩家
---@param comp_name string # 控件uid
---@param start_alpha number # 开始alpha
---@param end_alpha number # 结束alpha
---@param duration number # 持续时间
---@param ease_type? integer # 曲线类型
function GameAPI.set_ui_comp_anim_opacity(role, comp_name, start_alpha, end_alpha, duration, ease_type) end

--设置动画缩放
---@param role py.Role # 玩家
---@param comp_name string # 控件uid
---@param start_x number # 开始x
---@param start_y number # 开始y
---@param end_x number # 结束x
---@param end_y number # 结束y
---@param duration number # 持续时间
---@param ease_type? integer # 曲线类型
function GameAPI.set_ui_comp_anim_scale(role, comp_name, start_x, start_y, end_x, end_y, duration, ease_type) end

--设置动画旋转
---@param role py.Role # 玩家
---@param comp_name string # 控件uid
---@param start_rotation number # 开始旋转
---@param end_rotation number # 结束旋转
---@param duration number # 持续时间
---@param ease_type? integer # 曲线类型
function GameAPI.set_ui_comp_anim_rotate(role, comp_name, start_rotation, end_rotation, duration, ease_type) end

--设置列表滚动到百分比位置
---@param role py.Role # 玩家
---@param comp_name string # 控件uid
---@param percent number # 百分比
function GameAPI.set_list_view_percent(role, comp_name, percent) end

--设置对象的菲涅尔效果开关
---@param log_obj py.Actor # 对象
---@param visible boolean # 开关
function GameAPI.api_set_obj_fresnel_visible(log_obj, visible) end

--设置对象的菲涅尔效果
---@param log_obj py.Actor # 对象
---@param color_r? integer # R
---@param color_g? integer # G
---@param color_b? integer # B
---@param alpha? number # alpha
---@param exp? number # exp
---@param strength? number # strength
function GameAPI.api_set_obj_fresnel_parameters(log_obj, color_r, color_g, color_b, alpha, exp, strength) end
