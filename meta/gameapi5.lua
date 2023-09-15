-- 此文件由 `tools/genGameAPI` 生成，请勿手动修改。
---@meta

---@class py.GameAPI
GameAPI = {}

--增加击倒值
---@param unit py.Unit # 单位
---@param down_value py.Fixed # 击倒值
function GameAPI.api_add_unit_down_value(unit, down_value) end

--开始使用手持道具
---@param unit py.Unit # 单位
function GameAPI.api_character_try_begin_use(unit) end

--结束使用手持道具
---@param unit py.Unit # 单位
function GameAPI.api_character_try_end_use(unit) end

--设置动画状态机为物理状态
---@param unit py.Unit # 单位
---@param duration py.Fixed # 持续时间
function GameAPI.api_set_entity_anim_state_machine_physics(unit, duration) end

--获取角色移动速度
---@param unit py.Unit # 单位
---@return py.FVector3 # 速度
function GameAPI.api_physics_unit_get_move_speed(unit) end

--设置单位旋转（欧拉角）
---@param unit py.Unit # 单位
---@param angle_x py.Fixed # X
---@param angle_y py.Fixed # Y
---@param angle_z py.Fixed # Z
function GameAPI.api_physics_unit_set_orientation(unit, angle_x, angle_y, angle_z) end

--主控角色做预定义表情
---@param unit py.Unit # 角色
---@param cc_emo py.CcEmo # 预定义表情ID
---@param duration py.Fixed # 表情播放时长
function GameAPI.cc_change_emo(unit, cc_emo, duration) end

--单位切换状态机
---@param unit py.Unit # 单位
---@param state_name string # 状态机名称
function GameAPI.api_asm_jump_to_state(unit, state_name) end

--设置角色squash
---@param unit py.Unit # 角色
---@param squash py.Fixed # squash
function GameAPI.api_set_unit_squash(unit, squash) end

--设置单位移动
---@param unit py.Unit # 单位
---@param move_direction py.MoveDirection # 方向
function GameAPI.api_set_unit_move(unit, move_direction) end

--设置单位停止移动
---@param unit py.Unit # 单位
---@param move_direction py.MoveDirection # 方向
function GameAPI.api_set_unit_stop_move(unit, move_direction) end

--设置是否使用内置键盘控制
---@param enable boolean # 是否使用
function GameAPI.api_set_builtin_key_control_enable(enable) end

--判断是否使用内置键盘控制
---@return boolean # 布尔值
function GameAPI.api_is_builtin_key_control_enable() end

--通知改键
---@param enable boolean # 是否使用
function GameAPI.api_notify_custom_key(enable) end

--设置单位跳跃
---@param unit py.Unit # 单位
function GameAPI.api_set_unit_jump(unit) end

--设置单位跑(角色配置的跑步速度)
---@param unit py.Unit # 单位
function GameAPI.api_set_unit_run(unit) end

--设置单位走(角色配置的走路速度)
---@param unit py.Unit # 单位
function GameAPI.api_set_unit_walk(unit) end

--设置单位速度
---@param unit py.Unit # 单位
---@param speed py.Fixed # 速度
function GameAPI.api_set_unit_speed(unit, speed) end

--设置语音指令
---@param is_on boolean # 是否开启
function GameAPI.api_set_audio_cc(is_on) end

--根据bid获取rigidBody
---@param bid integer # body ID
---@return py.RigidBody # RigidBody
function GameAPI.api_get_rigid_body_by_bid(bid) end

--刚体添加球形碰撞器
---@param body py.RigidBody # 刚体
---@param pos py.FVector3 # pos
---@param radius py.Fixed # radius
---@param euler_angle? py.FVector3 # euler_angle
---@param is_trigger? boolean # is_trigger
function GameAPI.api_add_sphere_collider(body, pos, radius, euler_angle, is_trigger) end

--根据名称获取物理组件中的rigidbody
---@param physics_object py.PhysicsEntity # 物理组件
---@param name string # 名称
---@return py.RigidBody # RigidBody
function GameAPI.api_get_rigid_body_in_physics_object(physics_object, name) end

--获取刚体所属的单位
---@param body py.RigidBody # 刚体
---@return py.Unit # Owner
function GameAPI.api_get_rigid_body_owner_unit(body) end

--获取刚体所属的逻辑物理组件
---@param body py.RigidBody # 刚体
---@return py.PhysicsEntity # Owner
function GameAPI.api_get_rigid_body_owner_physics_entity(body) end

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

--设置刚体的朝向
---@param body py.RigidBody # 刚体
---@param direction py.FRotation # direction
function GameAPI.api_set_rigid_body_direction(body, direction) end

--设置刚体的刚体类型
---@param body py.RigidBody # 刚体
---@param body_type string # 刚体类型
function GameAPI.api_set_rigid_body_type(body, body_type) end

--设置刚体的布尔类型属性
---@param body py.RigidBody # 刚体
---@param attr_name string # 布尔类型属性
---@param value boolean # 值
function GameAPI.api_set_rigid_body_bool_attr(body, attr_name, value) end

--设置刚体有效性
---@param body py.RigidBody # 刚体
---@param is_active boolean # 是否有效
function GameAPI.api_set_rigidbody_active(body, is_active) end

--设置刚体模型可见性
---@param body py.PhysicsEntity # 物理组件
---@param visible py.RigidBody # 刚体
function GameAPI.api_set_rigidbody_visible(body, visible) end

--获取刚体有效性
---@param body py.RigidBody # 刚体
---@return boolean # 是否有效
function GameAPI.api_get_rigidbody_active(body) end

--设置刚体速度
---@param body py.RigidBody # 刚体
---@param speed py.Fixed # 速度大小
---@param direction py.FVector3 # 速度方向
function GameAPI.api_set_rigidbody_velocity(body, speed, direction) end

--获得刚体速度
---@param body py.RigidBody # 刚体
---@return py.FVector3 # 速度
function GameAPI.api_get_rigidbody_velocity(body) end

--设置刚体角速度
---@param body py.RigidBody # 刚体
---@param angular_velocity py.FVector3 # 角速度
function GameAPI.api_set_rigidbody_angular_velocity(body, angular_velocity) end

--设置刚体角速度
---@param body py.RigidBody # 刚体
function GameAPI.api_get_rigidbody_angular_velocity(body) end

--获得刚体朝向
---@param body py.RigidBody # 刚体
---@return py.FVector3 # 朝向
function GameAPI.api_get_rigidbody_forward(body) end

--获得范围内的刚体组
---@param position py.FVector3 # 位置
---@param radius number # 半径
---@param collision_category? integer # 自身碰撞类别
---@param collide_with_mask? integer # 目标碰撞类别
---@param ignore_trigger? boolean # 忽略触发器
---@param ignore_non_trigger? boolean # 忽略非触发器
---@param ignore_non_rigid? boolean # 忽略非刚体
---@param ignore_dynamic? boolean # 忽略动态物体
---@param ignore_kinematic? boolean # 忽略运动学物体
---@param ignore_static? boolean # 忽略静态物体
---@param ignore_logic_body? boolean # 忽略逻辑物体
---@param ignore_non_logic_body? boolean # 忽略非逻辑物体
---@return py.RigidBodyGroup # 刚体组
function GameAPI.api_get_rigid_body_group_in_range(position, radius, collision_category, collide_with_mask, ignore_trigger, ignore_non_trigger, ignore_non_rigid, ignore_dynamic, ignore_kinematic, ignore_static, ignore_logic_body, ignore_non_logic_body) end

--替换刚体模型
---@param body py.RigidBody # 刚体
---@param id py.Fixed # 模型id
function GameAPI.api_replace_rigid_body_model(body, id) end

--还原刚体上一个模型
---@param body py.RigidBody # 刚体
function GameAPI.api_restore_rigid_body_last_model(body) end

--获得刚体中指定名字的碰撞器
---@param body py.RigidBody # 刚体
---@param name string # 碰撞器名字
---@return py.Collider # Collider
function GameAPI.api_get_rigid_body_collider(body, name) end

--刚体是否有指定tag
---@param body py.RigidBody # 刚体
---@param tag string # tag
---@return boolean # 布尔值
function GameAPI.api_is_rigid_has_tag(body, tag) end

--获取刚体质量
---@param body py.RigidBody # 刚体
---@return py.Fixed # 质量
function GameAPI.api_rigid_body_get_mass(body) end

--设置刚体模型缩放
---@param body py.RigidBody # 刚体
---@param scale_x number # x缩放
---@param scale_y number # y缩放
---@param scale_z number # z缩放
function GameAPI.api_rigid_body_set_scale(body, scale_x, scale_y, scale_z) end

--刚体按照指定轴旋转
---@param body py.RigidBody # 刚体
---@param axis py.Vector3 # 轴
---@param angle py.Fixed # 弧度
function GameAPI.api_rigid_body_angle_axis(body, axis, angle) end

--扔出刚体
---@param body py.PhysicsEntity # 刚体
---@param start py.Vector3 # 抛出点
---@param forward py.Vector3 # 抛出方向
---@param length py.Fixed # 抛出距离
---@param speed py.Fixed # 水平速度
function GameAPI.api_throw_rigid_body(body, start, forward, length, speed) end

--设置刚体的相对坐标系的速度
---@param body py.RigidBody # 刚体
---@param speed py.Fixed # 速度大小
---@param direction py.FVector3 # 速度方向
function GameAPI.api_set_rigid_body_reference_frame_velocity(body, speed, direction) end

--设置刚体绑定目标刚体的相对坐标系
---@param body py.RigidBody # 刚体
---@param target py.RigidBody # 目标刚体
function GameAPI.api_set_rigid_body_add_reference_frame(body, target) end

--设置刚体移除目标刚体的相对坐标系
---@param body py.RigidBody # 刚体
---@param target py.RigidBody # 目标刚体
function GameAPI.api_set_rigid_body_remove_reference_frame(body, target) end

--把刚体的本地坐标转到全局坐标
---@param body py.RigidBody # 刚体
---@param local_pos py.FVector3 # local_pos
function GameAPI.api_transform_local_to_global_coords(body, local_pos) end

--删除REACTION
---@param reaction py.Reaction # Reaction
function GameAPI.api_delete_reaction(reaction) end

--删除REACTION Group
---@param reactions py.ReactionGroup # ReactionGroup
function GameAPI.api_delete_reaction_group(reactions) end

--刚体增加均匀引力场
---@param body py.PhysicsEntity # 刚体
---@param speed py.Fixed # 速度大小
---@param position py.Vector3 # 力场源点
---@return py.Reaction # 物理Reaction
function GameAPI.api_add_uniform_gravitation_field_to_rigid_body(body, speed, position) end

--刚体增加风场
---@param body py.PhysicsEntity # 刚体
---@param speed py.Fixed # 速度大小
---@param direction py.FVector3 # 速度方向
---@return py.RigidBody # RigidBody
function GameAPI.api_add_wind_force_field_to_rigid_body(body, speed, direction) end

--物理物品抛出
---@param physics_item py.Unit # 物品单位
---@param length py.Fixed # 抛出距离
---@param vel py.Fixed # 水平速度
---@param socket_name string # 出手绑点
function GameAPI.throw_physics_item(physics_item, length, vel, socket_name) end

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

--逻辑物理物品播放动画
---@param physics_item py.Unit # 物理组件
---@param anim string # 动画名称
---@param play_speed number # 播放倍率
---@param begin_t number # 开始时间(s)
---@param end_t number # 结束时间(s)，正数 -1 表示不结束
---@param loop boolean # 是否循环
---@param return_idle boolean # 播放结束后是否恢复idle
function GameAPI.api_physics_item_play_animation(physics_item, anim, play_speed, begin_t, end_t, loop, return_idle) end

--单位扔出物理组件
---@param entity py.PhysicsEntity # 物理组件
---@param length py.Fixed # 抛出距离
---@param vel py.Fixed # 水平速度
---@param socket_name string # 出手绑点
function GameAPI.throw_physics_entity(entity, length, vel, socket_name) end

--持有者解绑逻辑物理组件模型
---@param entity py.Unit # 逻辑物理组件
function GameAPI.api_detach_physics_entity_viewer(entity) end

--获得逻辑物理组件的持有者
---@param entity py.PhysicsEntity # 逻辑物理组件
---@return py.Unit # 持有者
function GameAPI.api_get_physics_entity_owner(entity) end

--创建特效到三维坐标
---@param sfx_id py.SfxKey # 特效编号
---@param position py.FVector3 # 位置
---@param direction? py.FVector3 # 朝向
---@param scale? number # 缩放比例
---@param duration? number # 持续时间
---@param immediately? boolean # 是否立即删除
---@return py.Sfx # 特效
function GameAPI.create_sfx_on_point_3d(sfx_id, position, direction, scale, duration, immediately) end

--调试暂停
function GameAPI.api_debug_pause() end

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
---@return py.SoundEntity # 声音对象
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
---@param fade_in_time? number # 淡入时间
---@param fade_out_time? number # 淡出时间
---@param ensure_play? boolean # 确保播放
---@param loop? boolean # 是否循环
---@return py.SoundEntity # 声音对象
function GameAPI.play_3d_sound_for_player(role, sid, position, height, fade_in_time, fade_out_time, ensure_play, loop) end

--跟随单位播放3d音乐
---@param role py.Role # 玩家
---@param sid py.AudioKey # 乐曲编号
---@param unit py.Unit # 单位
---@param fade_in_time? number # 淡入时间
---@param fade_out_time? number # 淡出时间
---@param ensure_play? boolean # 确保播放
---@param loop? boolean # 是否循环
---@param offset_x? number # 偏移x
---@param offset_y? number # 偏移y
---@param offset_z? number # 偏移z
---@return py.SoundEntity # 声音对象
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
---@param return_cm? boolean # 是否返回cm
---@return py.Fixed # 实数
function GameAPI.get_ability_conf_formula_attr_with_unit(ability_id, attr_name, level, stack_count, unit, return_cm) end

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
---@param sort_type? py.SortType # 筛选规则
---@return py.List # 可破坏物列表
function GameAPI.get_all_dest_in_area(area, sort_type) end

--获取点范围内的可破坏物列表
---@param point py.Point # 区域对象
---@param rng number # 半径
---@return py.List # 可破坏物列表
function GameAPI.get_all_dest_in_point_rng(point, rng) end

--获取不同形状范围内的可破坏物列表
---@param point py.Point # 区域对象
---@param shape py.Shape # 形状
---@param sort_type? py.SortType # 筛选规则
---@return py.List # 可破坏物列表
function GameAPI.get_all_dest_in_shapes(point, shape, sort_type) end

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

--设置玩家的声音接收器跟随镜头射线与地面焦点
---@param role py.Role # 玩家
---@param camera_ray_direction py.CameraRayDirection # 相机射线方向
function GameAPI.set_player_listener_to_follow_intersection_of_camera_ray_and_ground(role, camera_ray_direction) end

--设置玩家的声音接收器跟随单位
---@param role py.Role # 玩家
---@param unit py.Unit # 单位
function GameAPI.set_player_listener_to_follow_unit(role, unit) end

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

--设置镜头是否跟随地形高度浮动
---@param enable boolean # 开关
---@param detect_range? integer # 检测范围
function GameAPI.set_camera_floating_with_terrain(enable, detect_range) end

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
---@param jump_word_track? integer # 跳字轨迹
function GameAPI.apply_damage(source_unit, ability, target_unit, damage_type, damage, jump_word, extra_context, as_normal_hit, critical, no_miss, hit_sfx, hit_socket, harm_text_enum, jump_word_track) end

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

--获取路径的【起点】
---@param road_point_list py.Road # 路径
---@return py.FVector3 # 起点
function GameAPI.get_road_point_start_point(road_point_list) end

--获取路径的【终点】
---@param road_point_list py.Road # 路径
---@return py.FVector3 # 终点
function GameAPI.get_road_point_end_point(road_point_list) end

--获取路径的【随机点】
---@param road_point_list py.Road # 路径
---@return py.FVector3 # 随机点
function GameAPI.get_road_point_random_point(road_point_list) end

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

--设置区域内视野情况
---@param area py.Area # 区域
---@param player py.Role # 玩家
---@param fog_state integer # 迷雾状态
---@param is_vision_true boolean # 布尔变量
function GameAPI.set_fog_state(area, player, fog_state, is_vision_true) end

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
---@return string # 翻译后的字符串
function GameAPI.get_text_config(string) end

--发送触发器自定义事件
---@param event_name string # 自定义事件名称
---@param p1 integer # 参数1
---@param p2 integer # 参数2
---@param p3 integer # 参数3
---@param p4 integer # 参数4
---@param p5 integer # 参数5
function GameAPI.send_custom_event(event_name, p1, p2, p3, p4, p5) end

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
---@param text_type string # 跳字枚举
---@param value string # 跳字内容
---@param player_group py.RoleGroup # 玩家组
---@param jump_word_track? integer # 跳字轨迹
function GameAPI.create_harm_text(point, text_type, value, player_group, jump_word_track) end

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
---@return py.Fixed # 占比值
function GameAPI.get_role_ui_x_per(role) end

--玩家鼠标屏幕位置Y的窗口占比
---@param role py.Role # 玩家
---@return py.Fixed # 占比值
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
---@return py.List # 资源属性列表
function GameAPI.iter_role_res(is_iter_coin_only) end

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

--开关目标点的草丛
---@param enable boolean # 开关
---@param point py.Point # 点
function GameAPI.set_grass_enable_by_pos(enable, point) end

--为玩家开关全局视野
---@param enable boolean # 开关
function GameAPI.enable_fow_for_player(enable) end

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

--创建界面模块
---@param role py.Role # 玩家
---@param distance_max number # 高度上限值
function GameAPI.set_camera_distance_max(role, distance_max) end

--设置画风
---@param role py.Role # 玩家
---@param post_style_type py.PostEffect # 画风
---@param color_r? integer # R
---@param color_g? integer # R
---@param color_b? integer # R
---@param depth_scale? number # 描边
---@param intensity? number # 强度
function GameAPI.set_post_effect(role, post_style_type, color_r, color_g, color_b, depth_scale, intensity) end

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

--遍历物品类型的物品合成材料
---@param item_key py.ItemKey # 物品类型
function GameAPI.iter_compose_item_res_of_item_name(item_key) end

--遍历物品类型的玩家合成材料
---@param item_key py.ItemKey # 物品类型
function GameAPI.iter_compose_role_attr_of_item_name(item_key) end

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

--获取区域的场景ID
---@param area py.Area # 区域
---@return integer # 场景ID
function GameAPI.get_area_resource_id(area) end

--获取路径的场景ID
---@param road py.Road # 路径
---@return integer # 场景ID
function GameAPI.get_road_resource_id(road) end

--设置模型加载范围
---@param focus_distance number # 范围
function GameAPI.set_focus_distance(focus_distance) end
