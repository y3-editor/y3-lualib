# Camera

镜头

## apply

```lua
(method) Camera:apply(player_or_group?: Player|PlayerGroup, duration?: number, slope_mode?: y3.Const.CameraMoveMode)
```

 引用镜头

@*param* `player_or_group` — 玩家或玩家组，默认为所有玩家

@*param* `duration` — 过渡时间，默认为0

@*param* `slope_mode` — 过渡模式，默认为匀速
## camera_shake

```lua
function Camera.camera_shake(player: Player, strength: number, speed: number, time: number, shake_type: integer)
```

镜头摇晃镜头

@*param* `player` — 玩家

@*param* `strength` — 晃动幅度

@*param* `speed` — 速率

@*param* `time` — 持续时间

@*param* `shake_type` — 震动模式
## camera_shake_with_decay

```lua
function Camera.camera_shake_with_decay(player: Player, shake: number, attenuation: number, frequency: number, time: number, shake_type: integer)
```

镜头带衰减震动

@*param* `player` — 玩家

@*param* `shake` — 震动幅度

@*param* `attenuation` — 衰减

@*param* `frequency` — 频率

@*param* `time` — 持续时间

@*param* `shake_type` — 震动模式
## cancel_area_limit

```lua
function Camera.cancel_area_limit(player: Player)
```

关闭镜头限制移动

@*param* `player` — 玩家
## cancel_camera_follow_unit

```lua
function Camera.cancel_camera_follow_unit(player: Player)
```

设置镜头取消跟随

@*param* `player` — 玩家
## cancel_tps_follow_unit

```lua
function Camera.cancel_tps_follow_unit(player: Player)
```

取消镜头第三人称跟随单位

@*param* `player` — 玩家
## create_camera

```lua
function Camera.create_camera(point: Point, focal_length: number, focal_height: number, yaw: number, pitch: number, range_of_visibility: number)
  -> Camera
```

创建镜头

@*param* `point` — 镜头所在点

@*param* `focal_length` — 焦距

@*param* `focal_height` — 焦点高度

@*param* `yaw` — 镜头的yaw

@*param* `pitch` — 镜头的pitch

@*param* `range_of_visibility` — 远景裁切范围
## disable_camera_move

```lua
function Camera.disable_camera_move(player: Player)
```

禁止玩家镜头移动

@*param* `player` — 玩家
## enable_camera_move

```lua
function Camera.enable_camera_move(player: Player)
```

允许玩家镜头移动

@*param* `player` — 玩家
## get_by_handle

```lua
function Camera.get_by_handle(py_camera: integer)
  -> camera: Camera
```

## get_by_res_id

```lua
function Camera.get_by_res_id(res_id: integer)
  -> Camera
```

 获取摆放在场景上的镜头
## get_camera_center_raycast

```lua
function Camera.get_camera_center_raycast(player: Player)
  -> 摄像机中心射线的碰撞点: Point
```

 获取玩家摄像机中心射线的碰撞点。
 必须先设置 `y3.config.sync.camera = true`

@*param* `player` — 玩家
## get_player_camera_direction

```lua
function Camera.get_player_camera_direction(player: Player)
  -> 摄像机朝向: Point
```

 获取玩家摄像机朝向。
 必须先设置 `y3.config.sync.camera = true`

@*param* `player` — 玩家
## handle

```lua
py.Camera
```

镜头配置
## is_camera_playing_timeline

```lua
function Camera.is_camera_playing_timeline(player: Player)
  -> 是否正在播放动画: boolean
```

玩家镜头是否正在播放动画

@*param* `player` — 玩家
## limit_in_rectangle_area

```lua
function Camera.limit_in_rectangle_area(player: Player, area: Area)
```

限制镜头移动范围

@*param* `player` — 玩家

@*param* `area` — 移动范围区域
## linear_move_by_time

```lua
function Camera.linear_move_by_time(player: Player, point: Point, time: number, move_type: integer)
```

线性移动（时间）

@*param* `player` — 玩家

@*param* `point` — 目标点

@*param* `time` — 过渡时间

@*param* `move_type` — 移动模式
## look_at_point

```lua
function Camera.look_at_point(player: Player, point: Point, time: number)
```

设置镜头朝向点

@*param* `player` — 玩家

@*param* `point` — 目标点

@*param* `time` — 过渡时间
## play_camera_timeline

```lua
function Camera.play_camera_timeline(player: Player, camera_timeline_id: py.CamlineID)
```

播放镜头动画

@*param* `player` — 玩家

@*param* `camera_timeline_id` — 镜头动画ID
## set_camera_follow_unit

```lua
function Camera.set_camera_follow_unit(player: Player, unit: Unit, x: number, y: number, height: number)
```

设置镜头跟随单位

@*param* `player` — 玩家

@*param* `unit` — 目标单位

@*param* `x` — 过渡时间

@*param* `y` — 移动模式

@*param* `height` — 高度
## set_distance

```lua
function Camera.set_distance(player: Player, value: number, time: number)
```

设置焦点距离

@*param* `player` — 玩家

@*param* `value` — 值

@*param* `time` — 过渡时间
## set_focus_height

```lua
function Camera.set_focus_height(player: Player, value: number, time: number)
```

设置镜头焦点高度

@*param* `player` — 玩家

@*param* `value` — 值

@*param* `time` — 过渡时间
## set_keyboard_move_camera_speed

```lua
function Camera.set_keyboard_move_camera_speed(player: Player, speed: number)
```

设置镜头移动速度（键盘）

@*param* `player` — 玩家

@*param* `speed` — 移动速度
## set_max_distance

```lua
function Camera.set_max_distance(player: Player, value: number)
```

设置镜头高度上限

@*param* `player` — 玩家

@*param* `value` — 高度上限
## set_mouse_move_camera_speed

```lua
function Camera.set_mouse_move_camera_speed(player: Player, speed: number)
```

设置镜头移动速度（鼠标）

@*param* `player` — 玩家

@*param* `speed` — 移动速度
## set_moving_with_mouse

```lua
function Camera.set_moving_with_mouse(player: Player, state: boolean)
```

设置是否可以鼠标移动镜头

@*param* `player` — 玩家

@*param* `state` — 开关
## set_rotate

```lua
function Camera.set_rotate(player: Player, angle_type: py.CameraRotate, value: number, time: number)
```

设置镜头角度

@*param* `player` — 玩家

@*param* `angle_type` — 角度类型

@*param* `value` — 值

@*param* `time` — 过渡时间
## set_tps_follow_unit

```lua
function Camera.set_tps_follow_unit(player: Player, unit: Unit, sensitivity?: number, yaw?: number, pitch?: number, x_offset?: number, y_offset?: number, z_offset?: number, camera_distance?: number)
```

设置镜头第三人称跟随单位

@*param* `player` — 玩家

@*param* `unit` — 目标单位

@*param* `sensitivity` — 灵敏度

@*param* `yaw` — yaw

@*param* `pitch` — pitch

@*param* `x_offset` — 偏移量X

@*param* `y_offset` — 偏移量Y

@*param* `z_offset` — 偏移高度

@*param* `camera_distance` — 距离焦点距离
## show_tps_mode_mouse

```lua
function Camera.show_tps_mode_mouse(player: Player, switch: boolean)
```

设置TPS视角鼠标显示

@*param* `player` — 玩家

@*param* `switch` — 是否显示鼠标
## stop_camera_timeline

```lua
function Camera.stop_camera_timeline(player: Player)
```

停止镜头动画

@*param* `player` — 玩家
## type

```lua
string
```


