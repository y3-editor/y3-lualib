---@alias Timer.OnTimer fun(timer: Timer,...)

---@class Timer
---@field handle py.Timer
---@field private on_timer Timer.OnTimer
---@overload fun(py_timer: py.Timer, on_timer: Timer.OnTimer): self
local M = Class 'Timer'

M.type = 'timer'

---@class Timer: GCObject
Extends('Timer', 'GCObject')

---@param py_timer py.Timer
---@param on_timer Timer.OnTimer
---@return self
function M:constructor(py_timer, on_timer)
    self.handle = py_timer
    self.on_timer = on_timer
    return self
end

---@param py_timer py.Timer
---@param on_timer Timer.OnTimer
---@return Timer
function M.get_by_handle(py_timer, on_timer)
    local timer = New 'Timer' (py_timer, on_timer)
    return timer
end


y3.py_converter.register_py_to_lua('py.Timer', M.get_by_handle)
y3.py_converter.register_lua_to_py('py.Timer', function (lua_value)
    return lua_value.handle
end)

-- 等待时间后执行
---@param timeout number
---@param on_timer fun(timer: Timer)
---@return Timer
function M.wait(timeout, on_timer)
    ---@type Timer
    local timer
    local py_timer = GameAPI.run_lua_timer(Fix32(timeout), 0, false, function()
        timer:execute()
    end, {})
    timer = New 'Timer' (py_timer, on_timer)
    return timer
end

-- 循环执行
---@param timeout number
---@param on_timer fun(timer: Timer, count: integer)
---@return Timer
function M.loop(timeout, on_timer)
    local timer
    local count = 0
    local py_timer = GameAPI.run_lua_timer(Fix32(timeout), -1, false, function()
        count = count + 1
        timer:execute(count)
    end, {})
    timer = New 'Timer' (py_timer, on_timer)
    return timer
end

-- 循环指定次数
---@param timeout number
---@param times integer
---@param on_timer fun(timer: Timer, count: integer)
---@return Timer
function M.count_loop(timeout, times, on_timer)
    local timer
    local count = 0
    local py_timer = GameAPI.run_lua_timer(Fix32(timeout), times, false, function()
        count = count + 1
        timer:execute(count)
    end, {})
    timer = New 'Timer' (py_timer, on_timer)
    return timer
end

-- 立即执行
function M:execute(...)
    xpcall(self.on_timer, log.error, self, ...)
end

-- 移除计时器
function M:remove()
    GameAPI.delete_timer(self.handle)
end

-- 暂停计时器
function M:pause()
    GameAPI.pause_timer(self.handle)
end

-- 继续计时器
function M:resume()
    GameAPI.resume_timer(self.handle)
end

-- 是否在运行
function M:is_running()
    return GameAPI.is_timer_valid(self.handle)
end

---获取计时器经过的时间
---@return number time 计时器经过的时间
function M:get_elapsed_time()
    return GameAPI.get_timer_elapsed_time(self.handle)
end

---获取计时器初始计数
---@return integer count 初始计数
function M:get_init_count()
    return GameAPI.get_timer_init_count(self.handle)
end

---获取计时器剩余时间
---@return number time 计时器剩余时间
function M:get_remaining_time()
    return GameAPI.get_timer_remaining_time(self.handle)
end

---获取计时器剩余计数
---@return integer count 剩余计数
function M:get_remaining_count()
    return GameAPI.get_timer_remaining_count(self.handle)
end

---获取计时器设置的时间
---@return number time 设置的时间
function M:get_time_out_time()
    return GameAPI.get_timer_time_out_time(self.handle)
end

return M
