--形状
---@class Shape
---@field handle py.Shape
---@overload fun(py_shape: py.Shape): self
local M = Class 'Shape'

M.type = 'shape'

---@param py_shape py.Shape
---@return self
function M:__init(py_shape)
    self.handle = py_shape
    return self
end

---@param py_shape py.Shape
---@return Shape
function M.get_by_handle(py_shape)
    return New 'Shape' (py_shape)
end

---创建环形区域
---@param in_radius number 内半径
---@param out_radius number 外半径
---@return Shape
function M.create_annular_shape(in_radius, out_radius)
    local py_shape = GlobalAPI.create_annular_shape(Fix32(in_radius), Fix32(out_radius))
    return M.get_by_handle(py_shape)
end

---创建圆形区域
---@param radius number 半径
---@return Shape
function M.create_circular_shape(radius)
    local py_shape = GlobalAPI.create_circular_shape(Fix32(radius))
    return M.get_by_handle(py_shape)
end

---创建矩形区域
---@param width number 宽度
---@param length number 长度
---@param angle number 角度
---@return Shape
function M.create_rectangle_shape(width, length, angle)
    local py_shape = GlobalAPI.create_rectangle_shape(Fix32(width), Fix32(length), angle)
    return M.get_by_handle(py_shape)
end

---扇形
---@param radius number 半径
---@param angle number 角度
---@param direction number 方向
---@return Shape
function M.create_sector_shape(radius, angle, direction)
    local py_shape = GlobalAPI.create_sector_shape(Fix32(radius), Fix32(angle), direction)
    return M.get_by_handle(py_shape)
end

return M
