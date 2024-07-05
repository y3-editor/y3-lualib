---@meta _

---@class XDouble
---@operator unm:  XDouble
---@operator add:  XDouble
---@operator sub:  XDouble
---@operator mul:  XDouble
---@operator div:  XDouble
---@operator mod:  XDouble
---@operator pow:  XDouble
---@operator idiv: XDouble
local M = {}

---@param num y3.Number | string
---@return XDouble
function xdouble(num) end

---@return number
function M:float() end

-- 会取整
---@return integer
function M:int() end

-- 取绝对值
---@return XDouble
function M:abs() end

-- 反余弦（角度制）
---@return XDouble
function M:acos() end

-- 反正弦（弧度制）
---@return XDouble
function M:asin() end

-- 反正切（弧度制）
---@return XDouble
function M:atan() end

-- 向上取整
---@return XDouble
function M:ceil() end

-- 余弦（弧度制）
---@return XDouble
function M:cos() end

-- 自然对数
---@return XDouble
function M:exp() end

-- 向下取整
---@return XDouble
function M:floor() end

-- 取对数
---@return XDouble
function M:log() end

-- 四舍五入
---@return XDouble
function M:round() end

-- 正弦（弧度制）
---@return XDouble
function M:sin() end

-- 开方
---@return XDouble
function M:sqrt() end

-- 正切（弧度制）
---@return XDouble
function M:tan() end
