--请安装“Y3开发助手”插件（版本>=0.9.0）后，
--使用命令 `F1` -> `Y3开发助手:启动网络服务器`，
--然后再进行下列演示。

local M = {}

function M.test1()
    local network = y3.network.connect('127.0.0.1', 25895)

    network:on_connected(function (self)
        print('已连接！')
        self:send('你好！')
    end)

    network:on_disconnected(function (self)
        print('已断开！')
    end)

    network:on_error(function (self, error)
        print('发生错误：', error)
    end)

    network:on_data(function (self, data)
        print('收到来自服务器的消息：', data)
        if data == '你发送了：你好！' then
            --发送“再见！”后，服务器会断开连接
            self:send('再见！')
        end
    end)


    print('开始连接...')
end

return M
