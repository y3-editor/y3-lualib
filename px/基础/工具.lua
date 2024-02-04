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
---@param true值 T
---@param false值 T
---@return T
function 判断选择(判断, true值, false值)
    if 判断 then
        return true值
    else
        return false值
    end
end

---数据格式 {k1 = {id = 1}} 的嵌套表, 关键字段,id 标识
---@param 数据 table
---@return table
function 数据id化(数据)
    local 返回数据 = {}
    local function 遍历数据(最终数据, 当前数据)
        for key, value in pairs(当前数据) do
            if type(value) == "table" and value.id then
                local id = value.id
                assert(not 表_是否存在字段(最终数据, id), "id重复")
                最终数据[id] = {
                    key = key
                }
                if type(value) == "table" then
                    local 新数据 = 表_复制(value)
                    遍历数据(最终数据[id], value)
                else
                    最终数据[id][key] = value
                end
            else
                if key ~= "id" then
                    if type(value) == "table" then
                        最终数据[key] = {}
                        遍历数据(最终数据[key], value)
                    else
                        最终数据[key] = value
                    end
                end
            end
        end
    end
    遍历数据(返回数据, 数据)
    return 返回数据
end

function 数据反id化(数据)
    local 返回数据 = {}
    local function 遍历数据(最终数据, 当前数据)
        for id, value in pairs(当前数据) do
            if type(value) == "table" and value.key then
                local key = value.key
                assert(not 表_是否存在字段(最终数据, key), "id重复")
                最终数据[key] = {
                    id = id
                }
                if type(value) == "table" then
                    遍历数据(最终数据[key], value)
                else
                    最终数据[key][id] = value
                end
            else
                if id ~= "key" then
                    if type(value) == "table" then
                        最终数据[id] = {}
                        遍历数据(最终数据[id], value)
                    else
                        最终数据[id] = value
                    end
                end
            end
        end
    end
    遍历数据(返回数据, 数据)
    return 返回数据
end
