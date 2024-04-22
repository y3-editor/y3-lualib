-- y3 网络库基本封装

-- @class Y3Network
local Y3Network = Class('Y3Network')

-- 设置接受消息回调函数
-- @param callback(Y3Network)
function Y3Network:set_message_handle(handler)
    -- 检查参数是否是函数
    if type(handler) ~= "function" then
        error("Y3Network:set_message_handle 参数必须是函数")
    end
    self.message_handle = handler
end

-- 初始化网络
-- @param ip string ip地址
-- @param port number 端口
-- @param buffer_size number 缓冲区大小 默认为2M
function Y3Network:init(ip, port, buffer_size)
    self.ip = ip
    self.port = port
    self.buffer_size = buffer_size or 1024 * 1024 * 2

    -- 创建c++ KKNetwork对象
    self.net_core = KKNetwork()
    return self.net_core:init(ip, port, buffer_size)
end

-- 启动网络
-- @return boolean 是否成功
function Y3Network:start()
    local result = self.net_core:start()
    -- 启动失败，打印日志，返回false
    if not result then
        GameAPI.print_to_dialog(1, "连接到服务器失败")
        return false
    end

    -- 启动定期器，每一帧执行主循环
    self.loop_handler = y3.timer.run_looped_timer(0.03, false, function()
        self:tick()
    end)
    GameAPI.print_to_dialog(3, "成功连接到服务器 endpoint: " .. self.ip .. ":" .. self.port)
    return true
end

-- 主循环tick 函数，在start时候设置定时器调用
function Y3Network:tick()
    self.net_core:run_once()
    -- 如果有消息处理函数，执行一次
    if self.message_handle then
        self.message_handle(self)
    end
end

-- 发送消息到对端
-- @param msg 消息byte数组
-- @param length 消息长度
function Y3Network:send(msg, length)
    -- 检查参数是否是 字符串
    if type(msg) ~= "string" then
        error("Y3Network:send 参数类型错误")
    end

    if length <= 0 then
        return 0
    end

    -- 检查网络状态
    if not self.net_core then
        return 0
    end

    return self.net_core:send(msg, length)
end

-- 从缓冲区读取消息
-- @param length 要读取的消息的长度
function Y3Network:receive(length)
    if length <= 0 then
        return nil, 0
    end
    return self.net_core:recv(length)
end

-- 从缓冲区查看消息，不会从缓冲区移除
-- @param length 要读取的消息的长度
function Y3Network:peek(length)
    if length <= 0 then
        return nil, 0
    end
    return self.net_core:peek(length)
end

-- 断开网络连接
function Y3Network:stop()
    -- 停止定时器
    if self.loop_handler then
        y3.remove_timer(self.loop_handler)
        self.loop_handler = nil
    end

    -- 停止网络
    self.net_core:stop()
    GameAPI.print_to_dialog(3, "断开与服务器的连接")
end

-- 销毁网络，释放资源
function Y3Network:destroy()
    if self.net_core then
        self.net_core:destroy()
        self.net_core = nil
    end
end

-- 是否与服务器连接
-- @return 返回与服务器连接状态
function Y3Network:is_connecting()
    -- net_core 对象是否存在
    if not self.net_core then
        return false
    end
    return self.net_core:is_connecting()
end

return Y3Network
