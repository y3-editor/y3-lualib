local M = {}

---@type fun(mesg: string)
M.print = log.debug

local state = ''
local incre_rate = 0.0005
local incre_count = 0
local limit = 500 * 1000
local last_mem = collectgarbage 'count'

local function change_to_generational()
    local c1 = python.debug_ns_timestamp()
    state = '分代'
    collectgarbage('generational', 20, 500)
    collectgarbage('stop')
    local mem = collectgarbage 'count'
    limit = mem * 2
    local c2 = python.debug_ns_timestamp()
    M.print(('切换为增量回收，耗时：% 7.3fms'):format((c2 - c1) / 1000000))
    M.print(('当前内存限制：% 7.3fM'):format(limit / 1000))
end

local function change_to_incremental()
    -- collectgarbage()
    local c1 = python.debug_ns_timestamp()
    state = '增量'
    collectgarbage('incremental', 0, 100, 13)
    collectgarbage('stop')
    incre_count = 0
    incre_rate = 0.0005
    local c2 = python.debug_ns_timestamp()
    M.print(('切换为分代回收，耗时：% 7.3fms'):format((c2 - c1) / 1000000))
end

local function do_collect()
    local mem = collectgarbage 'count'
    if state == '分代' then
        if mem > limit then
            change_to_incremental()
            return
        end
        local delta = mem - last_mem
        collectgarbage('step', math.floor(delta))
        mem = collectgarbage 'count'
        last_mem = mem
    elseif state == '增量' then
        local delta = limit * incre_rate
        local full = collectgarbage('step', math.floor(delta))
        M.print(('增量步进率：%.f，步进值：% 7.3fM'):format(incre_rate * 10000, delta / 1000))
        mem = collectgarbage 'count'
        if mem > last_mem then
            incre_rate = incre_rate * (mem / last_mem) + 0.0001
        end
        last_mem = mem

        if full then
            M.print('完成了一次增量周期')
            incre_count = incre_count + 1
            if mem * 5 < limit or incre_count > 5 then
                state = '切换为分代'
            end
        end
    elseif state == '切换为分代' then
        change_to_generational()
    end
end

local function full_collect()
    M.print('开始全量回收')
    local c1 = python.debug_ns_timestamp()
    if state == '分代' then
        collectgarbage()
    elseif state == '增量' then
        collectgarbage()
        change_to_generational()
    end
    last_mem = collectgarbage 'count'
    local c2 = python.debug_ns_timestamp()
    M.print(('全量回收完成，耗时：% 7.3fms'):format((c2 - c1) / 1000000))
end

local function step_collector()
    local c1 = python.debug_ns_timestamp()

    do_collect()

    local c2 = python.debug_ns_timestamp()
    local ns = c2 - c1

    if M.log then
        M.log:write(string.format('%s\t% 7.3fms\t% 7.3fM\n', state, ns / 1000000, collectgarbage('count') / 1000))
        M.log:flush()
    end
end

---@private
M._stated = false

---@private
M._inited = false

---@private
function M.init()
    if M._inited then
        return
    end
    M._inited = true
    ---@private
    M.log = io.open(script_path:match('^(.-)%?') .. '/.log/gctrace.log', 'w+b')
        or  io.open('gctrace.log', 'w+b')

    if M.log then
        M.log:setvbuf 'no'
        M.print = function (msg)
            M.log:write(msg, '\n')
            M.log:flush()
        end
    end

    change_to_generational()
    collectgarbage()
    last_mem = collectgarbage 'count'
end

---启用自动回收
function M.start()
    M.init()
    ---@private
    M.timer = M.timer or y3.ltimer.loop_frame(7, function (timer, count)
        step_collector()
    end)
end

---停用自动回收
function M.stop()
    if M.timer then
        M.timer:remove()
        M.timer = nil
    end
end

---立即进行一次回收
function M.step()
    M.init()
    step_collector()
end

---立即进行全量回收
function M.full()
    M.init()
    full_collect()
end

return M
