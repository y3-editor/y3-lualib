-- 使用角度制的三角函数
local deg = math.deg(1)
local rad = math.rad(1)

--数学库
--
--均使用角度制
---@class 数学
local 数学 = Class "数学"

---@overload fun(对象:any):number
---@overload fun(对象:any,进制:integer):number @进制 范围[2-36]
---@return integer
function 到数值(...)
    return tonumber(...)
end

---@param 数值 number
---@return integer
function 数学.向下取整(数值)
    return math.floor(数值)
end

---@param 数值 number
---@return integer
function 数学.向上取整(数值)
    return math.ceil(数值)
end

---@param 数值 number
---@return string
function 数学.获取整数文本(数值)
    return 到字符串(数学.向上取整(数值))
end

---@param 数值 number
---@return integer
function 数学.获取整数部分(数值)
    return math.modf(数值)[1]
end

---@param 数值 number
---@return number
function 数学.获取小数部分(数值)
    return math.modf(数值)[2]
end

---@param 参数 {行数:integer,列数:integer,宽度?:number,高度?:number,倒序?:boolean} @宽度默认100 高度默认100 倒序默认false, 坐标通过设置父控件相对, 可以达到上右排列
---@param 回调 fun(i:integer,x:integer,y:integer)
---@return table @{{x,y}}
function 数学.创建矩阵(参数, 回调)
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
            表.数组_插入值(返回矩阵, { x = x, y = y })
        end
    end
    return 返回矩阵
end

---@param min integer
---@param max integer
---@return integer
function 数学.获取随机整数(min, max)
    return math.random(min, max)
end

---获取随机角度
---@return number
function 数学.获取随机角度()
    return GameAPI.get_random_angle():float()
end

---范围内随机实数
---@param min number 范围内最小实数
---@param max number 范围内最大实数
---@return number float 随机实数
function 数学.获取随机实数(min, max)
    return GameAPI.get_random_fixed(Fix32(min), Fix32(max)):float()
end

---正弦（角度制）
---@param value number 实数
---@return number float 实数
function 数学.正弦(value)
    return math.sin(value * rad)
end

---余弦（角度制）
---@param value number 实数
---@return number float 实数
function 数学.余弦(value)
    return math.cos(value * rad)
end

---正切（角度制）
---@param value number 实数
---@return number float 实数
function 数学.正切(value)
    return math.tan(value * rad)
end

---反正弦（角度制）
---@param value number 实数
---@return number float 实数
function 数学.反正弦(value)
    return math.asin(value) * deg
end

---反余弦（角度制）
---@param value number 实数
---@return number float 实数
function 数学.反余弦(value)
    return math.acos(value) * deg
end

---反正切（角度制）
---@param y number
---@param x number
---@return number float 实数
function 数学.反正切(y, x)
    return math.atan(y, x) * deg
end

--计算2个角度之间的夹角（角度制）
---@param r1 number
---@param r2 number
---@return number angle 夹角，取值范围[0, 180]
---@return number direction 方向，1为顺时针，-1为逆时针
function 数学.获取夹角(r1, r2)
    local r = (r1 - r2) % 360
    if r >= 180 then
        return 360 - r, 1
    else
        return r, -1
    end
end

-- 检查数字是否在[min, max]范围内
---@param number number
---@param min number
---@param max number
---@return boolean
function 数学.数字是否在范围内(number, min, max)
    return number >= min and number <= max
end

---获取随机种子
---@return integer seed 随机种子
function 数学.获取随机种子()
    return GameAPI.get_random_seed()
end

return 数学
