---@overload fun(表:table,值:any)
---@overload fun(表:table,位置:integer,值:any)
function 表_插入指定位置值(...)
    table.insert(...)
end

---@param 表 table
---@param 位置? integer
---@return any 被移除的值
function 表_删除指定位置值(表, 位置)
    return table.remove(表, 位置)
end

---@param ... any
---@return table
---@nodiscard
function 表_组包(...)
    return table.pack(...)
end

---@generic T
---@param 表 T[]
---@param 开始位置? integer
---@param 结束位置? integer
---@return T ...
---@nodiscard
function 表_解包(表, 开始位置, 结束位置)
    return table.unpack(表, 开始位置, 结束位置)
end

---@param 文本 string
---@return table
function 表_创建自JSON文本(文本)
    return y3.json.decode(文本)
end

---@param 表 table
---@return string
function 表_到JSON文本(表)
    return y3.json.encode(表)
end

---@param 表名 string 表格编辑器中的名字
---@return table 获取到的表
function 表_从编辑器获取(表名)
    return y3.游戏.get_table(表名)
end

---表_是否存在字段
---@param 表 table
---@param 字段 integer|string
---@return boolean
function 表_是否存在字段(表, 字段)
    return y3.游戏.table_has_key(表, 字段)
end

---表_清空
---@param 表 table
function 表_清空(表)
    y3.游戏.clear_table(表)
end

---表_加密
---@param 表 table
function 表_加密(表)
    y3.游戏.encrypt_table(表)
end

---表_到字符串
---@param 表 table
---@param 配置? table
function 表_到字符串(表, 配置)
    return y3.util.dump(表, 配置)
end

---表_获取长度
---@param 表 table
---@return integer 长度
function 表_获取长度(表)
    local 长度 = 0
    for key, value in pairs(表) do
        长度 = 长度 + 1
    end
    return 长度
end

---深度拷贝表,复制表,不处理元素,
---@param 旧表 table
---@return table 返回的新表
function 表_复制(旧表)
    local 新表
    return y3.util.deepCopy(旧表, 新表)
end

---表_设置路径字段值
---@param 表 table
---@param 路径 string  字段1.字段2.字段3
---@param 值 any
function 表_设置路径字段值(表, 路径, 值)
    local 当前字段 = 路径
    local 字段数组 = 字符串_分割(路径, ".")
    local 字段数 = 表_获取长度(字段数组)
    local 当前表 = 表
    if type(当前表) ~= "table" then
        调试警告("设置表路径值, 必须输入表参数", 路径, 值)
    end
    if 字段数 > 0 then
        for i = 1, 字段数 - 1, 1 do
            当前字段 = 字段数组[i]
            if 表_是否存在字段(当前表, 当前字段) == false then
                当前表[当前字段] = {}
            end
            当前表 = 当前表[当前字段]
        end
        当前字段 = 字段数组[字段数]
        当前表[当前字段] = 值
    else
        log.error("表_设置路径字段值, 路径不能为空")
    end
end

---表_获取路径字段值
---@param 表 table
---@param 路径 string  字段1.字段2.字段3
---@return any
function 表_获取路径字段值(表, 路径)
    local 当前字段 = 路径
    local 字段数组 = 字符串_分割(路径, ".")
    local 字段数 = 表_获取长度(字段数组)
    local 当前表 = 表
    if type(当前表) ~= "table" then
        调试警告("获取表路径值, 必须输入表参数", 路径)
    end
    if 字段数 > 0 then
        for i = 1, 字段数 - 1, 1 do
            当前字段 = 字段数组[i]
            if 表_是否存在字段(当前表, 当前字段) == false then
                return nil
            end
            -- print(表_到字符串(当前表))
            当前表 = 当前表[当前字段]
        end
        当前字段 = 字段数组[字段数]
        return 当前表[当前字段]
    else
        log.error("表_设置路径字段值, 路径不能为空")
    end
end

---提供一个列表，其所有元素都是字符串或数字，返回字符串 list[i]..sep..list[i+1] ··· sep..list[j]。
---@overload fun(表:table,分隔符?:string,开始位置?:integer,结束卫视?:integer)
---@return string
function 表_连接(...)
    return table.concat(...)
end

---@param 表 table 一维表,数组
---@param 分隔符 string
---@return string|nil
function 表_连接P(表, 分隔符)
    local 返回文本 = ""
    if 表 then
        for _, value in ipairs(表) do
            if value ~= nil then
                if type(value) == "table" and not 表_是否存在字段(value, "__class__") then
                    返回文本 = 返回文本 .. 表_到字符串(value) .. 分隔符
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
function 表_获取最小可用索引(表, 最大值)
    最大值 = 最大值 or 100
    for i = 1, 最大值, 1 do
        if 表_是否存在字段(表, i) == false then
            return i
        end
    end
    return -1
end

---表_排序后遍历
--[[ 测试函数
    local 测试表 = { 5, 3, 2, 7, 9, 1, 12 }
    表_排序后遍历({ 表 = 测试表 }, function(index, key, value)
        print('测试表', index, key, value)
    end)
    表_排序后遍历({ 表 = 测试表, 倒序 = true }, function(index, key, value)
        print('测试表', index, key, value)
    end)
    测试表 = {
        c = {
            层级 = 3
        },
        a = {
            层级 = 1
        },
        d = {
            层级 = 4
        },
        b = {
            层级 = 2
        },
        e = {
            层级 = 4
        },
    }
    表_排序后遍历({ 表 = 测试表, 字段 = '层级' }, function(index, key, value)
        print('测试表2', index, key, value)
    end)
    表_排序后遍历({ 表 = 测试表, 字段 = '层级', 倒序 = true, }, function(index, key, value)
        print('测试表2', index, key, value)
    end)
]]
---@param 参数 {表:table,字段?:string,倒序?:boolean} @ 字段默认nil nil = value排列, '' = key排列, 字段路径(相对value) = value字段值排列,   倒序默认false
---@param 回调函数 fun(index:integer,key:integer|string,value:any)
---@return integer 表长度
function 表_排序后遍历(参数, 回调函数)
    local 临时表, 获取对比值, 插入值
    if 参数.倒序 then
        临时表 = { { 对比值 = -1 } }
        插入值 = function(key, 对比值)
            for index, value in ipairs(临时表) do
                if 对比值 > value.对比值 then
                    表_插入指定位置值(临时表, index, { 原字段 = key, 对比值 = 对比值 })
                    break
                end
            end
        end
    else
        临时表 = { { 对比值 = 9999999999 } }
        插入值 = function(key, 对比值)
            for index, value in ipairs(临时表) do
                if 对比值 <= value.对比值 then
                    表_插入指定位置值(临时表, index, { 原字段 = key, 对比值 = 对比值 })
                    break
                end
            end
        end
    end
    if 参数.字段 then
        if 参数.字段 == "" then
            获取对比值 = function(key, value)
                return key
            end
        else
            获取对比值 = function(key, value)
                return 表_获取路径字段值(value, 参数.字段)
            end
        end
    else
        获取对比值 = function(key, value)
            return value
        end
    end

    for key, value in pairs(参数.表) do
        local 对比值 = 获取对比值(key, value)
        插入值(key, 对比值)
    end

    table.remove(临时表)
    for index, value in ipairs(临时表) do
        -- print('---', index, 表_到字符串(value))
        回调函数(index, value.原字段, 参数.表[value.原字段])
    end
    local 返回长度 = #临时表
    临时表 = nil
    return 返回长度
end

---@param 表 table
---@param 数值回调 fun(k:integer|string,v:any):number
---@param 遍历回调 fun(i:integer,k:integer|string,v:any)
---@param 降序? boolean 默认升序
---@return integer 表长度
function 表_排序后遍历2(表, 数值回调, 遍历回调, 降序)
    local 临时表, 插入值
    if 降序 then
        临时表 = { { 对比值 = -9999999999 } }
        插入值 = function(key, 对比值)
            for index, value in ipairs(临时表) do
                if 对比值 > value.对比值 then
                    表_插入指定位置值(临时表, index, { 原字段 = key, 对比值 = 对比值 })
                    break
                end
            end
        end
    else
        临时表 = { { 对比值 = 9999999999 } }
        插入值 = function(key, 对比值)
            for index, value in ipairs(临时表) do
                if 对比值 <= value.对比值 then
                    表_插入指定位置值(临时表, index, { 原字段 = key, 对比值 = 对比值 })
                    break
                end
            end
        end
    end

    for key, value in pairs(表) do
        local 对比值 = 数值回调(key, value)
        插入值(key, 对比值)
    end
    table.remove(临时表)

    for index, value in ipairs(临时表) do
        遍历回调(index, value.原字段, 表[value.原字段])
    end
    return #临时表
end
