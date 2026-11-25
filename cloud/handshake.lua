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

    local list = callbacks
    callbacks = {}
    for i = 1, #list do
        pcall(list[i], y3.cloud)
    end
end

y3.cloud.rpc.register('$Y3Cloud.Ready', apply)

---登记握手完成回调；已握手时立即调用
---@param callback fun(handshake: Cloud)
function y3.cloud.on_ready(callback)
    if y3.cloud.ready then
        callback(y3.cloud)
        return
    end
    callbacks[#callbacks + 1] = callback
end

---主动握手
---@param callback? fun(suc: boolean, data: any, err: string?)
---@return integer 请求 id
function y3.cloud.request(callback)
    return y3.cloud.rpc.request('$Y3Cloud.Hello', nil, function (suc, data, err)
        if suc then
            apply(data)
        end
        if callback then
            callback(suc, data, err)
        end
    end)
end
