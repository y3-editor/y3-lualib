local network  = require 'y3.util.network'
local console  = require 'y3.develop.console'
local explorer = require 'y3.develop.helper.explorer'
local attr     = require 'y3.develop.helper.attr'

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
    do return end
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
        if callback then callback(nil) end
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

    client:update()
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
    return y3.await.yield(function (resume)
        M.request(method, params, resume)
    end)
end

--向《Y3开发助手》发送通知
---@param method string
---@param params table
function M.notify(method, params)
    if not client then
        return
    end

    local data = {
        method = method,
        params = params,
    }

    local jsonContent = y3.json.encode(data)
    logger('send:', jsonContent)
    client:send(string.pack('>s4', jsonContent))

    client:update()
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
    logger('resp:', jsonContent)
    client:send(string.pack('>s4', jsonContent))

    client:update()
end

local function handleBody(body)
    logger('recv:', body)
    local data = y3.json.decode(body)
    local id = data.id
    if data.method then
        --request
        local callback = methodMap[data.method]
        if callback then
            local suc, res = xpcall(callback, log.error, data.params)
            if id then
                if suc then
                    M.response(id, res)
                else
                    M.response(id, nil, res)
                end
            end
        else
            if id then
                M.response(id, nil, '未找到方法：' .. tostring(data.method))
            end
        end
    else
        --response
        if data.error then
            logger(data.error)
        end
        local callback = requestMap[id]
        if callback then
            requestMap[id] = nil
            xpcall(callback, log.error, data.result)
        end
    end
end

local onReadyCallbacks = {}

---@param port integer
---@return Network 
local function createClient(port)
    client = network.connect('127.0.0.1', port, {
        update_interval = 0.05,
        timeout = nil,
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
        xpcall(handleBody, log.error, body)
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

--《Y3开发助手》是否准备好
---@return boolean
function M.isReady()
    return client ~= nil
end

--在《Y3开发助手》的终端上打印消息
---@param message string
function M.print(message)
    M.notify('print', {
        message = message:sub(1, 10000)
    })
end

---@class Develop.Helper.RestartOptions
---@field debugger? boolean # 是否需要启动调试器。如果省略，会根据当前是否附加了调试器来决定是否需要调试器。

--准备重启游戏
---@param options Develop.Helper.RestartOptions
function M.prepareForRestart(options)
    M.notify('prepareForRestart', options)
end

---@param command string
---@param args? any[]
---@param callback? fun(result: any)
function M.requestCommand(command, args, callback)
    M.request('command', {
        command = command,
        args = args,
    }, callback)
end

---@private
---@type table<string, Develop.Helper.TreeView>
M.treeViewMap = {}

--在《Y3开发助手》的视图上创建一个树形视图
---@param name string
---@param root Develop.Helper.TreeNode
---@return Develop.Helper.TreeView
function M.createTreeView(name, root)
    if M.treeViewMap[name] then
        M.treeViewMap[name]:remove()
    end
    local treeView = New 'Develop.Helper.TreeView' (name, root)
    M.treeViewMap[name] = treeView
    return treeView
end

--在《Y3开发助手》的树形视图上创建一个节点
---@param name string
---@param optional? Develop.Helper.TreeNode.Optional
---@return Develop.Helper.TreeNode
function M.createTreeNode(name, optional)
    local treeNode = New 'Develop.Helper.TreeNode' (name, optional)
    return treeNode
end

---在《Y3开发助手》上创建一个输入框
---@param optional? Develop.Helper.InputBox.Optional
---@return Develop.Helper.InputBox
function M.createInputBox(optional)
    local inputBox = New 'Develop.Helper.InputBox' (optional)
    return inputBox
end

---在《Y3开发助手》上创建一个属性监视器
---@param unit Unit # 要监视的单位
---@param attrType y3.Const.UnitAttr # 属性名
---@param condition? Develop.Attr.Accept # 断点表达式，如 `>= 100`，``` <= `最大生命` / 2 ```
---@return Develop.Helper.TreeNode
function M.createAttrWatcher(unit, attrType, condition)
    return attr.add(unit, attrType, condition)
end

---@private
M._inited = false

--初始化与《Y3开发助手》的连接。如果用VSCode启动游戏，会自动连接。
--其他情况若有需求可以调用此函数连接。
---@param port? integer
function M.init(port)
    if M._inited then
        return
    end
    M._inited = true
    if port then
        createClient(port)
        explorer.create()
    else
        local suc, port = pcall(require, 'log.helper_port')
        if not suc or math.type(port) ~= 'integer' then
            return
        end

        createClient(port)
        explorer.create()
    end
end

--注册一个方法
M.registerMethod('command', function (params)
    y3.develop.console.input(params.data)
end)

y3.game:event_on('$Y3-初始化', function ()
    if not y3.game.is_debug_mode() then
        return
    end
    if not arg['lua_dummy'] then
        return
    end

    M.init()
end)

return M
