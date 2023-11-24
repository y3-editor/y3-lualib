--地面
--
--地面碰撞相关方法
---@class Ground
local M = Class 'Ground'

---设置碰撞
---@param point Point  碰撞点
---@param is_collision_effect boolean  碰撞是否生效
---@param is_land_effect boolean  地面碰撞开关
---@param is_air_effect boolean  空中碰撞开关
function M.set_collision(point, is_collision_effect, is_land_effect, is_air_effect)
    -- TODO 见问题2
    ---@diagnostic disable-next-line: param-type-mismatch
    GameAPI.set_point_collision(point.handle, is_collision_effect, is_land_effect, is_air_effect)
end

---获取地图在该点位置的碰撞类型
---@param point Point  碰撞点
---@return integer
function M.get_collision(point)
    -- TODO 见问题2
    ---@diagnostic disable-next-line: param-type-mismatch
    return GameAPI.get_point_ground_collision(point.handle)
end

---获取地图在该点位置的视野类型
---@param point Point
---@return integer
function M.get_view_block_type(point)
    -- TODO 见问题2
    ---@diagnostic disable-next-line: param-type-mismatch
    return GameAPI.get_point_view_block_type(point.handle)
end

---获取地图在该点位置的层级
---@param point Point 点
---@return integer level 层级
function M.get_height_level(point)
    -- TODO 见问题2
    ---@diagnostic disable-next-line: param-type-mismatch
    return GameAPI.get_point_ground_height(point.handle):float() --[[@as integer]]
end

return M
