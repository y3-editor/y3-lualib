require 'y3.game.game_event'

---@class Game
local M = Class 'Game'

---设置物体的材质
---@param obj Unit
---@param mat integer 材质
---@param r number 红
---@param g number 绿
---@param b number 蓝
---@param intensity number 强度
---@param alpha number 透明度
function M.set_material_param(obj, mat, r, g, b, intensity, alpha)
    GameAPI.set_material_param(
        obj.handle,
        mat,
        r,
        g,
        b,
        intensity,
        alpha
    )
end

---清除单位类型键值
---@param unit_key py.UnitKey 单位id
---@param key string 键
function M.remove_unit_kv(unit_key, key)
    GameAPI.del_unit_key_kv(unit_key, key)
end

---清除物品类型键值
---@param item_key py.ItemKey 物品id
---@param key string 键
function M.remove_item_kv(item_key, key)
    GameAPI.del_item_key_kv(item_key, key)
end

---清除技能类型键值
---@param ability_key py.AbilityKey 技能id
---@param key string 键
function M.remove_ability_kv(ability_key, key)
    GameAPI.del_ability_key_kv(ability_key, key)
end

---获得阵营
---@param id py.CampID 阵营id
---@return py.Camp
function M.get_camp_by_id(id)
    return GameAPI.get_camp_by_camp_id(id)
end

---设置阴影距离
---@param dis number 距离
function M.set_cascaded_shadow_distance(dis)
    GameAPI.set_cascaded_shadow_distance(dis)
end

---字符串转单位命令类型
---@param str string 字符串
---@return py.UnitCommandType # 单位命令类型
function M.str_to_unit_command_type(str)
    return GlobalAPI.str_to_unit_command_type(str)
end

---字符串转技能释放类型
---@param str string 字符串
---@return py.AbilityCastType # 技能释放类型
function M.str_to_ability_cast_type(str)
    return GlobalAPI.str_to_ability_cast_type(str)
end

---字符串转链接特效
---@param str string 字符串
---@return py.SfxKey # 链接特效
function M.str_to_link_sfx_key(str)
    return GameAPI.str_to_link_sfx_key(str)
end

---字符串转玩家关系
---@param str string 字符串
---@return py.RoleRelation # 玩家关系
function M.str_to_role_relation(str)
    return GlobalAPI.str_to_role_relation(str)
end

---字符串转单位分类
---@param str string 字符串
---@return py.UnitType # 单位分类
function M.str_to_unit_type(str)
    return GlobalAPI.str_to_unit_type(str)
end

---字符串转单位类型
---@param str string 字符串
---@return py.UnitKey # 单位类型
function M.str_to_unit_key(str)
    return GameAPI.str_to_unit_key(str)
end

---字符串转单位属性
---@param str string 字符串
---@return string # 单位属性
function M.str_to_unit_name(str)
    return GameAPI.str_to_unit_attr(str)
end

---字符串转物品类型
---@param str string 字符串
---@return py.ItemKey # 物品类型
function M.str_to_item_key(str)
    return GameAPI.str_to_item_key(str)
end

---字符串转玩家属性
---@param str string 字符串
---@return py.RoleResKey 3 玩家属性
function M.str_to_role_res(str)
    return GameAPI.str_to_role_res(str)
end

---字玩家状态转字符串
---@param status py.RoleStatus
---@return string
function M.str_to_role_status(status)
    return GlobalAPI.role_status_to_str(status)
end

---字符串转玩家控制状态
---@param str string 字符串
---@return py.RoleType # 玩家控制状态
function M.str_to_role_type(str)
    return GlobalAPI.str_to_role_type(str)
end

---字符串转技能类型
---@param str string 字符串
---@return py.AbilityKey # 技能类型
function M.str_to_ability_key(str)
    return GameAPI.str_to_ability_key(str)
end

---字符串转技能槽位类型
---@param str string 字符串
---@return py.AbilityType # 技能槽位类型
function M.str_to_ability_type(str)
    return GlobalAPI.str_to_ability_type(str)
end

---字符串转可破坏物类型
---@param str string 字符串
---@return py.DestructibleKey # 可破坏物类型
function M.str_to_dest_key(str)
    return GameAPI.str_to_dest_key(str)
end

---字符串转投射物类型
---@param str string 字符串
---@return py.ProjectileKey # 投射物类型
function M.str_to_project_key(str)
    return GameAPI.str_to_project_key(str)
end

---字符串转特效
---@param str string 字符串
---@return py.SfxKey # 特效
function M.str_to_particle_sfx_key(str)
    return GameAPI.str_to_particle_sfx_key(str)
end

---字符串转科技类型
---@param str string 字符串
---@return py.TechKey # 科技类型
function M.str_to_tech_key(str)
    return GameAPI.str_to_tech_key(str)
end

---字符串转模型类型
---@param str string 字符串
---@return py.ModelKey # 模型类型
function M.str_to_model_key(str)
    return GameAPI.str_to_model_key(str)
end

---字符串转魔法效果类型
---@param str string 字符串
---@return py.ModifierKey # 魔法效果类型
function M.str_to_modifier_key(str)
    return GameAPI.str_to_modifier_key(str)
end

---字符串转魔法效果影响类型
---@param str string 字符串
---@return py.ModifierEffectType # 魔法效果影响类型
function M.str_to_modifier_effect_type(str)
    return GlobalAPI.str_to_modifier_effect_type(str)
end

---字符串转魔法效果类别
---@param str string 字符串
---@return py.ModifierType # 魔法效果类别
function M.str_to_modifier_type(str)
    return GlobalAPI.str_to_modifier_type(str)
end

---字符串转阵营
---@param str string 字符串
---@return py.Camp # 阵营
function M.str_to_camp(str)
    return GameAPI.str_to_camp(str)
end

---字符串转键盘按键
---@param str string 字符串
---@return py.KeyboardKey # 键盘按键
function M.str_to_keyboard_key(str)
    return GlobalAPI.str_to_keyboard_key(str)
end

---字符串转鼠标按键
---@param str string 字符串
---@return py.MouseKey # 鼠标按键
function M.str_to_mouse_key(str)
    return GlobalAPI.str_to_mouse_key(str)
end

---字符串转鼠标滚轮
---@param str string 字符串
---@return py.MouseWheel # 鼠标滚轮
function M.str_to_mouse_wheel(str)
    return GlobalAPI.str_to_mouse_wheel(str)
end

---字符串转平台道具类型
---@param str string 字符串
---@return py.StoreKey store_key 平台道具类型
function M.str_to_store_key(str)
    return GameAPI.str_to_store_key(str)
end

---字符串转伤害类型
---@param str string 字符串
---@return integer # 伤害类型
function M.str_to_damage_type(str)
    return GlobalAPI.str_to_damage_type(str)
end

---字符串转单位属性类型
---@param str string 字符串
---@return string # 单位属性类型
function M.str_to_unit_attr_type(str)
    return GlobalAPI.str_to_unit_attr_type(str)
end

---字符串转声音类型
---@param str string 字符串
---@return py.AudioKey # 声音类型
function M.str_to_audio_key(str)
    return GameAPI.str_to_audio_key(str)
end

---根据图片ID获取图片
---@param id integer
---@return py.Texture texture
function M.get_icon_id(id)
    return GameAPI.get_texture_by_icon_id(id)
end

---设置某点的地形纹理
---@param point Point 点
---@param terrain_type integer 纹理类型
---@param range integer 范围
---@param area_type integer 形状
function M.modify_point_texture(point, terrain_type, range, area_type)
    -- TODO 见问题2
    ---@diagnostic disable-next-line: param-type-mismatch
    GameAPI.modify_point_texture(point.handle, terrain_type, range, area_type)
end

---获取地形纹理
---@param point Point 点
---@return integer
function M.get_point_texture(point)
    -- TODO 见问题2
    ---@diagnostic disable-next-line: param-type-mismatch
    return GameAPI.get_texture_type(point.handle)
end

---替换地形纹理
---@param area Area 区域
---@param old_texture integer 纹理类型
---@param new_texture integer 纹理类型
function M.replace_area_texture(area, old_texture, new_texture)
    GameAPI.replace_point_texture(area.handle, old_texture, new_texture)
end

---设置区域天气
---@param area Area 区域
---@param weather integer 天气
function M.set_area_weather(area, weather)
    GameAPI.update_area_weather(area.handle, weather)
end

---设置全局天气
---@param weather integer 天气
function M.set_global_weather(weather)
    GameAPI.update_global_weather(weather)
end

---设置雾效属性
---@param fog table 局部雾
---@param direction number 朝向
---@param pos_x number 位置x
---@param pos_y number 位置y
---@param pos_z number 位置z
---@param scale_x number 缩放x
---@param scale_y number 缩放y
---@param scale_z number 缩放z
---@param red number 颜色r
---@param green number 颜色g
---@param blue number 颜色b
---@param concentration number 浓度
---@param speed number 流速
function M.set_fog_attribute(fog, direction, pos_x, pos_y, pos_z, scale_x, scale_y, scale_z, red, green, blue, concentration, speed)
    GameAPI.set_fog_attr(fog, 4095, direction, pos_x, pos_y, pos_z, scale_x, scale_y, scale_z, red, green, blue, concentration, speed)
end

---设置雾效属性(新)
---@param fog table 局部雾
---@param attr string 朝向
---@param value number 位置x
function M.set_fog_attr(fog,attr,value)
    GameAPI.set_fog_attr_new(fog,attr,value)
end

---设置阴影距离
---@param distance number 距离
function M.set_cascaded_shadow_distanc(distance)
    GameAPI.set_cascaded_shadow_distance(distance)
end

---开关级联阴影
---@param is_enable boolean 开关
function M.set_cascaded_shadow_enable(is_enable)
    GameAPI.set_cascaded_shadow_enable(is_enable)
end

---为玩家切换画风
---@param player Player 玩家
---@param processing py.PostEffect 画风
function M.set_post_effect(player, processing)
    GameAPI.set_post_effect(player.handle, processing)
end

---获取科技最大等级
---@param tech_id py.TechKey 科技id
---@return integer level 最大等级
function M.get_tech_max_level(tech_id)
    return GameAPI.get_tech_max_level(tech_id)
end

---获取科技图标
---@param tech_id py.TechKey 科技
---@param index integer 等级
---@return py.Texture texture 图标id
function M.get_tech_icon(tech_id, index)
    return GameAPI.api_get_tech_icon(tech_id, index)
end

---获取科技类型的描述
---@param tech_id py.TechKey 科技类型
---@return string description 描述
function M.get_tech_description(tech_id)
    return GameAPI.get_tech_desc_by_type(tech_id)
end

---获取科技类型的名称
---@param tech_id py.TechKey 科技类型
---@return string name 名称
function M.get_tech_name(tech_id)
    return GameAPI.get_tech_name_by_type(tech_id)
end

---结束玩家游戏
---@param player Player 玩家
---@param result string 结果
---@param is_show boolean 是否展示界面
function M.end_player_game(player, result, is_show)
    GameAPI.set_melee_result_by_role(player.handle, result, is_show, false, 0, false)
end

---暂停游戏
function M.pause_game()
    GameAPI.pause_game()
end

---开始新一轮游戏
---@param fast_restart boolean 快速重置
function M.restart_game(fast_restart)
    GameAPI.request_new_round(fast_restart)
end

---开启软暂停
function M.enable_soft_pause()
    GameAPI.api_soft_pause_game()
end

---恢复软暂停
function M.resume_soft_pause()
    GameAPI.api_soft_resume_game()
end

---设置伤害系数
---@param attack_type integer 攻击类型
---@param armor_type integer 护甲类型
---@param ratio number 系数
function M.set_damage_factor(attack_type, armor_type, ratio)
    GameAPI.set_damage_ratio(attack_type, armor_type, Fix32(ratio))
end

---设置复合属性
---@param primary_attribute string 一级属性
---@param secondary_attr string 二级属性
---@param value number 属性值
function M.set_compound_attributes(primary_attribute, secondary_attr, value)
    GameAPI.set_slave_coeff(primary_attribute, secondary_attr, Fix32(value))
end

---设置游戏时间的流逝速度
---@param speed number 速度
function M.set_day_night_speed(speed)
    GameAPI.set_day_and_night_time_speed(speed)
end

---设置游戏时间
---@param time number 时间
function M.set_day_night_time(time)
    GameAPI.set_day_and_night_time(time)
end

---创建人造时间
---@param time number 时间
---@param dur number 持续时间
function M.create_day_night_human_time(time, dur)
    GameAPI.create_day_and_night_human_time(time, dur)
end

---设置随机数种子
---@param seed integer 随机种子
function M.set_random_seed(seed)
    GameAPI.set_random_seed(seed)
end

---开关时间流逝
---@param is_on boolean 开关
function M.toggle_day_night_time(is_on)
    GameAPI.open_or_close_time_speed(is_on)
end

---开关目标点的草丛
---@param is_on boolean 开关
---@param point Point 点
function M.enable_grass_by_pos(is_on, point)
    ---@diagnostic disable-next-line: param-type-mismatch
    GameAPI.set_grass_enable_by_pos(is_on, point.handle)
end

---获取当前游戏模式
---@return py.GameMode game_mode 游戏模式
function M.get_current_game_mode()
    return GameAPI.get_game_mode()
end

---@return number language_type 语言环境
---获取本地语言环境
function M.get_local_language_environment()
    return GameAPI.get_client_language_type()
end

---@return number time  时间
---游戏已运行的时间
function M.current_game_run_time()
    return GameAPI.get_cur_game_time():float()
end

---@return number time 时间
---获取游戏当前时间
function M.get_current_game_time()
    return GameAPI.get_cur_day_and_night_time():float()
end

---@param attack_type number 攻击类型
---@param area_type number 护甲类型
---@return number factor 伤害系数
---获取伤害系数
function M.get_damage_factor(attack_type, area_type)
    return GameAPI.get_damage_ratio(attack_type, area_type)
end

---@param primary_attribute number 一级属性
---@param secondary_attr number 二级属性
---@return number coefficient 系数
---获取三维属性的影响系数
function M.get_coefficient(primary_attribute, secondary_attr)
    return GameAPI.get_slave_coeff(primary_attribute, secondary_attr)
end

---@return number start_mode 游戏环境
---获取本局游戏环境
function M.get_game_environment_of_current_round()
    return GameAPI.api_get_start_mode()
end

---@param name string 存档名
---@return string archive 存档
---获取全局存档
function M.get_global_archive(name)
    return GameAPI.get_global_map_archive(name)
end

---@param file string 存档
---@param index number 序号
---@return string value 存档值
---获取整数存档排行榜玩家存档值
function M.get_archive_rank_player_archive_value(file, index)
    return GameAPI.get_archive_rank_player_archive_value(file, index)
end

---@return boolean is_open 是否开启
---是否开启三维属性
function M.if_pri_attr_state_open()
    return GameAPI.api_if_pri_attr_state_open()
end

---@return Projectile projectile 投射物 
---获取运动器绑定投射物 
function M.get_mover_bound_projectiles()
    local py_projectile = GameAPI.get_projectile_by_id(data['mover_owner_projectile'])
    return projectile.get_by_handle(py_projectile)
end

---@return number level 等级
---获取科技变化的等级
function M.get_tech_changed_level()
    return GameAPI.get_last_changed_tech()
end

---@param data table 触发器回调函数中的data
---@return Buff modifier 魔法效果
---触发魔法效果
function M.trigger_modifier(data)
    local py_modifier = data['__modifier']
    return M.modifier.get_by_handle(py_modifier)
end

---@return number tech 科技
---被研究科技  
function M.tech_researched()
    return
end

---@param data table 触发器回调函数中的data
---@return Unit unit 事件中的单位
---获取事件中的单位  
function M.get_unit_in_event(data)
    local py_unit = GameAPI.get_unit_by_id(data['__unit_id'])
    return M.unit.get_by_handle(py_unit)
end

---@param data table 触发器回调函数中的data
---@return Unit unit 魔法效果携带者
---魔法效果携带者
function M.modifier_receiver(data)
    local py_unit = data['__owner_unit']
    return M.unit.get_by_handle(py_unit)
end

---@param ability Ability 技能
---@return Unit unit 拥有者
---获取技能的拥有者
function M.get_ability_owner(ability)
    local py_unit = ability.handle.api_get_owner()
    return M.unit.get_by_handle(py_unit)
end

---@param modifier Buff 魔法效果
---@return Unit provider 施加者
---魔法效果施加者
function M.modifier_provider(modifier)
    local py_unit = modifier.handle.api_get_releaser()
    return M.unit.get_by_handle(py_unit)
end

---@param ability Ability 技能
---@param data table 触发器回调函数中的data
---@return Item item 目标物品
---技能选取的目标物品
function M.ability_selected_target_item(ability, data)
    local py_item = GameAPI.get_target_item_in_ability(ability.handle, data['__ability_runtime_id'])
    return M.item.get_by_handle(py_item)
end

---@return Buff modifier 魔法效果
---遍历到的魔法效果
function M.picked_modifier()
    local py_modifier = data['modifier_iter']
    return M.modifier.get_by_handle(py_modifier)
end

---@param data table 触发器回调函数中的data
---@return Player player 玩家
---触发当前事件的玩家
function M.player_that_triggered_current_event(data)
    return GameAPI.get_role_by_role_id(data['__role_id'])
end

---@param data table 触发器回调函数中的data
---@return Projectile projectile 投射物   
---触发当前事件的投射物
function M.projectile_that_triggered_current_event(data)
    local py_projectile = data['projectile']
    return M.projectile.get_by_handle(py_projectile)
end

--单位失去科技  --未处理
-- ---@return TECH_KEY
-- function y3.unit_loses_tech()
--     return y3.get_unit_by_id(1).api_remove_tech(201385996)
-- end


---@param ability Ability 技能
---@param data table 触发器回调函数中的data
---@return Unit unit 目标单位  
---技能选取的目标单位  
function M.ability_selected_target_unit(ability, data)
    local py_unit = GameAPI.get_target_unit_in_ability(ability.handle, data['__ability_runtime_id'])
    return M.unit.get_by_handle(py_unit)
end

---@param data table 触发器回调函数中的data
---@return number 变化值
---获取魔法效果层数变化值
function M.get_modifier_stack_changed_value(data)
    return data['__layer_change_values']
end

---@return Buff modifier 魔法效果
---已有的魔法效果
function M.existing_modifier()
    return
end

---@return number tech_key 科技
---等级升降的科技
function M.tech_upgraded_or_downgraded()
    return GameAPI.get_last_operated_tech()
end

---@return Item item 物品
---遍历物品组时选中的物品
function M.item_selected_in_picking_item_group()
    return
end

---@return Buff modifier 魔法效果 
---新增的魔法效果 
function M.new_modifier()
    return
end

---@return number tech_key 等级变化的科技
---等级变化的科技
function M.level_changed_tech()
    return GameAPI.get_last_changed_tech()
end

---@param data table 触发器回调函数中的data
---@return Unit unit 单位
---获取承受伤害（治疗）的单位
function M.get_damage_or_healing_target_unit(data)
    local py_unit = data['__target_unit']
    return M.unit.get_by_handle(py_unit)
end

---@return Unit unit 单位
---获取单位组中遍历到的单位
function M.picked_unit_in_unit_group()
    return
end

---@param data table 触发器回调函数中的data
---@return Unit unit 单位
---获取凶手单位
function M.get_killer_unit(data)
    local py_unit = data['__source_unit']
    return M.unit.get_by_handle(py_unit)
end

---@return Projectile projectile 投射物
---获取遍历到的投射物
function M.get_picked_projectile()
    return
end

---@param data table 触发器回调函数中的data
---@return Unit unit 单位
---获取死亡单位
function M.get_dead_unit(data)
    local py_unit = data['__target_unit']
    return M.unit.get_by_handle(py_unit)
end

---@param data table 触发器回调函数中的data
---@return Unit unit 单位
---获取施加伤害（治疗）的单位
function M.Get_Damage_or_Healing_Source_Unit(data)
    local py_unit = data['__source_unit']
    return M.unit.get_by_handle(py_unit)
end

---@return Unit unit 单位
---获得物品单位
function M.unit_to_gain_item()
    local py_unit = GameAPI.get_last_add_item_unit()
    return M.unit.get_by_handle(py_unit)
end

---@return Unit unit 单位
---失去物品单位
function M.unit_to_lose_item()
    local py_unit = GameAPI.get_last_remove_item_unit()
    return M.unit.get_by_handle(py_unit)
end

---@return Unit unit 单位
---使用物品单位
function M.unit_to_use_item()
    local py_unit = GameAPI.get_last_use_item_unit()
    return M.unit.get_by_handle(py_unit)
end

---@return Unit unit 单位
---堆叠层数变化物品的持有者
function M.unit_to_change_stacks()
    local py_unit = GameAPI.get_last_change_item_stack_unit()
    return M.unit.get_by_handle(py_unit)
end

---@return Unit unit 单位
---最后进行合成操作的单位
function M.unit_to_undergo_composition()
    return
end

---@return Unit unit 单位
---获取即将获得魔法效果单位
function M.get_unit_about_to_gain_modifier(modifier)
    local py_unit = modifier.handle.api_get_will_modifier_unit()
    return M.unit.get_by_handle(py_unit)
end

---@return Unit unit 单位
---最后进行购买操作的单位
function M.last_unit_to_make_purchase()
    local py_unit = ''
    return M.unit.get_by_handle(py_unit)
end

---@return Unit unit 单位
---最后进行出售操作的单位
function M.last_unit_to_make_sale()
    local py_unit = GameAPI.get_last_seller_unit()
    return M.unit.get_by_handle(py_unit)
end

---@return Unit unit 单位
---研究科技的单位   
function M.unit_to_research_tech()
    return
end

---@return Unit unit 单位
---获得科技的单位  
function M.unit_to_gain_tech()
    return
end

---@return Unit unit 单位
---失去科技单位 
function M.unit_to_lose_tech()
    return
end

---@param data table 触发器回调函数中的data
---@return number index 索引   
---获取当前数组索引  
function M.get_current_array_index(data)
    return data['__iter_index']
end

---@param data table 触发器回调函数中的data
---@return Ability ability 技能
---触发当前事件的技能
function M.ability_that_triggered_current_event(data)
    local py_ability = GameAPI.get_ability_by_id(data['__ability'])
    return M.ability.get_by_handle(py_ability)
end

---@return Ability ability 技能
---遍历到的技能
function M.picked_ability()
    return
end

---@param ability Ability 技能
---@param data table 触发器回调函数中的data
---@return Destructible destructible 可破坏物
---技能选取的目标可破坏物
function M.ability_selected_destructible(ability, data)
    local py_destructible = GameAPI.get_target_dest_in_ability(ability.handle, data['__ability_runtime_id'])
    return M.destructible.get_by_handle(py_destructible)
end

---@return Destructible destructible 可破坏物
---遍历到的可破坏物 
function M.picked_destructible()
    return
end

---@param data table 触发器回调函数中的data
---@return Destructible destructible 可破坏物
---事件中的可破坏物  
function M.destructible_in_event(data)
    local py_destructible = GameAPI.get_dest_by_id(data['__destructible_id'])
    return M.destructible.get_by_handle(py_destructible)
end

---@param data table 触发器回调函数中的data
---@return number value 伤害数值
---触发当前事件的伤害的数值  
function M.damage_value_that_triggered_current_event(data)
    return GameAPI.get_hurt_damage(data['__damage'])
end

---@param data table 触发器回调函数中的data
---@return Item item 物品
---触发当前事件的物品
function M.item_that_triggered_current_event(data)
    local py_item = GameAPI.get_item(data['__item_id'])
    return M.item.get_by_handle(py_item)
end

---@return Item item 物品
---单位获得物品
function M.unit_gains_item()
    local py_item = GameAPI.get_last_add_item()
    return M.item.get_by_handle(py_item)
end

---@return Item item 物品
---单位失去物品
function M.unit_loses_item()
    local py_item = GameAPI.get_last_remove_item()
    return M.item.get_by_handle(py_item)
end

---@return Item item 物品
---单位使用物品
function M.unit_uses_item()
    local py_item = GameAPI.get_last_use_item()
    return M.item.get_by_handle(py_item)
end

---@return Item item 物品
---堆叠层数变化物品
function M.item_whose_stack_changed()
    local py_item = GameAPI.get_last_stack_changed_item()
    return M.item.get_by_handle(py_item)
end

---@return Item item 物品
---充能变化物品
function M.item_whose_charge_changed()
    local py_item = GameAPI.get_last_stack_changed_item()
    return M.item.get_by_handle(py_item)
end

---@return Item item 物品
---购买物品
function M.item_purchased()
    local py_item = GameAPI.get_last_buy_shop_item()
    return M.item.get_by_handle(py_item)
end

---@return Item item 物品
---出售物品
function M.item_sold()
    local py_item = GameAPI.get_last_sell_shop_item()
    return M.item.get_by_handle(py_item)
end

---@return Buff modifier 魔法效果
---即将获得魔法效果类型
function M.about_to_gain_modifier_type()
    return
end

---@return Player player 玩家
---遍历到的玩家 
function M.picked_player()
    return
end

---@param ability Ability 技能
---@param data table 触发器回调函数中的data
---@return Point point 点
---技能选取到的点
function M.selected_location_by_ability(ability, data)
    local py_point = ability.handle:api_get_release_position(data['__ability_runtime_id'])
    return M.get_by_handle(py_point)
end

---@return Area area 矩形区域
---遍历到的矩形区域
function M.picked_rectangle()
    return
end

---@return Area area 矩形区域
---遍历到的圆形区域
function M.picked_circle()
    return
end

---@param data table 触发器回调函数中的data
---@return string string 字符串
---事件中的字符串
function M.string_in_event(data)
    return data['__str1']
end

---@return Unit unit 单位
---运动器碰撞单位
function M.mover_collision_unit()
    local py_unit = GameAPI.get_mover_collide_unit()
    return M.unit.get_by_handle(py_unit)
end

---@param data table 触发器回调函数中的data
---@return Unit unit 单位
---获取可破坏物事件中的单位
function M.get_unit_in_destructible_event(data)
    local py_unit = GameAPI.get_unit_by_id(data['__unit_id_of_hurt_dest'])
    return M.unit.get_by_handle(py_unit)
end

---@return Road path 路径  
---遍历时选中的路径  
function M.path_selected_in_picking()
    return
end

---@return number value 当前循环值
---获取当前循环
function M.get_current_loop()
    return
end

---@param data table 触发器回调函数中的data
---@return number damage_type
---获取当前伤害类型  
function M.get_current_damage_type(data)
    return data['__damage_type']
end

---@param data table 触发器回调函数中的data
---@return number role_res_key
---事件中的玩家资源类型
function M.player_resource_type_involved_in_the_event(data)
    return data['__res_key']
end

---@param data table 触发器回调函数中的data
---@return unit_group unit_group 单位组
---事件中的单位组
function M.unit_group_involved_in_the_event(data)
    local py_unit_group = data.unit_group
    return M.unit_group.create_lua_unit_group_from_py(py_unit_group)
end

---@param data table 触发器回调函数中的data
---@return purchase store_key 平台道具
---当前平台道具
function M.current_purchasable(data)
    local py_purchase = data['__store_key']
    return M.purchase.get_by_handle(py_purchase)
end

---@param value number 实数
---@return number angle 角度
---实数转角度
function M.convert_float_to_angle(value)
    return Fix32(value)
end

---@param value number 角度
---@return number value 实数
---角度转实数
function M.convert_angle_to_float(value)
    return Fix32(value)
end

---@param value number 整数
---@return number 图片id
---整数转图片   
function M.convert_integer_to_image(value)
    return
end

---@param ability Ability 技能
---@param data table 触发器回调函数中的data
---@return number angel 方向
---获取技能释放方向
function M.get_ability_cast_direction(ability, data)
    return ability.api_get_release_direction(data['__ability_runtime_id'])
end

---@return number role_res_key 玩家属性 
---遍历到的玩家属性 
function M.picked_player_attributes()
    return
end

---@param data table 触发器回调函数中的data
---@return Unit unit 单位
---可破坏物死亡事件中的单位
function M.unit_in_destroy_destructible_event(data)
    local py_unit = GameAPI.get_unit_by_id(data['__unit_id_of_dest_killer'])
    return M.unit.get_by_handle(py_unit)
end

---@param data table 触发器回调函数中的data
---@return Unit unit 单位
---可破坏物受伤事件中的单位
function M.unit_in_destructible_is_damaged_event(data)
    local py_unit = GameAPI.get_unit_by_id(data['__unit_id_of_hurt_dest'])
    return M.unit.get_by_handle(py_unit)
end

---@param data table 触发器回调函数中的data
---@return Unit unit 单位
---可破坏物被采集事件中的单位
function M.unit_in_destructible_is_gathered_event(data)
    local py_unit = GameAPI.get_unit_by_id(data['__unit_id_in_dest_event'])
    return M.unit.get_by_handle(py_unit)
end

---@param data table 触发器回调函数中的data
---@return number value 变化值
---可破坏物事件中的资源变化值
function M.resource_change_value_in_destructible_event(data)
    return data['__res_chg_cnt_in_dest_event']
end

---@param data table 触发器回调函数中的data
---@return Ability ability 技能对象
---可破坏物事件中的技能对象
function M.ability_in_destructible_event(data)
    local py_ability = GameAPI.get_ability_by_id(data['__ability_in_dest_event'])
    return M.ability.get_by_handle(py_ability)
end

---@param data table 触发器回调函数中的data
---@return number count 个数
---可破坏物事件中的采集的玩家属性个数
function M.number_of_player_attributes_gathered_in_destructible_event(data)
    return data['__role_res_cnt_in_event']
end

---@param data table 触发器回调函数中的data
---@return number 伤害值
---可破坏物事件中的伤害值
function M.damage_value_in_destructible_event(data)
    return data['__damage_value_of_hurt_dest']
end

---@return number tech_key 科技
---遍历到的科技
function M.picked_tech()
    return
end

---@return Area area 区域
---遍历到的多边形区域
function M.picked_polygon()
    return
end

---@return Point point 点
---遍历到的点
function M.picked_point()
    return
end

---@param data table 触发器回调函数中的data
---@return Ability ability 技能
---获取事件中的技能
function M.get_ability_by_unit_and_seq(data)
    return GameAPI.api_get_ability_by_unit_and_seq(data['__unit_id'], data['__ability_seq'])
end

---@param data table 触发器回调函数中的data
---@return Unit unit 单位
---获取事件中的建造单位
function M.get_build_unit(data)
    local py_unit = data['__build_unit_id']
    return M.unit.get_by_handle(py_unit)
end

---@param data table 触发器回调函数中的data
---@return number value 数值
---获取本次治疗的数值（结算前）
function M.get_healing_value_before_settlement(data)
    return data['__cured_value']
end

---@param data table 触发器回调函数中的data
---@return Unit unit 单位
---获取运动器绑定单位
function M.get_mover_bound_units(data)
    local py_unit = GameAPI.get_unit_by_id(data['mover_owner_unit'])
    return M.unit.get_by_handle(py_unit)
end

---@param player Player 玩家
---@return unit_group unit_group 所有单位
---属于某玩家的所有单位
function M.all_units_belonging_to_specified_player(player)
    local py_unit_group = player.handle.get_all_unit_id()
    return M.unit_group.create_lua_unit_group_from_py(py_unit_group)
end

---@param unit_id number 单位类型
---@return unit_group unit_group 单位组
---指定单位类型的单位
function M.unit_of_a_specified_unit_type(unit_id)
    local py_unit_group = GameAPI.get_units_by_key(unit_id)
    return M.unit_group.create_lua_unit_group_from_py(py_unit_group)
end

---@param unit_group unit_group 单位组
---@param count number 数量
---@return unit_group unit_group 单位组
---单位组中随机整数个单位
function M.integer_random_units_from_unit_group(unit_group, count)
    local py_unit_group = GameAPI.get_random_n_unit_in_group(unit_group.handle, count)
    return M.unit_group.create_lua_unit_group_from_py(py_unit_group)
end

---@param unit_group unit_group 单位组
---@return number count 数量
---获取单位组中单位数量
function M.number_of_units_in_unit_group(unit_group)
    return GameAPI.get_unit_group_num(unit_group.handle)
end

---@param unit_group unit_group 单位组 
---@param unit_id number 单位类型
---@return number count 数量
---单位组中单位类型的数量
function M.get_number_of_units_of_specified_type_in_unit_group(unit_group, unit_id)
    return GameAPI.get_num_of_unit_key_in_group(unit_group.handle, unit_id)
end

---@param unit_group unit_group 单位组
---@return Unit unit 单位
---获取单位组内第一个单位
function M.get_the_first_unit_in_a_unit_group(unit_group)
    local py_unit = GameAPI.get_first_unit_in_group(unit_group.handle)
    return M.unit.get_by_handle(py_unit)
end

---@param unit_group unit_group 单位组
---@return Unit unit 单位
---获取单位组中随机一个单位
function M.get_random_unit_from_unit_group(unit_group)
    local py_unit = GameAPI.get_random_unit_in_unit_group(unit_group.handle)
    return M.unit.get_by_handle(py_unit)
end

---@param unit_group unit_group 单位组
---@return Unit unit 单位
---获取单位组内最后一个单位
function M.get_last_unit_in_unit_group(unit_group)
    local py_unit = GameAPI.get_last_unit_in_group(unit_group.handle)
    return M.unit.get_by_handle(py_unit)
end

---单位组中某个状态的单位数量
function M.get_number_of_units_in_specified_state_in_unit_group()
    return
end

---@param player_or_unit_group player_group|unit_group
---清空玩家组或单位组
function M.clear(player_or_unit_group)
    GameAPI.clear_group(player_or_unit_group.handle)
end

---@param sfx_id number 特效id
---@param duration number 持续时间
---@param player Player 玩家
---@param is_on_fog boolean 是否在迷雾上方
---创建屏幕特效
function M.play_screen_particle_for_a_set_duration(sfx_id, duration, player, is_on_fog)
    GameAPI.add_sfx_to_camera_with_return(sfx_id, Fix32(duration), player.handle, is_on_fog)
end

---@param point Point 点
---@param area Area 区域
---@return boolean 是否在区域内
---点是否在区域内
function M.is_point_in_area(point, area)
    return GameAPI.judge_point_in_area(point.handle, area.handle)
end

---@param value string 字符串
---@return boolean bool 布尔值
---字符串转布尔值
function M.string_to_bool(value)
    return GlobalAPI.str_to_bool(value)
end

---@return string weather 天气
---获取全局天气
function M.get_global_weather()
    return GameAPI.get_global_weather()
end

---@param player Player 玩家
---@param sound number 声音
---@param is_loop boolean 是否循环
---@param fade_in_time number 渐入时间
---@param fade_out_time number 渐出时间
---播放声音
function M.play_sound_for_player(player, sound, is_loop, fade_in_time, fade_out_time)
    GameAPI.play_sound_for_player(player.handle, sound, is_loop, Fix32(fade_in_time), Fix32(fade_out_time))
end

---@param player Player 玩家
---@param sound number 声音
---@param is_immediately boolean 是否立即停止
---停止播放声音
function M.stop_sound_for_player(player, sound, is_immediately)
    GameAPI.stop_sound(player.handle, sound, is_immediately)
end

---@param player Player 玩家
---@param sound number 声音
---@param point Point 目标点
---@param height number 高度
---@param is_loop boolean 是否循环
---@param fade_in_time number 渐入时间
---@param fade_out_time number 渐出时间
---@param is_make_sure_play boolean 是否确保播放
---播放3D声音
function M.play_3d_sound_for_player(player, sound, point, height, is_loop, fade_in_time, fade_out_time, is_make_sure_play)
    GameAPI.play_3d_sound_for_player(player.handle, sound, point.handle, Fix32(height), is_loop, Fix32(fade_in_time), Fix32(fade_out_time), is_make_sure_play)
end

---@param player Player 玩家
---@param sound number 声音
---@param unit Unit 跟随的单位
---@param is_loop boolean 是否循环
---@param fade_in_time number 渐入时间
---@param fade_out_time number 渐出时间
---@param is_make_sure_play boolean 是否确保播放
---跟随单位播放声音
function M.follow_object_play_3d_sound_for_player(player, sound, unit, is_loop, fade_in_time, fade_out_time, is_make_sure_play)
    GameAPI.follow_object_play_3d_sound_for_player(player.handle, sound, unit.handle, is_loop, Fix32(fade_in_time), Fix32(fade_out_time), is_make_sure_play)
end

---@param player Player 玩家
---@param sound number 声音
---@param value number 音量
---设置声音音量
function M.set_sound_volume(player, sound, value)
    GameAPI.set_sound_volume(player.handle, sound, value)
end

---@param player Player 玩家
---@param key number 按键
---@return boolean 是否被按下
---玩家键盘按键是否被按下
function M.player_keyboard_key_is_pressed(player, key)
    return GameAPI.player_key_is_pressed(player.handle, key)
end

---@param player Player 玩家
---@param key string 键
---@return boolean 是否被按下
---玩家鼠标是否被按下
function M.player_mouse_key_is_pressed(player, key)
    return GameAPI.player_key_is_pressed(player.handle, key)
end

---@param type number 日志类型
---@param information string 信息
---打印日志
function M.print_to_dialog(type, information)
    GameAPI.print_to_dialog(type, information, nil)
end

---@param information string 信息
---@param time number 持续时间
---显示接口测试信息
function M.test_show_message_tip(information, time)
    GameAPI.api_test_show_msg_tip(information, Fix32(time))
end

---@param information string 信息
---@param time number 持续时间
---@param is_center boolean 是否居中
---记录API测试日志(可选显示)
function M.test_log_message(information, time, is_center)
    GameAPI.api_test_log_msg(information, Fix32(time), is_center)
end

---@param assert_result boolean 断言结果
---@param information string 说明信息
---接口测试向日志添加断言结果
function M.test_add_log_assert_result(assert_result, information)
    GameAPI.api_test_add_log_assert_result(assert_result, information)
end

---@param player Player 玩家
---@param tech_type number 科技类型
---@return boolean is_success 是否满足
---检查科技类型前置条件
function M.check_tech_key_precondition(player, tech_type)
    return GameAPI.check_tech_key_precondition(player.handle, tech_type)
end

---@param str1 string 字符串1
---@param str2 string 字符串2
---@return string result 结果字符串
---字符串拼接
function M.joint_string(str1, str2)
    return GlobalAPI.join_s(str1, str2)
end

---@param str string 要截取的字符串
---@param start_pos number 起始位置
---@param end_pos number 终止位置
---@return string result 结果字符串
---截取字符串
function M.extract_string(str, start_pos, end_pos)
    return GameAPI.extract_str(str, start_pos, end_pos)
end

---@param str string 字符串
---@param sub_str string 子字符串
---@param is_once boolean 是否只删一次
---@return string result 结果字符串
---删除子字符串
function M.delete_sub_string(str, sub_str, is_once)
    return GameAPI.delete_sub_str(str, sub_str, is_once)
end

---@param key string 多语言key
---@return string 多语言内容
---获取多语言内容
function M.get_text_config(key)
    return GameAPI.get_text_config(key)
end

---@param pool table 随机池
---@param value number 指定整数
---@return number value 权重概率
---获取随机池中指定整数的权重概率
function M.get_random_pool_probability(pool, value)
    return GameAPI.get_random_pool_probability(pool, value):float()
end

---@param pool table 随机池
---@return number 随机的整数
---从随机池中获取一个随机整数
function M.get_int_value_from_random_pool(pool)
    return GameAPI.get_bitrary_random_pool_value(pool)
end

---@param pool table 随机池
---@return number 随机的整数
---获取随机池总权重
function M.get_random_pool_all_weight(pool)
    return GameAPI.get_random_pool_all_weight(pool)
end

---@param pool table 随机池
---@return number 整数数量
---获取随机池中的整数数量
function M.get_random_pool_size(pool)
    return GameAPI.get_random_pool_size(pool)
end

---@param pool table 随机池
---@param value number 指定整数
---@return number weight 权重
---获取随机池中指定整数的权重
function M.get_random_pool_pointed_weight(pool, value)
    return GameAPI.get_random_pool_pointed_weight(pool, value)
end

---@param point Point 点
---@return number height 层级
---获取地图在该点位置的层级
function M.get_point_ground_height(point)
    return GameAPI.get_point_ground_height(point.handle)
end

---@return number seed 随机种子
---获取随机种子
function M.get_random_seed()
    return GameAPI.get_random_seed()
end

---@return number time_stamp 时间戳
---获取游戏开始时间戳
function M.get_game_init_time_stamp()
    return GameAPI.get_game_init_time_stamp()
end

---@return number x_resolution 横向分辨率
---获取初始化横向分辨率
function M.get_game_x_resolution()
    return GameAPI.get_game_x_resolution()
end

---@return number y_resolution 纵向分辨率
---获取初始化纵向分辨率
function M.get_game_y_resolution()
    return GameAPI.get_game_y_resolution()
end

---@return number quality 画质
---获取初始化游戏画质
function M.get_graphics_quality()
    return GameAPI.get_graphics_quality()
end

---@return number mode 窗口类别
---获取初始化窗口类别
function M.get_window_mode()
    return GameAPI.get_window_mode()
end

---@param value number 数字
---@return string str 字符串
---数字转字符串
function M.number_to_str(value)
    if type(value) == 'Fix32' then
        
    end
    return tostring(value)
end

---@param list userdata 数组变量
---遍历数组变量
function M.list_loop(list)
    local lua_table ={}
    local py_list = GlobalAPI.list_index_iterator(list)
    for i = 0, python_len(py_list)-1 do
        local var = python_index(py_list,i)
        table.insert(lua_table,var)
    end
    return lua_table
end

---@param is_only_gold boolean 是否只遍历货币
---遍历玩家属性
function M.iter_role_res(is_only_gold)
    local res_table ={}
    local py_list = GameAPI.iter_role_res(is_only_gold)
    for i = 0, python_len(py_list)-1 do
        table.insert(res_table,python_index(py_list,i))
    end
    return res_table
end

---@param func_name string 方法枚举
---@param actor userdata 数组变量
---@param key string 变量名
---@param index integer 索引
---@param var userdata 变量
---设置变量
function M.set_lua_var(func_name,actor,key,index,var)
    return GameAPI.set_lua_var(func_name, actor, key, index, var)
end

---@param func_name string 方法枚举
---@param key string 变量名
---@param index integer 索引
---获取变量
function M.get_lua_var(func_name,key,index)
    return GameAPI.get_lua_var(func_name, key, index)
end

---@param key string 变量名
---@param value userdata 值
---@param boolean if_list 是否数组
---LUA层初始化参数
function M.init_lua_var(key,value,if_list)
    return GameAPI.init_lua_var(key, value, if_list)
end

---退出游戏
function M.exit_game(player)
    GameAPI.exit_game(player and player.handle or nil)
end

---@param player Player 玩家
---@param signal_enum number 信号枚举值
---@param point Point 点
---@param visible_enum Point 可见性枚举值
---发送信号
function M.send_signal(player,signal_enum,point,visible_enum)
    GameAPI.send_signal(player.handle,signal_enum,point.handle,visible_enum)
end

---发送自定义事件
function M.send_custom_event(id,table)
    GameAPI.send_event_custom(id,table)
end

---@param point_or_unit Point|Unit 点或单位
---@param range number 范围
---@return boolean in_radius 在单位附近
---在附近
function M.is_in_radius(point_or_unit, range)
    return GameAPI.api_is_in_range(point_or_unit.handle, Fix32(range))
end

function M.call_any_api_3(funcname,p1,p2,p3)
    return GameAPI.call_any_api_3(funcname,p1,p2,p3)
end

function M.call_any_api_1(funcname,p1)
    return GameAPI.call_any_api_1(funcname,p1)
end

function M.call_any_api_2(funcname,p1,p2)
    return GameAPI.call_any_api_2(funcname,p1,p2)
end

function M.call_any_api_4(funcname,p1,p2,p3,p4)
    return GameAPI.call_any_api_4(funcname,p1,p2,p3,p4)
end

---@param value number 治疗值
---设置当前治疗值
function M.set_cure_value(value)
    GameAPI.set_cur_cure_value(Fix32(value))
end

---@param str string 字符串
---字符串转界面事件
function M.str_to_ui_event(str)
    return GlobalAPI.str_to_ui_event(str)
end


---任意变量转字符串
function M.any_var_to_str(p1,p2)
    if not ToString[p1] then
        return GlobalAPI.to_str_default(p2)
    end
    return ToString[p1](p2)
end

---@param name string 表名
---@return table tb 表
---获得表
function M.get_table(name)
    return GameAPI.get_table(name)
end
---@param data table 触发器回调函数中的data
---@return Point point 点
---获取事件中的点
function M.get_point_from_event(data)
    local py_point = data['__point']
    return M.get_by_handle(py_point)
end

---@param data table 触发器回调函数中的data
---@return Point command 点
---获取事件中的单位命令
function M.get_unit_command_from_event(data)
    local py_command = data['__cmd_type']
    return py_command
end

---表是否存在字段
function M.is_exist_key(table,key)
    return GameAPI.table_has_key(table,key)
end

function M.set_globale_view(enable)
    GameAPI.enable_fow_for_player(enable)
end

function M.get_custom_param(data,name)
    return GameAPI.get_custom_param(data['__c_param_dict'], name)
end

function M.request_server_time(func,context)
    GameAPI.lua_request_message_from_server(func,context)
end

---@param obj Unit|Item|Point|Area 各种对象
---@param key string 字段
---@return Point command 点
---是否存在字段
function M.api_has_kv_any(obj,key)
    return GlobalAPI.api_has_kv_any(obj and obj.handle or nil,key)
end

---获取本地玩家
function M.get_client_player()
    return M.player.get(GameAPI.get_owner_role_id())
end

---设置对象基础材质颜色
function M.set_object_color(obj,r,g,b,a)
    GameAPI.api_change_obj_base_color(obj.handle,r,g,b,a)
end

---清空表
function M.clear_table(table)
    GameAPI.clear_table(table)
end

---遍历物品类型的物品合成材料
function M.pick_item_type(item_id)
    local lua_table ={}
    local py_list = GameAPI.iter_compose_item_res_of_item_name(item_id)
    for i = 0, python_len(py_list)-1 do
        table.insert(lua_table,python_index(py_list,i))
    end
    return lua_table
end

---遍历物品类型的玩家合成材料
function M.pick_item_player_attr(item_id)
    local lua_table ={}
    local py_list = GameAPI.iter_compose_role_attr_of_item_name(item_id)
    for i = 0, python_len(py_list)-1 do
        local player_attr = python_index(py_list,i)
        table.insert(lua_table,player_attr)
    end
    return lua_table
end

--物品类型合成所需的物品类型数量
function M.get_num_of_item_mat(item_key, comp_item_key)
    return GameAPI.api_get_value_of_item_name_comp_mat(item_key, comp_item_key)
end

--物品类型合成所需的玩家属性数量
function M.get_num_of_player_attr(item_key, role_res_key)
    return GameAPI.api_get_value_of_item_name_comp_res(item_key, role_res_key)
end

---获取返回的服务器时间(年)
function M.get_server_year(v)
    return GlobalAPI.get_year_of_server_timestamp(v)
end
---获取返回的服务器时间(月)
function M.get_server_month(v)
    return GlobalAPI.get_month_of_server_timestamp(v)
end
---获取返回的服务器时间(日)
function M.get_server_day(v)
    return GlobalAPI.get_day_of_server_timestamp(v)
end
---获取返回的服务器时间(小时)
function M.get_server_hour(v)
    return GlobalAPI.get_hour_of_server_timestamp(v)
end

---@param mainString string 母字符串
---@param findString string 被替换的字符串
---@param replaceString string 替换目标字符串
---@param num integer 最大替换次数
---@return string str 字符串
---字符串替换
function M.string_gsub(mainString,findString,replaceString,num)
    return GlobalAPI.replace_str(mainString,findString,replaceString,num)
end

---@param value1 number 数值1
---@param value2 number 数值2
---@param value3 number 数值3
---@---@return boolean bool 是否在区间内
---区间内判断
function M.get_number_interval(value1,value2,value3)
    return ((value1 <= value2) and (value2 <= value3))
end

---@param fps integer 帧率
---设置逻辑帧率
function M.set_logic_fps(fps)
    GameAPI.api_change_logic_fps(fps)
end

---@param tab table 表
---加密表
function M.encrypt_table(tab)
    GameAPI.encrypt_table(tab)
end

---@param enable boolean 是否关闭
---关闭localplayer的表现层跳字
function M.set_jump_word(enable)
    GameAPI.set_local_player_jump_word_close(enable)
end

---@param player Player 玩家
---@param switch boolean 是否关闭
---特效播放开关
function M.sfx_switch(player,switch)
    GameAPI.set_player_sfx_switch(player and player.handle or nil,switch)
end

---@param area Area 区域
---注册区域的附近语音频道
function M.reg_sound_area(area)
    GameAPI.reg_sound_area(area and area.handle or nil)
end

---@param area Area 区域
---注销区域的附近语音频道
function M.unreg_sound_area(area)
    GameAPI.unreg_sound_area(area and area.handle or nil)
end

---@param switch boolean 是否关闭
--设置附近语音的区域模式开关
function M.set_nearby_voice_mode(switch)
    GameAPI.set_nearby_voice_mode(switch)
end

---@param player Player 玩家
---@param switch boolean 是否关闭
--设置玩家的附近语音聊天收听开关
function M.set_nearby_sound_switch(player,switch)
    GameAPI.set_nearby_sound_switch(player and player.handle,switch)
end

---@param player Player 玩家
---@param switch boolean 是否关闭
--设置玩家的附近语音聊天发言开关
function M.set_nearby_micro_switch(player,switch)
    GameAPI.set_nearby_micro_switch(player and player.handle,switch)
end

---@param player Player 玩家
---@param unit Unit 是否关闭
---设置玩家的声音主单位
function M.set_role_micro_unit(player,unit)
    GameAPI.set_role_micro_unit(player and player.handle,unit and unit.handle)
end

---@param player Player 玩家
---关闭玩家的附近语音聊天
function M.close_role_micro_unit(player)
    GameAPI.close_role_micro_unit(player and player.handle)
end

---@param player Player 玩家
---@param switch boolean 是否关闭
---设置玩家的同阵营语音聊天收听开关
function M.set_role_camp_sound_switch(player,switch)
    GameAPI.set_role_camp_sound_switch(player and player.handle,switch)
end

---@param player Player 玩家
---@param switch boolean 是否关闭
---设置玩家的同阵营语音聊天发言开关
function M.set_role_camp_micro_switch(player,switch)
    GameAPI.set_role_camp_micro_switch(player and player.handle,switch)
end

---@param player Player 玩家
---@param switch boolean 是否关闭
---设置玩家的所有人语音聊天收听开关
function M.set_role_all_sound_switch(player,switch)
    GameAPI.set_role_all_sound_switch(player and player.handle,switch)
end

---@param player Player 玩家
---@param switch boolean 是否关闭
---设置玩家的所有人语音聊天发言开关
function M.set_role_all_micro_switch(player,switch)
    GameAPI.set_role_all_micro_switch(player and player.handle,switch)
end

return M
