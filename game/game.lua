require 'y3.game.game_event'
require 'y3.game.object_event'

--游戏接口
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
---@deprecated 请直接使用图片ID
function M.get_icon_id(id)
    ---@type py.Texture
    return id
end

---获取任意对象图片
---@param obj ?Unit|Item|Ability|Buff 单位|物品|技能|魔法效果
---@return py.Texture texture
function M.get_obj_icon(obj)
    -- 如果为空，返回空图片
    ---@type py.Texture
    return obj and GameAPI.get_icon_id(obj.handle) or 999
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
    M.switch_level(M.get_level())
end

---设置游戏运行速率
---@param speed number 速率
function M.set_game_speed(speed)
    ---@diagnostic disable-next-line: param-type-mismatch
    GameAPI.api_change_time_scale(speed)
end

---开启软暂停
function M.enable_soft_pause()
    GameAPI.api_soft_pause_game()
end

---恢复软暂停
function M.resume_soft_pause()
    GameAPI.api_soft_resume_game()
end

---切换至关卡
---@param level_id_str py.Map # 关卡ID
function M.switch_level(level_id_str)
    GameAPI.request_switch_level(level_id_str)
end

---获取当前关卡
---@return py.Map # 当前关卡
function M.get_level()
    return GameAPI.get_current_level()
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
    return y3.helper.tonumber(GameAPI.get_slave_coeff(primary_attribute, secondary_attr)) or 0.0
end

---是否开启三维属性
---@return boolean is_open 是否开启
function M.is_compound_attributes_enabled()
    return GameAPI.api_if_pri_attr_state_open()
end

---设置游戏时间的流逝速度
---@param speed number 速度
function M.set_day_night_speed(speed)
    GameAPI.set_day_and_night_time_speed(Fix32(speed))
end

---设置游戏时间
---@param time number 时间
function M.set_day_night_time(time)
    GameAPI.set_day_and_night_time(Fix32(time))
end

---创建人造时间
---@param time number 时间
---@param dur number 持续时间
function M.create_day_night_human_time(time, dur)
    GameAPI.create_day_and_night_human_time(Fix32(time), Fix32(dur))
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
    return y3.helper.tonumber(GameAPI.get_cur_game_time()) or 0.0
end

---获取游戏当前昼夜时间
---@return number time 时间
function M.get_day_night_time()
    return y3.helper.tonumber(GameAPI.get_cur_day_and_night_time()) or 0.0
end

---获取伤害系数
---@param attack_type integer 攻击类型
---@param area_type integer 护甲类型
---@return number factor 伤害系数
function M.get_damage_ratio(attack_type, area_type)
    return y3.helper.tonumber(GameAPI.get_damage_ratio(attack_type, area_type)) or 0.0
end

---获取本局游戏环境
---@return integer game_mode 游戏环境，1是编辑器，2是平台
function M.get_start_mode()
    return GameAPI.api_get_start_mode()
end

-- 是否是调试模式
---@param ignore_config? boolean # 是否忽略用户的设置
---@return boolean
function M.is_debug_mode(ignore_config)
    if ignore_config then
        return M.get_start_mode() == 1
    end
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
---@param key integer|string 多语言key
---@return string 多语言内容
function M.locale(key)
    ---@diagnostic disable-next-line: param-type-mismatch
    return GameAPI.get_text_config(key)
end

---获取游戏开始时间戳
---@return integer time_stamp 时间戳
function M.get_game_init_time_stamp()
    return GameAPI.get_game_init_time_stamp()
end

---@class ServerTime: osdate
---@field timestamp integer # 时间戳
---@field time_zone_stamp integer # 计算过时区后的时间戳
---@field msec integer # 毫秒
---@field time_zone integer # 时区

--获取当前的服务器时间。为了保证结果的一致性需要你自己指定时区。
---@param time_zone? integer # 时区，默认为0。获取中国的时间请传入8。
---@return ServerTime
function M.get_current_server_time(time_zone)
    local init_time_stamp = GameAPI.get_game_init_time_stamp()
    if y3.game.is_debug_mode(true) then
        -- 本地启动游戏时时间戳有问题，算上了本地时区。
        -- 平台上启动游戏是正确的。
        init_time_stamp = init_time_stamp - 8 * 3600
    end
    local runned_sec, runned_ms = math.modf(GameAPI.get_cur_game_time():float())
    local time_stamp = init_time_stamp + runned_sec
    local time_zone_stamp = time_stamp + (time_zone or 0) * 3600
    local result = os.date('!*t', time_zone_stamp) --[[@as ServerTime]]
    result.msec = math.floor(runned_ms * 1000)
    result.timestamp = time_stamp
    result.time_zone_stamp = time_zone_stamp
    result.time_zone = time_zone or 0
    return result
end

---获取初始化横向分辨率
---@return integer x_resolution 横向分辨率
function M.get_game_x_resolution()
    return GameAPI.get_game_x_resolution()
end

---获取初始化纵向分辨率
---@return integer y_resolution 纵向分辨率
function M.get_game_y_resolution()
    return GameAPI.get_game_y_resolution()
end

---获取初始化游戏画质
---@return 'low' | 'medium' | 'high' quality 画质
function M.get_graphics_quality()
    return GameAPI.get_graphics_quality()
end

---@alias Game.WindowMode
---| "full_screen" # 全屏
---| "window_mode" # 窗口化
---| "window_mode_full_screen" # 窗口化全屏

---获取窗口化类别
---@return Game.WindowMode mode 窗口化类别
function M.get_window_mode()
    return GameAPI.get_window_mode()
end

---发送信号
---@param player Player 玩家
---@param signal_enum y3.Const.SignalType 信号枚举值
---@param point Point 点
---@param visible_enum y3.Const.VisibleType 可见性枚举值
function M.send_signal(player, signal_enum, point, visible_enum)
    GameAPI.send_signal(
        player:get_id() --[[@as py.RoleID]],
        y3.const.SignalType[signal_enum] or signal_enum,
        -- TODO 见问题2
        ---@diagnostic disable-next-line: param-type-mismatch
        point.handle,
        y3.const.VisibleType[visible_enum] or visible_enum
    )
end

-- 发送自定义事件给ECA
---@param id integer 事件id
---@param table table 事件数据
function M.send_custom_event(id, table)
    GameAPI.send_event_custom(id, table)
end

---字符串转界面事件
---@param str string 字符串
---@return string
function M.str_to_ui_event(str)
    return GlobalAPI.str_to_ui_event(str)
end

---获取表
---@param name string 表名
---@param as_lua? boolean 是否将表中的数据转换为Lua的数据类型，例如Fix32转number
---@return table tb 表
function M.get_table(name, as_lua)
    local t = GameAPI.get_table(name)
    if as_lua then
        t = y3.helper.as_lua(t, true)
    end
    return t
end

---表是否存在字段
---@param table table
---@param key string
---@return boolean
function M.table_has_key(table, key)
    return GameAPI.table_has_key(table, key)
end

---清空表
function M.clear_table(table)
    GameAPI.clear_table(table)
end

-- 启用全图视野（总是可见的）
---@param enable boolean
function M.set_globale_view(enable)
    GameAPI.enable_fow_for_player(enable)
end

---设置对象基础材质颜色
---@param obj Unit|Item|Destructible
---@param r integer # 红色（0~255）
---@param g integer # 绿色（0~255）
---@param b integer # 蓝色（0~255）
---@param a? integer # 强度（0~100）
---@param o? number # 不透明度（0~1）
function M.set_object_color(obj, r, g, b, a, o)
    ---@diagnostic disable-next-line: param-type-mismatch
    GameAPI.api_change_obj_base_color(obj.handle, r, g, b, a or 50, o or -1)
end

---设置对象的菲涅尔效果
---@param obj Unit|Item|Destructible
---@param b boolean
function M.set_object_fresnel_visible(obj, b)
    GameAPI.api_set_obj_fresnel_visible(obj.handle, b)
end

---设置对象的菲涅尔效果
---@param obj Unit|Item|Destructible
---@param r? integer # R
---@param g? integer # G
---@param b? integer # B
---@param alpha? number # alpha
---@param exp? number # exp
---@param strength? number # strength
function M.set_object_fresnel(obj, r, g, b, alpha, exp, strength)
    GameAPI.api_set_obj_fresnel_parameters(obj.handle, r, g, b, alpha, exp, strength)
end

---设置逻辑帧率
---@param fps integer 帧率
function M.set_logic_fps(fps)
    GameAPI.api_change_logic_fps(fps)
end

---加密表
---@param tab table 表
function M.encrypt_table(tab)
    GameAPI.encrypt_table(tab)
end

---关闭localplayer的表现层跳字
---@param enable boolean 是否关闭
function M.set_jump_word(enable)
    GameAPI.set_local_player_jump_word_close(enable)
end

---特效播放开关
---@param player Player 玩家
---@param switch boolean 是否关闭
function M.sfx_switch(player, switch)
    GameAPI.set_player_sfx_switch(player.handle, switch)
end

---注册区域的附近语音频道
---@param area Area 区域
function M.reg_sound_area(area)
    GameAPI.reg_sound_area(area.handle)
end

---注销区域的附近语音频道
---@param area Area 区域
function M.unreg_sound_area(area)
    GameAPI.unreg_sound_area(area.handle)
end

--设置附近语音的区域模式开关
---@param switch boolean 是否关闭
function M.set_nearby_voice_mode(switch)
    GameAPI.set_nearby_voice_mode(switch)
end

--设置玩家的附近语音聊天收听开关
---@param player Player 玩家
---@param switch boolean 是否关闭
function M.set_nearby_sound_switch(player, switch)
    GameAPI.set_nearby_sound_switch(player.handle, switch)
end

--设置玩家的附近语音聊天发言开关
---@param player Player 玩家
---@param switch boolean 是否关闭
function M.set_nearby_micro_switch(player, switch)
    GameAPI.set_nearby_micro_switch(player.handle, switch)
end

---设置玩家的声音主单位
---@param player Player 玩家
---@param unit Unit 是否关闭
function M.set_role_micro_unit(player, unit)
    GameAPI.set_role_micro_unit(player.handle, unit.handle)
end

---关闭玩家的附近语音聊天
---@param player Player 玩家
function M.close_role_micro_unit(player)
    GameAPI.close_role_micro_unit(player.handle)
end

---设置玩家的同阵营语音聊天收听开关
---@param player Player 玩家
---@param switch boolean 是否关闭
function M.set_role_camp_sound_switch(player, switch)
    GameAPI.set_role_camp_sound_switch(player.handle, switch)
end

---设置玩家的同阵营语音聊天发言开关
---@param player Player 玩家
---@param switch boolean 是否关闭
function M.set_role_camp_micro_switch(player, switch)
    GameAPI.set_role_camp_micro_switch(player.handle, switch)
end

---设置玩家的所有人语音聊天收听开关
---@param player Player 玩家
---@param switch boolean 是否关闭
function M.set_role_all_sound_switch(player, switch)
    GameAPI.set_role_all_sound_switch(player.handle, switch)
end

---设置玩家的所有人语音聊天发言开关
---@param player Player 玩家
---@param switch boolean 是否关闭
function M.set_role_all_micro_switch(player, switch)
    GameAPI.set_role_all_micro_switch(player.handle, switch)
end

---世界坐标转换屏幕坐标
---@param world_pos Point 世界坐标
---@return number x, number y 屏幕坐标
function M.world_pos_to_camera_pos(world_pos)
    ---@diagnostic disable-next-line: param-type-mismatch
    local pos = GameAPI.api_world_pos_to_camera_pos(world_pos.handle)
    ---@diagnostic disable-next-line: param-type-mismatch
    local x = GlobalAPI.get_fixed_coord_index(pos, 0):float() / 100
    ---@diagnostic disable-next-line: param-type-mismatch
    local y = GlobalAPI.get_fixed_coord_index(pos, 2):float() / 100
    y = y - 2 * (y - y3.ui:get_window_height() / 2)
    return x, y
end

---世界坐标转换屏幕边缘坐标
---@param world_pos Point
---@param delta_dis number
---@return number x, number y
function M.world_pos_to_screen_edge_pos(world_pos, delta_dis)
    ---@diagnostic disable-next-line: param-type-mismatch
    local pos = GameAPI.api_world_pos_to_screen_edge_pos(world_pos.handle, delta_dis)
    ---@diagnostic disable-next-line: param-type-mismatch
    local x = GlobalAPI.get_fixed_coord_index(pos, 0):float() / 100
    ---@diagnostic disable-next-line: param-type-mismatch
    local y = GlobalAPI.get_fixed_coord_index(pos, 2):float() / 100
    y = y - 2 * (y - y3.ui:get_window_height() / 2)
    return x, y
end

--本地客户端每帧回调此函数  
--只能注册一个回调，后注册的会覆盖之前的，
--如有需要请自己在回调中分发
--
-->警告：回调函数是在本地玩家的客户端上执行的，注意避免产生不同步的问题。
---@param callback fun(local_player: Player)
function M.on_client_tick(callback)
    if type(callback) ~= 'function' then
        error('on_client_tick: callback must be a function')
    end
    ---@private
    M._client_tick_callback = callback
end


---@class HttpRequestOptions
---@field post? boolean # post 请求还是 get 请求
---@field port? integer # 端口号
---@field timeout? number # 超时时间，默认为2秒
---@field headers? table | py.Dict # 请求头

--发送 http 请求，成功或失败都会触发回调，
--成功时回调的参数是 http 返回的 body，失败时回调的参数是 `nil`
---@param url string
---@param body? string
---@param callback? fun(body?: string)
---@param options? HttpRequestOptions
function M:request_url(url, body, callback, options)
    local headers = options and options.headers
    if type(headers) == 'table' then
        headers = y3.helper.py_dict(headers)
    end
    request_url(url
        , options and options.post or false
        , body
        , options and options.port
        , options and options.timeout or 2
        , headers
        , callback
    )
end

local download_icon_queue = {}

---下载玩家平台头像，下载完毕后调用回调函数
---@param url string # 头像下载地址
---@param icon string # 头像路径，如果本地已有头像则不会下载而是立即调用回调函数
---@param callback fun(real_path: string) # 下载完毕后的回调函数
function M.download_platform_icon(url, icon, callback)
    ---@diagnostic disable-next-line: undefined-field
    local download = GameAPI.download_avatar_head_url
    if not download then
        return
    end
    download_icon_queue[#download_icon_queue+1] = {
        url = url,
        icon = icon,
        callback = callback
    }
    if #download_icon_queue == 1 then
        local function download_one()
            local data = table.remove(download_icon_queue, 1)
            download(data.url, data.icon, function (real_path)
                xpcall(data.callback, log.error, real_path)
                if #download_icon_queue > 0 then
                    download_one()
                end
            end)
        end
        download_one()
    end
end

_G['OnTick'] = function ()
    if M._client_tick_callback then
        y3.player.with_local(M._client_tick_callback)
    end
    y3.ctimer.update_frame()
end

return M
