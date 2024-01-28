---@overload fun(对象:any):number
---@overload fun(对象:any,进制:integer):number @进制 范围[2-36]
---@return integer
function 到数值(...)
    return tonumber(...)
end

---@param 数值 number
---@return integer
function 数学_向下取整(数值)
    return math.floor(数值)
end

---@param 数值 number
---@return integer
function 数学_向上取整(数值)
    return math.ceil(数值)
end

---@param 数值 number
---@return string
function 数学_获取整数文本(数值)
    return 到字符串(数学_向上取整(数值))
end

---@param 数值 number
---@return integer
function 数学_获取整数部分(数值)
    return math.modf(数值)[1]
end

---@param 数值 number
---@return number
function 数学_获取小数部分(数值)
    return math.modf(数值)[2]
end

---@param 参数 {行数:integer,列数:integer,宽度?:number,高度?:number,倒序?:boolean} @宽度默认100 高度默认100 倒序默认false, 坐标通过设置父控件相对, 可以达到上右排列
---@param 回调 fun(i:integer,x:integer,y:integer)
---@return table @{{x,y}}
function 数学_创建矩阵(参数, 回调)
    local 行数 = 参数.行数 or 1
    local 列数 = 参数.列数 or 1
    local 宽度 = 参数.宽度 or 100
    local 高度 = 参数.高度 or 100
    local 倒序 = 参数.倒序 or false
    local 返回矩阵 = {}
    local i, x, y = 0, 0, 0
    local 递增值 = 1
    if 倒序 then
        i = 行数 * 列数 + 1
        递增值 = -1
    end


    for 行 = 1, 行数 do
        for 列 = 1, 列数 do
            i = i + 递增值
            x = (列 - 1) * 宽度
            y = (行 - 1) * 高度
            回调(i, x, y)
            -- print(i, x, y)
            表_插入指定位置值(返回矩阵, { x = x, y = y })
        end
    end
    return 返回矩阵
end

---@param min number
---@param max number
---@return number
function 数学_获取随机实数(min, max)
    return y3.math.random_float(min, max)
end

---@param min integer
---@param max integer
---@return integer
function 数学_获取随机整数(min, max)
    return math.random(min, max)
end
