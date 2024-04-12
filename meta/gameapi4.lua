-- 此文件由 `tools/genGameAPI` 生成，请勿手动修改。
---@meta

---@class py.GameAPI
GameAPI = {}

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

--设置全局触发器STORE_ITEM_TYPE数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.StoreItemType # 值
function GameAPI.set_trigger_list_variable_store_item_type(key, index, value) end

--设置全局触发器STORE_ITEM_TYPE数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.StoreItemType # 值
function GameAPI.set_trigger_list_actor_variable_store_item_type(actor, key, index, value) end

--设置全局触发器STORE_ITEM_TYPE非数组变量
---@param key string # 变量名称
---@param value? py.StoreItemType # 值
function GameAPI.set_trigger_variable_store_item_type(key, value) end

--设置全局触发器STORE_ITEM_TYPE非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.StoreItemType # 值
function GameAPI.set_trigger_actor_variable_store_item_type(actor, key, value) end

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

--获取PHYSICS_FILTER数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.PhysicsFilter # 值
function GameAPI.get_physics_filter_list_value(l, i) end

--设置PHYSICS_FILTER数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.PhysicsFilter # 值
function GameAPI.set_physics_filter_list_value(l, i, v) end

--生成n个值为v的PHYSICS_FILTER数组
---@param n integer # 长度
---@param v? py.PhysicsFilter # 值
---@return py.List # 列表
function GameAPI.get_physics_filter_n_list(n, v) end

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

--获取RANDOM_POOL_DROP数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return integer # 值
function GameAPI.get_random_pool_drop_list_value(l, i) end

--设置RANDOM_POOL_DROP数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v integer # 值
function GameAPI.set_random_pool_drop_list_value(l, i, v) end

--生成n个值为v的RANDOM_POOL_DROP数组
---@param n integer # 长度
---@param v? integer # 值
---@return py.List # 列表
function GameAPI.get_random_pool_drop_n_list(n, v) end

--获取SPINE数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.Spine # 值
function GameAPI.get_spine_list_value(l, i) end

--设置SPINE数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.Spine # 值
function GameAPI.set_spine_list_value(l, i, v) end

--生成n个值为v的SPINE数组
---@param n integer # 长度
---@param v? py.Spine # 值
---@return py.List # 列表
function GameAPI.get_spine_n_list(n, v) end

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

--获取STORE_ITEM_TYPE数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.StoreItemType # 值
function GameAPI.get_store_item_type_list_value(l, i) end

--设置STORE_ITEM_TYPE数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.StoreItemType # 值
function GameAPI.set_store_item_type_list_value(l, i, v) end

--生成n个值为v的STORE_ITEM_TYPE数组
---@param n integer # 长度
---@param v? py.StoreItemType # 值
---@return py.List # 列表
function GameAPI.get_store_item_type_n_list(n, v) end

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

--获取UI_EQUIP_SLOT_USE_TYPE数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return integer # 值
function GameAPI.get_ui_equip_slot_use_type_list_value(l, i) end

--设置UI_EQUIP_SLOT_USE_TYPE数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v integer # 值
function GameAPI.set_ui_equip_slot_use_type_list_value(l, i, v) end

--生成n个值为v的UI_EQUIP_SLOT_USE_TYPE数组
---@param n integer # 长度
---@param v? integer # 值
---@return py.List # 列表
function GameAPI.get_ui_equip_slot_use_type_n_list(n, v) end

--获取UI_EQUIP_SLOT_DRAG_TYPE数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return integer # 值
function GameAPI.get_ui_equip_slot_drag_type_list_value(l, i) end

--设置UI_EQUIP_SLOT_DRAG_TYPE数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v integer # 值
function GameAPI.set_ui_equip_slot_drag_type_list_value(l, i, v) end

--生成n个值为v的UI_EQUIP_SLOT_DRAG_TYPE数组
---@param n integer # 长度
---@param v? integer # 值
---@return py.List # 列表
function GameAPI.get_ui_equip_slot_drag_type_n_list(n, v) end

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

--预设库 添加UI_EQUIP_SLOT_USE_TYPE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_ui_equip_slot_use_type_kv(item_key, key, value) end

--预设库 添加UI_EQUIP_SLOT_DRAG_TYPE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_ui_equip_slot_drag_type_kv(item_key, key, value) end

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

--预设库 添加SPINE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_spine_kv(item_key, key, value) end

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

--预设库 添加FONT_TYPE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_font_type_kv(item_key, key, value) end

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

--预设库 添加MAP键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_map_kv(item_key, key, value) end

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

--预设库 添加UNIT_GROUP_COMMAND_TYPE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_unit_group_command_type_kv(item_key, key, value) end

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

--预设库 添加RESCUE_SEEKER_TYPE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_rescue_seeker_type_kv(item_key, key, value) end

--预设库 添加RESCUER_TYPE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_rescuer_type_kv(item_key, key, value) end

--预设库 添加STORE_ITEM_TYPE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_store_item_type_kv(item_key, key, value) end

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

--预设库 添加UI_EQUIP_SLOT_USE_TYPE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_ui_equip_slot_use_type_kv(item_key, key, value) end

--预设库 添加UI_EQUIP_SLOT_DRAG_TYPE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_ui_equip_slot_drag_type_kv(item_key, key, value) end

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

--预设库 添加SPINE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_spine_kv(item_key, key, value) end

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

--预设库 添加FONT_TYPE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_font_type_kv(item_key, key, value) end

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

--预设库 添加MAP键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_map_kv(item_key, key, value) end

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

--预设库 添加UNIT_GROUP_COMMAND_TYPE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_unit_group_command_type_kv(item_key, key, value) end

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

--预设库 添加RESCUE_SEEKER_TYPE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_rescue_seeker_type_kv(item_key, key, value) end

--预设库 添加RESCUER_TYPE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_rescuer_type_kv(item_key, key, value) end

--预设库 添加STORE_ITEM_TYPE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_store_item_type_kv(item_key, key, value) end

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

--预设库 添加UI_EQUIP_SLOT_USE_TYPE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_ui_equip_slot_use_type_kv(item_key, key, value) end

--预设库 添加UI_EQUIP_SLOT_DRAG_TYPE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_ui_equip_slot_drag_type_kv(item_key, key, value) end

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

--预设库 添加SPINE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_spine_kv(item_key, key, value) end

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

--预设库 添加FONT_TYPE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_font_type_kv(item_key, key, value) end

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

--预设库 添加MAP键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_map_kv(item_key, key, value) end

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

--预设库 添加UNIT_GROUP_COMMAND_TYPE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_unit_group_command_type_kv(item_key, key, value) end

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

--预设库 添加RESCUE_SEEKER_TYPE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_rescue_seeker_type_kv(item_key, key, value) end

--预设库 添加RESCUER_TYPE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_rescuer_type_kv(item_key, key, value) end

--预设库 添加STORE_ITEM_TYPE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_store_item_type_kv(item_key, key, value) end

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

--设置函数返回值
function GameAPI.set_function_return() end

--获取函数返回值
---@param func_id string # 函数ID
---@param actor py.Actor # 调用者
---@param context py.Dict # 上下文
---@param params_expr py.List # 参数列表
---@param call_rt_idx integer # 返回值Index
---@return py.DynamicTypeMeta # 某一返回值
function GameAPI.get_function_return_value(func_id, actor, context, params_expr, call_rt_idx) end

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

--移动至三维坐标
---@param pos py.FVector3 # 位置
---@param nav_range? py.Fixed # 寻路范围
---@return py.UnitCommand # 单位命令
function GameAPI.create_unit_command_move_to_pos_3D(pos, nav_range) end

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

--驻守至三维坐标
---@param pos py.FVector3 # 位置
---@return py.UnitCommand # 单位命令
function GameAPI.create_unit_command_hold_3D(pos) end

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

--攻击目标点
---@param point py.Point # 释放点
---@return py.UnitCommand # 单位命令
function GameAPI.create_unit_command_attack_point(point) end

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
---@param follow_angle? py.Fixed # 跟随角度
---@param follow_dead_target? boolean # 跟随死亡目标
---@return py.UnitCommand # 单位命令
function GameAPI.create_unit_command_follow(target, refresh_interval, near_offset, far_offset, follow_angle, follow_dead_target) end

--巡逻
---@param pos py.Unit # 目标点
---@return py.UnitCommand # 单位命令
function GameAPI.create_unit_command_patrol(pos) end

--发布命令
---@param group py.UnitGroup # 单位组
---@param command py.UnitCommand # 命令
function GameAPI.api_release_group_command(group, command) end

--移动
---@param pos py.FVector3 # 位置
---@param nav_range? py.Fixed # 寻路范围
---@param organization? boolean # 是否编队
---@return py.UnitCommand # 单位命令
function GameAPI.create_unit_group_command_move_to_pos(pos, nav_range, organization) end

--停止
---@return py.UnitCommand # 单位命令
function GameAPI.create_unit_group_command_stop() end

--空状态
---@return py.UnitCommand # 单位命令
function GameAPI.create_unit_group_command_empty() end

--驻守
---@param pos py.FVector3 # 位置
---@return py.UnitCommand # 单位命令
function GameAPI.create_unit_group_command_hold(pos) end

--攻击移动
---@param pos py.FVector3 # 位置
---@param nav_range? py.Fixed # 寻路范围
---@param organization? boolean # 是否编队
---@return py.UnitCommand # 单位命令
function GameAPI.create_unit_group_command_attack_move(pos, nav_range, organization) end

--攻击
---@param target py.Actor # 目标
---@param nav_range? py.Fixed # 寻路范围
---@return py.UnitCommand # 单位命令
function GameAPI.create_unit_group_command_attack_target(target, nav_range) end

--沿路径移动
---@param road py.Road # 路径
---@param patrol_mode integer # 移动方式
---@param can_attack boolean # 是否主动攻击
---@param start_from_nearest? boolean # 是否就近开始
---@param back_to_nearest? boolean # 是否就近返回
---@return py.UnitCommand # 单位命令
function GameAPI.create_unit_group_command_move_along_road(road, patrol_mode, can_attack, start_from_nearest, back_to_nearest) end

--跟随
---@param target py.Unit # 目标
---@param refresh_interval? py.Fixed # 间隔
---@param near_offset? py.Fixed # 跟随距离
---@param far_offset? py.Fixed # 重新跟随距离
---@param follow_angle? py.Fixed # 跟随角度
---@param follow_dead_target? boolean # 跟随死亡目标
---@return py.UnitCommand # 单位命令
function GameAPI.create_unit_group_command_follow(target, refresh_interval, near_offset, far_offset, follow_angle, follow_dead_target) end

--移动到随机位置
---@param area py.Area # 区域
---@param r? py.Fixed # 寻路范围
---@return py.UnitCommand # 单位命令
function GameAPI.create_unit_group_command_move_to_random_pos(area, r) end

--攻击移动到随机位置
---@param area py.Area # 区域
---@param r? py.Fixed # 寻路范围
---@return py.UnitCommand # 单位命令
function GameAPI.create_unit_group_command_attack_move_random_pos(area, r) end

--攻击目标点
---@param point py.Point # 释放点
---@return py.UnitCommand # 单位命令
function GameAPI.create_unit_group_command_attack_point(point) end

--巡逻
---@param point py.Point # 目标点
---@return py.UnitCommand # 单位命令
function GameAPI.create_unit_group_command_patrol(point) end

--特效播放开关
---@param role py.Role # 玩家
---@param switch boolean # 开关
function GameAPI.set_player_sfx_switch(role, switch) end

--特效播放开关
---@param role py.Role # 玩家
---@param tag integer # 特效标签
---@param switch boolean # 开关
function GameAPI.set_player_sfx_switch_by_tag(role, tag, switch) end

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
---@param follow_scale? boolean # 是否跟随单位缩放
---@return py.LinkSfx # 特效
function GameAPI.create_link_sfx_from_unit_to_point(sfx_res_id, source_unit, source_socket, target_point, target_height, duration, immediately, use_sys_d_destroy_way, follow_scale) end

--创建单位到单位闪电特效
---@param sfx_res_id py.SfxKey # 特效编号
---@param source_unit py.Unit # 起点单位
---@param source_socket string # 起点单位挂接点名称
---@param target_unit py.Unit # 终点单位
---@param target_socket string # 起点单位挂接点名称
---@param duration? number # 持续时间
---@param immediately? boolean # 是否立即删除
---@param use_sys_d_destroy_way? boolean # 特效删除的方式是否读表
---@param follow_scale? boolean # 是否跟随单位缩放
---@return py.LinkSfx # 特效
function GameAPI.create_link_sfx_from_unit_to_unit(sfx_res_id, source_unit, source_socket, target_unit, target_socket, duration, immediately, use_sys_d_destroy_way, follow_scale) end

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
---@param detach? boolean # 是否脱离单位
---@return py.Sfx # 特效
function GameAPI.create_sfx_on_unit_new(sfx_id, unit, socket, rotate_type, b_follow_scale, scale, duration, angle, immediately, use_sys_d_destroy_way, detach) end

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

--设置特效颜色(HEX)
---@param sfx_entity py.Sfx # 特效
---@param color string # hex
---@param w number # w
function GameAPI.set_sfx_color_hex(sfx_entity, color, w) end

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

--表 - 是否为空表
---@param table py.Table # table
---@return boolean # 是否为空
function GameAPI.is_table_empty(table) end

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

--table迭代器
---@param t py.Table # TAB
---@param ordered? boolean # 是否仅遍历数组部分（保序）
---@return py.Iterator # Python迭代器
function GameAPI.table_iterator_new(t, ordered) end

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
---@param desc string # 描述
function GameAPI.start_timer(name, once, interval, context, desc) end

--关闭计时器
---@param name string # 计时器名称
function GameAPI.stop_timer(name) end

--开启计时器（新）
---@param time_delay py.Fixed # 延迟时间
---@param repeat_count integer # 循环次数
---@param run_at_start boolean # 启动时立即运行
---@param timer_callback function # 回调函数
---@param context py.Dict # 上下文
---@param desc string # 描述
---@return py.Timer # 计时器编号
function GameAPI.run_lua_timer(time_delay, repeat_count, run_at_start, timer_callback, context, desc) end

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
---@param time py.Fixed # 剩余时间
function GameAPI.timer_set_left_time(timer_id, time) end

--设置计时器间隔时间
---@param timer_id py.Timer # 计时器编号
---@param time py.Fixed # 间隔时间
function GameAPI.timer_set_interval_time(timer_id, time) end

--设置帧计时器间隔帧数
---@param timer_id py.Timer # 计时器编号
---@param frame integer # 间隔帧数
function GameAPI.timer_set_interval_frame(timer_id, frame) end

--获取计时器设置的时间
---@param timer_id py.Timer # 计时器
---@return py.Fixed # 时间
function GameAPI.get_timer_time_out_time(timer_id) end

--获取计时器经过的时间
---@param timer_id py.Timer # 计时器
---@return py.Fixed # 时间
function GameAPI.get_timer_elapsed_time(timer_id) end

--获取计时器剩余时间
---@param timer_id py.Timer # 计时器
---@return py.Fixed # 时间
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
---@param time py.Fixed # 时间（0-24）
function GameAPI.set_day_and_night_time(time) end

--设置昼夜游戏时间的流逝速度（倍数）
---@param time_multiple py.Fixed # 倍数，非负数
function GameAPI.set_day_and_night_time_speed(time_multiple) end

--设置昼夜游戏时间的流逝速度（百分比）
---@param time_per py.Fixed # 百分比，非负数
function GameAPI.set_day_and_night_time_speed_per(time_per) end

--打开/关闭时间流逝
---@param flag boolean # 布尔值
function GameAPI.open_or_close_time_speed(flag) end

--创建人造时间，并持续一段时间
---@param create_time py.Fixed # 创建的时间
---@param time_delay py.Fixed # 持续的时间
function GameAPI.create_day_and_night_human_time(create_time, time_delay) end

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
