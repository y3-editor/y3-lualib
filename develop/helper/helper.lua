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

local function logger(...)
    local default = y3.config.log.toHelper
    y3.config.log.toHelper = false
    log.debug(...)
    y3.config.log.toHelper = default
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
    logger('send:', jsonContent)
    client:send(string.pack('>s4', jsonContent))

    requestMap[data.id] = callback
end

--向《Y3开发助手》发送请求（协程）
---@async
---@param method string
---@param params table
---@return any
function M.awaitRequest(method, params)
    if not client then
        return
    end
    local co = coroutine.running()
    M.request(method, params, function (data)
        coroutine.resume(co, data)
    end)
    coroutine.yield()
end

---@private
---@param id integer
---@param result any
---@param err? string
function M.response(id, result, err)
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

local function handle_body(body)
    logger('recv:', body)
    local data = y3.json.decode(body)
    local id = data.id
    if data.method then
        --request
        local callback = methodMap[data.method]
        if callback then
            local suc, res = xpcall(callback, log.error, data.params)
            if suc then
                M.response(id, res)
            else
                M.response(id, nil, res)
            end
        else
            M.response(id, nil, '未找到方法：' .. tostring(data.method))
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
end

local onReadyCallbacks = {}

---@param port integer
---@return Network 
local function createClient(port)
    client = network.connect('127.0.0.1', port, {
        update_interval = 0.05,
    })

    client:on_connected(function (self)
        M.print(console.getHelpInfo())

        local callbacks = onReadyCallbacks
        onReadyCallbacks = nil
        for _, callback in ipairs(callbacks) do
            xpcall(callback, log.error, client)
        end
    end)

    ---@async
    client:data_reader(function (read)
        local head = read(4)
        local len = string.unpack('>I4', head)
        local body = read(len)
        xpcall(handle_body, log.error, body)
    end)

    return client
end

--当《Y3开发助手》准备好时调用
---@param callback fun()
function M.onReady(callback)
    if not onReadyCallbacks then
        xpcall(callback, log.error)
        return
    end
    onReadyCallbacks[#onReadyCallbacks+1] = callback
end

--在《Y3开发助手》的终端上打印消息
---@param message string
function M.print(message)
    M.request('print', {
        message = message
    })
end

--在《Y3开发助手》的视图上创建一个树形视图
---@param name string
---@param root Develop.Helper.TreeNode
---@return Develop.Helper.TreeView
function M.createTreeView(name, root)
    local treeView = New 'Develop.Helper.TreeView' (name, root)
    return treeView
end

--在《Y3开发助手》的树形视图上创建一个节点
---@param name string
---@param optional Develop.Helper.TreeNode.Optional
---@return Develop.Helper.TreeNode
function M.createTreeNode(name, optional)
    local treeNode = New 'Develop.Helper.TreeNode' (name, optional)
    return treeNode
end

--注册一个方法
M.registerMethod('command', function (params)
    y3.develop.console.input(params.data)
end)

y3.game:event_on('$Y3-初始化', function ()
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
