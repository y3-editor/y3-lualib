---@class Timer
---@field handle py.Timer
---@overload fun(py_timer: py.Timer): self
local M = Class 'Timer'

M.type = 'timer'

---@param py_timer py.Timer
---@return self
function M:constructor(py_timer)
    self.handle = py_timer
    return self
end

---@param py_timer py.Timer
---@return Timer
function M.get_lua_timer_from_py(py_timer)
    local timer = New 'Timer' (py_timer)
    return timer
end


y3.py_converter.register_py_to_lua('py.Timer', M.get_lua_timer_from_py)
y3.py_converter.register_lua_to_py('py.Timer', function (lua_value)
    return lua_value.handle
end)

-- 等待时间后执行
---@param timeout number
---@param on_timer fun(timer: Timer)
---@return Timer
function M.wait(timeout, on_timer)
    local timer
    local py_timer = GameAPI.run_lua_timer(timeout, 0, false, function()
        xpcall(on_timer, log.error, timer)
    end, {})
    timer = New 'Timer' (py_timer)
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
        xpcall(on_timer, log.error, timer, count)
    end, {})
    timer = New 'Timer' (py_timer)
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
    local py_timer = GameAPI.run_lua_timer(timeout, times, false, function()
        count = count + 1
        xpcall(on_timer, log.error, timer, count)
    end, {})
    timer = New 'Timer' (py_timer)
    return timer
end

function M:remove()
    GameAPI.delete_timer(self.handle)
end

function M:pause()
    GameAPI.pause_timer(self.handle)
end

function M:resume()
    GameAPI.resume_timer(self.handle)
end

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
