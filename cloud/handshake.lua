-- 握手：记录云脚本是否可用与云脚本 y3 库版本，状态与接口直接挂在 y3.cloud 上

y3.cloud.ready = false

---@type string?
y3.cloud.version = nil

---@type boolean?
y3.cloud.debug = nil

---@type fun(handshake: Cloud)[]
local callbacks = {}

---@param data any
local function apply(data)
    if type(data) ~= 'table' then
        return
    end

    y3.cloud.ready = true
    y3.cloud.version = data.version
    y3.cloud.debug = data.debug

    -- 每次握手都跑一遍（重开 / 云端重置后要重新拉全量）
    local list = callbacks
    for i = 1, #list do
        pcall(list[i], y3.cloud)
    end
end

---登记握手完成回调；已握手时立即调用
---@param callback fun(handshake: Cloud)
function y3.cloud.on_ready(callback)
    if y3.cloud.ready then
        callback(y3.cloud)
        return
    end
    callbacks[#callbacks + 1] = callback
end

---主动握手；超时或云端未就绪时按 retry 次数重试
---@param callback? fun(suc: boolean, data: any, err: string?)
---@param retry? integer 重试次数，缺省 2
---@return integer 请求 id
function y3.cloud.request(callback, retry)
    local left = retry == nil and 2 or retry

    return y3.cloud.rpc.request('$Y3Cloud.Hello', nil, function (suc, data, err)
        if suc then
            apply(data)
        elseif (err == 'timeout' or err == 'not_ready') and left > 0 then
            y3.cloud.request(callback, left - 1)
            return
        end
        if callback then
            callback(suc, data, err)
        end
    end)
end

---通知云端重置会话（调试用），之后需要重新握手
function y3.cloud.reset()
    y3.cloud.ready = false
    y3.cloud.rpc.notify('$Y3Cloud.Reset')
end

---通知云端热重载业务代码（调试用），随后重新握手并重新拉全量
function y3.cloud.reload()
    y3.cloud.ready = false
    y3.cloud.rpc.notify('$Y3Cloud.Reload')
    y3.cloud.request()
end
