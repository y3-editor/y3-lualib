include "y3.px.常量枚举"
include "y3.px.基础.表"
include "y3.px.基础.字符串"
include "y3.px.基础.数学"
include "y3.px.基础.工具"

y3.事件 = include "y3.px.事件.事件"
require "y3.px.事件.单位事件"


include "src.模块.界面操作模块"

function _预设数据初始化()
    常量.中立友善玩家 = y3.玩家.从id获取(32)
    常量.中立敌对玩家 = y3.玩家.从id获取(31)
    常量.空玩家组 = y3.玩家组.获取所有玩家():清空()
    常量.空单位组 = y3.玩家.从id获取(1):获取所有单位():清空()
end

local function _游戏初始化()
    _预设数据初始化()
    y3.事件.发送_自定义_带标识("游戏初始化", "插件加载", {})
    y3.事件.发送_自定义_带标识("游戏初始化", "文件加载", {})
    y3.事件.发送_自定义_带标识("游戏初始化", "游戏初始化", {})
end

---@param 参数 参_玩家加入游戏
local function _玩家加入(参数)
    y3.事件.发送_自定义_带标识("玩家加入游戏", "插件加载", 参数)
    y3.事件.发送_自定义_带标识("玩家加入游戏", "玩家初始化", 参数)
    y3.事件.发送_自定义_带标识("玩家加入游戏", "玩家加入游戏", 参数)
end


y3.游戏:event("游戏-初始化", function(trg, data)
    _游戏初始化()
    y3.游戏:event("玩家-加入游戏", function(trg, data)
        _玩家加入({ 加入玩家 = data.player, 是否中途加入 = data.is_middle_join })
    end)
end)

y3.reload.onAfterReload(function(reload, hasReloaded)
    _游戏初始化()
    y3.玩家组.获取所有非中立玩家():遍历(function(索引, 遍历到的玩家)
        if 遍历到的玩家:get_state() == 1 then
            _玩家加入({ 加入玩家 = 遍历到的玩家, 是否中途加入 = false })
        end
    end)
end)
