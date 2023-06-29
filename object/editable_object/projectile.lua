--- File Name : projectile.lua
--- Description: 投射物相关逻辑 对应编辑器---投射物

---@class Projectile
---@field handle py.ProjectileEntity
---@overload fun(py_projectile: py.ProjectileEntity): self
local M = Class 'Projectile'
M.type = 'projectile'

---@param py_projectile py.ProjectileEntity
---@return self
function M:constructor(py_projectile)
    self.handle = py_projectile
    return self
end

---@private
M.map = setmetatable({}, { __mode = 'kv' })

---@param py_projectile py.ProjectileEntity
---@return Projectile projectile
function M.get_lua_projectile_from_py(py_projectile)
    -- TODO 不保证对象唯一性
    if not M.map[py_projectile] then
        M.map[py_projectile] = New 'Projectile' (py_projectile)
    end
    return M.map[py_projectile]
end

y3.py_converter.register_py_to_lua('py.Projectile', M.get_lua_projectile_from_py)
y3.py_converter.register_lua_to_py('py.Projectile', function (lua_value)
    return lua_value.handle
end)

---获取投射物的类型ID
---@return py.ProjectileKey projectile_key
function M:get_key()
    return self.handle:api_get_key()
end

---是否存在
---@return boolean is_exist 是否存在
function M:is_exist()
    return  GameAPI.projectile_is_exist(self.handle)
end

---获取投射物高度
---@return number height 高度
function M:get_height()
    return self.handle:api_get_height()
end

---获取投射物剩余持续时间
---@return number duration 投射物剩余持续时间
function M:get_left_time()
    return self.handle:api_get_left_time()
end

---获取投射物的拥有者
---@return Unit unit 投射物的拥有者
function M:get_owner()
    local py_unit = self.handle:api_get_owner()
    return y3.unit.get_lua_unit_from_py(py_unit)
end

---获取投射物朝向
---@return number angle 投射物朝向
function M:get_facing()
    return self.handle:api_get_face_angle()
end

---获取投射物所在点
---@return Point point 投射物所在点
function M:get_point()
    local py_point = self.handle:api_get_position()
    -- TODO 见问题2
    ---@diagnostic disable-next-line: param-type-mismatch
    return y3.point.get_lua_point_from_py(py_point)
end

---是否拥有标签
---@param  tag string 标签
---@return boolean is_has_tag 是否拥有标签
function M:has_tag(tag)
    return GlobalAPI.has_tag(self.handle, tag)
end

---投射物添加标签
---@param tag string 标签
function M:add_tag(tag)
    self.handle:api_add_tag(tag)
end

---投射物移除标签
---@param tag string 标签
function M:remove_tag(tag)
    self.handle:api_remove_tag(tag)
end

---@class Projectile.CreateData
---@field key py.ProjectileKey 投射物类型ID
---@field target Point|Unit 创建位置
---@field socket? string 投射物关联骨骼，只有当 `target` 为单位时才有效
---@field angle? number 投射物朝向
---@field height? number 投射物高度
---@field time? number 投射物持续时间
---@field owner? Unit|Player 投射物拥有者
---@field ability? Ability 投射物关联技能
---@field visible_rule? integer 粒子特效可见性规则，默认为`1`
---@field remove_immediately? boolean 是否立即移除表现，如果不填会读表

-- 创建投射物
---@param data Projectile.CreateData 投射物创建数据
---@return Projectile
function M.create(data)
    if not data.owner then
        data.owner = y3.player.get_lua_player_by_id(31)
    end
    local target = data.target
    if target.type == 'point' then
        ---@cast target Point
        local py_obj = GameAPI.create_projectile_in_scene_new(
            data.key,
            target.handle,
            -- TODO 见问题3
            ---@diagnostic disable-next-line: param-type-mismatch
            data.owner.handle,
            data.angle and Fix32(data.angle) or nil,
            data.ability and data.ability.handle or nil,
            data.time and Fix32(data.time) or nil,
            data.time and true or false,
            data.height and Fix32(data.height) or nil,
            data.visible_rule,
            data.remove_immediately,
            data.remove_immediately == nil and true or false
        )
        return M.get_lua_projectile_from_py(py_obj)
    else
        ---@cast target Unit
        local py_obj = GameAPI.create_projectile_on_socket(
            data.key,
            target.handle,
            data.socket,
            Fix32(data.angle),
            -- TODO 见问题3
            ---@diagnostic disable-next-line: param-type-mismatch
            data.owner.handle,
            data.ability and data.ability.handle or nil,
            data.visible_rule,
            data.time and Fix32(data.time) or nil,
            data.time and true or false,
            data.remove_immediately,
            data.remove_immediately == nil and true or false
        )
        return M.get_lua_projectile_from_py(py_obj)
    end
end

---设置所属单位
---@param unit Unit 所属单位
function M:set_owner(unit)
    GameAPI.change_projectile_owner(self.handle, unit.handle)
end

---设置关联技能
---@param ability Ability 关联技能
function M:set_ability(ability)
    GameAPI.change_projectile_ability(self.handle, ability.handle)
end

---销毁
function M:remove()
    self.handle:api_delete(nil)
end

---设置高度
---@param height number 高度
function M:set_height(height)
    self.handle:api_raise_height(Fix32(height))
end

---设置坐标
---@param point Point 点坐标
function M:set_point(point)
    -- TODO 见问题3
    ---@diagnostic disable-next-line: param-type-mismatch
    self.handle:api_set_position(point.handle)
end

---设置朝向
---@param direction number 朝向
function M:set_facing(direction)
    self.handle:api_set_face_angle(direction)
end

---设置旋转
---@param x number x轴
---@param y number y轴
---@param z number z轴
function M:set_rotation(x, y, z)
    self.handle:api_set_rotation(x, y, z)
end

---设置缩放
---@param x number x轴
---@param y number y轴
---@param z number z轴
function M:set_scale(x, y, z)
    self.handle:api_set_scale(x, y, z)
end

---设置动画速度
---@param speed number
function M:set_animation_speed(speed)
    self.handle:api_set_animation_speed(speed)
end

---设置持续时间
---@param duration number 持续时间
function M:set_time(duration)
    self.handle:api_set_duration(duration)
end

---增加持续时间
---@param duration number 持续时间
function M:add_time(duration)
    self.handle:api_add_duration(duration)
end

---获得关联技能
---@return Ability? ability 投射物或魔法效果的关联技能
function M:get_ability()
    local py_ability = GlobalAPI.get_related_ability(self.handle)
    if py_ability then
        return y3.ability.get_lua_ability_from_py(py_ability)
    end
    return nil
end

return M
