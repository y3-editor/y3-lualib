---@class Network
---@overload fun(ip: string, port: integer, options?: Network.Options): self
local M = Class 'Network'

---@private
---@type 'new' | 'inited' | 'started' | 'connected' | 'disconnected' | 'error' | 'dead' | 'sleep'
M.state = 'new'

---@private
M._send_buffer = ''

---@class Network.Options
---@field buffer_size? integer # 网络缓冲区大小（字节），默认为 2MB
---@field timeout? number # 连接超时时间（秒），默认为30秒
---@field update_interval? number # 网络更新间隔（秒），默认为 0.2
---@field retry_interval? number # 重连间隔（秒），默认为 5

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
    self.options.retry_interval = self.options.retry_interval or 5

    ---@private
    self.update_timer = y3.ctimer.loop(self.options.update_interval, function ()
        self:update()
    end)
    y3.ctimer.wait(0, function ()
        self:update()
    end)
    self.retry_timer = y3.ctimer.loop(self.options.retry_interval, function (t)
        if  self.state ~= 'started'
        and self.state ~= 'sleep' then
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

function M:update()
    if self.state == 'error' or self.state == 'dead' then
        self:remove()
        return
    end
    self.handle:run_once()
    if self.state == 'new' then
        local ok, suc, err = pcall(self.handle.init, self.handle, self.ip, self.port, self.options.buffer_size)
        if not ok then
            self.state = 'sleep'
            return
        end
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

--创建一个“阻塞”式的数据读取器，会循环执行 `callback`
--> 与 `on_data` 互斥
--
--回调里会给你一个读取函数 `read`，下面是它的说明：
--
--按照传入的规则读取数据，如果数据不满足规则，
--那么读取器会休眠直到收到满足规则的数据再返回
--* 如果不传入任何参数：
--  读取所有已收到的数据，类似于 `on_data`
--* 如果传入整数：
--  读取指定字节数的数据。
--* 如果传入 `'l'`：
--  读取一行数据，不包括换行符。
--* 如果传入 `'L'`：
--  读取一行数据，包括换行符。
---@param callback async fun(read: async fun(len: nil|integer|'l'|'L'): string)
function M:data_reader(callback)
    local buffer = ''
    local read_once

    ---@async
    local co = coroutine.create(function (reader)
        while true do
            read_once = false
            xpcall(callback, log.error, reader)
            if not read_once then
                log.error([[
数据读取器在本次循环中没有读取任何数据！
请确保你在读取器中至少调用过一次有效的 `read` 函数！
读取器已休眠，将在收到新数据后重新激活。
]])
                coroutine.yield()
            end
        end
    end)

    self:on_data(function (_, data)
        buffer = buffer .. data
        if #buffer > self.options.buffer_size then
            self:make_error('缓冲区溢出!')
            return
        end
        coroutine.resume(co)
    end)

    ---@async
    ---@param what nil|integer|'l'|'L' # 要读取的内容
    ---@return string
    local function read(what)
        if what == nil then
            if #buffer == 0 then
                coroutine.yield()
                --一定是收到数据后才被唤醒的，因此不用再判断缓存了
            end
            read_once = true
            buffer = ''
            return buffer
        end
        if what == 'l'
        or what == 'L' then
            local pos
            local init = 1
            while true do
                pos = buffer:find('\n', init, true)
                if pos then
                    break
                end
                init = #buffer + 1
                coroutine.yield()
            end
            read_once = true
            local data = buffer:sub(1, pos)
            buffer = buffer:sub(pos + 1)
            if what == 'l' then
                if data:sub(-2) == '\r\n' then
                    data = data:sub(1, -3)
                else
                    data = data:sub(1, -2)
                end
                return data
            else
                return data
            end
        end
        if math.type(what) == 'integer' then
            ---@cast what integer
            if what <= 0 then
                return ''
            end
            while what > #buffer do
                coroutine.yield()
            end
            read_once = true
            local data = buffer:sub(1, what)
            buffer = buffer:sub(what + 1)
            return data
        end
        error('无效的读取规则:' .. tostring(what))
    end

    coroutine.resume(co, read)
end

--断开连接后的回调
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

--是否已连接
---@return boolean
function M:is_connecting()
    return self.handle:is_connecting()
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
