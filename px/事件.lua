---@class 事件
local m = {}

---@type Trigger[]
m.触发器表 = {}

---@param 触发器 Trigger
---@return Trigger
local function _缓存触发器(触发器)
    表_插入指定位置值(m.触发器表, 触发器)
    return 触发器
end

---@param 名称 string
---@param 参数 table
function m.发送_自定义(名称, 参数)
    y3.game:event_notify(名称, 参数)
end

---@param 名称 string
---@param 标识 string
---@param 参数 table
function m.发送_自定义_带标识(名称, 标识, 参数)
    y3.game:event_notify_with_args(名称, { 标识 }, 参数)
end

---@param 名称 string
---@param 参数 table
---@return any
---@return any
---@return any
---@return any
function m.发送_自定义_回执模式(名称, 参数)
    return y3.game:event_dispatch(名称, 参数)
end

---@param 名称 string
---@param 标识 string
---@param 参数 table
---@return any
---@return any
---@return any
---@return any
function m.发送_自定义_带标识_回执模式(名称, 标识, 参数)
    return y3.game:event_dispatch_with_args(名称, { 标识 }, 参数)
end

---@class 参_事件
---@field 当前触发器 Trigger

---@param 名称 string
---@param 回调 fun(参数:参_事件)
---@return Trigger
function m.自定义(名称, 回调)
    return _缓存触发器(y3.game:event_on(名称, function(触发器, 参数)
        参数.当前触发器 = 触发器
        回调(参数)
    end))
end

---@param 名称 string
---@param 标识 string
---@param 回调 fun(参数:参_事件)
---@return Trigger
function m.自定义_带标识(名称, 标识, 回调)
    return _缓存触发器(y3.game:event_on(名称, { 标识 }, function(触发器, 参数)
        参数.当前触发器 = 触发器
        回调(参数)
    end))
end

---@param 回调 fun(回调:参_事件)
function m.游戏_初始化(回调)
    return m.自定义_带标识("游戏初始化", "游戏初始化", function(参数)
        回调(参数)
    end)
end

---@param 回调 fun(回调:参_事件)
function m.游戏_加载(回调)
    return m.自定义_带标识("游戏初始化", "文件加载", function(参数)
        回调(参数)
    end)
end

---@class 参_玩家加入游戏:参_事件
---@field 加入玩家 Player
---@field 是否中途加入 boolean

---@param 回调 fun(参数:参_玩家加入游戏)
function m.玩家_加入游戏(回调)
    return m.自定义_带标识("玩家加入游戏", "玩家加入游戏", function(参数)
        ---@cast 参数 + 参_玩家加入游戏
        回调(参数)
    end)
end

---@class 参_事件.键盘:参_事件
---@field 触发玩家 Player
---@field 触发按键  键盘按类型

---@param 键名 键盘按类型
---@param 回调 fun(参数:参_事件.键盘)
function m.键盘_按下(键名, 回调)
    return _缓存触发器(y3.game:event("键盘-按下", 键名, function(trg, data)
        回调({
            当前触发器 = trg,
            触发按键 = data.current_key,
            触发玩家 = data.player
        })
    end))
end

---@param 键名 键盘按类型
---@param 回调 fun(参数:参_事件.键盘)
function m.键盘_抬起(键名, 回调)
    return _缓存触发器(y3.game:event("键盘-抬起", 键名, function(trg, data)
        回调({
            当前触发器 = trg,
            触发按键 = data.current_key,
            触发玩家 = data.player
        })
    end))
end

---@class 参_事件.界面消息:参_事件
---@field 触发控件 UI
---@field 触发玩家 Player
---@field 触发事件名称 string
---@field 控件数据 any

---@param 名称 string
---@param 回调 fun(参数:参_事件.界面消息)
---@return Trigger
function m.控件(名称, 回调)
    return _缓存触发器(y3.game:event("界面-消息", 名称, function(trg, data)
        print(表_到字符串(data))
        回调({
            当前触发器 = trg,
            触发事件名称 = data.ui_event_name,
            触发控件 = data.ui,
            触发玩家 = data.player,
            控件数据 = data.data

        })
    end))
end

y3.reload.onBeforeReload(function(reload, willReload)
    for index, value in ipairs(m.触发器表) do
        value:移除()
    end
end)

return m
