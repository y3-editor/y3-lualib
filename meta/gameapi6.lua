-- 此文件由 `tools/genGameAPI` 生成，请勿手动修改。
---@meta

---@class py.GameAPI
GameAPI = {}

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

--创建场景点并绑定UI到单位
---@param comp_name string # 控件名
---@param player py.Role # 玩家
---@param unit py.Unit # 单位
---@param socket_name string # 挂接点
---@param socket_offset_follow_model_scale boolean # 挂接点偏移跟随模型缩放
---@param visible_dis? number # 可见距离
---@return py.SceneNode # 场景点
function GameAPI.create_scene_node_on_unit_ex(comp_name, player, unit, socket_name, socket_offset_follow_model_scale, visible_dis) end

--创建场景点并绑定UI到三维坐标
---@param comp_name string # 控件名
---@param position py.Vector3 # 三维坐标
---@param visible_dis? number # 可见距离
---@return py.SceneNode # 场景点
function GameAPI.create_scene_node_on_3d(comp_name, position, visible_dis) end

--创建场景界面到刚体
---@param comp_name string # 控件名
---@param body py.RigidBody # 刚体
---@param offset py.Vector3 # 偏移量
---@param visible_dis? number # 可见距离
---@return py.SceneNode # 场景点
function GameAPI.create_scene_node_on_rigid_body(comp_name, body, offset, visible_dis) end

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

--live2d类型转字符串
---@param val py.Live2dKey # live2d编号
---@return string # 字符串
function GameAPI.live2d_key_to_str(val) end

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

--设置血条图片
---@param unit py.Unit # 单位
---@param node_name string # 血条命名
---@param image_id py.Texture # 图片
---@param role? py.Role # 玩家
function GameAPI.set_billboard_picture(unit, node_name, image_id, role) end

--设置血条文本
---@param unit py.Unit # 单位
---@param node_name string # 血条命名
---@param text string # 文本
---@param role? py.Role # 玩家
---@param font? string # 字体
function GameAPI.set_billboard_text(unit, node_name, text, role, font) end

--设置血条可见性
---@param unit py.Unit # 单位
---@param node_name string # 血条命名
---@param visible boolean # 可见性
---@param role? py.Role # 玩家
function GameAPI.set_billboard_visible(unit, node_name, visible, role) end

--设置血条进度
---@param unit py.Unit # 单位
---@param node_name string # 血条命名
---@param progress number # 进度
---@param role? py.Role # 玩家
function GameAPI.set_billboard_progress(unit, node_name, progress, role) end

--设置血条整体可见性
---@param unit py.Unit # 单位
---@param visibility boolean # 可见性
---@param role? py.Role # 玩家
function GameAPI.set_billboard_overall_visibility(unit, visibility, role) end

--设置血条中进度条控件的进度条图片
---@param unit py.Unit # 单位
---@param node_name string # 血条命名
---@param icon_id py.Texture # 图片
---@param role? py.Role # 玩家
function GameAPI.set_billboard_picture_group(unit, node_name, icon_id, role) end

--玩家完全退出游戏（大厅完全退出游戏）
---@param role py.Role # 玩家
function GameAPI.lobby_exit_game(role) end

--请求购买平台道具
---@param role py.Role # 玩家
---@param store_key py.StoreKey # 平台道具类型
function GameAPI.open_platform_shop(role, store_key) end

--获取本地玩家镜头焦点
---@return py.FVector3 # 镜头焦点
function GameAPI.get_local_player_camera_focus() end

--平台道具是否相等
---@param store_key1 py.StoreKey # 平台道具
---@param store_key2 py.StoreKey # 平台道具
---@return boolean # 是否相等
function GameAPI.api_compare_store_key(store_key1, store_key2) end

--世界坐标转换屏幕坐标
---@param world_pos py.Point # 世界坐标
---@return py.Point # 屏幕坐标
function GameAPI.api_world_pos_to_camera_pos_2d(world_pos) end

--世界坐标转换屏幕边缘坐标
---@param world_pos py.Point # 世界坐标
---@param delta_dis py.Fixed # 定点数
---@return py.Point # 屏幕坐标
function GameAPI.api_world_pos_to_screen_edge_pos_2d(world_pos, delta_dis) end

--平台外部服务器设置接口
---@param aes_key string # AESKey
---@param public_key string # PublicKey
---@param external_url string # ExternalUrl
function GameAPI.init_external_http_config(aes_key, public_key, external_url) end

--平台外部连接登录
---@param api_path string # 外部API路径
---@param external_data string # 自定义数据
---@return boolean # 调用结果
function GameAPI.platform_http_login(api_path, external_data) end

--平台外部http请求
---@param api string # 外部API路径
---@param is_post boolean # 是否是post请求
---@param data string # body数据
---@param disable_in_connect? boolean # 是否禁用在connect中
---@return string # 调用结果
function GameAPI.platform_http_request(api, is_post, data, disable_in_connect) end

--上传反作弊数值统计
---@param role py.Role # 玩家
---@param args py.List # 自定义参数
---@return string # 玩家全量昵称
function GameAPI.save_anticheat_data(role, args) end

--剔除字符串内富文本信息
---@param rich_text string # 富文本
---@return string # 普通文本
function GameAPI.get_plain_text_from_rich_text(rich_text) end

--点是否在范围内
---@param check_point py.Point # 待检查的点
---@param center_point py.Point # 中心点
---@param shape py.Shape # 范围
---@return boolean # 布尔值
function GameAPI.api_is_point_in_shape(check_point, center_point, shape) end
