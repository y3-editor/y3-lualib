-- 此文件由 `tools/genGameAPI` 生成，请勿手动修改。
---@meta

---@class py.Unit
local Unit = {}

--获取单位ID
---@return py.UnitID? # 单位ID
function Unit:api_get_id() end

--获取单位编号
---@return py.UnitKey? # 单位编号
function Unit:api_get_key() end

--获取单位所属阵营id
---@return py.CampID? # 阵营ID
function Unit:api_get_camp_id() end

--获取单位所属玩家ID
---@return py.RoleID? # 玩家ID
function Unit:api_get_role_id() end

--获取单位所属玩家
---@return py.Role? # 玩家
function Unit:api_get_role() end

--获取单位所属阵营
---@return py.Camp? # 阵营
function Unit:api_get_camp() end

--获取单位类型
---@return py.UnitType? # 单位类型
function Unit:api_get_type() end

--添加定时器
---@param time py.Fixed # 定时时长
---@param callback function # 超时函数
---@return integer? # 定时器ID
function Unit:add_timer(time, callback) end

--添加周期定时器
---@param time py.Fixed # 定时时长
---@param callback function # 超时函数
---@return integer? # 定时器ID
function Unit:add_repeat_timer(time, callback) end

--取消定时器
---@param timer_id integer # 定时器ID
function Unit:cancel_timer(timer_id) end

--单位移除键值对
---@param k string # 键名
function Unit:api_remove_kv(k) end

--单位是否存活
---@return boolean? # 单位是否存活
function Unit:api_is_alive() end

--隐藏头顶信息
---@param show boolean # 是否隐藏头顶信息
function Unit:api_hide_head_bar(show) end

--单位是否拥有标签
---@param tag string # 标签
---@return boolean? # 单位是否拥有标签
function Unit:has_tag(tag) end

--复活单位
---@param position? py.Point # 复活位置
function Unit:api_revive(position) end

--单位是否已销毁
---@return boolean? # 单位是否已销毁
function Unit:api_is_destroyed() end

--删除单位
function Unit:api_delete() end

--强制单位死亡
---@param source_unit? py.Unit # 杀手单位
function Unit:api_kill(source_unit) end

--设置单位建造进度
---@param progress py.Fixed # 建造进度
---@param is_percent? boolean # 是否百分比
function Unit:api_set_construction_progress(progress, is_percent) end

--设置单位升级进度
---@param progress py.Fixed # 升级进度
---@param is_percent? boolean # 是否百分比
function Unit:api_set_upgrade_progress(progress, is_percent) end

--获取单位图标路径
---@return string? # 单位图标路径
function Unit:api_get_icon() end

--获取单位图片路径
---@param pic_type string # 图片类型
---@return string? # 单位图片路径
function Unit:api_get_unit_pic(pic_type) end

--获取单位的父单位
---@return py.Unit? # 单位的父单位
function Unit:api_get_parent_unit() end

--改变单位血条颜色
---@param color string # 单位血条颜色值
function Unit:api_set_hp_color(color) end

--开启/关闭伤害及助攻统计
---@param enable boolean # 开启
function Unit:api_switch_atk_assist_record(enable) end

--单位/点是否在范围内
---@param unit py.Unit # 单位
---@param radius number # 范围
---@return boolean? # 是否在范围内
function Unit:api_is_in_range(unit, radius) end

--点是否在范围内
---@param point py.Point # 点
---@param radius number # 范围
---@return boolean? # 是否在范围内
function Unit:api_is_point_in_range(point, radius) end

--设置单位生命周期
---@param life_time number # 生命周期
function Unit:api_set_life_cycle(life_time) end

--暂停单位生命周期
---@param pause boolean # 是否暂停
function Unit:api_pause_life_cycle(pause) end

--获取单位当前生命周期
---@return py.Fixed? # 生命周期
function Unit:api_get_life_cycle() end

--获取单位总生命周期时长
---@return py.Fixed? # 生命周期
function Unit:api_get_total_life_cycle() end

--设置单位攻击类型
---@param attack_type integer # 攻击类型
function Unit:api_set_attack_type(attack_type) end

--获取单位攻击类型
---@return integer? # 攻击类型
function Unit:api_get_atk_type() end

--攻击类型判断
---@param attack_type integer # 攻击类型
---@return boolean? # 攻击类型判断
function Unit:api_is_attack_type(attack_type) end

--设置单位护甲类型
---@param armor_type integer # 护甲类型
function Unit:api_set_armor_type(armor_type) end

--获取单位护甲类型
---@return integer? # 护甲类型
function Unit:api_get_armor_type() end

--护甲类型判断
---@param armor_type integer # 护甲类型
---@return boolean? # 护甲类型判断
function Unit:api_is_armor_type(armor_type) end

--获取单位的x轴缩放
---@return number? # 缩放的值
function Unit:api_get_x_scale() end

--获取单位的y轴缩放
---@return number? # 缩放的值
function Unit:api_get_y_scale() end

--获取单位的z轴缩放
---@return number? # 缩放的值
function Unit:api_get_z_scale() end

--获取单位的仇恨单位
---@return py.Unit? # 仇恨的单位
function Unit:api_get_ai_battle_target_unit() end

--获取单位的跟随单位
---@return py.Unit? # 跟随的单位
function Unit:api_get_ai_follow_target_unit() end

--设置跟随单位成功后是否退出跟随
---@param exit_follow_on_succ boolean # 是否退出
function Unit:api_set_ai_exit_follow_on_succ_once(exit_follow_on_succ) end

--设置单位是否休眠
---@param is_sleeping boolean # 是否休眠
function Unit:api_set_is_sleeping(is_sleeping) end

--获取单位是否休眠
---@return boolean? # 是否休眠
function Unit:api_get_is_sleeping() end

--单位变身
---@param entity_no py.UnitKey # 新的物编ID
---@param inherit_composite_attr? boolean # 是否继承复合属性
---@param inherit_unit_attr? boolean # 是否继承单位属性
---@param inherit_kv? boolean # 是否继承kv
---@param inherit_hero_ability? boolean # 是否继承英雄技能
---@param inherit_common_ability? boolean # 是否继承通用技能
---@param inherit_passive_ability? boolean # 是否继承隐藏技能
function Unit:api_unit_transformation(entity_no, inherit_composite_attr, inherit_unit_attr, inherit_kv, inherit_hero_ability, inherit_common_ability, inherit_passive_ability) end

--单位-队列重置
function Unit:api_queue_reset() end

--获取 attr_other
---@param key string # 属性名
---@return py.Fixed? # 属性值
function Unit:api_get_attr_other(key) end

--获取attr_base
---@param key string # 属性名
---@return py.Fixed? # 属性值
function Unit:api_get_attr_base(key) end

--获取attr_base_ratio
---@param key string # 属性名
---@return py.Fixed? # 属性值
function Unit:api_get_attr_base_ratio(key) end

--获取attr_bonus
---@param key string # 属性名
---@return py.Fixed? # 属性值
function Unit:api_get_attr_bonus(key) end

--获取attr_bonus_ratio
---@param key string # 属性名
---@return py.Fixed? # 属性值
function Unit:api_get_attr_bonus_ratio(key) end

--获取attr_all_ratio
---@param key string # 属性名
---@return py.Fixed? # 属性值
function Unit:api_get_attr_all_ratio(key) end

--获取单位主属性
---@return string? # 主属性
function Unit:api_get_main_attr() end

--切换主属性
---@param main_attr string # 属性名
function Unit:api_switch_main_attr(main_attr) end

--设置纯值类型的值
---@param key string # 属性名
---@param val py.Fixed # 值
function Unit:api_set_attr(key, val) end

--设置单位属性（根据属性分类）
---@param key string # 属性名
---@param val py.Fixed # 值
---@param attr_element string # 属性分类
function Unit:api_set_attr_by_attr_element(key, val, attr_element) end

--设置单位属性基础值部分
---@param key string # 属性名
---@param val py.Fixed # 基础值
function Unit:api_set_attr_base(key, val) end

--增加单位属性（根据属性分类）
---@param key string # 属性名
---@param val py.Fixed # 值
---@param attr_element string # 属性分类
function Unit:api_add_attr_by_attr_element(key, val, attr_element) end

--增加单位属性基础值
---@param key string # 属性名
---@param delta py.Fixed # 增加值
function Unit:api_add_attr_base(key, delta) end

--设置单位属性 attr_bonus
---@param key string # 属性名
---@param val py.Fixed # 设置值
function Unit:api_set_attr_bonus(key, val) end

--增加单位属性 attr_bonus
---@param key string # 属性名
---@param delta py.Fixed # 增加值
function Unit:api_add_attr_bonus(key, delta) end

--设置单位属性 attr_bouns_ratio
---@param key string # 属性名
---@param val py.Fixed # 设置值
function Unit:api_set_attr_bonus_ratio(key, val) end

--增加单位属性 attr_bouns_ratio
---@param key string # 属性名
---@param delta py.Fixed # 加成比例
function Unit:api_add_attr_bonus_ratio(key, delta) end

--设置单位属性 基础值和额外值 加成比例
---@param key string # 属性名
---@param val py.Fixed # 设置值
function Unit:api_set_attr_all_ratio(key, val) end

--增加单位属性 基础值和额外值 加成比例
---@param key string # 属性名
---@param delta py.Fixed # 加成比例
function Unit:api_add_attr_all_ratio(key, delta) end

--设置单位属性 基础值 加成比例
---@param key string # 属性名
---@param val py.Fixed # 设置值
function Unit:api_set_attr_base_ratio(key, val) end

--开启单位属性作弊检查
function Unit:api_open_attr_cheating_detected() end

--增加单位属性基础值百分比加成
---@param key string # 属性名
---@param delta py.Fixed # 加成比例
function Unit:api_add_attr_base_ratio(key, delta) end

--设置单位等级
---@param level integer # 等级
function Unit:api_set_level(level) end

--增加单位等级
---@param level integer # 等级
function Unit:api_add_level(level) end

--获取单位实数属性
---@param key string # 属性类型
---@param attr string # 属性名
---@return py.Fixed? # 实数属性值
function Unit:api_get_attr(key, attr) end

--获取单位实数属性
---@param attr string # 属性名
---@return py.Fixed? # 实数属性值
function Unit:api_get_float_attr(attr) end

--获取单位字符串属性
---@param attr string # 属性名
---@return string? # 字符串属性值
function Unit:api_get_str_attr(attr) end

--设置单位字符串属性
---@param attr string # 属性名
---@param value string # 字符串值
function Unit:api_set_str_attr(attr, value) end

--获取单位等级
---@return integer? # 单位等级
function Unit:api_get_level() end

--获取单位血量
---@return py.Fixed? # 单位血量
function Unit:api_get_hp() end

--获取单位血量百分比
---@return py.Fixed? # 单位血量百分比
function Unit:api_get_hpp() end

--治疗单位
---@param hp_change py.Fixed # 治疗的数值
---@param jump_word? boolean # 是否跳字
---@param related_ability? py.Ability # 关联技能
---@param source_unit? py.Unit # 来源单位
---@param harm_text_enum string # 跳字枚举
---@param jump_word_track? integer # 跳字轨迹
---@param pos_socket string # 挂接点
function Unit:api_heal(hp_change, jump_word, related_ability, source_unit, harm_text_enum, jump_word_track, pos_socket) end

--获取输出伤害统计值
---@return py.Fixed? # 输出伤害统计值
function Unit:api_get_dmg_statistics() end

--清空输出伤害统计值
function Unit:api_clear_dmg_statistics() end

--增加经验，增加值为正数
---@param exp py.Fixed # 经验
function Unit:api_add_exp(exp) end

--设置经验
---@param exp py.Fixed # 经验
function Unit:api_set_exp(exp) end

--获取单位当前经验, 如果达到了顶级，就返回-1
---@return integer? # 单位当前经验值
function Unit:api_get_exp() end

--获取当前升级所需经验, 如果达到了顶级，就返回-1
---@return integer? # 当前升级所需经验值
function Unit:api_get_upgrade_exp() end

--单位移除键值对
---@param tag string # TAG
function Unit:api_add_tag(tag) end

--单位移除键值对
---@param tag string # TAG
function Unit:api_remove_tag(tag) end

--设置单位删除时是否回收
---@param recycle? boolean # 是否回收
function Unit:api_set_recycle_on_remove(recycle) end

--设置单位名称
---@param name string # 名称
function Unit:api_set_name(name) end

--获取单位名称
---@return string? # 单位名称
function Unit:api_get_name() end

--设置单位白天视野
---@param value number # 视野
function Unit:api_set_unit_day_vision(value) end

--获取单位白天视野
---@return py.Fixed? # 白天视野
function Unit:api_get_unit_day_vision() end

--设置单位夜晚视野
---@param value number # 视野
function Unit:api_set_unit_night_vision(value) end

--获取单位夜晚视野
---@return py.Fixed? # 夜晚视野
function Unit:api_get_unit_night_vision() end

--设置单位警戒范围
---@param value number # 警戒范围
function Unit:api_set_unit_alarm_range(value) end

--获取单位警戒范围
---@return py.Fixed? # 警戒范围
function Unit:api_get_unit_alarm_range() end

--设置单位取消警戒范围
---@param value number # 取消警戒范围
function Unit:api_set_unit_cancel_alarm_range(value) end

--获取单位取消警戒范围
---@return py.Fixed? # 取消警戒范围
function Unit:api_get_unit_cancel_alarm_range() end

--获取单位物品栏数量
---@return integer? # 数量
function Unit:api_get_unit_bar_cnt() end

--获取单位背包栏数量
---@return integer? # 数量
function Unit:api_get_unit_pkg_cnt() end

--获取单位动态碰撞半径
---@return py.Fixed? # 动态碰撞半径
function Unit:api_get_unit_collision_radius() end

--获取单位被击杀经验
---@return integer? # 经验值
function Unit:api_get_unit_reward_exp() end

--获取单位被击杀的玩家属性
---@param res_key py.RoleResKey # 玩家属性资源
---@return py.Fixed? # 经验值
function Unit:api_get_unit_reward_res(res_key) end

--设置单位被击杀经验
---@param res_value py.Fixed # 经验值
function Unit:api_set_unit_reward_exp(res_value) end

--设置单位被击杀的玩家属性
---@param res_key py.RoleResKey # 玩家属性资源
---@param res_value py.Fixed # 经验值
function Unit:api_set_unit_reward_res(res_key, res_value) end

--获取单位的护盾值
---@param shield_type integer # 护盾类型
---@return integer? # 护盾值
function Unit:api_get_unit_shield_value(shield_type) end

--设置单位的头像
---@param icon py.Texture # 图片
function Unit:api_set_unit_icon(icon) end

--获取单位主属性
---@return string? # 属性
function Unit:api_get_unit_main_attr() end

--获取单位属性本地化名
---@param attr_key string # 属性索引
---@return string? # 属性本地化名
function Unit:api_get_attr_name(attr_key) end

--设置事件中的经验值
---@param val py.Fixed # 经验值
function Unit:api_set_changed_exp_in_event(val) end

--获取单位类型某个技能位的技能类型
---@param abilityType py.AbilityType # 技能类型
---@param abilityIndex py.AbilityIndex # 技能槽位
---@return py.AbilityKey? # 技能类型
function Unit:api_get_abilityKey_by_type_and_index(abilityType, abilityIndex) end

--获取每tick的单位生命恢复
function Unit:api_get_hprec_pertick() end

--单位停止移动
function Unit:api_stop_move() end

--单位传送到指定坐标
---@param point py.FVector3 # 目标坐标
function Unit:api_transmit(point) end

--单位强制传送到指定坐标
---@param pos py.FVector3 # 目标坐标
function Unit:api_force_transmit(pos) end

--单位强制传送到指定坐标
---@param pos py.FVector3 # 目标坐标
---@param interpolation? boolean # 是否平滑
function Unit:api_force_transmit_new(pos, interpolation) end

--单位设置朝向
---@param face_dir py.FVector3 # 朝向
---@param speed_effect? boolean # 是否受转身速度影响
function Unit:api_set_face_dir(face_dir, speed_effect) end

--单位设置朝向角度
---@param face_angle py.Fixed # 朝向角度
---@param turn_time_ms? integer # 转身时间毫秒
function Unit:api_set_face_angle(face_angle, turn_time_ms) end

--单位设置朝向角度
---@param face_angle py.Fixed # 朝向角度
---@param turn_type? integer # 动画旋转类型
function Unit:api_set_face_angle_inner_usage(face_angle, turn_type) end

--单位是否能传送到目标点
---@param pos py.FVector3 # 目标点
---@return boolean? # 单位是否能传送到目标点
function Unit:api_can_teleport_to(pos) end

--获取单位在目标点附近的最近可通行点
---@return py.FVector3? # 最近可通行点
function Unit:api_find_nearest_valid_position() end

--获取单位位置
---@return py.FVector3? # 单位位置
function Unit:api_get_position() end

--获取单位朝向
---@return py.FVector3? # 单位朝向
function Unit:api_get_face_dir() end

--获取单位面向角度
---@return py.Fixed? # 单位面向角度
function Unit:get_face_angle() end

--设置单位转身速度
---@param turn_speed py.Fixed # 转身速度
function Unit:api_set_turn_speed(turn_speed) end

--获得单位转身速度
---@return py.Fixed? # 转身速度
function Unit:api_get_turn_speed() end

--设置动画移动基准速度。会同时修改跑和走的基准速度，如果要区分跑和走，还需额外单独设置走的基准速度(api_set_anim_walk_speed)
---@param base_speed py.Fixed # 动画移动速度
function Unit:api_set_base_speed(base_speed) end

--设置动画移动基准速度(仅走)
---@param speed py.Fixed # 动画移动速度
function Unit:api_set_anim_walk_speed(speed) end

--单位是否在移动
---@return boolean? # 是否在移动
function Unit:api_is_moving() end

--设置单位是否计算某种碰撞类型
---@param collision_layer integer # 碰撞mask
---@param enable boolean # 开启状态
function Unit:api_set_move_collision(collision_layer, enable) end

--获取单位是否计算某种碰撞类型
---@param collision_layer integer # 碰撞mask
---@return boolean? # 是否开启
function Unit:api_get_move_collision(collision_layer) end

--判断单位的移动类型
---@param move_type integer # 移动类型
---@return boolean? # 是否为该移动类型
function Unit:api_is_move_type(move_type) end

--设置是否阻挡其他单位
---@param is_on boolean # 是否阻挡
function Unit:api_set_block_others(is_on) end

--设置单位的移动类型为地面
---@param land_limitation? boolean # 陆地限制
---@param item_limitation? boolean # 物件限制
---@param water_limitation? boolean # 海洋限制
function Unit:set_move_channel_land(land_limitation, item_limitation, water_limitation) end

--设置单位的移动类型为空中
---@param air_limitation? boolean # 空中限制
function Unit:set_move_channel_air(air_limitation) end

--获取单位从点到点的寻路距离
---@param point_start py.Unit # 单位
---@param point_end py.Point # 起始点
function Unit:get_unit_path_length_between_points(point_start, point_end) end

--单位沿方向移动（摇杆等）
---@param x number # 方向x轴
---@param y number # 方向y轴
function Unit:roaming_along(x, y) end

--停止沿方向移动
function Unit:stop_roaming() end

--沿方向移动
---@param point py.Point # 目标点
---@param offset number # offset
function Unit:roaming_to(point, offset) end

--播放动画
---@param name string # 动画名称
---@param rate? number # 播放倍率
---@param init_time? number # 开始时间(s)
---@param end_time? number # 结束时间(s)，正数 -1 表示不结束
---@param loop? boolean # 是否循环
---@param return_idle? boolean # 播放结束后是否恢复idle
function Unit:api_play_animation(name, rate, init_time, end_time, loop, return_idle) end

--播放动画 内部
---@param name string # 动画名称
---@param turn_type? number # 播放倍率
function Unit:api_play_animation_inner_usage(name, turn_type) end

--设置动画graph 内部
---@param animation_graph_path string # 动画graph路径
function Unit:api_set_animation_graph_inner_usage(animation_graph_path) end

--停止播放动画
---@param name string # 动画名称
function Unit:api_stop_animation(name) end

--停止当前正在播放的动画
function Unit:api_stop_cur_animation() end

--设置动画速度
---@param speed py.Fixed # 速度
function Unit:api_set_animation_speed(speed) end

--单位播放特效
---@param socket_name string # 挂节点名字
---@param sfx_res_id py.SfxKey # 特效编号
---@param keep_time py.Fixed # 持续时间，单位：秒
---@param scale? number # 缩放比例
---@param inherit_pos? boolean # 是否跟随单位位置
---@param inherit_rotate? boolean # 是否跟随单位旋转
---@param inherit_scale? boolean # 是否跟随缩放
---@param role? py.Role # 所属单位
---@param visible_type? py.SfxVisibleType # 可见性规则
---@param rotation? number # 初始旋转 角度制
function Unit:api_play_sfx(socket_name, sfx_res_id, keep_time, scale, inherit_pos, inherit_rotate, inherit_scale, role, visible_type, rotation) end

--在单位挂接点播放特效
---@param socket_name string # 挂节点名字
---@param sfx_id py.SfxKey # 特效编号
---@param keep_time py.Fixed # 持续时间，单位：秒
---@param scale? number # 缩放比例
---@param inherit_rotate? boolean # 是否跟随单位旋转
---@param inherit_scale? boolean # 是否跟随缩放
---@param role? py.Role # 所属玩家
---@param visible_type? py.SfxVisibleType # 可见性规则
function Unit:api_unit_play_sfx_on_socket(socket_name, sfx_id, keep_time, scale, inherit_rotate, inherit_scale, role, visible_type) end

--在单位上播放特效并返回特效实体
---@param socket_name string # 挂节点名字
---@param sfx_res_id py.SfxKey # 特效编号
---@param keep_time py.Fixed # 持续时间，单位：秒
---@param scale? number # 缩放比例
---@param inherit_pos? boolean # 是否跟随单位位置
---@param inherit_rotate? boolean # 是否跟随单位旋转
---@param inherit_scale? boolean # 是否跟随缩放
---@param role? py.Role # 所属单位
---@param visible_type? py.SfxVisibleType # 可见性规则
---@param rotation? number # 初始旋转 角度制
---@return py.Sfx? # 特效
function Unit:api_play_sfx_with_return(socket_name, sfx_res_id, keep_time, scale, inherit_pos, inherit_rotate, inherit_scale, role, visible_type, rotation) end

--单位替换播放动画
---@param target_ani string # 目标动画名字
---@param source_ani string # 原动画名字
function Unit:api_change_animation(target_ani, source_ani) end

--取消单位替换播放动画
---@param target_ani string # 目标动画名字
---@param source_ani string # 原动画名字
function Unit:api_cancel_change_animation(target_ani, source_ani) end

--取消单位所有替换播放动画
---@param source_ani string # 原动画名字
function Unit:api_clear_change_animation(source_ani) end

--单位替换模型
---@param target_model py.ModelKey # 目标模型编号
---@param source_model py.ModelKey # 原模型编号
function Unit:api_change_model(target_model, source_model) end

--取消单位替换模型
---@param target_model py.ModelKey # 目标模型编号
---@param source_model py.ModelKey # 原模型编号
function Unit:api_cancel_change_model(target_model, source_model) end

--取消单位所有替换模型
---@param source_model py.ModelKey # 原模型编号
function Unit:api_clear_change_model(source_model) end

--单位替换模型
---@param target_model py.ModelKey # 目标模型编号
function Unit:api_replace_model(target_model) end

--取消单位替换模型
---@param target_model py.ModelKey # 目标模型名字
function Unit:api_cancel_replace_model(target_model) end

--单位设置指定标签模型
---@param tag string # 标签
---@param model_id py.ModelKey # 目标模型编号
function Unit:set_model_by_tag(tag, model_id) end

--单位删除设置指定标签模型
---@param tag string # 标签
function Unit:remove_model_by_tag(tag) end

--显示血条倒计时
---@param left_time py.Fixed # 倒计时时长, 单位秒
function Unit:api_show_health_bar_count_down(left_time) end

--获取单位模型
---@return py.ModelKey? # 模型编号
function Unit:api_get_model() end

--获取单位原模型
---@return py.ModelKey? # 模型编号
function Unit:api_get_source_model() end

--显示单位头顶文本
---@param text string # 显示信息
---@param second py.Fixed # 持续时间, 单位秒
---@param localize? integer # 多语言环境
function Unit:api_show_text(text, second, localize) end

--更改单位称号
---@param title_str string # 称号
---@param localize? boolean # 多语言转化
function Unit:api_set_title(title_str, localize) end

--设置单位称号可见性
---@param visible boolean # 是否显示
function Unit:api_set_title_visible(visible) end

--隐藏显示单位名称,对于无头顶UI的单位该API不生效,每次隐藏计数+1,每次显示计数-1,计数归零显示单位名称
---@param visible boolean # 是否显示
function Unit:api_set_name_visible(visible) end

--隐藏显示单位名称,对于无头顶UI的单位该API不生效,每次隐藏计数+1,每次显示计数-1,计数归零显示单位名称
---@param visible boolean # 是否显示
function Unit:api_set_bar_name_visible(visible) end

--设置血条显示名字
---@param name string # 名字
function Unit:api_set_bar_name(name) end

--设置血条显示名字缩放
---@param scale number # 缩放
function Unit:set_bar_name_scale(scale) end

--设置血条显示名字字体
---@param font_name string # 字体名称
function Unit:api_set_bar_name_font_type(font_name) end

--设置血条显示名字字体大小
---@param size integer # 字号
function Unit:api_set_bar_name_font_size(size) end

--隐藏显示单位头顶文本,每次隐藏计数+1,每次显示计数-1,计数归零显示单位头顶文本
---@param visible boolean # 是否显示
function Unit:api_set_bar_text_visible(visible) end

--设置头顶显示文字缩放
---@param scale number # 缩放
function Unit:api_set_bar_text_scale(scale) end

--设置头顶显示文字类型
---@param bar_text_type integer # 类型
function Unit:api_set_bar_text_type(bar_text_type) end

--设置头顶显示文字字体
---@param font_type string # 字体
function Unit:api_set_bar_text_font_type(font_type) end

--设置头顶显示文字字号
---@param font_size integer # 字号
function Unit:api_set_bar_text_font_size(font_size) end

--设置血条名称显示样式
---@param t integer # 样式,具体参见**HeadBarShowNameType**
function Unit:api_set_bar_name_show_type(t) end

--隐藏显示单位血条,对于无头顶UI的单位该API不生效,每次隐藏计数+1,每次显示计数-1,计数归零显示单位血条
---@param visible boolean # 是否显示
function Unit:api_set_hp_bar_visible(visible) end

--设置单位血条显示样式,对于无头顶UI的单位该API不生效
---@param t integer # 显示样式,具体参见**HeadBarShowType**
function Unit:api_set_hp_bar_show_type(t) end

--设置单位血条样式,对于无头顶UI的单位该API不生效
---@param t integer # 血条样式
function Unit:api_set_hp_bar_type(t) end

--绑定UI控件
---@param ui_comp py.WorldUINode # UI控件
---@param socket_name string # 挂接点(需确认模型拥有该挂接点,挂接点可在模型属性中查看,具体挂接点类型参见**ModelSocket**)
function Unit:api_add_ui_comp(ui_comp, socket_name) end

--修改单位称号字号
---@param font_size integer # 字号
function Unit:api_change_title_font_size(font_size) end

--修改单位称号缩放
---@param scale number # 缩放比例
function Unit:api_change_title_scale(scale) end

--修改单位称号字体
---@param font_name string # 字体
function Unit:api_change_title_font_type(font_name) end

--修改单位称号样式
---@param style_type integer # 称号样式
function Unit:api_change_title_type(style_type) end

--修改单位称号背景不透明度
---@param opacity number # 不透明度
function Unit:api_set_title_bg_opacity(opacity) end

--修改单位称号背景缩放
---@param scale number # 缩放
function Unit:api_set_title_bg_scale(scale) end

--修改单位血条刻度可见性
---@param visible boolean # 可见性
function Unit:api_set_blood_scale_visible(visible) end

--修改单位称号位置偏移
---@param offset py.Vector2 # 位置偏移
function Unit:api_set_title_bar_pos_offset(offset) end

--修改单位血条位置偏移
---@param offset py.Vector2 # 位置偏移
function Unit:api_set_hp_bar_pos_offset(offset) end

--修改单位名称位置偏移
---@param offset py.Vector2 # 位置偏移
function Unit:api_set_name_bar_pos_offset(offset) end

--修改单位文本位置偏移
---@param offset py.Vector2 # 位置偏移
function Unit:api_set_text_bar_pos_offset(offset) end

--修改单位倒计时位置偏移
---@param offset py.Vector2 # 位置偏移
function Unit:api_set_countdown_bar_pos_offset(offset) end

--单位抬高
---@param y py.Fixed # 抬高高度
---@param dt py.Fixed # 时间
function Unit:api_raise_height(y, dt) end

--获取单位高度
---@return py.Fixed? # 模型高度
function Unit:api_get_height() end

--设置单位缩放
---@param scale number # 缩放
function Unit:api_set_scale(scale) end

--设置单位三轴缩放
---@param scale_x number # x缩放
---@param scale_y number # y缩放
---@param scale_z number # z缩放
function Unit:api_set_unit_scale(scale_x, scale_y, scale_z) end

--获取单位缩放
---@return py.Fixed? # 获取缩放
function Unit:api_get_scale() end

--获取单位模型缩放
---@return py.Fixed? # 获取缩放
function Unit:api_get_model_scale() end

--修改单位血条样式
---@param blood_bar_type integer # 血条样式
function Unit:api_set_blood_bar_type(blood_bar_type) end

--修改单位血条显示模式
---@param blood_bar_show_type integer # 血条显示模式
function Unit:api_set_blood_bar_show_type(blood_bar_show_type) end

--开启残影
---@param r? py.Fixed # r
---@param g? py.Fixed # g
---@param b? py.Fixed # b
---@param a? py.Fixed # a
---@param interval? py.Fixed # interval
---@param duration? py.Fixed # duration
---@param start? py.Fixed # start
---@param end_? py.Fixed # end
---@param use_raw_texture? boolean # Use origin texture
function Unit:api_start_ghost(r, g, b, a, interval, duration, start, end_, use_raw_texture) end

--关闭残影
function Unit:api_stop_ghost() end

--开始溶解效果
---@param dissolve_time py.Fixed # 溶解时间
---@param sink_dis py.Fixed # 下沉距离
function Unit:api_start_dissolve(dissolve_time, sink_dis) end

--关闭溶解效果
function Unit:api_stop_dissolve() end

--设置残影颜色
---@param r py.Fixed # r
---@param g py.Fixed # g
---@param b py.Fixed # b
---@param a py.Fixed # a
function Unit:api_set_ghost_color(r, g, b, a) end

--设置残影颜色
---@param r py.Fixed # r
---@param g py.Fixed # g
---@param b py.Fixed # b
---@param a py.Fixed # a
function Unit:api_set_ghost_color_norm(r, g, b, a) end

--设置残影颜色(HEX)
---@param color string # hex
---@param a py.Fixed # a
function Unit:api_set_ghost_color_hex(color, a) end

--设置残影时间
---@param interval py.Fixed # interval
---@param duration py.Fixed # duration
---@param start py.Fixed # start
---@param end_ py.Fixed # end
function Unit:api_set_ghost_time(interval, duration, start, end_) end

--对单位所属玩家关系播放音乐
---@param camp_target py.RoleRelation # 玩家关系
---@param sid py.AudioKey # 乐曲编号
---@param loop boolean # 是否循环
function Unit:api_play_sound_by_unit_for_role_relation(camp_target, sid, loop) end

--设置XRay是否开启
---@param value boolean # 布尔值
function Unit:api_set_Xray_is_open(value) end

--设置单位隐身被探测到时是否半透明
---@param value boolean # 布尔值
function Unit:api_set_transparent_when_invisible(value) end

--设置单位小地图头像
---@param icon py.Texture # 图片
function Unit:api_set_mini_map_icon(icon) end

--设置敌方单位小地图头像
---@param icon py.Texture # 图片
function Unit:api_set_enemy_mini_map_icon(icon) end

--设置单位选择框的可见性
---@param value boolean # 布尔值
function Unit:api_set_unit_select_effect_visible(value) end

--开关阴阳师模型IDLE时看向摄像机是否开启
---@param role py.Role # 玩家
---@param value boolean # 布尔值
function Unit:api_active_gm1_look_at_camera(role, value) end

--设置单位圆盘阴影开关
---@param is_open boolean # 布尔值
function Unit:api_set_disk_shadow_open(is_open) end

--设置单位圆盘阴影大小
---@param shadow_size number # 大小
function Unit:api_set_unit_disk_shadow_size(shadow_size) end

--设置单位动画状态名
---@param anim_state_name string # 状态名
function Unit:api_set_unit_anim_state_name(anim_state_name) end

--设置单位的描边颜色
---@param color_r number # R
---@param color_g number # G
---@param color_b number # B
function Unit:set_unit_outlined_color(color_r, color_g, color_b) end

--设置单位的描边颜色(HEX)
---@param color string # R
function Unit:set_unit_outlined_color_hex(color) end

--开关单位描边效果
---@param flag boolean # 开关
function Unit:set_unit_outlined_enable(flag) end

--单位添加指定编号的效果
---@param modifier_key py.ModifierKey # 效果编号
---@param from_unit? py.Unit # 来源单位对象
---@param from_ability? py.Ability # 关联技能
---@param time? py.Fixed # 持续时间
---@param cycle_time? py.Fixed # 循环周期
---@param stack_count? integer # 效果层数
---@param lua_table? py.Table # 用户自定义配置表
---@return py.ModifierEntity? # 魔法效果
function Unit:api_add_modifier(modifier_key, from_unit, from_ability, time, cycle_time, stack_count, lua_table) end

--获取单位身上指定编号的的效果层数
---@param modifier_key py.ModifierKey # 效果编号
---@return integer? # 效果层数
function Unit:api_get_modifier_stack_count(modifier_key) end

--单位身上是否拥有指定编号的效果
---@param modifier_key py.ModifierKey # 效果编号
---@return boolean? # 单位身上是否有指定编号的效果
function Unit:api_has_modifier(modifier_key) end

--单位身上是否拥有指定标签的效果
---@param tag string # 标签
---@return boolean? # 单位身上是否拥有指定标签的效果
function Unit:api_has_modifier_with_tag(tag) end

--获取单位身上指定编号的第i个效果实例
---@param add_index integer # 效果位置
---@param modifier_key py.ModifierKey # 效果编号
function Unit:api_get_modifier(add_index, modifier_key) end

--获取单位身上指定编号的第i个效果的个数
---@param modifier_key py.ModifierKey # 效果编号
function Unit:api_get_modifier_count(modifier_key) end

--移除目标单位身上的目标modifier实例
---@param tar_modifier py.ModifierEntity # 效果编号
function Unit:api_remove_modifier_instance(tar_modifier) end

--移除目标单位身上的目标modifier类型的所有实例
---@param modifier_key py.ModifierKey # 效果编号
function Unit:api_remove_modifier_type(modifier_key) end

--单位身上是否拥有指定类别的效果
---@param modifier_effect_type py.ModifierEffectType # 魔法效果类型
---@return boolean? # 单位身上是否拥有指定类型的魔法效果
function Unit:api_has_modifier_type(modifier_effect_type) end

--删除单位指定影响类型的魔法效果
---@param effect_type py.ModifierEffectType # 效果影响类型
function Unit:api_delete_all_modifiers_by_effect_type(effect_type) end

--获取单位身上所有的魔法效果
---@return py.ModifierEntity? # 魔法效果
function Unit:api_get_all_modifiers() end

--单位添加技能
---@param ability_type py.AbilityType # 技能类型
---@param ability_id py.AbilityKey # 技能编号
---@param ability_index? py.AbilityIndex # 技能槽位编号
---@param ability_level? integer # 技能等级
---@param lua_table? py.Table # 用户自定义配置表
---@return py.Ability? # 技能
function Unit:api_add_ability(ability_type, ability_id, ability_index, ability_level, lua_table) end

--单位根据槽位移除技能
---@param ability_type integer # 技能类型
---@param ability_index integer # 技能槽位
function Unit:api_remove_ability_by_index(ability_type, ability_index) end

--单位移除某种类型里所有是指定技能ID的技能
---@param ability_type integer # 技能类型
---@param ability_id py.AbilityKey # 技能ID
function Unit:api_remove_abilities_in_type(ability_type, ability_id) end

--单位设置技能等级。
---@param modify integer # 修改方式
---@param ability_type py.AbilityType # 技能类型
---@param ability_index py.AbilityIndex # 技能槽位
---@param level integer # 技能等级
function Unit:api_set_ability_level(modify, ability_type, ability_index, level) end

--单位学习技能
---@param ability_key py.AbilityKey # 技能类型
function Unit:api_unit_learn_ability(ability_key) end

--获取英雄的技能点
---@return integer? # 技能点
function Unit:api_get_ability_point() end

--设置英雄的技能点
---@param ability_point integer # 技能点
function Unit:api_set_ability_point(ability_point) end

--增加英雄的技能点
---@param value integer # 技能点
function Unit:api_add_ability_point(value) end

--通过技能槽位获取技能
---@param ability_type py.AbilityType # 技能类型
---@param ability_index py.AbilityIndex # 技能槽位
---@return py.Ability? # 技能对象
function Unit:api_get_ability(ability_type, ability_index) end

--通过技能类型加技能ID获取技能
---@param ability_type py.AbilityType # 技能类型
---@param ability_id py.AbilityKey # 技能编号
---@return py.Ability? # 技能对象
function Unit:api_get_ability_by_type(ability_type, ability_id) end

--获取某种类型的技能列表
---@param ability_type py.AbilityType # 技能类型
---@return py.Ability? # 技能对象
function Unit:api_get_abilities_by_type(ability_type) end

--是否有对应技能类型的技能
---@param ability_id py.AbilityKey # 技能类型
---@return boolean? # 是否有对应技能类型的技能
function Unit:api_check_has_ability_type(ability_id) end

--获取单位技能列表
---@return py.Ability? # 技能对象
function Unit:api_get_all_abilities_can_show() end

--根据坑位交换技能
---@param ability_1_type py.AbilityType # 技能类型
---@param ability_1_index py.AbilityIndex # 技能槽位
---@param ability_2_type py.AbilityType # 技能类型
---@param ability_2_index py.AbilityIndex # 技能槽位
function Unit:api_switch_ability_by_index(ability_1_type, ability_1_index, ability_2_type, ability_2_index) end

--交换技能
---@param ability_1 py.Ability # 技能
---@param ability_2 py.Ability # 技能
function Unit:api_switch_ability(ability_1, ability_2) end

--单位禁用技能。
---@param ability_type py.AbilityType # 技能类型
---@param ability_index py.AbilityIndex # 技能槽位
function Unit:api_disable_ability(ability_type, ability_index) end

--单位解禁技能。
---@param ability_type py.AbilityType # 技能类型
---@param ability_index py.AbilityIndex # 技能槽位
function Unit:api_enable_ability(ability_type, ability_index) end

--停止单位所有技能
function Unit:api_stop_all_abilities() end

--单位是否有正在释放的技能
---@return boolean? # 是否有正在释放的技能
function Unit:api_unit_has_running_ability() end

--返回单位实体指定槽位技能的字符串属性值
---@param ability_type py.AbilityType # 技能类型
---@param ability_index py.AbilityIndex # 技能槽位
---@param prop string # 属性名
---@return string? # 字符
function Unit:api_get_ability_str_attr_value(ability_type, ability_index, prop) end

--根据技能序号获取技能对象
---@param seq py.AbilitySeq # 技能序号
---@return py.Ability? # 技能对象
function Unit:api_get_ability_by_seq(seq) end

--给单位施加状态
---@param state_id integer # 状态ID
function Unit:api_add_state(state_id) end

--给单位去除状态
---@param state_id integer # 状态ID
function Unit:api_remove_state(state_id) end

--给单位施加状态
---@param state_id integer # 状态ID
function Unit:api_add_multi_state(state_id) end

--给单位去除状态
---@param state_id integer # 状态ID
function Unit:api_remove_multi_state(state_id) end

--是否在战斗状态
---@return boolean? # 是否在战斗状态
function Unit:api_is_in_battle_state() end

--单位是否处于某状态
---@param state_bit integer # 状态
---@return boolean? # 单位是否处于某状态
function Unit:api_has_state(state_bit) end

--单位施放技能
---@param ability_type integer # 技能类型
---@param ability_index integer # 技能槽位
function Unit:api_release_ability_by_index(ability_type, ability_index) end

--单位施放技能，具有释放目标地点
---@param ability_type integer # 技能类型
---@param ability_index integer # 技能坑位
---@param postion py.Point # 技能目标位置
function Unit:api_release_ability_at_position(ability_type, ability_index, postion) end

--发布建造命令(目标点)
---@param build_key py.UnitKey # 建筑类型
---@param point py.Point # 目标位置
function Unit:api_create_building_on_point(build_key, point) end

--发布建造命令(坐标)
---@param build_key py.UnitKey # 建筑类型
---@param pos_x py.Fixed # 坐标X
---@param pos_z py.Fixed # 坐标Z
function Unit:api_create_building_on_position(build_key, pos_x, pos_z) end

--获取单位攻击间隔
---@return py.Fixed? # 攻击间隔
function Unit:api_get_unit_attack_interval() end

--获取单位每秒攻击次数
---@return py.Fixed? # 攻击次数
function Unit:api_get_unit_attack_count_per_second() end

--获取普攻技能
---@return py.Ability? # 普攻
function Unit:api_get_common_atk_ability() end

--设置单位简易普攻骰子最大值
---@param dice_max_value integer # 最大值
function Unit:api_set_simple_atk_dice_max_value(dice_max_value) end

--获取单位简易普攻骰子最大值
---@return integer? # 骰子最大值
function Unit:api_get_simple_atk_dice_max_value() end

--设置单位简易普攻骰子最大值
---@param dice_count integer # 最大值
function Unit:api_set_simple_atk_dice_count(dice_count) end

--获取单位简易普攻骰子个数
---@return integer? # 骰子最大值
function Unit:api_get_simple_atk_dice_count() end

--单位是否拥有物品
---@param item py.Item # 物品
---@return boolean? # 单位是否拥有物品
function Unit:api_has_item(item) end

--单位是否拥有特定编号物品
---@param item_no py.ItemKey # 物品编号
---@return boolean? # 单位是否拥有特定编号物品
function Unit:api_has_item_key(item_no) end

--给单位添加物品名
---@param item_no py.ItemKey # 物品编号
---@param slot_type? py.SlotType # 槽位类型
---@return py.Item? # 创建的物品实体
function Unit:api_add_item(item_no, slot_type) end

--给单位删除物品名
---@param item_key py.ItemKey # 物品编号
---@param num? integer # 数量
function Unit:api_delete_item(item_key, num) end

--单位丢弃物品实体到场景中
---@param item py.Item # 物品
---@param pos py.FPoint # 点
---@param stack_cnt integer # 数量
function Unit:api_drop_item(item, pos, stack_cnt) end

--单位删除物品实体
---@param stack_cnt integer # 数量
---@param item py.Item # 物品
function Unit:api_remove_item(stack_cnt, item) end

--获取单位背包槽位的物品
---@param slot_type py.SlotType # 背包槽位
---@param slot_idx integer # 格子下标
---@return py.Item? # 物品对象
function Unit:api_get_item_by_slot(slot_type, slot_idx) end

--获取单位栏位剩余空间
---@param slot_type py.SlotType # 背包槽位
---@return integer? # 整型
function Unit:api_get_slot_capacity(slot_type) end

--移动物品
---@param item py.Item # 物品
---@param slot_type py.SlotType # 背包槽位
---@param slot_idx integer # 格子下标
function Unit:api_shift_item(item, slot_type, slot_idx) end

--移动物品
---@param item py.Item # 物品
---@param slot_type py.SlotType # 背包槽位
---@param slot_idx? integer # 格子下标
---@param is_force_shift? boolean # 格子被占是否转移
function Unit:api_shift_item_new(item, slot_type, slot_idx, is_force_shift) end

--单位身上所有物品
---@return py.ItemGroup? # 物品组
function Unit:api_get_all_item_pids() end

--设置单位物品栏的格子数量
---@param cnt integer # 个数
function Unit:api_set_unit_bar_cnt(cnt) end

--设置单位背包栏的格子数量
---@param cnt integer # 个数
function Unit:api_set_unit_pkg_cnt(cnt) end

--单位身上拥有指定类型的物品数量
---@param item_type py.ItemKey # 物品编号
---@return integer? # 数量
function Unit:api_get_num_of_item_type(item_type) end

--获取单位持有的物品类型
---@param slot_type py.SlotType # 槽位类型
---@param slot_idx integer # 整数下标
---@return py.ItemKey? # 物品编号
function Unit:api_get_item_type_by_slot(slot_type, slot_idx) end

--单位是否商店
---@return boolean? # 单位是否商店
function Unit:api_is_shop() end

--获取商店单位范围
---@return py.Fixed? # 商店范围
function Unit:api_get_shop_range() end

--添加物品商品到商店
---@param tab_name py.TabName # 页签
---@param item_no py.ItemKey # 道具编号
function Unit:api_add_shop_item(tab_name, item_no) end

--获取商店某页签的商品列表
---@param tab_idx py.TabIdx # 页签id
---@return py.List? # 道具编号
function Unit:api_get_shop_item_list(tab_idx) end

--获取商店商品的恢复时间
---@param tab_idx py.TabIdx # 页签id
---@param item_no py.ItemKey # 道具编号
function Unit:api_get_shop_item_cd(tab_idx, item_no) end

--获取商店商品的库存恢复间隔
---@param tab_idx py.TabIdx # 页签id
---@param item_num integer # 第N个道具
---@return py.Fixed? # 恢复间隔
function Unit:api_get_shop_item_default_cd(tab_idx, item_num) end

--获取商店商品的剩余恢复时间
---@param tab_idx py.TabIdx # 页签id
---@param item_num integer # 第N个道具
---@return py.Fixed? # 恢复间隔
function Unit:api_get_shop_item_residual_cd(tab_idx, item_num) end

--获取商店页签数量
---@return integer? # 页签数量
function Unit:api_get_shop_tab_cnt() end

--获取商店的页签名
---@param tab_idx py.TabIdx # 页签id
---@return string? # 页签名
function Unit:api_get_shop_tab_name(tab_idx) end

--获取商店指定页签第N个商品的类型
---@param tab_idx py.TabIdx # 页签id
---@param item_idx integer # 商品编号
---@return py.ItemKey? # 物品类型
function Unit:api_get_shop_tab_item_type(tab_idx, item_idx) end

--添加单位商品到商店
---@param tab_name py.TabName # 页签
---@param entity_no py.UnitKey # 单位编号
function Unit:api_add_shop_unit(tab_name, entity_no) end

--删除商店物品商品
---@param tab_name py.TabName # 页签
---@param item_no py.ItemKey # 道具编号
function Unit:api_remove_shop_item(tab_name, item_no) end

--删除商店单位商品
---@param tab_name py.TabName # 页签
---@param entity_no py.UnitKey # 单位编号
function Unit:api_remove_shop_unit(tab_name, entity_no) end

--设置物品商品库存
---@param tab_name py.TabName # 页签
---@param item_no py.ItemKey # 道具编号
---@param cnt integer # 库存
function Unit:api_set_shop_item_stock(tab_name, item_no, cnt) end

--设置单位商品库存
---@param tab_name py.TabName # 页签
---@param entity_no py.UnitKey # 单位编号
---@param cnt integer # 库存
function Unit:api_set_shop_unit_stock(tab_name, entity_no, cnt) end

--设置商店开关
---@param is_shop boolean # 开关
function Unit:api_set_is_shop(is_shop) end

--单位购买物品
---@param shop_unit py.Unit # 商店
---@param tab_idx py.TabIdx # 页签id
---@param item_no py.ItemKey # 物品编号
function Unit:api_buy_item_with_tab_name(shop_unit, tab_idx, item_no) end

--单位购买单位
---@param shop_unit py.Unit # 商店
---@param tab_name py.TabName # 页签
---@param entity_no py.UnitKey # 单位编号
function Unit:api_buy_unit_with_tab_name(shop_unit, tab_name, entity_no) end

--单位出售物品
---@param shop_unit py.Unit # 商店
---@param item py.Item # 道具
function Unit:api_sell_item(shop_unit, item) end

--设置商店目标
---@param target_unit py.Unit # 目标
function Unit:api_set_shop_target(target_unit) end

--获取单位商店物品商品库存
---@param tab_idx py.TabIdx # 页签id
---@param item_no py.ItemKey # 物品编号
---@return integer? # 商品库存
function Unit:api_get_shop_item_stock(tab_idx, item_no) end

--获取单位商店单位商品库存
---@param tab_name py.TabName # 页签
---@param entity_no py.UnitKey # 单位编号
---@return integer? # 商品库存
function Unit:api_get_shop_unit_stock(tab_name, entity_no) end

--获取单位商店单位商品售价
---@param tab_name py.TabName # 页签
---@param entity_no py.UnitKey # 单位编号
---@return py.Fixed? # 商品售价
function Unit:api_get_shop_item_price(tab_name, entity_no) end

--玩家是否可以购买商店的物品
---@param role py.Role # 玩家
---@return boolean? # 能否购买
function Unit:api_shop_check_camp(role) end

--科技升级
---@param tech_no py.TechKey # 科技编号
function Unit:api_upgrade_tech(tech_no) end

--获取科技列表
---@return py.List? # 科技编号
function Unit:api_get_tech_list() end

--获取科技列表
---@return py.List? # 科技编号
function Unit:api_get_affect_techs() end

--获取科技是否满足前置条件
---@param tech_no py.TechKey # 科技编号
---@return py.TechKey? # 科技编号
function Unit:api_check_tech_precondition(tech_no) end

--添加科技
---@param tech_no py.TechKey # 科技编号
function Unit:api_add_tech(tech_no) end

--删除科技
---@param tech_no py.TechKey # 科技编号
function Unit:api_remove_tech(tech_no) end

--发布命令
---@param command py.UnitCommand # 命令
---@param enqueue? boolean # 是否进队列
function Unit:api_release_command(command, enqueue) end

--设置单位默认跳转状态
---@param behavior py.UnitBehavior # 默认跳转状态
function Unit:api_set_default_switch_behavior(behavior) end

--单位 - 单位发起求救
---@param source_unit py.Unit # 攻击目标
---@param seek_range number # 搜寻范围
function Unit:api_trigger_rescue(source_unit, seek_range) end

--单位 - 设置单位求救类型
---@param v py.ERescueSeekerType # 值
function Unit:api_set_rescue_seeker_type(v) end

--单位 - 设置单位救援类型
---@param v py.ERescuerType # 值
function Unit:api_set_rescuer_type(v) end

--单位 - 设置单位求救距离
---@param v number # 值
function Unit:api_set_rescue_seeker_distance(v) end

--单位 - 设置单位求救间隔
---@param v number # 值
function Unit:api_set_rescue_seeker_interval(v) end

--单位 - 设置单位救援后返回
---@param v boolean # 值
function Unit:api_set_rescue_finish_return(v) end

--单位 - 获取单位求救类型
---@return py.ERescueSeekerType? # 值
function Unit:api_get_rescue_seeker_type() end

--单位 - 获取单位救援类型
---@return py.ERescuerType? # 值
function Unit:api_get_rescuer_type() end

--单位 - 获取单位求救距离
---@return number? # 值
function Unit:api_get_rescue_seeker_distance() end

--单位 - 获取单位求救间隔
---@return number? # 值
function Unit:api_get_rescue_seeker_interval() end

--单位 - 获取单位救援后返回
---@return boolean? # 值
function Unit:api_get_rescue_finish_return() end

--单位 - 获取单位是否正在救援
---@return boolean? # 值
function Unit:api_get_is_rescuing() end

--单位 - 获取单位是否正在救援后返回
---@return boolean? # 值
function Unit:api_get_is_rescue_returning() end

--单位 - 尝试触发AI更新
function Unit:api_try_update_ai() end

--单位 - 执行下一命令
function Unit:api_do_next_command() end

--单位 - 获取命令队列是否为空
---@return boolean? # 值
function Unit:api_is_command_queue_empty() end

--单位 - 设置维修目标单位
---@param repair_target py.Unit # 维修目标单位
function Unit:api_set_repair_target_unit(repair_target) end

--单位 - 设置维修技能
---@param ability py.Ability # 维修技能
function Unit:api_set_repair_ability(ability) end
