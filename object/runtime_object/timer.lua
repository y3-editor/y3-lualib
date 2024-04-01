---@alias Timer.OnTimer fun(timer: Timer,...)

---@alias Timer.Mode 'second' | 'frame'

--同步计时器
--
--所有玩家必须使用一致的计时器，否则会造成不同步
---@class Timer
---@field handle py.Timer
---@field desc string
---@field private on_timer Timer.OnTimer
---@field private include_name? string | false
---@field private mode Timer.Mode
---@overload fun(py_timer: py.Timer, on_timer: Timer.OnTimer, mode: Timer.Mode, desc: string): self
local M = Class "Timer"

M.type = "timer"

---@private
M.id_counter = y3.util.counter()

---@private
M.all_timers = setmetatable({}, y3.util.MODE_V)

---@param py_timer py.Timer
---@param on_timer Timer.OnTimer
---@param mode Timer.Mode
---@param desc string
---@return self
function M:__init(py_timer, on_timer, mode, desc)
    self.handle = py_timer
    self.on_timer = on_timer
    self.id = self.id_counter()
    self.mode = mode
    self.desc = desc
    M.all_timers[self.id] = self
    return self
end

function M:__del()
    if self.mode == "second" then
        GameAPI.cancel_timer(self.handle)
    else
        error("帧计时器不支持删除，若有此需求请改用 `y3.ltimer.xxx_frame`")
    end
    M.all_timers[self.id] = nil
end

---@param py_timer py.Timer
---@param on_timer Timer.OnTimer
---@return Timer
function M.从handle获取(py_timer, on_timer)
    local timer = New "Timer" (py_timer, on_timer)
    return timer
end

y3.py_converter.register_py_to_lua("py.Timer", M.从handle获取)
y3.py_converter.register_lua_to_py("py.Timer", function(lua_value)
    return lua_value.handle
end)

---@param frame integer
---@param count integer
---@param callback fun()
---@return py.Timer
local function run_timer_by_frame(frame, count, callback)
    local timer_node = {
        on_timer_callback = callback,
        _rt = {
            call_with_frame = function(f)
                f()
            end,
        },
    }
    ---@diagnostic disable-next-line: undefined-field
    return GameAPI.run_timer_by_frame(frame, count, false, timer_node, {})
end

---@param func function
---@return string
local function make_timer_reason(func)
    local info = debug.getinfo(func, "Sl")
    local sourceStr
    if info.currentline == -1 then
        sourceStr = "?"
    else
        sourceStr = ("%s:%d"):format(info.source, info.currentline)
    end
    return sourceStr
end

-- 等待时间后执行
---@param timeout number
---@param on_timer fun(timer: Timer)
---@param desc? string # 描述
---@return Timer
function M.单次执行(timeout, on_timer, desc)
    desc = desc or make_timer_reason(on_timer)
    ---@type Timer
    local timer
    local py_timer = GameAPI.add_timer(Fix32(timeout), false, function()
                                           timer:立即执行()
                                           timer:移除()
                                       end, desc)
    timer = New "Timer" (py_timer, on_timer, "second", desc)
    return timer
end

-- 等待一定帧数后执行
--> 请改用 `y3.ltimer.wait_frame`
---@deprecated
---@param frame integer
---@param on_timer fun(timer: Timer)
---@param desc? string # 描述
---@return Timer
function M.wait_frame(frame, on_timer, desc)
    desc = desc or make_timer_reason(on_timer)
    ---@type Timer
    local timer
    local py_timer = run_timer_by_frame(frame, 0, function()
        timer:立即执行()
        M.all_timers[timer.id] = nil
    end)
    timer = New "Timer" (py_timer, on_timer, "frame", desc)
    return timer
end

-- 循环执行
---@param timeout number
---@param on_timer fun(timer: Timer, count: integer)
---@param desc? string # 描述
---@return Timer
function M.循环执行(timeout, on_timer, desc)
    desc = desc or make_timer_reason(on_timer)
    local timer
    local count = 0
    local py_timer = GameAPI.add_timer(Fix32(timeout), true, function()
                                           count = count + 1
                                           timer:立即执行(count)
                                       end, desc)
    timer = New "Timer" (py_timer, on_timer, "second", desc)
    return timer
end

-- 每经过一定帧数后执行
--> 请改用 `y3.ltimer.loop_frame`
---@deprecated
---@param frame integer
---@param on_timer fun(timer: Timer, count: integer)
---@param desc? string # 描述
---@return Timer
function M.loop_frame(frame, on_timer, desc)
    desc = desc or make_timer_reason(on_timer)
    ---@type Timer
    local timer
    local count = 0
    local py_timer = run_timer_by_frame(frame, -1, function()
        count = count + 1
        timer:立即执行(count)
    end)
    timer = New "Timer" (py_timer, on_timer, "frame", desc)
    return timer
end

-- 循环执行，可以指定最大次数
---@param timeout number
---@param times integer
---@param on_timer fun(timer: Timer, count: integer)
---@param desc? string # 描述
---@return Timer
function M.计次执行(timeout, times, on_timer, desc)
    desc = desc or make_timer_reason(on_timer)
    local timer
    local count = 0
    local py_timer = GameAPI.add_timer(Fix32(timeout), true, function()
                                           count = count + 1
                                           timer:立即执行(count)

                                           if count >= times then
                                               timer:移除()
                                           end
                                       end, desc)
    timer = New "Timer" (py_timer, on_timer, "second", desc)
    return timer
end

-- 每经过一定帧数后执行，可以指定最大次数
--> 请改用 `y3.ltimer.count_loop_frame`
---@deprecated
---@param frame integer
---@param times integer
---@param on_timer fun(timer: Timer, count: integer)
---@param desc? string # 描述
---@return Timer
function M.count_loop_frame(frame, times, on_timer, desc)
    error("帧计时器不支持有次数的循环，若有此需求请改用 `y3.ltimer.count_loop_frame`")
    desc = desc or make_timer_reason(on_timer)
    local timer
    local count = 0
    local py_timer = run_timer_by_frame(frame, times, function()
        count = count + 1
        timer:立即执行(count)
    end)
    timer = New "Timer" (py_timer, on_timer, "frame", desc)
    return timer
end

-- 立即执行
function M:立即执行(...)
    xpcall(self.on_timer, log.error, self, ...)
end

-- 移除计时器
function M:移除()
    Delete(self)
end

-- 暂停计时器
function M:暂停()
    if self.mode == "frame" then
        error("帧计时器不支持暂停，若有此需求请改用 `y3.ltimer.xxx_frame`")
    end
    GameAPI.pause_timer(self.handle)
end

-- 继续计时器
function M:继续()
    GameAPI.resume_timer(self.handle)
end

-- 是否在运行
function M:是否正在运行()
    return GameAPI.is_timer_valid(self.handle)
end

---获取计时器经过的时间
---@return number time 计时器经过的时间
function M:获取经过时间()
    return y3.helper.tonumber(GameAPI.get_timer_elapsed_time(self.handle))
end

---获取计时器初始计数
---@return integer count 初始计数
function M:获取初始计数()
    return GameAPI.get_timer_init_count(self.handle)
end

---获取计时器剩余时间
---@return number time 计时器剩余时间
function M:获取剩余时间()
    return y3.helper.tonumber(GameAPI.get_timer_remaining_time(self.handle))
end

---获取计时器剩余计数
---@return integer count 剩余计数
function M:获取剩余计数()
    return GameAPI.get_timer_remaining_count(self.handle)
end

---获取计时器设置的时间
---@return number time 设置的时间
function M:获取设置的时间()
    return y3.helper.tonumber(GameAPI.get_timer_time_out_time(self.handle))
end

---@return string?
function M:get_include_name()
    if not self.include_name then
        self.include_name = y3.reload.getIncludeName(self.on_timer) or false
    end
    return self.include_name or nil
end

-- 遍历所有的计时器，仅用于调试（可能会遍历到已经失效的）
---@return fun():Timer?
function M.pairs()
    local timers = {}
    for _, timer in y3.util.sortPairs(M.all_timers) do
        timers[#timers + 1] = timer
    end
    local i = 0
    return function()
        i = i + 1
        return timers[i]
    end
end

return M
