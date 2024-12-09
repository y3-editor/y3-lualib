---所有的接口均为异步
---@class Steam
local M = {}

---【异步】获取本地玩家在组队系统中的队伍id。如果不在队伍中则返回 `0`。
---@return integer
function M.get_team_id()
    return GameAPI.steam_get_team_id() or 0
end

---【异步】获取本地玩家的玩家aid。
---@return integer
function M.get_player_aid()
    return GameAPI.steam_get_player_id() or 0
end

---【异步】获取本地玩家的头像资源url
---@return string
function M.get_avatar_url()
    return GameAPI.steam_get_player_head_icon_url() or ''
end

---【异步】请求开始匹配
---@param score integer # 匹配分数
---@param level_id string # 目标地图id
---@param game_mode? integer # 目标地图模式
function M.start_match(score, level_id, game_mode)
    GameAPI.steam_start_match(score, level_id, game_mode or 1002)
end

---【异步】请求取消匹配
function M.cancel_match()
    GameAPI.steam_cancel_match()
end

---@alias Steam.TeamState
---| 1 # 空闲
---| 2 # 匹配中

---【异步】获取当前队伍的状态
---@return Steam.TeamState state
function M.get_team_state()
    return GameAPI.steam_get_team_state()
end

---【异步】获取本地玩家的状态
---@return y3.Const.SteamOnlineState state
function M.get_player_state()
    return GameAPI.steam_get_player_state() --[[@as y3.Const.SteamOnlineState]]
end

---【异步】获取本地玩家的昵称
---@return string
function M.get_nickname()
    return GameAPI.steam_get_player_nickname() or ''
end

---获取玩家的商店物品
---@param player Player
---@return {
--- item_id: integer,
--- group_name: string,
--- second_name: string,
--- nickname: string,
---}[]
function M.get_player_store_items(player)
    return GameAPI.steam_get_player_storm_items(player.handle)
end

---【异步】设置全局存档值
---@param key string
---@param value string|integer
function M.set_global_archive_data(key, value)
    ---@diagnostic disable-next-line: param-type-mismatch
    GameAPI.set_steam_global_archive_data(key, value)
end

---【异步】增加全局存档值
---@param key string
---@param value integer
function M.add_global_archive_data(key, value)
    GameAPI.add_steam_global_archive_data(key, value)
end

---@alias Steam.FriendState.ShowState
---| 1 # 在线
---| 2 # 忙碌
---| 3 # 隐身

---@alias Steam.FriendState {
--- group_id: integer,
--- group_name: string,
--- second_name: string,
--- nickname: string,
--- head_icon: string,
--- online: y3.Const.SteamOnlineState,
--- level: integer,
--- aid: integer,
--- show_state: Steam.FriendState.ShowState,
--- state: any,
---}

---【异步】请求自己的好友列表
---@param callback fun(friends: Steam.FriendState[])
function M.request_friends(callback)
    local context = {}
    ---@diagnostic disable-next-line: undefined-field
    GameAPI.lua_request_mall_friends(function ()
        xpcall(callback, log.error, context['__lua_table'])
    end, context)
end

local function callback_with_error_code(callback, context, ...)
    local ret = context['__error_code'] or context['__int1']
    if type(ret) == 'userdata' then
        ---@diagnostic disable-next-line: undefined-field
        ret = ret.errnu
    end
    local result = ...
    if select('#', ...) == 0 then
        result = ret == 0
    end
    xpcall(callback, log.error, result, ret)
end

---【异步】请求添加好友
---@param aid integer # 对方的aid
---@param callback? fun(success: boolean, error_code?: integer)
function M.request_add_friend(aid, callback)
    local context = {}
    ---@diagnostic disable-next-line: undefined-field
    GameAPI.lua_request_mall_add_friend(aid, function ()
        if callback then
            callback_with_error_code(callback, context)
        end
    end, context)
end

---【异步】请求删除好友
---@param aid integer # 对方的aid
---@param callback? fun(success: boolean, error_code?: integer)
function M.request_delete_friend(aid, callback)
    local context = {}
    ---@diagnostic disable-next-line: undefined-field
    GameAPI.lua_request_delete_friend(aid, function ()
        if callback then
            callback_with_error_code(callback, context)
        end
    end, context)
end

---【异步】回复好友请求
---@param aid integer # 对方的aid
---@param accept boolean # 是否接受
---@param callback? fun(success: boolean, error_code?: integer)
function M.reply_friend_add(aid, accept, callback)
    local context = {}
    ---@diagnostic disable-next-line: undefined-field
    GameAPI.lua_request_reply_friend_add(aid, accept, function ()
        if callback then
            callback_with_error_code(callback, context)
        end
    end, context)
end

---【异步】请求开始游戏（不匹配），只有队长可以调用
---@param callback? fun(success?: boolean, error_code?: integer)
function M.request_start_game(callback)
    local context = {}
    ---@diagnostic disable-next-line: undefined-field
    GameAPI.lua_request_steam_start_game(function ()
        if callback then
            callback_with_error_code(callback, context)
        end
    end, context)
end

---【异步】请求加入队伍
---@param team_id integer # 队伍id
---@param callback? fun(success: boolean, error_code?: integer)
function M.request_join_team(team_id, callback)
    local context = {}
    ---@diagnostic disable-next-line: undefined-field
    GameAPI.lua_request_join_team_by_team_id(team_id, function ()
        if callback then
            callback_with_error_code(callback, context)
        end
    end, context)
end

---【异步】请求加入队伍
---@param name string # 对方的玩家名字
---@param callback? fun(success: boolean, error_code?: integer)
function M.request_join_team_by_name(name, callback)
    local context = {}
    ---@diagnostic disable-next-line: undefined-field
    GameAPI.lua_request_join_team(name, function ()
        if callback then
            callback_with_error_code(callback, context)
        end
    end, context)
end

---【异步】邀请玩家加入队伍
---@param aid integer # 对方的aid
---@param callback? fun(success: boolean, error_code?: integer)
function M.request_invite_join_team(aid, callback)
    local context = {}
    ---@diagnostic disable-next-line: undefined-field
    GameAPI.lua_request_invite_join_team(aid, function ()
        if callback then
            callback_with_error_code(callback, context)
        end
    end, context)
end

---【异步】回复队伍邀请
---@param aid integer # 对方的aid
---@param team_id integer # 队伍id
---@param accept boolean # 是否接受
---@param callback? fun(success: boolean, error_code?: integer)
function M.reply_team_invite(aid, team_id, accept, callback)
    local context = {}
    ---@diagnostic disable-next-line: undefined-field
    GameAPI.lua_request_team_invite(aid, team_id, accept, function ()
        if callback then
            callback_with_error_code(callback, context)
        end
    end, context)
end

---【异步】请求退出队伍
---@param callback? fun(success: boolean, error_code?: integer)
function M.request_quit_team(callback)
    local context = {}
    ---@diagnostic disable-next-line: undefined-field
    GameAPI.lua_request_quit_team(function ()
        if callback then
            callback_with_error_code(callback, context)
        end
    end, context)
end

---@alias Steam.MemberInfo {
--- account_id: integer,
--- level: integer,
--- nickname: string,
--- head_icon: string,
--- state: y3.Const.SteamOnlineState,
--- show_state: Steam.FriendState.ShowState,
--- online: y3.Const.SteamOnlineState,
--- team_id: integer,
--- is_captain: boolean,
---}

---【异步】请求指定玩家的队伍信息
---@param aid integer # 对方的aid
---@param callback fun(team_info?: Steam.MemberInfo[], error_code?: integer)
function M.request_team_info(aid, callback)
    local context = {}
    ---@diagnostic disable-next-line: undefined-field
    GameAPI.lua_request_mall_team_info_by_adi(aid, function ()
        xpcall(callback, log.error, context['__lua_table'], context['__error_code'])
    end, context)
end

---【异步】转交队长，只有队长可以调用
---@param aid integer # 对方的aid
---@param callback? fun(success: boolean, error_code?: integer)
function M.request_transfer_captain(aid, callback)
    local context = {}
    ---@diagnostic disable-next-line: undefined-field
    GameAPI.lua_request_transform_team_leader(aid, function ()
        if callback then
            callback_with_error_code(callback, context)
        end
    end, context)
end

---【异步】请求从队伍中踢出玩家，只有队长可以调用
---@param aid integer # 对方的aid
---@param callback? fun(success: boolean, error_code?: integer)
function M.request_kick_member(aid, callback)
    local context = {}
    ---@diagnostic disable-next-line: undefined-field
    GameAPI.lua_request_kick_from_team(aid, function ()
        if callback then
            callback_with_error_code(callback, context)
        end
    end, context)
end

---【异步】根据玩家昵称查询玩家的aid
---@param nickname string # 玩家昵称
---@param callback fun(aid?: integer, error_code?: integer)
function M.request_aid_by_nickname(nickname, callback)
    local context = {}
    ---@diagnostic disable-next-line: undefined-field
    GameAPI.lua_request_mall_player_adi_by_nickname(nickname, function ()
        xpcall(callback, log.error, context['__int1'], context['__error_code'])
    end, context)
end

---【异步】请求创建队伍
---@param team_num integer # 人数上限
---@param callback? fun(success: boolean, error_code?: integer)
function M.request_create_team(team_num, callback)
    local context = {}
    ---@diagnostic disable-next-line: undefined-field
    GameAPI.lua_request_create_team(function ()
        if callback then
            callback_with_error_code(callback, context)
        end
    end, context, team_num)
end

---【异步】请求开始匹配
---@param score integer # 匹配分数
---@param level_id string # 目标地图id
---@param game_mode? integer # 目标地图模式
---@param callback? fun(success?: boolean, error_code?: integer)
function M.request_start_match(score, level_id, game_mode, callback)
    local context = {}
    ---@diagnostic disable-next-line: undefined-field
    GameAPI.lua_request_start_match(score, level_id, game_mode or 1002, function ()
        if callback then
            callback_with_error_code(callback, context)
        end
    end, context)
end

---【异步】请求取消匹配
---@param callback? fun(success: boolean, error_code?: integer)
function M.request_cancel_match(callback)
    local context = {}
    ---@diagnostic disable-next-line: undefined-field
    GameAPI.lua_request_cancel_match(function ()
        if callback then
            callback_with_error_code(callback, context)
        end
    end, context)
end

---【异步】请求全局存档数据
---@param callback fun(data: (string | integer)[], error_code?: integer)
function M.request_global_archive_datas(callback)
    ---@diagnostic disable-next-line: undefined-field
    GameAPI.lua_request_mall_global_archive(function (context)
        local data = context['__lua_table']
        callback_with_error_code(callback, context, data)
    end, {})
end

---【异步】请求头像的文件路径
---@param url string # 头像的网络地址
---@param callback fun(path: string) # 图像下载完毕后回调，参数为下载后的文件路径
function M.request_icon(url, callback)
    ---@diagnostic disable-next-line: undefined-field
    GameAPI.lua_request_team_icon(url, function (context)
        xpcall(callback, log.error, context['__IMAGE_KEY__'])
    end, {})
end

---【异步】请求结算天梯分
---@param player Player
---@param params table<string, any> # 结算参数
---@param callback? fun(result: {
--- id: integer,
--- new_score: integer,
--- delta_score: integer,
---})
function M.request_roll_settle_ladder_score(player, params, callback)
    ---@diagnostic disable-next-line: undefined-field
    GameAPI.lua_request_roll_settle_ladder_score(player.handle, params, function (context)
        if callback then
            xpcall(callback, log.error, {
                id = context['__settle_role_id'],
                new_score = context['__new_value'],
                delta_score = context['__diff_value'],
            })
        end
    end, {})
end

---【异步】请求创建房间
---@param room_name string # 房间名称
---@param callback fun(room_id?: integer, error_code?: integer) # 创建成功后回调，参数为房间id
---@param mode_id? integer # 模式id，默认为 `1002`
---@param password? string # 房间密码，`nil` 或空字符串等表示无需密码
function M.request_create_room(room_name, callback, mode_id, password)
    ---@diagnostic disable-next-line: undefined-field
    GameAPI.lua_request_server_create_room(room_name, function (context)
        local room_id = context['__room_id']
        callback_with_error_code(callback, context, room_id)
    end, {}, mode_id, password)
end

---@class Steam.Room
---@field room_id integer
---@field room_name string
---@field curr_player_number integer
---@field max_player_number integer
---@field is_public boolean # 非公开房加入需要密码
---@field room_state y3.Const.SteamRoomState
---@field rooms_total_num integer

---【异步】请求房间列表
---@param page integer # 第几页，每页会有最多100个结果
---@param callback fun(rooms?: Steam.Room[], error_code?: integer)
function M.request_room_list(page, callback)
    ---@diagnostic disable-next-line: undefined-field
    GameAPI.lua_request_server_room_list_info(function (context)
        local rooms = context['__lua_table']
        callback_with_error_code(callback, context, rooms)
    end, {}, page)
end

---【异步】请求加入房间
---@param room_id integer
---@param callback fun(success: boolean, error_code?: integer)
---@param password? string
function M.request_join_room(room_id, callback, password)
    ---@diagnostic disable-next-line: undefined-field
    GameAPI.lua_request_server_join_room(room_id, function (context)
        callback_with_error_code(callback, context)
    end, {}, password)
end

---@class RoomSlot
---@field slot integer
---@field nickname string
---@field head_icon string
---@field locked boolean
---@field ai_type 5 | 6
---@field state y3.Const.SteamRoomSlotState
---@field is_ready any
---@field is_owner boolean
---@field aid integer

---【异步】请求指定用户所在的房间信息
---@param aid integer
---@param callback fun(room?: RoomSlot[], error_code?: integer)
function M.request_room_info(aid, callback)
    ---@diagnostic disable-next-line: undefined-field
    GameAPI.lua_request_server_room_info(aid, function (context)
        local rooms = context['__lua_table']
        if rooms then
            for _, room in ipairs(rooms) do
                if room.locked then
                    room.state = y3.const.SteamRoomSlotState['关闭']
                else
                    if room.ai_type == 5 then
                        room.state = y3.const.SteamRoomSlotState['简单电脑']
                    elseif room.ai_type == 6 then
                        room.state = y3.const.SteamRoomSlotState['困难电脑']
                    else
                        room.state = y3.const.SteamRoomSlotState['打开']
                    end
                end
            end
        end
        callback_with_error_code(callback, context, rooms)
    end, {})
end

---【异步】请求房间开始游戏
---@param callback fun(success: boolean, error_code?: integer)
function M.request_room_start_game(callback)
    ---@diagnostic disable-next-line: undefined-field
    GameAPI.lua_request_server_room_strat_game(function (context)
        callback_with_error_code(callback, context)
    end, {})
end

---【异步】邀请玩家加入房间
---@param aid integer
---@param callback fun(success: boolean, error_code?: integer)
function M.request_invite_join_room(aid, callback)
    ---@diagnostic disable-next-line: undefined-field
    GameAPI.lua_request_server_invite_player_join_room(aid, function (context)
        callback_with_error_code(callback, context)
    end, {})
end

---【异步】接受房间邀请
---@param aid integer
---@param room_id integer
---@param callback fun(success: boolean, error_code?: integer)
function M.reply_accpet_room_invite(aid, room_id, callback)
    ---@diagnostic disable-next-line: undefined-field
    GameAPI.lua_request_server_reply_room_invite(aid, room_id, function (context)
        callback_with_error_code(callback, context)
    end, {})
end

---【异步】请求交换房间槽位
---@param slot integer # 目标槽位
---@param callback fun(success: boolean, error_code?: integer)
function M.request_change_room_slot(slot, callback)
    ---@diagnostic disable-next-line: undefined-field
    GameAPI.lua_request_server_change_room_slot(slot, function (context)
        callback_with_error_code(callback, context)
    end, {})
end

---【异步】请求将房主转交给其他用户
---@param aid integer # 目标用户的aid
---@param callback fun(success: boolean, error_code?: integer)
function M.request_change_owner(aid, callback)
    ---@diagnostic disable-next-line: undefined-field
    GameAPI.lua_request_server_change_owner(aid, function (context)
        callback_with_error_code(callback, context)
    end, {})
end

---【异步】请求退出自己所在的房间
---@param callback fun(success: boolean, error_code?: integer)
function M.request_exit_room(callback)
    local aid = M.get_player_aid()
    ---@diagnostic disable-next-line: undefined-field
    GameAPI.lua_request_server_exit_room(aid, function (context)
        callback_with_error_code(callback, context)
    end, {})
end

---【异步】请求从房间中踢出用户
---@param aid integer # 目标用户的aid
---@param callback fun(success: boolean, error_code?: integer)
function M.request_kick_from_room(aid, callback)
    ---@diagnostic disable-next-line: undefined-field
    GameAPI.lua_request_server_kick_from_room(aid, function (context)
        callback_with_error_code(callback, context)
    end, {})
end

---【异步】请求修改房间中某个槽位的状态
---@param slot integer # 目标槽位
---@param state y3.Const.SteamRoomSlotState # 目标状态
---@param callback fun(success: boolean, error_code?: integer)
function M.request_change_slot_state(slot, state, callback)
    ---@diagnostic disable-next-line: undefined-field
    GameAPI.lua_request_server_set_site_state(slot, state, function (context)
        callback_with_error_code(callback, context)
    end, {})
end

---【异步】请求修改房间密码
---@param password? string # 房间密码，`nil` 或空字符串等表示无需密码
---@param callback fun(success: boolean, error_code?: integer)
function M.request_change_room_password(password, callback)
    ---@diagnostic disable-next-line: undefined-field
    GameAPI.lua_request_server_change_room_password(password or '', function (context)
        callback_with_error_code(callback, context)
    end, {})
end

return M
