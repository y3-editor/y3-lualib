-- 使用角度制的三角函数
local deg = math.deg(1)
local rad = math.rad(1)

--数学库
--
--均使用角度制
---@class Math
local M = Class 'Math'

---获取随机角度
---@return number
function M.get_random_angle()
    return GameAPI.get_random_angle():float()
end

---范围内随机实数
---@param min number 范围内最小实数
---@param max number 范围内最大实数
---@return number float 随机实数
function M.random_float(min, max)
    return GameAPI.get_random_fixed(Fix32(min), Fix32(max)):float()
end

---正弦（角度制）
---@param value number 实数
---@return number float 实数
function M.sin(value)
    return math.sin(value * rad)
end

---余弦（角度制）
---@param value number 实数
---@return number float 实数
function M.cos(value)
    return math.cos(value * rad)
end

---正切（角度制）
---@param value number 实数
---@return number float 实数
function M.tan(value)
    return math.tan(value * rad)
end

---反正弦（角度制）
---@param value number 实数
---@return number float 实数
function M.asin(value)
    return math.asin(value) * deg
end

---反余弦（角度制）
---@param value number 实数
---@return number float 实数
function M.acos(value)
    return math.acos(value) * deg
end

---反正切（角度制）
---@param y number
---@param x number
---@return number float 实数
function M.atan(y, x)
    return math.atan(y, x) * deg
end

--计算2个角度之间的夹角（角度制）
---@param r1 number
---@param r2 number
---@return number angle 夹角，取值范围[0, 180]
---@return number direction 方向，1为顺时针，-1为逆时针
function M.includedAngle(r1, r2)
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
function M.isBetween(number, min, max)
    return number >= min and number <= max
end

---获取随机种子
---@return integer seed 随机种子
function M.get_random_seed()
    return GameAPI.get_random_seed()
end

return M
