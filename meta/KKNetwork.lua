---@meta

---@class KKNetwork
---@overload fun(): self
KKNetwork = {}

-- 初始化网络环境
-- @param ip 远端IP地址， string 类型
-- @param port 端口， number 类型
-- @param buffer_size 网络缓冲区大小
-- @return 返回初始化是否成功，如果失败，会有错误信息
-- @detail 这个函数会检查ip 端口是否合法，但是不会真正的启动网络循环，只是会提前申请对应的资源
function KKNetwork:init(ip, port, buffer_size)
end

-- 启动网络连接
-- @return true or false
-- @detail 启动网络连接，这个函数调用后会真正的连接到服务器
-- 如果连接成功，is_connecting 方法会返回true
function KKNetwork:start()
end

-- 返回网络连接的在状态
---@return boolean
function KKNetwork:is_connecting()
end

-- 断开网络连接，停止接受网络消息事件
-- @detail 断开当前连接，并且释放对应的资源，只要没有调用destory，还可以再次调用start 方法启动网络连接
function KKNetwork:stop()
end

-- 主循环，需要在用户主循环中调用
function KKNetwork:run_once()
end

-- 释放网络类资源，如果还没断开连接，这里会断开网络连接
function KKNetwork:destroy()
end

-- 发送网络消息
-- @param message_body 消息体，string类型，可以是字符串，也可以是pb序列化过后的二进制数组
-- @param length message_body 长度
-- @return 实际发送出去的消息的长度，失败会返回 <= 0的数值
function KKNetwork:send(message_body, length)
end

-- 接受网络消息
-- @param length 期望接受的消息的长度，如果不足，会返回实际接受到的长度
-- @return message 消息体，string，接受失败会返回nil 
-- @return result 实际接受到的消息长度
-- @detail 接受消息函数会把消息从缓冲区移除，是真正的接受消息
function KKNetwork:recv(length)
end

-- 探测网络消息，不会从消息队列移除，多用于判断消息头是否足够
-- @return message 消息体，string，接受失败会返回nil 
-- @return result 实际接受到的消息长度
-- @detail 接受消息函数不会把消息从缓冲区移除
function KKNetwork:peek(length)
end
