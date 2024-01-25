调试输出 = log.debug
调试警告 = log.warn
调试错误 = log.error

---@param 文件地址 string
---@return string|nil
function 文件_读取(文件地址)
    local 文件, 描述 = io.open(文件地址, "r")
    if 文件 then
        文件内容 = 文件:read("a")
        文件:close()
        return 文件内容
    else
        调试警告("文件读取失败", 文件地址, 描述)
    end
    return nil
end

---@generic T
---@param 索引 integer
---@param ... T
---@return T
function 多项选择(索引, ...)
    return 表_组包(...)[索引]
end

---@generic T
---@param 判断 any 判断为真返回结果1 否则返回结果2
---@param 结果1 T
---@param 结果2 T
---@return T
function 判断选择(判断, 结果1, 结果2)
    if 判断 then
        return 结果1
    else
        return 结果2
    end
end
