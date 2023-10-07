-- 使用include来加载的文件会被标记为可重载
include 'y3.example.热重载.重载的脚本'

-- 发送聊天消息 “.RD” 即可重新加载上述文件

-- 可以通过配置进一步指定只重载部分文件。
-- 如果不进行配置，则默认重载所有可重载的文件（使用`include`来加载的文件）。
y3.reload.setDefaultOptional {
    -- 通过列表指定文件
    list = {
        'y3.example.热重载.重载的脚本',
    },
    -- 不在上述列表中的文件会尝试调用此函数，如果返回true表示需要重载，否则不重载
    filter = function (name, reload)
        if y3.util.stringStartWith(name, 'y3.example.热重载.') then
            return true
        else
            return false
        end
    end,
}
