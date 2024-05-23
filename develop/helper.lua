local network = require 'y3.util.network'
local console = require 'y3.develop.console'

local nextID = y3.util.counter()

---@class Develop.Helper
local M = Class 'Develop.Helper'

---@type table<integer, fun(data: any)>
local requestMap = {}

---@type Network
local client

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

---@param port integer
---@return Network 
local function createClient(port)
    client = network.connect('127.0.0.1', port)

    client:on_connected(function (self)
        M.request('print', {
            message = console.getHelpInfo()
        })
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
