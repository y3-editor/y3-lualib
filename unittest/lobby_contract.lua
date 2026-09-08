package.path = './?.lua;./?/init.lua;' .. package.path

package.preload['y3.game.lobby.result'] = function()
    return dofile('game/lobby/result.lua')
end
package.preload['y3.game.lobby.state'] = function()
    return dofile('game/lobby/state.lua')
end
package.preload['y3.game.lobby.client'] = function()
    return dofile('game/lobby/client.lua')
end
package.preload['y3.game.lobby'] = function()
    return dofile('game/lobby/init.lua')
end
package.preload['y3.game.lobby.eca'] = function()
    return dofile('game/lobby/eca.lua')
end
package.preload['y3.game.lobby.bob'] = function()
    return dofile('game/lobby/bob.lua')
end
package.preload['y3.game.lobby.service.client'] = function()
    return dofile('game/lobby/service/client.lua')
end
package.preload['y3.game.lobby.service.define'] = function()
    return {}
end
package.preload['y3.game.lobby.network.protocol'] = function()
    return {
        msgtype = {
            RPC_RETURN = 1,
            RPC_CALL = 2,
            RPC_EVENT = 3,
            RAW_PROTOCOL = 4,
            LOGIN_AUTH = 5,
        },
        event_subtype = {
            ON_RUNNING = 1,
            LOSE_CONNECTION = 2,
        },
    }
end
package.preload['y3.game.lobby.network.fsm'] = function()
    return {
        new = function()
            return {
                init = function()
                end,
                add_state = function()
                end,
                add_transition = function()
                end,
                change_state = function()
                    return true
                end,
            }
        end,
    }
end
package.preload['y3.game.lobby.proto.proto_helper'] = function()
    return {
        load_all = function()
            return true
        end,
        init_pb = function()
            return {
                is_service_method = function()
                    return false
                end,
                encode = function(_, _, data)
                    return data
                end,
                get_pb_desc = function()
                    return {
                        service_uuid = 1,
                        method_index = 1,
                    }
                end,
                get_pb_ret_type = function()
                    return 'protocol.Team_Login_ret'
                end,
                decode = function(_, _, data)
                    return data
                end,
                get_method_info = function()
                    return nil
                end,
            }
        end,
    }
end
package.preload['y3.game.lobby.network.message_handler'] = function()
    return {
        new = function()
            return {
                set_network_event_handle = function()
                end,
                start = function()
                end,
                shutdown = function()
                end,
                send_request = function()
                    return true
                end,
                send_raw_message = function()
                    return true
                end,
            }
        end,
    }
end

local function assert_equal(actual, expected, message)
    if actual ~= expected then
        error((message or 'assert_equal failed') .. ': expected ' .. tostring(expected) .. ', got ' .. tostring(actual), 2)
    end
end

local function assert_not_contains(haystack, needle, message)
    if tostring(haystack):find(tostring(needle), 1, true) then
        error((message or 'assert_not_contains failed') .. ': leaked ' .. tostring(needle), 2)
    end
end

local function assert_contains(haystack, needle, message)
    if not tostring(haystack):find(tostring(needle), 1, true) then
        error((message or 'assert_contains failed') .. ': missing ' .. tostring(needle), 2)
    end
end

local TEST_GAME_PLAY_ID = 10190356
local eca_names = {}
local eca_definitions = {}
local bind = {}
local factory_calls = 0
local factory_game_play_ids = {}
local factory_in_games = {}
local factory_endpoint_envs = {}
local private_dungeon_requests = {}
local exit_game_calls = 0
local frame_callbacks = {}
local timeout_callbacks = {}
local timeout_timers = {}
local captured_logs = {}
local eca_call_impls = {
    ['大厅服务请求完成'] = function()
    end,
}
local completion_payloads = {}
local latest_client
local next_client_options = {}
---@type false|string
local platform_return_error = false
local expected_eca = {
    { name = '大厅服务 - 建立连接', params = { { '玩法ID', 'integer' }, { '是否在游戏关卡', 'boolean?' } } },
    { name = '大厅服务 - 获取连接状态', params = {} },
    { name = '大厅服务 - 设置匹配分数', params = { { '分数', 'integer' } } },
    { name = '大厅服务 - 创建队伍', params = { { '人数上限', 'integer' } } },
    { name = '大厅服务 - 加入队伍', params = { { '队伍编号', 'integer' } } },
    { name = '大厅服务 - 离开队伍', params = {} },
    { name = '大厅服务 - 解散队伍', params = {} },
    { name = '大厅服务 - 转移队长', params = { { '目标AID', 'integer' } } },
    { name = '大厅服务 - 移出队员', params = { { '目标AID', 'integer' } } },
    { name = '大厅服务 - 获取队伍成员', params = {} },
    { name = '大厅服务 - 开始匹配', params = { { '匹配参数', 'table' } } },
    { name = '大厅服务 - 取消匹配', params = {} },
    { name = '大厅服务 - 发送队伍聊天', params = { { '消息', 'string' } } },
    { name = '大厅服务 - 发送世界聊天', params = { { '消息', 'string' } } },
    { name = '大厅服务 - 获取聊天记录', params = { { '频道', 'string?' } } },
    { name = '大厅服务 - 局内私人副本', params = { { '副本参数', 'table' } } },
    { name = '大厅服务 - 加入口令', params = { { '口令', 'string' } } },
    { name = '大厅服务 - 获取口令', params = {} },
    { name = '大厅服务 - 返回大厅', params = { { '大厅参数', 'table' } } },
    { name = '大厅服务 - 退出游戏', params = {} },
    { name = '大厅服务 - 获取状态快照', params = {} },
    { name = '大厅服务 - 获取聊天消息', params = { { '序号', 'integer' }, { '频道', 'string?' } } },
    { name = '大厅服务 - 获取队伍成员项', params = { { '序号', 'integer' } } },
    { name = '大厅服务 - 获取队伍信息', params = { { '目标AID', 'integer?' } } },
    { name = '大厅服务 - 获取玩家信息', params = { { '目标AID', 'integer?' } } },
    { name = '大厅服务 - 刷新玩家信息', params = {} },
}

---@class LobbyContract.GameAPI
---@field get_dungeon_info fun(): table
_G.GameAPI = {
    lua_get_start_args = function()
        return {}
    end,
    get_dungeon_info = function()
        return {
            map_id = 9001,
            game_play_id = '1001',
            level_id = 'lobby-contract',
            env = 'debug',
        }
    end,
    api_is_client = function()
        return false
    end,
    api_stop_luagc_control = function()
    end,
    visual_pyexec = function()
    end,
}

local function capture_log(level, ...)
    local values = { level }
    for i = 1, select('#', ...) do
        values[#values + 1] = tostring(select(i, ...))
    end
    captured_logs[#captured_logs + 1] = table.concat(values, ' ')
end

---@class LobbyContract.Log
_G.log = {
    info = function(...)
        capture_log('info', ...)
    end,
    debug = function(...)
        capture_log('debug', ...)
    end,
    warn = function(...)
        capture_log('warn', ...)
    end,
    error = function(...)
        capture_log('error', ...)
        error(table.concat({ ... }, ' '))
    end,
}

_G.Class = function(name)
    local cls = {}
    cls.__name = name
    _G[name] = cls
    setmetatable(cls, {
        __call = function(class_table, ...)
            local obj = setmetatable({}, { __index = class_table })
            if obj.__init then
                obj:__init(...)
            end
            return obj
        end,
    })
    return cls
end

_G.New = function(name)
    local cls = _G[name]
    return function(...)
        return cls(...)
    end
end

_G.Delete = function(obj)
    if obj and obj.__del then
        obj:__del()
    end
end

_G.IsValid = function(obj)
    return obj ~= nil
end

_G.Extends = function(_class_name, _parent_name, _init)
end

_G.y3 = {
    json = {
        decode = function(_text)
            return {
                sign = 'bob-runtime-sign-secret',
            }
        end,
    },
    inspect = function(value)
        if type(value) ~= 'table' then
            return tostring(value)
        end
        local parts = {}
        for key, item in pairs(value) do
            parts[#parts + 1] = tostring(key) .. '=' .. tostring(item)
        end
        return '{' .. table.concat(parts, ',') .. '}'
    end,
    eca = {
        has_custom_event = function(name)
            return not not eca_call_impls[name]
        end,
        def = function(name)
            eca_names[#eca_names + 1] = name
            local definition = {
                name = name,
                params = {},
                returns = {},
            }
            eca_definitions[name] = definition
            local builder = definition
            function builder:with_param(param_name, param_type)
                self.params[#self.params + 1] = { param_name, param_type }
                return self
            end
            function builder:with_return(return_name, return_type)
                self.returns[#self.returns + 1] = { return_name, return_type }
                return self
            end
            function builder:call(fn)
                bind[name] = fn
                return self
            end
            return builder
        end,
        call = function(name)
            local fn = eca_call_impls[name]
            if not fn then
                error('missing event')
            end
            fn()
        end,
    },
    const = {
        CustomEventName = {},
    },
    ltimer = {
        wait = function(delay, callback)
            timeout_callbacks[#timeout_callbacks + 1] = callback
            local timer = {
                delay = delay,
                removed = false,
                remove = function(self)
                    self.removed = true
                end,
            }
            timeout_timers[#timeout_timers + 1] = timer
            return timer
        end,
        wait_frame = function(_, callback)
            frame_callbacks[#frame_callbacks + 1] = callback
            return { remove = function() end }
        end,
    },
    ctimer = {
        wait_frame = function(_, callback)
            local timer = {
                removed = false,
                remove = function(self)
                    self.removed = true
                end,
            }
            frame_callbacks[#frame_callbacks + 1] = function()
                if not timer.removed then
                    callback(timer, 1)
                end
            end
            return timer
        end,
    },
    player = {
        get_local = function()
            return {
                get_id = function()
                    return 1
                end,
                get_platform_id = function()
                    return 10086
                end,
                get_platform_name = function()
                    return 'lobby-contract-player'
                end,
                get_platform_icon_url = function()
                    return 'lobby-contract-icon'
                end,
                handle = {
                    api_get_role_store_params = function(_self)
                        return '{"sign":"bob-runtime-sign-secret"}'
                    end,
                },
            }
        end,
        with_local = function(callback)
            callback({
                handle = {
                    request_create_private_dungeon = function(_, ...)
                        local args = table.pack(...)
                        if platform_return_error then
                            error(platform_return_error)
                        end
                        private_dungeon_requests[#private_dungeon_requests + 1] = {
                            level_id = args[1],
                            game_mode = args[2],
                            max_player = args[3],
                            custom_param = args[4],
                            argc = args.n,
                        }
                    end,
                    request_join_private_dungeon = function()
                    end,
                },
                exit_game = function()
                    exit_game_calls = exit_game_calls + 1
                end,
            })
        end,
    },
}

local lobby = require 'y3.game.lobby'
local completion_listener = lobby.on_complete(function(payload)
    completion_payloads[#completion_payloads + 1] = payload
end)
local client = require 'y3.game.lobby.client'
local state_api = require 'y3.game.lobby.state'
local original_get_dungeon_info = GameAPI.get_dungeon_info
local original_game = y3.game
local endpoint_platform_env = 'prod'
local endpoint_debug_mode = false
local function get_endpoint_dungeon_info()
    return { env = endpoint_platform_env }
end
GameAPI.get_dungeon_info = get_endpoint_dungeon_info
-- 精简测试桩只实现本场景使用的 Game 接口。
---@diagnostic disable-next-line: missing-fields
y3.game = {
    is_debug_mode = function(_ignore_config)
        return endpoint_debug_mode
    end,
}
local explicit_pre_ip, _, explicit_pre_env = client._resolve_endpoint_for_test('pre')
assert_equal(explicit_pre_ip, '42.186.213.132', 'explicit pre endpoint uses the pre server address')
assert_equal(explicit_pre_env, 'pre', 'explicit endpoint_env selects pre outside debug mode')
local _, _, default_prod_env = client._resolve_endpoint_for_test()
assert_equal(default_prod_env, 'prod', 'missing endpoint_env follows platform environment')
endpoint_platform_env = 'pre'
local _, _, default_pre_env = client._resolve_endpoint_for_test()
assert_equal(default_pre_env, 'pre', 'platform pre environment remains pre by default')
endpoint_debug_mode = true
local debug_pre_ip, _, debug_pre_env = client._resolve_endpoint_for_test('pre')
assert_equal(debug_pre_ip, '42.186.215.253', 'debug mode always uses the qa server address')
assert_equal(debug_pre_env, 'qa', 'debug mode overrides explicit endpoint_env with qa')
local debug_default_ip, _, debug_default_env = client._resolve_endpoint_for_test()
assert_equal(debug_default_ip, '42.186.215.253', 'debug mode defaults to the qa server address')
assert_equal(debug_default_env, 'qa', 'missing endpoint_env still defaults to qa in debug mode')
GameAPI.get_dungeon_info = original_get_dungeon_info
y3.game = original_game
local function install_fake_factory()
client._set_factory_for_test(function(game_play_id, in_game, endpoint_env)
    factory_calls = factory_calls + 1
    factory_game_play_ids[#factory_game_play_ids + 1] = game_play_id
    factory_in_games[#factory_in_games + 1] = in_game
    factory_endpoint_envs[#factory_endpoint_envs + 1] = endpoint_env or false
    local options = next_client_options
    next_client_options = {}
    latest_client = {
        aid = 10086,
        client = {},
        event_callbacks = {},
        event_handles = {},
        cleanup_before_exit_calls = 0,
        start_calls = 0,
        set_score_callbacks = {},
        is_valid = function()
            return options.valid ~= false
        end,
        event_on = function(self, event_name, callback)
            self.event_callbacks[#self.event_callbacks + 1] = {
                name = event_name,
                callback = callback,
            }
            local handle = {
                removed = false,
                remove = function(this)
                    this.removed = true
                end,
            }
            self.event_handles[#self.event_handles + 1] = handle
            return handle
        end,
        start = function(self)
            self.start_calls = self.start_calls + 1
            return true
        end,
        cleanup_before_exit = function(self, callback)
            self.cleanup_before_exit_calls = self.cleanup_before_exit_calls + 1
            self.cleanup_before_exit_callback = callback
            if self.cleanup_before_exit_returns_false then
                return false
            end
            if options.cleanup_before_exit_immediate ~= nil then
                callback(options.cleanup_before_exit_immediate, options.cleanup_before_exit_reason)
            end
            return true
        end,
        set_score = function(self, score, callback)
            self.set_score_callbacks[#self.set_score_callbacks + 1] = {
                score = score,
                callback = callback,
            }
            return true
        end,
        is_in_team = function(self)
            return self.team_info ~= nil
        end,
        is_captain = function(self)
            return self.team_info ~= nil and self.team_info.captain == self.aid
        end,
        is_matching = function(self)
            return self.matching == true
        end,
        is_launching = function(self)
            return self.launching == true
        end,
        can_match = function(self)
            if self.can_match_result == false then
                return false, self.can_match_reason
            end
            return true
        end,
        create_team = function(self, callback, member_limit)
            self.create_team_callback = callback
            self.last_member_limit = member_limit
            return true
        end,
        join_team = function(self, team_id, callback)
            self.last_team_id = team_id
            self.join_team_callback = callback
            return true
        end,
        leave_team = function(self, callback)
            self.leave_team_callback = callback
            return true
        end,
        dismiss_team = function(self, callback)
            self.dismiss_team_callback = callback
            return true
        end,
        change_captain = function(self, target_aid, callback)
            self.last_target_aid = target_aid
            self.change_captain_callback = callback
            return true
        end,
        team_kick = function(self, target_aid, callback)
            self.last_target_aid = target_aid
            self.team_kick_callback = callback
            return true
        end,
        cancel_match = function(self, callback)
            self.cancel_match_callback = callback
            return true
        end,
        send_chat = function(self, message, callback)
            self.last_team_message = message
            self.send_chat_callback = callback
            return true
        end,
        start_match = function(self, game_mode, score, callback)
            self.last_match = { game_mode = game_mode, score = score }
            self.start_match_callback = callback
            return true
        end,
        get_team_info = function(self, aid, callback)
            self.last_get_team_info_aid = aid
            self.get_team_info_callback = callback
            return true
        end,
        get_player_info = function(self, aid, callback)
            self.last_get_player_info_aid = aid
            self.get_player_info_callback = callback
            return true
        end,
        refresh_player_info = function(self, callback)
            self.refresh_player_info_callback = callback
            return true
        end,
    }
    return latest_client
end)
end

local function emit_client_event(fake, event_name, ...)
    for _, record in ipairs(fake.event_callbacks or {}) do
        if record.name == event_name then
            record.callback(nil, ...)
            return
        end
    end
    error('missing fake client event: ' .. tostring(event_name))
end

install_fake_factory()

require 'y3.game.lobby.eca'

assert_equal(#eca_names, #expected_eca, 'ECA 接口数量')
for index, expected in ipairs(expected_eca) do
    assert_equal(eca_names[index], expected.name, 'ECA 接口名称 #' .. index)
    local definition = eca_definitions[expected.name]
    assert_equal(type(definition), 'table', 'ECA 定义存在 #' .. index)
    assert_equal(#definition.params, #expected.params, expected.name .. ' 参数数量')
    for param_index, param in ipairs(expected.params) do
        assert_equal(definition.params[param_index][1], param[1], expected.name .. ' 参数名称 #' .. param_index)
        assert_equal(definition.params[param_index][2], param[2], expected.name .. ' 参数类型 #' .. param_index)
    end
    assert_equal(#definition.returns, 1, expected.name .. ' 返回数量')
    assert_equal(definition.returns[1][2], 'table', expected.name .. ' 返回类型')
end
assert_equal(eca_definitions['大厅服务 - 同房分流'], nil, '旧同房分流 ECA 接口必须不存在')
assert_equal(eca_definitions['大厅服务 - 跨房合流'], nil, '旧跨房合流 ECA 接口必须不存在')
for _, function_name in ipairs({ 'same_room_split', 'cross_room_merge', 'start_private_dungeon' }) do
    assert_equal(lobby[function_name], nil, '旧 ' .. function_name .. ' Lua 接口必须不存在')
end
assert_equal(lobby._get_player_version_for_test(), '2.0', '玩家协议版本')
for _, function_name in ipairs({
    'on_event',
    'get_member',
    'get_chat_message',
    'get_team_info',
    'get_player_info',
    'refresh_player_info',
}) do
    assert_equal(type(lobby[function_name]), 'function', '公开 Lua 接口 ' .. function_name)
end

local before = lobby.get_state()
assert_equal(before.result_data.status, 'idle', '初始化状态')
assert_equal(factory_calls, 0, '初始化不创建客户端')

-- 故意违反公开签名，验证缺失参数仍返回拒绝结果。
---@diagnostic disable-next-line: missing-parameter
local invalid_connect_missing = lobby.connect()
assert_equal(invalid_connect_missing.accepted, false, 'connect 缺少玩法 ID 被拒绝')
assert_equal(invalid_connect_missing.code, 'invalid_game_play_id', 'connect 缺少玩法 ID code')
-- 故意传入字符串，验证运行时参数校验。
---@diagnostic disable-next-line: param-type-mismatch
local invalid_connect_string = lobby.connect(tostring(TEST_GAME_PLAY_ID))
assert_equal(invalid_connect_string.accepted, false, 'connect 字符串玩法 ID 被拒绝')
assert_equal(invalid_connect_string.code, 'invalid_game_play_id', 'connect 字符串玩法 ID code')
local invalid_connect_zero = lobby.connect(0)
assert_equal(invalid_connect_zero.accepted, false, 'connect 非正玩法 ID 被拒绝')
assert_equal(invalid_connect_zero.code, 'invalid_game_play_id', 'connect 非正玩法 ID code')
local invalid_connect_negative = lobby.connect(-1)
assert_equal(invalid_connect_negative.accepted, false, 'connect 负数玩法 ID 被拒绝')
assert_equal(invalid_connect_negative.code, 'invalid_game_play_id', 'connect 负数玩法 ID code')
-- 故意传入小数，验证整数约束。
---@diagnostic disable-next-line: param-type-mismatch
local invalid_connect_fraction = lobby.connect(10190356.5)
assert_equal(invalid_connect_fraction.accepted, false, 'connect 小数玩法 ID 被拒绝')
assert_equal(invalid_connect_fraction.code, 'invalid_game_play_id', 'connect 小数玩法 ID code')
assert_equal(factory_calls, 0, 'invalid connect 不创建客户端')

local return_without_connection = lobby.return_lobby({
    level_id = 'official-lobby',
    game_mode = 1201,
    max_player = 8,
    custom_param = 'official-param',
})
assert_equal(return_without_connection.accepted, true, 'return_lobby 未连接可执行')
assert_equal(factory_calls, 0, 'return_lobby 未连接不创建客户端')
assert_equal(#private_dungeon_requests, 1, 'return_lobby 未连接调用平台请求')
assert_equal(private_dungeon_requests[1].level_id, 'official-lobby', 'return_lobby 未连接 level_id')
assert_equal(private_dungeon_requests[1].custom_param, 'official-param', 'return_lobby 未连接 custom_param')
if #frame_callbacks > 0 then
    frame_callbacks[#frame_callbacks]()
end

local frames_before_exit_without_connection = #frame_callbacks
local completions_before_exit_without_connection = #completion_payloads
local exit_without_connection = lobby.exit_game()
assert_equal(exit_without_connection.accepted, true, 'exit_game 未连接可执行')
assert_equal(factory_calls, 0, 'exit_game 未连接不创建客户端')
assert_equal(exit_game_calls, 0, 'exit_game 未连接先返回再退出')
assert_equal(#frame_callbacks >= frames_before_exit_without_connection + 1, true, 'exit_game without connection schedules completion frame')
frame_callbacks[frames_before_exit_without_connection + 1]()
assert_equal(#completion_payloads, completions_before_exit_without_connection + 1, 'exit_game without connection publishes completion first')
assert_equal(completion_payloads[#completion_payloads].request_id, exit_without_connection.request_id, 'exit_game without connection completion request_id')
assert_equal(exit_game_calls, 0, 'exit_game without connection does not exit in completion frame')
assert_equal(#frame_callbacks >= frames_before_exit_without_connection + 2, true, 'exit_game without connection schedules exit frame')
frame_callbacks[frames_before_exit_without_connection + 2]()
assert_equal(exit_game_calls, 1, 'exit_game 未连接调用引擎退出一次')

local connect_result = lobby.connect(TEST_GAME_PLAY_ID)
assert_equal(connect_result.accepted, true, 'connect accepted')
assert_equal(factory_calls, 1, 'connect 创建客户端')
assert_equal(factory_game_play_ids[#factory_game_play_ids], TEST_GAME_PLAY_ID, 'connect forwards game_play_id to factory')
assert_equal(factory_endpoint_envs[#factory_endpoint_envs], false, 'connect defaults to the platform endpoint environment')
assert_equal(factory_in_games[#factory_in_games], false, 'connect 默认不按游戏关卡连接')

local duplicate = lobby.connect(TEST_GAME_PLAY_ID)
assert_equal(factory_calls, 1, 'connected 不重复创建客户端')
assert_equal(duplicate.result_data.connected, true, 'connected snapshot')

assert_equal(type(lobby.on_event), 'function', '公开 on_event 事件接口')
local event_payloads = {}
local all_event_payloads = {}
local connection_event_listener = lobby.on_event('connection_changed', function(payload)
    event_payloads[#event_payloads + 1] = payload
end)
local all_event_listener = lobby.on_event(function(payload)
    all_event_payloads[#all_event_payloads + 1] = payload
end)
latest_client.event_callbacks[3].callback(nil, 'disconnect')
local disconnected_payload = event_payloads[#event_payloads]
assert_equal(type(disconnected_payload), 'table', 'connection_changed 稳定载荷')
assert_equal(disconnected_payload.event, 'connection_changed', 'connection_changed 事件名')
assert_equal(disconnected_payload.source, 'lobby', 'connection_changed 来源')
assert_equal(disconnected_payload.status, 'disconnected', 'connection_changed 状态')
assert_equal(type(disconnected_payload.sequence), 'number', 'connection_changed 序号')
assert_equal(type(disconnected_payload.snapshot), 'table', 'connection_changed 快照')
local disconnected_event_count = #event_payloads
state_api.set_status('disconnected', 'updated diagnostic only')
assert_equal(#event_payloads, disconnected_event_count, '相同连接状态不因 reason 变化重复通知')
assert_equal(lobby.get_state().result_data.last_error, 'updated diagnostic only', 'same connection status reason updates snapshot last_error')

local failed_event_count_before_listener_error = 0
for _ in pairs(lobby.get_state().result_data.failed_events) do
    failed_event_count_before_listener_error = failed_event_count_before_listener_error + 1
end
local failing_event_listener = lobby.on_event('connection_changed', function()
    error('ordinary listener failed')
end)
state_api.set_status('failed', 'listener failure probe')
local failed_events_after_listener_error = lobby.get_state().result_data.failed_events
local failed_event_count_after_listener_error = 0
for _, failed_event in pairs(failed_events_after_listener_error) do
    failed_event_count_after_listener_error = failed_event_count_after_listener_error + 1
    if failed_event.payload and failed_event.payload.event == 'connection_changed' then
        assert_equal(tostring(failed_event.error):find('ordinary listener failed', 1, true) ~= nil, true, 'ordinary on_event listener error is recorded')
    end
end
assert_equal(failed_event_count_after_listener_error, failed_event_count_before_listener_error + 1, 'ordinary on_event listener failure writes failed_events')
failing_event_listener.remove()
state_api.set_status('disconnected', 'listener removed probe')
local failed_event_count_after_remove = 0
for _ in pairs(lobby.get_state().result_data.failed_events) do
    failed_event_count_after_remove = failed_event_count_after_remove + 1
end
assert_equal(failed_event_count_after_remove, failed_event_count_after_listener_error, 'removed failing on_event listener no longer affects events')

local team_event_payload
local team_event_listener = lobby.on_event('team_changed', function(payload)
    team_event_payload = payload
end)
local raw_team = {
    team_id = 77001,
    member_limit = 4,
    captain = 10086,
    team_state = '空闲',
    version = 3,
    internal_token = 'must-not-leak',
    members = {
        { aid = 10086, name = 'captain', score = 10, internal_token = 'member-secret' },
    },
}
emit_client_event(latest_client, '队伍变化', raw_team)
assert_equal(team_event_payload.data.team == raw_team, false, 'team_changed 不透传 BOB 原始队伍表')
assert_equal(team_event_payload.data.team.internal_token, nil, 'team_changed 移除内部队伍字段')
assert_equal(team_event_payload.data.team.members[1].internal_token, nil, 'team_changed 移除内部成员字段')
team_event_listener.remove()

local message_event_payload
local message_event_listener = lobby.on_event('message_received', function(payload)
    message_event_payload = payload
end)
local raw_message = {
    mode = '聊天',
    time = 123,
    message = 'hello',
    type = 4,
    chat = {
        sender = { aid = 10086, nickname = 'captain', head_icon = 'icon' },
        internal_token = 'chat-secret',
    },
}
emit_client_event(latest_client, '收到消息', raw_message)
assert_equal(message_event_payload.data.message == raw_message, false, 'message_received 不透传 BOB 原始消息表')
assert_equal(message_event_payload.data.message.chat, nil, 'message_received 移除内部聊天字段')
assert_equal(message_event_payload.data.message.sender.aid, 10086, 'message_received 保留公共发送者字段')
message_event_listener.remove()

local removed_event_count = #event_payloads
connection_event_listener.remove()
latest_client.event_callbacks[3].callback(nil, 'login')
assert_equal(#event_payloads, removed_event_count, 'on_event remove 后不再回调')
assert_equal(all_event_payloads[#all_event_payloads].event, 'connection_changed', 'on_event 全量监听器可接收事件')
all_event_listener.remove()

client._reset_for_test()
install_fake_factory()
local raw_game_api = rawget(_G, 'GameAPI')
local global_metatable = getmetatable(_G)
local injected_game_api = {
    get_dungeon_info = function()
        return {
            env = 'debug',
            level_id = 'metatable-level',
            space_id = 'current-dungeon-token',
        }
    end,
}
rawset(_G, 'GameAPI', nil)
setmetatable(_G, {
    __index = function(_, key)
        if key == 'GameAPI' then
            return injected_game_api
        end
        local inherited_index = global_metatable and global_metatable.__index
        if type(inherited_index) == 'function' then
            return inherited_index(_G, key)
        end
        if type(inherited_index) == 'table' then
            return inherited_index[key]
        end
        return nil
    end,
})
local in_game_connect = lobby.connect(TEST_GAME_PLAY_ID, true, 'pre')
assert_equal(factory_endpoint_envs[#factory_endpoint_envs], 'pre', 'connect forwards endpoint_env to client factory')
assert_equal(in_game_connect.accepted, true, 'connect 支持 in_game 布尔参数')
assert_equal(factory_in_games[#factory_in_games], true, 'connect 转发 in_game 到客户端工厂')
latest_client.event_callbacks[1].callback()
local metatable_token = lobby.get_token()
assert_equal(metatable_token.result_data.token, 'current-dungeon-token', 'get_token 支持元表注入的 GameAPI')
local metatable_snapshot = lobby.get_state().result_data
assert_equal(metatable_snapshot.token, 'current-dungeon-token', '状态快照支持元表注入的 GameAPI')
assert_equal(metatable_snapshot.level_id, 'metatable-level', '状态快照读取元表 GameAPI 的关卡信息')
local _, _, metatable_endpoint_env = client._resolve_endpoint_for_test()
assert_equal(metatable_endpoint_env, 'qa', '连接环境解析支持元表注入的 GameAPI')
local join_log_token = 'join-dungeon-token'
local join_log_result = lobby.join_by_token(' ' .. join_log_token .. ' ')
assert_equal(join_log_result.accepted, true, 'join_by_token 诊断日志测试请求已提交')
local private_dungeon_log_output = table.concat(captured_logs, '\n')
assert_contains(private_dungeon_log_output, '当前关卡口令', '游戏关卡准备就绪后记录当前关卡口令')
assert_contains(private_dungeon_log_output, 'token=current-dungeon-token', '当前关卡口令日志保留完整口令')
assert_contains(private_dungeon_log_output, '加入口令请求', '提交加入口令时记录诊断日志')
assert_contains(private_dungeon_log_output, 'token=<redacted>', '加入口令日志脱敏输入口令')
setmetatable(_G, global_metatable)
rawset(_G, 'GameAPI', raw_game_api)
client._reset_for_test()
install_fake_factory()
-- 故意使用不支持的 options 表，验证旧调用方式被拒绝。
---@diagnostic disable-next-line: param-type-mismatch
local table_options_connect = lobby.connect(TEST_GAME_PLAY_ID, { in_game = true })
assert_equal(table_options_connect.accepted, false, 'connect 不公开 options table')
assert_equal(table_options_connect.code, 'invalid_argument', 'connect options table code')
local factory_calls_before_invalid_endpoint = factory_calls
local invalid_endpoint_connect = lobby.connect(TEST_GAME_PLAY_ID, false, 'staging')
assert_equal(invalid_endpoint_connect.accepted, false, 'connect rejects unsupported endpoint_env')
assert_equal(invalid_endpoint_connect.code, 'invalid_argument', 'connect endpoint_env code')
assert_equal(factory_calls, factory_calls_before_invalid_endpoint, 'invalid endpoint_env does not create client')

local eca_connect_invalid = bind['大厅服务 - 建立连接']()
assert_equal(eca_connect_invalid.accepted, false, 'ECA connect 缺少玩法 ID 被拒绝')
assert_equal(eca_connect_invalid.code, 'invalid_game_play_id', 'ECA connect 缺少玩法 ID code')

eca_call_impls['大厅服务请求完成'] = nil
local not_connected_result = bind['大厅服务 - 发送世界聊天']('hello')
assert_equal(not_connected_result.code, 'event_missing', 'ECA 事件缺失预检')

local disconnect_setup = lobby.connect(TEST_GAME_PLAY_ID)
assert_equal(disconnect_setup.accepted, true, 'disconnect setup connect accepted')
latest_client.event_callbacks[3].callback(nil, 'disconnect')
assert_equal(lobby.get_state().result_data.status, 'disconnected', 'connected client disconnect updates status')
local disconnected_client = latest_client
local disconnected_requests = #private_dungeon_requests
local disconnected_return = lobby.return_lobby({
    level_id = 'official-disconnected-return',
    game_mode = 1201,
    max_player = 8,
})
assert_equal(disconnected_return.accepted, true, 'return_lobby accepts from disconnected status')
assert_equal(#private_dungeon_requests, disconnected_requests + 1, 'return_lobby submits platform request while disconnected')
assert_equal(client.get(), disconnected_client, 'return_lobby preserves disconnected client')
assert_equal(lobby.get_state().result_data.status, 'disconnected', 'return_lobby restores disconnected status')
local reconnect_after_disconnect = lobby.connect(TEST_GAME_PLAY_ID)
assert_equal(reconnect_after_disconnect.accepted, true, 'reconnect after disconnect accepted')
latest_client.event_callbacks[1].callback()
assert_equal(lobby.get_state().result_data.status, 'connected', 'reconnect after disconnect restores connected status')

local return_connected_before_requests = #private_dungeon_requests
local return_connected_before_completions = #completion_payloads
local return_connected_client = latest_client
local return_connected_cleanup_calls = latest_client.cleanup_before_exit_calls
latest_client.team_info = {
    team_id = 77221,
    captain = latest_client.aid,
    members = { { aid = latest_client.aid } },
}
local return_connected = lobby.return_lobby({
    level_id = 'official-connected-return',
    game_mode = 1202,
    max_player = 8,
})
assert_equal(return_connected.accepted, true, 'return_lobby connected accepted')
assert_equal(return_connected.result_data.platform_requested, true, 'return_lobby connected reports platform request')
assert_equal(return_connected.result_data.cross_map_tracking, 'degraded', 'return_lobby connected reports degraded tracking')
assert_equal(#private_dungeon_requests, return_connected_before_requests + 1, 'return_lobby connected requests platform immediately')
assert_equal(#completion_payloads, return_connected_before_completions, 'return_lobby connected does not publish completion')
assert_equal(return_connected.request_id, '', 'return_lobby does not expose awaitable request id')
assert_equal(latest_client.cleanup_before_exit_calls, return_connected_cleanup_calls, 'return_lobby does not run exit cleanup')
assert_equal(client.get(), return_connected_client, 'return_lobby preserves lobby client')
assert_equal(latest_client.team_info.team_id, 77221, 'return_lobby preserves cached team state')
assert_equal(lobby.get_state().result_data.status, 'connected', 'return_lobby preserves connected status')

local function reset_contract_runtime()
    client._reset_for_test()
    install_fake_factory()
    private_dungeon_requests = {}
    exit_game_calls = 0
    frame_callbacks = {}
    timeout_callbacks = {}
    timeout_timers = {}
    completion_payloads = {}
    latest_client = nil
    next_client_options = {}
    platform_return_error = false
end

local function drain_frames()
    while #frame_callbacks > 0 do
        local callbacks = frame_callbacks
        frame_callbacks = {}
        for _, callback in ipairs(callbacks) do
            callback()
        end
    end
end

local function count_completion(request_id, code)
    local count = 0
    local last
    for _, payload in ipairs(completion_payloads) do
        if payload.request_id == request_id and (not code or payload.code == code) then
            count = count + 1
            last = payload
        end
    end
    return count, last
end

local function assert_no_late_change(request_id, status_before, completion_count_before, message)
    local status = lobby.get_state().result_data.status
    assert_equal(status, status_before, message .. ' status')
    assert_equal(#completion_payloads, completion_count_before, message .. ' completion count')
    assert_equal(count_completion(request_id), 1, message .. ' original completion remains once')
end

local function trigger_saved_connect_callbacks(saved_client, saved_timeout_callback, request_id, stable_status, stable_completion_count)
    assert_equal(#saved_client.event_callbacks >= 3, true, 'pending connect captured ready/unavailable/status callbacks')
    saved_client.event_callbacks[1].callback()
    assert_no_late_change(request_id, stable_status, stable_completion_count, 'late ready no-op')
    saved_client.event_callbacks[2].callback(nil, 'late unavailable')
    assert_no_late_change(request_id, stable_status, stable_completion_count, 'late unavailable no-op')
    saved_client.event_callbacks[3].callback(nil, 'login')
    assert_no_late_change(request_id, stable_status, stable_completion_count, 'late login no-op')
    saved_client.event_callbacks[3].callback(nil, 'disconnect')
    assert_no_late_change(request_id, stable_status, stable_completion_count, 'late disconnect no-op')
    saved_timeout_callback()
    assert_no_late_change(request_id, stable_status, stable_completion_count, 'late timeout no-op')
end

local terminal_lock_params = {
    level_id = 'official-terminal-locked-return',
    game_mode = 1307,
    max_player = 8,
}

local function assert_terminal_locked(result, message)
    assert_equal(type(result), 'table', message .. ' result')
    assert_equal(result.accepted, false, message .. ' accepted')
    assert_equal(result.code, 'terminal_locked', message .. ' code')
end

local function assert_sync_invalid_without_platform(call, message)
    local requests_before = #private_dungeon_requests
    local status_before = lobby.get_state().result_data.status
    local result_value = call()
    assert_equal(type(result_value), 'table', message .. ' result')
    assert_equal(result_value.accepted, false, message .. ' accepted')
    assert_equal(result_value.code, 'invalid_argument', message .. ' code')
    assert_equal(result_value.sync, true, message .. ' sync')
    assert_equal(#private_dungeon_requests, requests_before, message .. ' no platform request')
    local snapshot = lobby.get_state().result_data
    assert_equal(snapshot.pending_count, 0, message .. ' no pending request')
    assert_equal(snapshot.status, status_before, message .. ' status unchanged')
end

local function assert_exit_terminal_settled(exit_result, completion_count_before, exit_calls_before, message)
    assert_equal(count_completion(exit_result.request_id, 'ok'), 1, message .. ' completion once')
    assert_equal(#completion_payloads, completion_count_before + 1, message .. ' no extra completions')
    assert_equal(exit_game_calls, exit_calls_before, message .. ' actual exit not in completion frame')
    assert_equal(#frame_callbacks, 1, message .. ' actual exit scheduled for next frame')
    frame_callbacks[1]()
    assert_equal(exit_game_calls, exit_calls_before + 1, message .. ' actual exit once')
    for index = 2, #frame_callbacks do
        frame_callbacks[index]()
    end
    assert_equal(exit_game_calls, exit_calls_before + 1, message .. ' no duplicate exit')
    assert_equal(lobby.get_state().result_data.status, 'idle', message .. ' final idle')
end

reset_contract_runtime()
local connected_for_error_contracts = lobby.connect(TEST_GAME_PLAY_ID)
assert_equal(connected_for_error_contracts.accepted, true, 'connect for stable error contracts accepted')
assert_equal(lobby.get_state().result_data.has_team, false, 'snapshot has_team false without cached team')
assert_equal(lobby.leave_team().code, 'not_in_team', 'leave_team local error code')
assert_equal(lobby.dismiss_team().code, 'not_in_team', 'dismiss_team local error code')
assert_equal(lobby.cancel_match().code, 'not_matching', 'cancel_match local error code')
assert_equal(lobby.send_team_chat('hello').code, 'not_in_team', 'send_team_chat local error code')

latest_client.team_info = {
    team_id = 88001,
    captain = 99001,
    members = {
        { aid = latest_client.aid },
        { aid = 99001 },
    },
}
assert_equal(lobby.get_state().result_data.has_team, true, 'snapshot has_team true with cached team')
assert_equal(lobby.dismiss_team().code, 'not_captain', 'dismiss_team captain error code')
assert_equal(lobby.change_captain(99002).code, 'not_captain', 'change_captain captain error code')

latest_client.team_info.captain = latest_client.aid
assert_equal(lobby.change_captain(99002).code, 'member_not_found', 'change_captain member error code')
assert_equal(lobby.kick_member(99002).code, 'member_not_found', 'kick_member member error code')

latest_client.matching = true
assert_equal(lobby.join_team(88002).code, 'state_conflict', 'join_team state error code')
assert_equal(lobby.leave_team().code, 'state_conflict', 'leave_team state error code')
latest_client.matching = false
latest_client.can_match_result = false
latest_client.can_match_reason = '有人在游戏中'
assert_equal(lobby.start_match({ level_id = 'error-contract', game_mode = 1401 }).code, 'state_conflict', 'start_match state error code')
latest_client.can_match_result = nil

local team_query = lobby.get_team_info(99003)
assert_equal(team_query.accepted, true, 'get_team_info no-team query accepted')
latest_client.get_team_info_callback(nil, nil)
local _, team_query_payload = count_completion(team_query.request_id)
assert_equal(team_query_payload.success, true, 'get_team_info no-team query succeeds')
assert_equal(team_query_payload.result_data.has_team, false, 'get_team_info no-team result flag')

latest_client.team_info = nil
local missing_player_query = lobby.get_player_info(99004)
assert_equal(missing_player_query.accepted, true, 'get_player_info missing query accepted')
latest_client.get_player_info_callback(nil, nil)
local _, missing_player_payload = count_completion(missing_player_query.request_id)
assert_equal(missing_player_payload.success, false, 'get_player_info missing query fails')
assert_equal(missing_player_payload.code, 'player_not_found', 'get_player_info missing code')

local remote_player_query = lobby.get_player_info(99005)
assert_equal(remote_player_query.accepted, true, 'get_player_info remote error query accepted')
latest_client.get_player_info_callback(nil, 'remote-string-error')
local _, remote_player_payload = count_completion(remote_player_query.request_id)
assert_equal(remote_player_payload.code, 'rpc_failed', 'get_player_info remote error code')
assert_equal(remote_player_payload.result_data.remote_error_code, 'remote-string-error', 'get_player_info preserves original remote error')

latest_client.chat_history = {
    alpha = {
        { sequence = 1, channel = 'alpha', message = 'one' },
        { sequence = 3, channel = 'alpha', message = 'three' },
        { time = 10, channel = 'alpha', message = 'time-ten-alpha' },
        { time = 20, channel = 'alpha', message = 'time-twenty-alpha' },
    },
    beta = {
        { sequence = 2, channel = 'beta', message = 'two' },
        { sequence = 4, channel = 'beta', message = 'four' },
        { time = 10, channel = 'beta', message = 'time-ten-beta' },
        { time = 10, channel = 'beta', message = 'time-ten-beta-stable' },
    },
}
latest_client.message_history = {}
local merged_history = lobby.get_chat_history().result_data.messages
assert_equal(merged_history[1].message, 'one', 'chat history order #1')
assert_equal(merged_history[2].message, 'two', 'chat history order #2')
assert_equal(merged_history[3].message, 'three', 'chat history order #3')
assert_equal(merged_history[4].message, 'four', 'chat history order #4')
assert_equal(merged_history[5].message, 'time-ten-alpha', 'chat history missing sequence time order #1')
assert_equal(merged_history[6].message, 'time-ten-beta', 'chat history missing sequence time order #2')
assert_equal(merged_history[7].message, 'time-ten-beta-stable', 'chat history missing sequence stable order')
assert_equal(merged_history[8].message, 'time-twenty-alpha', 'chat history missing sequence time order #4')

local saved_with_local = y3.player.with_local
reset_contract_runtime()
y3.player.with_local = function()
end
local split_without_player = lobby.private_dungeon({
    level_id = 'missing-player',
    game_mode = 1403,
    max_player = 2,
})
assert_equal(split_without_player.code, 'local_player_missing', 'private_dungeon missing local player code')
y3.player.with_local = saved_with_local

reset_contract_runtime()
local connected_for_argument_boundaries = lobby.connect(TEST_GAME_PLAY_ID)
assert_equal(connected_for_argument_boundaries.accepted, true, 'connect for argument boundary checks accepted')
assert_sync_invalid_without_platform(function()
    return lobby.return_lobby(nil)
end, 'return_lobby nil params')
assert_sync_invalid_without_platform(function()
    return lobby.return_lobby('bad')
end, 'return_lobby non-table params')
assert_sync_invalid_without_platform(function()
    return lobby.return_lobby({ level_id = '  ', game_mode = 1404, max_player = 2 })
end, 'return_lobby empty level_id')
assert_sync_invalid_without_platform(function()
    return lobby.return_lobby({ level_id = 'invalid-mode', game_mode = 1404.5, max_player = 2 })
end, 'return_lobby non-integer game_mode')
assert_sync_invalid_without_platform(function()
    return lobby.return_lobby({ level_id = 'invalid-max-player', game_mode = 1404, max_player = 0 })
end, 'return_lobby non-positive max_player')
assert_sync_invalid_without_platform(function()
    return lobby.private_dungeon({ level_id = 'explicit-players', game_mode = 1405, max_player = 2, players = {} })
end, 'private_dungeon rejects externally supplied players')
local solo_before_requests = #private_dungeon_requests
local solo_private = lobby.private_dungeon({
    level_id = 'solo-private',
    game_mode = 1405,
    max_player = 2,
})
assert_equal(solo_private.accepted, true, 'private_dungeon solo accepts without team')
assert_equal(#private_dungeon_requests, solo_before_requests + 1, 'private_dungeon solo calls platform')
assert_equal(private_dungeon_requests[#private_dungeon_requests].level_id, 'solo-private', 'private_dungeon solo forwards level_id')
assert_equal(private_dungeon_requests[#private_dungeon_requests].argc, 3, 'private_dungeon without custom_param uses three arguments')
assert_equal(solo_private.result_data.route, 'solo_engine', 'private_dungeon solo route')
assert_equal(solo_private.result_data.completion_mode, 'request_only', 'private_dungeon solo completion mode')
assert_equal(solo_private.request_id, '', 'private_dungeon solo has no awaitable request id')
assert_equal(lobby.get_state().result_data.pending_count, 0, 'private_dungeon solo leaves no pending request')
local solo_retry = lobby.private_dungeon({ level_id = 'solo-retry', game_mode = 1405, max_player = 2 })
assert_equal(solo_retry.accepted, true, 'private_dungeon solo remains retryable when platform does not switch map')
assert_equal(#private_dungeon_requests, solo_before_requests + 2, 'private_dungeon solo retry calls platform again')

latest_client.team_info = {
    team_id = 456,
    captain = latest_client.aid,
    members = {
        { aid = latest_client.aid, in_game = false },
    },
}
local one_member_before_requests = #private_dungeon_requests
assert_equal(lobby._private_dungeon_completion_mode_for_eca({}), 'request_only', 'one-member team uses request-only ECA route')
local one_member_private = lobby.private_dungeon({
    level_id = 'platform-one-member',
    engine_level_id = 'engine-one-member',
    game_mode = 1405,
    max_player = 2,
})
assert_equal(one_member_private.accepted, true, 'private_dungeon one-member team accepts through engine route')
assert_equal(#private_dungeon_requests, one_member_before_requests + 1, 'private_dungeon one-member team calls engine request')
assert_equal(private_dungeon_requests[#private_dungeon_requests].level_id, 'engine-one-member', 'private_dungeon one-member team forwards engine level id')
assert_equal(one_member_private.result_data.route, 'solo_engine', 'private_dungeon one-member team route')
assert_equal(one_member_private.result_data.completion_mode, 'request_only', 'private_dungeon one-member team completion mode')

reset_contract_runtime()
next_client_options = { valid = false }
local pending_return_connect = lobby.connect(TEST_GAME_PLAY_ID)
local pending_return_client = latest_client
local pending_return_timeout_callback = timeout_callbacks[#timeout_callbacks]
assert_equal(pending_return_connect.accepted, true, 'pending connect before return_lobby accepted')
assert_equal(lobby.get_state().result_data.status, 'connecting', 'pending connect status before return_lobby')
local pending_return = lobby.return_lobby({
    level_id = 'official-pending-return',
    game_mode = 1301,
    max_player = 8,
})
assert_equal(pending_return.accepted, true, 'return_lobby accepts while connect pending')
assert_equal(pending_return_client.cleanup_before_exit_calls, 0, 'return_lobby must not cleanup half-initialized pending client')
assert_equal(count_completion(pending_return_connect.request_id, 'cancelled_by_terminal'), 1, 'pending connect cancelled exactly once by return_lobby')
drain_frames()
assert_equal(count_completion(pending_return.request_id, 'ok'), 0, 'return_lobby does not publish completion after cancelling connect')
assert_equal(#private_dungeon_requests, 1, 'return_lobby terminal still requests platform once')
assert_equal(lobby.get_state().result_data.status, 'idle', 'return_lobby after pending connect ends idle')
assert_equal(client.get(), nil, 'return_lobby clears pending client')
for index, handle in ipairs(pending_return_client.event_handles) do
    assert_equal(handle.removed, true, 'return_lobby removes pending connect listener #' .. index)
end
trigger_saved_connect_callbacks(
    pending_return_client,
    pending_return_timeout_callback,
    pending_return_connect.request_id,
    lobby.get_state().result_data.status,
    #completion_payloads)

reset_contract_runtime()
next_client_options = { valid = false }
local pending_exit_connect = lobby.connect(TEST_GAME_PLAY_ID)
local pending_exit_client = latest_client
local pending_exit_timeout_callback = timeout_callbacks[#timeout_callbacks]
local pending_exit = lobby.exit_game()
assert_equal(pending_exit.accepted, true, 'exit_game accepts while connect pending')
assert_equal(pending_exit_client.cleanup_before_exit_calls, 0, 'exit_game must not cleanup half-initialized pending client')
assert_equal(count_completion(pending_exit_connect.request_id, 'cancelled_by_terminal'), 1, 'pending connect cancelled exactly once by exit_game')
drain_frames()
assert_equal(count_completion(pending_exit.request_id, 'ok'), 1, 'exit_game terminal completes after cancelling connect')
assert_equal(exit_game_calls, 1, 'exit_game after pending connect exits once on next frame')
assert_equal(lobby.get_state().result_data.status, 'idle', 'exit_game after pending connect ends idle')
assert_equal(client.get(), nil, 'exit_game clears pending client')
for index, handle in ipairs(pending_exit_client.event_handles) do
    assert_equal(handle.removed, true, 'exit_game removes pending connect listener #' .. index)
end
trigger_saved_connect_callbacks(
    pending_exit_client,
    pending_exit_timeout_callback,
    pending_exit_connect.request_id,
    lobby.get_state().result_data.status,
    #completion_payloads)

reset_contract_runtime()
local connected_for_operation = lobby.connect(TEST_GAME_PLAY_ID)
assert_equal(connected_for_operation.accepted, true, 'connect for pending operation accepted')
assert_equal(lobby.get_state().result_data.status, 'connected', 'connected before pending operation')
local pending_operation = lobby.set_score(123)
assert_equal(pending_operation.accepted, true, 'operation pending before terminal accepted')
local pending_operation_client = latest_client
local terminal_during_operation = lobby.return_lobby({
    level_id = 'official-operation-return',
    game_mode = 1302,
    max_player = 8,
})
assert_equal(terminal_during_operation.accepted, true, 'terminal bypasses ordinary operation lock')
assert_equal(count_completion(pending_operation.request_id, 'cancelled_by_terminal'), 1, 'ordinary operation cancelled exactly once by terminal')
assert_equal(pending_operation_client.cleanup_before_exit_calls, 0, 'return_lobby does not cleanup client during pending operation')
assert_equal(client.get(), pending_operation_client, 'return_lobby preserves client during pending operation')
assert_equal(lobby.get_state().result_data.status, 'connected', 'return_lobby restores connected status after cancelling operation')
assert_equal(count_completion(terminal_during_operation.request_id, 'ok'), 0, 'return_lobby does not complete after cancelling ordinary operation')
local after_operation_terminal_count = #completion_payloads
pending_operation_client.set_score_callbacks[1].callback(nil, nil)
assert_equal(#completion_payloads, after_operation_terminal_count, 'late ordinary operation callback is no-op after terminal cancellation')

reset_contract_runtime()
next_client_options = { valid = false }
local reentrant_connect = lobby.connect(TEST_GAME_PLAY_ID)
local reentrant_factory_before_terminal = factory_calls
local reentrant_result
local reentrant_listener = lobby.on_complete(function(payload)
    if payload.request_id == reentrant_connect.request_id and payload.code == 'cancelled_by_terminal' then
        reentrant_result = lobby.connect(TEST_GAME_PLAY_ID)
    end
end)
local reentrant_terminal = lobby.return_lobby({
    level_id = 'official-reentrant-return',
    game_mode = 1303,
    max_player = 8,
})
assert_equal(reentrant_terminal.accepted, true, 'terminal for reentrant listener accepted')
assert_equal(type(reentrant_result), 'table', 'cancel completion listener reentered connect')
assert_equal(reentrant_result.accepted, false, 'reentrant connect rejected while terminal closing')
assert_equal(reentrant_result.code, 'connection_closing', 'reentrant connect returns connection_closing')
assert_equal(factory_calls, reentrant_factory_before_terminal, 'reentrant connect does not create new client')
reentrant_listener.remove()
drain_frames()

reset_contract_runtime()
local connected_for_terminal_lock = lobby.connect(TEST_GAME_PLAY_ID)
assert_equal(connected_for_terminal_lock.accepted, true, 'connect for terminal lock accepted')
local retry_client = latest_client
local retry_cleanup_calls = latest_client.cleanup_before_exit_calls
local retry_requests_before = #private_dungeon_requests
local first_return = lobby.return_lobby({
    level_id = 'official-active-terminal',
    game_mode = 1304,
    max_player = 8,
})
local second_return = lobby.return_lobby({
    level_id = 'official-active-terminal',
    game_mode = 1304,
    max_player = 8,
})
assert_equal(first_return.accepted, true, 'first return_lobby request accepted')
assert_equal(second_return.accepted, true, 'return_lobby remains retryable')
assert_equal(#private_dungeon_requests, retry_requests_before + 2, 'return_lobby retry submits platform request again')
assert_equal(latest_client.cleanup_before_exit_calls, retry_cleanup_calls, 'return_lobby retry does not run exit cleanup')
assert_equal(client.get(), retry_client, 'return_lobby retry preserves client')
assert_equal(lobby.get_state().result_data.status, 'connected', 'return_lobby retry preserves connected status')

reset_contract_runtime()
local connected_for_completion_listener_lock = lobby.connect(TEST_GAME_PLAY_ID)
assert_equal(connected_for_completion_listener_lock.accepted, true, 'connect for completion listener terminal lock accepted')
local listener_lock_client = latest_client
local listener_lock_results
local listener_lock_exit = lobby.exit_game()
local listener_lock_completion_count_before = #completion_payloads
local listener_lock_exit_calls_before = exit_game_calls
local listener_lock = lobby.on_complete(function(payload)
    if payload.request_id == listener_lock_exit.request_id then
        listener_lock_results = {
            return_lobby = lobby.return_lobby(terminal_lock_params),
            return_lobby_nil = lobby.return_lobby(nil),
            exit_game = lobby.exit_game(),
        }
    end
end)
assert_equal(listener_lock_exit.accepted, true, 'exit_game before completion listener reentry accepted')
listener_lock_client.cleanup_before_exit_callback(true, nil)
assert_equal(type(listener_lock_results), 'table', 'completion listener reentered terminal requests')
assert_terminal_locked(listener_lock_results.return_lobby, 'return_lobby reentered in completion listener')
assert_terminal_locked(listener_lock_results.return_lobby_nil, 'return_lobby nil reentered in completion listener')
assert_terminal_locked(listener_lock_results.exit_game, 'exit_game reentered in completion listener')
assert_equal(#private_dungeon_requests, 0, 'completion listener reentry must not call platform return')
listener_lock.remove()
assert_exit_terminal_settled(listener_lock_exit, listener_lock_completion_count_before, listener_lock_exit_calls_before, 'completion listener terminal lock')

reset_contract_runtime()
local connected_for_same_frame_lock = lobby.connect(TEST_GAME_PLAY_ID)
assert_equal(connected_for_same_frame_lock.accepted, true, 'connect for same-frame terminal lock accepted')
local same_frame_client = latest_client
local same_frame_exit = lobby.exit_game()
local same_frame_completion_count_before = #completion_payloads
local same_frame_exit_calls_before = exit_game_calls
assert_equal(same_frame_exit.accepted, true, 'exit_game before same-frame reentry accepted')
same_frame_client.cleanup_before_exit_callback(true, nil)
assert_equal(count_completion(same_frame_exit.request_id, 'ok'), 1, 'same-frame setup completion published')
assert_terminal_locked(lobby.return_lobby(terminal_lock_params), 'return_lobby after completion before exit frame')
assert_terminal_locked(lobby.return_lobby(nil), 'return_lobby nil after completion before exit frame')
assert_terminal_locked(lobby.exit_game(), 'exit_game after completion before exit frame')
assert_equal(#private_dungeon_requests, 0, 'same-frame terminal reentry must not call platform return')
assert_exit_terminal_settled(same_frame_exit, same_frame_completion_count_before, same_frame_exit_calls_before, 'same-frame terminal lock')

reset_contract_runtime()
local connected_for_platform_failure = lobby.connect(TEST_GAME_PLAY_ID)
assert_equal(connected_for_platform_failure.accepted, true, 'connect for platform failure accepted')
platform_return_error = 'platform return failed'
local platform_failure = lobby.return_lobby({
    level_id = 'official-platform-failure',
    game_mode = 1306,
    max_player = 8,
})
assert_equal(platform_failure.accepted, false, 'return_lobby platform failure rejected synchronously')
assert_equal(platform_failure.code, 'request_error', 'return_lobby platform failure code')
local platform_failure_completion_count = count_completion(platform_failure.request_id)
assert_equal(platform_failure_completion_count, 0, 'platform failure does not fabricate return_lobby completion')
assert_equal(latest_client.cleanup_before_exit_calls, 0, 'platform failure does not run exit cleanup')
assert_equal(lobby.get_state().result_data.status, 'connected', 'platform failure preserves connected status')
assert_equal(client.get(), latest_client, 'platform failure preserves runtime client')

captured_logs = {}
require 'y3.game.lobby.bob'
local bob = New 'LobbyBob' (TEST_GAME_PLAY_ID)
assert_equal(bob.game_play_id, tostring(TEST_GAME_PLAY_ID), 'LobbyBob 使用传入玩法 ID')
assert_equal(bob.game_play_id_num, TEST_GAME_PLAY_ID, 'LobbyBob 数字玩法 ID')
bob._refreshing_player_info = true
bob._refresh_player_info_callbacks = {}
-- 白盒测试：验证内部刷新请求合并行为。
---@diagnostic disable-next-line: invisible
local merged_refresh = bob:refresh_player_info(function()
end)
assert_equal(merged_refresh, true, '已有玩家刷新请求时合并等待仍算受理')
assert_equal(#bob._refresh_player_info_callbacks, 1, '已有玩家刷新请求时保留新回调')
bob._refreshing_player_info = false

local propagated_player_error
-- 白盒测试：清空内部缓存以覆盖远端错误透传路径。
---@diagnostic disable-next-line: invisible
bob.player_infos = {}
bob.get_team_info = function(_, _, callback)
    callback(nil, 300123)
end
bob:get_player_info(99009, function(_, err)
    propagated_player_error = err
end)
assert_equal(propagated_player_error, 300123, 'get_player_info 透传 get_team_info 远端错误')

do
    local original_is_valid = IsValid
    local bob_valid = true
    ---@param value any
    ---@return boolean
    IsValid = function(value)
        if value == bob then
            return bob_valid
        end
        return original_is_valid(value)
    end
    local function get_version_check_dungeon_info()
        return { env = 'prod' }
    end
    GameAPI.get_dungeon_info = get_version_check_dungeon_info
    y3.json.decode = function(_text)
        return {
            ['2.0'] = {
                ['@metadata@'] = {
                    ['@displayversion@'] = '2.5.24.762647',
                },
            },
        }
    end

    local function begin_version_check(local_version, injection_status)
        local scenario = {
            completion_count = 0,
            need_update = nil,
            first_frame_index = #frame_callbacks + 1,
        }
        local remote_callback
        -- 精简测试桩只实现版本检查所需接口。
        ---@diagnostic disable-next-line: missing-fields
        y3.game = {
            is_debug_mode = function(_ignore_config)
                return false
            end,
            request_url = function(_, _, _, callback, _options)
                remote_callback = callback
            end,
        }
        _G['_SVN_VERSION'] = local_version
        _G['_SVN_VERSION_INJECTION_STATUS'] = injection_status
        bob_valid = true
        bob:check_update(function(need_update)
            scenario.completion_count = scenario.completion_count + 1
            scenario.need_update = need_update
        end)
        assert_equal(type(remote_callback), 'function', '版本检查发起远端请求')
        remote_callback('{}')
        return scenario
    end

    local pending = begin_version_check(nil, 'pending')
    assert_equal(pending.completion_count, 0, '本地版本注入 pending 时不应完成版本检查')
    assert_equal(type(frame_callbacks[pending.first_frame_index]), 'function', '本地版本注入 pending 时等待下一客户端帧')
    _G['_SVN_VERSION'] = '2.5.24.762647'
    _G['_SVN_VERSION_INJECTION_STATUS'] = 'ok'
    frame_callbacks[pending.first_frame_index]()
    assert_equal(pending.completion_count, 1, '本地版本注入完成后只完成一次版本检查')
    assert_equal(pending.need_update, false, '本地与远端版本一致时无需更新')
    frame_callbacks[pending.first_frame_index]()
    assert_equal(pending.completion_count, 1, '重复客户端帧回调不能重复完成版本检查')

    local stale = begin_version_check('stale-version', 'pending')
    assert_equal(stale.completion_count, 0, '注入 pending 时不能使用残留的旧版本')
    _G['_SVN_VERSION'] = '2.5.24.762647'
    _G['_SVN_VERSION_INJECTION_STATUS'] = 'ok'
    frame_callbacks[stale.first_frame_index]()
    assert_equal(stale.completion_count, 1, '残留版本被新注入覆盖后完成检查')
    assert_equal(stale.need_update, false, '新注入版本一致时无需更新')

    local destroyed = begin_version_check(nil, 'pending')
    local callbacks_before_destroy = #frame_callbacks
    bob_valid = false
    frame_callbacks[destroyed.first_frame_index]()
    assert_equal(destroyed.completion_count, 0, 'BOB 销毁后不再完成版本检查')
    assert_equal(#frame_callbacks, callbacks_before_destroy, 'BOB 销毁后不再继续等待版本注入')

    local exhausted = begin_version_check(nil, 'pending')
    for index = exhausted.first_frame_index, exhausted.first_frame_index + 149 do
        frame_callbacks[index]()
    end
    assert_equal(exhausted.completion_count, 1, '版本注入等待耗尽后完成检查')
    assert_equal(exhausted.need_update, false, '版本注入等待耗尽后按 fail-open 继续')

    local failed = begin_version_check(nil, 'failed: test')
    assert_equal(failed.completion_count, 1, '版本注入失败时立即完成检查')
    assert_equal(failed.need_update, false, '版本注入失败时按 fail-open 继续')
    IsValid = original_is_valid
end

local client_api = require 'y3.game.lobby.service.client'
local raw_client = client_api.new_client('127.0.0.1', 8092, 10086, 'client-runtime-token-secret', TEST_GAME_PLAY_ID)
raw_client:login_auth()
local log_output = table.concat(captured_logs, '\n')
assert_not_contains(log_output, 'bob-runtime-sign-secret', 'BOB 初始化日志不能包含原始 sign')
assert_not_contains(log_output, 'client-runtime-token-secret', '客户端日志不能包含原始 token')

completion_listener.remove()
do
    ---@type ECAHelper
    local eca_helper = dofile('util/eca_helper.lua')
    local calls = 0
    local event_name = 'lobby-contract-query'
    assert_equal(eca_helper.has_custom_event(event_name), false, 'ECA query rejects unregistered events')
    -- 模拟引擎注册事件，验证公开查询不会触发回调。
    ---@diagnostic disable-next-line: invisible
    eca_helper.register_custom_event_impl(event_name, function()
        calls = calls + 1
    end)
    assert_equal(eca_helper.has_custom_event(event_name), true, 'ECA query finds registered events')
    assert_equal(eca_helper.has_custom_event('missing-event'), false, 'ECA query checks the requested name')
    assert_equal(calls, 0, 'ECA query does not invoke the event')
    eca_helper.call(event_name)
    assert_equal(calls, 1, 'ECA query preserves event invocation')
end

print('lobby_contract ok')
