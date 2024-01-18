local 文件目录 = {}
插件.初始化(function()
    if 游戏.是否为调试模式() then
        local 当前文件目录 = debug.getinfo(1, "S").source:sub(2)
        文件目录.地图目录 = 当前文件目录:match("(.-maps/.-/)script/")
        if 文件目录.地图目录 then
            文件目录.脚本目录 = 当前文件目录:match(".+script/")
            文件目录.项目目录 = 当前文件目录:match("(.-)maps/.-/script/")
            文件目录.场景文件 = 文件目录.地图目录 .. "ui/SceneUI.json"
            文件目录.元件文件 = 文件目录.地图目录 .. "ui/ui_config.json"
            文件目录.物编资源 = 文件目录.脚本目录 .. "src/物编资源.lua"
        end
    end
end)

local function 表_转LUA文件文本(表, 转换函数)
    local 返回文本 = 表_到字符串(表)
    返回文本 = 字符串_替换(返回文本, "%[\"", "")
    返回文本 = 字符串_替换(返回文本, "\"%]", "")
    if 转换函数 then
        返回文本 = 字符串_替换(返回文本, "\"/", "")
        返回文本 = 字符串_替换(返回文本, "/\"", "")
    end
    return 返回文本
end

---@param 文件地址 string
local function 资源_读取(文件地址)
    local 文件, 文件内容, 描述
    文件内容 = 文件_读取(文件地址)
    if 文件内容 == nil then return nil end

    文件, 描述 = io.open(文件地址, "w")
    if 文件 == nil then
        return nil
    end

    return {
        资源_替换 = function(资源名称, 资源对象, 注释文本)
            if 文件 then
                local 资源文本 = 表_转LUA文件文本(资源对象, true)
                local 新内容 = "--- 编辑器资源_" .. 资源名称 .. " -- @由破西资源插件生成 --\n"
                if 注释文本 then
                    新内容 = 新内容 .. 注释文本 .. 资源名称 .. " = " .. 资源文本 .. " --\n\n"
                else
                    新内容 = 新内容 .. "---@class " .. 资源名称 .. "\n" .. 资源名称 .. " = " .. 资源文本 .. " --\n\n"
                end
                local 正则表达式 = "%-%-%- 编辑器资源_" .. 资源名称 .. "[%s%S\n]-}.?%-%-\n\n?"
                if 字符串_查找文本(文件内容, 正则表达式) then
                    文件内容 = 字符串_替换(文件内容, 正则表达式, 新内容)
                else
                    文件内容 = 文件内容 .. 新内容
                end
            end
        end,

        资源_关闭 = function()
            if 文件 then
                文件:write(文件内容)
                local a, b, c = 文件:close()
            end
        end
    }
end



---@param 表 table
---@param 父路径 string
---@param 回调 fun(路径:string)
local function 遍历界面子控件(表, 父路径, 回调)
    for index, value in ipairs(表) do
        local 路径 = ""
        if 父路径 == "" then
            路径 = value.name
        else
            路径 = 父路径 .. "." .. value.name
        end
        回调(路径)
        if value.children then
            遍历界面子控件(value.children, 路径, 回调)
        end
    end
end

local function 资源_生成场景()
    local 文件内容 = 文件_读取(文件目录.场景文件)
    if 文件内容 == nil then
        日志_错误("物编资源插件: 场景UI初始化失败")
        return
    end
    表 = 表_创建自JSON文本(文件内容)
    local dic = {}

    for key, value in pairs(表.children) do
        dic[value.name] = {
            句柄 = value.name
        }
        遍历界面子控件(value.children, "", function(路径)
            local 子控件名称 = 字符串_替换(路径, "%.", "_")
            dic[value.name]["获取_" .. 子控件名称] = "/function (玩家,场景) return 场景.获取子控件(场景, 玩家,\'" .. 路径 .. "\') end/"
        end)
    end

    return dic
end

local function 资源_生成元件()
    local 文件内容 = 文件_读取(文件目录.元件文件)
    if 文件内容 == nil then
        日志_错误("物编资源插件: 场景UI初始化失败")
        return
    end
    表 = 表_创建自JSON文本(文件内容)
    local dic = {}

    for key, value in pairs(表.prefab_data) do
        dic[value.name] = {
            句柄 = value.name
        }
        遍历界面子控件(value.data.children, "", function(路径)
            local 子控件名称 = 字符串_替换(路径, "%.", "_")
            dic[value.name]["获取_" .. 子控件名称] = "/function (元件) return 元件.获取子控件(元件, \'" .. 路径 .. "\') end/"
        end)
    end
    return dic
end


---@param 过滤器? fun(路径:string):boolean 资源过滤器返回值 1是否写入 2新名称 3新值
local function 资源_生成控件(过滤器)
    过滤器 = 过滤器 or function(路径)
        local 过滤, 新名称, 新值
        新名称 = 字符串_替换(路径, ".*%.r", "")
        新值 = "/function (玩家) return 控件.从路径获取(玩家,'" .. 路径 .. "') end/"
        if 字符串_查找文本(路径, ".*%.r[^%.]+$") then
            过滤 = true
            -- 新名称 = 字符串_替换(路径, "%.", "_")
        end
        return 过滤, 新名称, 新值
    end
    local 返回资源 = {}
    local 画板列表 = 表_从编辑器获取("res画板")
    local 画板名称, 画板文件地址, 画板资源
    for 画板键名, value in pairs(画板列表) do
        画板名称 = 控件.从路径获取(玩家.从id获取(32), value.value):获取_名称()
        画板文件地址 = 文件目录.地图目录 .. "ui/" .. 画板名称 .. ".json"
        画板资源 = 文件_读取(画板文件地址)
        if 画板资源 then
            local 表 = 表_创建自JSON文本(画板资源)
            local dic = {}
            local 写入, 子控件名称, 子控件路径
            写入, 子控件名称, 子控件路径 = 过滤器(画板名称)
            dic.画板 = 子控件路径
            遍历界面子控件(表.children, 表.name, function(路径)
                写入, 子控件名称, 子控件路径 = 过滤器(路径)
                if 写入 then
                    dic[子控件名称] = 子控件路径
                end
            end)
            返回资源[画板键名] = dic
        end
    end
    return 返回资源
end


---@param 类名 string
---@param 类表 table
---@param 回调 fun(字段名:string,字段类型:string,字段值:any):新字段名:string|nil,新字段类型:string|nil
---@return unknown
local function 插件_生成类注释(类名, 类表, 回调)
    local function 添加注释(s, n, t)
        return s .. "---@field " .. n .. " " .. t .. "\n"
    end
    local 返回注释 = ""
    local function 遍历表(t, 路径)
        local 类名称
        local 字段注释 = ""
        for 字段名, 字段值 in pairs(t) do
            local 新路径
            if 路径 == "" then
                新路径 = 字段名
            else
                新路径 = 路径 .. "." .. 字段名
            end
            local 字段类型 = type(字段值)
            if 字段类型 == "table" then
                local 当前字段注释
                类名称, 当前字段注释 = 遍历表(字段值, 新路径)
                字段类型 = 类名称
                if 回调 then
                    local a, b = 回调(新路径, 字段类型, 字段值)
                    if a then
                        类名称 = a
                    end
                    if b then
                        字段类型 = b
                    end
                end
                返回注释 = 返回注释 .. "---@class " .. 类名称 .. "\n" .. 当前字段注释 .. "\n"
            else
                if 回调 then
                    local a, b = 回调(字段名, 字段类型, 字段值)
                    if a then
                        类名称 = a
                    end
                    if b then
                        字段类型 = b
                    end
                end
            end

            字段注释 = 添加注释(字段注释, 字段名, 字段类型)
        end

        return 路径, 字段注释
    end
    local 类, 字段 = 遍历表(类表, 类名)
    返回注释 = 返回注释 .. "---@class " .. 类 .. "\n" .. 字段

    return 返回注释
end

---生成物编资源文件在根目录下 物编资源.lua
---@param 配置? {控件过滤器?:fun(路径:string):boolean,string,string }控件过滤器 1是否写入 2新名称 3新值
function 插件_物编资源初始化(配置)
    配置 = 配置 or {}
    if 游戏.是否为调试模式() == false then
        return
    end

    local 文件 = 资源_读取(文件目录.物编资源)
    if 文件 == nil then
        return
    end

    local 资源列表 = {
        "res单位属性",
        "res单位类型",
        "res技能类型",
        "res模型类型",
        "res图片",
    }

    for _, 资源名称 in ipairs(资源列表) do
        local eca资源 = 表_从编辑器获取(资源名称)
        local lua资源 = {}
        for 名称, 值 in pairs(eca资源) do
            lua资源[名称] = 值.value
        end
        文件.资源_替换(资源名称, 表_转LUA文件文本(lua资源))
    end

    local 资源表 = 资源_生成场景()
    文件.资源_替换("res场景", 资源表, 插件_生成类注释("res场景", 资源表, function(字段名, 字段类型, 字段值)
        if 字段类型 == "string" and 字符串_查找文本(字段值, "function") then
            字段类型 = "fun(玩家:类_玩家,场景:类_场景):类_控件"
        end
        return 字段名, 字段类型
    end))

    资源表 = 资源_生成元件()
    文件.资源_替换("res元件", 资源表, 插件_生成类注释("res元件", 资源表, function(字段名, 字段类型, 字段值)
        if 字段类型 == "string" and 字符串_查找文本(字段值, "function") then
            字段类型 = "fun(元件:类_元件):类_控件"
        end
        return 字段名, 字段类型
    end))

    资源表 = 资源_生成控件(配置.控件过滤器)
    文件.资源_替换("res控件", 资源表, 插件_生成类注释("res控件", 资源表, function(字段名, 字段类型, 字段值)
        if 字段类型 == "string" and 字符串_查找文本(字段值, "function") then
            字段类型 = "fun(玩家:类_玩家):类_控件"
        end
        return 字段名, 字段类型
    end))

    文件.资源_关闭()
end
