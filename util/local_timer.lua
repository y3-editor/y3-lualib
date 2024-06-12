--本地计时器
--
--支持异步创建或回调（只要你自己保证不会引发其他不同步的问题）
--如果是同步执行的，那么会确保同步回调
---@class LocalTimer
---@field private include_name? string
---@field package id integer
---@field private time number
---@field private mode LocalTimer.Mode
---@field private count integer
---@field private on_timer LocalTimer.OnTimer
---@field private init_ms integer
---@field private start_ms integer
---@field private target_ms number
---@field private removed? boolean
---@field private pausing? boolean
---@field private paused_at? number
---@field private waking_up? boolean
---@field private queue_index? integer
---@overload fun(time: number, mode: LocalTimer.Mode, count: integer, on_timer: LocalTimer.OnTimer): self
local M = Class 'LocalTimer'

---@alias LocalTimer.Mode 'second' | 'frame'
---@alias LocalTimer.OnTimer fun(timer: LocalTimer, count: integer)

---@private
M.all_timers = setmetatable({}, y3.util.MODE_V)

---@private
M.runned_count = 0

---@private
M.total_paused_ms = 0

---@private
M.paused_ms = 0

local cur_frame = 0
local cur_ms = 0
local id = 0

---@type table<integer, LocalTimer[]>
local timer_queues = {}

---@param time number
---@param mode LocalTimer.Mode
---@param count integer
---@param on_timer LocalTimer.OnTimer
function M:__init(time, mode, count, on_timer)
    id = id + 1

    self.id = id
    self.time = time
    self.mode = mode
    self.count = count
    self.on_timer = on_timer
    self.include_name = y3.reload.getCurrentIncludeName()
    self.init_ms = cur_ms
    self.target_ms = cur_ms
    self.start_ms = cur_ms

    M.all_timers[id] = self

    self:set_time_out()
end

function M:__del()
    self.removed = true
    self:pop()
end

---@private
function M:set_time_out()
    if self.removed or self.pausing then
        return
    end

    if self.mode == 'second' then
        self.target_ms = self.init_ms
                       + self.time * (self.runned_count + 1) * 1000.0
                       + self.total_paused_ms
    else
        self.target_ms = self.init_ms
                       + self.time * (self.runned_count + 1) * 1000 // y3.config.logic_frame
                       + self.total_paused_ms
    end

    self:push()
end

---@package
function M:wakeup()
    if self.removed or self.pausing then
        return
    end

    self.runned_count = self.runned_count + 1
    self.waking_up = true
    self:execute()
    self.waking_up = false
    if self.count > 0 and self.runned_count >= self.count then
        self:remove()
    end
    self.paused_ms = 0
    self.start_ms = cur_ms

    self:set_time_out()
end

-- 立即执行
function M:execute(...)
    xpcall(self.on_timer, log.error, self, self.runned_count, ...)
end

-- 移除计时器
function M:remove()
    Delete(self)
end

---@package
function M:push()
    self:pop()
    local ms = math.floor(self.target_ms)
    if ms <= cur_ms then
        ms = cur_ms + 1
    end
    local queue = timer_queues[ms]
    if not queue then
        queue = {}
        timer_queues[ms] = queue
    end
    queue[#queue+1] = self
    self.queue_index = ms
end

---@package
function M:pop()
    local ms = self.queue_index
    self.queue_index = nil
    local queue = timer_queues[ms]
    if not queue then
        return
    end
    for i = 1, #queue do
        if queue[i] == self then
            queue[i] = queue[#queue]
            queue[#queue] = nil
            break
        end
    end
end

-- 暂停计时器
function M:pause()
    if self.pausing or self.removed then
        return
    end
    self.pausing = true
    self.paused_at = cur_ms
    self:pop()
end

-- 恢复计时器
function M:resume()
    if not self.pausing or self.removed then
        return
    end
    self.pausing = false
    local paused_ms = cur_ms - self.paused_at
    self.paused_ms = self.paused_ms + paused_ms
    self.total_paused_ms = self.total_paused_ms + paused_ms

    if not self.waking_up then
        self:set_time_out()
    end
end

-- 是否正在运行
function M:is_running()
    return  not self.removed
        and not self.pausing
end

-- 获取经过的时间
---@return number
function M:get_elapsed_time()
    if self.removed then
        return 0.0
    end
    if self.waking_up then
        return (self.target_ms - self.start_ms - self.paused_ms) / 1000.0
    end
    if self.pausing then
        return (self.paused_at - self.start_ms - self.paused_ms) / 1000.0
    end
    return (cur_ms - self.start_ms - self.paused_ms) / 1000.0
end

-- 获取初始计数
---@return integer
function M:get_init_count()
    return self.count
end

-- 获取剩余时间
---@return number
function M:get_remaining_time()
    if self.removed or self.waking_up then
        return 0.0
    end
    if self.pausing then
        return (self.target_ms - self.paused_at) / 1000.0
    end
    return (self.target_ms - cur_ms) / 1000.0
end

-- 获取剩余计数
---@return integer
function M:get_remaining_count()
    if self.count <= 0 then
        return -1
    end
    return self.count - self.runned_count
end

-- 获取计时器设置的时间
---@return number
function M:get_time_out_time()
    return self.time
end

---@return string?
function M:get_include_name()
    return self.include_name
end

-- 等待时间后执行
---@param timeout number
---@param on_timer LocalTimer.OnTimer
---@return LocalTimer
function M.wait(timeout, on_timer)
    local timer = New 'LocalTimer' (timeout, 'second', 1, on_timer)
    return timer
end

-- 等待一定帧数后执行
---@param frame integer
---@param on_timer LocalTimer.OnTimer
---@return LocalTimer
function M.wait_frame(frame, on_timer)
    local timer = New 'LocalTimer' (frame, 'frame', 1, on_timer)
    return timer
end

-- 循环执行
---@param timeout number
---@param on_timer LocalTimer.OnTimer
---@return LocalTimer
function M.loop(timeout, on_timer)
    local timer = New 'LocalTimer' (timeout, 'second', 0, on_timer)
    return timer
end

-- 每经过一定帧数后执行
---@param frame integer
---@param on_timer LocalTimer.OnTimer
---@return LocalTimer
function M.loop_frame(frame, on_timer)
    local timer = New 'LocalTimer' (frame, 'frame', 0, on_timer)
    return timer
end

-- 循环执行，可以指定最大次数
---@param timeout number
---@param count integer
---@param on_timer LocalTimer.OnTimer
---@return LocalTimer
function M.loop_count(timeout, count, on_timer)
    local timer = New 'LocalTimer' (timeout, 'second', count, on_timer)
    return timer
end

-- 每经过一定帧数后执行，可以指定最大次数
---@param frame integer
---@param count integer
---@param on_timer LocalTimer.OnTimer
---@return LocalTimer
function M.loop_count_frame(frame, count, on_timer)
    local timer = New 'LocalTimer' (frame, 'frame', count, on_timer)
    return timer
end

-- 遍历所有的计时器，仅用于调试（可能会遍历到已经失效的）
---@return fun():LocalTimer?
function M.pairs()
    local timers = {}
    for _, timer in y3.util.sortPairs(M.all_timers) do
        timers[#timers+1] = timer
    end
    local i = 0
    return function ()
        i = i + 1
        return timers[i]
    end
end

--获取当前逻辑时间（毫秒）
---@return number
function M.clock()
    return cur_ms
end

---@type LocalTimer[]
local desk = {}
local function update_frame()
    cur_frame = cur_frame + 1

    local target_ms = cur_frame * 1000 // y3.config.logic_frame
    for ti = cur_ms, target_ms do
        local queue = timer_queues[ti]
        if queue then
            cur_ms = ti
            table.sort(queue, function (a, b)
                return a.id < b.id
            end)
            for i = 1, #queue do
                desk[i] = queue[i]
            end
            timer_queues[ti] = nil
            for i = 1, #desk do
                local t = desk[i]
                desk[i] = nil
                t:wakeup()
            end
        end
    end

    cur_ms = target_ms
end

---@diagnostic disable-next-line: deprecated
y3.timer.loop_frame(1, update_frame)

return M
