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

(function()
    local function 发送_游戏_初始化()
        m.发送_自定义_带标识("游戏初始化", "插件加载", {})
        m.发送_自定义_带标识("游戏初始化", "文件加载", {})
        m.发送_自定义_带标识("游戏初始化", "游戏初始化", {})
    end

    ---@param 参数 参_玩家加入游戏
    local function 发送_玩家_加入游戏(参数)
        m.发送_自定义_带标识("玩家加入游戏", "插件加载", 参数)
        m.发送_自定义_带标识("玩家加入游戏", "文件加载", 参数)
        m.发送_自定义_带标识("玩家加入游戏", "玩家加入游戏", 参数)
    end


    y3.game:event("游戏-初始化", function(trg, data)
        发送_游戏_初始化()
        y3.game:event("玩家-加入游戏", function(trg, data)
            发送_玩家_加入游戏({ 加入玩家 = data.player, 是否中途加入 = data.is_middle_join })
        end)
    end)

    y3.reload.onBeforeReload(function(reload, willReload)
        for index, value in ipairs(m.触发器表) do
            value:移除()
        end
    end)

    y3.reload.onAfterReload(function(reload, hasReloaded)
        发送_游戏_初始化()
        玩家组.获取所有非中立玩家():遍历(function(索引, 遍历到的玩家)
            if 遍历到的玩家:get_state() == 1 then
                发送_玩家_加入游戏({ 加入玩家 = 遍历到的玩家, 是否中途加入 = false })
            end
        end)
    end)
end)()

return m
