# LocalTimer

本地计时器

支持异步创建或回调（只要你自己保证不会引发其他不同步的问题）
如果是同步执行的，那么会确保同步回调

## all_timers

```lua
table
```

## clock

```lua
function LocalTimer.clock()
  -> number
```

获取当前逻辑时间（毫秒）
## count

```lua
integer
```

## execute

```lua
(method) LocalTimer:execute(...any)
```

 立即执行
## get_elapsed_time

```lua
(method) LocalTimer:get_elapsed_time()
  -> number
```

 获取经过的时间
## get_include_name

```lua
(method) LocalTimer:get_include_name()
  -> string?
```

## get_init_count

```lua
(method) LocalTimer:get_init_count()
  -> integer
```

 获取初始计数
## get_remaining_count

```lua
(method) LocalTimer:get_remaining_count()
  -> integer
```

 获取剩余计数
## get_remaining_time

```lua
(method) LocalTimer:get_remaining_time()
  -> number
```

 获取剩余时间
## get_time_out_time

```lua
(method) LocalTimer:get_time_out_time()
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

## init_ms

```lua
integer
```

## is_running

```lua
(method) LocalTimer:is_running()
  -> boolean
```

 是否正在运行
## loop

```lua
function LocalTimer.loop(timeout: number, on_timer: LocalTimer.OnTimer)
  -> LocalTimer
```

 循环执行
## loop_count

```lua
function LocalTimer.loop_count(timeout: number, count: integer, on_timer: LocalTimer.OnTimer)
  -> LocalTimer
```

 循环执行，可以指定最大次数
## loop_count_frame

```lua
function LocalTimer.loop_count_frame(frame: integer, count: integer, on_timer: LocalTimer.OnTimer)
  -> LocalTimer
```

 每经过一定帧数后执行，可以指定最大次数
## loop_frame

```lua
function LocalTimer.loop_frame(frame: integer, on_timer: LocalTimer.OnTimer)
  -> LocalTimer
```

 每经过一定帧数后执行
## mode

```lua
LocalTimer.Mode
```

## on_timer

```lua
LocalTimer.OnTimer
```

## pairs

```lua
function LocalTimer.pairs()
  -> fun():LocalTimer?
```

 遍历所有的计时器，仅用于调试（可能会遍历到已经失效的）
## pause

```lua
(method) LocalTimer:pause()
```

 暂停计时器
## paused_at

```lua
number?
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
(method) LocalTimer:pop()
```

## push

```lua
(method) LocalTimer:push()
```

## queue_index

```lua
integer?
```

## remove

```lua
(method) LocalTimer:remove()
```

 移除计时器
## removed

```lua
boolean?
```

## resume

```lua
(method) LocalTimer:resume()
```

 恢复计时器
## runned_count

```lua
integer
```

## set_time_out

```lua
(method) LocalTimer:set_time_out()
```

## start_ms

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

## total_paused_ms

```lua
integer
```

## wait

```lua
function LocalTimer.wait(timeout: number, on_timer: LocalTimer.OnTimer)
  -> LocalTimer
```

 等待时间后执行
## wait_frame

```lua
function LocalTimer.wait_frame(frame: integer, on_timer: LocalTimer.OnTimer)
  -> LocalTimer
```

 等待一定帧数后执行
## wakeup

```lua
(method) LocalTimer:wakeup()
```

## waking_up

```lua
boolean?
```


# LocalTimer.Mode

```lua
LocalTimer.Mode:
    | 'second'
    | 'frame'
```


```lua
'frame'|'second'
```


# LocalTimer.OnTimer


```lua
fun(timer: LocalTimer, count: integer)
```


