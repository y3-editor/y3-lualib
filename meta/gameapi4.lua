-- 此文件由 `tools/genGameAPI` 生成，请勿手动修改。
---@meta

---@class py.GameAPI
GameAPI = {}

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

--获取CURVED_PATH_3D数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.CurvedPath3D # 值
function GameAPI.get_curved_path_3d_list_value(l, i) end

--设置CURVED_PATH_3D数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.CurvedPath3D # 值
function GameAPI.set_curved_path_3d_list_value(l, i, v) end

--生成n个值为v的CURVED_PATH_3D数组
---@param n integer # 长度
---@param v? py.CurvedPath3D # 值
---@return py.List # 列表
function GameAPI.get_curved_path_3d_n_list(n, v) end

--获取INT_SAVE数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return integer # 值
function GameAPI.get_int_save_list_value(l, i) end

--设置INT_SAVE数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v integer # 值
function GameAPI.set_int_save_list_value(l, i, v) end

--生成n个值为v的INT_SAVE数组
---@param n integer # 长度
---@param v? integer # 值
---@return py.List # 列表
function GameAPI.get_int_save_n_list(n, v) end

--获取STR_SAVE数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return string # 值
function GameAPI.get_str_save_list_value(l, i) end

--设置STR_SAVE数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v string # 值
function GameAPI.set_str_save_list_value(l, i, v) end

--生成n个值为v的STR_SAVE数组
---@param n integer # 长度
---@param v? string # 值
---@return py.List # 列表
function GameAPI.get_str_save_n_list(n, v) end

--获取FLOAT_SAVE数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.Fixed # 值
function GameAPI.get_float_save_list_value(l, i) end

--设置FLOAT_SAVE数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.Fixed # 值
function GameAPI.set_float_save_list_value(l, i, v) end

--生成n个值为v的FLOAT_SAVE数组
---@param n integer # 长度
---@param v? py.Fixed # 值
---@return py.List # 列表
function GameAPI.get_float_save_n_list(n, v) end

--获取BOOL_SAVE数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return boolean # 值
function GameAPI.get_bool_save_list_value(l, i) end

--设置BOOL_SAVE数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v boolean # 值
function GameAPI.set_bool_save_list_value(l, i, v) end

--生成n个值为v的BOOL_SAVE数组
---@param n integer # 长度
---@param v? boolean # 值
---@return py.List # 列表
function GameAPI.get_bool_save_n_list(n, v) end

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

--获取TABLE_SAVE数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.Table # 值
function GameAPI.get_table_save_list_value(l, i) end

--设置TABLE_SAVE数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.Table # 值
function GameAPI.set_table_save_list_value(l, i, v) end

--生成n个值为v的TABLE_SAVE数组
---@param n integer # 长度
---@param v? py.Table # 值
---@return py.List # 列表
function GameAPI.get_table_save_n_list(n, v) end

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

--获取GLOBAL_ARCHIVE_SLOT数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return string # 值
function GameAPI.get_global_archive_slot_list_value(l, i) end

--设置GLOBAL_ARCHIVE_SLOT数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v string # 值
function GameAPI.set_global_archive_slot_list_value(l, i, v) end

--生成n个值为v的GLOBAL_ARCHIVE_SLOT数组
---@param n integer # 长度
---@param v? string # 值
---@return py.List # 列表
function GameAPI.get_global_archive_slot_n_list(n, v) end

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

--获取UI_MODEL_CAMERA_MOD数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return integer # 值
function GameAPI.get_ui_model_camera_mod_list_value(l, i) end

--设置UI_MODEL_CAMERA_MOD数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v integer # 值
function GameAPI.set_ui_model_camera_mod_list_value(l, i, v) end

--生成n个值为v的UI_MODEL_CAMERA_MOD数组
---@param n integer # 长度
---@param v? integer # 值
---@return py.List # 列表
function GameAPI.get_ui_model_camera_mod_n_list(n, v) end

--获取UI_BTN_STATUS数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return integer # 值
function GameAPI.get_ui_btn_status_list_value(l, i) end

--设置UI_BTN_STATUS数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v integer # 值
function GameAPI.set_ui_btn_status_list_value(l, i, v) end

--生成n个值为v的UI_BTN_STATUS数组
---@param n integer # 长度
---@param v? integer # 值
---@return py.List # 列表
function GameAPI.get_ui_btn_status_n_list(n, v) end

--获取UI_SCROLLVIEW_TYPE数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return integer # 值
function GameAPI.get_ui_scrollview_type_list_value(l, i) end

--设置UI_SCROLLVIEW_TYPE数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v integer # 值
function GameAPI.set_ui_scrollview_type_list_value(l, i, v) end

--生成n个值为v的UI_SCROLLVIEW_TYPE数组
---@param n integer # 长度
---@param v? integer # 值
---@return py.List # 列表
function GameAPI.get_ui_scrollview_type_n_list(n, v) end

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

--预设库 添加UI_MODEL_CAMERA_MOD键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_ui_model_camera_mod_kv(item_key, key, value) end

--预设库 添加UI_BTN_STATUS键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_ui_btn_status_kv(item_key, key, value) end

--预设库 添加UI_SCROLLVIEW_TYPE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_ui_scrollview_type_kv(item_key, key, value) end

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

--预设库 添加JUMP_WORD_TRACK键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_jump_word_track_kv(item_key, key, value) end

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

--预设库 添加CURVED_PATH_3D键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_curved_path_3d_kv(item_key, key, value) end

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

--预设库 添加UI_MODEL_CAMERA_MOD键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_ui_model_camera_mod_kv(item_key, key, value) end

--预设库 添加UI_BTN_STATUS键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_ui_btn_status_kv(item_key, key, value) end

--预设库 添加UI_SCROLLVIEW_TYPE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_ui_scrollview_type_kv(item_key, key, value) end

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

--预设库 添加JUMP_WORD_TRACK键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_jump_word_track_kv(item_key, key, value) end

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

--预设库 添加CURVED_PATH_3D键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_curved_path_3d_kv(item_key, key, value) end

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

--预设库 添加UI_MODEL_CAMERA_MOD键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_ui_model_camera_mod_kv(item_key, key, value) end

--预设库 添加UI_BTN_STATUS键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_ui_btn_status_kv(item_key, key, value) end

--预设库 添加UI_SCROLLVIEW_TYPE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_ui_scrollview_type_kv(item_key, key, value) end

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

--预设库 添加JUMP_WORD_TRACK键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_jump_word_track_kv(item_key, key, value) end

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

--预设库 添加CURVED_PATH_3D键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_curved_path_3d_kv(item_key, key, value) end

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

--获取物品类型的购买所需资源
---@param item_no py.ItemKey # 物品物编
---@param role_res_key py.RoleResKey # 玩家属性
---@return integer # 资源数量
function GameAPI.api_get_item_key_res_cnt(item_no, role_res_key) end

--获取物品类型的实数属性
---@param item_no py.ItemKey # 物编编号
---@param attr_key string # 物品类型实数属性key
---@return py.Fixed # 实数属性值
function GameAPI.api_get_item_type_float_attr(item_no, attr_key) end

--获取物品类型的整数属性
---@param item_no py.ItemKey # 物编编号
---@param attr_key string # 物品整数属性key
---@return integer # 整数属性值
function GameAPI.api_get_item_type_int_attr(item_no, attr_key) end

--添加物品到物品组
---@param item_group py.Item # 物品
---@param item py.ItemGroup # 物品组
function GameAPI.api_add_item_to_group(item_group, item) end

--删除物品组中某个物品
---@param item_group py.ItemGroup # 物品组
---@param item py.Item # 物品
function GameAPI.api_remove_item_in_group(item_group, item) end

--判断物品是否在物品组
---@param item py.Item # 物品
---@param item_group py.ItemGroup # 物品组
---@return boolean # 是否在物品组
function GameAPI.api_judge_item_in_group(item, item_group) end

--物品组内随机一个单位
---@param item_group py.ItemGroup # 物品组
---@return py.Item # 物品
function GameAPI.api_get_random_item_in_item_group(item_group) end

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

--执行Lua代码
---@param code string # 字符串
---@param arg1? string # 参数1
---@param arg2? string # 参数2
---@param arg3? string # 参数3
---@param arg4? string # 参数4
---@param arg5? string # 参数5
function GameAPI.eval_lua_code(code, arg1, arg2, arg3, arg4, arg5) end

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
---@param refresh_interval? py.Fixed # 间隔
---@param near_offset? py.Fixed # 跟随距离
---@param far_offset? py.Fixed # 重新跟随距离
---@return py.UnitCommand # 单位命令
function GameAPI.create_unit_command_follow(target, refresh_interval, near_offset, far_offset) end

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

--设置链接特效
---@param sfx_entity py.LinkSfx # 特效
---@param role py.Role # 玩家
---@param b_visible boolean # 开关
function GameAPI.enable_link_sfx_visible(sfx_entity, role, b_visible) end

--设置特效
---@param sfx_entity py.Sfx # 特效
---@param role py.Role # 玩家
---@param b_visible boolean # 开关
function GameAPI.enable_sfx_visible(sfx_entity, role, b_visible) end

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

--设置计时器剩余次数
---@param timer_id py.Timer # 计时器编号
---@param count integer # 剩余次数
function GameAPI.timer_set_left_count(timer_id, count) end

--设置计时器剩余时间
---@param timer_id py.Timer # 计时器编号
---@param time number # 剩余时间
function GameAPI.timer_set_left_time(timer_id, time) end

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
---@return py.Fixed # 时间
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

--结束玩家游戏
---@param role py.Role # 玩家
---@param result string # 战斗结果
---@param comp_uid string # 控件uid
---@param send? boolean # 是否上传玩家排行榜分数
---@param score? integer # 排行榜分数
---@param accumulate? boolean # 是否累积计算分数
function GameAPI.set_melee_result_by_role_2(role, result, comp_uid, send, score, accumulate) end

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
---@param level_id_str py.Map # 关卡ID
function GameAPI.request_switch_level(level_id_str) end

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

--启用/禁用垂直同步
---@param enable boolean # 开启
function GameAPI.api_set_v_sync(enable) end

--设置玩家镜头模式
---@param role py.Role # 玩家
---@param cam_mod py.CameraMode # 镜头模式
---@param ortho_scale? number # 正交缩放
function GameAPI.api_set_role_camera_mode(role, cam_mod, ortho_scale) end

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
---@param is_follow boolean # 是否跟随
---@param offset_x? number # 偏移x
---@param offset_y? number # 偏移y
function GameAPI.set_ui_comp_follow_mouse(role, comp_name, is_follow, offset_x, offset_y) end

--获得坐标是否在控件内
---@param role py.Role # 玩家
---@param x number # x
---@param y number # y
---@param comp_name string # 控件uid
---@return boolean # 是否在其中
function GameAPI.pos_in_comp_box(role, x, y, comp_name) end

--设置模型控件的镜头模式
---@param role py.Role # 玩家
---@param comp_uid string # 控件uid
---@param camera_mod integer # 镜头模式
function GameAPI.set_model_comp_camera_mod(role, comp_uid, camera_mod) end

--设置不同状态下的按钮文本
---@param role py.Role # 玩家
---@param comp_uid string # 控件uid
---@param btn_status integer # 按钮状态
---@param btn_text string # 文本
function GameAPI.set_ui_btn_status_string(role, comp_uid, btn_status, btn_text) end

--设置不同状态下的按钮图片
---@param role py.Role # 玩家
---@param comp_uid string # 控件uid
---@param btn_status integer # 按钮状态
---@param btn_image integer # 图片
function GameAPI.set_ui_btn_status_image(role, comp_uid, btn_status, btn_image) end

--设置列表控件的布局方式
---@param role py.Role # 玩家
---@param comp_uid string # 控件uid
---@param scrollview_type integer # 布局方式
function GameAPI.set_ui_scrollview_type(role, comp_uid, scrollview_type) end

--设置列表控件的尺寸是否跟随子控件变化
---@param role py.Role # 玩家
---@param comp_uid string # 控件uid
---@param flag boolean # 布尔值
function GameAPI.set_ui_scrollview_size_change_according_children(role, comp_uid, flag) end

--设置图片颜色
---@param role py.Role # 玩家
---@param comp_uid string # 控件名
---@param r number # R
---@param g number # G
---@param b number # B
---@param a number # A
function GameAPI.set_ui_image_color(role, comp_uid, r, g, b, a) end

--界面-获取控件的真实长度
---@param role py.Role # 玩家
---@param comp_uid string # 控件名
function GameAPI.get_role_ui_comp_real_width(role, comp_uid) end

--界面-获取控件的真实高度
---@param role py.Role # 玩家
---@param comp_uid string # 控件名
function GameAPI.get_role_ui_comp_real_height(role, comp_uid) end

--界面-获取玩家鼠标真实x坐标
---@param role py.Role # 玩家
function GameAPI.get_role_real_mouse_x(role) end

--界面-获取玩家鼠标真实y坐标
---@param role py.Role # 玩家
function GameAPI.get_role_real_mouse_y(role) end

--设置当前聊天框控件
---@param role py.Role # 玩家
---@param comp_uid string # 聊天框id
function GameAPI.set_cur_chatbox(role, comp_uid) end

--界面组件是否存在
---@param ui_comp string # 界面组件名称
---@return boolean # 是否存在
function GameAPI.ui_comp_is_exist(ui_comp) end

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
---@param model_id py.ModelKey # 模型id
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
---@return py.Fixed # x
function GameAPI.get_ui_comp_pos_x(comp_name) end

--获取当前玩家控件相对位置y
---@param comp_name string # 控件名
---@return py.Fixed # y
function GameAPI.get_ui_comp_pos_y(comp_name) end

--获取当前玩家控件绝对位置x
---@param comp_name string # 控件名
---@return py.Fixed # x
function GameAPI.get_ui_comp_world_pos_x(comp_name) end

--获取当前玩家控件绝对位置y
---@param comp_name string # 控件名
---@return py.Fixed # y
function GameAPI.get_ui_comp_world_pos_y(comp_name) end

--获取当前玩家控件相对旋转
---@param comp_name string # 控件名
---@return py.Fixed # rotation
function GameAPI.get_ui_comp_rotation(comp_name) end

--获取当前玩家控件绝对旋转
---@param comp_name string # 控件名
---@return py.Fixed # rotation
function GameAPI.get_ui_comp_world_rotation(comp_name) end

--获取当前玩家控件相对缩放x
---@param comp_name string # 控件名
---@return py.Fixed # scale_x
function GameAPI.get_ui_comp_scale_x(comp_name) end

--获取当前玩家控件相对缩放y
---@param comp_name string # 控件名
---@return py.Fixed # scale_y
function GameAPI.get_ui_comp_scale_y(comp_name) end

--获取当前玩家控件绝对缩放x
---@param comp_name string # 控件名
---@return py.Fixed # scale_x
function GameAPI.get_ui_comp_world_scale_x(comp_name) end

--获取当前玩家控件绝对缩放y
---@param comp_name string # 控件名
---@return py.Fixed # scale_y
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

--设置ui按钮是否开启多态
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param is_open boolean # 是否开启
function GameAPI.set_ui_comp_bar_status(role, comp_name, is_open) end

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

--解绑绑定控件
---@param role py.Role # 玩家
---@param comp_name string # 控件uid
function GameAPI.unbind_ui_comp(role, comp_name) end

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

--删除界面控件
---@param role py.Role # 玩家
---@param comp_name string # 控件uid
function GameAPI.del_ui_comp(role, comp_name) end

--开启字体大小跟随内容自适应
---@param role py.Role # 玩家
---@param comp_name string # 控件uid
---@param is_open boolean # 开启/关闭
function GameAPI.set_ui_comp_text_adaptive(role, comp_name, is_open) end

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

--删除界面预制实例
---@param ui_prefab_ins string # 控件名
function GameAPI.del_ui_prefab(ui_prefab_ins) end

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

--设置聊天控件的频道为同盟或者所有人
---@param role py.Role # 玩家
---@param comp_name string # 控件uid
---@param is_ally boolean # 是否为同盟
function GameAPI.set_ui_comp_chat_channel(role, comp_name, is_ally) end

--设置界面控件锚点
---@param role py.Role # 玩家
---@param comp_name string # 控件uid
---@param x number # x
---@param y number # y
function GameAPI.set_ui_comp_anchor(role, comp_name, x, y) end

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

--设置ui控件绑定公式
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param format_str string # 公式
function GameAPI.set_ui_comp_bind_format(role, comp_name, format_str) end

--设置列表滚动到百分比位置
---@param role py.Role # 玩家
---@param comp_name string # 控件uid
---@param percent number # 百分比
function GameAPI.set_list_view_percent(role, comp_name, percent) end

--获得玩家的界面模块实例
---@param role py.Role # 玩家
---@param uid string # 界面模块实例uid
---@return py.UIPrefabIns # 界面模块实例
function GameAPI.get_ui_prefab_ins(role, uid) end

--获得界面控件所属的界面模块实例(如果是的话)
---@param role py.Role # 玩家
---@param comp_name string # 控件uid
---@return py.UIPrefabIns # 界面预制体实例
function GameAPI.get_ui_comp_prefab(role, comp_name) end

--设置字体大小跟随内容自适应最小值(需要重新设置文本生效)
---@param role py.Role # 玩家
---@param min_value integer # 最小值
function GameAPI.set_ui_comp_text_adaptive_min_size(role, min_value) end

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

--创建新单位物编
---@param old_entity_no py.UnitKey # 单位物编
---@return py.UnitKey # 单位物编key
function GameAPI.create_unit_editor_data(old_entity_no) end

--设置相机透视射线的焦点单位
---@param role py.Role # 所属玩家
---@param unit py.Unit # 单位
function GameAPI.set_camera_perspective_ray_unit(role, unit) end

--create_spine
---@param ientity py.Unit # ientity
---@param spine string # spine
---@param vertical? boolean # vertical
---@param rate? number # rate
function GameAPI.create_spine(ientity, spine, vertical, rate) end

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

--获取指定对象类型的物编数据
---@param data_type string # 对象类型
---@param key integer # 物编key
---@return py.Dict # 物编数据
function GameAPI.api_get_editor_type_data(data_type, key) end

--设置指定对象类型的物编数据
---@param data_type string # 对象类型
---@param key integer # 物编key
---@param data py.Dict # 物编数据
function GameAPI.api_set_editor_type_data(data_type, key, data) end

--获取COLLIDER所属的刚体
---@param collider py.Collider # Collider
---@return py.RigidBody # Body
function GameAPI.api_get_collider_body(collider) end

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
---@return integer # mask
function GameAPI.api_get_collider_collision_category(collider) end

--获得碰撞器的目标碰撞类别
---@param collider py.Collider # 碰撞器
---@return integer # mask
function GameAPI.api_get_collider_collide_with_mask(collider) end

--设置碰撞器的自身碰撞类别
---@param collider py.Collider # 碰撞器
---@param mask integer # mask
function GameAPI.api_set_collider_collision_category(collider, mask) end

--获得碰撞器的目标碰撞类别
---@param collider py.Collider # 碰撞器
---@param mask integer # mask
function GameAPI.api_set_collider_collide_with_mask(collider, mask) end

--根据jid获取joint
---@param jid integer # joint ID
---@return py.Joint # Joint
function GameAPI.api_get_joint_by_bid(jid) end

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

--根据名称获取逻辑物理组件中的rigidbody
---@param entity py.PhysicsEntity # 物理组件
---@param name string # 名称
---@return py.RigidBody # RigidBody
function GameAPI.api_get_rigid_body_in_physics_entity(entity, name) end

--获取单位或者物理组件的位置
---@param unit py.Actor # 单位或物理组件
---@return py.FVector3 # Position
function GameAPI.api_get_unit_or_physics_entity_pos(unit) end

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
---@param entity py.Actor # 物理组件
---@param is_visible boolean # 是否可见
function GameAPI.api_set_physics_entity_activated_and_visible(entity, is_visible) end

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
---@param physics_entity py.Actor # 逻辑物理组件
function GameAPI.api_del_physics_entity(physics_entity) end

--逻辑物理组件是否存在
---@param entity? py.PhysicsEntity # 逻辑物理组件
---@return boolean # 布尔值
function GameAPI.api_physics_entity_is_exist(entity) end

--逻辑物理组件中指定刚体的模型播放动画
---@param entity py.PhysicsEntity # 物理组件
---@param body py.RigidBody # 刚体
---@param anim_name string # 动画名称
---@param loop? boolean # 是否循环
---@param play_speed? py.Fixed # 速度
function GameAPI.api_physics_play_animation(entity, body, anim_name, loop, play_speed) end

--获得逻辑物理组件的状态
---@param entity py.PhysicsEntity # 物理组件
---@return py.PhysicsEntityState # 状态
function GameAPI.api_get_physics_entity_state(entity) end

--设置逻辑物理组件状态
---@param entity py.PhysicsEntity # 物理组件
---@param state py.PhysicsEntityState # 状态
function GameAPI.api_set_entity_state(entity, state) end

--设置逻辑物理组件的激活状态
---@param entity py.PhysicsEntity # 物理组件
---@param is_active boolean # 激活状态
---@param visible? boolean # 可见性
function GameAPI.api_set_entity_active(entity, is_active, visible) end

--判断逻辑物理组件是激活状态
---@param entity py.PhysicsEntity # 物理组件
---@return boolean # 激活状态
function GameAPI.api_is_physics_entity_active(entity) end

--判断逻辑物理组件是关闭状态
---@param entity py.PhysicsEntity # 物理组件
---@return boolean # 关闭状态
function GameAPI.api_is_physics_entity_deactive(entity) end

--根据id获得逻辑物理组件
---@param entity_id py.Fixed # id
---@return py.PhysicsEntity # 逻辑物理组件
function GameAPI.api_get_physics_entity(entity_id) end

--设置重力加速度
---@param gravity py.FVector3 # 重力加速度
function GameAPI.api_set_gravity(gravity) end

--创建特效到逻辑物理组件
---@param entity py.PhysicsEntity # 逻辑物理组件
---@param body_name string # 刚体名称
---@param sfx_id py.Fixed # 特效ID
---@param b_follow_rotate? boolean # 是否跟随旋转
---@param b_follow_scale? boolean # 是否跟随缩放
---@param position? py.Vector3 # 偏移
---@param scale? py.Fixed # 缩放
---@param rotation? py.Vector3 # 旋转
---@param duration? py.Fixed # 持续时间
---@param immediately? boolean # 是否播放完移除
---@return py.Sfx # 特效
function GameAPI.api_create_sfx_on_rigid(entity, body_name, sfx_id, b_follow_rotate, b_follow_scale, position, scale, rotation, duration, immediately) end

--获取逻辑物理组件类型
---@param entity py.PhysicsEntity # 逻辑物理组件
---@return integer # 类型
function GameAPI.api_get_physics_entity_type(entity) end

--销毁逻辑物理组件
---@param entity py.PhysicsEntity # 逻辑物理组件
function GameAPI.api_destroy_physics_entity(entity) end

--设置逻辑物理组件旋转（欧拉角）
---@param entity py.PhysicsEntity # 逻辑物理组件
---@param angle_x py.Fixed # X
---@param angle_y py.Fixed # Y
---@param angle_z py.Fixed # Z
function GameAPI.api_physics_entity_set_orientation(entity, angle_x, angle_y, angle_z) end

--逻辑物理组件是否有指定tag
---@param entity py.PhysicsEntity # 逻辑物理组件
---@param tag string # tag
---@return boolean # 布尔值
function GameAPI.api_physics_entity_has_tag(entity, tag) end

--逻辑物理组件添加tag
---@param entity py.PhysicsEntity # 逻辑物理组件
---@param tag string # tag
function GameAPI.api_physics_entity_add_tag(entity, tag) end

--逻辑物理组件删除tag
---@param entity py.PhysicsEntity # 逻辑物理组件
---@param tag string # tag
function GameAPI.api_physics_entity_remove_tag(entity, tag) end

--获取单位的rigidBody
---@param unit py.Unit # 单位
---@return py.RigidBody # RigidBody
function GameAPI.api_get_rigid_body_in_unit(unit) end

--设置物理主控单位
---@param unit py.Unit # 单位
---@param ragdoll_collide? boolean # Ragdoll是否碰撞
function GameAPI.set_physics_ctrl_unit(unit, ragdoll_collide) end

--获取物理主控单位
---@param role py.Role # 玩家
---@return py.Unit # 单位
function GameAPI.get_physics_ctrl_unit(role) end

--设置主控单位可见性visual
---@param unit py.Unit # 单位
---@param is_visible boolean # 可见性
---@param only_self? boolean # 仅自己生效
---@param only_self_friend? boolean # 仅自己和友军生效
---@param only_enemy? boolean # 仅对敌军生效
function GameAPI.api_set_cc_visibility(unit, is_visible, only_self, only_self_friend, only_enemy) end

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

--让单位lookat镜头
---@param unit py.Unit # 单位
function GameAPI.cc_look_at_camera(unit) end

--让单位lookat目标单位
---@param unit py.Unit # 单位
---@param other_unit py.Unit # 单位
function GameAPI.cc_look_at_other_unit(unit, other_unit) end

--取消单位lookat
---@param unit py.Unit # 单位
function GameAPI.cc_cancel_look_at(unit) end

--获取单位周围的随机单位
---@param unit py.Unit # 单位
---@param radius py.Fixed # 距离
---@return py.Unit # 随机单位
function GameAPI.cc_get_random_unit_around(unit, radius) end

--动画状态机状态判断
---@param state1 py.CcAsmState # 动画机状态
---@param state2 py.CcAsmState # 动画机状态
---@return boolean # 是否相等
function GameAPI.api_check_asm_state(state1, state2) end

--获取单位碰撞盒里最近的抓取单位（测试用）
---@param unit py.Unit # 单位
---@return py.Unit # 距离最近的单位
function GameAPI.api_get_grab_character(unit) end

--抓取技能
---@param source py.Unit # 施法单位
---@param target py.Unit # 目标单位
function GameAPI.api_grab(source, target) end

--判断 - 是否可以施放暴揍技能
---@param source py.Unit # 施法单位
---@param target py.Unit # 目标单位
---@param bind string # 绑点名称
---@return boolean # 是否可以施放
function GameAPI.check_catch_other_character(source, target, bind) end

--暴揍技能
---@param source py.Unit # 施法单位
---@param target py.Unit # 目标单位
---@param state integer # 暴揍动作
---@param duration py.Fixed # 持续时间
---@param bind string # 绑点名称
function GameAPI.api_physics_catch(source, target, state, duration, bind) end

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
---@param unit py.Unit # 施法单位
function GameAPI.api_physics_throw(unit) end

--拾取物品
---@param unit py.Unit # 施法单位
function GameAPI.api_physics_pick_up(unit) end

--拾取指定物品
---@param unit py.Unit # 单位
---@param item py.Unit # 物品
function GameAPI.api_physics_pick_up_item(unit, item) end

--单位丢弃物理道具
---@param unit py.Unit # 单位
function GameAPI.api_physics_drop(unit) end
