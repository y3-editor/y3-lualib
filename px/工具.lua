---@class par日志_配置
---@field 追踪等级 integer
---@field 打印参数 boolean
---@field 打印参数数量 integer
local 局_日志追踪等级 = {
    打印参数 = false,
    追踪等级 = 1,
    打印参数数量 = 3
}


---@param 配置 par日志_配置
function 日志_设置追踪等级(配置)
    局_日志追踪等级.追踪等级 = 配置.追踪等级 + 1
    局_日志追踪等级.打印参数 = 配置.打印参数
    局_日志追踪等级.打印参数数量 = 配置.打印参数数量
end

调试输出 = log.debug
日志_警告 = log.warn
日志_错误 = log.error


---@overload fun(标识:string,...)
调试输出 = function(标识, ...)
    local 调试文本 = 表_连接P(表_组包(...), "\n")
    local 信息文本 = ""
    local 参数文本 = ""
    for i = 2, 局_日志追踪等级.追踪等级 do
        local 文件地址 = debug.getinfo(i, "S")
        local 代码行 = debug.getinfo(i, "l")
        local 名称 = debug.getinfo(i, "n")
        if 文件地址 and 代码行 and 名称 then
            if not 表_是否存在字段(名称, "name") then
                名称.name = ""
            end
            if i == 2 then
                信息文本 = 信息文本 .. 名称.name .. " ==> " .. 标识 .. " ==>" .. 文件地址.source .. ":" .. 代码行.currentline
            else
                信息文本 = 信息文本 .. 名称.name .. " " .. 文件地址.source .. ":" .. 代码行.currentline
            end
            信息文本 = 信息文本 .. "\n"
        end
        if 局_日志追踪等级.打印参数 then
            for j = 1, 局_日志追踪等级.打印参数数量 do
                local 参数名, 参数值 = debug.getlocal(i, j)
                if 参数值 and type(参数值) == "table" then
                    参数文本 = 参数文本 .. 参数名 .. " ==> " .. 表_到字符串(参数值) .. "\n"
                    -- elseif 参数值 and type(参数值) ~= 'thread' and type(参数值) ~= 'function' and type(参数值) ~= 'boolean' then
                    --     参数文本 = 参数文本 .. 参数名 .. ' ==> ' .. 参数值 .. '\n'
                elseif 参数值 then
                    参数文本 = 参数文本 .. 参数名 .. " ==> " .. 到字符串(参数值) .. "\n"
                end
            end
        end
    end

    log.debug(信息文本 .. 调试文本)
end

---@overload fun(判断:boolean,标识:string,...)
调试输出_判断 = function(判断, 标识, ...)
    local 调试文本 = 表_连接P(表_组包(...), "\n")
    local 信息文本 = ""
    local 参数文本 = ""
    if 判断 then
        for i = 2, 局_日志追踪等级.追踪等级 do
            local 文件地址 = debug.getinfo(i, "S")
            local 代码行 = debug.getinfo(i, "l")
            local 名称 = debug.getinfo(i, "n")
            if 文件地址 and 代码行 and 名称 then
                if not 表_是否存在字段(名称, "name") then
                    名称.name = ""
                end
                if i == 2 then
                    信息文本 = 信息文本 .. 名称.name .. " ==> " .. 标识 .. " ==>" .. 文件地址.source .. ":" .. 代码行.currentline
                else
                    信息文本 = 信息文本 .. 名称.name .. " " .. 文件地址.source .. ":" .. 代码行.currentline
                end
                信息文本 = 信息文本 .. "\n"
            end
            if 局_日志追踪等级.打印参数 then
                for j = 1, 局_日志追踪等级.打印参数数量 do
                    local 参数名, 参数值 = debug.getlocal(i, j)
                    if 参数值 and type(参数值) == "table" then
                        参数文本 = 参数文本 .. 参数名 .. " ==> " .. 表_到字符串(参数值) .. "\n"
                        -- elseif 参数值 and type(参数值) ~= 'thread' and type(参数值) ~= 'function' and type(参数值) ~= 'boolean' then
                        --     参数文本 = 参数文本 .. 参数名 .. ' ==> ' .. 参数值 .. '\n'
                    elseif 参数值 then
                        参数文本 = 参数文本 .. 参数名 .. " ==> " .. 到字符串(参数值) .. "\n"
                    end
                end
            end
        end
        log.debug(信息文本 .. 调试文本)
    end
end

---@param 文件地址 string
---@return string|nil
function 文件_读取(文件地址)
    local 文件, 描述 = io.open(文件地址, "r")
    if 文件 then
        文件内容 = 文件:read("a")
        文件:close()
        return 文件内容
    else
        日志_警告("文件读取失败", 文件地址, 描述)
    end
    return nil
end

---@class 函数信息
---@field n {name:string,namewhat:string}
---@field S {source:string,short_src:string,linedefined:integer,lalinedefined:integer, what:string}
---@field l {currentline:integer}
---@field t {istailcall:string}
---@field u {nups:string,nparams:integer, isvararg:boolean}
---@field f {func:string}
---@field r {ftransfer:string, ntransfer:string}
---@field L {activelines:string}
function 调试_打印函数信息(等级)
    local args = { "n", "S", "l", "u", "f", "L" }
    for k, v in ipairs(args) do
        local flnfo = debug.getinfo(等级, v)
        for key, val in pairs(flnfo) do
            print(key, val)
        end
    end
end

---@generic T
---@param 索引 integer
---@param ... T
---@return T
function 多项选择(索引, ...)
    return 表_组包(...)[索引]
end
