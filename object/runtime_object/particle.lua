--粒子特效
---@class Particle
---@field handle py.Sfx
---@field private _removed? boolean
---@overload fun(sfx:py.Sfx): self
local M = Class "Particle"

M.type = "particle"

function M:__tostring()
    return string.format("{Particle|%s}"
    , self.handle
    )
end

---@param sfx py.Sfx
---@return self
function M:__init(sfx)
    self.handle = sfx
    return self
end

function M:__del()
    GameAPI.delete_sfx(self.handle)
end

---@param py_sfx py.Sfx
---@return Particle
function M.从handle获取(py_sfx)
    local particle = New "Particle" (py_sfx)
    return particle
end

y3.py_converter.register_py_to_lua("py.Sfx", M.从handle获取)
y3.py_converter.register_lua_to_py("py.Sfx", function(lua_value)
    return lua_value.handle
end)

---@class Particle.Param.Screen
---@field type py.SfxKey 特效id
---@field time number 持续时间
---@field target Player 玩家
---@field is_on_fog boolean 是否在迷雾上方

---创建屏幕特效
---@param data Particle.Param.Screen
---@return Particle
function M.场景屏幕特效(data)
    local py_player = data.target and data.target.handle
    local py_sfx = GameAPI.add_sfx_to_camera_with_return(data.type, data.time, py_player, data.is_on_fog)
    local ptc = New "Particle" (py_sfx)
    return ptc
end

---@class Particle.Param.Create
---@field type py.SfxKey 特效类型id
---@field target Point|Unit 点
---@field angle? number 方向
---@field scale? number 缩放
---@field time? number 持续时间
---@field height? number 高度，只有当 `target` 的类型为点时有效
---@field socket? string 特效挂节点，只有当 `target` 的类型为单位时有效
---@field follow_rotation? integer 跟随单位旋转的模式，只有当 `target` 的类型为单位时有效
---@field follow_scale? boolean 是否跟随单位缩放，只有当 `target` 的类型为单位时有效
---@field immediate? boolean 销毁时，是否有过度

---@class Particle.Param.CreateChine
---@field 特效类型 py.SfxKey 特效类型id
---@field 单位或点 Point|Unit 点
---@field 朝向? number 方向
---@field 缩放? number 缩放
---@field 持续时间? number 持续时间
---@field 高度? number 高度，只有当 `target` 的类型为点时有效
---@field 单位挂接点? string 特效挂节点，只有当 `target` 的类型为单位时有效
---@field 跟随单位旋转的模式? integer 跟随单位旋转的模式，只有当 `target` 的类型为单位时有效
---@field 跟随单位缩放? boolean 是否跟随单位缩放，只有当 `target` 的类型为单位时有效
---@field 销毁过渡? boolean 销毁时，是否有过度

--创建特效到单位或点
---@param 参数 Particle.Param.CreateChine
---@return Particle
function M.创建到单位或点(参数)
    ---@type Particle.Param.Create
    local data      = {
        target          = 参数.单位或点,
        type            = 参数.特效类型,
        angle           = 参数.朝向,
        follow_rotation = 参数.跟随单位旋转的模式,
        follow_scale    = 参数.跟随单位缩放,
        height          = 参数.高度,
        immediate       = 参数.销毁过渡,
        scale           = 参数.缩放,
        socket          = 参数.单位挂接点,
        time            = 参数.持续时间
    }
    local target    = data.target
    local angle     = data.angle or 0.0
    local scale     = data.scale or 1.0
    local time      = data.time or -1.0
    local immediate = data.immediate
    if target.type == "unit" then
        ---@cast target Unit
        local socket          = data.socket or "origin"
        local follow_rotation = data.follow_rotation
        local follow_scale    = data.follow_scale and true or false
        local py_sfx          = GameAPI.create_sfx_on_unit_new(
            data.type,
            target.handle,
            socket,
            follow_rotation or 0,
            follow_scale,
            scale,
            time,
            angle,
            immediate,
            immediate == nil
        )
        local ptc             = New "Particle" (py_sfx)
        return ptc
    else
        ---@cast target Point
        local height = data.height or 0.0
        local py_sfx = GameAPI.create_sfx_on_point(
            data.type,
            -- TODO 见问题2
            ---@diagnostic disable-next-line: param-type-mismatch
            target.handle,
            angle,
            scale,
            height,
            time,
            immediate,
            immediate == nil
        )
        local ptc = New "Particle" (py_sfx)
        return ptc
    end
end

---@private
---@return py.Sfx
function M:get_handle()
    return self.handle
end

--删除粒子
function M:移除()
    Delete(self)
end

--设置旋转角度
---@param x number X轴角度
---@param y number Y轴角度
---@param z number Z轴角度
function M:设置旋转角度(x, y, z)
    GameAPI.set_sfx_rotate(self.handle, x, y, z)
end

--设置朝向
---@param direction number 方向
function M:设置朝向(direction)
    GameAPI.set_sfx_angle(self.handle, direction)
end

--设置缩放比例
---@param x number X轴缩放
---@param y number Y轴缩放
---@param z number Z轴缩放
function M:设置缩放比例(x, y, z)
    GameAPI.set_sfx_scale(self.handle, x, y, z)
end

--设置高度
---@param height number 高度
function M:设置高度(height)
    GameAPI.set_sfx_height(self.handle, height)
end

--设置坐标
---@param point Point 点
function M:设置坐标(point)
    -- TODO 见问题2
    ---@diagnostic disable-next-line: param-type-mismatch
    GameAPI.set_sfx_position(self.handle, point.handle)
end

--设置动画速度
---@param speed number 速度
function M:设置动画速度(speed)
    GameAPI.set_sfx_animation_speed(self.handle, speed)
end

--设置持续时间
---@param duration number 持续时间
function M:设置持续时间(duration)
    GameAPI.set_sfx_duration(self.handle, duration)
end

--设置特效颜色
---@param x number # x
---@param y number # y
---@param z number # z
---@param w number # w
function M:set_color(x, y, z, w)
    GameAPI.set_sfx_color(self.handle, x, y, z, w)
end

--设置特效显示
---@param visible boolean # 开关
function M:set_visible(visible)
    local role = GameAPI.get_client_role()
    GameAPI.enable_sfx_visible(self.handle, role, visible)
end

return M
