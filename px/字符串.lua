---@param 对象 any Y3对象
---@return string
function 到字符串(对象)
    return tostring(对象)
end

---@param 原字符串 string
---@param 被替换的字符串 string
---@param 要替换的字符串 string
---@param 替换次数? integer
---@return string @ 第二个返回值 替换次数 integer
function 字符串_替换(原字符串, 被替换的字符串, 要替换的字符串, 替换次数)
    return string.gsub(原字符串, 被替换的字符串, 要替换的字符串, 替换次数)
end

---@overload fun(待匹配字符串:string,模板文本:string,匹配次数:integer):...any
---@overload fun(待匹配字符串:string,模板文本:string):...any
function 字符串_匹配(...)
    return string.match(...)
end

---@param 原文本 string
---@param 检查文本 string[]
---@return boolean 包含任意一个返回true
function 字符串_判断是否包含数组中的文本(原文本, 检查文本)
    for index, value in ipairs(检查文本) do
        -- print(index, value)
        -- if string.find(原文本, value) then
        --     return true
        -- end
        if 原文本 == value then
            return true
        end
    end
    return false
end

---@param 原数据 string
---@param 查找数据 string
---@return integer|nil  找到返回起始位置 {1,2}
function 字符串_查找文本(原数据, 查找数据)
    return string.find(原数据, 查找数据)
end

---@param 原数据 string|number
---@param 查找数据 string|number
---@return...any|nil
function 字符串_正则匹配文本(原数据, 查找数据)
    return string.match(原数据, 查找数据)
end

function 字符串_获取字节长度(str)
    local curIndex = 0;
    local i = 1;
    local lastCount = 1;
    repeat
        lastCount = 字符串_获取字符占用字节数(str, i)
        i = i + lastCount;
        curIndex = curIndex + 1;
    until (lastCount == 0);
    return curIndex - 1;
end

local function __SubStringGetTrueIndex(str, index)
    local curIndex = 0;
    local i = 1;
    local lastCount = 1;
    repeat
        lastCount = 字符串_获取字符占用字节数(str, i)
        i = i + lastCount;
        curIndex = curIndex + 1;
    until (curIndex >= index);
    return i - lastCount;
end

function 字符串_获取字符占用字节数(str, index)
    local curByte = string.byte(str, index)
    local byteCount = 1;
    if curByte == nil then
        byteCount = 0
    elseif curByte > 0 and curByte <= 127 then
        byteCount = 1
    elseif curByte >= 192 and curByte <= 223 then
        byteCount = 2
    elseif curByte >= 224 and curByte <= 239 then
        byteCount = 3
    elseif curByte >= 240 and curByte <= 247 then
        byteCount = 4
    end
    return byteCount;
end

---@overload fun(文本: string|number, 开始位置: integer, 结束位置?: integer): string 开始位置起始为1 结束位置默认-1全部截取, 可以为负数截取至倒数
function 字符串_截取(文本, 开始位置, 结束位置)
    if 开始位置 < 0 then
        开始位置 = 字符串_获取字节长度(文本) + 开始位置 + 1;
    end

    if 结束位置 ~= nil and 结束位置 < 0 then
        结束位置 = 字符串_获取字节长度(文本) + 结束位置 + 1;
    end

    if 结束位置 == nil then
        return string.sub(文本, __SubStringGetTrueIndex(文本, 开始位置));
    else
        return string.sub(文本, __SubStringGetTrueIndex(文本, 开始位置), __SubStringGetTrueIndex(文本, 结束位置 + 1) - 1);
    end
end

---@param 待处理字符串 any
---@param 分隔符 any
---@return table
function 字符串_分割(待处理字符串, 分隔符)
    if type(分隔符) ~= "string" or #分隔符 <= 0 then
        return {}
    end
    local start = 1
    local arr = {}
    while true do
        local pos = string.find(待处理字符串, 分隔符, start, true)
        if not pos then
            break
        end
        table.insert(arr, string.sub(待处理字符串, start, pos - 1))
        start = pos + string.len(分隔符)
    end
    table.insert(arr, string.sub(待处理字符串, start))
    return arr
end

---@param 文本 string
---@param 模板 string
---@param 包含模板? boolean
function 字符串_取文本左边(文本, 模板, 包含模板)
    local s = 字符串_匹配(文本, '.-' .. 模板, 1)
    if s then
        if 包含模板 then
            return s
        end
        return 字符串_替换(s, 模板, '')
    end
    return nil
end

---@param 文本 string
---@param 模板 string
---@param 包含模板? boolean
function 字符串_取文本右边(文本, 模板, 包含模板)
    local s = 字符串_匹配(文本, 模板 .. '.*', 1)
    if s then
        if 包含模板 then
            return s
        end
        return 字符串_替换(s, 模板, '')
    end
    return nil
end

---@param 文本 string
---@param 左边文本 string
---@param 右边文本 string
---@param 包含模板? boolean
function 字符串_取文本中间(文本, 左边文本, 右边文本, 包含模板)
    local s = 字符串_匹配(文本, 左边文本 .. '.*' .. 右边文本, 1)
    if s then
        if 包含模板 then
            return s
        else
            s = 字符串_替换(s, 左边文本, '')
            s = 字符串_替换(s, 右边文本, '')
            return s
        end
    end
    return nil
end
