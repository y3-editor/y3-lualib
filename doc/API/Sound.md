# Sound

声音

## get_by_handle

```lua
function Sound.get_by_handle(py_sound: py.SoundEntity)
  -> Sound
```

## handle

```lua
py.SoundEntity
```

声音对象
## play

```lua
function Sound.play(player: Player, sound: py.AudioKey, options?: Sound.PlayOptions)
  -> Sound?
```

播放声音

@*param* `player` — 玩家

@*param* `sound` — 声音

@*param* `options` — 播放选项
## play_3d

```lua
function Sound.play_3d(player: Player, sound: py.AudioKey, point: Point, options?: Sound.Play3DOptions)
  -> Sound?
```

播放3D声音

@*param* `player` — 玩家

@*param* `sound` — 声音

@*param* `point` — 目标点

@*param* `options` — 播放选项
## play_with_object

```lua
function Sound.play_with_object(player: Player, sound: py.AudioKey, unit: Unit, options?: Sound.PlayUnitOptions)
  -> Sound?
```

跟随单位播放声音

@*param* `player` — 玩家

@*param* `sound` — 声音

@*param* `unit` — 跟随的单位

@*param* `options` — 播放选项
## set_volume

```lua
(method) Sound:set_volume(player: Player, volume: integer)
```

 设置音量

@*param* `player` — 玩家

@*param* `volume` — 音量(0-100)
## stop

```lua
(method) Sound:stop(player: Player, is_immediately?: boolean)
```

停止播放声音

@*param* `player` — 玩家

@*param* `is_immediately` — 是否立即停止

# Sound.Play3DOptions

## ensure

```lua
boolean
```

是否确保播放
## fade_in

```lua
number
```

渐入时间
## fade_out

```lua
number
```

渐出时间
## height

```lua
number
```

高度
## loop

```lua
boolean
```

是否循环

# Sound.PlayOptions

## fade_in

```lua
number
```

渐入时间
## fade_out

```lua
number
```

渐出时间
## loop

```lua
boolean
```

是否循环

# Sound.PlayUnitOptions

## ensure

```lua
boolean
```

是否确保播放
## fade_in

```lua
number
```

渐入时间
## fade_out

```lua
number
```

渐出时间
## loop

```lua
boolean
```

是否循环
## offset_x

```lua
number
```

X轴偏移
## offset_y

```lua
number
```

Y轴偏移
## offset_z

```lua
number
```

Z轴偏移

