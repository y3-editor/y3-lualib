local network = require 'y3.util.network'
local console = require 'y3.develop.console'

local nextID = y3.util.counter()

---@class Develop.Helper
local M = Class 'Develop.Helper'

---@type table<integer, fun(result: any)>
local requestMap = {}

---@type table<integer, fun(params: any): any>
local methodMap = {}

---@type Network
local client

---@param method string
---@param callback fun(params: any): any
function M.registerMethod(method, callback)
    methodMap[method] = callback
end

--向《Y3开发助手》发送请求
---@param method string
---@param params table
---@param callback? fun(data: any) # 接收返回值
function M.request(method, params, callback)
    if not client then
        return
    end

    local data = {
        method = method,
        id = nextID(),
        params = params,
    }

    local jsonContent = y3.json.encode(data)
    client:send(string.pack('>s4', jsonContent))

    requestMap[data.id] = callback
end

---@private
---@param id integer
---@param result any
---@param err? string
function M.onResponse(id, result, err)
    if not client then
        return
    end

    local data = {
        id = id,
        result = result,
        error = err,
    }

    local jsonContent = y3.json.encode(data)
    client:send(string.pack('>s4', jsonContent))
end

---@param port integer
---@return Network 
local function createClient(port)
    client = network.connect('127.0.0.1', port)

    client:on_connected(function (self)
        M.requestPrint(console.getHelpInfo())
    end)

    ---@async
    client:data_reader(function (read)
        local head = read(4)
        local len = string.unpack('>I4', head)
        local body = read(len)
        pcall(function ()
            local data = y3.json.decode(body)
            local id = data.id
            if data.method then
                --request
                local callback = methodMap[data.method]
                if callback then
                    local suc, res = xpcall(callback, log.error, data.params)
                    if suc then
                        M.onResponse(id, res)
                    else
                        M.onResponse(id, nil, res)
                    end
                else
                    M.onResponse(id, nil, '未找到方法：' .. tostring(data.method))
                end
            else
                --response
                if data.result then
                    local callback = requestMap[id]
                    if callback then
                        requestMap[id] = nil
                        xpcall(callback, log.error, data.result)
                    end
                elseif data.error then
                    log.warn(data.error)
                end
            end
        end)
    end)

    return client
end

--在《Y3开发助手》的终端上打印消息
---@param message string
function M.requestPrint(message)
    M.request('print', {
        message = message
    })
end

--注册一个方法
M.registerMethod('command', function (params)
    y3.develop.console.input(params.data)
end)

y3.game:event("游戏-初始化", function (trg, data)
    if not y3.game.is_debug_mode() then
        return
    end

    local suc, port = pcall(require, 'log.helper_port')
    if not suc or math.type(port) ~= 'integer' then
        return
    end

    createClient(port)
end)

return M
