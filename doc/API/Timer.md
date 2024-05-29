# Timer

同步计时器

所有玩家必须使用一致的计时器，否则会造成不同步

## all_timers

```lua
table
```

## count_loop

```lua
function Timer.count_loop(timeout: number, times: integer, on_timer: fun(timer: Timer, count: integer), desc?: string, immediate?: boolean)
  -> Timer
```

 循环执行，可以指定最大次数

@*param* `desc` — 描述

@*param* `immediate` — 是否立即执行一次(计入最大次数)
## count_loop_frame

```lua
function Timer.count_loop_frame(frame: integer, times: integer, on_timer: fun(timer: Timer, count: integer), desc?: string)
  -> Timer
```

 每经过一定帧数后执行，可以指定最大次数
> 请改用 `y3.ltimer.count_loop_frame`

@*param* `desc` — 描述
## desc

```lua
string
```

## execute

```lua
(method) Timer:execute(...any)
```

 立即执行
## get_by_handle

```lua
function Timer.get_by_handle(py_timer: py.Timer, on_timer: Timer.OnTimer)
  -> Timer
```

## get_elapsed_time

```lua
(method) Timer:get_elapsed_time()
  -> time: number
```

获取计时器经过的时间

@*return* `time` — 计时器经过的时间
## get_include_name

```lua
(method) Timer:get_include_name()
  -> string?
```

## get_init_count

```lua
(method) Timer:get_init_count()
  -> count: integer
```

获取计时器初始计数

@*return* `count` — 初始计数
## get_remaining_count

```lua
(method) Timer:get_remaining_count()
  -> count: integer
```

获取计时器剩余计数

@*return* `count` — 剩余计数
## get_remaining_time

```lua
(method) Timer:get_remaining_time()
  -> time: number
```

获取计时器剩余时间

@*return* `time` — 计时器剩余时间
## get_time_out_time

```lua
(method) Timer:get_time_out_time()
  -> time: number
```

获取计时器设置的时间

@*return* `time` — 设置的时间
## handle

```lua
py.Timer
```

计时器
## id

```lua
unknown
```

## id_counter

```lua
unknown
```

## include_name

```lua
(string|false)?
```

## is_removed

```lua
(method) Timer:is_removed()
  -> boolean
```

## is_running

```lua
(method) Timer:is_running()
  -> boolean
```

 是否在运行
## loop

```lua
function Timer.loop(timeout: number, on_timer: fun(timer: Timer, count: integer), desc?: string, immediate?: boolean)
  -> Timer
```

 循环执行

@*param* `desc` — 描述

@*param* `immediate` — 是否立即执行一次
## loop_frame

```lua
function Timer.loop_frame(frame: integer, on_timer: fun(timer: Timer, count: integer), desc?: string)
  -> Timer
```

 每经过一定帧数后执行
> 请改用 `y3.ltimer.loop_frame`

@*param* `desc` — 描述
## mode

```lua
Timer.Mode
```

## on_timer

```lua
Timer.OnTimer
```

## pairs

```lua
function Timer.pairs()
  -> fun():Timer?
```

 遍历所有的计时器，仅用于调试（可能会遍历到已经失效的）
## pause

```lua
(method) Timer:pause()
```

 暂停计时器
## remove

```lua
(method) Timer:remove()
```

 移除计时器
## resume

```lua
(method) Timer:resume()
```

 继续计时器
## type

```lua
string
```

## wait

```lua
function Timer.wait(timeout: number, on_timer: fun(timer: Timer), desc?: string)
  -> Timer
```

 等待时间后执行

@*param* `desc` — 描述
## wait_frame

```lua
function Timer.wait_frame(frame: integer, on_timer: fun(timer: Timer), desc?: string)
  -> Timer
```

 等待一定帧数后执行
> 请改用 `y3.ltimer.wait_frame`

@*param* `desc` — 描述

# Timer.Mode

```lua
Timer.Mode:
    | 'second'
    | 'frame'
```


```lua
'frame'|'second'
```


# Timer.OnTimer


```lua
fun(timer: Timer, ...any)
```


