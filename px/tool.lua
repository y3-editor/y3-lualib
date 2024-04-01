---@class 表
local m = Class "表"

---@overload fun(表:table,值:any)
---@overload fun(表:table,位置:integer,值:any)
function m.数组_插入值(...)
    table.insert(...)
end

---@param 表 table
---@param 位置? integer
---@return any 被移除的值
function m.数组_移除值于索引(表, 位置)
    return table.remove(表, 位置)
end

function m.数组_存在值(array, value)
    for i = 1, #array do
        if array[i] == value then
            return true
        end
    end
    return false
end

function m.数组_查找值(array, value)
    for i = 1, #array do
        if array[i] == value then
            return i
        end
    end
    return nil
end

function m.数组_插入非重复值(array, value)
    if not m.数组_存在值(array, value) then
        table.insert(array, value)
    end
end

function m.数组_移除值(array, value)
    for i = 1, #array do
        if array[i] == value then
            table.remove(array, i)
            return
        end
    end
end

---@param ... any
---@return table
---@nodiscard
function m.数组_创建于不定长参数(...)
    return table.pack(...)
end

---@generic T
---@param 表 T[]
---@param 开始位置? integer
---@param 结束位置? integer
---@return T ...
---@nodiscard
function m.数组_返回不定长参数(表, 开始位置, 结束位置)
    return table.unpack(表, 开始位置, 结束位置)
end

---提供一个列表，其所有元素都是字符串或数字，返回字符串 list[i]..sep..list[i+1] ··· sep..list[j]。
---@overload fun(表:table,分隔符?:string,开始位置?:integer,结束卫视?:integer)
---@return string
function m.数组_连接(...)
    return table.concat(...)
end

---@param 表 table 一维表,数组
---@param 分隔符 string
---@return string|nil
function m.数组_连接P(表, 分隔符)
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
---@return integer|nil
function m.数组_获取最小可用索引(表, 最大值)
    最大值 = 最大值 or 100
    for i = 1, 最大值, 1 do
        if 表[i] == nil then
            return i
        end
    end
    return nil
end

---@param 文本 string
---@return table
function m.表_创建于JSON文本(文本)
    return y3.json.decode(文本)
end

---@param 表 table
---@return string
function m.表_返回JSON文本(表)
    return y3.json.encode(表)
end

---表_到字符串
---@param 表 table
---@param 配置? {y3tostring:boolean,    alignment:unknown,    deep:unknown,    format:unknown,    longStringKey:unknown,    loop:unknown,    noArrayKey:unknown,    number:unknown,    sorter:unknown,}
function m.表_返回结构文本(表, 配置)
    return y3.util.dump(表, 配置)
end

---@param 表 table
---@return integer 长度
function m.表_获取长度(表)
    local 长度 = 0
    for key, value in pairs(表) do
        长度 = 长度 + 1
    end
    return 长度
end

---深度拷贝表,复制表,不处理元素,
---@param 旧表 table
---@param 新表? table
---@return table 返回的新表
function m.表_复制(旧表, 新表)
    return y3.util.deepCopy(旧表, 新表)
end

---@package
function m.表_解析路径字段(键)
    local 返回键
    返回键 = 字符串.匹配(键, "^%[(%d+)%]$")
    if 返回键 then
        return 到数值(返回键)
    end
    return 键
end

---表_设置路径字段值
---@param 表 table
---@param 路径 string  字段2.[1].字段2
---@param 值 any
function m.表_设置路径值(表, 路径, 值)
    local 字段数组 = 字符串.分割(路径, ".")
    local 字段数 = m.表_获取长度(字段数组)
    local 当前表 = 表
    local 当前字段 = m.表_解析路径字段(路径)

    for i = 1, 字段数 - 1, 1 do
        当前字段 = m.表_解析路径字段(字段数组[i])
        if 当前表[当前字段] == nil then
            当前表[当前字段] = {}
        end
        当前表 = 当前表[当前字段]
    end
    当前字段 = m.表_解析路径字段(字段数组[字段数])
    当前表[当前字段] = 值
end

---表_获取路径字段值
---@param 表 table
---@param 路径 string  字段1.字段2.字段3
---@return any
function m.表_获取路径值(表, 路径)
    local 字段数组 = 字符串.分割(路径, ".")
    local 字段数 = m.表_获取长度(字段数组)
    local 当前表 = 表
    local 当前字段 = m.表_解析路径字段(路径)
    for i = 1, 字段数 - 1, 1 do
        当前字段 = m.表_解析路径字段(字段数组[i])
        if 当前表[当前字段] == nil then
            return nil
        end
        当前表 = 当前表[当前字段]
    end
    当前字段 = m.表_解析路径字段(字段数组[字段数])
    return 当前表[当前字段]
end

---@param 待排序表 table
---@param 数值回调 fun(k:integer|string,v:any):number|nil
---@param 遍历回调 fun(i:integer,k:integer|string,v:any)
---@param 降序? boolean 默认升序
---@return any any
function m.表_排序遍历(待排序表, 数值回调, 遍历回调, 降序)
    local 临时表, 插入值
    if 降序 then
        临时表 = { { 对比值 = -9999999999 } }
        插入值 = function(key, 对比值)
            for index, value in ipairs(临时表) do
                if 对比值 > value.对比值 then
                    m.数组_插入值(临时表, index, { 原字段 = key, 对比值 = 对比值 })
                    break
                end
            end
        end
    else
        临时表 = { { 对比值 = 9999999999 } }
        插入值 = function(key, 对比值)
            for index, value in ipairs(临时表) do
                if 对比值 <= value.对比值 then
                    m.数组_插入值(临时表, index, { 原字段 = key, 对比值 = 对比值 })
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
        if 遍历回调(index, value.原字段, 待排序表[value.原字段]) then return 待排序表[value.原字段] end
    end
    return nil
end

---@param 待排序表 table
---@param 数值回调 fun(k:integer|string,v:any):number|nil
---@param 降序? boolean 默认升序
---@return any[]
function m.表_排序P(待排序表, 数值回调, 降序)
    local 临时表, 插入值, 返回表
    返回表 = { "占位" }
    if 降序 then
        临时表 = { { 对比值 = -9999999999 } }
        插入值 = function(key, 对比值)
            for index, value in ipairs(临时表) do
                if 对比值 > value.对比值 then
                    m.数组_插入值(临时表, index, { 原字段 = key, 对比值 = 对比值 })
                    table.insert(返回表, index, key)
                    break
                end
            end
        end
    else
        临时表 = { { 对比值 = 9999999999 } }
        插入值 = function(key, 对比值)
            for index, value in ipairs(临时表) do
                if 对比值 <= value.对比值 then
                    m.数组_插入值(临时表, index, { 原字段 = key, 对比值 = 对比值 })
                    table.insert(返回表, index, key)
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
    table.remove(返回表)
    return 返回表
end

return m
