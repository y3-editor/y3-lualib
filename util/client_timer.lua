local math_floor = math.floor
local setmetatable = setmetatable
local xpcall = xpcall
local Delete = Delete
local New = New
local os_clock_banned = os.clock_banned
local sort_pairs = y3.util.sortPairs
local table_sort = table.sort


--客户端计时器
--
--由你自己电脑的CPU驱动的计时器，完全是异步的（即使是同步执行）
--在游戏暂停时也会继续计时并回调
--> 如果你不知道什么是异步，请不要使用这个模块！
---@class ClientTimer
---@field private include_name? string
---@field package id integer
---@field private time number
---@field private mode ClientTimer.Mode
---@field private count integer
---@field private on_timer ClientTimer.OnTimer
---@field private init_ms integer
---@field private start_ms integer
---@field private target_ms number
---@field private removed? boolean
---@field private pausing? boolean
---@field private paused_at_ms? number
---@field private paused_at_frame? integer
---@field private waking_up? boolean
---@field private queue_index? integer
---@overload fun(time: number, mode: ClientTimer.Mode, count: integer, on_timer: ClientTimer.OnTimer): self
local M = Class 'ClientTimer'

---@alias ClientTimer.Mode 'second' | 'frame'
---@alias ClientTimer.OnTimer fun(timer: ClientTimer, count: integer, local_player: Player)

---@private
M.all_timers = setmetatable({}, y3.util.MODE_V)

---@private
M.runned_count = 0

---@private
M.total_paused_ms = 0

---@private
M.total_paused_frame = 0

---@private
M.paused_ms = 0

---@private
M.paused_frame = 0

local cur_frame = 0
local cur_ms = math_floor(os.clock_banned() * 1000)
local id = 0

---@type table<integer, ClientTimer[]>
local ms_queues = {}
---@type table<integer, ClientTimer[]>
local frame_queues = {}

---@param time number
---@param mode ClientTimer.Mode
---@param count integer
---@param on_timer ClientTimer.OnTimer
function M:__init(time, mode, count, on_timer)
    id = id + 1

    self.id = id
    self.time = time
    self.mode = mode
    self.count = count
    self.on_timer = on_timer
    self.include_name = y3.reload.getCurrentIncludeName()
    self.init_ms = cur_ms
    self.init_frame = cur_frame

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
        self.target_frame = self.init_frame
                          + math_floor(self.time) * (self.runned_count + 1)
                          + self.total_paused_frame
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
    self.paused_ms = nil
    self.paused_frame = nil
    self.start_ms = cur_ms
    self.start_frame = cur_frame

    self:set_time_out()
end

-- 立即执行
function M:execute(...)
    xpcall(self.on_timer, log.error
        , self
        , self.runned_count
        ---@diagnostic disable-next-line: deprecated
        ,  y3.player.get_local()
        , ...
    )
end

-- 移除计时器
function M:remove()
    Delete(self)
end

---@package
function M:push()
    self:pop()
    local queue
    if self.mode == 'second' then
        local ms = math_floor(self.target_ms)
        if ms <= cur_ms then
            ms = cur_ms + 1
        end
        self.queue_index = ms
        queue = ms_queues[ms]
        if not queue then
            queue = {}
            ms_queues[ms] = queue
        end
        queue[#queue+1] = self
    else
        local frame = self.target_frame
        if frame <= cur_frame then
            frame = cur_frame + 1
        end
        self.queue_index = frame
        queue = frame_queues[frame]
        if not queue then
            queue = {}
            frame_queues[frame] = queue
        end
        queue[#queue+1] = self
    end
end

---@package
function M:pop()
    local ms = self.queue_index
    self.queue_index = nil
    local queue
    if self.mode == 'second' then
        queue = ms_queues[ms]
    else
        queue = frame_queues[ms]
    end
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
    if self.mode == 'second' then
        self.paused_at_ms = cur_ms
    else
        self.paused_at_frame = cur_frame
    end
    self:pop()
end

-- 恢复计时器
function M:resume()
    if not self.pausing or self.removed then
        return
    end
    self.pausing = false
    if self.mode == 'second' then
        local paused_ms = cur_ms - self.paused_at_ms
        self.paused_ms = self.paused_ms + paused_ms
        self.total_paused_ms = self.total_paused_ms + paused_ms
    else
        local paused_frame = cur_frame - self.paused_at_frame
        self.paused_frame = self.paused_frame + paused_frame
        self.total_paused_frame = self.total_paused_frame + paused_frame
    end

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
    if self.mode ~= 'second' then
        return 0.0
    end
    if self.waking_up then
        return (self.target_ms - self.start_ms - self.paused_ms) / 1000.0
    end
    if self.pausing then
        return (self.paused_at_ms - self.start_ms - self.paused_ms) / 1000.0
    end
    return (cur_ms - self.start_ms - self.paused_ms) / 1000.0
end

--获取经过的帧数
---@return integer
function M:get_elapsed_frame()
    if self.removed then
        return 0
    end
    if self.mode ~= 'frame' then
        return 0
    end
    if self.waking_up then
        return self.target_frame - self.start_frame - self.paused_frame
    end
    if self.pausing then
        return self.paused_at_frame - self.start_frame - self.paused_frame
    end
    return cur_frame - self.start_frame - self.paused_frame
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
        return (self.target_ms - self.paused_at_ms) / 1000.0
    end
    return (self.target_ms - cur_ms) / 1000.0
end

--获取剩余帧数
---@return integer
function M:get_remaining_frame()
    if self.removed or self.waking_up then
        return 0
    end
    if self.pausing then
        return self.target_frame - self.paused_at_frame
    end
    return self.target_frame - cur_frame
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
---@param on_timer ClientTimer.OnTimer
---@return ClientTimer
function M.wait(timeout, on_timer)
    local timer = New 'ClientTimer' (timeout, 'second', 1, on_timer)
    return timer
end

-- 等待一定帧数后执行
---@param frame integer
---@param on_timer ClientTimer.OnTimer
---@return ClientTimer
function M.wait_frame(frame, on_timer)
    local timer = New 'ClientTimer' (frame, 'frame', 1, on_timer)
    return timer
end

-- 循环执行
---@param timeout number
---@param on_timer ClientTimer.OnTimer
---@return ClientTimer
function M.loop(timeout, on_timer)
    local timer = New 'ClientTimer' (timeout, 'second', 0, on_timer)
    return timer
end

-- 每经过一定帧数后执行
---@param frame integer
---@param on_timer ClientTimer.OnTimer
---@return ClientTimer
function M.loop_frame(frame, on_timer)
    local timer = New 'ClientTimer' (frame, 'frame', 0, on_timer)
    return timer
end

-- 循环执行，可以指定最大次数
---@param timeout number
---@param count integer
---@param on_timer ClientTimer.OnTimer
---@return ClientTimer
function M.loop_count(timeout, count, on_timer)
    local timer = New 'ClientTimer' (timeout, 'second', count, on_timer)
    return timer
end

-- 每经过一定帧数后执行，可以指定最大次数
---@param frame integer
---@param count integer
---@param on_timer ClientTimer.OnTimer
---@return ClientTimer
function M.loop_count_frame(frame, count, on_timer)
    local timer = New 'ClientTimer' (frame, 'frame', count, on_timer)
    return timer
end

-- 遍历所有的计时器，仅用于调试（可能会遍历到已经失效的）
---@return fun():ClientTimer?
function M.pairs()
    local timers = {}
    for _, timer in sort_pairs(M.all_timers) do
        timers[#timers+1] = timer
    end
    local i = 0
    return function ()
        i = i + 1
        return timers[i]
    end
end

---@type ClientTimer[]
local desk = {}

local function update_queue(queue)
    table_sort(queue, function (a, b)
        return a.id < b.id
    end)
    for i = 1, #queue do
        desk[i] = queue[i]
    end
    for i = 1, #desk do
        local t = desk[i]
        desk[i] = nil
        t:wakeup()
    end
end

--立即更新到下一帧
function M.update_frame()
    cur_frame = cur_frame + 1

    do
        local queue = frame_queues[cur_frame]
        if queue then
            frame_queues[cur_frame] = nil
            update_queue(queue)
        end
    end

    local target_ms = math_floor(os_clock_banned() * 1000)
    for ti = cur_ms, target_ms do
        local queue = ms_queues[ti]
        if queue then
            cur_ms = ti
            ms_queues[ti] = nil
            update_queue(queue)
        end
    end

    cur_ms = target_ms
end

return M
