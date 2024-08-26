--投射物
---@class Projectile
---@field handle py.ProjectileEntity
---@field phandle py.ProjectileEntity
---@field package _removed_by_py? boolean
---@overload fun(id: integer, py_projectile: py.ProjectileEntity): self
local M = Class 'Projectile'
M.type = 'projectile'

---@class Projectile: Storage
Extends('Projectile', 'Storage')
---@class Projectile: GCHost
Extends('Projectile', 'GCHost')
---@class Projectile: ObjectEvent
Extends('Projectile', 'ObjectEvent')
---@class Projectile: KV
Extends('Projectile', 'KV')

function M:__tostring()
    return string.format('{projectile|%s|%s}'
        , self:get_key()
        , self.handle
    )
end

---@param id integer
---@param py_projectile py.ProjectileEntity
---@return self
function M:__init(id, py_projectile)
    self.handle = py_projectile
    self.phandle = y3.py_proxy.wrap(py_projectile, GameAPI.projectile_is_exist)
    self.id     = id
    return self
end

function M:__del()
    M.ref_manager:remove(self.id)
    y3.py_proxy.kill(self.phandle)
    if self._removed_by_py then
        return
    end
    self.phandle:api_delete()
end

---@package
M.ref_manager = New 'Ref' ('Projectile', function (id)
    local py_proj = GameAPI.get_projectile_by_id(id)
    if not py_proj then
        return nil
    end
    return New 'Projectile' (id, py_proj)
end)

---@param py_projectile py.ProjectileEntity
---@return Projectile? projectile
function M.get_by_handle(py_projectile)
    if not py_projectile then
        return nil
    end
    local id = y3.py_proxy.wrap(py_projectile, GameAPI.projectile_is_exist):api_get_id()
    local projectile = M.ref_manager:get(id)
    return projectile
end

---@param id py.ProjectileID
---@return Projectile
function M.get_by_id(id)
    local projectile = M.ref_manager:get(id)
    return projectile
end

y3.py_converter.register_py_to_lua('py.Projectile', M.get_by_handle)
y3.py_converter.register_lua_to_py('py.Projectile', function (lua_value)
    return lua_value.handle
end)
y3.py_converter.register_py_to_lua('py.ProjectileID', M.get_by_id)

y3.py_event_sub.new_global_trigger('ET_DEATH_PROJECTILE', function (data)
    ---@type py.ProjectileEntity
    local py_proj = data['projectile']
    if not py_proj then
        return
    end
    py_proj = y3.py_proxy.fetch(py_proj) or py_proj
    local id = py_proj:api_get_id()
    local projectile = M.ref_manager:fetch(id)
    if not projectile then
        return
    end
    projectile._removed_by_py = true
    projectile:remove()
end)

---获取投射物的类型ID
---@return py.ProjectileKey projectile_key
function M:get_key()
    return self.phandle:api_get_key() or 0
end

---是否存在
---@return boolean is_exist 是否存在
function M:is_exist()
    return  GameAPI.projectile_is_exist(self.handle)
end

---获取投射物高度
---@return number height 高度
function M:get_height()
    ---@diagnostic disable-next-line: undefined-field
    return y3.helper.tonumber(self.phandle:api_get_height()) or 0.0
end

---获取投射物剩余持续时间
---@return number duration 投射物剩余持续时间
function M:get_left_time()
    return y3.helper.tonumber(self.phandle:api_get_left_time()) or 0.0
end

---获取投射物的拥有者
---@return Unit? unit 投射物的拥有者
function M:get_owner()
    local py_unit = self.phandle:api_get_owner()
    if not py_unit then
        return nil
    end
    return y3.unit.get_by_handle(py_unit)
end

---获取投射物朝向
---@return number angle 投射物朝向
function M:get_facing()
    return y3.helper.tonumber(self.phandle:api_get_face_angle()) or 0.0
end

---获取投射物所在点
---@return Point point 投射物所在点
function M:get_point()
    local py_point = self.phandle:api_get_position()
    -- TODO 见问题2
    ---@diagnostic disable-next-line: param-type-mismatch
    return y3.point.get_by_handle(py_point)
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
    self.phandle:api_add_tag(tag)
end

---投射物移除标签
---@param tag string 标签
function M:remove_tag(tag)
    self.phandle:api_remove_tag(tag)
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
---@field visible_rule? integer | y3.Const.VisibleType 粒子特效可见性规则，默认为`1`
---@field remove_immediately? boolean 是否立即移除表现，如果不填会读表

-- 创建投射物
---@param data Projectile.CreateData 投射物创建数据
---@return Projectile
function M.create(data)
    if not data.owner then
        data.owner = y3.player.get_by_id(31)
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
            Fix32(data.angle or 0.0),
            data.ability and data.ability.handle or nil,
            Fix32(data.time or 60.0),
            data.time and true or false,
            Fix32(data.height or 0.0),
            y3.const.VisibleType[data.visible_rule] or data.visible_rule or 1,
            data.remove_immediately or false,
            data.remove_immediately == nil and true or false
        )
        return M.get_by_handle(py_obj) --[[@as Projectile]]
    else
        ---@cast target Unit
        local py_obj = GameAPI.create_projectile_on_socket(
            data.key,
            target.handle,
            data.socket or 'origin',
            Fix32(data.angle or 0.0),
            -- TODO 见问题3
            ---@diagnostic disable-next-line: param-type-mismatch
            data.owner.handle,
            data.ability and data.ability.handle or nil,
            y3.const.VisibleType[data.visible_rule] or data.visible_rule or 1,
            Fix32(data.time or 60.0),
            data.time and true or false,
            data.remove_immediately or false,
            data.remove_immediately == nil and true or false
        )
        return M.get_by_handle(py_obj) --[[@as Projectile]]
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
    Delete(self)
end

---设置高度
---@param height number 高度
function M:set_height(height)
    self.phandle:api_raise_height(Fix32(height))
end

---设置坐标
---@param point Point 点坐标
function M:set_point(point)
    -- TODO 见问题3
    ---@diagnostic disable-next-line: param-type-mismatch
    self.phandle:api_set_position(point.handle)
end

---设置朝向
---@param direction number 朝向
function M:set_facing(direction)
    self.phandle:api_set_face_angle(direction)
end

---设置旋转
---@param x number x轴
---@param y number y轴
---@param z number z轴
function M:set_rotation(x, y, z)
    self.phandle:api_set_rotation(x, y, z)
end

---设置缩放
---@param x number x轴
---@param y number y轴
---@param z number z轴
function M:set_scale(x, y, z)
    self.phandle:api_set_scale(x, y, z)
end

---设置动画速度
---@param speed number
function M:set_animation_speed(speed)
    self.phandle:api_set_animation_speed(speed)
end

---设置持续时间
---@param duration number 持续时间
function M:set_time(duration)
    self.phandle:api_set_duration(duration)
end

---增加持续时间
---@param duration number 持续时间
function M:add_time(duration)
    self.phandle:api_add_duration(duration)
end

---获得关联技能
---@return Ability? ability 投射物或魔法效果的关联技能
function M:get_ability()
    local py_ability = GlobalAPI.get_related_ability(self.handle)
    if py_ability then
        return y3.ability.get_by_handle(py_ability)
    end
    return nil
end

--设置投射物的可见性
---@param visible boolean # 是否可见
---@param player_or_group? Player | PlayerGroup # 应用于哪些玩家，默认为所有玩家
function M:set_visible(visible, player_or_group)
    player_or_group = player_or_group or y3.player_group.get_all_players()
    ---@diagnostic disable-next-line: param-type-mismatch
    self.phandle:api_set_projectile_visible(player_or_group.handle, visible)
end

function M:is_destroyed()
    ---@diagnostic disable-next-line: undefined-field
    local yes = self.phandle:is_destroyed()
    if yes == nil then
        return true
    end
    return yes
end

return M
