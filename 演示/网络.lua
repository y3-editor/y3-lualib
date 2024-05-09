--请安装“Y3开发助手”插件（版本>=0.9.0）后，
--使用命令 `F1` -> `Y3开发助手:启动网络服务器`，
--然后再进行下列演示。

local M = {}

--[[
客户端发送消息后，会回复“你发送了：<收到的消息>”
客户端发送“再见！”会断开连接
]]
function M.test1()
    local client = y3.network.connect('127.0.0.1', 25895)
    print('开始连接服务器1...')

    client:on_connected(function (self)
        print('已连接服务器1！')
        self:send('你好！')
    end)

    client:on_disconnected(function (self)
        print('已断开服务器1！')
    end)

    client:on_error(function (self, error)
        print('发生错误：', error)
    end)

    client:on_data(function (self, data)
        print('收到来自服务器1的消息：', data)
        if data == '你发送了：你好！' then
            --发送“再见！”后，服务器会断开连接
            self:send('再见！')
        end
    end)
end

--[[
在实际使用时，我们经常会使用“定长包头+变长包体”的方式来传输数据。
连上服务器后，服务器每隔1秒会发送一个如下的数据包：
* 4个字节的包头，表示包体的长度（大端）
* Json表示的包体，结构如下
```jsonc
{
    "count": 1, // 表示这是第几次发送，一共会发送10次
    "time": 1234, // 服务器时间戳
}
```
]]
function M.test2()
    local client = y3.network.connect('127.0.0.1', 25896)
    print('开始连接服务器2...')

    client:on_connected(function (self)
        print('已连接服务器2！')
    end)

    client:on_disconnected(function (self)
        print('已断开服务器2！')
    end)

    client:on_error(function (self, error)
        print('发生错误：', error)
    end)

    ---@async
    client:data_reader(function (read)
        --读取包头，以大端4字节表示包体长度
        local head = read(4)
        --以大端序解析包头，得到包体长度
        local len = string.unpack('>I4', head)
        --读取包体，格式为json
        local jsonStr = read(len)
        --解析json
        local json = y3.json.decode(jsonStr)

        print('收到数据：')
        print('count:', json.count)
        print('time:', json.time)
    end)
end

return M
