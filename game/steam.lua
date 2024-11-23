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

local function callback_with_error_code(callback, context)
    local ret = context['__error_code'] or context['__int1']
    if type(ret) == 'userdata' then
        ---@diagnostic disable-next-line: undefined-field
        ret = ret.errnu
    end
    xpcall(callback, log.error, ret == 0, ret)
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
---@param callback? fun(success: boolean, error_code?: integer)
function M.request_create_team(callback)
    local context = {}
    ---@diagnostic disable-next-line: undefined-field
    GameAPI.lua_request_create_team(function ()
        if callback then
            callback_with_error_code(callback, context)
        end
    end, context)
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

return M
