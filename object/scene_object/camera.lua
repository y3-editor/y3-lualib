--镜头
---@class Camera
---@field handle integer
---@overload fun(py_camera: py.Camera): self
local M = Class "Camera"

M.type = "camera"

---@param py_camera integer
---@return self
function M:__init(py_camera)
    self.handle = py_camera
    return self
end

---@param py_camera integer
---@return Camera camera
function M.从handle获取(py_camera)
    local camera = New "Camera" (py_camera)
    return camera
end

y3.py_converter.register_py_to_lua("py.Camera", M.从handle获取)
y3.py_converter.register_lua_to_py("py.Camera", function(lua_value)
    return lua_value.handle
end)

---玩家镜头是否正在播放动画
---@param player Player 玩家
---@return boolean 是否正在播放动画
function M.是否正在播放动画(player)
    return GameAPI.is_cameraIS_playing_timeline(player.handle)
end

---创建镜头
---@param point Point 镜头所在点 焦点位置x,y
---@param 焦距 number 距离
---@param 焦点高度 number Z
---@param 导航角 number 镜头的yaw
---@param 俯视角 number 镜头的pitch
---@param 观察区域 number 观察区域
---@return Camera
function M.创建(point, 焦距, 焦点高度, 导航角, 俯视角, 观察区域)
    local id = GameAPI.add_camera_conf(
        point.handle,
        焦距,
        焦点高度,
        导航角,
        俯视角,
        观察区域
    )
    return M.从handle获取(id)
end

---允许玩家镜头移动
---@param player Player 玩家
function M.允许玩家移动(player)
    GameAPI.camera_set_move_enable(player.handle)
end

---禁止玩家镜头移动
---@param player Player 玩家
function M.禁止玩家移动(player)
    GameAPI.camera_set_move_not_enable(player.handle)
end

---播放镜头动画
---@param player Player 玩家
---@param camera_timeline_id py.CamlineID 镜头动画ID
function M.播放动画(player, camera_timeline_id)
    GameAPI.play_camera_timeline(player.handle, camera_timeline_id)
end

---停止镜头动画
---@param player Player 玩家
function M.停止动画(player)
    GameAPI.stop_camera_timeline(player.handle)
end

---镜头带衰减震动
---@param player Player 玩家
---@param shake number 震动幅度
---@param attenuation number 衰减
---@param frequency number 频率
---@param time number 持续时间
---@param shake_type integer 震动模式
function M.设置_带衰减震动(player, shake, attenuation, frequency, time, shake_type)
    GameAPI.camera_shake_with_decay(player.handle, Fix32(shake), Fix32(attenuation), Fix32(frequency), Fix32(time),
                                    shake_type)
end

---镜头摇晃镜头
---@param player Player 玩家
---@param strength number 晃动幅度
---@param speed number 速率
---@param time number 持续时间
---@param shake_type integer 震动模式
function M.摇晃(player, strength, speed, time, shake_type)
    GameAPI.camera_shake(player.handle, Fix32(strength), Fix32(speed), Fix32(time), shake_type)
end

---设置TPS视角鼠标显示
---@param player Player 玩家
---@param switch boolean 是否显示鼠标
function M.设置_第三人称跟随是否显示鼠标(player, switch)
    GameAPI.set_tps_mode_ctrl(player.handle, switch)
end

---线性移动（时间）
---@param player Player 玩家
---@param point Point 目标点
---@param time number 过渡时间
---@param move_type integer 移动模式
function M.线性移动(player, point, time, move_type)
    GameAPI.camera_linear_move_duration(player.handle, point.handle, Fix32(time), move_type)
end

---设置镜头跟随单位
---@param player Player 玩家
---@param unit Unit 目标单位
---@param x number 过渡时间
---@param y number 移动模式
---@param height number 高度
function M.设置_跟随单位(player, unit, x, y, height)
    GameAPI.camera_set_follow_unit(player.handle, unit.handle, x, y, height)
end

---设置镜头取消跟随
---@param player Player 玩家
function M.设置_取消跟随(player)
    GameAPI.camera_cancel_follow_unit(player.handle)
end

---设置镜头第三人称跟随单位
---@param player Player 玩家
---@param unit Unit 目标单位
---@param sensitivity? number 灵敏度
---@param yaw? number yaw
---@param pitch? number pitch
---@param x_offset? number 偏移量X
---@param y_offset? number 偏移量Y
---@param z_offset? number 偏移高度
---@param camera_distance? number 距离焦点距离
function M.设置_第三人称跟随(player, unit, sensitivity, yaw, pitch, x_offset, y_offset, z_offset, camera_distance)
    GameAPI.camera_set_tps_follow_unit(player.handle, unit.handle, sensitivity, yaw, pitch, x_offset, y_offset, z_offset,
                                       camera_distance)
end

---取消镜头第三人称跟随单位
---@param player Player 玩家
function M.设置_取消第三人称跟随(player)
    GameAPI.camera_cancel_tps_follow_unit(player.handle)
end

---设置镜头朝向点
---@param player Player 玩家
---@param point Point 目标点
---@param time number 过渡时间
function M.设置_朝向点(player, point, time)
    GameAPI.camera_look_at(player.handle, point.handle, Fix32(time))
end

---设置镜头高度上限
---@param player Player 玩家
---@param value number 高度上限
function M.设置_高度上限(player, value)
    GameAPI.set_camera_distance_max(player.handle, value)
end

---设置镜头角度
---@param player Player 玩家
---@param angle_type py.CameraRotate 角度类型
---@param value number 值
---@param time number 过渡时间
function M.设置_角度(player, angle_type, value, time)
    GameAPI.camera_set_param_rotate(player.handle, angle_type, Fix32(value), Fix32(time))
end

---设置焦点距离
---@param player Player 玩家
---@param value number 值
---@param time number 过渡时间
function M.设置_焦点距离(player, value, time)
    GameAPI.camera_set_param_distance(player.handle, Fix32(value), Fix32(time))
end

---设置镜头焦点高度
---@param player Player 玩家
---@param value number 值
---@param time number 过渡时间
function M.设置_焦点高度(player, value, time)
    GameAPI.camera_set_focus_y(player.handle, Fix32(value), Fix32(time))
end

---限制镜头移动范围
---@param player Player 玩家
---@param area Area 移动范围区域
function M.设置_限制移动范围(player, area)
    GameAPI.camera_limit_area(player.handle, area.handle)
end

---关闭镜头限制移动
---@param player Player 玩家
function M.设置_关闭限制移动(player)
    GameAPI.camera_limit_area_close(player.handle)
end

---设置是否可以鼠标移动镜头
---@param player Player 玩家
---@param state boolean 开关
function M.设置_是否可以鼠标移动镜头(player, state)
    GameAPI.set_mouse_move_camera_mode(player.handle, state)
end

---设置镜头移动速度（鼠标）
---@param player Player 玩家
---@param speed number 移动速度
function M.设置_鼠标移动镜头速度(player, speed)
    GameAPI.set_mouse_move_camera_speed(player.handle, speed)
end

---设置镜头移动速度（键盘）
---@param player Player 玩家
---@param speed number 移动速度
function M.设置_键盘移动镜头速度(player, speed)
    GameAPI.set_key_move_camera_speed(player.handle, speed)
end

-- 获取玩家摄像机朝向。
-- 必须先设置 `y3.config.sync.camera = true`
---@param player Player 玩家
---@return Point 摄像机朝向
function M.获取_玩家摄像机朝向(player)
    if not y3.config.sync.camera then
        error("必须先设置 `y3.config.sync.camera = true`")
    end
    local py_point = GameAPI.get_player_camera_direction(player.handle)
    -- TODO 见问题2
    ---@diagnostic disable-next-line: param-type-mismatch
    return y3.point.从handle获取(py_point)
end

-- 获取玩家摄像机中心射线的碰撞点。
-- 必须先设置 `y3.config.sync.camera = true`
---@param player Player 玩家
---@return Point 摄像机中心射线的碰撞点
function M.获取_玩家摄像机射线碰撞点(player)
    if not y3.config.sync.camera then
        error("必须先设置 `y3.config.sync.camera = true`")
    end
    local py_point = GameAPI.get_camera_center_raycast(player.handle)
    -- TODO 见问题2
    ---@diagnostic disable-next-line: param-type-mismatch
    return y3.point.从handle获取(py_point)
end

---@param 玩家 Player
---@param 过渡时间 number
---@param 移动类型 枚举.镜头移动类型
function M:应用配置(玩家, 过渡时间, 移动类型)
    ---@diagnostic disable-next-line: param-type-mismatch
    GameAPI.apply_camera_conf(玩家.handle, self.handle, 过渡时间, 移动类型)
end

return M
