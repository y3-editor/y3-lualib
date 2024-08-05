-- 此文件由 `tools/genGameAPI` 生成，请勿手动修改。
---@meta

---@class py.Role
local Role = {}

--玩家获取玩家ID
---@return py.RoleID? # 玩家ID
function Role:api_get_role_id() end

--获取玩家所属阵营ID
---@return integer? # 玩家所属阵营ID
function Role:api_get_camp_id() end

--获取玩家ID数值
---@return integer? # 玩家ID数值
function Role:get_role_id_num() end

--获取玩家所属阵营ID数值
---@return integer? # 玩家所属阵营ID数值
function Role:get_camp_id_num() end

--获取玩家名字
---@return string? # 玩家名字
function Role:get_role_name() end

--获取玩家唯一名字
---@return string? # 玩家唯一名字
function Role:get_role__unique_name() end

--获取玩家平台等级
---@return integer? # 玩家等级
function Role:get_role_plat_map_level() end

--获取玩家控制者类型
---@return py.RoleType? # 玩家控制者类型
function Role:get_role_type() end

--玩家是否中途加入
---@return boolean? # 是否中途加入
function Role:is_middle_join() end

--获取玩家所属阵营对象
---@return py.Camp? # 阵营对象
function Role:api_get_camp() end

--玩家设置属性
---@param k string # 属性名
---@param value integer # 属性值
function Role:set_attr_val(k, value) end

--获取玩家所有单位对象
---@return py.UnitGroup? # 单位对象列表
function Role:get_all_unit_id() end

--设置玩家经验获得率
---@param rate number # 倍率
function Role:set_role_exp_rate(rate) end

--获得玩家经验倍率
---@return py.Fixed? # 返回倍率
function Role:get_role_exp_rate() end

--设置玩家出生点
---@param point py.Point # 点
function Role:set_role_spawn_point(point) end

--获取玩家出生点
---@return py.FVector3? # 返回出生点位置
function Role:get_role_spawn_point() end

--设置玩家队伍ID
---@param new_camp py.Camp # 队伍ID
function Role:api_set_camp(new_camp) end

--设置玩家名字
---@param name string # 名字
function Role:set_role_name(name) end

--修改玩家资源
---@param res_key py.RoleResKey # 资源名
---@param res_cnt py.Fixed # 资源值
function Role:change_role_res(res_key, res_cnt) end

--设置玩家资源
---@param res_key py.RoleResKey # 资源名
---@param res_cnt py.Fixed # 资源值
function Role:set_role_res(res_key, res_cnt) end

--获得玩家资源
---@param res_key py.RoleResKey # 资源名
---@return py.Fixed? # 资源值
function Role:get_role_res(res_key) end

--设置玩家群体寻路严格模式
---@param group_navigate_mode boolean # 开启群体寻路严格模式
function Role:set_group_navigate_mode(group_navigate_mode) end

--设置整数型参数到玩家存档栏位
---@param index integer # 玩家存档栏位
---@param value integer # 整型参数
function Role:set_save_data_int_value(index, value) end

--增加整数型参数到玩家存档栏位
---@param index integer # 玩家存档栏位
---@param value integer # 整型参数
function Role:add_save_data_int_value(index, value) end

--乘量实数型参数到玩家存档栏位
---@param index integer # 玩家存档栏位
---@param value py.Fixed # 实数型参数
function Role:mult_save_data_value(index, value) end

--设置实数型参数到玩家存档栏位
---@param index integer # 玩家存档栏位
---@param value py.Fixed # 实数型参数
function Role:set_save_data_fixed_value(index, value) end

--增加实数型参数到玩家存档栏位
---@param index integer # 玩家存档栏位
---@param value py.Fixed # 实数型参数
function Role:add_save_data_fixed_value(index, value) end

--设置布尔型参数到玩家存档栏位
---@param index integer # 玩家存档栏位
---@param value boolean # 布尔型参数
function Role:set_save_data_bool_value(index, value) end

--设置字符串型参数到玩家存档栏位
---@param index integer # 玩家存档栏位
---@param value string # 字符串型参数
function Role:set_save_data_str_value(index, value) end

--设置表型参数到玩家存档栏位
---@param index integer # 玩家存档栏位
---@param value py.Table # 表型参数
function Role:set_save_data_table_value(index, value) end

--set_save_table_key_value
---@param save_slot integer # 玩家存档栏位
---@param key1 string # key1
---@param value py.Actor # value
---@param key2 string # key2
---@param key3 string # key3
---@param value_convert_func string # value_convert_func
function Role:set_save_table_key_value(save_slot, key1, value, key2, key3, value_convert_func) end

--add_save_table_key_value
---@param save_slot integer # 玩家存档栏位
---@param key1 string # key1
---@param value py.Actor # value
---@param key2 string # key2
---@param key3 string # key3
function Role:add_save_table_key_value(save_slot, key1, value, key2, key3) end

--multiply_save_table_key_value
---@param save_slot integer # 玩家存档栏位
---@param key1 string # key1
---@param value py.Actor # value
---@param key2 string # key2
---@param key3 string # key3
function Role:multiply_save_table_key_value(save_slot, key1, value, key2, key3) end

--remove_save_table_key_value
---@param save_slot integer # 玩家存档栏位
---@param key1 string # key1
---@param key2 string # key2
---@param key3 string # key3
function Role:remove_save_table_key_value(save_slot, key1, key2, key3) end

--get_save_table_key_value
---@param save_slot integer # 玩家存档栏位
---@param key1 string # key1
---@param key2 string # key2
---@param key3 string # key3
---@param default_value py.Actor # value
---@param value_convert_func string # key2
function Role:get_save_table_key_value(save_slot, key1, key2, key3, default_value, value_convert_func) end

--上传玩家存档数据
---@param use_proxy? boolean # 进行代理上传
function Role:upload_save_data(use_proxy) end

--强制上传玩家非实时存档
---@param use_proxy? boolean # 进行代理上传
function Role:force_upload_save_data(use_proxy) end

--增加当前地图的指定key的存档值
---@param key string # 全局存档key值
---@param value integer # 增加的数值
function Role:add_global_map_archive_data(key, value) end

--获取玩家指定的全局存档key值对应排行榜的排名
---@param rank_key string # 全局存档key值
---@return integer? # 整型
function Role:get_player_rank_num(rank_key) end

--获取玩家指定的个人存档栏位对应排行榜的排名
---@param archive_key integer # 玩家存档栏位
---@return integer? # 整型
function Role:get_player_archive_rank_num(archive_key) end

--下载玩家存档数据
function Role:download_save_data() end

--重置下载档案数据回调
function Role:reset_download_save_data_callback() end

--读取整数型玩家存档数据
---@param index integer # 玩家存档栏位
---@return integer? # 整型
function Role:get_save_data_int_value(index) end

--读取实数型玩家存档数据
---@param index integer # 玩家存档栏位
---@return py.Fixed? # 定点数
function Role:get_save_data_fixed_value(index) end

--读取布尔型玩家存档数据
---@param index integer # 玩家存档栏位
---@return boolean? # 布尔值
function Role:get_save_data_bool_value(index) end

--读取字符串型玩家存档数据
---@param index integer # 玩家存档栏位
---@return string? # 字符串
function Role:get_save_data_str_value(index) end

--读取表型玩家存档数据
---@param index integer # 玩家存档栏位
---@return py.Table? # 表
function Role:get_save_data_table_value(index) end

--获取玩家加密uuid
function Role:get_encry_uuid() end

--玩家使用收费道具
---@param cnt integer # 数量
---@param no py.StoreKey # 收费道具KEY
function Role:api_use_store_item(cnt, no) end

--获取玩家收费道具数量
---@param no py.StoreKey # 收费道具key
---@return integer? # 收费道具数量
function Role:get_store_item_cnt(no) end

--获取平台道具到期时间戳
---@param no py.StoreKey # 收费道具key
---@return integer? # 收费道具数量
function Role:get_store_item_expired_time(no) end

--玩家是否拥有单位的可见性
---@param unit py.Unit # 单位
---@return boolean? # 是否可见
function Role:get_visibility_of_unit(unit) end

--修改玩家科技等级
---@param tech_no py.TechKey # 科技编号
---@param delta_lv integer # 变化等级
function Role:api_change_tech_level(tech_no, delta_lv) end

--修改玩家科技等级
---@param tech_no py.TechKey # 科技编号
---@param lv integer # 等级
function Role:api_set_tech_level(tech_no, lv) end

--获取玩家科技等级
---@param tech_no py.TechKey # 科技编号
---@return integer? # 科技等级
function Role:api_get_tech_level(tech_no) end

--点对于玩家是否可见
---@param point py.FPoint # 点
---@return boolean? # 布尔值
function Role:is_point_visible_to_player(point) end

--点是否在迷雾中
---@param point py.FPoint # 点
---@return boolean? # 布尔值
function Role:is_point_in_fog(point) end

--点是否在黑色阴影中
---@param point py.FPoint # 点
---@return boolean? # 布尔值
function Role:is_point_in_shadow(point) end

--获取玩家状态
---@return py.RoleStatus? # 玩家状态
function Role:get_role_status() end

--设置玩家是否是敌对关系
---@param role py.Role # 玩家
---@param is_enemy boolean # 布尔变量
function Role:set_role_hostility(role, is_enemy) end

--玩家是否是同盟关系
---@param role py.Role # 玩家
---@return boolean? # 返回值
function Role:players_is_alliance(role) end

--玩家是否是敌对关系
---@param role py.Role # 玩家
---@return boolean? # 返回值
function Role:players_is_enemy(role) end

--原始玩家对目标玩家开放视野
---@param role_2 py.Role # 玩家
---@return boolean? # 返回值
function Role:share_source_player_vision_to_target(role_2) end

--原始玩家对目标玩家关闭视野
---@param role_2 py.Role # 玩家
---@return boolean? # 返回值
function Role:close_source_player_vision_to_target(role_2) end

--原始单位对目标玩家开放视野
---@param unit py.Unit # 单位
---@return boolean? # 返回值
function Role:share_source_unit_vision_to_target(unit) end

--原始单位对目标玩家关闭视野
---@param unit py.Unit # 单位
---@return boolean? # 返回值
function Role:close_source_unit_vision_to_target(unit) end

--选中单位或单位组
---@param unit_or_unit_groupd py.DynamicTypeMeta # 单位或单位组
function Role:role_select_unit(unit_or_unit_groupd) end

--开/关玩家鼠标的点选
---@param value boolean # 开/关
function Role:set_role_mouse_left_click(value) end

--开/关玩家的鼠标的框选
---@param value boolean # 开/关
function Role:set_role_mouse_move_select(value) end

--开/关玩家的鼠标滚轮
---@param value boolean # 开/关
function Role:set_role_mouse_wheel(value) end

--设置玩家暗角开关
---@param value boolean # 暗角开关
function Role:set_role_vignetting_enable(value) end

--设置玩家暗角大小
---@param value number # 暗角大小
function Role:set_role_vignetting_size(value) end

--设置玩家暗角呼吸周期
---@param value number # 呼吸周期
function Role:set_role_vignetting_breath_rate(value) end

--设置玩家暗角变化幅度
---@param value number # 变化幅度
function Role:set_role_vignetting_change_range(value) end

--设置玩家暗角颜色
---@param r number # R
---@param g number # G
---@param b number # B
---@param interval? number # Interval
function Role:set_role_vignetting_color(r, g, b, interval) end

--设置玩家暗角颜色(HEX)
---@param color string # hex
---@param interval? number # Interval
function Role:set_role_vignetting_color_hex(color, interval) end

--设置玩家的基础操作快捷键（过滤掉禁止修改的）
---@param game_func_id py.EditableGameFunc # 可编辑操作
---@param normal_key py.NormalKey # 功能键
---@param record_key py.RecordKey # 辅助键
function Role:api_set_role_editable_game_func(game_func_id, normal_key, record_key) end

--设置玩家的基础操作开关（包含所有基础操作）
---@param game_func_id py.AllGameFunc # 所有操作
---@param is_enable boolean # 开/关
function Role:api_set_role_all_game_func_enable(game_func_id, is_enable) end

--基础操作响应的快捷键是否已被占用（过滤掉禁止修改的）
---@param normal_key py.NormalKey # 功能键
---@param record_key py.RecordKey # 辅助键
---@return boolean? # 是否
function Role:api_is_conf_of_editable_game_func(normal_key, record_key) end

--获取玩家响应键盘按键的基础操作（过滤掉禁止修改的）
---@param normal_key py.NormalKey # 功能键
---@param record_key py.RecordKey # 辅助
---@return py.EditableGameFunc? # 可修改基础操作
function Role:api_get_editable_game_func_of_shortcut(normal_key, record_key) end

--设置玩家布尔埋点数据
---@param key integer # 布尔key
---@param value boolean # 布尔值
function Role:set_bool_hit_point_data(key, value) end

--设置玩家整型埋点数据
---@param key integer # 整型key
---@param value integer # 整数
function Role:set_int_hit_point_data(key, value) end

--设置跟随距离
---@param follow_distance py.Fixed # 跟随距离
function Role:api_set_follow_distance(follow_distance) end

--设置玩家的鼠标样式
---@param cur_state_key py.CursorState # 鼠标状态
---@param cur_key py.CursorKey # 鼠标key
function Role:api_set_role_cursor(cur_state_key, cur_key) end

--设置玩家的技能指示器特效
---@param skill_indicator_key integer # 指示器特效枚举
---@param effect_key py.SfxKey # 特效key
function Role:api_set_role_skill_indicator(skill_indicator_key, effect_key) end

--获取玩家颜色
---@return string? # 颜色
function Role:api_get_role_color() end

--上报玩家排名
---@param rank integer # 本局游戏排名
function Role:upload_player_game_rank(rank) end

--获取玩家当前选中单位组
---@return py.UnitGroup? # 单位组
function Role:api_get_role_select_units() end

--玩家是否为平台荣耀会员
---@return boolean? # 是否是会员
function Role:api_is_honor_vip() end

--玩家是否为当前作者
---@return boolean? # 是否是作者
function Role:api_is_cur_map_author() end

--获取玩家装备装饰类型的ID
---@param plat_deco_type py.PlatformDecoType # 平台装饰类型
---@return integer? # 装饰ID
function Role:api_get_equip_deco_id(plat_deco_type) end

--获取玩家在本地图的等级
---@return integer? # 地图等级
function Role:api_get_map_level() end

--获取玩家在本地图的累计局数
---@return integer? # 局数
function Role:api_get_played_times() end

--玩家在本地图的平台等级排名
---@return integer? # 排名
function Role:api_get_map_level_rank() end

--玩家签到天数
---@param signin_type py.PlatformSigninType # 签到天数类型
---@return integer? # 签到天数
function Role:api_get_sign_in_days_of_platform(signin_type) end

--玩家在社区的互动
---@param community_type py.PlatformCommunityType # 平台社区类型
---@return integer? # 个数
function Role:api_get_community_value(community_type) end

--玩家是否是当前地图的回流用户
---@return boolean? # 是否回流用户
function Role:api_is_returning_player() end

--玩家是否收藏当前地图
---@return boolean? # 是否收藏当前地图
function Role:api_is_bookmark_current_map() end

--获取玩家当前赛季天梯的排位积分
---@param ladder_key string # 天梯key
---@return integer? # 积分
function Role:api_get_ladder_rank_points(ladder_key) end

--获取玩家当前赛季天梯编号
---@param ladder_key string # 天梯key
---@return integer? # 赛季编号
function Role:api_get_current_season_id(ladder_key) end

--获取玩家当前赛季天梯排名
---@param ladder_key string # 天梯key
---@return integer? # 当前赛季排名
function Role:api_get_current_season_standing(ladder_key) end

--获取玩家当前赛天梯排名次数
---@param ladder_key string # 天梯key
---@param rank_number integer # 第几名
---@return integer? # 排名次数
function Role:api_get_current_season_standing_number(ladder_key, rank_number) end

--获取玩家该地图累计充值
---@return py.Fixed? # 累计充值
function Role:api_get_role_total_consume() end

--获取玩家是否打赏该地图
---@return boolean? # 是否打赏该地图
function Role:api_get_role_is_donated() end

--获取玩家商城登录用token
---@return string? # 商城token
function Role:api_get_role_store_params() end

--获取玩家当前地图的成就点数
---@return boolean? # 成就点数
function Role:api_get_role_achieve_point() end

--获取玩家当前地图成就是否解锁
---@param achieve_id string # 成就ID
---@return boolean? # 是否解锁
function Role:api_get_role_achieve_unlock(achieve_id) end

--宠物http请求调用
---@param api string # 请求的api方法名
---@param is_post boolean # api是否为post方法
---@param body string # 请求的body
---@param timeout? integer # 超时时间
---@param callback? function # 回调函数
function Role:pet_http_request(api, is_post, body, timeout, callback) end

--请求创建私有副本
---@param level_id py.Map # 关卡id
---@param game_mode py.GameMode # 游戏模式
---@param max_player? integer # 最大人数
function Role:request_create_private_dungeon(level_id, game_mode, max_player) end

--请求加入私有副本
---@param token string # 房间口令
function Role:request_join_private_dungeon(token) end

--请求加入公有副本
---@param level_id py.Map # 关卡id
---@param game_mode py.GameMode # 游戏模式
function Role:request_join_public_dungeon(level_id, game_mode) end
