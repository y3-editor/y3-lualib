local client_api = require 'y3.game.lobby.client'
local state = require 'y3.game.lobby.state'
local result = require 'y3.game.lobby.result'

---@class y3.Lobby
local M = {}

local PLAYER_VERSION = '2.0'
local REQUEST_TIMEOUT = 10
local EXIT_CLEANUP_WATCHDOG_TIMEOUT = 8
local TEAM_PRIVATE_DUNGEON_FAILURE_REASON = '组队局内私人副本请求失败，所有人留在原地，请队长重试'

local listeners = {}
local LOCAL_REJECTION = {}

local function to_integer(value)
    local ok, integer = pcall(math.tointeger, value)
    if ok then
        return integer
    end
    return nil
end

local function validate_game_play_id(value)
    if type(value) ~= 'number' then
        return nil
    end
    local game_play_id = to_integer(value)
    if not game_play_id or game_play_id <= 0 then
        return nil
    end
    return game_play_id
end

local function trim(value)
    return tostring(value or ''):match('^%s*(.-)%s*$')
end

local function is_non_empty_custom_param(value)
    if value == nil then
        return false
    end
    if type(value) == 'string' then
        return trim(value) ~= ''
    end
    if type(value) == 'table' then
        return next(value) ~= nil
    end
    return true
end

local function local_rejection(code, reason, result_data)
    return false, {
        kind = LOCAL_REJECTION,
        code = code,
        reason = reason,
        result_data = result_data,
    }
end

local function state_conflict_code(reason)
    if reason == '不是队长' then
        return 'not_captain'
    end
    if reason == '失去连接' then
        return 'not_connected'
    end
    return 'state_conflict'
end

local function caught_error_handler(action, redact_error)
    return function(err)
        local reason = tostring(err)
        if redact_error then
            pcall(log.warn, '[Lobby] 调用异常 | action=' .. action .. ' | error=敏感详情已省略')
            return '平台调用异常，敏感详情已省略'
        end
        pcall(log.error, '[Lobby] 调用异常 | action=' .. action .. ' | error=' .. reason)
        return reason
    end
end

local function remove_resource(resource)
    if resource and resource.remove then
        pcall(resource.remove, resource)
    end
end

local function get_local_player()
    local local_player
    if y3.player and y3.player.with_local then
        y3.player.with_local(function(player)
            local_player = player
        end)
    end
    return local_player
end

local function get_local_player_aid(local_player)
    local client = client_api.get()
    local aid = to_integer(client and client.aid)
    if aid then
        return aid
    end
    local_player = local_player or get_local_player()
    if not local_player then
        return nil
    end
    if local_player.get_platform_id then
        local ok, value = pcall(local_player.get_platform_id, local_player)
        aid = ok and to_integer(value) or nil
        if aid then
            return aid
        end
    end
    if local_player.get_aid then
        local ok, value = pcall(local_player.get_aid, local_player)
        aid = ok and to_integer(value) or nil
        if aid then
            return aid
        end
    end
    return to_integer(local_player.aid or local_player.platform_id or local_player.platformId)
end

local function request_create_private_dungeon(local_player, level_id, game_mode, max_player, custom_param)
    if is_non_empty_custom_param(custom_param) then
        local_player.handle:request_create_private_dungeon(level_id, game_mode, max_player, custom_param)
    else
        local_player.handle:request_create_private_dungeon(level_id, game_mode, max_player)
    end
end

local function cross_map_request_data(level_id, game_mode, max_player)
    return {
        level_id = level_id,
        game_mode = game_mode,
        max_player = max_player,
        platform_requested = false,
        cross_map_tracking = 'degraded',
        entered_target = 'unknown',
    }
end

local function notify_complete(payload)
    for callback, record in pairs(listeners) do
        local ok, err = pcall(record.callback or callback, payload)
        if not ok then
            state.runtime.failed_events[payload.request_id] = {
                payload = payload,
                error = tostring(err),
            }
        end
    end
end

---@param callback fun(payload: table): boolean?, string?
---@return table
function M.on_complete(callback)
    listeners[callback] = {
        callback = callback,
        persistent = false,
    }
    return {
        remove = function()
            listeners[callback] = nil
        end,
    }
end

function M._on_complete_internal(callback)
    listeners[callback] = {
        callback = callback,
        persistent = true,
    }
    return {
        remove = function()
            listeners[callback] = nil
        end,
    }
end

local function cleanup_request(request)
    remove_resource(request.timer)
    request.timer = nil
    for _, cleanup in ipairs(request.cleanups or {}) do
        pcall(cleanup)
    end
    request.cleanups = {}
    state.runtime.pending[request.id] = nil
    if request.lock and state.runtime.locks[request.lock] == request.id then
        state.runtime.locks[request.lock] = nil
    end
end

local function reject_request(request)
    cleanup_request(request)
    state.runtime.eca_request_ids[request.id] = nil
end

local function finish_request(request, success, code, reason, result_data)
    if not request
        or request.done
        or request.cancelled
        or state.runtime.pending[request.id] ~= request then
        return false
    end
    request.done = true
    cleanup_request(request)
    notify_complete(result.completed(request.id, request.action, success, code, reason, result_data))
    return true
end

---@param event_name string|fun(payload: table)
---@param callback? fun(payload: table)
---@return table
function M.on_event(event_name, callback)
    if type(event_name) == 'function' and callback == nil then
        return state.on_event(nil, event_name, false)
    end
    if type(event_name) ~= 'string' or type(callback) ~= 'function' then
        return {
            remove = function()
            end,
        }
    end
    return state.on_event(event_name, callback, false)
end

function M._on_event_internal(callback)
    return state.on_event(nil, callback, true)
end

local function finish_cancelled_request(request, terminal_action, terminal_request_id)
    if not request or request.cancel_completion_done then
        return false
    end
    request.cancel_completion_done = true
    notify_complete(result.completed(
        request.id,
        request.action,
        false,
        'cancelled_by_terminal',
        (terminal_action or '终止操作') .. '已取消未完成请求',
        {
            terminal_action = terminal_action,
            terminal_request_id = terminal_request_id,
        }))
    return true
end

local function new_request(action, lock)
    lock = lock or action
    if state.runtime.locks[lock] then
        return nil, 'request_locked', '已有同类请求处理中'
    end
    local request = {
        id = state.next_request_id(),
        action = action,
        lock = lock,
        done = false,
        cleanups = {},
    }
    state.runtime.pending[request.id] = request
    state.runtime.locks[lock] = request.id
    if state.runtime.current_call_origin == 'eca' then
        state.runtime.eca_request_ids[request.id] = true
    end
    if y3.ltimer and y3.ltimer.wait then
        local ok, timer = pcall(y3.ltimer.wait, REQUEST_TIMEOUT, function()
            finish_request(request, false, 'timeout', '请求超时')
        end)
        if ok then
            request.timer = timer
        end
    end
    return request
end

local function not_connected_result(action, code, result_data)
    if state.runtime.locks.terminal then
        return result.rejected(action, 'terminal_in_progress', '正在返回大厅或退出游戏')
    end
    local reason = code == 'connection_pending' and '大厅连接正在建立' or '大厅尚未连接'
    return result.rejected(action, code, reason, result_data)
end

local function reject_if_not_connected(action)
    if state.runtime.locks.terminal then
        return result.rejected(action, 'terminal_in_progress', '正在返回大厅或退出游戏')
    end
    local _, code = client_api.require_ready()
    if code then
        return not_connected_result(action, code)
    end
    return nil
end

local function run_async(action, lock, starter, options)
    options = options or {}
    if lock ~= 'terminal' and state.runtime.locks.terminal then
        return result.rejected(action, 'terminal_in_progress', '正在返回大厅或退出游戏')
    end
    if options.require_connected ~= false then
        local client, code = client_api.require_ready()
        if not client then
            return not_connected_result(action, code, options.rejected_result_data)
        end
        options.client = client
    else
        options.client = client_api.is_ready() and client_api.get() or nil
    end

    local request, code, reason = new_request(action, lock)
    if not request then
        ---@cast code string
        return result.rejected(action, code, reason)
    end

    local starter_returned = false
    local deferred_done
    local function done(success, finish_code, finish_reason, data)
        if not starter_returned then
            deferred_done = table.pack(success, finish_code, finish_reason, data)
            return true
        end
        return finish_request(request, success, finish_code, finish_reason, data)
    end

    local ok, sent, send_failure = xpcall(function()
        return starter(options.client, request, done)
    end, caught_error_handler(action, options.redact_error))
    if not ok then
        reject_request(request)
        return result.rejected(
            action,
            'request_error',
            options.request_error_reason or sent,
            options.rejected_result_data)
    end
    if sent == false then
        reject_request(request)
        if type(send_failure) == 'table' and send_failure.kind == LOCAL_REJECTION then
            return result.rejected(
                action,
                send_failure.code,
                send_failure.reason,
                send_failure.result_data)
        end
        return result.rejected(
            action,
            'request_failed',
            options.request_failed_reason or send_failure or '请求未发送',
            options.rejected_result_data)
    end
    starter_returned = true
    if deferred_done then
        local args = deferred_done
        if y3.ltimer and y3.ltimer.wait_frame then
            y3.ltimer.wait_frame(1, function()
                finish_request(request, table.unpack(args, 1, args.n))
            end)
        else
            finish_request(request, table.unpack(args, 1, args.n))
        end
    end
    if type(options.accepted_result_data) == 'table' then
        options.accepted_result_data.request_id = request.id
    end
    return result.accepted(action, request.id, {
        result_data = options.accepted_result_data,
    })
end

local function cancel_pending_request_for_terminal(lock, terminal_action, terminal_request_id)
    local request_id = state.runtime.locks[lock]
    local request = request_id and state.runtime.pending[request_id] or nil
    if not request then
        return false
    end
    request.cancelled = true
    request.done = true
    cleanup_request(request)
    finish_cancelled_request(request, terminal_action, terminal_request_id)
    return true
end

local function is_terminal_active()
    return state.runtime.locks.terminal ~= nil
        or state.runtime.status == 'closing'
end

local function finish_terminal_request(request, success, code, reason, result_data, final_status)
    if not request or request.done then
        return false
    end
    request.done = true
    cleanup_request(request)
    if final_status then
        state.set_status(final_status)
    end
    notify_complete(result.completed(request.id, request.action, success, code, reason, result_data))
    return true
end

local function new_terminal_request(action)
    if is_terminal_active() then
        return nil, 'terminal_locked', '已有返回大厅或退出游戏请求正在处理'
    end
    local request = {
        id = state.next_request_id(),
        action = action,
        lock = 'terminal',
        done = false,
        cleanups = {},
    }
    state.runtime.pending[request.id] = request
    state.runtime.locks.terminal = request.id
    if state.runtime.current_call_origin == 'eca' then
        state.runtime.eca_request_ids[request.id] = true
    end
    return request
end

local function run_terminal_async(action, starter)
    local request, code, reason = new_terminal_request(action)
    if not request then
        ---@cast code string
        return result.rejected(action, code, reason)
    end
    local ready_client = client_api.is_ready() and client_api.get() or nil
    if y3.ltimer and y3.ltimer.wait then
        local ok, timer = pcall(y3.ltimer.wait, REQUEST_TIMEOUT, function()
            client_api.release_for_terminal()
            finish_terminal_request(request, false, 'timeout', '请求超时', state.snapshot(), 'idle')
        end)
        if ok then
            request.timer = timer
        end
    end

    state.set_status('closing')
    cancel_pending_request_for_terminal('operation', action, request.id)
    cancel_pending_request_for_terminal('chat', action, request.id)
    client_api.cancel_pending_connect(action, function(cancelled_request)
        finish_cancelled_request(cancelled_request, action, request.id)
    end)

    local starter_returned = false
    local deferred_done
    local function done(success, finish_code, finish_reason, data, final_status)
        if not starter_returned then
            deferred_done = table.pack(success, finish_code, finish_reason, data, final_status)
            return true
        end
        return finish_terminal_request(request, success, finish_code, finish_reason, data, final_status)
    end

    local ok, sent, send_reason = xpcall(function()
        return starter(ready_client, request, done)
    end, caught_error_handler(action))
    if not ok then
        client_api.release_for_terminal()
        finish_terminal_request(request, false, 'request_error', sent, state.snapshot(), 'idle')
        return result.accepted(action, request.id)
    end
    if sent == false then
        client_api.release_for_terminal()
        finish_terminal_request(request, false, 'request_failed', send_reason or '请求未发送', state.snapshot(), 'idle')
        return result.accepted(action, request.id)
    end
    starter_returned = true
    if deferred_done then
        local args = deferred_done
        if y3.ltimer and y3.ltimer.wait_frame then
            y3.ltimer.wait_frame(1, function()
                finish_terminal_request(request, table.unpack(args, 1, args.n))
            end)
        else
            finish_terminal_request(request, table.unpack(args, 1, args.n))
        end
    end
    return result.accepted(action, request.id)
end

local function remote_error_data(err)
    if err ~= nil then
        return { remote_error_code = err }
    end
    return nil
end

local function rpc_done(done, success_reason, result_data)
    return function(_, err)
        if err then
            done(false, 'rpc_failed', tostring(err), remote_error_data(err))
        else
            done(true, 'ok', success_reason, result_data)
        end
    end
end

local function state_done(request, client, event_name, predicate, done, success_reason, result_data, failure_reason)
    local rpc_succeeded = false
    local function check_state()
        if request.done or not rpc_succeeded then
            return
        end
        local ok, confirmed = pcall(predicate)
        if not ok then
            done(false, 'state_check_failed', tostring(confirmed))
        elseif confirmed then
            done(true, 'ok', success_reason, result_data)
        end
    end
    if client.event_on then
        local ok, trigger = pcall(client.event_on, client, event_name, function()
            check_state()
        end)
        if ok and trigger then
            request.cleanups[#request.cleanups + 1] = function()
                remove_resource(trigger)
            end
        end
    end
    return function(_, err)
        if err then
            done(false, 'rpc_failed', failure_reason or tostring(err), remote_error_data(err))
            return
        end
        rpc_succeeded = true
        check_state()
    end
end

local function contains_member(client, target_aid)
    for _, member in ipairs(client.team_info and client.team_info.members or {}) do
        if to_integer(member.aid) == target_aid then
            return true
        end
    end
    return false
end

---@param game_play_id integer
---@param in_game boolean?
---@param endpoint_env string?
---@return table
function M.connect(game_play_id, in_game, endpoint_env)
    local valid_game_play_id = validate_game_play_id(game_play_id)
    if not valid_game_play_id then
        return result.rejected('建立连接', 'invalid_game_play_id', '请传入有效的玩法 ID game_play_id')
    end
    if in_game ~= nil and type(in_game) ~= 'boolean' then
        return result.rejected('建立连接', 'invalid_argument', '是否在游戏关卡必须是布尔值')
    end
    if endpoint_env ~= nil and endpoint_env ~= 'qa' and endpoint_env ~= 'pre' and endpoint_env ~= 'prod' then
        return result.rejected('建立连接', 'invalid_argument', 'endpoint_env must be qa, pre, or prod')
    end
    return client_api.connect(valid_game_play_id, function(request, success, code, reason, data)
        notify_complete(result.completed(request.id, request.action, success, code, reason, data))
    end, in_game == true, endpoint_env)
end

function M.get_connection_status()
    return result.accepted('获取连接状态', nil, {
        reason = '连接状态已返回',
        code = state.runtime.status,
        sync = true,
        result_data = state.snapshot(),
    })
end

function M.set_score(score)
    local action = '设置匹配分数'
    local rejected = reject_if_not_connected(action)
    if rejected then
        return rejected
    end
    score = to_integer(score)
    if not score then
        return result.rejected(action, 'invalid_argument', 'score must be an integer')
    end
    return run_async(action, 'operation', function(client, _, done)
        return client:set_score(score, rpc_done(done, 'score updated', { score = score }))
    end)
end

function M.create_team(member_limit)
    local action = '创建队伍'
    local rejected = reject_if_not_connected(action)
    if rejected then
        return rejected
    end
    member_limit = to_integer(member_limit)
    if not member_limit or member_limit <= 0 then
        return result.rejected(action, 'invalid_argument', '请传入有效的队伍人数上限 member_limit')
    end
    return run_async(action, 'operation', function(client, request, done)
        return client:create_team(state_done(request, client, '队伍变化', function()
            return client:is_in_team()
        end, done, '队伍创建成功'), member_limit)
    end)
end

function M.join_team(team_id)
    local action = '加入队伍'
    local rejected = reject_if_not_connected(action)
    if rejected then
        return rejected
    end
    team_id = to_integer(team_id)
    if not team_id or team_id <= 0 then
        return result.rejected(action, 'invalid_argument', '请输入有效的队伍编号')
    end
    return run_async(action, 'operation', function(client, request, done)
        if client:is_matching() or client:is_launching() then
            return local_rejection('state_conflict', '匹配或启动中不能加入队伍')
        end
        return client:join_team(team_id, state_done(request, client, '队伍变化', function()
            return client.team_info and to_integer(client.team_info.team_id) == team_id
        end, done, '已加入队伍', { team_id = team_id }))
    end)
end

function M.leave_team()
    return run_async('离开队伍', 'operation', function(client, request, done)
        if not client:is_in_team() then
            return local_rejection('not_in_team', '当前不在队伍中')
        end
        if client:is_matching() or client:is_launching() then
            return local_rejection('state_conflict', '匹配或启动中不能离开队伍')
        end
        return client:leave_team(state_done(request, client, '离开队伍', function()
            return not client:is_in_team()
        end, done, '已离开队伍'))
    end)
end

function M.dismiss_team()
    return run_async('解散队伍', 'operation', function(client, request, done)
        if not client:is_in_team() then
            return local_rejection('not_in_team', '当前不在队伍中')
        end
        if not client:is_captain() then
            return local_rejection('not_captain', '只有队长可以解散队伍')
        end
        if client:is_matching() or client:is_launching() then
            return local_rejection('state_conflict', '匹配或启动中不能解散队伍')
        end
        return client:dismiss_team(state_done(request, client, '离开队伍', function()
            return not client:is_in_team()
        end, done, '队伍已解散'))
    end)
end

function M.change_captain(target_aid)
    local action = '转移队长'
    local rejected = reject_if_not_connected(action)
    if rejected then
        return rejected
    end
    target_aid = to_integer(target_aid)
    if not target_aid then
        return result.rejected(action, 'invalid_argument', '请输入有效的目标成员 AID')
    end
    return run_async(action, 'operation', function(client, request, done)
        if target_aid == to_integer(client.aid) then
            return local_rejection('state_conflict', '不能把队长转移给自己')
        end
        if not client:is_in_team() then
            return local_rejection('not_in_team', '当前不在队伍中')
        end
        if not client:is_captain() then
            return local_rejection('not_captain', '只有队长可以转移队长')
        end
        if not contains_member(client, target_aid) then
            return local_rejection('member_not_found', '目标玩家不在当前队伍中')
        end
        if client:is_matching() or client:is_launching() then
            return local_rejection('state_conflict', '匹配或启动中不能转移队长')
        end
        return client:change_captain(target_aid, state_done(request, client, '队伍变化', function()
            return client.team_info and to_integer(client.team_info.captain) == target_aid
        end, done, '队长已转移', { target_aid = target_aid }))
    end)
end

function M.kick_member(target_aid)
    local action = '移出队员'
    local rejected = reject_if_not_connected(action)
    if rejected then
        return rejected
    end
    target_aid = to_integer(target_aid)
    if not target_aid then
        return result.rejected(action, 'invalid_argument', '请输入有效的目标成员 AID')
    end
    return run_async(action, 'operation', function(client, request, done)
        if target_aid == to_integer(client.aid) then
            return local_rejection('state_conflict', '不能把自己移出队伍')
        end
        if not client:is_in_team() then
            return local_rejection('not_in_team', '当前不在队伍中')
        end
        if not client:is_captain() then
            return local_rejection('not_captain', '只有队长可以移出成员')
        end
        if not contains_member(client, target_aid) then
            return local_rejection('member_not_found', '目标玩家不在当前队伍中')
        end
        if client:is_matching() or client:is_launching() then
            return local_rejection('state_conflict', '匹配或启动中不能移出成员')
        end
        return client:team_kick(target_aid, state_done(request, client, '队伍变化', function()
            return not contains_member(client, target_aid)
        end, done, '成员已移出', { target_aid = target_aid }))
    end)
end

function M.get_members()
    local client, code = client_api.require_ready()
    if not client then
        return not_connected_result('获取队伍成员', code)
    end
    return result.accepted('获取队伍成员', nil, {
        sync = true,
        result_data = { members = state.public_members(client.team_info and client.team_info.members) },
    })
end

function M.get_member(index)
    local action = '获取队伍成员项'
    local client, code = client_api.require_ready()
    if not client then
        return not_connected_result(action, code)
    end
    index = to_integer(index)
    if not index or index <= 0 then
        return result.rejected(action, 'invalid_argument', '序号必须是正整数')
    end
    local members = client.team_info and client.team_info.members or {}
    local member = members[index]
    return result.accepted(action, nil, {
        sync = true,
        result_data = {
            index = index,
            exists = member ~= nil,
            member = state.public_player(member),
        },
    })
end

local function append_history(target, source, channel)
    for _, item in ipairs(type(source) == 'table' and source or {}) do
        if not channel or item.channel == channel or item.mode == channel then
            target[#target + 1] = item
        end
    end
end

local function sort_history(history)
    local records = {}
    for index, item in ipairs(history) do
        local chat = type(item.chat) == 'table' and item.chat or nil
        records[index] = {
            item = item,
            sequence = to_integer(item.sequence),
            time = to_integer(item.time or item.chat_time or chat and chat.chat_time),
            index = index,
        }
    end
    table.sort(records, function(left, right)
        if left.sequence ~= right.sequence then
            if left.sequence == nil then
                return false
            end
            if right.sequence == nil then
                return true
            end
            return left.sequence < right.sequence
        end
        if left.time ~= right.time then
            if left.time == nil then
                return false
            end
            if right.time == nil then
                return true
            end
            return left.time < right.time
        end
        return left.index < right.index
    end)
    for index, record in ipairs(records) do
        history[index] = record.item
    end
end

function M.start_match(params)
    local action = '开始匹配'
    local rejected = reject_if_not_connected(action)
    if rejected then
        return rejected
    end
    if type(params) ~= 'table' then
        return result.rejected(action, 'invalid_argument', '请传入匹配参数表')
    end
    local level_id = trim(params.level_id)
    local game_mode = to_integer(params.game_mode)
    local score = to_integer(params.score)
    if level_id == '' then
        return result.rejected(action, 'invalid_argument', '请传入 match.json 中配置的目标 level_id')
    end
    if not game_mode then
        return result.rejected(action, 'invalid_argument', '请传入项目 match.json 中配置的 game_mode')
    end
    return run_async(action, 'operation', function(client, request, done)
        local can_match, reason = client:can_match()
        if not can_match then
            return local_rejection(state_conflict_code(reason), reason)
        end
        client.level_id = level_id
        return client:start_match(game_mode, score, state_done(request, client, '匹配状态变化', function()
            return client:is_matching()
        end, done, '匹配已开始', { level_id = level_id, game_mode = game_mode, score = score }))
    end)
end

function M.cancel_match()
    return run_async('取消匹配', 'operation', function(client, request, done)
        if not client:is_matching() then
            return local_rejection('not_matching', '当前未在匹配中')
        end
        if client:is_in_team() and not client:is_captain() then
            return local_rejection('not_captain', '只有队长可以取消匹配')
        end
        return client:cancel_match(state_done(request, client, '匹配状态变化', function()
            return not client:is_matching()
        end, done, '匹配已取消'))
    end)
end

function M.send_team_chat(message)
    local action = '发送队伍聊天'
    local rejected = reject_if_not_connected(action)
    if rejected then
        return rejected
    end
    message = trim(message)
    if message == '' then
        return result.rejected(action, 'invalid_argument', '请输入聊天内容')
    end
    return run_async(action, 'chat', function(client, _, done)
        if not client:is_in_team() then
            return local_rejection('not_in_team', '当前不在队伍中')
        end
        if not client.send_chat then
            return false, 'client method send_chat missing'
        end
        return client:send_chat(message, rpc_done(done, '队伍聊天已发送', { message = message }))
    end, {
        redact_error = true,
    })
end

function M.send_world_chat(message)
    local action = '发送世界聊天'
    local rejected = reject_if_not_connected(action)
    if rejected then
        return rejected
    end
    message = trim(message)
    if message == '' then
        return result.rejected(action, 'invalid_argument', '请输入聊天内容')
    end
    return run_async(action, 'chat', function(client, _, done)
        if not client.send_world_chat then
            return false, 'client method send_world_chat missing'
        end
        return client:send_world_chat(message, rpc_done(done, '世界聊天已发送', { message = message }))
    end, {
        redact_error = true,
    })
end

function M.get_chat_history(channel)
    local client, code = client_api.require_ready()
    if not client then
        return not_connected_result('获取聊天记录', code)
    end
    local history = {}
    local by_channel = client.chat_history
    local message_history = client.message_history
    if not channel and type(message_history) == 'table' and #message_history > 0 then
        append_history(history, message_history)
    elseif channel and type(by_channel) == 'table' and type(by_channel[channel]) == 'table' then
        append_history(history, by_channel[channel])
    elseif not channel and type(by_channel) == 'table' then
        local channels = {}
        for key, list in pairs(by_channel) do
            if type(list) == 'table' then
                channels[#channels + 1] = key
            end
        end
        table.sort(channels, function(left, right)
            return tostring(left) < tostring(right)
        end)
        for _, key in ipairs(channels) do
            append_history(history, by_channel[key])
        end
        sort_history(history)
    else
        append_history(history, message_history, channel)
    end
    for index, item in ipairs(history) do
        history[index] = state.public_message(item)
    end
    return result.accepted('获取聊天记录', nil, {
        sync = true,
        result_data = { channel = channel or 'all', messages = history },
    })
end

function M.get_chat_message(index, channel)
    local action = '获取聊天消息'
    local client, code = client_api.require_ready()
    if not client then
        return not_connected_result(action, code)
    end
    index = to_integer(index)
    if not index or index <= 0 then
        return result.rejected(action, 'invalid_argument', '序号必须是正整数')
    end
    channel = channel ~= nil and trim(channel) or nil
    if channel == '' then
        channel = nil
    end
    local messages = M.get_chat_history(channel).result_data.messages or {}
    local message = messages[index]
    return result.accepted(action, nil, {
        sync = true,
        result_data = {
            index = index,
            channel = channel or 'all',
            exists = message ~= nil,
            message = message or {},
        },
    })
end

local function private_dungeon_result_data(route, completion_mode, level_id, game_mode, max_player)
    return {
        route = route,
        completion_mode = completion_mode,
        request_id = '',
        selected_players = {},
        skipped_in_game_players = {},
        unknown_status_players = {},
        platform_requested = false,
        entered_target = 'not_entered',
        level_id = level_id,
        game_mode = game_mode,
        max_player = max_player,
    }
end

local function build_players_from_members(members)
    local players = {}
    local selected_players = {}
    for _, member in ipairs(members or {}) do
        local public_member = state.public_player(member)
        players[#players + 1] = {
            aid = tostring(public_member.aid),
            version = PLAYER_VERSION,
        }
        selected_players[#selected_players + 1] = public_member
    end
    return players, selected_players
end

local function has_multiple_team_members(client)
    if not client or not client:is_in_team() then
        return false
    end
    local members = client.team_info and client.team_info.members or {}
    return #members >= 2
end

function M._private_dungeon_completion_mode_for_eca(params)
    if type(params) ~= 'table' then
        return 'request_only'
    end
    local client = client_api.get()
    if has_multiple_team_members(client) then
        return 'async'
    end
    return 'request_only'
end

function M.private_dungeon(params)
    local action = '局内私人副本'
    if type(params) ~= 'table' then
        return result.rejected(action, 'invalid_argument', 'params must be a table')
    end
    local level_id = trim(params.level_id)
    local game_mode = to_integer(params.game_mode)
    local team_game_mode = params.team_game_mode == nil and game_mode or to_integer(params.team_game_mode)
    local max_player = to_integer(params.max_player)
    if level_id == '' or not game_mode or not team_game_mode or not max_player or max_player <= 0 then
        return result.rejected(action, 'invalid_argument',
            'level_id, integer game_mode, optional integer team_game_mode and positive max_player are required')
    end
    if params.players ~= nil then
        return result.rejected(action, 'invalid_argument', 'players 由框架根据队伍快照全量生成，不支持外部传入')
    end
    local engine_level_id = trim(params.engine_level_id)
    if engine_level_id == '' then
        engine_level_id = level_id
    end
    local client = client_api.get()
    if has_multiple_team_members(client) then
        local game_map_id = trim(params.game_map_id)
        if game_map_id == '' then
            return result.rejected(action, 'invalid_argument', 'game_map_id is required for team private dungeon')
        end
        local players, selected = build_players_from_members(client.team_info and client.team_info.members or {})
        local request_data = private_dungeon_result_data('team_bob', 'async_event', level_id, game_mode, max_player)
        request_data.game_map_id = game_map_id
        request_data.engine_level_id = engine_level_id
        request_data.team_game_mode = team_game_mode
        request_data.selected_players = selected
        return run_async(action, 'operation', function(team_client, request, done)
            if not team_client:is_captain() then
                request_data.route = 'rejected'
                request_data.completion_mode = 'sync_rejected'
                return local_rejection('not_captain', '只有队长可以发起局内私人副本', request_data)
            end
            local starter = team_client.start_private_dungeon_game_filtered
            if type(starter) ~= 'function' then
                request_data.route = 'rejected'
                request_data.completion_mode = 'sync_rejected'
                return local_rejection('request_failed', 'BOB 私人副本接口不可用', request_data)
            end
            return starter(team_client, {
                game_map_id = game_map_id,
                level_id = level_id,
                game_mode = team_game_mode,
            }, players, state_done(request, team_client, '启动状态变化', function()
                return team_client:is_launching()
            end, done, 'private dungeon requested', request_data,
                TEAM_PRIVATE_DUNGEON_FAILURE_REASON))
        end, {
            accepted_result_data = request_data,
            rejected_result_data = request_data,
            request_error_reason = TEAM_PRIVATE_DUNGEON_FAILURE_REASON,
            request_failed_reason = TEAM_PRIVATE_DUNGEON_FAILURE_REASON,
        })
    end

    local local_player = get_local_player()
    local request_data = private_dungeon_result_data('solo_engine', 'request_only', engine_level_id, game_mode, max_player)
    request_data.platform_level_id = level_id
    request_data.entered_target = 'unknown'
    request_data.cross_map_tracking = 'degraded'
    if not local_player or not local_player.handle then
        return result.rejected(action, 'local_player_missing', 'local player not found', request_data)
    end
    local requested, request_error = xpcall(function()
        request_create_private_dungeon(local_player, engine_level_id, game_mode, max_player, params.custom_param)
    end, caught_error_handler(action))
    if not requested then
        return result.rejected(action, 'request_error', request_error, request_data)
    end
    request_data.platform_requested = true
    return result.accepted(action, nil, {
        sync = true,
        reason = '局内私人副本请求已提交，等待关卡切换',
        result_data = request_data,
    })
end

function M.join_by_token(token)
    local action = '加入口令'
    token = trim(token)
    if token == '' then
        return result.rejected(action, 'invalid_argument', '请输入口令')
    end
    pcall(log.info, '[Lobby][PrivateDungeonDiag] 加入口令请求 | token=<redacted>')
    local request_data = {
        token = token,
        platform_requested = false,
        cross_map_tracking = 'degraded',
        entered_target = 'unknown',
    }
    local local_player = get_local_player()
    if not local_player or not local_player.handle then
        return result.rejected(action, 'local_player_missing', '未找到本地玩家', request_data)
    end
    local requested, request_error = xpcall(function()
        local_player.handle:request_join_private_dungeon(token)
    end, caught_error_handler(action, true))
    if not requested then
        return result.rejected(action, 'request_error', request_error, request_data)
    end
    request_data.platform_requested = true
    return result.accepted(action, nil, {
        sync = true,
        reason = '加入口令请求已提交，等待关卡切换',
        result_data = request_data,
    })
end

local function cleanup_diagnostic(code, ok, attempted, reason)
    return {
        attempted = attempted == true,
        ok = ok,
        code = code,
        reason = reason and tostring(reason) or code,
    }
end

local function run_exit_cleanup_before(client, after_cleanup, defer_sync_cleanup)
    if not client then
        after_cleanup(cleanup_diagnostic('not_needed', true, false, 'lobby client is not connected'))
        return
    end

    local cleanup_call_returned = false
    local function run_after_cleanup(cleanup)
        if defer_sync_cleanup and not cleanup_call_returned and y3.ltimer and y3.ltimer.wait_frame then
            y3.ltimer.wait_frame(1, function()
                after_cleanup(cleanup)
            end)
            return
        end
        after_cleanup(cleanup)
    end

    if type(client.cleanup_before_exit) ~= 'function' then
        run_after_cleanup(cleanup_diagnostic('cleanup_unavailable', nil, false, 'client method cleanup_before_exit missing'))
        return
    end

    local finished = false
    local watchdog
    local function finish(cleanup)
        if finished then
            return false
        end
        finished = true
        remove_resource(watchdog)
        watchdog = nil
        run_after_cleanup(cleanup)
        return true
    end

    if y3.ltimer and y3.ltimer.wait then
        local timer_ok, timer = pcall(y3.ltimer.wait, EXIT_CLEANUP_WATCHDOG_TIMEOUT, function()
            finish(cleanup_diagnostic('cleanup_watchdog', false, true, 'cleanup_before_exit watchdog timeout'))
        end)
        if timer_ok then
            watchdog = timer
        end
    end

    local ok, call_result = xpcall(function()
        return client:cleanup_before_exit(function(cleanup_ok, cleanup_reason)
            local code = cleanup_ok and 'ok' or 'cleanup_failed'
            finish(cleanup_diagnostic(code, cleanup_ok == true, true, cleanup_reason))
        end)
    end, caught_error_handler('退出前清理'))
    if not ok then
        finish(cleanup_diagnostic('cleanup_exception', false, true, call_result))
        return
    end
    cleanup_call_returned = true
    if not watchdog and not finished then
        finish(cleanup_diagnostic('cleanup_watchdog', false, true, 'cleanup watchdog unavailable'))
    end
end

function M.get_token()
    if state.runtime.locks.terminal then
        return result.rejected('获取口令', 'terminal_in_progress', '正在返回大厅或退出游戏')
    end
    local info = GameAPI.get_dungeon_info()
    local token = info and (info.space_id or info.spaceId) or ''
    return result.accepted('获取口令', nil, {
        sync = true,
        result_data = { token = tostring(token or '') },
    })
end

function M.get_team_info(target_aid)
    local action = '获取队伍信息'
    local rejected = reject_if_not_connected(action)
    if rejected then
        return rejected
    end
    if target_aid ~= nil then
        target_aid = to_integer(target_aid)
        if not target_aid then
            return result.rejected(action, 'invalid_argument', '目标AID必须是整数')
        end
    end
    return run_async(action, 'operation', function(client, _, done)
        local aid = target_aid or to_integer(client.aid)
        if not aid then
            return local_rejection('local_aid_missing', '缺少目标AID')
        end
        return client:get_team_info(aid, function(team_info, err)
            if err then
                done(false, 'rpc_failed', tostring(err), remote_error_data(err))
            else
                done(true, 'ok', '队伍信息已返回', {
                    aid = aid,
                    has_team = team_info ~= nil,
                    team = state.public_team(team_info),
                })
            end
        end)
    end)
end

local function find_cached_player(client, target_aid)
    if not client then
        return nil
    end
    if target_aid and to_integer(client.aid) == target_aid then
        return client.player_info or {
            aid = client.aid,
            name = client.name,
            score = client.score,
        }
    end
    for _, member in ipairs(client.team_info and client.team_info.members or {}) do
        if to_integer(member.aid) == target_aid then
            return member
        end
    end
    return nil
end

function M.get_player_info(target_aid)
    local action = '获取玩家信息'
    local rejected = reject_if_not_connected(action)
    if rejected then
        return rejected
    end
    if target_aid ~= nil then
        target_aid = to_integer(target_aid)
        if not target_aid then
            return result.rejected(action, 'invalid_argument', '目标AID必须是整数')
        end
    end
    local client = client_api.get()
    local aid = target_aid or to_integer(client and client.aid)
    if not aid then
        return result.rejected(action, 'local_aid_missing', '缺少目标AID')
    end
    local cached = find_cached_player(client, aid)
    if cached then
        return result.accepted(action, nil, {
            sync = true,
            result_data = {
                aid = aid,
                cache_hit = true,
                player = state.public_player(cached),
            },
        })
    end
    return run_async(action, 'operation', function(rpc_client, _, done)
        return rpc_client:get_player_info(aid, function(player_info, err)
            if err then
                done(false, 'rpc_failed', tostring(err), remote_error_data(err))
            elseif not player_info then
                done(false, 'player_not_found', '未找到目标玩家', { aid = aid })
            else
                done(true, 'ok', '玩家信息已返回', {
                    aid = aid,
                    cache_hit = false,
                    player = state.public_player(player_info),
                })
            end
        end)
    end)
end

function M.refresh_player_info()
    local action = '刷新玩家信息'
    local rejected = reject_if_not_connected(action)
    if rejected then
        return rejected
    end
    return run_async(action, 'operation', function(client, _, done)
        return client:refresh_player_info(function(player_info, err)
            if err then
                done(false, 'rpc_failed', tostring(err), remote_error_data(err))
            else
                done(true, 'ok', '玩家信息已刷新', {
                    player = state.public_player(player_info or client.player_info),
                })
            end
        end)
    end)
end

function M.return_lobby(params)
    local action = '返回大厅'
    if is_terminal_active() then
        return result.rejected(action, 'terminal_locked', '已有返回大厅或退出游戏请求正在处理')
    end
    if type(params) ~= 'table' then
        return result.rejected(action, 'invalid_argument', 'params must be a table')
    end
    local level_id = trim(params.level_id)
    local game_mode = to_integer(params.game_mode)
    local max_player = to_integer(params.max_player)
    if level_id == '' or not game_mode or not max_player or max_player <= 0 then
        return result.rejected(action, 'invalid_argument', 'level_id, integer game_mode and positive max_player are required')
    end
    local previous_status = state.runtime.status
    local preserved_client = previous_status ~= 'connecting' and client_api.get() or nil
    local terminal_token = state.next_request_id()
    state.runtime.locks.terminal = terminal_token
    state.set_status('closing')
    cancel_pending_request_for_terminal('operation', action, terminal_token)
    cancel_pending_request_for_terminal('chat', action, terminal_token)
    client_api.cancel_pending_connect(action, function(cancelled_request)
        finish_cancelled_request(cancelled_request, action, terminal_token)
    end)

    local initial_data = cross_map_request_data(level_id, game_mode, max_player)
    initial_data.platform_requested = false

    local function release_terminal()
        if state.runtime.locks.terminal == terminal_token then
            state.runtime.locks.terminal = nil
        end
        if preserved_client and client_api.get() == preserved_client then
            state.set_status(previous_status)
        else
            client_api.release_for_terminal()
            state.set_status('idle')
        end
    end

    local local_player = get_local_player()
    if not local_player or not local_player.handle then
        release_terminal()
        return result.rejected(action, 'local_player_missing', 'local player not found', initial_data)
    end
    local requested, request_error = xpcall(function()
        request_create_private_dungeon(local_player, level_id, game_mode, max_player, params.custom_param)
    end, caught_error_handler(action))
    release_terminal()
    if not requested then
        return result.rejected(action, 'request_error', request_error, initial_data)
    end
    initial_data.platform_requested = true

    return result.accepted(action, nil, {
        sync = true,
        reason = '返回大厅请求已提交，等待关卡切换',
        result_data = initial_data,
    })
end

function M.exit_game()
    local action = '退出游戏'
    return run_terminal_async(action, function(client, _, done)
        local local_player = get_local_player()
        local exited = false
        local function exit_once()
            if exited then
                return
            end
            exited = true
            if local_player.handle and local_player.handle.exit_game then
                local_player.handle:exit_game()
            elseif local_player.exit_game then
                local_player:exit_game()
            end
            state.set_status('idle')
        end
        local function finish_then_exit(cleanup)
            client_api.release_for_terminal()
            local data = {
                cleanup_ok = cleanup and cleanup.ok == true or false,
                cleanup = cleanup,
            }
            if not local_player then
                done(false, 'local_player_missing', 'local player not found', data, 'idle')
                return
            end
            if not client and y3.ltimer and y3.ltimer.wait_frame then
                y3.ltimer.wait_frame(1, function()
                    done(true, 'ok', 'exit game requested', data)
                    y3.ltimer.wait_frame(1, exit_once)
                end)
                return
            end
            done(true, 'ok', 'exit game requested', data)
            if y3.ltimer and y3.ltimer.wait_frame then
                y3.ltimer.wait_frame(1, function()
                    exit_once()
                end)
            else
                exit_once()
            end
        end
        run_exit_cleanup_before(client, finish_then_exit, true)
        return true
    end)
end

function M.get_state()
    return result.accepted('获取状态快照', nil, {
        sync = true,
        result_data = state.snapshot(),
    })
end

function M.request_state()
    return M.get_state()
end

function M._get_player_version_for_test()
    return PLAYER_VERSION
end

function M._reset_for_test()
    for callback, record in pairs(listeners) do
        if not record.persistent then
            listeners[callback] = nil
        end
    end
    client_api._reset_for_test()
end

return M
