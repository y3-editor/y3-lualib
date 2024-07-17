-- 此文件由 `tools/genGameAPI` 生成，请勿手动修改。
---@meta

---@class py.GameAPI
GameAPI = {}

--获取图片UI_COMP_EVENT_TYPE键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_icon_id_ui_comp_event_type_kv(icon_id, key) end

--获取逻辑物理组件类型UI_COMP_EVENT_TYPE键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_physics_entity_key_ui_comp_event_type_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型UI_COMP_ATTR键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_physics_entity_key_ui_comp_attr_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型UI_COMP_ALIGN_TYPE键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_physics_entity_key_ui_comp_align_type_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型UI_PREFAB键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_physics_entity_key_ui_prefab_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型UI_PREFAB_INSTANCE键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.UIPrefabIns # 键值
function GameAPI.get_physics_entity_key_ui_prefab_instance_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型UI_PREFAB_INS_UID键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_physics_entity_key_ui_prefab_ins_uid_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型UI_DIRECTION键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_physics_entity_key_ui_direction_kv(physics_entity_key, key) end

--获取UI_DIRECTION键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_kv_pair_value_ui_direction(kvbase, key) end

--获取单位编号UI_MODEL_CAMERA_MOD键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_unit_key_ui_model_camera_mod_kv(unit_key, key) end

--获取物品编号UI_MODEL_CAMERA_MOD键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_item_key_ui_model_camera_mod_kv(item_key, key) end

--获取技能编号UI_MODEL_CAMERA_MOD键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_ability_key_ui_model_camera_mod_kv(ability_key, key) end

--获取魔法效果特效编号UI_MODEL_CAMERA_MOD键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_modifier_key_ui_model_camera_mod_kv(modifier_key, key) end

--获取特效编号UI_MODEL_CAMERA_MOD键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_projectile_key_ui_model_camera_mod_kv(projectile_key, key) end

--获取可破坏物编号UI_MODEL_CAMERA_MOD键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_destructible_key_ui_model_camera_mod_kv(destructible_key, key) end

--获取科技编号UI_MODEL_CAMERA_MOD键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_tech_key_ui_model_camera_mod_kv(tech_key, key) end

--获取图片UI_MODEL_CAMERA_MOD键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_icon_id_ui_model_camera_mod_kv(icon_id, key) end

--获取逻辑物理组件类型UI_MODEL_CAMERA_MOD键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_physics_entity_key_ui_model_camera_mod_kv(physics_entity_key, key) end

--获取UI_MODEL_CAMERA_MOD键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_kv_pair_value_ui_model_camera_mod(kvbase, key) end

--获取单位编号UI_BTN_STATUS键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_unit_key_ui_btn_status_kv(unit_key, key) end

--获取物品编号UI_BTN_STATUS键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_item_key_ui_btn_status_kv(item_key, key) end

--获取技能编号UI_BTN_STATUS键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_ability_key_ui_btn_status_kv(ability_key, key) end

--获取魔法效果特效编号UI_BTN_STATUS键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_modifier_key_ui_btn_status_kv(modifier_key, key) end

--获取特效编号UI_BTN_STATUS键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_projectile_key_ui_btn_status_kv(projectile_key, key) end

--获取可破坏物编号UI_BTN_STATUS键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_destructible_key_ui_btn_status_kv(destructible_key, key) end

--获取科技编号UI_BTN_STATUS键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_tech_key_ui_btn_status_kv(tech_key, key) end

--获取图片UI_BTN_STATUS键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_icon_id_ui_btn_status_kv(icon_id, key) end

--获取逻辑物理组件类型UI_BTN_STATUS键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_physics_entity_key_ui_btn_status_kv(physics_entity_key, key) end

--获取UI_BTN_STATUS键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_kv_pair_value_ui_btn_status(kvbase, key) end

--获取单位编号UI_SCROLLVIEW_TYPE键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_unit_key_ui_scrollview_type_kv(unit_key, key) end

--获取物品编号UI_SCROLLVIEW_TYPE键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_item_key_ui_scrollview_type_kv(item_key, key) end

--获取技能编号UI_SCROLLVIEW_TYPE键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_ability_key_ui_scrollview_type_kv(ability_key, key) end

--获取魔法效果特效编号UI_SCROLLVIEW_TYPE键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_modifier_key_ui_scrollview_type_kv(modifier_key, key) end

--获取特效编号UI_SCROLLVIEW_TYPE键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_projectile_key_ui_scrollview_type_kv(projectile_key, key) end

--获取可破坏物编号UI_SCROLLVIEW_TYPE键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_destructible_key_ui_scrollview_type_kv(destructible_key, key) end

--获取科技编号UI_SCROLLVIEW_TYPE键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_tech_key_ui_scrollview_type_kv(tech_key, key) end

--获取图片UI_SCROLLVIEW_TYPE键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_icon_id_ui_scrollview_type_kv(icon_id, key) end

--获取逻辑物理组件类型UI_SCROLLVIEW_TYPE键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_physics_entity_key_ui_scrollview_type_kv(physics_entity_key, key) end

--获取UI_SCROLLVIEW_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_kv_pair_value_ui_scrollview_type(kvbase, key) end

--获取单位编号UI_GRIDVIEW_TYPE键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_unit_key_ui_gridview_type_kv(unit_key, key) end

--获取物品编号UI_GRIDVIEW_TYPE键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_item_key_ui_gridview_type_kv(item_key, key) end

--获取技能编号UI_GRIDVIEW_TYPE键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_ability_key_ui_gridview_type_kv(ability_key, key) end

--获取魔法效果特效编号UI_GRIDVIEW_TYPE键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_modifier_key_ui_gridview_type_kv(modifier_key, key) end

--获取特效编号UI_GRIDVIEW_TYPE键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_projectile_key_ui_gridview_type_kv(projectile_key, key) end

--获取可破坏物编号UI_GRIDVIEW_TYPE键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_destructible_key_ui_gridview_type_kv(destructible_key, key) end

--获取科技编号UI_GRIDVIEW_TYPE键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_tech_key_ui_gridview_type_kv(tech_key, key) end

--获取图片UI_GRIDVIEW_TYPE键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_icon_id_ui_gridview_type_kv(icon_id, key) end

--获取逻辑物理组件类型UI_GRIDVIEW_TYPE键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_physics_entity_key_ui_gridview_type_kv(physics_entity_key, key) end

--获取UI_GRIDVIEW_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_kv_pair_value_ui_gridview_type(kvbase, key) end

--获取单位编号UI_GRIDVIEW_BAR_TYPE键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_unit_key_ui_gridview_bar_type_kv(unit_key, key) end

--获取物品编号UI_GRIDVIEW_BAR_TYPE键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_item_key_ui_gridview_bar_type_kv(item_key, key) end

--获取技能编号UI_GRIDVIEW_BAR_TYPE键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_ability_key_ui_gridview_bar_type_kv(ability_key, key) end

--获取魔法效果特效编号UI_GRIDVIEW_BAR_TYPE键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_modifier_key_ui_gridview_bar_type_kv(modifier_key, key) end

--获取特效编号UI_GRIDVIEW_BAR_TYPE键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_projectile_key_ui_gridview_bar_type_kv(projectile_key, key) end

--获取可破坏物编号UI_GRIDVIEW_BAR_TYPE键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_destructible_key_ui_gridview_bar_type_kv(destructible_key, key) end

--获取科技编号UI_GRIDVIEW_BAR_TYPE键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_tech_key_ui_gridview_bar_type_kv(tech_key, key) end

--获取图片UI_GRIDVIEW_BAR_TYPE键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_icon_id_ui_gridview_bar_type_kv(icon_id, key) end

--获取逻辑物理组件类型UI_GRIDVIEW_BAR_TYPE键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_physics_entity_key_ui_gridview_bar_type_kv(physics_entity_key, key) end

--获取UI_GRIDVIEW_BAR_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_kv_pair_value_ui_gridview_bar_type(kvbase, key) end

--获取单位编号UI_EFFECT_CAMERA_MODE键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_unit_key_ui_effect_camera_mode_kv(unit_key, key) end

--获取物品编号UI_EFFECT_CAMERA_MODE键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_item_key_ui_effect_camera_mode_kv(item_key, key) end

--获取技能编号UI_EFFECT_CAMERA_MODE键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_ability_key_ui_effect_camera_mode_kv(ability_key, key) end

--获取魔法效果特效编号UI_EFFECT_CAMERA_MODE键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_modifier_key_ui_effect_camera_mode_kv(modifier_key, key) end

--获取特效编号UI_EFFECT_CAMERA_MODE键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_projectile_key_ui_effect_camera_mode_kv(projectile_key, key) end

--获取可破坏物编号UI_EFFECT_CAMERA_MODE键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_destructible_key_ui_effect_camera_mode_kv(destructible_key, key) end

--获取科技编号UI_EFFECT_CAMERA_MODE键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_tech_key_ui_effect_camera_mode_kv(tech_key, key) end

--获取图片UI_EFFECT_CAMERA_MODE键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_icon_id_ui_effect_camera_mode_kv(icon_id, key) end

--获取逻辑物理组件类型UI_EFFECT_CAMERA_MODE键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_physics_entity_key_ui_effect_camera_mode_kv(physics_entity_key, key) end

--获取UI_EFFECT_CAMERA_MODE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_kv_pair_value_ui_effect_camera_mode(kvbase, key) end

--获取单位编号UI_EQUIP_SLOT_USE_TYPE键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_unit_key_ui_equip_slot_use_type_kv(unit_key, key) end

--获取物品编号UI_EQUIP_SLOT_USE_TYPE键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_item_key_ui_equip_slot_use_type_kv(item_key, key) end

--获取技能编号UI_EQUIP_SLOT_USE_TYPE键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_ability_key_ui_equip_slot_use_type_kv(ability_key, key) end

--获取魔法效果特效编号UI_EQUIP_SLOT_USE_TYPE键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_modifier_key_ui_equip_slot_use_type_kv(modifier_key, key) end

--获取特效编号UI_EQUIP_SLOT_USE_TYPE键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_projectile_key_ui_equip_slot_use_type_kv(projectile_key, key) end

--获取可破坏物编号UI_EQUIP_SLOT_USE_TYPE键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_destructible_key_ui_equip_slot_use_type_kv(destructible_key, key) end

--获取科技编号UI_EQUIP_SLOT_USE_TYPE键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_tech_key_ui_equip_slot_use_type_kv(tech_key, key) end

--获取图片UI_EQUIP_SLOT_USE_TYPE键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_icon_id_ui_equip_slot_use_type_kv(icon_id, key) end

--获取逻辑物理组件类型UI_EQUIP_SLOT_USE_TYPE键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_physics_entity_key_ui_equip_slot_use_type_kv(physics_entity_key, key) end

--获取UI_EQUIP_SLOT_USE_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_kv_pair_value_ui_equip_slot_use_type(kvbase, key) end

--获取单位编号UI_EQUIP_SLOT_DRAG_TYPE键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_unit_key_ui_equip_slot_drag_type_kv(unit_key, key) end

--获取物品编号UI_EQUIP_SLOT_DRAG_TYPE键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_item_key_ui_equip_slot_drag_type_kv(item_key, key) end

--获取技能编号UI_EQUIP_SLOT_DRAG_TYPE键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_ability_key_ui_equip_slot_drag_type_kv(ability_key, key) end

--获取魔法效果特效编号UI_EQUIP_SLOT_DRAG_TYPE键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_modifier_key_ui_equip_slot_drag_type_kv(modifier_key, key) end

--获取特效编号UI_EQUIP_SLOT_DRAG_TYPE键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_projectile_key_ui_equip_slot_drag_type_kv(projectile_key, key) end

--获取可破坏物编号UI_EQUIP_SLOT_DRAG_TYPE键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_destructible_key_ui_equip_slot_drag_type_kv(destructible_key, key) end

--获取科技编号UI_EQUIP_SLOT_DRAG_TYPE键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_tech_key_ui_equip_slot_drag_type_kv(tech_key, key) end

--获取图片UI_EQUIP_SLOT_DRAG_TYPE键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_icon_id_ui_equip_slot_drag_type_kv(icon_id, key) end

--获取逻辑物理组件类型UI_EQUIP_SLOT_DRAG_TYPE键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_physics_entity_key_ui_equip_slot_drag_type_kv(physics_entity_key, key) end

--获取UI_EQUIP_SLOT_DRAG_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_kv_pair_value_ui_equip_slot_drag_type(kvbase, key) end

--获取单位编号UI_LAYOUT_CLIPPING_TYPE键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_unit_key_ui_layout_clipping_type_kv(unit_key, key) end

--获取物品编号UI_LAYOUT_CLIPPING_TYPE键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_item_key_ui_layout_clipping_type_kv(item_key, key) end

--获取技能编号UI_LAYOUT_CLIPPING_TYPE键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_ability_key_ui_layout_clipping_type_kv(ability_key, key) end

--获取魔法效果特效编号UI_LAYOUT_CLIPPING_TYPE键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_modifier_key_ui_layout_clipping_type_kv(modifier_key, key) end

--获取特效编号UI_LAYOUT_CLIPPING_TYPE键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_projectile_key_ui_layout_clipping_type_kv(projectile_key, key) end

--获取可破坏物编号UI_LAYOUT_CLIPPING_TYPE键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_destructible_key_ui_layout_clipping_type_kv(destructible_key, key) end

--获取科技编号UI_LAYOUT_CLIPPING_TYPE键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_tech_key_ui_layout_clipping_type_kv(tech_key, key) end

--获取图片UI_LAYOUT_CLIPPING_TYPE键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_icon_id_ui_layout_clipping_type_kv(icon_id, key) end

--获取逻辑物理组件类型UI_LAYOUT_CLIPPING_TYPE键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_physics_entity_key_ui_layout_clipping_type_kv(physics_entity_key, key) end

--获取UI_LAYOUT_CLIPPING_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_kv_pair_value_ui_layout_clipping_type(kvbase, key) end

--获取单位编号UI_TEXT_OVER_LENGTH_HANDLING_TYPE键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_unit_key_ui_text_over_length_handling_type_kv(unit_key, key) end

--获取物品编号UI_TEXT_OVER_LENGTH_HANDLING_TYPE键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_item_key_ui_text_over_length_handling_type_kv(item_key, key) end

--获取技能编号UI_TEXT_OVER_LENGTH_HANDLING_TYPE键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_ability_key_ui_text_over_length_handling_type_kv(ability_key, key) end

--获取魔法效果特效编号UI_TEXT_OVER_LENGTH_HANDLING_TYPE键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_modifier_key_ui_text_over_length_handling_type_kv(modifier_key, key) end

--获取特效编号UI_TEXT_OVER_LENGTH_HANDLING_TYPE键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_projectile_key_ui_text_over_length_handling_type_kv(projectile_key, key) end

--获取可破坏物编号UI_TEXT_OVER_LENGTH_HANDLING_TYPE键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_destructible_key_ui_text_over_length_handling_type_kv(destructible_key, key) end

--获取科技编号UI_TEXT_OVER_LENGTH_HANDLING_TYPE键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_tech_key_ui_text_over_length_handling_type_kv(tech_key, key) end

--获取图片UI_TEXT_OVER_LENGTH_HANDLING_TYPE键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_icon_id_ui_text_over_length_handling_type_kv(icon_id, key) end

--获取逻辑物理组件类型UI_TEXT_OVER_LENGTH_HANDLING_TYPE键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_physics_entity_key_ui_text_over_length_handling_type_kv(physics_entity_key, key) end

--获取UI_TEXT_OVER_LENGTH_HANDLING_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_kv_pair_value_ui_text_over_length_handling_type(kvbase, key) end

--获取单位编号UI_POS_ADAPT_MODE键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_unit_key_ui_pos_adapt_mode_kv(unit_key, key) end

--获取物品编号UI_POS_ADAPT_MODE键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_item_key_ui_pos_adapt_mode_kv(item_key, key) end

--获取技能编号UI_POS_ADAPT_MODE键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_ability_key_ui_pos_adapt_mode_kv(ability_key, key) end

--获取魔法效果特效编号UI_POS_ADAPT_MODE键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_modifier_key_ui_pos_adapt_mode_kv(modifier_key, key) end

--获取特效编号UI_POS_ADAPT_MODE键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_projectile_key_ui_pos_adapt_mode_kv(projectile_key, key) end

--获取可破坏物编号UI_POS_ADAPT_MODE键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_destructible_key_ui_pos_adapt_mode_kv(destructible_key, key) end

--获取科技编号UI_POS_ADAPT_MODE键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_tech_key_ui_pos_adapt_mode_kv(tech_key, key) end

--获取图片UI_POS_ADAPT_MODE键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_icon_id_ui_pos_adapt_mode_kv(icon_id, key) end

--获取逻辑物理组件类型UI_POS_ADAPT_MODE键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_physics_entity_key_ui_pos_adapt_mode_kv(physics_entity_key, key) end

--获取UI_POS_ADAPT_MODE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_kv_pair_value_ui_pos_adapt_mode(kvbase, key) end

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

--获取逻辑物理组件类型UI_ANIM键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.UIAnimKey # 键值
function GameAPI.get_physics_entity_key_ui_anim_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型UI_ANIM_CURVE键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_physics_entity_key_ui_anim_curve_kv(physics_entity_key, key) end

--获取UI_ANIM_CURVE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_kv_pair_value_ui_anim_curve(kvbase, key) end

--获取单位编号UI_ANIM_PLAY_MODE键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_unit_key_ui_anim_play_mode_kv(unit_key, key) end

--获取物品编号UI_ANIM_PLAY_MODE键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_item_key_ui_anim_play_mode_kv(item_key, key) end

--获取技能编号UI_ANIM_PLAY_MODE键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_ability_key_ui_anim_play_mode_kv(ability_key, key) end

--获取魔法效果特效编号UI_ANIM_PLAY_MODE键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_modifier_key_ui_anim_play_mode_kv(modifier_key, key) end

--获取特效编号UI_ANIM_PLAY_MODE键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_projectile_key_ui_anim_play_mode_kv(projectile_key, key) end

--获取可破坏物编号UI_ANIM_PLAY_MODE键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_destructible_key_ui_anim_play_mode_kv(destructible_key, key) end

--获取科技编号UI_ANIM_PLAY_MODE键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_tech_key_ui_anim_play_mode_kv(tech_key, key) end

--获取图片UI_ANIM_PLAY_MODE键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_icon_id_ui_anim_play_mode_kv(icon_id, key) end

--获取逻辑物理组件类型UI_ANIM_PLAY_MODE键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_physics_entity_key_ui_anim_play_mode_kv(physics_entity_key, key) end

--获取UI_ANIM_PLAY_MODE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_kv_pair_value_ui_anim_play_mode(kvbase, key) end

--获取单位编号UI_TEXT_FONT_NAME键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_unit_key_ui_text_font_name_kv(unit_key, key) end

--获取物品编号UI_TEXT_FONT_NAME键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_item_key_ui_text_font_name_kv(item_key, key) end

--获取技能编号UI_TEXT_FONT_NAME键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_ability_key_ui_text_font_name_kv(ability_key, key) end

--获取魔法效果特效编号UI_TEXT_FONT_NAME键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_modifier_key_ui_text_font_name_kv(modifier_key, key) end

--获取特效编号UI_TEXT_FONT_NAME键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_projectile_key_ui_text_font_name_kv(projectile_key, key) end

--获取可破坏物编号UI_TEXT_FONT_NAME键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_destructible_key_ui_text_font_name_kv(destructible_key, key) end

--获取科技编号UI_TEXT_FONT_NAME键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_tech_key_ui_text_font_name_kv(tech_key, key) end

--获取图片UI_TEXT_FONT_NAME键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_icon_id_ui_text_font_name_kv(icon_id, key) end

--获取逻辑物理组件类型UI_TEXT_FONT_NAME键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_physics_entity_key_ui_text_font_name_kv(physics_entity_key, key) end

--获取UI_TEXT_FONT_NAME键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_kv_pair_value_ui_text_font_name(kvbase, key) end

--获取单位编号UI_ECA_ANIM_TYPE键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_unit_key_ui_eca_anim_type_kv(unit_key, key) end

--获取物品编号UI_ECA_ANIM_TYPE键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_item_key_ui_eca_anim_type_kv(item_key, key) end

--获取技能编号UI_ECA_ANIM_TYPE键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_ability_key_ui_eca_anim_type_kv(ability_key, key) end

--获取魔法效果特效编号UI_ECA_ANIM_TYPE键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_modifier_key_ui_eca_anim_type_kv(modifier_key, key) end

--获取特效编号UI_ECA_ANIM_TYPE键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_projectile_key_ui_eca_anim_type_kv(projectile_key, key) end

--获取可破坏物编号UI_ECA_ANIM_TYPE键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_destructible_key_ui_eca_anim_type_kv(destructible_key, key) end

--获取科技编号UI_ECA_ANIM_TYPE键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_tech_key_ui_eca_anim_type_kv(tech_key, key) end

--获取图片UI_ECA_ANIM_TYPE键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_icon_id_ui_eca_anim_type_kv(icon_id, key) end

--获取逻辑物理组件类型UI_ECA_ANIM_TYPE键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_physics_entity_key_ui_eca_anim_type_kv(physics_entity_key, key) end

--获取UI_ECA_ANIM_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_kv_pair_value_ui_eca_anim_type(kvbase, key) end

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

--获取逻辑物理组件类型AUDIO_CHANNEL键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_physics_entity_key_audio_channel_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型UNIT_ENTITY键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.Unit # 键值
function GameAPI.get_physics_entity_key_unit_entity_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型UNIT_GROUP键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.UnitGroup # 键值
function GameAPI.get_physics_entity_key_unit_group_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型UNIT_NAME键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.UnitKey # 键值
function GameAPI.get_physics_entity_key_unit_name_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型UNIT_NAME_POOL键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.UnitKeyPool # 键值
function GameAPI.get_physics_entity_key_unit_name_pool_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型UNIT_WRITE_ATTRIBUTE键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_physics_entity_key_unit_write_attribute_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型ATTR_ELEMENT键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_physics_entity_key_attr_element_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型ATTR_ELEMENT_READ键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_physics_entity_key_attr_element_read_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型MOVER_ENTITY键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.Mover # 键值
function GameAPI.get_physics_entity_key_mover_entity_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型IMAGE_QUALITY键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_physics_entity_key_image_quality_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型WINDOW_TYPE_SETTING键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_physics_entity_key_window_type_setting_kv(physics_entity_key, key) end

--获取WINDOW_TYPE_SETTING键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_kv_pair_value_window_type_setting(kvbase, key) end

--获取单位编号DAMAGE_ATTACK_TYPE键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_unit_key_damage_attack_type_kv(unit_key, key) end

--获取物品编号DAMAGE_ATTACK_TYPE键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_item_key_damage_attack_type_kv(item_key, key) end

--获取技能编号DAMAGE_ATTACK_TYPE键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_ability_key_damage_attack_type_kv(ability_key, key) end

--获取魔法效果特效编号DAMAGE_ATTACK_TYPE键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_modifier_key_damage_attack_type_kv(modifier_key, key) end

--获取特效编号DAMAGE_ATTACK_TYPE键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_projectile_key_damage_attack_type_kv(projectile_key, key) end

--获取可破坏物编号DAMAGE_ATTACK_TYPE键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_destructible_key_damage_attack_type_kv(destructible_key, key) end

--获取科技编号DAMAGE_ATTACK_TYPE键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_tech_key_damage_attack_type_kv(tech_key, key) end

--获取图片DAMAGE_ATTACK_TYPE键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_icon_id_damage_attack_type_kv(icon_id, key) end

--获取逻辑物理组件类型DAMAGE_ATTACK_TYPE键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_physics_entity_key_damage_attack_type_kv(physics_entity_key, key) end

--获取DAMAGE_ATTACK_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_kv_pair_value_damage_attack_type(kvbase, key) end

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

--获取逻辑物理组件类型ITEM_ENTITY键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.Item # 键值
function GameAPI.get_physics_entity_key_item_entity_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型ITEM_GROUP键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.ItemGroup # 键值
function GameAPI.get_physics_entity_key_item_group_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型ITEM_NAME键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.ItemKey # 键值
function GameAPI.get_physics_entity_key_item_name_kv(physics_entity_key, key) end

--获取ITEM_NAME键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.ItemKey # 键值
function GameAPI.get_kv_pair_value_item_name(kvbase, key) end

--获取单位编号ITEM_STACK_TYPE键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.ItemStackType # 键值
function GameAPI.get_unit_key_item_stack_type_kv(unit_key, key) end

--获取物品编号ITEM_STACK_TYPE键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.ItemStackType # 键值
function GameAPI.get_item_key_item_stack_type_kv(item_key, key) end

--获取技能编号ITEM_STACK_TYPE键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.ItemStackType # 键值
function GameAPI.get_ability_key_item_stack_type_kv(ability_key, key) end

--获取魔法效果特效编号ITEM_STACK_TYPE键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.ItemStackType # 键值
function GameAPI.get_modifier_key_item_stack_type_kv(modifier_key, key) end

--获取特效编号ITEM_STACK_TYPE键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.ItemStackType # 键值
function GameAPI.get_projectile_key_item_stack_type_kv(projectile_key, key) end

--获取可破坏物编号ITEM_STACK_TYPE键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.ItemStackType # 键值
function GameAPI.get_destructible_key_item_stack_type_kv(destructible_key, key) end

--获取科技编号ITEM_STACK_TYPE键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.ItemStackType # 键值
function GameAPI.get_tech_key_item_stack_type_kv(tech_key, key) end

--获取图片ITEM_STACK_TYPE键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.ItemStackType # 键值
function GameAPI.get_icon_id_item_stack_type_kv(icon_id, key) end

--获取逻辑物理组件类型ITEM_STACK_TYPE键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.ItemStackType # 键值
function GameAPI.get_physics_entity_key_item_stack_type_kv(physics_entity_key, key) end

--获取ITEM_STACK_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.ItemStackType # 键值
function GameAPI.get_kv_pair_value_item_stack_type(kvbase, key) end

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

--获取逻辑物理组件类型ABILITY键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.Ability # 键值
function GameAPI.get_physics_entity_key_ability_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型ABILITY_TYPE键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_physics_entity_key_ability_type_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型ABILITY_CAST_TYPE键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_physics_entity_key_ability_cast_type_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型ABILITY_NAME键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.AbilityKey # 键值
function GameAPI.get_physics_entity_key_ability_name_kv(physics_entity_key, key) end

--获取ABILITY_NAME键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.AbilityKey # 键值
function GameAPI.get_kv_pair_value_ability_name(kvbase, key) end

--获取单位编号SLOT_TYPE键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.SlotType # 键值
function GameAPI.get_unit_key_slot_type_kv(unit_key, key) end

--获取物品编号SLOT_TYPE键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.SlotType # 键值
function GameAPI.get_item_key_slot_type_kv(item_key, key) end

--获取技能编号SLOT_TYPE键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.SlotType # 键值
function GameAPI.get_ability_key_slot_type_kv(ability_key, key) end

--获取魔法效果特效编号SLOT_TYPE键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.SlotType # 键值
function GameAPI.get_modifier_key_slot_type_kv(modifier_key, key) end

--获取特效编号SLOT_TYPE键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.SlotType # 键值
function GameAPI.get_projectile_key_slot_type_kv(projectile_key, key) end

--获取可破坏物编号SLOT_TYPE键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.SlotType # 键值
function GameAPI.get_destructible_key_slot_type_kv(destructible_key, key) end

--获取科技编号SLOT_TYPE键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.SlotType # 键值
function GameAPI.get_tech_key_slot_type_kv(tech_key, key) end

--获取图片SLOT_TYPE键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.SlotType # 键值
function GameAPI.get_icon_id_slot_type_kv(icon_id, key) end

--获取逻辑物理组件类型SLOT_TYPE键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.SlotType # 键值
function GameAPI.get_physics_entity_key_slot_type_kv(physics_entity_key, key) end

--获取SLOT_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.SlotType # 键值
function GameAPI.get_kv_pair_value_slot_type(kvbase, key) end

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

--获取逻辑物理组件类型SKILL_POINTER_TYPE键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_physics_entity_key_skill_pointer_type_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型MODIFIER_ENTITY键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.ModifierEntity # 键值
function GameAPI.get_physics_entity_key_modifier_entity_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型MODIFIER_TYPE键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.ModifierType # 键值
function GameAPI.get_physics_entity_key_modifier_type_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型MODIFIER_EFFECT_TYPE键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.ModifierEffectType # 键值
function GameAPI.get_physics_entity_key_modifier_effect_type_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型MODIFIER键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.ModifierKey # 键值
function GameAPI.get_physics_entity_key_modifier_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型PROJECTILE键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.ProjectileKey # 键值
function GameAPI.get_physics_entity_key_projectile_kv(physics_entity_key, key) end

--获取PROJECTILE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.ProjectileKey # 键值
function GameAPI.get_kv_pair_value_projectile(kvbase, key) end

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

--获取逻辑物理组件类型PROJECTILE_ENTITY键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.ProjectileEntity # 键值
function GameAPI.get_physics_entity_key_projectile_entity_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型PROJECTILE_GROUP键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.ProjectileGroup # 键值
function GameAPI.get_physics_entity_key_projectile_group_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型DESTRUCTIBLE_ENTITY键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.Destructible # 键值
function GameAPI.get_physics_entity_key_destructible_entity_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型DESTRUCTIBLE_NAME键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.DestructibleKey # 键值
function GameAPI.get_physics_entity_key_destructible_name_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型SOUND_ENTITY键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.SoundEntity # 键值
function GameAPI.get_physics_entity_key_sound_entity_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型AUDIO_KEY键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.AudioKey # 键值
function GameAPI.get_physics_entity_key_audio_key_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型GAME_MODE键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.GameMode # 键值
function GameAPI.get_physics_entity_key_game_mode_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型PLAYER键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.Role # 键值
function GameAPI.get_physics_entity_key_player_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型PLAYER_GROUP键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.RoleGroup # 键值
function GameAPI.get_physics_entity_key_player_group_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型ROLE_RES_KEY键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.RoleResKey # 键值
function GameAPI.get_physics_entity_key_role_res_key_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型ROLE_STATUS键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.RoleStatus # 键值
function GameAPI.get_physics_entity_key_role_status_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型ROLE_TYPE键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.RoleType # 键值
function GameAPI.get_physics_entity_key_role_type_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型ROLE_RELATION键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.RoleRelation # 键值
function GameAPI.get_physics_entity_key_role_relation_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型TEAM键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.Camp # 键值
function GameAPI.get_physics_entity_key_team_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型POINT键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.FPoint # 键值
function GameAPI.get_physics_entity_key_point_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型VECTOR3键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.FVector3 # 键值
function GameAPI.get_physics_entity_key_vector3_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型ROTATION键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.FRotation # 键值
function GameAPI.get_physics_entity_key_rotation_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型POINT_LIST键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.Road # 键值
function GameAPI.get_physics_entity_key_point_list_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型RECTANGLE键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.RecArea # 键值
function GameAPI.get_physics_entity_key_rectangle_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型ROUND_AREA键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.CirArea # 键值
function GameAPI.get_physics_entity_key_round_area_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型POLYGON键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.PolyArea # 键值
function GameAPI.get_physics_entity_key_polygon_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型CAMERA键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.Camera # 键值
function GameAPI.get_physics_entity_key_camera_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型CAMLINE键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.CamlineID # 键值
function GameAPI.get_physics_entity_key_camline_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型POINT_LIGHT键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.PointLight # 键值
function GameAPI.get_physics_entity_key_point_light_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型SPOT_LIGHT键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.SpotLight # 键值
function GameAPI.get_physics_entity_key_spot_light_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型FOG键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.Fog # 键值
function GameAPI.get_physics_entity_key_fog_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型SCENE_SOUND键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.SceneSound # 键值
function GameAPI.get_physics_entity_key_scene_sound_kv(physics_entity_key, key) end

--获取SCENE_SOUND键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.SceneSound # 键值
function GameAPI.get_kv_pair_value_scene_sound(kvbase, key) end

--获取单位编号ATTACH_MODEL_ENTITY键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.AttachModelEntity # 键值
function GameAPI.get_unit_key_attach_model_entity_kv(unit_key, key) end

--获取物品编号ATTACH_MODEL_ENTITY键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.AttachModelEntity # 键值
function GameAPI.get_item_key_attach_model_entity_kv(item_key, key) end

--获取技能编号ATTACH_MODEL_ENTITY键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.AttachModelEntity # 键值
function GameAPI.get_ability_key_attach_model_entity_kv(ability_key, key) end

--获取魔法效果特效编号ATTACH_MODEL_ENTITY键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.AttachModelEntity # 键值
function GameAPI.get_modifier_key_attach_model_entity_kv(modifier_key, key) end

--获取特效编号ATTACH_MODEL_ENTITY键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.AttachModelEntity # 键值
function GameAPI.get_projectile_key_attach_model_entity_kv(projectile_key, key) end

--获取可破坏物编号ATTACH_MODEL_ENTITY键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.AttachModelEntity # 键值
function GameAPI.get_destructible_key_attach_model_entity_kv(destructible_key, key) end

--获取科技编号ATTACH_MODEL_ENTITY键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.AttachModelEntity # 键值
function GameAPI.get_tech_key_attach_model_entity_kv(tech_key, key) end

--获取图片ATTACH_MODEL_ENTITY键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.AttachModelEntity # 键值
function GameAPI.get_icon_id_attach_model_entity_kv(icon_id, key) end

--获取逻辑物理组件类型ATTACH_MODEL_ENTITY键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.AttachModelEntity # 键值
function GameAPI.get_physics_entity_key_attach_model_entity_kv(physics_entity_key, key) end

--获取ATTACH_MODEL_ENTITY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.AttachModelEntity # 键值
function GameAPI.get_kv_pair_value_attach_model_entity(kvbase, key) end

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

--获取逻辑物理组件类型MODEL键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.ModelKey # 键值
function GameAPI.get_physics_entity_key_model_kv(physics_entity_key, key) end

--获取MODEL键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.ModelKey # 键值
function GameAPI.get_kv_pair_value_model(kvbase, key) end

--获取单位编号LIVE2D键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.Live2dKey # 键值
function GameAPI.get_unit_key_live2d_kv(unit_key, key) end

--获取物品编号LIVE2D键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.Live2dKey # 键值
function GameAPI.get_item_key_live2d_kv(item_key, key) end

--获取技能编号LIVE2D键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.Live2dKey # 键值
function GameAPI.get_ability_key_live2d_kv(ability_key, key) end

--获取魔法效果特效编号LIVE2D键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.Live2dKey # 键值
function GameAPI.get_modifier_key_live2d_kv(modifier_key, key) end

--获取特效编号LIVE2D键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.Live2dKey # 键值
function GameAPI.get_projectile_key_live2d_kv(projectile_key, key) end

--获取可破坏物编号LIVE2D键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.Live2dKey # 键值
function GameAPI.get_destructible_key_live2d_kv(destructible_key, key) end

--获取科技编号LIVE2D键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.Live2dKey # 键值
function GameAPI.get_tech_key_live2d_kv(tech_key, key) end

--获取图片LIVE2D键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.Live2dKey # 键值
function GameAPI.get_icon_id_live2d_kv(icon_id, key) end

--获取逻辑物理组件类型LIVE2D键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.Live2dKey # 键值
function GameAPI.get_physics_entity_key_live2d_kv(physics_entity_key, key) end

--获取LIVE2D键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.Live2dKey # 键值
function GameAPI.get_kv_pair_value_live2d(kvbase, key) end

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

--获取逻辑物理组件类型SFX_ENTITY键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.Sfx # 键值
function GameAPI.get_physics_entity_key_sfx_entity_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型SFX_KEY键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.SfxKey # 键值
function GameAPI.get_physics_entity_key_sfx_key_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型LINK_SFX_ENTITY键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.LinkSfx # 键值
function GameAPI.get_physics_entity_key_link_sfx_entity_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型LINK_SFX_KEY键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.LinkSfxKey # 键值
function GameAPI.get_physics_entity_key_link_sfx_key_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型CURSOR_KEY键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.CursorKey # 键值
function GameAPI.get_physics_entity_key_cursor_key_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型ANGLE键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.Fixed # 键值
function GameAPI.get_physics_entity_key_angle_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型TEXTURE键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.Texture # 键值
function GameAPI.get_physics_entity_key_texture_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型SEQUENCE键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.Sequence # 键值
function GameAPI.get_physics_entity_key_sequence_kv(physics_entity_key, key) end

--获取SEQUENCE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.Sequence # 键值
function GameAPI.get_kv_pair_value_sequence(kvbase, key) end

--获取单位编号SPINE键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.Spine # 键值
function GameAPI.get_unit_key_spine_kv(unit_key, key) end

--获取物品编号SPINE键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.Spine # 键值
function GameAPI.get_item_key_spine_kv(item_key, key) end

--获取技能编号SPINE键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.Spine # 键值
function GameAPI.get_ability_key_spine_kv(ability_key, key) end

--获取魔法效果特效编号SPINE键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.Spine # 键值
function GameAPI.get_modifier_key_spine_kv(modifier_key, key) end

--获取特效编号SPINE键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.Spine # 键值
function GameAPI.get_projectile_key_spine_kv(projectile_key, key) end

--获取可破坏物编号SPINE键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.Spine # 键值
function GameAPI.get_destructible_key_spine_kv(destructible_key, key) end

--获取科技编号SPINE键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.Spine # 键值
function GameAPI.get_tech_key_spine_kv(tech_key, key) end

--获取图片SPINE键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.Spine # 键值
function GameAPI.get_icon_id_spine_kv(icon_id, key) end

--获取逻辑物理组件类型SPINE键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.Spine # 键值
function GameAPI.get_physics_entity_key_spine_kv(physics_entity_key, key) end

--获取SPINE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.Spine # 键值
function GameAPI.get_kv_pair_value_spine(kvbase, key) end

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

--获取逻辑物理组件类型PHYSICS_OBJECT键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.PhysicsObject # 键值
function GameAPI.get_physics_entity_key_physics_object_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型PHYSICS_ENTITY键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.PhysicsEntity # 键值
function GameAPI.get_physics_entity_key_physics_entity_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型PHYSICS_OBJECT_KEY键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.PhysicsObjectKey # 键值
function GameAPI.get_physics_entity_key_physics_object_key_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型PHYSICS_ENTITY_KEY键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.PhysicsEntityKey # 键值
function GameAPI.get_physics_entity_key_physics_entity_key_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型RIGID_BODY键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.RigidBody # 键值
function GameAPI.get_physics_entity_key_rigid_body_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型RIGID_BODY_GROUP键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.RigidBodyGroup # 键值
function GameAPI.get_physics_entity_key_rigid_body_group_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型COLLIDER键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.Collider # 键值
function GameAPI.get_physics_entity_key_collider_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型JOINT键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.Joint # 键值
function GameAPI.get_physics_entity_key_joint_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型REACTION键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.Reaction # 键值
function GameAPI.get_physics_entity_key_reaction_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型REACTION_GROUP键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.ReactionGroup # 键值
function GameAPI.get_physics_entity_key_reaction_group_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型DYNAMIC_TRIGGER_INSTANCE键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.DynamicTriggerInstance # 键值
function GameAPI.get_physics_entity_key_dynamic_trigger_instance_kv(physics_entity_key, key) end

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
