---@class Network
---@overload fun(ip: string, port: integer, options?: Network.Options): self
local M = Class 'Network'

---@private
---@type 'new' | 'inited' | 'started' | 'connected' | 'disconnected' | 'error' | 'dead'
M.state = 'new'

---@private
M._send_buffer = ''

---@class Network.Options
---@field buffer_size? integer # 网络缓冲区大小（字节），默认为 2MB
---@field timeout? number # 连接超时时间（秒），默认为无限
---@field update_interval? number # 网络更新间隔（秒），默认为 0.2

---@alias Network.OnConnected fun(self: Network)
---@alias Network.OnData fun(self: Network, data: string)
---@alias Network.OnDisconnected fun(self: Network)
---@alias Network.OnError fun(self: Network, error: string)

---@param ip string
---@param port integer
---@param options? Network.Options
function M:__init(ip, port, options)
    self.ip = ip
    self.port = port
    self.handle = KKNetwork()
    self.options = options or {}
    self.options.buffer_size = self.options.buffer_size or (1024 * 1024 * 2)
    self.options.update_interval = self.options.update_interval or 0.2

    ---@private
    self.update_timer = y3.ltimer.loop(self.options.update_interval, function ()
        self:update()
    end)
    y3.ltimer.wait(0, function ()
        self:update()
    end)
    self.retry_timer = y3.ltimer.loop(1, function (t)
        if self.state ~= 'started' then
            t:remove()
            return
        end
        self.handle:destroy()
        self.handle = KKNetwork()
        self.state = 'new'
        self:update()
    end)
    if self.options.timeout and self.options.timeout > 0 then
        y3.ltimer.wait(self.options.timeout, function ()
            if self.state ~= 'started' then
                return
            end
            self:make_error('连接超时')
        end)
    end
end

function M:__del()
    self.state = 'dead'
    self.handle:destroy()
    self.update_timer:remove()
    self.retry_timer:remove()
end

---@private
---@param err any
function M:make_error(err)
    if self.state == 'dead' then
        return
    end
    self.state = 'error'
    self:callback('error', err)
    self:remove()
end

---@private
function M:update()
    if self.state == 'error' or self.state == 'dead' then
        self:remove()
        return
    end
    self.handle:run_once()
    if self.state == 'new' then
        local suc, err = self.handle:init(self.ip, self.port, self.options.buffer_size)
        if not suc then
            self:make_error(err)
            return
        end
        self.state = 'inited'
    end
    if self.state == 'inited' then
        local suc = self.handle:start()
        if not suc then
            self:make_error('start failed')
            return
        end
        self.state = 'started'
        return
    end
    if self.state == 'started' then
        if self:is_connecting() then
            self.state = 'connected'
            self:callback('connected')
        end
        return
    end
    if self.state == 'connected' then
        if not self:is_connecting() then
            self.state = 'disconnected'
            self.handle:stop()
            self:callback('disconnected')
            return
        end
        local send_buffer = self._send_buffer
        if #send_buffer > 0 then
            self._send_buffer = ''
            local suc, err = self.handle:send(send_buffer, #send_buffer)
            if not suc then
                self:make_error(err)
                return
            end
        end
        local data = self.handle:recv(self.options.buffer_size)
        if data and #data > 0 then
            self:callback('data', data)
        end
        return
    end
    if self.state == 'disconnected' then
        return
    end
end

function M:remove()
    Delete(self)
end

---@private
---@param key 'connected' | 'data' | 'disconnected' | 'error'
---@param ... any
function M:callback(key, ...)
    local func = self['_on_' .. key]
    if not func then
        return
    end
    xpcall(func, log.error, self, ...)
end

--连接成功后的回调
--
--> TODO: 目前有bug，临时方案是连接成功后服务器第一次发送
--消息过来后触发。等待5月9号版本更新修复
---@param on_connected Network.OnConnected
function M:on_connected(on_connected)
    ---@private
    self._on_connected = on_connected
end

--收到数据后的回调
---@param on_data Network.OnData
function M:on_data(on_data)
    ---@private
    self._on_data = on_data
end

--断开连接后的回调
--
--> TODO: 目前有bug无法触发。等待5月9号版本更新修复
---@param on_disconnected Network.OnDisconnected
function M:on_disconnected(on_disconnected)
    ---@private
    self._on_disconnected = on_disconnected
end

--发生错误后的回调
---@param on_error Network.OnError
function M:on_error(on_error)
    ---@private
    self._on_error = on_error
end

--是否连接中
--
--> TODO: 目前有bug，需要连上后服务器主动发一个消息
--过来才能判断是否连接上。等5月9号版本更新修复。
---@return boolean
function M:is_connecting()
    if self._connected then
        return true
    end
    local res = self.handle:peek(1)
    if res ~= nil then
        ---@private
        self._connected = true
        return true
    end
    return false
end

---@param data string
function M:send(data)
    self._send_buffer = self._send_buffer .. data
end

---@class Network.API
local API = {}

--建立一个socket客户端，连接到目标服务器上
---@param ip string # IP地址
---@param port integer # 端口号
---@param options? Network.Options # 配置
---@return Network
function API.connect(ip, port, options)
    local network = New 'Network' (ip, port, options)
    return network
end

return API
