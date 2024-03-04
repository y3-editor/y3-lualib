---@class 表
local m = Class "表"

---@overload fun(表:table,值:any)
---@overload fun(表:table,位置:integer,值:any)
function m.插入(...)
    table.insert(...)
end

---@param 表 table
---@param 位置? integer
---@return any 被移除的值
function m.移除(表, 位置)
    return table.remove(表, 位置)
end

---@param ... any
---@return table
---@nodiscard
function m.组包(...)
    return table.pack(...)
end

---@generic T
---@param 表 T[]
---@param 开始位置? integer
---@param 结束位置? integer
---@return T ...
---@nodiscard
function m.解包(表, 开始位置, 结束位置)
    return table.unpack(表, 开始位置, 结束位置)
end

---@param 文本 string
---@return table
function m.创建字JSON文本(文本)
    return y3.json.decode(文本)
end

---@param 表 table
---@return string
function m.到JSON文本(表)
    return y3.json.encode(表)
end

---@param 表名 string 表格编辑器中的名字
---@return table 获取到的表
function m.从编辑器获取(表名)
    return y3.游戏.get_table(表名)
end

---表_是否存在字段
---@param 表 table
---@param 字段 integer|string
---@return boolean
function m.是否存在字段(表, 字段)
    return y3.游戏.table_has_key(表, 字段)
end

---表_清空
---@param 表 table
function m.清空(表)
    y3.游戏.clear_table(表)
end

---表_加密
---@param 表 table
function m.加密(表)
    y3.游戏.encrypt_table(表)
end

---表_到字符串
---@param 表 table
---@param 配置? table
function m.到字符串(表, 配置)
    return y3.util.dump(表, 配置)
end

---表_获取长度
---@param 表 table
---@return integer 长度
function m.获取真实长度(表)
    local 长度 = 0
    for key, value in pairs(表) do
        长度 = 长度 + 1
    end
    return 长度
end

---深度拷贝表,复制表,不处理元素,
---@param 旧表 table
---@return table 返回的新表
function m.赋值(旧表)
    local 新表
    return y3.util.deepCopy(旧表, 新表)
end

local 获取键 = function(键)
    local 返回键
    返回键 = 字符串.匹配(键, "^%[(%d+)%]$")
    if 返回键 then
        return 到数值(返回键)
    end
    return 键
end

---表_设置路径字段值
---@param 表 table
---@param 路径 string  字段1.字段2.字段3
---@param 值 any
function m.设置路径值(表, 路径, 值)
    local 字段数组 = 字符串.分割(路径, ".")
    local 字段数 = 表.获取真实长度(字段数组)
    local 当前表 = 表
    local 当前字段 = 获取键(路径)
    if type(当前表) ~= "table" then
        调试警告("设置表路径值, 必须输入表参数", 路径, 值)
    end
    if 字段数 > 0 then
        for i = 1, 字段数 - 1, 1 do
            当前字段 = 获取键(字段数组[i])
            if 表.是否存在字段(当前表, 当前字段) == false then
                当前表[当前字段] = {}
            end
            当前表 = 当前表[当前字段]
        end
        当前字段 = 获取键(字段数组[字段数])
        当前表[当前字段] = 值
    else
        log.error("表_设置路径字段值, 路径不能为空")
    end
end

---表_获取路径字段值
---@param 表 table
---@param 路径 string  字段1.字段2.字段3
---@return any
function m.获取路径值(表, 路径)
    local 字段数组 = 字符串.分割(路径, ".")
    local 字段数 = 表.获取真实长度(字段数组)
    local 当前表 = 表
    local 当前字段 = 获取键(路径)
    if type(当前表) ~= "table" then
        调试警告("获取表路径值, 必须输入表参数", 路径)
    end
    if 字段数 > 0 then
        for i = 1, 字段数 - 1, 1 do
            当前字段 = 获取键(字段数组[i])
            if 表.是否存在字段(当前表, 当前字段) == false then
                return nil
            end
            -- print(表_到字符串(当前表))
            当前表 = 当前表[当前字段]
        end
        当前字段 = 获取键(字段数组[字段数])
        return 当前表[当前字段]
    else
        log.error("表_设置路径字段值, 路径不能为空")
    end
end

---提供一个列表，其所有元素都是字符串或数字，返回字符串 list[i]..sep..list[i+1] ··· sep..list[j]。
---@overload fun(表:table,分隔符?:string,开始位置?:integer,结束卫视?:integer)
---@return string
function m.连接(...)
    return table.concat(...)
end

---@param 表 table 一维表,数组
---@param 分隔符 string
---@return string|nil
function m.连接P(表, 分隔符)
    local 返回文本 = ""
    if 表 then
        for _, value in ipairs(表) do
            if value ~= nil then
                if type(value) == "table" and not 表.是否存在字段(value, "__class__") then
                    返回文本 = 返回文本 .. 表.到字符串(value) .. 分隔符
                else
                    返回文本 = 返回文本 .. 到字符串(value) .. 分隔符
                end
            else
                返回文本 = 返回文本 .. "nil" .. 分隔符
            end
        end
        return 返回文本
    end
    return nil
end

---表_获取最小可用索引
---@param 表 table
---@param 最大值? integer|nil 查找最大值以下的
---@return integer 没找到返回-1
function m.获取最小可用索引(表, 最大值)
    最大值 = 最大值 or 100
    for i = 1, 最大值, 1 do
        if 表[i] == nil then
            return i
        end
    end
    return -1
end

---@param 待排序表 table
---@param 数值回调 fun(k:integer|string,v:any):number|nil
---@param 遍历回调 fun(i:integer,k:integer|string,v:any)
---@param 降序? boolean 默认升序
---@return integer 表长度
function m.排序遍历(待排序表, 数值回调, 遍历回调, 降序)
    local 临时表, 插入值
    if 降序 then
        临时表 = { { 对比值 = -9999999999 } }
        插入值 = function(key, 对比值)
            for index, value in ipairs(临时表) do
                if 对比值 > value.对比值 then
                    m.插入(临时表, index, { 原字段 = key, 对比值 = 对比值 })
                    break
                end
            end
        end
    else
        临时表 = { { 对比值 = 9999999999 } }
        插入值 = function(key, 对比值)
            for index, value in ipairs(临时表) do
                if 对比值 <= value.对比值 then
                    m.插入(临时表, index, { 原字段 = key, 对比值 = 对比值 })
                    break
                end
            end
        end
    end

    for key, value in pairs(待排序表) do
        local 对比值 = 数值回调(key, value)
        if 对比值 then
            插入值(key, 对比值)
        end
    end
    table.remove(临时表)

    for index, value in ipairs(临时表) do
        遍历回调(index, value.原字段, 待排序表[value.原字段])
    end
    return #临时表
end

return m
