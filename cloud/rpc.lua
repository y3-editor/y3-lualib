-- 请求 / 应答 / 通知：y3.cloud.rpc
-- 报文 = base64(y3.seri)；上行直接发字符串，下行发 JSON 字符串字面量

---@class Cloud.Rpc
local M = {
    timeout = 5,
}

local EVENT = '$Y3Cloud'

-- 官方限制：事件名最长 32 字节，单条消息最长 10240 字节
local MAX_EVENT_BYTES = 32
local MAX_MESSAGE_BYTES = 10240

if #EVENT > MAX_EVENT_BYTES then
    log.warn('y3.cloud.rpc: event name too long, bytes=' .. #EVENT)
end

local seq = 0

---@type table<integer, { callback: fun(suc: boolean, data: any, err: string?)?, timer: LocalTimer? }>
local pending = {}

---@type table<string, fun(data: any, player: Player?): any, string?>
local handlers = {}

---@return integer
local function next_id()
    seq = seq + 1
    if seq > 0x7FFFFFFF then
        seq = 1
    end
    return seq
end

---@param payload table
---@return string?
local function pack_payload(payload)
    local ok, text = pcall(y3.seri.encode, payload)
    if not ok then
        log.warn('y3.cloud.rpc: encode failed, ' .. tostring(text))
        return nil
    end
    return y3.base64.encode(text)
end

---@param payload table
---@return boolean ok
---@return string? err
local function send(payload)
    local text = pack_payload(payload)
    if text == nil then
        return false, 'encode_failed'
    end
    if #text > MAX_MESSAGE_BYTES then
        log.warn('y3.cloud.rpc: payload too large, method=' .. tostring(payload.m) .. ', bytes=' .. #text)
        return false, 'too_large'
    end

    -- 直接发字符串即可，引擎会 json.encode 一次，云端拿到的是带引号的版本，由云端脱引号
    ---@diagnostic disable-next-line: param-type-mismatch
    local ok, err = pcall(y3.game.send_mlscript_msg, EVENT, text)
    if not ok then
        log.warn('y3.cloud.rpc: send failed, method=' .. tostring(payload.m) .. ', ' .. tostring(err))
        return false, 'send_failed'
    end
    return true
end

---@param id integer
---@param err string?
---@param data any
local function settle(id, err, data)
    local entry = pending[id]
    if not entry then
        return
    end
    pending[id] = nil
    if entry.timer then
        entry.timer:remove()
    end
    if entry.callback then
        entry.callback(err == nil, data, err)
    end
end

---@param method string
---@param data any
---@param player Player?
---@return any result
---@return string? err
local function dispatch(method, data, player)
    local handler = handlers[method]
    if not handler then
        log.warn('y3.cloud.rpc: no handler, method=' .. tostring(method))
        return nil, 'no_handler'
    end

    local ok, result, err = pcall(handler, data, player)
    if not ok then
        log.warn('y3.cloud.rpc: handler error, method=' .. tostring(method) .. ', ' .. tostring(result))
        return nil, tostring(result)
    end
    return result, err
end

---@param raw any 平台事件数据，JSON 字符串字面量会被解成去掉引号的字符串
---@return table?
local function unpack_payload(raw)
    if type(raw) ~= 'string' then
        log.warn('y3.cloud.rpc: invalid payload type, ' .. type(raw))
        return nil
    end

    local text = y3.base64.decode(raw)
    if text == nil then
        log.warn('y3.cloud.rpc: base64 decode failed')
        return nil
    end

    local ok, payload = pcall(y3.seri.decode, text)
    if not ok or type(payload) ~= 'table' then
        log.warn('y3.cloud.rpc: invalid message')
        return nil
    end
    return payload
end

---@param data EventParam.玩家-收到云脚本消息
local function on_message(_, data)
    if data.mlscript_event_name ~= EVENT then
        return
    end

    local payload = unpack_payload(data.mlscript_event_data)
    if payload == nil then
        return
    end

    local id = payload.i
    local method = payload.m
    local body = payload.d
    if id ~= nil and method ~= nil then        -- 请求
        local result, err = dispatch(method, body, data.player)
        local ok2, send_err = send { i = id, d = result, e = err }
        if not ok2 and send_err == 'too_large' then
            send { i = id, e = 'payload_too_large' }
        end
    elseif id ~= nil then                      -- 应答
        settle(id, payload.e, body)
    elseif method ~= nil then                  -- 通知
        dispatch(method, body, data.player)
    end
end

y3.game:event('玩家-收到云脚本消息', on_message)

---向云脚本发起请求，callback(suc, data, err)
---@param method string
---@param data any
---@param callback? fun(suc: boolean, data: any, err: string?)
---@return integer 请求 id
function M.request(method, data, callback)
    local id = next_id()

    local entry = { callback = callback }
    pending[id] = entry
    entry.timer = y3.ltimer.wait(M.timeout, function ()
        settle(id, 'timeout')
    end)

    local ok, send_err = send { i = id, m = method, d = data }
    if not ok then
        settle(id, send_err or 'send_failed')
    end
    return id
end

---向云脚本发通知（不等待应答）
---@param method string
---@param data any
---@return boolean
function M.notify(method, data)
    return send { m = method, d = data }
end

---注册云脚本请求 / 通知的处理函数；回调返回值作为请求应答
---@param method string
---@param callback fun(data: any, player: Player?): any, string?
function M.register(method, callback)
    handlers[method] = callback
end

---等待云脚本应答（必须在协程中调用），返回 suc, data, err
---@async
---@param method string
---@param data any
---@return boolean suc
---@return any data
---@return string? err
function M.awaitRequest(method, data)
    return y3.await.yield(function (resume)
        M.request(method, data, resume)
    end)
end

y3.cloud.rpc = M
