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

--添加CURVED_PATH_3D键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.CurvedPath3D # value
function GameAPI.add_curved_path_3d_kv(kvbase, key, item) end

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

--判断是否存在UI_ANIM键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_ui_anim(kvbase, key) end

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

--获取BOOLEAN键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return boolean # 键值
function GameAPI.get_kv_pair_value_boolean(kvbase, key) end

--获取INTEGER键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_kv_pair_value_integer(kvbase, key) end

--获取FLOAT键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.Fixed # 键值
function GameAPI.get_kv_pair_value_float(kvbase, key) end

--获取STRING键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_kv_pair_value_string(kvbase, key) end

--获取UI_COMP键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_kv_pair_value_ui_comp(kvbase, key) end

--获取UI_COMP_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_kv_pair_value_ui_comp_type(kvbase, key) end

--获取UI_COMP_EVENT_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_kv_pair_value_ui_comp_event_type(kvbase, key) end

--获取UI_COMP_ATTR键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_kv_pair_value_ui_comp_attr(kvbase, key) end

--获取UI_COMP_ALIGN_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_kv_pair_value_ui_comp_align_type(kvbase, key) end

--获取UI_PREFAB键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_kv_pair_value_ui_prefab(kvbase, key) end

--获取UI_PREFAB_INSTANCE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.UIPrefabIns # 键值
function GameAPI.get_kv_pair_value_ui_prefab_instance(kvbase, key) end

--获取UI_PREFAB_INS_UID键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_kv_pair_value_ui_prefab_ins_uid(kvbase, key) end

--获取UI_DIRECTION键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_kv_pair_value_ui_direction(kvbase, key) end

--获取UI_MODEL_CAMERA_MOD键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_kv_pair_value_ui_model_camera_mod(kvbase, key) end

--获取UI_BTN_STATUS键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_kv_pair_value_ui_btn_status(kvbase, key) end

--获取UI_SCROLLVIEW_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_kv_pair_value_ui_scrollview_type(kvbase, key) end

--获取UI_ANIM键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.UIAnimKey # 键值
function GameAPI.get_kv_pair_value_ui_anim(kvbase, key) end

--获取UI_ANIM_CURVE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_kv_pair_value_ui_anim_curve(kvbase, key) end

--获取AUDIO_CHANNEL键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_kv_pair_value_audio_channel(kvbase, key) end

--获取UNIT_ENTITY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.Unit # 键值
function GameAPI.get_kv_pair_value_unit_entity(kvbase, key) end

--获取UNIT_GROUP键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.UnitGroup # 键值
function GameAPI.get_kv_pair_value_unit_group(kvbase, key) end

--获取UNIT_NAME键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.UnitKey # 键值
function GameAPI.get_kv_pair_value_unit_name(kvbase, key) end

--获取UNIT_NAME_POOL键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.UnitKeyPool # 键值
function GameAPI.get_kv_pair_value_unit_name_pool(kvbase, key) end

--获取UNIT_WRITE_ATTRIBUTE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_kv_pair_value_unit_write_attribute(kvbase, key) end

--获取ATTR_ELEMENT键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_kv_pair_value_attr_element(kvbase, key) end

--获取ATTR_ELEMENT_READ键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_kv_pair_value_attr_element_read(kvbase, key) end

--获取MOVER_ENTITY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.Mover # 键值
function GameAPI.get_kv_pair_value_mover_entity(kvbase, key) end

--获取IMAGE_QUALITY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_kv_pair_value_image_quality(kvbase, key) end

--获取WINDOW_TYPE_SETTING键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_kv_pair_value_window_type_setting(kvbase, key) end

--获取ITEM_ENTITY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.Item # 键值
function GameAPI.get_kv_pair_value_item_entity(kvbase, key) end

--获取ITEM_GROUP键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.ItemGroup # 键值
function GameAPI.get_kv_pair_value_item_group(kvbase, key) end

--获取ITEM_NAME键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.ItemKey # 键值
function GameAPI.get_kv_pair_value_item_name(kvbase, key) end

--获取ABILITY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.Ability # 键值
function GameAPI.get_kv_pair_value_ability(kvbase, key) end

--获取ABILITY_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_kv_pair_value_ability_type(kvbase, key) end

--获取ABILITY_CAST_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_kv_pair_value_ability_cast_type(kvbase, key) end

--获取ABILITY_NAME键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.AbilityKey # 键值
function GameAPI.get_kv_pair_value_ability_name(kvbase, key) end

--获取SKILL_POINTER_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_kv_pair_value_skill_pointer_type(kvbase, key) end

--获取MODIFIER_ENTITY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.ModifierEntity # 键值
function GameAPI.get_kv_pair_value_modifier_entity(kvbase, key) end

--获取MODIFIER_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.ModifierType # 键值
function GameAPI.get_kv_pair_value_modifier_type(kvbase, key) end

--获取MODIFIER_EFFECT_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.ModifierEffectType # 键值
function GameAPI.get_kv_pair_value_modifier_effect_type(kvbase, key) end

--获取MODIFIER键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.ModifierKey # 键值
function GameAPI.get_kv_pair_value_modifier(kvbase, key) end

--获取PROJECTILE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.ProjectileKey # 键值
function GameAPI.get_kv_pair_value_projectile(kvbase, key) end

--获取PROJECTILE_ENTITY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.ProjectileEntity # 键值
function GameAPI.get_kv_pair_value_projectile_entity(kvbase, key) end

--获取PROJECTILE_GROUP键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.ProjectileGroup # 键值
function GameAPI.get_kv_pair_value_projectile_group(kvbase, key) end

--获取DESTRUCTIBLE_ENTITY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.Destructible # 键值
function GameAPI.get_kv_pair_value_destructible_entity(kvbase, key) end

--获取DESTRUCTIBLE_NAME键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.DestructibleKey # 键值
function GameAPI.get_kv_pair_value_destructible_name(kvbase, key) end

--获取SOUND_ENTITY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.SoundEntity # 键值
function GameAPI.get_kv_pair_value_sound_entity(kvbase, key) end

--获取AUDIO_KEY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.AudioKey # 键值
function GameAPI.get_kv_pair_value_audio_key(kvbase, key) end

--获取GAME_MODE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.GameMode # 键值
function GameAPI.get_kv_pair_value_game_mode(kvbase, key) end

--获取PLAYER键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.Role # 键值
function GameAPI.get_kv_pair_value_player(kvbase, key) end

--获取PLAYER_GROUP键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.RoleGroup # 键值
function GameAPI.get_kv_pair_value_player_group(kvbase, key) end

--获取ROLE_RES_KEY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.RoleResKey # 键值
function GameAPI.get_kv_pair_value_role_res_key(kvbase, key) end

--获取ROLE_STATUS键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.RoleStatus # 键值
function GameAPI.get_kv_pair_value_role_status(kvbase, key) end

--获取ROLE_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.RoleType # 键值
function GameAPI.get_kv_pair_value_role_type(kvbase, key) end

--获取ROLE_RELATION键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.RoleRelation # 键值
function GameAPI.get_kv_pair_value_role_relation(kvbase, key) end

--获取TEAM键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.Camp # 键值
function GameAPI.get_kv_pair_value_team(kvbase, key) end

--获取POINT键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.FPoint # 键值
function GameAPI.get_kv_pair_value_point(kvbase, key) end

--获取VECTOR3键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.FVector3 # 键值
function GameAPI.get_kv_pair_value_vector3(kvbase, key) end

--获取ROTATION键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.FRotation # 键值
function GameAPI.get_kv_pair_value_rotation(kvbase, key) end

--获取POINT_LIST键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.Road # 键值
function GameAPI.get_kv_pair_value_point_list(kvbase, key) end

--获取RECTANGLE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.RecArea # 键值
function GameAPI.get_kv_pair_value_rectangle(kvbase, key) end

--获取ROUND_AREA键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.CirArea # 键值
function GameAPI.get_kv_pair_value_round_area(kvbase, key) end

--获取POLYGON键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.PolyArea # 键值
function GameAPI.get_kv_pair_value_polygon(kvbase, key) end

--获取CAMERA键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.Camera # 键值
function GameAPI.get_kv_pair_value_camera(kvbase, key) end

--获取CAMLINE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.CamlineID # 键值
function GameAPI.get_kv_pair_value_camline(kvbase, key) end

--获取POINT_LIGHT键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.PointLight # 键值
function GameAPI.get_kv_pair_value_point_light(kvbase, key) end

--获取SPOT_LIGHT键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.SpotLight # 键值
function GameAPI.get_kv_pair_value_spot_light(kvbase, key) end

--获取FOG键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.Fog # 键值
function GameAPI.get_kv_pair_value_fog(kvbase, key) end

--获取SCENE_SOUND键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.SceneSound # 键值
function GameAPI.get_kv_pair_value_scene_sound(kvbase, key) end

--获取MODEL键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.ModelKey # 键值
function GameAPI.get_kv_pair_value_model(kvbase, key) end

--获取SFX_ENTITY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.Sfx # 键值
function GameAPI.get_kv_pair_value_sfx_entity(kvbase, key) end

--获取SFX_KEY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.SfxKey # 键值
function GameAPI.get_kv_pair_value_sfx_key(kvbase, key) end

--获取LINK_SFX_ENTITY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.LinkSfx # 键值
function GameAPI.get_kv_pair_value_link_sfx_entity(kvbase, key) end

--获取LINK_SFX_KEY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.LinkSfxKey # 键值
function GameAPI.get_kv_pair_value_link_sfx_key(kvbase, key) end

--获取CURSOR_KEY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.CursorKey # 键值
function GameAPI.get_kv_pair_value_cursor_key(kvbase, key) end

--获取ANGLE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.Fixed # 键值
function GameAPI.get_kv_pair_value_angle(kvbase, key) end

--获取TEXTURE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.Texture # 键值
function GameAPI.get_kv_pair_value_texture(kvbase, key) end

--获取SEQUENCE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.Sequence # 键值
function GameAPI.get_kv_pair_value_sequence(kvbase, key) end

--获取PHYSICS_OBJECT键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.PhysicsObject # 键值
function GameAPI.get_kv_pair_value_physics_object(kvbase, key) end

--获取PHYSICS_ENTITY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.PhysicsEntity # 键值
function GameAPI.get_kv_pair_value_physics_entity(kvbase, key) end

--获取PHYSICS_OBJECT_KEY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.PhysicsObjectKey # 键值
function GameAPI.get_kv_pair_value_physics_object_key(kvbase, key) end

--获取PHYSICS_ENTITY_KEY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.PhysicsEntityKey # 键值
function GameAPI.get_kv_pair_value_physics_entity_key(kvbase, key) end

--获取RIGID_BODY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.RigidBody # 键值
function GameAPI.get_kv_pair_value_rigid_body(kvbase, key) end

--获取RIGID_BODY_GROUP键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.RigidBodyGroup # 键值
function GameAPI.get_kv_pair_value_rigid_body_group(kvbase, key) end

--获取COLLIDER键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.Collider # 键值
function GameAPI.get_kv_pair_value_collider(kvbase, key) end

--获取JOINT键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.Joint # 键值
function GameAPI.get_kv_pair_value_joint(kvbase, key) end

--获取REACTION键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.Reaction # 键值
function GameAPI.get_kv_pair_value_reaction(kvbase, key) end

--获取REACTION_GROUP键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.ReactionGroup # 键值
function GameAPI.get_kv_pair_value_reaction_group(kvbase, key) end

--获取DYNAMIC_TRIGGER_INSTANCE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.DynamicTriggerInstance # 键值
function GameAPI.get_kv_pair_value_dynamic_trigger_instance(kvbase, key) end

--获取TABLE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.Table # 键值
function GameAPI.get_kv_pair_value_table(kvbase, key) end

--获取RANDOM_POOL键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.RandomPool # 键值
function GameAPI.get_kv_pair_value_random_pool(kvbase, key) end

--获取SCENE_UI键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.SceneNode # 键值
function GameAPI.get_kv_pair_value_scene_ui(kvbase, key) end

--获取DAMAGE_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_kv_pair_value_damage_type(kvbase, key) end

--获取HARM_TEXT_TYPE_NEW键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_kv_pair_value_harm_text_type_new(kvbase, key) end

--获取FONT_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_kv_pair_value_font_type(kvbase, key) end

--获取JUMP_WORD_TRACK键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_kv_pair_value_jump_word_track(kvbase, key) end

--获取NEW_TIMER键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.Timer # 键值
function GameAPI.get_kv_pair_value_new_timer(kvbase, key) end

--获取TECH_KEY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.TechKey # 键值
function GameAPI.get_kv_pair_value_tech_key(kvbase, key) end

--获取STORE_KEY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.StoreKey # 键值
function GameAPI.get_kv_pair_value_store_key(kvbase, key) end

--获取KEYBOARD_KEY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.KeyboardKey # 键值
function GameAPI.get_kv_pair_value_keyboard_key(kvbase, key) end

--获取FUNC_KEYBOARD_KEY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.FuncKeyboardKey # 键值
function GameAPI.get_kv_pair_value_func_keyboard_key(kvbase, key) end

--获取MOUSE_KEY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.MouseKey # 键值
function GameAPI.get_kv_pair_value_mouse_key(kvbase, key) end

--获取MOUSE_WHEEL键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.MouseWheel # 键值
function GameAPI.get_kv_pair_value_mouse_wheel(kvbase, key) end

--获取POST_EFFECT键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.PostEffect # 键值
function GameAPI.get_kv_pair_value_post_effect(kvbase, key) end

--获取UNIT_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.UnitType # 键值
function GameAPI.get_kv_pair_value_unit_type(kvbase, key) end

--获取UNIT_COMMAND_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.UnitCommandType # 键值
function GameAPI.get_kv_pair_value_unit_command_type(kvbase, key) end

--获取MINI_MAP_COLOR_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.MiniMapColorType # 键值
function GameAPI.get_kv_pair_value_mini_map_color_type(kvbase, key) end

--获取UNIT_BEHAVIOR键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.UnitBehavior # 键值
function GameAPI.get_kv_pair_value_unit_behavior(kvbase, key) end

--获取CURVED_PATH键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.CurvedPath # 键值
function GameAPI.get_kv_pair_value_curved_path(kvbase, key) end

--获取CURVED_PATH_3D键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.CurvedPath3D # 键值
function GameAPI.get_kv_pair_value_curved_path_3d(kvbase, key) end

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

--获取全局触发器UI_MODEL_CAMERA_MOD非数组变量
---@param key string # 变量名称
---@return integer # 值
function GameAPI.get_trigger_variable_ui_model_camera_mod(key) end

--获取触发器UI_MODEL_CAMERA_MOD非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return integer # 值
function GameAPI.get_trigger_actor_variable_ui_model_camera_mod(actor, key) end

--获取全局触发器UI_MODEL_CAMERA_MOD数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return integer # 值
function GameAPI.get_trigger_list_variable_ui_model_camera_mod(key, index) end

--获取触发器UI_MODEL_CAMERA_MOD数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return integer # 值
function GameAPI.get_trigger_list_actor_variable_ui_model_camera_mod(actor, key, index) end

--获取全局触发器UI_MODEL_CAMERA_MOD数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_ui_model_camera_mod(key) end

--获取触发器UI_MODEL_CAMERA_MOD 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_ui_model_camera_mod(actor, key) end

--获取全局触发器UI_BTN_STATUS非数组变量
---@param key string # 变量名称
---@return integer # 值
function GameAPI.get_trigger_variable_ui_btn_status(key) end

--获取触发器UI_BTN_STATUS非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return integer # 值
function GameAPI.get_trigger_actor_variable_ui_btn_status(actor, key) end

--获取全局触发器UI_BTN_STATUS数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return integer # 值
function GameAPI.get_trigger_list_variable_ui_btn_status(key, index) end

--获取触发器UI_BTN_STATUS数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return integer # 值
function GameAPI.get_trigger_list_actor_variable_ui_btn_status(actor, key, index) end

--获取全局触发器UI_BTN_STATUS数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_ui_btn_status(key) end

--获取触发器UI_BTN_STATUS 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_ui_btn_status(actor, key) end

--获取全局触发器UI_SCROLLVIEW_TYPE非数组变量
---@param key string # 变量名称
---@return integer # 值
function GameAPI.get_trigger_variable_ui_scrollview_type(key) end

--获取触发器UI_SCROLLVIEW_TYPE非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return integer # 值
function GameAPI.get_trigger_actor_variable_ui_scrollview_type(actor, key) end

--获取全局触发器UI_SCROLLVIEW_TYPE数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return integer # 值
function GameAPI.get_trigger_list_variable_ui_scrollview_type(key, index) end

--获取触发器UI_SCROLLVIEW_TYPE数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return integer # 值
function GameAPI.get_trigger_list_actor_variable_ui_scrollview_type(actor, key, index) end

--获取全局触发器UI_SCROLLVIEW_TYPE数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_ui_scrollview_type(key) end

--获取触发器UI_SCROLLVIEW_TYPE 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_ui_scrollview_type(actor, key) end

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

--预设库 添加kv键值对
---@param prefab_conf_key string # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value string # value
function GameAPI.set_prefab_key_xxx_kv(prefab_conf_key, item_key, key, value) end

--unit添加kv键值对
---@param kvbase py.KVBase # 单位
---@param key string # 键值名称
---@param value string # value
---@param etype integer # kv_type
---@param prefab_conf_key string # 属性名称
function GameAPI.add_unit_xxx_kv(kvbase, key, value, etype, prefab_conf_key) end

--item添加kv键值对
---@param kvbase py.KVBase # 物品
---@param key string # 键值名称
---@param value string # value
---@param etype integer # kv_type
---@param prefab_conf_key string # 属性名称
function GameAPI.add_item_xxx_kv(kvbase, key, value, etype, prefab_conf_key) end

--destructible添加kv键值对
---@param kvbase py.KVBase # 可破坏物
---@param key string # 键值名称
---@param value string # value
---@param etype integer # kv_type
---@param prefab_conf_key string # 属性名称
function GameAPI.add_destructible_xxx_kv(kvbase, key, value, etype, prefab_conf_key) end

--ability添加kv键值对
---@param kvbase py.KVBase # 技能
---@param key string # 键值名称
---@param value string # value
---@param etype integer # kv_type
---@param prefab_conf_key string # 属性名称
function GameAPI.add_ability_xxx_kv(kvbase, key, value, etype, prefab_conf_key) end

--modifier添加kv键值对
---@param kvbase py.KVBase # 魔法效果
---@param key string # 键值名称
---@param value string # value
---@param etype integer # kv_type
---@param prefab_conf_key string # 属性名称
function GameAPI.add_modifier_xxx_kv(kvbase, key, value, etype, prefab_conf_key) end

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

--预设库 添加UI_CHAT_SEND_CHANNEL键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value integer # value
function GameAPI.set_prefab_key_ui_chat_send_channel_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加UI_CHAT_RECV_CHANNEL键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value integer # value
function GameAPI.set_prefab_key_ui_chat_recv_channel_kv(prefab_conf_key, item_key, key, value) end

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

--预设库 添加LOCAL_UNIT_GROUP键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.LocalUnitGroup # value
function GameAPI.set_prefab_key_local_unit_group_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加DAMAGE_ATTACK_TYPE键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value integer # value
function GameAPI.set_prefab_key_damage_attack_type_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加DAMAGE_ARMOR_TYPE键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value integer # value
function GameAPI.set_prefab_key_damage_armor_type_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加ITEM_STACK_TYPE键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.ItemStackType # value
function GameAPI.set_prefab_key_item_stack_type_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加ABILITY_RELEASE_ID键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.AbilityReleaseId # value
function GameAPI.set_prefab_key_ability_release_id_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加SLOT_TYPE键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.SlotType # value
function GameAPI.set_prefab_key_slot_type_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加UI_POINT键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.FUIPoint # value
function GameAPI.set_prefab_key_ui_point_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加ATTACH_MODEL_ENTITY键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.AttachModelEntity # value
function GameAPI.set_prefab_key_attach_model_entity_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加LIVE2D键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.Live2dKey # value
function GameAPI.set_prefab_key_live2d_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加SPINE键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.Spine # value
function GameAPI.set_prefab_key_spine_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加FORCE_ENTITY键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.Force # value
function GameAPI.set_prefab_key_force_entity_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加GOODS_KEY键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.GoodsKey # value
function GameAPI.set_prefab_key_goods_key_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加MOUSE_KEY_WITHOUT_MIDDLE键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.MouseKeyWithoutMiddle # value
function GameAPI.set_prefab_key_mouse_key_without_middle_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加MAP键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.Map # value
function GameAPI.set_prefab_key_map_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加UNIT_GROUP_COMMAND_TYPE键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.UnitGroupCommandType # value
function GameAPI.set_prefab_key_unit_group_command_type_kv(prefab_conf_key, item_key, key, value) end

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

--预设库 添加SITE_STATE键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.SITE_STATE # value
function GameAPI.set_prefab_key_site_state_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加COIN_CURRENCY键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.COIN_CURRENCY # value
function GameAPI.set_prefab_key_coin_currency_kv(prefab_conf_key, item_key, key, value) end

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

--添加UI_CHAT_SEND_CHANNEL键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? integer # value
function GameAPI.add_ui_chat_send_channel_kv(kvbase, key, item) end

--添加UI_CHAT_RECV_CHANNEL键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? integer # value
function GameAPI.add_ui_chat_recv_channel_kv(kvbase, key, item) end

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

--添加LOCAL_UNIT_GROUP键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.LocalUnitGroup # value
function GameAPI.add_local_unit_group_kv(kvbase, key, item) end

--添加DAMAGE_ATTACK_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? integer # value
function GameAPI.add_damage_attack_type_kv(kvbase, key, item) end

--添加DAMAGE_ARMOR_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? integer # value
function GameAPI.add_damage_armor_type_kv(kvbase, key, item) end

--添加ITEM_STACK_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.ItemStackType # value
function GameAPI.add_item_stack_type_kv(kvbase, key, item) end

--添加ABILITY_RELEASE_ID键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.AbilityReleaseId # value
function GameAPI.add_ability_release_id_kv(kvbase, key, item) end

--添加SLOT_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.SlotType # value
function GameAPI.add_slot_type_kv(kvbase, key, item) end

--添加UI_POINT键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.FUIPoint # value
function GameAPI.add_ui_point_kv(kvbase, key, item) end

--添加ATTACH_MODEL_ENTITY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.AttachModelEntity # value
function GameAPI.add_attach_model_entity_kv(kvbase, key, item) end

--添加LIVE2D键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.Live2dKey # value
function GameAPI.add_live2d_kv(kvbase, key, item) end

--添加SPINE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.Spine # value
function GameAPI.add_spine_kv(kvbase, key, item) end

--添加FORCE_ENTITY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.Force # value
function GameAPI.add_force_entity_kv(kvbase, key, item) end

--添加GOODS_KEY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.GoodsKey # value
function GameAPI.add_goods_key_kv(kvbase, key, item) end

--添加MOUSE_KEY_WITHOUT_MIDDLE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.MouseKeyWithoutMiddle # value
function GameAPI.add_mouse_key_without_middle_kv(kvbase, key, item) end

--添加MAP键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.Map # value
function GameAPI.add_map_kv(kvbase, key, item) end

--添加UNIT_GROUP_COMMAND_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.UnitGroupCommandType # value
function GameAPI.add_unit_group_command_type_kv(kvbase, key, item) end

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

--添加SITE_STATE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.SITE_STATE # value
function GameAPI.add_site_state_kv(kvbase, key, item) end

--添加COIN_CURRENCY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.COIN_CURRENCY # value
function GameAPI.add_coin_currency_kv(kvbase, key, item) end

--判断预设是否存在%s键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@param kv_type integer # kv_type
---@return boolean # 是否存在
function GameAPI.has_prefab_xxx_kv(prefab_type, prefab_key, key, kv_type) end

--获取值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_entity_ckv_pair_value_xxx(kvbase, key) end

--获取值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_ckv_pair_value_xxx(kvbase, key) end

--获取值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_modifier_ckv_pair_value_xxx(kvbase, key) end

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

--判断是否存在UI_CHAT_SEND_CHANNEL键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_ui_chat_send_channel(kvbase, key) end

--判断预设是否存在UI_CHAT_SEND_CHANNEL键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_ui_chat_send_channel_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在UI_CHAT_SEND_CHANNEL键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_ui_chat_send_channel_kv(prefab_key, key) end

--判断物品编号是否存在UI_CHAT_SEND_CHANNEL键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_ui_chat_send_channel_kv(prefab_key, key) end

--判断技能编号是否存在UI_CHAT_SEND_CHANNEL键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_ui_chat_send_channel_kv(prefab_key, key) end

--判断是否存在UI_CHAT_RECV_CHANNEL键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_ui_chat_recv_channel(kvbase, key) end

--判断预设是否存在UI_CHAT_RECV_CHANNEL键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_ui_chat_recv_channel_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在UI_CHAT_RECV_CHANNEL键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_ui_chat_recv_channel_kv(prefab_key, key) end

--判断物品编号是否存在UI_CHAT_RECV_CHANNEL键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_ui_chat_recv_channel_kv(prefab_key, key) end

--判断技能编号是否存在UI_CHAT_RECV_CHANNEL键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_ui_chat_recv_channel_kv(prefab_key, key) end

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

--判断是否存在LOCAL_UNIT_GROUP键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_local_unit_group(kvbase, key) end

--判断预设是否存在LOCAL_UNIT_GROUP键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_local_unit_group_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在LOCAL_UNIT_GROUP键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_local_unit_group_kv(prefab_key, key) end

--判断物品编号是否存在LOCAL_UNIT_GROUP键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_local_unit_group_kv(prefab_key, key) end

--判断技能编号是否存在LOCAL_UNIT_GROUP键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_local_unit_group_kv(prefab_key, key) end

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

--判断是否存在DAMAGE_ARMOR_TYPE键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_damage_armor_type(kvbase, key) end

--判断预设是否存在DAMAGE_ARMOR_TYPE键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_damage_armor_type_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在DAMAGE_ARMOR_TYPE键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_damage_armor_type_kv(prefab_key, key) end

--判断物品编号是否存在DAMAGE_ARMOR_TYPE键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_damage_armor_type_kv(prefab_key, key) end

--判断技能编号是否存在DAMAGE_ARMOR_TYPE键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_damage_armor_type_kv(prefab_key, key) end

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

--判断是否存在ABILITY_RELEASE_ID键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_ability_release_id(kvbase, key) end

--判断预设是否存在ABILITY_RELEASE_ID键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_ability_release_id_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在ABILITY_RELEASE_ID键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_ability_release_id_kv(prefab_key, key) end

--判断物品编号是否存在ABILITY_RELEASE_ID键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_ability_release_id_kv(prefab_key, key) end

--判断技能编号是否存在ABILITY_RELEASE_ID键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_ability_release_id_kv(prefab_key, key) end

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

--判断是否存在UI_POINT键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_ui_point(kvbase, key) end

--判断预设是否存在UI_POINT键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_ui_point_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在UI_POINT键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_ui_point_kv(prefab_key, key) end

--判断物品编号是否存在UI_POINT键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_ui_point_kv(prefab_key, key) end

--判断技能编号是否存在UI_POINT键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_ui_point_kv(prefab_key, key) end

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

--判断是否存在FORCE_ENTITY键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_force_entity(kvbase, key) end

--判断预设是否存在FORCE_ENTITY键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_force_entity_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在FORCE_ENTITY键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_force_entity_kv(prefab_key, key) end

--判断物品编号是否存在FORCE_ENTITY键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_force_entity_kv(prefab_key, key) end

--判断技能编号是否存在FORCE_ENTITY键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_force_entity_kv(prefab_key, key) end

--判断是否存在GOODS_KEY键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_goods_key(kvbase, key) end

--判断预设是否存在GOODS_KEY键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_goods_key_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在GOODS_KEY键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_goods_key_kv(prefab_key, key) end

--判断物品编号是否存在GOODS_KEY键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_goods_key_kv(prefab_key, key) end

--判断技能编号是否存在GOODS_KEY键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_goods_key_kv(prefab_key, key) end

--判断是否存在MOUSE_KEY_WITHOUT_MIDDLE键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_kv_pair_mouse_key_without_middle(kvbase, key) end

--判断预设是否存在MOUSE_KEY_WITHOUT_MIDDLE键值对
---@param prefab_type string # 预设类型
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_prefab_mouse_key_without_middle_kv(prefab_type, prefab_key, key) end

--判断单位编号是否存在MOUSE_KEY_WITHOUT_MIDDLE键值对
---@param prefab_key py.UnitKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_unit_key_mouse_key_without_middle_kv(prefab_key, key) end

--判断物品编号是否存在MOUSE_KEY_WITHOUT_MIDDLE键值对
---@param prefab_key py.ItemKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_item_key_mouse_key_without_middle_kv(prefab_key, key) end

--判断技能编号是否存在MOUSE_KEY_WITHOUT_MIDDLE键值对
---@param prefab_key py.AbilityKey # 预设编号
---@param key string # 键名称
---@return boolean # 是否存在
function GameAPI.has_ability_key_mouse_key_without_middle_kv(prefab_key, key) end

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
