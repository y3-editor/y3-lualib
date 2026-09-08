local lobby = require 'y3.game.lobby'
local state = require 'y3.game.lobby.state'
local result = require 'y3.game.lobby.result'

local M = {}
local completion_listener
local status_listener

M.EVENT_NAME = '大厅服务请求完成'
M.EVENT_PARAM_NAME = '回调数据'
M.STATUS_EVENT_NAME = '大厅服务状态变化'
M.STATUS_EVENT_PARAM_NAME = '事件数据'

local function has_completion_event()
    if y3.eca and y3.eca.has_custom_event and y3.eca.has_custom_event(M.EVENT_NAME) then
        return true
    end
    local names = y3.const and y3.const.CustomEventName
    return names and names[M.EVENT_NAME] ~= nil and names[M.EVENT_NAME] ~= 0
end

local function emit(payload)
    if y3.eca and y3.eca.call then
        local ok = pcall(y3.eca.call, M.EVENT_NAME, payload)
        if ok then
            return true
        end
    end
    local event_id = y3.const and y3.const.CustomEventName and y3.const.CustomEventName[M.EVENT_NAME]
    if event_id and event_id ~= 0 and y3.game and y3.game.send_custom_event then
        local ok, err = pcall(y3.game.send_custom_event, event_id, {
            [M.EVENT_PARAM_NAME] = payload,
        })
        if ok then
            return true
        end
        return false, tostring(err)
    end
    return false, '完成事件不存在'
end

local function has_status_event()
    if y3.eca and y3.eca.has_custom_event and y3.eca.has_custom_event(M.STATUS_EVENT_NAME) then
        return true
    end
    local names = y3.const and y3.const.CustomEventName
    return names and names[M.STATUS_EVENT_NAME] ~= nil and names[M.STATUS_EVENT_NAME] ~= 0
end

local function emit_status(payload)
    if not has_status_event() then
        return true
    end
    if y3.eca and y3.eca.call then
        local ok = pcall(y3.eca.call, M.STATUS_EVENT_NAME, payload)
        if ok then
            return true
        end
    end
    local event_id = y3.const and y3.const.CustomEventName and y3.const.CustomEventName[M.STATUS_EVENT_NAME]
    if event_id and event_id ~= 0 and y3.game and y3.game.send_custom_event then
        local ok, err = pcall(y3.game.send_custom_event, event_id, {
            [M.STATUS_EVENT_PARAM_NAME] = payload,
        })
        if ok then
            return true
        end
        return false, tostring(err)
    end
    return false, '状态事件不存在'
end

local SYNC_ACTIONS = {
    ['获取连接状态'] = true,
    ['获取队伍成员'] = true,
    ['获取队伍成员项'] = true,
    ['获取聊天记录'] = true,
    ['获取聊天消息'] = true,
    ['获取口令'] = true,
    ['获取状态快照'] = true,
}

local REQUEST_ONLY_ACTIONS = {
    ['加入口令'] = true,
    ['返回大厅'] = true,
}

local ROUTE_AWARE_ACTIONS = {
    ['局内私人副本'] = lobby._private_dungeon_completion_mode_for_eca,
}

local function is_valid_game_play_id(value)
    if type(value) ~= 'number' then
        return false
    end
    local ok, integer = pcall(math.tointeger, value)
    return ok and integer ~= nil and integer > 0
end

local function call_for_eca(action, fn, ...)
    local args = table.pack(...)
    local invalid_connect = action == '建立连接' and not is_valid_game_play_id(args[1])
    local completion_mode = nil
    if ROUTE_AWARE_ACTIONS[action] then
        completion_mode = ROUTE_AWARE_ACTIONS[action](table.unpack(args, 1, args.n))
    end
    local request_only = REQUEST_ONLY_ACTIONS[action] or completion_mode == 'request_only'
    if not invalid_connect and not SYNC_ACTIONS[action] and not request_only and not has_completion_event() then
        return result.rejected(action, 'event_missing', '请先在主关卡创建自定义事件：大厅服务请求完成，参数：回调数据')
    end
    local previous_origin = state.runtime.current_call_origin
    state.runtime.current_call_origin = 'eca'
    local ok, call_result = xpcall(function()
        return fn(table.unpack(args, 1, args.n))
    end, function(err)
        return tostring(err)
    end)
    state.runtime.current_call_origin = previous_origin
    if not ok then
        return result.rejected(action, 'request_error', call_result)
    end
    return call_result
end

local DEFINITIONS = {
    { '大厅服务 - 建立连接', '建立连接', lobby.connect, { { '玩法ID', 'integer' }, { '是否在游戏关卡', 'boolean?' } } },
    { '大厅服务 - 获取连接状态', '获取连接状态', lobby.get_connection_status },
    { '大厅服务 - 设置匹配分数', '设置匹配分数', lobby.set_score, { { '分数', 'integer' } } },
    { '大厅服务 - 创建队伍', '创建队伍', lobby.create_team, { { '人数上限', 'integer' } } },
    { '大厅服务 - 加入队伍', '加入队伍', lobby.join_team, { { '队伍编号', 'integer' } } },
    { '大厅服务 - 离开队伍', '离开队伍', lobby.leave_team },
    { '大厅服务 - 解散队伍', '解散队伍', lobby.dismiss_team },
    { '大厅服务 - 转移队长', '转移队长', lobby.change_captain, { { '目标AID', 'integer' } } },
    { '大厅服务 - 移出队员', '移出队员', lobby.kick_member, { { '目标AID', 'integer' } } },
    { '大厅服务 - 获取队伍成员', '获取队伍成员', lobby.get_members },
    { '大厅服务 - 开始匹配', '开始匹配', lobby.start_match, { { '匹配参数', 'table' } } },
    { '大厅服务 - 取消匹配', '取消匹配', lobby.cancel_match },
    { '大厅服务 - 发送队伍聊天', '发送队伍聊天', lobby.send_team_chat, { { '消息', 'string' } } },
    { '大厅服务 - 发送世界聊天', '发送世界聊天', lobby.send_world_chat, { { '消息', 'string' } } },
    { '大厅服务 - 获取聊天记录', '获取聊天记录', lobby.get_chat_history, { { '频道', 'string?' } } },
    { '大厅服务 - 局内私人副本', '局内私人副本', lobby.private_dungeon, { { '副本参数', 'table' } } },
    { '大厅服务 - 加入口令', '加入口令', lobby.join_by_token, { { '口令', 'string' } } },
    { '大厅服务 - 获取口令', '获取口令', lobby.get_token },
    { '大厅服务 - 返回大厅', '返回大厅', lobby.return_lobby, { { '大厅参数', 'table' } } },
    { '大厅服务 - 退出游戏', '退出游戏', lobby.exit_game },
    { '大厅服务 - 获取状态快照', '获取状态快照', lobby.get_state },
    { '大厅服务 - 获取聊天消息', '获取聊天消息', lobby.get_chat_message, { { '序号', 'integer' }, { '频道', 'string?' } } },
    { '大厅服务 - 获取队伍成员项', '获取队伍成员项', lobby.get_member, { { '序号', 'integer' } } },
    { '大厅服务 - 获取队伍信息', '获取队伍信息', lobby.get_team_info, { { '目标AID', 'integer?' } } },
    { '大厅服务 - 获取玩家信息', '获取玩家信息', lobby.get_player_info, { { '目标AID', 'integer?' } } },
    { '大厅服务 - 刷新玩家信息', '刷新玩家信息', lobby.refresh_player_info },
}

function M.get_definitions()
    return DEFINITIONS
end

function M.register()
    if not y3.eca or not y3.eca.def then
        return false
    end
    for _, definition in ipairs(DEFINITIONS) do
        local builder = y3.eca.def(definition[1])
        for _, param in ipairs(definition[4] or {}) do
            builder:with_param(param[1], param[2])
        end
        builder:with_return('结果', 'table')
        builder:call(function(...)
            return call_for_eca(definition[2], definition[3], ...)
        end)
    end
    return true
end

M.register()

if not completion_listener then
    local listen = lobby._on_complete_internal or lobby.on_complete
    completion_listener = listen(function(payload)
        if not state.runtime.eca_request_ids[payload.request_id] then
            return
        end
        state.runtime.eca_request_ids[payload.request_id] = nil
        local ok, err = emit(payload)
        if not ok then
            state.runtime.failed_events[payload.request_id] = {
                payload = payload,
                error = err,
            }
        end
    end)
end

if not status_listener then
    local listen = lobby._on_event_internal or lobby.on_event
    status_listener = listen(function(payload)
        local ok, err = emit_status(payload)
        if not ok then
            state.runtime.failed_events['status-event-' .. tostring(payload.sequence or '')] = {
                payload = payload,
                error = err,
            }
        end
    end)
end

return M
