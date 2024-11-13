-- 此文件由 `tools/genGameAPI` 生成，请勿手动修改。
---@meta

---@class py.GameAPI
GameAPI = {}

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

--获取逻辑物理组件类型TABLE键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.Table # 键值
function GameAPI.get_physics_entity_key_table_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型RANDOM_POOL键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.RandomPool # 键值
function GameAPI.get_physics_entity_key_random_pool_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型SCENE_UI键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.SceneNode # 键值
function GameAPI.get_physics_entity_key_scene_ui_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型DAMAGE_TYPE键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_physics_entity_key_damage_type_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型HARM_TEXT_TYPE_NEW键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_physics_entity_key_harm_text_type_new_kv(physics_entity_key, key) end

--获取单位编号FONT_TYPE键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_unit_key_font_type_kv(unit_key, key) end

--获取物品编号FONT_TYPE键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_item_key_font_type_kv(item_key, key) end

--获取技能编号FONT_TYPE键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_ability_key_font_type_kv(ability_key, key) end

--获取魔法效果特效编号FONT_TYPE键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_modifier_key_font_type_kv(modifier_key, key) end

--获取特效编号FONT_TYPE键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_projectile_key_font_type_kv(projectile_key, key) end

--获取可破坏物编号FONT_TYPE键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_destructible_key_font_type_kv(destructible_key, key) end

--获取科技编号FONT_TYPE键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_tech_key_font_type_kv(tech_key, key) end

--获取图片FONT_TYPE键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_icon_id_font_type_kv(icon_id, key) end

--获取逻辑物理组件类型FONT_TYPE键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return string # 键值
function GameAPI.get_physics_entity_key_font_type_kv(physics_entity_key, key) end

--获取单位编号JUMP_WORD_TRACK键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_unit_key_jump_word_track_kv(unit_key, key) end

--获取物品编号JUMP_WORD_TRACK键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_item_key_jump_word_track_kv(item_key, key) end

--获取技能编号JUMP_WORD_TRACK键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_ability_key_jump_word_track_kv(ability_key, key) end

--获取魔法效果特效编号JUMP_WORD_TRACK键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_modifier_key_jump_word_track_kv(modifier_key, key) end

--获取特效编号JUMP_WORD_TRACK键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_projectile_key_jump_word_track_kv(projectile_key, key) end

--获取可破坏物编号JUMP_WORD_TRACK键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_destructible_key_jump_word_track_kv(destructible_key, key) end

--获取科技编号JUMP_WORD_TRACK键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_tech_key_jump_word_track_kv(tech_key, key) end

--获取图片JUMP_WORD_TRACK键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_icon_id_jump_word_track_kv(icon_id, key) end

--获取逻辑物理组件类型JUMP_WORD_TRACK键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_physics_entity_key_jump_word_track_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型NEW_TIMER键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.Timer # 键值
function GameAPI.get_physics_entity_key_new_timer_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型TECH_KEY键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.TechKey # 键值
function GameAPI.get_physics_entity_key_tech_key_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型STORE_KEY键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.StoreKey # 键值
function GameAPI.get_physics_entity_key_store_key_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型KEYBOARD_KEY键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.KeyboardKey # 键值
function GameAPI.get_physics_entity_key_keyboard_key_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型FUNC_KEYBOARD_KEY键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.FuncKeyboardKey # 键值
function GameAPI.get_physics_entity_key_func_keyboard_key_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型MOUSE_KEY键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.MouseKey # 键值
function GameAPI.get_physics_entity_key_mouse_key_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型MOUSE_WHEEL键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.MouseWheel # 键值
function GameAPI.get_physics_entity_key_mouse_wheel_kv(physics_entity_key, key) end

--获取单位编号MAP键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.Map # 键值
function GameAPI.get_unit_key_map_kv(unit_key, key) end

--获取物品编号MAP键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.Map # 键值
function GameAPI.get_item_key_map_kv(item_key, key) end

--获取技能编号MAP键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.Map # 键值
function GameAPI.get_ability_key_map_kv(ability_key, key) end

--获取魔法效果特效编号MAP键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.Map # 键值
function GameAPI.get_modifier_key_map_kv(modifier_key, key) end

--获取特效编号MAP键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.Map # 键值
function GameAPI.get_projectile_key_map_kv(projectile_key, key) end

--获取可破坏物编号MAP键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.Map # 键值
function GameAPI.get_destructible_key_map_kv(destructible_key, key) end

--获取科技编号MAP键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.Map # 键值
function GameAPI.get_tech_key_map_kv(tech_key, key) end

--获取图片MAP键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.Map # 键值
function GameAPI.get_icon_id_map_kv(icon_id, key) end

--获取逻辑物理组件类型MAP键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.Map # 键值
function GameAPI.get_physics_entity_key_map_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型POST_EFFECT键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.PostEffect # 键值
function GameAPI.get_physics_entity_key_post_effect_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型UNIT_TYPE键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.UnitType # 键值
function GameAPI.get_physics_entity_key_unit_type_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型UNIT_COMMAND_TYPE键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.UnitCommandType # 键值
function GameAPI.get_physics_entity_key_unit_command_type_kv(physics_entity_key, key) end

--获取单位编号UNIT_GROUP_COMMAND_TYPE键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.UnitGroupCommandType # 键值
function GameAPI.get_unit_key_unit_group_command_type_kv(unit_key, key) end

--获取物品编号UNIT_GROUP_COMMAND_TYPE键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.UnitGroupCommandType # 键值
function GameAPI.get_item_key_unit_group_command_type_kv(item_key, key) end

--获取技能编号UNIT_GROUP_COMMAND_TYPE键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.UnitGroupCommandType # 键值
function GameAPI.get_ability_key_unit_group_command_type_kv(ability_key, key) end

--获取魔法效果特效编号UNIT_GROUP_COMMAND_TYPE键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.UnitGroupCommandType # 键值
function GameAPI.get_modifier_key_unit_group_command_type_kv(modifier_key, key) end

--获取特效编号UNIT_GROUP_COMMAND_TYPE键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.UnitGroupCommandType # 键值
function GameAPI.get_projectile_key_unit_group_command_type_kv(projectile_key, key) end

--获取可破坏物编号UNIT_GROUP_COMMAND_TYPE键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.UnitGroupCommandType # 键值
function GameAPI.get_destructible_key_unit_group_command_type_kv(destructible_key, key) end

--获取科技编号UNIT_GROUP_COMMAND_TYPE键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.UnitGroupCommandType # 键值
function GameAPI.get_tech_key_unit_group_command_type_kv(tech_key, key) end

--获取图片UNIT_GROUP_COMMAND_TYPE键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.UnitGroupCommandType # 键值
function GameAPI.get_icon_id_unit_group_command_type_kv(icon_id, key) end

--获取逻辑物理组件类型UNIT_GROUP_COMMAND_TYPE键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.UnitGroupCommandType # 键值
function GameAPI.get_physics_entity_key_unit_group_command_type_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型MINI_MAP_COLOR_TYPE键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.MiniMapColorType # 键值
function GameAPI.get_physics_entity_key_mini_map_color_type_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型UNIT_BEHAVIOR键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.UnitBehavior # 键值
function GameAPI.get_physics_entity_key_unit_behavior_kv(physics_entity_key, key) end

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

--获取逻辑物理组件类型CURVED_PATH键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.CurvedPath # 键值
function GameAPI.get_physics_entity_key_curved_path_kv(physics_entity_key, key) end

--获取单位编号CURVED_PATH_3D键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.CurvedPath3D # 键值
function GameAPI.get_unit_key_curved_path_3d_kv(unit_key, key) end

--获取物品编号CURVED_PATH_3D键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.CurvedPath3D # 键值
function GameAPI.get_item_key_curved_path_3d_kv(item_key, key) end

--获取技能编号CURVED_PATH_3D键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.CurvedPath3D # 键值
function GameAPI.get_ability_key_curved_path_3d_kv(ability_key, key) end

--获取魔法效果特效编号CURVED_PATH_3D键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.CurvedPath3D # 键值
function GameAPI.get_modifier_key_curved_path_3d_kv(modifier_key, key) end

--获取特效编号CURVED_PATH_3D键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.CurvedPath3D # 键值
function GameAPI.get_projectile_key_curved_path_3d_kv(projectile_key, key) end

--获取可破坏物编号CURVED_PATH_3D键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.CurvedPath3D # 键值
function GameAPI.get_destructible_key_curved_path_3d_kv(destructible_key, key) end

--获取科技编号CURVED_PATH_3D键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.CurvedPath3D # 键值
function GameAPI.get_tech_key_curved_path_3d_kv(tech_key, key) end

--获取图片CURVED_PATH_3D键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.CurvedPath3D # 键值
function GameAPI.get_icon_id_curved_path_3d_kv(icon_id, key) end

--获取逻辑物理组件类型CURVED_PATH_3D键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.CurvedPath3D # 键值
function GameAPI.get_physics_entity_key_curved_path_3d_kv(physics_entity_key, key) end

--获取单位编号RESCUE_SEEKER_TYPE键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.ERescueSeekerType # 键值
function GameAPI.get_unit_key_rescue_seeker_type_kv(unit_key, key) end

--获取物品编号RESCUE_SEEKER_TYPE键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.ERescueSeekerType # 键值
function GameAPI.get_item_key_rescue_seeker_type_kv(item_key, key) end

--获取技能编号RESCUE_SEEKER_TYPE键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.ERescueSeekerType # 键值
function GameAPI.get_ability_key_rescue_seeker_type_kv(ability_key, key) end

--获取魔法效果特效编号RESCUE_SEEKER_TYPE键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.ERescueSeekerType # 键值
function GameAPI.get_modifier_key_rescue_seeker_type_kv(modifier_key, key) end

--获取特效编号RESCUE_SEEKER_TYPE键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.ERescueSeekerType # 键值
function GameAPI.get_projectile_key_rescue_seeker_type_kv(projectile_key, key) end

--获取可破坏物编号RESCUE_SEEKER_TYPE键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.ERescueSeekerType # 键值
function GameAPI.get_destructible_key_rescue_seeker_type_kv(destructible_key, key) end

--获取科技编号RESCUE_SEEKER_TYPE键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.ERescueSeekerType # 键值
function GameAPI.get_tech_key_rescue_seeker_type_kv(tech_key, key) end

--获取图片RESCUE_SEEKER_TYPE键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.ERescueSeekerType # 键值
function GameAPI.get_icon_id_rescue_seeker_type_kv(icon_id, key) end

--获取逻辑物理组件类型RESCUE_SEEKER_TYPE键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.ERescueSeekerType # 键值
function GameAPI.get_physics_entity_key_rescue_seeker_type_kv(physics_entity_key, key) end

--获取单位编号RESCUER_TYPE键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.ERescuerType # 键值
function GameAPI.get_unit_key_rescuer_type_kv(unit_key, key) end

--获取物品编号RESCUER_TYPE键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.ERescuerType # 键值
function GameAPI.get_item_key_rescuer_type_kv(item_key, key) end

--获取技能编号RESCUER_TYPE键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.ERescuerType # 键值
function GameAPI.get_ability_key_rescuer_type_kv(ability_key, key) end

--获取魔法效果特效编号RESCUER_TYPE键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.ERescuerType # 键值
function GameAPI.get_modifier_key_rescuer_type_kv(modifier_key, key) end

--获取特效编号RESCUER_TYPE键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.ERescuerType # 键值
function GameAPI.get_projectile_key_rescuer_type_kv(projectile_key, key) end

--获取可破坏物编号RESCUER_TYPE键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.ERescuerType # 键值
function GameAPI.get_destructible_key_rescuer_type_kv(destructible_key, key) end

--获取科技编号RESCUER_TYPE键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.ERescuerType # 键值
function GameAPI.get_tech_key_rescuer_type_kv(tech_key, key) end

--获取图片RESCUER_TYPE键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.ERescuerType # 键值
function GameAPI.get_icon_id_rescuer_type_kv(icon_id, key) end

--获取逻辑物理组件类型RESCUER_TYPE键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.ERescuerType # 键值
function GameAPI.get_physics_entity_key_rescuer_type_kv(physics_entity_key, key) end

--获取单位编号STORE_ITEM_TYPE键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.StoreItemType # 键值
function GameAPI.get_unit_key_store_item_type_kv(unit_key, key) end

--获取物品编号STORE_ITEM_TYPE键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.StoreItemType # 键值
function GameAPI.get_item_key_store_item_type_kv(item_key, key) end

--获取技能编号STORE_ITEM_TYPE键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.StoreItemType # 键值
function GameAPI.get_ability_key_store_item_type_kv(ability_key, key) end

--获取魔法效果特效编号STORE_ITEM_TYPE键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.StoreItemType # 键值
function GameAPI.get_modifier_key_store_item_type_kv(modifier_key, key) end

--获取特效编号STORE_ITEM_TYPE键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.StoreItemType # 键值
function GameAPI.get_projectile_key_store_item_type_kv(projectile_key, key) end

--获取可破坏物编号STORE_ITEM_TYPE键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.StoreItemType # 键值
function GameAPI.get_destructible_key_store_item_type_kv(destructible_key, key) end

--获取科技编号STORE_ITEM_TYPE键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.StoreItemType # 键值
function GameAPI.get_tech_key_store_item_type_kv(tech_key, key) end

--获取图片STORE_ITEM_TYPE键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.StoreItemType # 键值
function GameAPI.get_icon_id_store_item_type_kv(icon_id, key) end

--获取逻辑物理组件类型STORE_ITEM_TYPE键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.StoreItemType # 键值
function GameAPI.get_physics_entity_key_store_item_type_kv(physics_entity_key, key) end

--运动器丢失追踪目标
---@param mover_id py.Mover # 运动器
function GameAPI.mover_miss_target(mover_id) end

--【异步】界面-获取玩家触点真实x坐标
---@param role py.Role # 玩家
---@param index integer # 触点索引
function GameAPI.get_role_real_touch_x(role, index) end

--【异步】界面-获取玩家触点真实y坐标
---@param role py.Role # 玩家
---@param index integer # 触点索引
function GameAPI.get_role_real_touch_y(role, index) end

--预设库 添加ABILITY_RELEASE_ID键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.AbilityReleaseId # value
function GameAPI.set_prefab_key_ability_release_id_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加UI_POINT键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.FUIPoint # value
function GameAPI.set_prefab_key_ui_point_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加FORCE_ENTITY键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.Force # value
function GameAPI.set_prefab_key_force_entity_kv(prefab_conf_key, item_key, key, value) end

--预设库 添加MOUSE_KEY_WITHOUT_MIDDLE键值对
---@param prefab_conf_key integer # prefab库ID
---@param item_key integer # 编号
---@param key string # 键值名称
---@param value py.MouseKeyWithoutMiddle # value
function GameAPI.set_prefab_key_mouse_key_without_middle_kv(prefab_conf_key, item_key, key, value) end

--添加DAMAGE_ARMOR_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? integer # value
function GameAPI.add_damage_armor_type_kv(kvbase, key, item) end

--添加ABILITY_RELEASE_ID键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.AbilityReleaseId # value
function GameAPI.add_ability_release_id_kv(kvbase, key, item) end

--添加UI_POINT键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.FUIPoint # value
function GameAPI.add_ui_point_kv(kvbase, key, item) end

--添加FORCE_ENTITY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.Force # value
function GameAPI.add_force_entity_kv(kvbase, key, item) end

--添加MOUSE_KEY_WITHOUT_MIDDLE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键值名称
---@param item? py.MouseKeyWithoutMiddle # value
function GameAPI.add_mouse_key_without_middle_kv(kvbase, key, item) end

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

--获取单位编号DAMAGE_ARMOR_TYPE键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_unit_key_damage_armor_type_kv(unit_key, key) end

--获取物品编号DAMAGE_ARMOR_TYPE键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_item_key_damage_armor_type_kv(item_key, key) end

--获取技能编号DAMAGE_ARMOR_TYPE键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_ability_key_damage_armor_type_kv(ability_key, key) end

--获取魔法效果特效编号DAMAGE_ARMOR_TYPE键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_modifier_key_damage_armor_type_kv(modifier_key, key) end

--获取特效编号DAMAGE_ARMOR_TYPE键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_projectile_key_damage_armor_type_kv(projectile_key, key) end

--获取可破坏物编号DAMAGE_ARMOR_TYPE键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_destructible_key_damage_armor_type_kv(destructible_key, key) end

--获取科技编号DAMAGE_ARMOR_TYPE键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_tech_key_damage_armor_type_kv(tech_key, key) end

--获取图片DAMAGE_ARMOR_TYPE键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_icon_id_damage_armor_type_kv(icon_id, key) end

--获取逻辑物理组件类型DAMAGE_ARMOR_TYPE键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_physics_entity_key_damage_armor_type_kv(physics_entity_key, key) end

--获取DAMAGE_ARMOR_TYPE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return integer # 键值
function GameAPI.get_kv_pair_value_damage_armor_type(kvbase, key) end

--获取单位编号ABILITY_RELEASE_ID键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.AbilityReleaseId # 键值
function GameAPI.get_unit_key_ability_release_id_kv(unit_key, key) end

--获取物品编号ABILITY_RELEASE_ID键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.AbilityReleaseId # 键值
function GameAPI.get_item_key_ability_release_id_kv(item_key, key) end

--获取技能编号ABILITY_RELEASE_ID键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.AbilityReleaseId # 键值
function GameAPI.get_ability_key_ability_release_id_kv(ability_key, key) end

--获取魔法效果特效编号ABILITY_RELEASE_ID键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.AbilityReleaseId # 键值
function GameAPI.get_modifier_key_ability_release_id_kv(modifier_key, key) end

--获取特效编号ABILITY_RELEASE_ID键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.AbilityReleaseId # 键值
function GameAPI.get_projectile_key_ability_release_id_kv(projectile_key, key) end

--获取可破坏物编号ABILITY_RELEASE_ID键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.AbilityReleaseId # 键值
function GameAPI.get_destructible_key_ability_release_id_kv(destructible_key, key) end

--获取科技编号ABILITY_RELEASE_ID键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.AbilityReleaseId # 键值
function GameAPI.get_tech_key_ability_release_id_kv(tech_key, key) end

--获取图片ABILITY_RELEASE_ID键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.AbilityReleaseId # 键值
function GameAPI.get_icon_id_ability_release_id_kv(icon_id, key) end

--获取逻辑物理组件类型ABILITY_RELEASE_ID键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.AbilityReleaseId # 键值
function GameAPI.get_physics_entity_key_ability_release_id_kv(physics_entity_key, key) end

--获取ABILITY_RELEASE_ID键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.AbilityReleaseId # 键值
function GameAPI.get_kv_pair_value_ability_release_id(kvbase, key) end

--获取单位编号UI_POINT键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.FUIPoint # 键值
function GameAPI.get_unit_key_ui_point_kv(unit_key, key) end

--获取物品编号UI_POINT键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.FUIPoint # 键值
function GameAPI.get_item_key_ui_point_kv(item_key, key) end

--获取技能编号UI_POINT键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.FUIPoint # 键值
function GameAPI.get_ability_key_ui_point_kv(ability_key, key) end

--获取魔法效果特效编号UI_POINT键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.FUIPoint # 键值
function GameAPI.get_modifier_key_ui_point_kv(modifier_key, key) end

--获取特效编号UI_POINT键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.FUIPoint # 键值
function GameAPI.get_projectile_key_ui_point_kv(projectile_key, key) end

--获取可破坏物编号UI_POINT键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.FUIPoint # 键值
function GameAPI.get_destructible_key_ui_point_kv(destructible_key, key) end

--获取科技编号UI_POINT键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.FUIPoint # 键值
function GameAPI.get_tech_key_ui_point_kv(tech_key, key) end

--获取图片UI_POINT键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.FUIPoint # 键值
function GameAPI.get_icon_id_ui_point_kv(icon_id, key) end

--获取逻辑物理组件类型UI_POINT键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.FUIPoint # 键值
function GameAPI.get_physics_entity_key_ui_point_kv(physics_entity_key, key) end

--获取UI_POINT键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.FUIPoint # 键值
function GameAPI.get_kv_pair_value_ui_point(kvbase, key) end

--获取单位编号FORCE_ENTITY键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.Force # 键值
function GameAPI.get_unit_key_force_entity_kv(unit_key, key) end

--获取物品编号FORCE_ENTITY键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.Force # 键值
function GameAPI.get_item_key_force_entity_kv(item_key, key) end

--获取技能编号FORCE_ENTITY键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.Force # 键值
function GameAPI.get_ability_key_force_entity_kv(ability_key, key) end

--获取魔法效果特效编号FORCE_ENTITY键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.Force # 键值
function GameAPI.get_modifier_key_force_entity_kv(modifier_key, key) end

--获取特效编号FORCE_ENTITY键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.Force # 键值
function GameAPI.get_projectile_key_force_entity_kv(projectile_key, key) end

--获取可破坏物编号FORCE_ENTITY键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.Force # 键值
function GameAPI.get_destructible_key_force_entity_kv(destructible_key, key) end

--获取科技编号FORCE_ENTITY键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.Force # 键值
function GameAPI.get_tech_key_force_entity_kv(tech_key, key) end

--获取图片FORCE_ENTITY键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.Force # 键值
function GameAPI.get_icon_id_force_entity_kv(icon_id, key) end

--获取逻辑物理组件类型FORCE_ENTITY键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.Force # 键值
function GameAPI.get_physics_entity_key_force_entity_kv(physics_entity_key, key) end

--获取FORCE_ENTITY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.Force # 键值
function GameAPI.get_kv_pair_value_force_entity(kvbase, key) end

--获取单位编号MOUSE_KEY_WITHOUT_MIDDLE键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.MouseKeyWithoutMiddle # 键值
function GameAPI.get_unit_key_mouse_key_without_middle_kv(unit_key, key) end

--获取物品编号MOUSE_KEY_WITHOUT_MIDDLE键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.MouseKeyWithoutMiddle # 键值
function GameAPI.get_item_key_mouse_key_without_middle_kv(item_key, key) end

--获取技能编号MOUSE_KEY_WITHOUT_MIDDLE键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.MouseKeyWithoutMiddle # 键值
function GameAPI.get_ability_key_mouse_key_without_middle_kv(ability_key, key) end

--获取魔法效果特效编号MOUSE_KEY_WITHOUT_MIDDLE键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.MouseKeyWithoutMiddle # 键值
function GameAPI.get_modifier_key_mouse_key_without_middle_kv(modifier_key, key) end

--获取特效编号MOUSE_KEY_WITHOUT_MIDDLE键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.MouseKeyWithoutMiddle # 键值
function GameAPI.get_projectile_key_mouse_key_without_middle_kv(projectile_key, key) end

--获取可破坏物编号MOUSE_KEY_WITHOUT_MIDDLE键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.MouseKeyWithoutMiddle # 键值
function GameAPI.get_destructible_key_mouse_key_without_middle_kv(destructible_key, key) end

--获取科技编号MOUSE_KEY_WITHOUT_MIDDLE键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.MouseKeyWithoutMiddle # 键值
function GameAPI.get_tech_key_mouse_key_without_middle_kv(tech_key, key) end

--获取图片MOUSE_KEY_WITHOUT_MIDDLE键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.MouseKeyWithoutMiddle # 键值
function GameAPI.get_icon_id_mouse_key_without_middle_kv(icon_id, key) end

--获取逻辑物理组件类型MOUSE_KEY_WITHOUT_MIDDLE键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.MouseKeyWithoutMiddle # 键值
function GameAPI.get_physics_entity_key_mouse_key_without_middle_kv(physics_entity_key, key) end

--获取MOUSE_KEY_WITHOUT_MIDDLE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.MouseKeyWithoutMiddle # 键值
function GameAPI.get_kv_pair_value_mouse_key_without_middle(kvbase, key) end

--获取全局触发器ABILITY_RELEASE_ID非数组变量
---@param key string # 变量名称
---@return py.AbilityReleaseId # 值
function GameAPI.get_trigger_variable_ability_release_id(key) end

--获取触发器ABILITY_RELEASE_ID非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.AbilityReleaseId # 值
function GameAPI.get_trigger_actor_variable_ability_release_id(actor, key) end

--获取全局触发器ABILITY_RELEASE_ID数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.AbilityReleaseId # 值
function GameAPI.get_trigger_list_variable_ability_release_id(key, index) end

--获取触发器ABILITY_RELEASE_ID数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.AbilityReleaseId # 值
function GameAPI.get_trigger_list_actor_variable_ability_release_id(actor, key, index) end

--获取全局触发器ABILITY_RELEASE_ID数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_ability_release_id(key) end

--获取触发器ABILITY_RELEASE_ID 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_ability_release_id(actor, key) end

--获取全局触发器UI_POINT非数组变量
---@param key string # 变量名称
---@return py.FUIPoint # 值
function GameAPI.get_trigger_variable_ui_point(key) end

--获取触发器UI_POINT非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.FUIPoint # 值
function GameAPI.get_trigger_actor_variable_ui_point(actor, key) end

--获取全局触发器UI_POINT数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.FUIPoint # 值
function GameAPI.get_trigger_list_variable_ui_point(key, index) end

--获取触发器UI_POINT数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.FUIPoint # 值
function GameAPI.get_trigger_list_actor_variable_ui_point(actor, key, index) end

--获取全局触发器UI_POINT数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_ui_point(key) end

--获取触发器UI_POINT 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_ui_point(actor, key) end

--获取全局触发器FORCE_ENTITY非数组变量
---@param key string # 变量名称
---@return py.Force # 值
function GameAPI.get_trigger_variable_force_entity(key) end

--获取触发器FORCE_ENTITY非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.Force # 值
function GameAPI.get_trigger_actor_variable_force_entity(actor, key) end

--获取全局触发器FORCE_ENTITY数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.Force # 值
function GameAPI.get_trigger_list_variable_force_entity(key, index) end

--获取触发器FORCE_ENTITY数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.Force # 值
function GameAPI.get_trigger_list_actor_variable_force_entity(actor, key, index) end

--获取全局触发器FORCE_ENTITY数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_force_entity(key) end

--获取触发器FORCE_ENTITY 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_force_entity(actor, key) end

--设置全局触发器ABILITY_RELEASE_ID数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.AbilityReleaseId # 值
function GameAPI.set_trigger_list_variable_ability_release_id(key, index, value) end

--设置全局触发器ABILITY_RELEASE_ID数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.AbilityReleaseId # 值
function GameAPI.set_trigger_list_actor_variable_ability_release_id(actor, key, index, value) end

--设置全局触发器ABILITY_RELEASE_ID非数组变量
---@param key string # 变量名称
---@param value? py.AbilityReleaseId # 值
function GameAPI.set_trigger_variable_ability_release_id(key, value) end

--设置全局触发器ABILITY_RELEASE_ID非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.AbilityReleaseId # 值
function GameAPI.set_trigger_actor_variable_ability_release_id(actor, key, value) end

--设置全局触发器UI_POINT数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.FUIPoint # 值
function GameAPI.set_trigger_list_variable_ui_point(key, index, value) end

--设置全局触发器UI_POINT数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.FUIPoint # 值
function GameAPI.set_trigger_list_actor_variable_ui_point(actor, key, index, value) end

--设置全局触发器UI_POINT非数组变量
---@param key string # 变量名称
---@param value? py.FUIPoint # 值
function GameAPI.set_trigger_variable_ui_point(key, value) end

--设置全局触发器UI_POINT非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.FUIPoint # 值
function GameAPI.set_trigger_actor_variable_ui_point(actor, key, value) end

--设置全局触发器FORCE_ENTITY数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.Force # 值
function GameAPI.set_trigger_list_variable_force_entity(key, index, value) end

--设置全局触发器FORCE_ENTITY数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.Force # 值
function GameAPI.set_trigger_list_actor_variable_force_entity(actor, key, index, value) end

--设置全局触发器FORCE_ENTITY非数组变量
---@param key string # 变量名称
---@param value? py.Force # 值
function GameAPI.set_trigger_variable_force_entity(key, value) end

--设置全局触发器FORCE_ENTITY非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.Force # 值
function GameAPI.set_trigger_actor_variable_force_entity(actor, key, value) end

--获取ABILITY_RELEASE_ID数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.AbilityReleaseId # 值
function GameAPI.get_ability_release_id_list_value(l, i) end

--设置ABILITY_RELEASE_ID数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.AbilityReleaseId # 值
function GameAPI.set_ability_release_id_list_value(l, i, v) end

--生成n个值为v的ABILITY_RELEASE_ID数组
---@param n integer # 长度
---@param v? py.AbilityReleaseId # 值
---@return py.List # 列表
function GameAPI.get_ability_release_id_n_list(n, v) end

--获取UI_POINT数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.FUIPoint # 值
function GameAPI.get_ui_point_list_value(l, i) end

--设置UI_POINT数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.FUIPoint # 值
function GameAPI.set_ui_point_list_value(l, i, v) end

--生成n个值为v的UI_POINT数组
---@param n integer # 长度
---@param v? py.FUIPoint # 值
---@return py.List # 列表
function GameAPI.get_ui_point_n_list(n, v) end

--获取FORCE_ENTITY数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.Force # 值
function GameAPI.get_force_entity_list_value(l, i) end

--设置FORCE_ENTITY数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.Force # 值
function GameAPI.set_force_entity_list_value(l, i, v) end

--生成n个值为v的FORCE_ENTITY数组
---@param n integer # 长度
---@param v? py.Force # 值
---@return py.List # 列表
function GameAPI.get_force_entity_n_list(n, v) end

--预设库 添加DAMAGE_ARMOR_TYPE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_damage_armor_type_kv(item_key, key, value) end

--预设库 添加ABILITY_RELEASE_ID键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_ability_release_id_kv(item_key, key, value) end

--预设库 添加UI_POINT键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_ui_point_kv(item_key, key, value) end

--预设库 添加FORCE_ENTITY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_force_entity_kv(item_key, key, value) end

--预设库 添加MOUSE_KEY_WITHOUT_MIDDLE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_mouse_key_without_middle_kv(item_key, key, value) end

--预设库 添加DAMAGE_ARMOR_TYPE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_damage_armor_type_kv(item_key, key, value) end

--预设库 添加ABILITY_RELEASE_ID键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_ability_release_id_kv(item_key, key, value) end

--预设库 添加UI_POINT键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_ui_point_kv(item_key, key, value) end

--预设库 添加FORCE_ENTITY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_force_entity_kv(item_key, key, value) end

--预设库 添加MOUSE_KEY_WITHOUT_MIDDLE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_mouse_key_without_middle_kv(item_key, key, value) end

--预设库 添加DAMAGE_ARMOR_TYPE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_damage_armor_type_kv(item_key, key, value) end

--预设库 添加ABILITY_RELEASE_ID键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_ability_release_id_kv(item_key, key, value) end

--预设库 添加UI_POINT键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_ui_point_kv(item_key, key, value) end

--预设库 添加FORCE_ENTITY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_force_entity_kv(item_key, key, value) end

--预设库 添加MOUSE_KEY_WITHOUT_MIDDLE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_mouse_key_without_middle_kv(item_key, key, value) end

--物品组取交集
---@param group1 py.ItemGroup # 物品组1
---@param group2 py.ItemGroup # 物品组2
---@return py.ItemGroup # 物品组
function GameAPI.api_get_item_group_intersection(group1, group2) end

--根据槽位交换物品
---@param unit py.Unit # 单位
---@param slot_type_1 py.SlotType # 物品槽位类型
---@param slot_id_1 integer # 槽位ID
---@param slot_type_2 py.SlotType # 物品槽位类型
---@param slot_id_2 integer # 槽位ID
function GameAPI.api_switch_unit_item_slot_by_slot_id(unit, slot_type_1, slot_id_1, slot_type_2, slot_id_2) end

--交换物品
---@param item1 py.Item # 物品
---@param item2 py.Item # 物品
function GameAPI.api_switch_item_slot(item1, item2) end

--获取运动器关联投射物
---@param mover_id py.Mover # 运动器
---@return py.ProjectileEntity # 关联投射物
function GameAPI.get_mover_relate_projectile(mover_id) end

--获取排行榜指定排名玩家的aid
---@param archive_key integer # 整数存档
---@param num integer # 排名
---@return string # 玩家aid
function GameAPI.get_aid_by_rank_info(archive_key, num) end

--单位-diablo设置主控单位
---@param role py.Role # 玩家
---@param unit py.Unit # 绑定单位
function GameAPI.api_diablo_set_control_unit(role, unit) end

--设置对象的闪烁效果
---@param log_obj py.Actor # 对象
---@param interval? number # interval
---@param time? number # time
---@param color_r? integer # R
---@param color_g? integer # G
---@param color_b? integer # B
---@param alpha? number # alpha
---@param exp? number # exp
---@param exp2? number # exp2
function GameAPI.api_set_obj_twinkle_parameters(log_obj, interval, time, color_r, color_g, color_b, alpha, exp, exp2) end

--获取本地玩家头像url
---@return string # 头像url
function GameAPI.steam_get_player_head_icon_url() end

--获取是否是大厅关卡
---@return boolean # bool
function GameAPI.get_is_steam_lobby() end

--获取本地玩家的名称
---@param role py.Role # 玩家
---@return py.Table # 物品表
function GameAPI.steam_get_player_storm_items(role) end

--steam设置头像(图片类型)
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param image_id string # steam头像key
function GameAPI.set_steam_player_icon(role, comp_name, image_id) end

--设置是否渲染场景
---@param is_open boolean # bool
function GameAPI.set_draw_ui(is_open) end

--获取本地游戏版本号
---@return integer # 本地游戏版本号
function GameAPI.get_local_game_version() end

--获取最新游戏版本号
---@return integer # 最新游戏版本号
function GameAPI.get_latest_game_version() end

--更新最新游戏版本号
function GameAPI.update_latest_game_version() end

--获取进行结算的玩家
---@param v py.RoleID # 玩家
---@return py.Role # 玩家
function GameAPI.get_settle_ladder_role(v) end

--获取进行结算的玩家新分数
---@param v integer # 玩家新分数
---@return integer # 玩家新分数
function GameAPI.get_settle_ladder_new_score(v) end

--获取进行结算的玩家匹配分修正值
---@param v integer # 玩家分差值
---@return integer # 玩家分差值
function GameAPI.get_settle_ladder_diff_value(v) end

--删除牵引力
---@param force_id py.Force # 牵引力
function GameAPI.api_destroy_force(force_id) end

--界面组件是否存在
---@param role py.Role # 玩家
---@param ui_comp string # 界面组件名称
---@return boolean # 是否存在
function GameAPI.ui_comp_role_exist(role, ui_comp) end

--设置ui文本多语言
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param text0 string # 文本
---@param text1? string # 拼接文本1
---@param text2? string # 拼接文本2
---@param text3? string # 拼接文本3
---@param text4? string # 拼接文本4
---@param text5? string # 拼接文本5
---@param text6? string # 拼接文本6
---@param text7? string # 拼接文本7
---@param text8? string # 拼接文本8
---@param text9? string # 拼接文本9
---@param text10? string # 拼接文本10
function GameAPI.set_ui_comp_text_multilingual(role, comp_name, text0, text1, text2, text3, text4, text5, text6, text7, text8, text9, text10) end

--设置技能按钮施法的时机
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param release_timing integer # 施法时机
function GameAPI.api_set_ability_release_timing(role, comp_name, release_timing) end

--设置道具栏控件类型和槽位号
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param unit py.Unit # 单位
---@param slot_type py.SlotType # 类型
---@param slot_index integer # 槽位id
function GameAPI.set_ui_comp_unit_slot_new(role, comp_name, unit, slot_type, slot_index) end

--通过预制实例获得ui控件
---@param prefab_ins py.UIPrefabIns # 预制
---@return string # 控件uid
function GameAPI.get_ui_comp_by_prefab_ins(prefab_ins) end

--获取ui坐标的x坐标
---@param point py.FUIPoint # 坐标
function GameAPI.get_ui_point_x(point) end

--获取ui坐标的y坐标
---@param point py.FUIPoint # 坐标
function GameAPI.get_ui_point_y(point) end

--世界坐标转小地图坐标
---@param pos py.Point # point
---@param comp_name string # 控件uid
function GameAPI.get_mini_map_node_pos_point_from_world_pos(pos, comp_name) end

--设置小地图右键寻路可用性
---@param comp_name string # 控件uid
---@param enabled boolean # enabled
function GameAPI.set_mini_map_move_enabled(comp_name, enabled) end

--根据图片的透明区域设置小地图点击范围
---@param comp_name string # 控件uid
---@param texture py.Texture # 图片
function GameAPI.api_enable_mini_map_alpha_click_range(comp_name, texture) end

--关闭根据图片的透明区域设置小地图点击范围
---@param comp_name string # 控件uid
function GameAPI.api_disable_mini_map_alpha_click_range(comp_name) end

--在小地图上播放序列帧
---@param world_pos py.Point # 世界坐标
---@param sequence_resource py.Sequence # 序列帧资源
---@param source_player py.Role # 发送信号的玩家
---@param visible_type py.SignalVisibleType # 可见类型
function GameAPI.create_frame_sequence_on_mini_map(world_pos, sequence_resource, source_player, visible_type) end

--设置图片保持原尺寸
---@param role py.Role # 玩家
---@param comp_uid string # 控件uid
---@param size_adaptive boolean # 保持原尺寸
function GameAPI.set_ui_image_size_adaptive(role, comp_uid, size_adaptive) end

--获取本地玩家语言
---@return string # language
function GameAPI.get_local_player_language() end

--设置UI模型控件光照颜色
---@param player py.Role # 玩家
---@param comp_name string # UI控件
---@param r number # R
---@param g number # G
---@param b number # B
function GameAPI.set_ui_model_sun_color(player, comp_name, r, g, b) end

--设置UI模型控件光照方向
---@param player py.Role # 玩家
---@param comp_name string # UI控件
---@param rotation number # 纬度
---@param longitude number # 经度
function GameAPI.set_ui_model_sun_direction(player, comp_name, rotation, longitude) end

--取消建筑升级
---@param unit py.Unit # 单位
---@param return_res? boolean # 是否返还资源
function GameAPI.cancel_build_upgrade(unit, return_res) end

--开始建筑升级
---@param unit py.Unit # 单位
---@param upgrade_entity_no py.UnitKey # 目标单位物编ID
---@param keep_custom_kv_tag? boolean # 是否保留自定义kv
function GameAPI.start_build_upgrade(unit, upgrade_entity_no, keep_custom_kv_tag) end

--获取建筑升级列表
---@param unit py.Unit # 单位
---@return py.Table # 可升级的单位编号一维表
function GameAPI.get_build_upgrade_list(unit) end

--设置建筑升级列表
---@param unit py.Unit # 单位
---@param lua_table py.Table # 单位编号一维表
function GameAPI.set_build_upgrade_list(unit, lua_table) end

--获取建筑升级进度
---@param unit py.Unit # 单位
---@return py.Fixed # 进度
function GameAPI.get_build_upgrade_progress(unit) end

--设置建筑升级进度
---@param unit py.Unit # 单位
---@param progress py.Fixed # 进度
function GameAPI.set_build_upgrade_progress(unit, progress) end

--获取建筑升级速率
---@param unit py.Unit # 单位
---@return py.Fixed # 速率
function GameAPI.get_build_upgrade_factor(unit) end

--设置建筑升级速率
---@param unit py.Unit # 单位
---@param factor py.Fixed # 速率
function GameAPI.set_build_upgrade_factor(unit, factor) end

--单位组取交集
---@param unit_group1 py.UnitGroup # 单位组1
---@param unit_group2 py.UnitGroup # 单位组2
---@return py.UnitGroup # 单位组
function GameAPI.get_unit_group_intersect(unit_group1, unit_group2) end

--设置单次建造的模拟状态
---@param idx py.AbilityReleaseId # 整数索引值
---@param is_dry_run boolean # 是否仅模拟
function GameAPI.set_use_skill_dry_run_state(idx, is_dry_run) end

--投射物组取交集
---@param group1 py.ProjectileGroup # 投射物组1
---@param group2 py.ProjectileGroup # 投射物组2
---@return py.ProjectileGroup # 投射物组
function GameAPI.get_projectile_group_intersection(group1, group2) end

--装饰物替换模型贴图
---@param deco_id py.DecoID # 装饰物ID
---@param material_id integer # 材质 id
---@param layer_id integer # layer id
---@param texture py.Texture # 贴图
function GameAPI.set_deco_texture(deco_id, material_id, layer_id, texture) end

--玩家组取交集
---@param group1 py.RoleGroup # 玩家组1
---@param group2 py.RoleGroup # 玩家组2
---@return py.RoleGroup # 玩家组
function GameAPI.api_get_role_group_intersection(group1, group2) end

--获取指定形状内的所有物品新
---@param point py.Point # 区域对象
---@param shape py.Shape # 形状
---@param sort_type? py.SortType # 排序类型
---@param filter_ability? py.Ability # 筛选技能
---@return py.ItemGroup # 物品组
function GameAPI.get_all_items_in_shapes_new(point, shape, sort_type, filter_ability) end

--获取物编名称/描述多语言key
---@param data_key string # 物编类型
---@param entity_id integer # 物编对象
---@param name_or_desc string # 名称/描述
---@return string # 多语言key
function GameAPI.get_object_multilingual_key(data_key, entity_id, name_or_desc) end
