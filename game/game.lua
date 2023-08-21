require 'y3.game.game_event'
require 'y3.game.object_event'

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

---获取三维属性的影响系数
---@param primary_attribute string 一级属性
---@param secondary_attr string 二级属性
---@return number coefficient 系数
function M.get_compound_attributes(primary_attribute, secondary_attr)
    return GameAPI.get_slave_coeff(primary_attribute, secondary_attr):float()
end

---是否开启三维属性
---@return boolean is_open 是否开启
function M.is_compound_attributes_enabled()
    return GameAPI.api_if_pri_attr_state_open()
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

---游戏已运行的时间
---@return number time  时间
function M.current_game_run_time()
    return GameAPI.get_cur_game_time():float()
end

---获取游戏当前时间
---@return number time 时间
function M.get_day_night_time()
    return GameAPI.get_cur_day_and_night_time():float()
end

---获取伤害系数
---@param attack_type integer 攻击类型
---@param area_type integer 护甲类型
---@return number factor 伤害系数
function M.get_damage_ratio(attack_type, area_type)
    return GameAPI.get_damage_ratio(attack_type, area_type):float()
end

---获取本局游戏环境
---@return integer game_mode 游戏环境，1是编辑器，2是平台
function M.get_start_mode()
    return GameAPI.api_get_start_mode()
end

-- 是否是调试模式
function M.is_debug_mode()
    if y3.config.debug == true then
        return true
    end
    if y3.config.debug == false then
        return false
    end
    if y3.config.debug == 'auto' then
        return M.get_start_mode() == 1
    end
    return false
end

---获取全局存档
---@param name string 存档名
---@return integer archive 存档
function M.get_global_archive(name)
    return GameAPI.get_global_map_archive(name)
end

---获取整数存档排行榜玩家存档值
---@param file integer 存档
---@param index integer 序号
---@return integer value 存档值
function M.get_archive_rank_player_archive_value(file, index)
    return GameAPI.get_archive_rank_player_archive_value(file, index)
end

---获取全局天气
---@return integer weather 天气
function M.get_global_weather()
    return GameAPI.get_global_weather()
end

---获取多语言内容
---@param key string 多语言key
---@return string 多语言内容
function M.locale(key)
    return GameAPI.get_text_config(key)
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

---表是否存在字段
function M.is_exist_key(table,key)
    return GameAPI.table_has_key(table,key)
end

function M.set_globale_view(enable)
    GameAPI.enable_fow_for_player(enable)
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
