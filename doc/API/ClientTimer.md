# ClientTimer

客户端计时器

由你自己电脑的CPU驱动的计时器，完全是异步的（即使是同步执行）
在游戏暂停时也会继续计时并回调
> 如果你不知道什么是异步，请不要使用这个模块！

## all_timers

```lua
table
```

## count

```lua
integer
```

## execute

```lua
(method) ClientTimer:execute(...any)
```

 立即执行
## get_elapsed_frame

```lua
(method) ClientTimer:get_elapsed_frame()
  -> integer
```

获取经过的帧数
## get_elapsed_time

```lua
(method) ClientTimer:get_elapsed_time()
  -> number
```

 获取经过的时间
## get_include_name

```lua
(method) ClientTimer:get_include_name()
  -> string?
```

## get_init_count

```lua
(method) ClientTimer:get_init_count()
  -> integer
```

 获取初始计数
## get_remaining_count

```lua
(method) ClientTimer:get_remaining_count()
  -> integer
```

 获取剩余计数
## get_remaining_frame

```lua
(method) ClientTimer:get_remaining_frame()
  -> integer
```

获取剩余帧数
## get_remaining_time

```lua
(method) ClientTimer:get_remaining_time()
  -> number
```

 获取剩余时间
## get_time_out_time

```lua
(method) ClientTimer:get_time_out_time()
  -> number
```

 获取计时器设置的时间
## id

```lua
integer
```

## include_name

```lua
string?
```

## init_frame

```lua
integer
```

## init_ms

```lua
integer
```

## is_running

```lua
(method) ClientTimer:is_running()
  -> boolean
```

 是否正在运行
## loop

```lua
function ClientTimer.loop(timeout: number, on_timer: ClientTimer.OnTimer)
  -> ClientTimer
```

 循环执行
## loop_count

```lua
function ClientTimer.loop_count(timeout: number, count: integer, on_timer: ClientTimer.OnTimer)
  -> ClientTimer
```

 循环执行，可以指定最大次数
## loop_count_frame

```lua
function ClientTimer.loop_count_frame(frame: integer, count: integer, on_timer: ClientTimer.OnTimer)
  -> ClientTimer
```

 每经过一定帧数后执行，可以指定最大次数
## loop_frame

```lua
function ClientTimer.loop_frame(frame: integer, on_timer: ClientTimer.OnTimer)
  -> ClientTimer
```

 每经过一定帧数后执行
## mode

```lua
ClientTimer.Mode
```

## on_timer

```lua
ClientTimer.OnTimer
```

## pairs

```lua
function ClientTimer.pairs()
  -> fun():ClientTimer?
```

 遍历所有的计时器，仅用于调试（可能会遍历到已经失效的）
## pause

```lua
(method) ClientTimer:pause()
```

 暂停计时器
## paused_at_frame

```lua
integer?
```

## paused_at_ms

```lua
number?
```

## paused_frame

```lua
integer
```

## paused_ms

```lua
integer
```

## pausing

```lua
boolean?
```

## pop

```lua
(method) ClientTimer:pop()
```

## push

```lua
(method) ClientTimer:push()
```

## queue_index

```lua
integer?
```

## remove

```lua
(method) ClientTimer:remove()
```

 移除计时器
## removed

```lua
boolean?
```

## resume

```lua
(method) ClientTimer:resume()
```

 恢复计时器
## runned_count

```lua
integer
```

## set_time_out

```lua
(method) ClientTimer:set_time_out()
```

## start_frame

```lua
integer
```

## start_ms

```lua
integer
```

## target_frame

```lua
integer
```

## target_ms

```lua
number
```

## time

```lua
number
```

## total_paused_frame

```lua
integer
```

## total_paused_ms

```lua
integer
```

## update_frame

```lua
function ClientTimer.update_frame()
```

立即更新到下一帧
## wait

```lua
function ClientTimer.wait(timeout: number, on_timer: ClientTimer.OnTimer)
  -> ClientTimer
```

 等待时间后执行
## wait_frame

```lua
function ClientTimer.wait_frame(frame: integer, on_timer: ClientTimer.OnTimer)
  -> ClientTimer
```

 等待一定帧数后执行
## wakeup

```lua
(method) ClientTimer:wakeup()
```

## waking_up

```lua
boolean?
```


# ClientTimer.Mode

```lua
ClientTimer.Mode:
    | 'second'
    | 'frame'
```


```lua
'frame'|'second'
```


# ClientTimer.OnTimer


```lua
fun(timer: ClientTimer, count: integer, local_player: Player)
```


