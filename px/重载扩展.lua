---@class 重载配置
---@field 缓存 table<integer,any>
---@field 类名 string
---@field 成员名 string
---@field 移除方法 fun(缓存对象:any)
---@field 原函数? fun(...)

---@type {[string]:重载配置}
local 重载缓存配置 = {
    全局触发器 = {
        缓存 = {},
        类名 = "游戏",
        成员名 = "事件",
        移除方法 = function(缓存对象)
            缓存对象:移除()
        end
    },
    自定义触发器 = {
        缓存 = {},
        类名 = "游戏",
        成员名 = "自定义事件",
        移除方法 = function(缓存对象)
            缓存对象:移除()
        end
    },


    计时器_循环执行 = {
        缓存 = {},
        类名 = "计时器",
        成员名 = "循环执行",
        移除方法 = function(缓存对象)
            缓存对象:移除()
        end
    },
    计时器_计次执行 = {
        缓存 = {},
        类名 = "计时器",
        成员名 = "计次执行",
        移除方法 = function(缓存对象)
            缓存对象:移除()
        end
    },

}

---@param 配置 重载配置
---@param 重载移除 boolean
local function 设置是否缓存对象(配置, 重载移除)
    if 重载移除 then
        y3[配置.类名][配置.成员名] = function(...)
            local 缓存对象 = 配置.原函数(...)
            表_插入指定位置值(配置.缓存, 缓存对象)
            return 缓存对象
        end
    end
end

---@class Config
local m = y3.config

---@param 参数 {触发器:boolean,计时器:boolean}
function m.设置重载是否移除对象(参数)
    if y3.游戏.是否为调试模式() then
        for 类型, 是否缓存 in pairs(参数) do
            if 类型 == "触发器" then
                设置是否缓存对象(重载缓存配置.全局触发器, 是否缓存)
                设置是否缓存对象(重载缓存配置.自定义触发器, 是否缓存)
            elseif 类型 == "计时器" then
                设置是否缓存对象(重载缓存配置.计时器_循环执行, 是否缓存)
                设置是否缓存对象(重载缓存配置.计时器_计次执行, 是否缓存)
            end
        end
    end
end

local function 注册()
    if y3.游戏.是否为调试模式() then
        for _, 配置 in pairs(重载缓存配置) do
            配置.原函数 = y3[配置.类名][配置.成员名]
        end
        -- 调试输出("重载配置", 重载缓存配置)
        y3.重载.事件_重载之前(function(reload, willReload)
            调试输出("开始重载")
            for _, 配置 in pairs(重载缓存配置) do
                调试输出(字符串格式化("缓存 %s - %d", 配置.类名 .. "." .. 配置.成员名, #配置.缓存))
                for index, 缓存对象 in ipairs(配置.缓存) do
                    if 配置.移除方法 then
                        配置.移除方法(缓存对象)
                    end
                end
            end
        end)
    end
end


注册()
