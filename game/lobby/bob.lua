local work = require 'y3.game.lobby.service.client'

---@diagnostic disable-next-line: deprecated
local local_player = y3.player.get_local()
---@enum(key) Bob.PlayerState
local player_state = {
    ['空闲'] = 1,
    ['匹配中'] = 2,
    ['游戏中'] = 3,
}

---@enum(key) Bob.TeamState
local team_state = {
    ['空闲'] = 1,
    ['匹配中'] = 2,
}

---@enum(key) Bob.LeaveReason
local leave_reason = {
    ['离开'] = 1,
    ['踢出'] = 2,
    ['解散'] = 3,
}

---@alias Bob.State
---| 'none'
---| 'connecting'
---| 'connected'
---| 'disconnect'
---| 'login'

---@class LobbyBob: CustomEvent, GCHost
---@field chat_event? Trigger
---@field event_on fun(self: LobbyBob, event: '准备就绪', callback: fun(trg: Trigger)): Trigger
---@field event_on fun(self: LobbyBob, event: '匹配服务不可用', callback: fun(trg: Trigger, reason: any)): Trigger
---@field event_on fun(self: LobbyBob, event: '在线状态变化', callback: fun(trg: Trigger, state: Bob.State)): Trigger
---@field event_on fun(self: LobbyBob, event: '匹配状态变化', callback: fun(trg: Trigger, state: boolean)): Trigger
---@field event_on fun(self: LobbyBob, event: '启动状态变化', callback: fun(trg: Trigger, state: boolean)): Trigger
---@field event_on fun(self: LobbyBob, event: '收到消息', callback: fun(trg: Trigger, data: LobbyBob.ChatInfo)): Trigger
---@field event_on fun(self: LobbyBob, event: '队伍变化', callback: fun(trg: Trigger, data: LobbyBob.TeamInfo)): Trigger
---@field event_on fun(self: LobbyBob, event: '加入队伍', callback: fun(trg: Trigger, data: LobbyBob.TeamInfo?)): Trigger
---@field event_on fun(self: LobbyBob, event: '离开队伍', callback: fun(trg: Trigger, reason: Bob.LeaveReason, last_team_info: LobbyBob.TeamInfo)): Trigger
---@field event_on fun(self: LobbyBob, event: '有人加入队伍', callback: fun(trg: Trigger, data: LobbyBob.PlayerInfo)): Trigger
---@field event_on fun(self: LobbyBob, event: '有人离开队伍', callback: fun(trg: Trigger, data: LobbyBob.PlayerInfo)): Trigger
---@field event_on fun(self: LobbyBob, event: '客户端需要更新', callback: fun(trg: Trigger)): Trigger
---@overload fun(game_play_id: integer):LobbyBob
local M = Class 'LobbyBob'

local CHANNEL_OP_JOIN = 2
local WORLD_CHANNEL_TYPE = 5
local WORLD_CHANNEL_ID = 10000
local EXIT_CLEANUP_STEP_TIMEOUT = 2
local VERSION_INJECTION_MAX_WAIT_FRAMES = 150

Extends('LobbyBob', 'CustomEvent')
Extends('LobbyBob', 'GCHost')

---@type Bob.State
M.state = 'none'

---@type string
M.ip = ''
---@type integer
M.port = 0
---@type string
M.token = nil

--我的分数
M.score = 0

---@alias Bob.ChatType '聊天' | '系统'

---@class LobbyBob.ChatInfo
---@field mode Bob.ChatType
---@field time integer
---@field message string
---@field chat? LobbyBob.ChatData

local function to_positive_integer(value)
    if type(value) ~= 'number' then
        return nil
    end
    local ok, integer = pcall(math.tointeger, value)
    if ok and integer and integer > 0 then
        return integer
    end
    return nil
end

function M:__init(game_play_id)
    log.debug('【BOB】正在初始化bob')
    local valid_game_play_id = to_positive_integer(game_play_id)
    if not valid_game_play_id then
        error('invalid_game_play_id')
    end
    --我的平台唯一id
    self.aid = local_player:get_platform_id()
    log.debug('【BOB】aid:', self.aid)
    --我的昵称
    self.name = local_player:get_platform_name()
    log.debug('【BOB】name:', self.name)
    --我的头像
    self.icon = local_player:get_platform_icon_url()
    log.debug('【BOB】icon:', self.icon)
    --我的商城token
    pcall(function()
        local store_params = local_player.handle:api_get_role_store_params()
        if store_params ~= '' then
            self.token = y3.json.decode(store_params).sign
        end
        log.debug('【BOB】token:', self.token and '<redacted>' or '<missing>')
    end)
    local dungeon_info = GameAPI.get_dungeon_info and GameAPI.get_dungeon_info() or nil
    self.map_id = dungeon_info and tostring(dungeon_info.map_id) or ''
    log.debug('【BOB】map_id:', self.map_id)
    self.game_play_id = tostring(valid_game_play_id)
    self.game_play_id_num = valid_game_play_id
    log.debug('【BOB】game_play_id:', self.game_play_id)
    self.level_id = dungeon_info and dungeon_info.level_id or ''
    log.debug('【BOB】level_id:', self.level_id)
    --缓存请求回包处理
    ---@private
    self.request_handlers = {}
    --收到的聊天
    ---@type LobbyBob.ChatInfo[]
    self.message_history = {}
    --已知的玩家信息
    ---@private
    ---@type table<integer, LobbyBob.PlayerInfo>
    self.player_infos = {}

    -- 官方库不绑定项目 UI；聊天展示由项目自行订阅“收到消息”事件处理。
end

function M:__del()
    if self.client then
        Delete(self.client)
    end
    if self.chat_event then
        self.chat_event:remove()
    end
end

---@private
M._in_game = false

---@param in_game boolean
function M:set_in_game(in_game)
    log.debug('【BOB】设置游戏状态：', in_game)
    self._in_game = in_game
end

function M:start()
    if not IsValid(self) then
        return
    end
    log.debug('【BOB】启动匹配系统')
    self:check_update(function(need_update)
        if need_update then
            log.debug('【BOB】启动失败：客户端需要更新')
            self:event_notify('客户端需要更新')
        else
            if not IsValid(self) then
                return
            end
            --真正的客户端对象
            ---@private
            local ok, client = pcall(work.new_client, self.ip, self.port, self.aid, self.token, self.game_play_id_num)
            if not ok then
                log.warn('【BOB】启动失败：自定义协议不可用，匹配与RPC功能已禁用', client)
                self:event_notify('匹配服务不可用', client)
                return
            end
            self.client = client
            self:register_methods()
            self.client:start()
        end
    end)
end

---@private
function M:login()
    log.debug('【BOB】开始登录')
    self:request_login(function(result, err)
        if err then
            log.debug('【BOB】登录错误：', y3.inspect(err))
            return
        end
        self:get_team_info(self.aid, function(result, team_err)
            if team_err then
                log.warn('【BOB】登录后获取队伍信息失败：', team_err)
                return
            end
            self.team_info = result
            self:refresh_player_info(function(_, refresh_err)
                if refresh_err then
                    log.warn('【BOB】登录后更新玩家信息失败：', refresh_err)
                    return
                end
                log.debug('【BOB】发起事件：准备就绪')
                self:event_notify('准备就绪')
            end)
        end)
    end)
end

---@return boolean
function M:is_valid()
    return self.state == 'login'
end

---@private
---@type fun(msg: string)?
M.error_handler = nil

---@param handler fun(msg: string, errid: integer)
function M:set_error_handler(handler)
    self.error_handler = handler
end

---@alias Bob.Receiver fun(result: any, err: any): boolean?

---@private
function M:get_request_handler(id)
    if not self.request_handlers[id] then
        local handler = {
            id = id,
            map = {},
        }
        self.request_handlers[id] = handler
        handler.callback = function(errid, data, arg)
            local receiver = handler.last_receiver
            handler.last_receiver = nil
            if not receiver then
                if handler.token_getter then
                    local token = handler.token_getter(arg.arg1)
                    receiver = handler.map[token]
                    handler.map[token] = nil
                end
            end
            if not receiver then
                log.warn('【BOB】收到无接收者回包，忽略：', id)
                return
            end
            if errid ~= 1 then
                local suc, ignore = xpcall(receiver, log.error, nil, errid)
                if suc and ignore then
                else
                    local msg = string.format('【BOB】请求[%s]失败，error_id = %s', id, errid)
                    log.warn(msg)
                    if self.error_handler then
                        xpcall(self.error_handler, log.error, msg, errid)
                    end
                end
            elseif type(data.ret1) == 'table'
                and ((data.ret1.errnu and data.ret1.errnu ~= 0) or (data.ret1.error_code and data.ret1.error_code ~= 0)) then
                local err = data.ret1.errnu or data.ret1.error_code
                local suc, ignore = xpcall(receiver, log.error, nil, err)
                if suc and ignore then
                else
                    local msg = string.format('【BOB】请求[%s]失败，err = %s, data = %s', id, err, tostring(data.ret1.data))
                    log.warn(msg)
                    if self.error_handler then
                        xpcall(self.error_handler, log.error, msg, err)
                    end
                end
            else
                log.debug('【BOB】请求成功：', id, '返回值：', y3.inspect(data))
                xpcall(receiver, log.error, data.ret1, nil)
            end
        end
    end
    return self.request_handlers[id]
end

---@private
---@param id string
---@return boolean
function M:can_request(id)
    local handler = self:get_request_handler(id)
    if handler.last_receiver then
        return false
    end
    return true
end

---@private
---@param id string
---@param sender fun()
---@param receiver Bob.Receiver
---@return boolean
function M:request(id, sender, receiver)
    log.debug('【BOB】发起请求', id)
    if not self:can_request(id) then
        log.debug('【BOB】请求失败：', '不能重入')
        receiver(nil, '请求不能重入')
        return false
    end
    local handler = self:get_request_handler(id)
    handler.last_receiver = receiver
    sender()
    return true
end

---@private
---@generic T
---@param id string
---@param sender fun()
---@param receiver Bob.Receiver
---@param token T
---@param token_getter fun(request_data: any):T
function M:request_with_token(id, sender, receiver, token, token_getter)
    log.debug('【BOB】发起请求(带token)', id, token and '<redacted>' or '<missing>')
    local handler = self:get_request_handler(id)
    handler.map[token] = receiver
    handler.token_getter = token_getter
    sender()
end

_G['_SVN_VERSION'] = nil
_G['_SVN_VERSION_INJECTION_STATUS'] = 'pending'
log.info('[LobbyVersionDiag] lua injection submitted',
    'lua_globals=', tostring(_G),
    'local=', tostring(_G['_SVN_VERSION']),
    'injection=', tostring(_G['_SVN_VERSION_INJECTION_STATUS']))
---@diagnostic disable-next-line: redundant-parameter, undefined-field
GameAPI.visual_pyexec([[
import clients.G as G

lua_globals = G.black_box.lua_rt.globals()
local_version = None
try:
    import shipping
    local_version = shipping.CUR_SVN_VERSION
    lua_globals['_SVN_VERSION'] = local_version
    lua_globals['_SVN_VERSION_INJECTION_STATUS'] = 'ok' if local_version is not None else 'empty'
except Exception as error:
    lua_globals['_SVN_VERSION_INJECTION_STATUS'] = 'failed: ' + str(error)
python_runtime_id = hex(id(lua_globals))
lua_globals['_SVN_VERSION_INJECTION_RUNTIME_ID'] = python_runtime_id
print(
    '[LobbyVersionDiag] python injection executed'
    f' | lua_globals_id={python_runtime_id}'
    f' | local={local_version!r}'
    f' | local_type={type(local_version).__name__}'
    f" | injection={lua_globals['_SVN_VERSION_INJECTION_STATUS']}"
)
]])

local function log_version_observation(stage, bob, local_version, injection_status)
    log.info('[LobbyVersionDiag] lua version observed',
        'stage=', stage,
        'lua_globals=', tostring(_G),
        'python_lua_globals_id=', tostring(_G['_SVN_VERSION_INJECTION_RUNTIME_ID']),
        'player=', tostring(local_player),
        'player_id=', tostring(local_player:get_id()),
        'aid=', tostring(bob and bob.aid),
        'level_id=', tostring(bob and bob.level_id),
        'local=', tostring(local_version),
        'local_type=', type(local_version),
        'injection=', tostring(injection_status))
end

---检查客户端是否需要更新
---@param callback fun(need_update: boolean)
function M:check_update(callback)
    local completed = false
    local injection_wait_timer
    local function cancel_injection_wait()
        if injection_wait_timer then
            injection_wait_timer:remove()
            injection_wait_timer = nil
        end
    end
    local function finish(need_update)
        if completed then
            return false
        end
        if not IsValid(self) then
            completed = true
            cancel_injection_wait()
            return false
        end
        completed = true
        cancel_injection_wait()
        callback(need_update)
        return true
    end

    local local_version = _G['_SVN_VERSION']
    local injection_status = _G['_SVN_VERSION_INJECTION_STATUS'] or 'unknown'
    log_version_observation('check-start', self, local_version, injection_status)
    if y3.game.is_debug_mode(true) then
        log.info('【BOB】【版本检查】result=skip-debug',
            'local=', tostring(local_version),
            'local_type=', type(local_version),
            'injection=', tostring(injection_status))
        finish(false)
        return
    end
    local dungeon_info = GameAPI.get_dungeon_info()
    local env = dungeon_info and dungeon_info.env or nil
    if env ~= 'prod' then
        log.info('【BOB】【版本检查】result=skip-non-prod',
            'env=', tostring(env),
            'local=', tostring(local_version),
            'local_type=', type(local_version),
            'injection=', tostring(injection_status))
        finish(false)
        return
    end

    log.info('【BOB】【版本检查】result=requesting-remote',
        'env=', tostring(env),
        'local=', tostring(local_version),
        'local_type=', type(local_version),
        'injection=', tostring(injection_status))

    local remote_version
    local injection_waited_frames = 0
    local compare_versions
    compare_versions = function()
        if completed then
            return
        end
        if not IsValid(self) then
            finish(false)
            return
        end
        local_version = _G['_SVN_VERSION']
        injection_status = _G['_SVN_VERSION_INJECTION_STATUS'] or 'unknown'
        if injection_status == 'pending' then
            if injection_waited_frames < VERSION_INJECTION_MAX_WAIT_FRAMES
                and y3.ctimer
                and y3.ctimer.wait_frame then
                injection_waited_frames = injection_waited_frames + 1
                injection_wait_timer = y3.ctimer.wait_frame(1, function()
                    injection_wait_timer = nil
                    compare_versions()
                end)
                return
            end
            log.warn('【BOB】【版本检查】result=local-version-injection-timeout',
                'policy=allow',
                'waited_frames=', tostring(injection_waited_frames))
            finish(false)
            return
        end
        if local_version == nil or tostring(local_version) == '' then
            log.warn('【BOB】【版本检查】result=local-version-unavailable',
                'policy=allow',
                'waited_frames=', tostring(injection_waited_frames),
                'injection=', tostring(injection_status))
            finish(false)
            return
        end
        if remote_version == nil or tostring(remote_version) == '' then
            log.warn('【BOB】【版本检查】result=remote-version-missing',
                'policy=allow',
                'local=', tostring(local_version),
                'injection=', tostring(injection_status))
            finish(false)
            return
        end

        local need_update = local_version ~= remote_version
        local result
        if need_update and tostring(local_version) == tostring(remote_version) then
            result = 'version-type-mismatch'
        elseif need_update then
            result = 'client-version-mismatch'
        else
            result = 'version-match'
        end

        local version_log = need_update and log.warn or log.info
        version_log('【BOB】【版本检查】result=' .. result,
            'need_update=', tostring(need_update),
            'local=', tostring(local_version),
            'local_type=', type(local_version),
            'remote=', tostring(remote_version),
            'remote_type=', type(remote_version),
            'injection=', tostring(injection_status),
            'waited_frames=', tostring(injection_waited_frames))
        finish(need_update)
    end

    y3.game:request_url('https://up5.update.netease.com/pl/patchmd5_windows64_produp5_release.txt', nil, function(body)
        if completed then
            return
        end
        if not IsValid(self) then
            finish(false)
            return
        end
        local_version = _G['_SVN_VERSION']
        injection_status = _G['_SVN_VERSION_INJECTION_STATUS'] or 'unknown'
        log_version_observation('remote-response', self, local_version, injection_status)
        if not body then
            log.warn('【BOB】【版本检查】result=remote-request-empty',
                'policy=allow',
                'local=', tostring(local_version),
                'local_type=', type(local_version),
                'injection=', tostring(injection_status))
            finish(false)
            return
        end
        local decode_ok, data = pcall(y3.json.decode, body)
        if not decode_ok then
            log.error('【BOB】【版本检查】result=remote-parse-failed',
                'error=', tostring(data),
                'local=', tostring(local_version),
                'injection=', tostring(injection_status))
            finish(false)
            return
        end
        local read_ok, decoded_remote_version = pcall(function()
            return data['2.0']['@metadata@']['@displayversion@']
        end)
        if not read_ok then
            log.error('【BOB】【版本检查】result=remote-version-read-failed',
                'error=', tostring(decoded_remote_version),
                'local=', tostring(local_version),
                'injection=', tostring(injection_status))
            finish(false)
            return
        end
        remote_version = decoded_remote_version
        compare_versions()
    end, { timeout = 5 })
end

---@private
---@param done Bob.Receiver
function M:request_login(done)
    log.debug('【BOB】请求登录')
    self:request('Team_Login', function()
        ---@type PlayerInfo
        local data = {
            aid = self.aid,
            head_icon = self.icon,
            name = self.name,
            state = 0,
            score = self.score,
            map_id = self.map_id,
            in_game = self._in_game,
            game_play_id = self.game_play_id_num,
        }
        log.debug('【BOB】Team_Login', y3.inspect(data))
        self.client:Team_Login(data)
    end, function(result, err)
        if err then
            done(nil, err)
            return
        end
        self:subscribe_world_chat(function(_, subscribe_err)
            if subscribe_err then
                done(nil, subscribe_err)
                return
            end
            done(result, nil)
        end)
    end)
end

---@private
---@param done Bob.Receiver
function M:subscribe_world_chat(done)
    self:request('Chat_UpdateChannel', function()
        self.client:ApiRouter_UpdateChannel(
            CHANNEL_OP_JOIN,
            WORLD_CHANNEL_TYPE,
            WORLD_CHANNEL_ID,
            { self.aid },
            self.game_play_id_num
        )
    end, function(result, err)
        if err then
            done(nil, err)
            return
        end
        if result ~= nil and result ~= 0 and result ~= 'default_ErrCode' then
            done(nil, result)
            return
        end
        done(result, nil)
    end)
end

---@private
---@param done? fun(result: any?, err: any?)
---@return boolean
function M:refresh_player_info(done)
    log.debug('【BOB】请求更新玩家信息')
    if self._refreshing_player_info then
        log.debug('【BOB】更新玩家信息已在请求中，等待已有回包')
        if done then
            self._refresh_player_info_callbacks = self._refresh_player_info_callbacks or {}
            self._refresh_player_info_callbacks[#self._refresh_player_info_callbacks + 1] = done
        end
        return true
    end
    ---@type PlayerInfo
    local data = {
        aid = self.aid,
        head_icon = self.icon,
        name = self.name,
        state = 0,
        score = self.score,
        map_id = self.map_id,
        in_game = self._in_game,
        game_play_id = self.game_play_id_num,
    }
    self._refreshing_player_info = true
    self._refresh_player_info_callbacks = done and { done } or {}
    local finished = false
    local timeout
    local finish = function(result, err)
        if finished then
            return
        end
        finished = true
        if timeout then
            timeout:remove()
        end
        self._refreshing_player_info = false
        log.debug('【BOB】更新玩家信息回包', y3.inspect({ result = result, err = err }))
        local callbacks = self._refresh_player_info_callbacks or {}
        self._refresh_player_info_callbacks = {}
        for _, callback in ipairs(callbacks) do
            xpcall(callback, log.error, result, err)
        end
    end
    timeout = y3.ltimer.wait(3, function()
        -- 保留占位接收器，避免迟到回包被下一次刷新请求错误消费。
        finish(nil, 'timeout')
        if self.client and not self._exiting then
            self.client:reconnect('玩家信息刷新超时')
        end
    end)
    self:request('Team_UpdatePlayerInfo', function()
        log.debug('【BOB】Team_UpdatePlayerInfo', y3.inspect(data))
        self.client:Team_UpdatePlayerInfo(data)
    end, finish)
    return true
end

---删除服务端玩家信息。
---@param done? fun(result: any?, err: any?)
---@return boolean, string?
function M:delete_player_info(done)
    if not self.client then
        local reason = '客户端未连接'
        if done then done(nil, reason) end
        return false, reason
    end
    return self:request('Team_DelPlayerInfo', function()
        log.debug('【BOB】Team_DelPlayerInfo', self.aid)
        self.client:Team_DelPlayerInfo(self.aid)
    end, function(result, err)
        log.debug('【BOB】删除玩家信息回包', y3.inspect({ result = result, err = err }))
        if done then done(result, err) end
    end)
end

---在真正退出游戏前串行取消匹配、离队并删除玩家信息。
---@param done? fun(ok: boolean, reason: string?)
---@param step_timeout? number
---@return boolean started
function M:cleanup_before_exit(done, step_timeout)
    self._exit_cleanup_callbacks = self._exit_cleanup_callbacks or {}
    if done then
        self._exit_cleanup_callbacks[#self._exit_cleanup_callbacks + 1] = done
    end
    if self._exit_cleanup_active then
        return false
    end

    self._exiting = true
    self._exit_cleanup_active = true
    local cleanup = {
        finished = false,
        errors = {},
        timer = nil,
        matching_trigger = nil,
        leave_trigger = nil,
    }
    self._exit_cleanup = cleanup
    step_timeout = step_timeout or EXIT_CLEANUP_STEP_TIMEOUT

    local function record_error(reason)
        if reason then
            cleanup.errors[#cleanup.errors + 1] = tostring(reason)
        end
    end

    local function cancel_timer()
        if cleanup.timer then
            cleanup.timer:remove()
            cleanup.timer = nil
        end
    end

    local function remove_trigger(name)
        local trigger = cleanup[name]
        if trigger then
            trigger:remove()
            cleanup[name] = nil
        end
    end

    local function arm_timeout(stage, callback)
        cancel_timer()
        cleanup.timer = y3.ltimer.wait(step_timeout, function()
            cleanup.timer = nil
            record_error(stage .. '-timeout')
            callback()
        end)
    end

    local function finish()
        if cleanup.finished then
            return
        end
        cleanup.finished = true
        cancel_timer()
        remove_trigger('matching_trigger')
        remove_trigger('leave_trigger')

        self.team_info = nil
        if self.player_infos then
            self.player_infos[self.aid] = nil
        end
        self._matching_state = false
        self._is_launching = false
        self._exit_cleanup_active = false
        self._exit_cleanup = nil

        if self.client and self.client.close then
            self.client:close('exit cleanup')
        end

        local callbacks = self._exit_cleanup_callbacks
        self._exit_cleanup_callbacks = {}
        local reason = #cleanup.errors > 0 and table.concat(cleanup.errors, ',') or nil
        for _, callback in ipairs(callbacks) do
            xpcall(callback, log.error, reason == nil, reason)
        end
    end

    local delete_player_info
    local leave_team
    local cancel_match

    delete_player_info = function()
        if cleanup.finished then return end
        local completed = false
        local function complete(err)
            if completed or cleanup.finished then return end
            completed = true
            cancel_timer()
            if err then record_error('delete-player:' .. tostring(err)) end
            finish()
        end
        arm_timeout('delete-player', function()
            complete()
        end)
        local sent, err = self:delete_player_info(function(_, request_err)
            complete(request_err)
        end)
        if sent == false then
            complete(err or 'request-failed')
        end
    end

    leave_team = function()
        if cleanup.finished then return end
        remove_trigger('matching_trigger')
        if not self:is_in_team() then
            delete_player_info()
            return
        end

        local completed = false
        local function complete(err)
            if completed or cleanup.finished then return end
            completed = true
            cancel_timer()
            remove_trigger('leave_trigger')
            if err then record_error('leave-team:' .. tostring(err)) end
            delete_player_info()
        end

        cleanup.leave_trigger = self:event_on('离开队伍', function()
            complete()
        end)
        arm_timeout('leave-team', function()
            complete()
        end)
        local sent, err = self:leave_team(function(_, request_err)
            if request_err then complete(request_err) end
        end, true)
        if sent == false then
            complete(err or 'request-failed')
        end
    end

    cancel_match = function()
        if cleanup.finished then return end
        if not self:is_matching() then
            leave_team()
            return
        end

        local completed = false
        local function complete(err)
            if completed or cleanup.finished then return end
            completed = true
            cancel_timer()
            remove_trigger('matching_trigger')
            if err then record_error('cancel-match:' .. tostring(err)) end
            leave_team()
        end

        cleanup.matching_trigger = self:event_on('匹配状态变化', function(_, matching)
            if not matching then complete() end
        end)
        arm_timeout('cancel-match', function()
            complete()
        end)
        local sent, err = self:cancel_match(function(_, request_err)
            if request_err then complete(request_err) end
        end)
        if sent == false then
            complete(err or 'request-failed')
        end
    end

    cancel_match()
    return true
end

--创建队伍
---@param done? fun(result: any?, err: any?) # 创建完成后调用
---@param member_limit integer # 队伍人数限制
function M:create_team(done, member_limit)
    log.debug('【BOB】尝试创建队伍')
    member_limit = member_limit or 8
    self:check_update(function(need_update)
        if need_update then
            log.debug('【BOB】创建队伍失败：客户端需要更新')
            if done then done(nil, '客户端需要更新') end
        else
            self:request('Team_CreateTeam', function()
                log.debug('【BOB】Team_CreateTeam', self.aid)
                self.client:Team_CreateTeam(self.aid, member_limit)
            end, function(result, err)
                log.debug('【BOB】创建队伍回包', y3.inspect({ result = result, err = err }))
                if done then done(result, err) end
            end)
        end
    end)
end

--离开队伍
---@param done? fun(result: any?, err: any?) # 离开完成后调用
---@param force? boolean # 仅退出清理使用，允许在匹配或启动状态下请求离队
---@return boolean, string?
function M:leave_team(done, force)
    log.debug('【BOB】尝试离开队伍')
    if not force and (self:is_matching() or self:is_launching()) then
        local reason = '正在匹配中或启动中'
        log.debug('【BOB】离开队伍失败：' .. reason)
        if done then done(nil, reason) end
        return false, reason
    end
    return self:request('Team_LeaveTeam', function()
        log.debug('【BOB】Team_LeaveTeam', self.aid)
        self.client:Team_LeaveTeam(self.aid)
    end, function(result, err)
        log.debug('【BOB】离开队伍回包', y3.inspect({ result = result, err = err }))
        if done then
            done(result, err)
        end
    end)
end

--加入队伍
---@param team_id integer
---@param done? fun(result: any?, err: any?) # 加入完成后调用
---@return boolean?, string?
function M:join_team(team_id, done)
    log.debug('【BOB】尝试加入队伍', team_id)
    if self:is_matching() or self:is_launching() then
        local reason = '正在匹配中或启动中'
        log.debug('【BOB】加入队伍失败：' .. reason)
        if done then done(nil, reason) end
        return false, reason
    end
    self:check_update(function(need_update)
        if need_update then
            log.debug('【BOB】加入队伍失败：客户端需要更新')
            if done then done(nil, '客户端需要更新') end
        else
            self:request('Team_JoinTeam', function()
                log.debug('【BOB】Team_JoinTeam', self.aid, team_id)
                self.client:Team_JoinTeam(self.aid, team_id)
            end, function(result, err)
                log.debug('【BOB】加入队伍回包', y3.inspect({ result = result, err = err }))
                if done then done(result, err) end
            end)
        end
    end)
end

--解散队伍
---@param done? fun(ok?: boolean, err?: string) # 解散完成后调用
---@return boolean, string?
function M:dismiss_team(done)
    log.debug('【BOB】尝试解散队伍')
    if not self:is_in_team() then
        log.debug('【BOB】解散队伍失败：当前不在队伍中')
        if done then done(false, '当前不在队伍中') end
        return false, '当前不在队伍中'
    end
    if not self:is_captain() then
        log.debug('【BOB】解散队伍失败：当前玩家不是队长')
        if done then done(false, '只有队长可以解散队伍') end
        return false, '只有队长可以解散队伍'
    end
    if self:is_matching() or self:is_launching() then
        log.debug('【BOB】解散队伍失败：正在匹配中或启动中')
        if done then done(false, '匹配或启动中不能解散队伍') end
        return false, '匹配或启动中不能解散队伍'
    end
    self:request('Team_DismissTeam', function()
        log.debug('【BOB】Team_DismissTeam', self.aid)
        self.client:Team_DismissTeam(self.aid)
    end, function(result, err)
        log.debug('【BOB】解散队伍回包', y3.inspect({ result = result, err = err }))
        if done then
            done(true)
        end
    end)
    return true
end

--踢出队伍
---@param lick_aid integer
---@param done? fun(result: any?, err: any?)
---@return boolean, string?
function M:team_kick(lick_aid, done)
    log.debug('【BOB】尝试踢出队伍', lick_aid)
    local target_aid = math.tointeger(lick_aid)
    if not self:is_in_team() or not self:is_captain() then
        local reason = '只有队长可以移除成员'
        log.debug('【BOB】踢出队伍失败：', reason)
        if done then done(nil, reason) end
        return false, reason
    end
    if self:is_matching() or self:is_launching() then
        local reason = '匹配或启动中不能移除成员'
        log.debug('【BOB】踢出队伍失败：', reason)
        if done then done(nil, reason) end
        return false, reason
    end
    if not target_aid or target_aid == math.tointeger(self.aid) then
        local reason = '移除目标无效'
        log.debug('【BOB】踢出队伍失败：', reason)
        if done then done(nil, reason) end
        return false, reason
    end
    local found = false
    for _, member in ipairs(self.team_info.members or {}) do
        if math.tointeger(member.aid) == target_aid then
            found = true
            break
        end
    end
    if not found then
        local reason = '目标玩家不在当前队伍中'
        log.debug('【BOB】踢出队伍失败：', reason)
        if done then done(nil, reason) end
        return false, reason
    end
    self:request('Team_TeamKick', function()
        log.debug('【BOB】Team_TeamKick', self.aid, target_aid)
        self.client:Team_TeamKick(self.aid, target_aid)
    end, function(result, err)
        log.debug('【BOB】踢出队伍回包', y3.inspect({ result = result, err = err }))
        if done then done(result, err) end
    end)
    return true
end

--转移队长
---@param new_leader_aid integer
---@param done? fun(result: any?, err: any?) # 转移完成后调用
---@return boolean, string?
function M:change_captain(new_leader_aid, done)
    log.debug('【BOB】尝试转移队长', new_leader_aid)
    local target_aid = math.tointeger(new_leader_aid)
    if not self:is_in_team() or not self:is_captain() then
        local reason = '只有队长可以转移队长'
        log.debug('【BOB】转移队长失败：', reason)
        if done then done(nil, reason) end
        return false, reason
    end
    if self:is_matching() or self:is_launching() then
        local reason = '匹配或启动中不能转移队长'
        log.debug('【BOB】转移队长失败：', reason)
        if done then done(nil, reason) end
        return false, reason
    end
    if not target_aid or target_aid == math.tointeger(self.aid) then
        local reason = '转移目标无效'
        log.debug('【BOB】转移队长失败：', reason)
        if done then done(nil, reason) end
        return false, reason
    end
    local found = false
    for _, member in ipairs(self.team_info.members or {}) do
        if math.tointeger(member.aid) == target_aid then
            found = true
            break
        end
    end
    if not found then
        local reason = '目标玩家不在当前队伍中'
        log.debug('【BOB】转移队长失败：', reason)
        if done then done(nil, reason) end
        return false, reason
    end
    self:request('Team_ChangeTeamLeader', function()
        log.debug('【BOB】Team_ChangeTeamLeader', self.aid, target_aid)
        self.client:Team_ChangeTeamLeader(self.aid, target_aid)
    end, function(result, err)
        log.debug('【BOB】转移队长回包', y3.inspect({ result = result, err = err }))
        if done then
            done(result, err)
        end
    end)
    return true
end

--多开战场
function M:create_multi_battle_space(battle_info)
    log.debug('【BOB】尝试多开战场', y3.inspect(battle_info))
    self.client:BattleCreate_CreateMultiBattleSpace(battle_info)
end

---@class LobbyBob.PlayerInfo
---@field aid integer
---@field head_icon string
---@field name string
---@field team_id integer
---@field score integer
---@field state Bob.PlayerState

---@class LobbyBob.TeamInfo
---@field member_limit integer
---@field team_id integer
---@field team_state Bob.TeamState
---@field captain integer
---@field members LobbyBob.PlayerInfo[]
---@field version integer

function M:convert_player_info(player_info)
    if player_info.in_game then
        player_info.state = '游戏中'
    else
        for key, state in pairs(player_state) do
            if state == player_info.state then
                player_info.state = key
                break
            end
        end
    end
    self.player_infos[player_info.aid] = player_info
end

---@private
---@param team_info table
---@return LobbyBob.TeamInfo
function M:convert_team_info(team_info)
    for key, state in pairs(team_state) do
        if state == team_info.state then
            team_info.team_state = key
            break
        end
    end
    for _, player_info in ipairs(team_info.members) do
        self:convert_player_info(player_info)
    end
    return team_info
end

--获取队伍信息
---@param aid integer
---@param response fun(result: LobbyBob.TeamInfo?, err: any?)
function M:get_team_info(aid, response)
    log.debug('【BOB】请求队伍信息', aid)
    self:request_with_token('Team_GetTeamInfoByAid', function()
        log.debug('【BOB】Team_GetTeamInfoByAid', aid)
        self.client:Team_GetTeamInfoByAid(aid)
    end, function(result, err)
        if not result then
            --PLAYER_HAS_NO_TEAM
            if err == 1402 then
                log.debug('【BOB】玩家没有队伍')
                response(nil, nil)
                return true
            end
            log.debug('【BOB】获取队伍信息失败：', y3.inspect(err))
            response(nil, err)
            return
        end
        local team_info = self:convert_team_info(result.team_info)
        log.debug('【BOB】获取队伍信息成功：', y3.inspect(team_info))
        response(team_info)
    end, aid, function(arg)
        return arg
    end)
end

--获取玩家信息
---@param aid integer
---@param done fun(result: LobbyBob.PlayerInfo?, err: any?)
function M:get_player_info(aid, done)
    log.debug('【BOB】请求玩家信息', aid)
    if self.player_infos[aid] then
        log.debug('【BOB】从缓存中掏出玩家信息', y3.inspect(self.player_infos[aid]))
        done(self.player_infos[aid], nil)
        return
    end
    log.debug('【BOB】将通过队伍信息获取玩家信息', aid)
    self:get_team_info(aid, function(_, err)
        if err then
            done(nil, err)
            return
        end
        log.debug('【BOB】获取玩家信息成功：', y3.inspect(self.player_infos[aid]))
        done(self.player_infos[aid], nil)
    end)
end

--是否可以匹配
---@return boolean
---@return ('不是队长' | '正在匹配' | '失去连接' | '有人在游戏中' | '有人在匹配' | '正在启动')?
function M:can_match()
    if self.team_info and not self:is_captain() then
        return false, '不是队长'
    end
    if self:is_matching() then
        return false, '正在匹配'
    end
    if self:is_launching() then
        return false, '正在启动'
    end
    if not self:is_valid() then
        return false, '失去连接'
    end
    if self.team_info then
        for _, member in ipairs(self.team_info.members) do
            if member.state == '游戏中' then
                return false, '有人在游戏中'
            end
            if member.state == '匹配中' then
                return false, '有人在匹配'
            end
        end
    end
    return true
end

---@param players DungeonPlayerField[]?
---@return boolean
---@return ('当前不在队伍中' | '不是队长' | '正在匹配' | '失去连接' | '有人在匹配' | '正在启动' | '没有合格玩家')?
function M:can_start_private_dungeon_filtered(players)
    if not self:is_in_team() then
        return false, '当前不在队伍中'
    end
    if not self:is_captain() then
        return false, '不是队长'
    end
    if self:is_matching() then
        return false, '正在匹配'
    end
    if self:is_launching() then
        return false, '正在启动'
    end
    if not self:is_valid() then
        return false, '失去连接'
    end
    if type(players) ~= 'table' or #players == 0 then
        return false, '没有合格玩家'
    end
    local selected = {}
    for _, player in ipairs(players) do
        selected[tostring(player.aid)] = true
    end
    for _, member in ipairs(self.team_info and self.team_info.members or {}) do
        if selected[tostring(member.aid)] and member.state == '匹配中' then
            return false, '有人在匹配'
        end
    end
    return true
end

---@private
M._matching_state = false

---@private
function M:update_matching_state()
    local matching_state = self:is_matching()
    if matching_state == self._matching_state then
        return false
    end
    self._matching_state = matching_state
    log.debug('【BOB】匹配状态变化：', local_player, matching_state)
    self:event_notify('匹配状态变化', matching_state)
    return true
end

--是否正在匹配
function M:is_matching()
    if self.team_info then
        if self.team_info.team_state == '匹配中' then
            return true
        else
            return false
        end
    else
        local self_info = self.player_infos[self.aid]
        if self_info and self_info.state == '匹配中' then
            return true
        end
    end
    return false
end

---@private
M._is_launching = false

---是否正在启动游戏
function M:is_launching()
    return self._is_launching
end

---@private
---@param game_mode integer # 匹配成功后进入的游戏模式
---@param score integer? # 匹配分数，默认使用平均分
---@param done? fun(result: any?, err: any?)
function M:_start_match(game_mode, score, done)
    ---@private
    self:update_matching_state()
    log.debug('【BOB】开始请求匹配')
    self:request('Match_startMatch', function()
        ---@type MatchInfo
        local match_info = {
            map_id = self.map_id,
            level_id = self.level_id,
            game_mode = game_mode,
            game_play_id = self.game_play_id,
        }
        if self.team_info then
            log.debug('【BOB】在队伍中')
            if not score then
                score = 0
                for _, player_info in ipairs(self.team_info.members) do
                    score = score + player_info.score
                end
                score = score // #self.team_info.members
                log.debug('【BOB】没有设置分数，使用队伍平均分', score)
            end
            log.debug('【BOB】Match_startMatch', self.team_info.team_id, score, true, y3.inspect(match_info))
            self.client:Match_startMatch(self.team_info.team_id, score, true, match_info)
        else
            log.debug('【BOB】不在队伍中')
            log.debug('【BOB】Match_startMatch', self.aid, score or self.score, false, y3.inspect(match_info))
            self.client:Match_startMatch(self.aid, score or self.score, false, match_info)
        end
    end, function(result, err)
        log.debug('【BOB】开始匹配回包', y3.inspect({ result = result, err = err }))
        if done then done(result, err) end
    end)
end

--开始匹配
---@param game_mode integer # 匹配成功后进入的游戏模式
---@param score integer? # 匹配分数，默认使用平均分
---@param done? fun(result: any?, err: any?)
---@return boolean, string?
function M:start_match(game_mode, score, done)
    log.debug('【BOB】尝试开始匹配', game_mode, score)
    local can_match, reason = self:can_match()
    if not can_match then
        log.debug('【BOB】开始匹配失败：', reason)
        if done then done(nil, reason) end
        return false, reason
    end
    self:check_update(function(need_update)
        if need_update then
            log.debug('【BOB】开始匹配失败：客户端需要更新')
            if done then done(nil, '客户端需要更新') end
        else
            self:_start_match(game_mode, score, done)
        end
    end)
    return true
end

--取消匹配
---@param done? fun(result: any?, err: any?) # 取消完成后调用
---@return boolean
function M:cancel_match(done)
    log.debug('【BOB】尝试取消匹配')
    return self:request('Match_cancelMatch', function()
        log.debug('【BOB】Match_cancelMatch', self.team_info and self.team_info.team_id or self.aid)
        self.client:Match_cancelMatch(self.team_info and self.team_info.team_id or self.aid)
    end, function(result, err)
        log.debug('【BOB】取消匹配回包', y3.inspect({ result = result, err = err }))
        if done then
            done(result, err)
        end
    end)
end

---@private
---@param message string
---@param chat_type integer
---@param channel_id integer
---@param done? fun(result: any?, err: any?)
---@return boolean, string?
function M:send_chat_to_channel(message, chat_type, channel_id, done)
    local send_ok, send_err
    local accepted = self:request('Chat_SendChatMsg', function()
        send_ok, send_err = self.client:ApiRouter_SendChatMsg(
            self.aid,
            message,
            chat_type,
            channel_id,
            0)
    end, done or function()
    end)
    if not accepted then
        return false, '请求不能重入'
    end
    if send_ok == false then
        self:get_request_handler('Chat_SendChatMsg').last_receiver = nil
        if done then done(nil, send_err) end
        return false, send_err
    end
    return true
end

--发送聊天消息
---@param message string
---@param done? fun(result: any?, err: any?)
---@return boolean, string?
function M:send_chat(message, done)
    log.debug('【BOB】发送聊天消息', message)
    if not self.team_info or not self.team_info.team_id or self.team_info.team_id == 0 then
        return false, '当前不在队伍中'
    end
    return self:send_chat_to_channel(message, 4, self.team_info.team_id, done)
end

--发送世界聊天消息
---@param message string
---@param done? fun(result: any?, err: any?)
---@return boolean, string?
function M:send_world_chat(message, done)
    log.debug('【BOB】发送世界聊天消息', message)
    return self:send_chat_to_channel(message, WORLD_CHANNEL_TYPE, WORLD_CHANNEL_ID, done)
end

--多人局内私人副本：players 由业务层按 team_info.members 全量构建。
---@param dungeon_info DungeonSpaceField
---@param players DungeonPlayerField[] 每项只包含字符串 aid 和固定 version '2.0'
---@param done? fun(result: any?, err: any?)
---@return boolean, string?
function M:start_private_dungeon_game_filtered(dungeon_info, players, done)
    local can_start, reason = self:can_start_private_dungeon_filtered(players)
    if not can_start then
        return false, reason
    end
    log.debug('【BOB】发送局内私人副本消息', string.format(
        'game_play_id=%s game_map_id=%s level_id=%s game_mode=%s player_count=%d',
        tostring(self.game_play_id or ''),
        tostring(dungeon_info and dungeon_info.game_map_id or ''),
        tostring(dungeon_info and dungeon_info.level_id or ''),
        tostring(dungeon_info and dungeon_info.game_mode or ''),
        #players))
    local send_ok, send_err
    local accepted = self:request('DungeonManager_StartMatchPrivateDungeonGame', function()
        send_ok, send_err = self.client:DungeonManager_StartMatchPrivateDungeonGame(dungeon_info, players)
    end, done or function()
    end)
    if not accepted then
        return false, '请求不能重入'
    end
    if send_ok == false then
        self:get_request_handler('DungeonManager_StartMatchPrivateDungeonGame').last_receiver = nil
        if done then done(nil, send_err) end
        return false, send_err
    end
    return true
end

--格式化聊天消息
---@param chat_data LobbyBob.ChatInfo
---@return string
function M:format_message(chat_data)
    if chat_data.mode == '系统' then
        return string.format('[%s]<系统>: %s'
        , os.date('%H:%M:%S', chat_data.time)
        , chat_data.message)
    else
        local chat_type = {
            [4] = '房',
            [5] = '世',
        }
        return string.format('[%s][%s]<#fafe06%s#E>: %s'
        , os.date('%H:%M:%S', chat_data.time)
        , chat_type[chat_data.chat.chat_type]
        , chat_data.chat.sender.nickname
        , chat_data.message)
    end
end

--发送系统消息
---@param message string
function M:display_message(message)
    local message_info = {
        mode    = '系统',
        message = message,
        time    = os.time(),
    }
    self.message_history[#self.message_history + 1] = message_info
    log.debug('【BOB】收到<系统>消息', y3.inspect(message_info))
    self:event_notify('收到消息', message_info)
end

--我是否在队伍中
function M:is_in_team()
    return self.team_info ~= nil
end

--我是否是队长
function M:is_captain()
    if not self.team_info then
        return false
    end
    return self.team_info.captain == self.aid
end

--修改自己的分数
---@param score integer
---@param done? fun(result: any?, err: any?)
---@return boolean
function M:set_score(score, done)
    log.debug('[BOB] set score', score)
    self.score = score
    if self.state == 'login' then
        self:refresh_player_info(done)
        return true
    else
        self:event_on('准备就绪', function(trg)
            trg:remove()
            self:refresh_player_info(done)
        end)
        return true
    end
end

---@class LobbyBob.ChatData
---@field sender ChatSender # 发送者信息
---@field chat_message string # 聊天消息
---@field chat_time integer # 时间戳
---@field chat_type integer # 信息类型

---@private
---@param chat_data LobbyBob.ChatData
---@return LobbyBob.ChatInfo
function M:record_chat(chat_data)
    local message_info = {
        mode    = '聊天',
        message = chat_data.chat_message,
        time    = chat_data.chat_time,
        type    = chat_data.chat_type,
        chat    = chat_data,
    }
    self.message_history[#self.message_history + 1] = message_info
    log.debug('【BOB】记录<聊天>消息', y3.inspect(message_info))
    self:event_notify('收到消息', message_info)
    return message_info
end

---@private
---@param message string
---@param chat_type integer
function M:display_local_chat(message, chat_type)
    self:record_chat({
        sender = {
            aid = self.aid,
            nickname = self.name,
            head_icon = self.icon,
        },
        chat_message = message,
        chat_time = os.time(),
        chat_type = chat_type,
    })
end

---@private
function M:notify_chat(data)
    ---@type LobbyBob.ChatData
    local chat_data = data.arg1
    if chat_data.sender and chat_data.sender.aid == self.aid then
        log.debug('【BOB】忽略已由成功回包显示的自身聊天消息', y3.inspect(chat_data))
        return
    end
    self:record_chat(chat_data)
end

---@private
function M:notify_update_team_info(data)
    local old_team_info = self.team_info
    log.debug('【BOB】收到新的队伍信息', y3.inspect(data.arg1.team_info))
    log.debug('【BOB】当前的队伍信息', y3.inspect(old_team_info))

    if old_team_info and old_team_info.version > data.arg1.team_info.version then
        log.debug('【BOB】新的队伍信息版本过低，忽略')
        return
    end

    --当前所在的队伍信息
    local new_team_info = self:convert_team_info(data.arg1.team_info)
    self.team_info = new_team_info
    log.debug('【BOB】触发队伍变化', y3.inspect(new_team_info))
    self:event_notify('队伍变化', new_team_info)

    if not old_team_info or old_team_info.team_id ~= new_team_info.team_id then
        log.debug('【BOB】触发加入队伍')
        self:event_notify('加入队伍')
        return
    end

    local old_members = {}
    local new_members = {}
    if old_team_info then
        for _, member in ipairs(old_team_info.members) do
            old_members[member.aid] = true
        end
    end
    for _, member in ipairs(new_team_info.members) do
        new_members[member.aid] = true
    end

    if old_team_info then
        for _, member in ipairs(old_team_info.members) do
            if not new_members[member.aid] and member.aid ~= self.aid then
                log.debug('【BOB】触发有人离开队伍', y3.inspect(member))
                self:event_notify('有人离开队伍', member)
            end
        end
    end

    for _, member in ipairs(new_team_info.members) do
        if not old_members[member.aid] and member.aid ~= self.aid then
            log.debug('【BOB】触发有人加入队伍', y3.inspect(member))
            self:event_notify('有人加入队伍', member)
        end
    end
end

---@private
function M:notify_leave_team(data)
    log.debug('【BOB】收到离开队伍通知', y3.inspect(data))
    local last_team_info = self.team_info
    self.team_info = nil
    local reason = '未知'
    if data.arg1 == 1 then
        reason = '离开'
    elseif data.arg1 == 2 then
        reason = '踢出'
    elseif data.arg1 == 3 then
        reason = '解散'
    end
    log.debug('【BOB】触发离开队伍', reason, y3.inspect(last_team_info))
    self:event_notify('离开队伍', reason, last_team_info)
    self:update_matching_state()
end

---@private
function M:notify_player_info(data)
    ---@type PlayerInfo
    local player_info = data.arg1
    self:convert_player_info(player_info)
    log.debug('【BOB】收到玩家信息', y3.inspect(player_info))
    self:update_matching_state()

    if player_info.state_change_reason == 1 then
        log.debug('【BOB】正在启动游戏')
        self._is_launching = true
        self:event_notify('启动状态变化', self._is_launching)
        y3.ltimer.wait(10, function()
            log.warn('【BOB】未能在10秒内启动游戏！')
            self._is_launching = false
            self:event_notify('启动状态变化', self._is_launching)
        end)
    end
end

---@private
function M:notify_battle_info(data)
    local battle_info = data.arg1
    log.debug('【BOB】收到战场信息', y3.inspect(battle_info))
end

---@private
function M:notify_state_change(state)
    if state == 'disconnect' then
        -- 连接已关闭，不会再收到旧连接回包；结束所有待处理请求后允许重连重新发起。
        local receivers = {}
        for _, handler in pairs(self.request_handlers) do
            local receiver = handler.last_receiver
            local token_receivers = handler.map
            handler.last_receiver = nil
            handler.map = {}
            if receiver then
                receivers[#receivers + 1] = receiver
            end
            for _, token_receiver in pairs(token_receivers) do
                receivers[#receivers + 1] = token_receiver
            end
        end
        for _, receiver in ipairs(receivers) do
            xpcall(receiver, log.error, nil, '连接断开')
        end
    end
    self.state = state
    if state == 'login' then
        self:login()
    end
    log.debug('【BOB】在线状态变化', state)
    self:event_notify('在线状态变化', state)
end

---@private
function M:notify_ret(method_name, errid, arg, ret)
    if method_name == 'Chat_SendChatMsg' then
        local ret1 = ret and ret.ret1
        local business_error = type(ret1) == 'table'
            and ((ret1.errnu and ret1.errnu ~= 0) or (ret1.error_code and ret1.error_code ~= 0))
        if errid == 1 and not business_error then
            self:display_local_chat(arg.arg2, arg.arg3)
        end
    end
    local handler = self.request_handlers[method_name]
    if handler then
        handler.callback(errid, ret, arg)
    end
end

---@private
function M:register_methods()
    self.client:on_event(function(event, ...)
        if event == 'connecting'
            or event == 'connected'
            or event == 'login'
            or event == 'disconnect' then
            self:notify_state_change(event)
            return
        end
        if event == 'chat' then
            self:notify_chat(...)
            return
        end
        if event == 'update_team_info' then
            self:notify_update_team_info(...)
            return
        end
        if event == 'leave_team' then
            self:notify_leave_team(...)
            return
        end
        if event == 'notify_player_info' then
            self:notify_player_info(...)
            return
        end
        if event == 'notify_battle_info' then
            self:notify_battle_info(...)
            return
        end
        if event == 'ret' then
            self:notify_ret(...)
            return
        end
    end)
end

---comment
---@return integer,integer
function M:get_player_count()
    local max_count = self.team_info and self.team_info.member_limit or 0
    local team_count = 0
    for i = 1, max_count do
        local member = self.team_info and self.team_info.members[i]
        if member then
            team_count = team_count + 1
        end
    end
    return team_count, max_count
end
