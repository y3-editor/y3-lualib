--玩家
---@class Player
---@field handle py.Role
---@field phandle py.Role
---@field id integer
---@overload fun(py_player?: py.Role): self
---@overload fun(id: py.RoleID): self
local M = Class 'Player'

M.type = 'player'

---@class Player: Storage
Extends('Player', 'Storage')
---@class Player: CustomEvent
Extends('Player', 'CustomEvent')
---@class Player: ObjectEvent
Extends('Player', 'ObjectEvent')
---@class Player: KV
Extends('Player', 'KV')

---@package
---@param key py.RoleID
---@return Player?
M.ref_manager = New 'Ref' ('Player', function (key)
    local py_player = GameAPI.get_role_by_role_id(key)
    if not py_player then
        return nil
    end
    return New 'Player' (py_player)
end)

---@param py_player py.Role
---@return self
function M:__init(py_player)
    self.handle = py_player
    self.phandle = y3.py_proxy.wrap(py_player)
    self.id     = py_player:get_role_id_num() or 0
    return self
end

function M:__tostring()
    return string.format('{player|%s|%d}'
        , self:get_name()
        , self.id
    )
end

---转换玩家ID为玩家
---@param id integer 玩家ID
---@return Player player 玩家
function M:__alloc(id)
    return M.get_by_id(id)
end

---转换玩家ID为玩家
---@param id integer 玩家ID
---@return Player player 玩家
function M.get_by_id(id)
    local player = M.ref_manager:get(id)
    return player
end

--根据字符串获取玩家，字符串是通过 `tostring(Player)`
--或是使用ECA中的“任意变量转化为字符串”获得的。
---@param str string
---@return Player?
function M.get_by_string(str)
    local id = str:match('^{player|.+|(%d+)}$')
            or str:match('<Camp.-%(%d+%),id%((%d+)%)')
            or str:match('^Player:(%d+)')
    if not id then
        return nil
    end
    return M.get_by_id(tonumber(id)--[[@as integer]])
end

y3.py_converter.register_type_alias('py.Role', 'Player')
y3.py_converter.register_py_to_lua('py.RoleID', M.get_by_id)

---@param py_player py.Role
---@return Player
function M.get_by_handle(py_player)
    local id = y3.py_proxy.wrap(py_player):get_role_id_num() or 0
    return M.get_by_id(id)
end

y3.py_converter.register_py_to_lua('py.Role', M.get_by_handle)
y3.py_converter.register_lua_to_py('py.Role', function (lua_value)
    return lua_value.handle
end)

-- 本地玩家，注意这可能会导致不同步！
---@private
M.LOCAL_PLAYER = M.get_by_handle(GameAPI.get_client_role())

function M:get_camp()
    return self.phandle:api_get_camp()
end

---布尔型玩家存档数据
---@deprecated
---@param index  integer 存档key
---@return boolean bool_value 布尔型玩家存档数据
function M:get_save_data_bool_value(index)
    return self.phandle:get_save_data_bool_value(index) or false
end

---玩家是否中途加入
---@return boolean is_middle_join 是否中途加入
function M:is_middle_join()
    return self.phandle:is_middle_join() or false
end

---玩家间是否是敌对关系
---@param player Player 玩家
---@return boolean is_enemy 是否是敌对关系
function M:is_enemy(player)
    return self.phandle:players_is_enemy(player.handle) or false
end

---设置名字
---@param name string 名字
function M:set_name(name)
    self.phandle:set_role_name(name)
end

---设置队伍ID
---@param id py.Camp
function M:set_team(id)
    self.phandle:api_set_camp(id)
end

---设置属性值
---@param key y3.Const.PlayerAttr | string 属性名
---@param value number 值
function M:set(key, value)
    key = y3.const.PlayerAttr[key] or key
    ---@cast key py.RoleResKey
    self.phandle:set_role_res(key, Fix32(value))
end

---增加属性值
---@param key y3.Const.PlayerAttr | string 属性名
---@param value number 值
function M:add(key, value)
    key = y3.const.PlayerAttr[key] or key
    ---@cast key py.RoleResKey
    self.phandle:change_role_res(key, Fix32(value))
end

---设置经验获得率
---@param rate number 经验获得率
function M:set_exp_rate(rate)
    self.phandle:set_role_exp_rate(rate)
end

---设置敌对关系
---@param player Player 玩家
---@param is_hostile boolean 是否敌视
function M:set_hostility(player, is_hostile)
    self.phandle:set_role_hostility(player.handle, is_hostile)
end

---设置群体寻路严格模式
---@param is_strict boolean 是否严格
function M:set_strict_group_navigation(is_strict)
    self.phandle:set_group_navigate_mode(is_strict)
end

---选中单位/单位组
---@param unit_or_group Unit|UnitGroup 单位/单位组
function M:select_unit(unit_or_group)
    self.phandle:role_select_unit(unit_or_group.handle)
end

---设置跟随距离
---@param distance number 距离
function M:set_follow_distance(distance)
    self.phandle:api_set_follow_distance(Fix32(distance))
end

---为玩家开/关鼠标点选
---@param is_enable boolean 是否开鼠标点选
function M:set_mouse_click_selection(is_enable)
    self.phandle:set_role_mouse_left_click(is_enable)
end

---为玩家开/关鼠标框选
---@param is_enable boolean 是否开鼠标框选
function M:set_mouse_drag_selection(is_enable)
    self.phandle:set_role_mouse_move_select(is_enable)
end

---为玩家开/关鼠标滚轮
---@param is_enable boolean 是否开鼠标滚轮
function M:set_mouse_wheel(is_enable)
    self.phandle:set_role_mouse_wheel(is_enable)
end

---玩家基础操作快捷键是否被占用
--TODO:功能键lua层表示需要处理
---@param key py.NormalKey 键名
---@param assist_key py.RecordKey 辅助键名
---@return boolean is_conf 是否被占用
function M:is_operation_key_occupied(key,assist_key)
    return self.phandle:api_is_conf_of_editable_game_func(key, assist_key) or false
end

---设置玩家的基础操作快捷键（过滤掉禁止设置的） 
--TODO:operation在lua层的表示方式待整理 方法名英文待确认
---@param operation py.EditableGameFunc 可编辑操作
---@param key py.NormalKey 功能按键
---@param assist_key py.RecordKey 辅助按键
function M:set_operation_key(operation, key, assist_key)
    self.phandle:api_set_role_editable_game_func(operation, key, assist_key)
end

---设置玩家的基础操作开关（包含所有基础操作）
--TODO:operation在lua层的表示方式待整理 方法名英文待确认
---@param operation py.AllGameFunc 可编辑操作
---@param is_enable boolean 是否开
function M:set_all_operation_key(operation, is_enable)
    self.phandle:api_set_role_all_game_func_enable(operation, is_enable)
end

---获取玩家响应键盘按键的基础操作（过滤掉禁止设置的）
---@param key py.NormalKey 键名
---@param assist_key py.RecordKey 键盘按键
---@return py.EditableGameFunc shortcut 基础操作
function M:get_operation_key(key, assist_key)
    return self.phandle:api_get_editable_game_func_of_shortcut(key, assist_key) or 0
end

---设置科技等级
---@param tech_type py.TechKey 科技等级
---@param level integer 等级
function M:set_tech_level(tech_type, level)
    self.phandle:api_set_tech_level(tech_type, level)
end

---增加科技等级
---@param tech_type py.TechKey 科技等级
---@param level integer 等级
function M:add_tech_level(tech_type, level)
    self.phandle:api_change_tech_level(tech_type, level)
end

---对玩家开放视野
---@param target_player Player 玩家
---@param share boolean
function M:share_vision_with_player(target_player, share)
    if share then
        self.phandle:share_source_player_vision_to_target(target_player.handle)
    else
        self.phandle:close_source_player_vision_to_target(target_player.handle)
    end
end

---获取单位的视野
---@param unit Unit 单位
---@param share boolean
function M:share_vision_of_unit(unit, share)
    if share then
        self.phandle:share_source_unit_vision_to_target(unit.handle)
    else
        self.phandle:close_source_unit_vision_to_target(unit.handle)
    end
end

---上传存档
function M:upload_save_data()
    self.phandle:upload_save_data()
end

---增加全局存档
---@param key string 键
---@param value integer 值
function M:add_global_save_data(key, value)
    self.phandle:add_global_map_archive_data(key, value)
end

---消耗玩家平台道具
---@param count integer 个数
---@param item_id py.StoreKey 平台道具id
function M:use_store_item(count, item_id)
    self.phandle:api_use_store_item(count, item_id)
end

---请求购买平台道具
---@param id py.StoreKey 平台道具id
function M:open_platform_shop(id)
    GameAPI.open_platform_shop(self.handle, id)
end

---玩家是否可以看到某个位置
---@param point Point 点
---@return boolean visible 点对于玩家可见
function M:is_visible(point)
    return self.phandle:is_point_visible_to_player(point.handle) or false
end

---某个位置是否处于玩家的迷雾中
---@param point Point 点
---@return boolean is_point_in_fog 点在迷雾中
function M:is_in_fog(point)
    return self.phandle:is_point_in_fog(point.handle) or false
end

---某个位置是否处于玩家的黑色阴影中
---@param point Point 点
---@return boolean is_point_in_shadow 点在黑色阴影中
function M:is_in_shadow(point)
    return self.phandle:is_point_in_shadow(point.handle) or false
end


---获取玩家属性
---@param key y3.Const.PlayerAttr | string # 属性名
---@return number role_res 玩家属性
function M:get_attr(key)
    key = y3.const.PlayerAttr[key] or key
    ---@cast key py.RoleResKey
    return y3.helper.tonumber(self.phandle:get_role_res(key)) or 0.0
end

---获取玩家ID
---@return integer role_id_num 玩家ID
function M:get_id()
    return self.id
end

---获取玩家颜色
---@return string HEX颜色
function M:get_color()
    return self.phandle:api_get_role_color() or ''
end

---获取玩家游戏状态
---@see y3.Const.RoleStatus
---@return y3.Const.RoleStatus role_status 玩家游戏状态
function M:get_state()
    return self.phandle:get_role_status() or 2
end

---获取玩家控制者类型
---@return y3.Const.RoleType role_type 玩家控制者类型
function M:get_controller()
    if not self._cotroller then
        ---@private
        self._cotroller = self.phandle:get_role_type() or 0
    end
    return self._cotroller
end

---获取玩家名字
---@return string role_name 玩家名字
function M:get_name()
    return self.phandle:get_role_name() or ''
end

---获取经验获得率
---@return number exp_rate 经验获得率
function M:get_exp_rate()
    return y3.helper.tonumber(self.phandle:get_role_exp_rate()) or 0.0
end

---获取队伍ID
---@return integer camp_id 队伍ID
function M:get_team_id()
    return self.phandle:get_camp_id_num() or 0
end

---表格型玩家存档数据
---@deprecated
---@param key integer 存档key
---@return table? table_value 表格型玩家存档数据
function M:get_save_data_table(key)
    return self.phandle:get_save_data_table_value(key)
end

---字符串型玩家存档数据
---@deprecated
---@param key integer 存档key
---@return string str_value 字符串玩家存档数据
function M:get_save_data_string(key)
    return self.phandle:get_save_data_str_value(key) or ''
end

---实数型存档数据
---@deprecated
---@param key integer 存档key
---@return number int_value 实数型存档数据
function M:get_save_data_float(key)
    return y3.helper.tonumber(self.phandle:get_save_data_fixed_value(key)) or 0.0
end

---获取整数型存档数据
---@deprecated
---@param key integer 存档key
---@return integer int_value 整数型存档数据
function M:get_save_data_int(key)
    return self.phandle:get_save_data_int_value(key) or 0
end

---获取整数存档玩家排名
---@param key integer 存档key
---@return integer rank_num 整数存档玩家排名
function M:get_rank_num(key)
    return self.phandle:get_player_archive_rank_num(key) or 0
end

---获取科技等级
---@param tech_id py.TechKey 科技id
---@return integer tech_level 科技等级
function M:get_tech_level(tech_id)
    return self.phandle:api_get_tech_level(tech_id) or 0
end

---@private
---@type string
M._platform_icon = nil

---获取玩家平台头像
---@return string icon 平台头像
function M:get_platform_icon()
    if not self._platform_icon then
        local suc, res = pcall(GameAPI.get_role_platform_icon, self.handle)
        if suc then
            self._platform_icon = res --[[@as string]]
        else
            self._platform_icon = ''
        end
    end
    return self._platform_icon
end

---获取玩家平台头像下载地址
---@return string icon_url 平台头像下载地址
function M:get_platform_icon_url()
    ---@diagnostic disable-next-line: undefined-field
    local get_url = GameAPI.get_role_platform_url
    if not get_url then
        return ''
    end
    local url = get_url(self.handle)
    return url or ''
end

--获取玩家平台唯一ID
---@return integer plat_aid 平台唯一ID
function M:get_platform_id()
    return math.tointeger(GameAPI.get_player_plat_aid(self.handle)) or 0
end

--获取玩家的此地图平台等级
---@return integer
function M:get_map_level()
    return self.phandle:get_role_plat_map_level() or 0
end

--获取玩家在本地图的平台等级排名
---@return integer
function M:get_map_level_rank()
    return self.phandle:api_get_map_level_rank() or 0
end

--获取玩家在本地图的累计局数
function M:get_played_times()
    return self.phandle:api_get_played_times() or 0
end

--获取玩家当前地图的成就点数
function M:get_achieve_point()
    return self.phandle:api_get_role_achieve_point() or 0
end

--判断指定成就是否解锁
---@param id string
---@return boolean
function M:is_achieve_unlock(id)
    return self.phandle:api_get_role_achieve_unlock(id) or false
end

---玩家平台道具数量
---@param id py.StoreKey 平台道具id
---@return integer store_item_cnt 平台道具数量
function M:get_store_item_number(id)
    return self.phandle:get_store_item_cnt(id) or 0
end

---玩家平台道具到期时间戳
---@param id py.StoreKey 平台道具id
---@return integer store_item_end_time 平台道具到期时间戳
function M:get_store_item_end_time(id)
    return self.phandle:get_store_item_expired_time(id) or 0
end

---获取玩家平台等级
---@return integer map_level 平台等级
function M:get_platform_level()
    return self.phandle:get_role_plat_map_level() or 0
end

---玩家在玩家组中
---@param player_group PlayerGroup 玩家组
---@return boolean is_in_group 玩家在玩家组中
function M:is_in_group(player_group)
    return GlobalAPI.judge_role_in_group(self.handle, player_group.handle)
end

---属于某玩家的所有单位
---@return UnitGroup unit_group 单位组
function M:get_all_units()
    local py_unit_group = self.phandle:get_all_unit_id()
    if not py_unit_group then
        return y3.unit_group.create()
    end
    return y3.unit_group.get_by_handle(py_unit_group)
end

---创建单位
---@param unit_id py.UnitKey 单位类型
---@param point? Point 单位
---@param facing? number 朝向
---@return Unit
function M:create_unit(unit_id, point, facing)
    local unit = y3.unit.create_unit(self, unit_id, point or y3.point(0.0, 0.0), facing or 0.0)
    return unit
end

---强制踢出
---@param reason string 踢出原因
function M:kick(reason)
    GameAPI.role_force_quit(self.handle, reason)
end

---设置玩家属性图标
---@param key py.RoleResKey 属性名
---@param id py.Texture 图标id
function y3.set_res_icon(key, id)
    GameAPI.change_role_res_icon_with_icon(key, id)
end

---获取玩家平台外观模型
---@return py.ModelKey model 模型id
function M:get_platform_model()
    return GameAPI.get_role_platform_model(self.handle)
end

-- 获取鼠标在游戏内的所在点。
-- 必须先设置 `y3.config.sync.mouse = true`。
---@return Point point 点
function M:get_mouse_pos()
    if not y3.config.sync.mouse then
        error('必须先设置 `y3.config.sync.mouse = true`')
    end
    local py_point = GameAPI.get_player_pointing_pos(self.handle)
    -- TODO 见问题2
    ---@diagnostic disable-next-line: param-type-mismatch
    return y3.point.get_by_handle(py_point)
end

---获取玩家鼠标屏幕坐标X的占比。
-- 必须先设置 `y3.config.sync.mouse = true`。
---@return number x_per X的占比
function M:get_mouse_ui_x_percent()
    if not y3.config.sync.mouse then
        error('必须先设置 `y3.config.sync.mouse = true`')
    end
    return y3.helper.tonumber(GameAPI.get_role_ui_x_per(self.handle)) or 0.0
end

---获取玩家鼠标屏幕坐标y的占比。
-- 必须先设置 `y3.config.sync.mouse = true`。
---@return number y_per Y的占比
function M:get_mouse_ui_y_percent()
    if not y3.config.sync.mouse then
        error('必须先设置 `y3.config.sync.mouse = true`')
    end
    return y3.helper.tonumber(GameAPI.get_role_ui_y_per(self.handle)) or 0.0
end

---获取鼠标在屏幕上的X坐标
---@return number pos_x X坐标
function M:get_mouse_pos_x()
    return GameAPI.get_player_ui_pos_x(self.handle)
end

---获取鼠标在屏幕上的y坐标
---@return number pos_y Y坐标
function M:get_mouse_pos_y()
    return GameAPI.get_player_ui_pos_y(self.handle)
end

---玩家的按键是否被按下
---@param key y3.Const.KeyboardKey | y3.Const.MouseKey 按键
---@return boolean 是否被按下
function M:is_key_pressed(key)
    if not y3.config.sync.key then
        error('必须先设置 `y3.config.sync.key = true`')
    end
    return GameAPI.player_key_is_pressed(self.handle, key)
end

---获取玩家唯一名称
---@return string name 属性名称
function M:get_platform_name()
    return self.phandle:get_role__unique_name() or ''
end

---获取玩家加密UUID
---@return string
function M:get_platform_uuid()
    ---@diagnostic disable-next-line: return-type-mismatch
    return self.phandle:get_encry_uuid()
end

---向玩家发送提示
---@param msg string 消息
---@param localize? boolean 是否支持语言环境
function M:display_info(msg, localize)
    GameAPI.show_msg_to_role(self.handle, msg, localize)
end

---获取玩家属性的货币图标
---@param key py.RoleResKey 属性名
---@return integer icon 图标id
function M.get_res_icon(key)
    return GameAPI.get_role_res_icon(key)
end

---获取玩家属性名称
---@param key py.RoleResKey 属性名
---@return string name 属性名称
function M.get_res_name(key)
    return GameAPI.get_role_res_name(key)
end

-- 设置滤镜
---@param value integer 滤镜
function M:set_color_grading(value)
    GameAPI.set_role_color_grading(self.handle, value)
end

---显示/隐藏玩家地表纹理
---@param is_visible boolean 显示/隐藏
function M:set_local_terrain_visible(is_visible)
    GameAPI.set_local_terrain_visible(self.handle, is_visible)
end

---@param player Player 玩家
---@param is_enable boolean 开关
---设置暗角开关
function M.enable_vignetting(player, is_enable)
    player.handle:set_role_vignetting_enable(is_enable)
end

---设置暗角大小
---@param size number 大小
function M:set_vignetting_size(size)
    self.phandle:set_role_vignetting_size(size)
end

---设置暗角呼吸周期
---@param circle_time number 呼吸周期
function M:set_role_vignetting_breath_rate(circle_time)
    self.phandle:set_role_vignetting_breath_rate(circle_time)
end

---设置暗角变化幅度
---@param range number 幅度
function M:set_vignetting_change_range(range)
    self.phandle:set_role_vignetting_change_range(range)
end

---设置暗角颜色
---@param red number 颜色r
---@param green number 颜色g
---@param blue number 颜色b
---@param time number 过渡时间
function M:set_vignetting_color(red, green, blue, time)
    self.phandle:set_role_vignetting_color(red, green, blue, time)
end

-- 退出游戏
function M:exit_game()
    GameAPI.exit_game(self.handle)
end

-- 获取本地玩家，注意这可能会导致不同步！  
--> 警告：如果你不确定这个函数在做什么，请不要使用它！
--
--> 已废弃：请改用 `y3.player.with_local`
---@deprecated
---@return Player
function M.get_local()
    return M.LOCAL_PLAYER
end

-- 获取所有玩家属性的属性名
---@param only_coin boolean # 只获取货币类型的玩家属性
---@return py.RoleResKey[]
function M.get_res_keys(only_coin)
    local py_list = GameAPI.iter_role_res(only_coin)
    return y3.helper.unpack_list(py_list)
end

-- 对玩家显示文本消息
---@param message string # 消息
---@param localize? boolean # 是否支持语言环境
function M:display_message(message, localize)
    GameAPI.show_msg_to_role(self.handle, message, localize or false)
end

-- 上传埋点数据
---@param key string
---@param cnt integer
function M:upload_tracking_data(key, cnt)
    GameAPI.api_upload_user_tracking_data(self.handle, key, cnt)
end

---获取玩家在社区的互动数据
---@param community_type y3.Const.PlatFormRoleCommunityType
---@return integer
function M:get_community_value(community_type)
    return self.phandle:api_get_community_value(y3.const.PlatFormRoleCommunityType[community_type] or community_type) or 0
end

---请求执行随机池掉落
---执行完毕后调用回调函数，返回的参数如下：
---* `code`: 结果代码
---  + `0`: 成功
---  + `1`: 不满足触发间隔
---  + `2`: 不满足每日限制
---  + `999`: 服务器无法连接，必须在平台上才能测试
---* `result`: 结果表，`key` 表示影响的存档编号，`value` 表示改变的值
---@param id integer # 随机池的编号
---@param callback fun(code: 0|1|2|999, result: { [integer]: integer }) # 执行完毕后的回调函数
function M:request_random_pool(id, callback)
    local response = {}
    GameAPI.lua_request_server_random_pool_result(self.handle, id, function ()
        local code = response['__random_pool_ret_code']
        local result = y3.helper.dict_to_table(response['__random_pool_result_dict'])
        xpcall(callback, log.error, code, result)
    end, response)
end

---请求使用商城道具
---执行完毕后调用回调函数，通知是否成功
---@param count integer # 使用数量
---@param item_id py.StoreKey # 商城道具id
---@param callback fun(suc: boolean) # 执行完毕后的回调函数
function M:request_use_item(count, item_id, callback)
    GameAPI.lua_request_server_role_use_item(self.handle, count, item_id, function (_, suc)
        callback(suc)
    end, {})
end

return M
