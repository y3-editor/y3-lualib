local M = {}

---@type fun(mesg: string)
M.print = log.debug

local function make_collector()
    local state
    local incre_rate = 0.0005
    local incre_count = 0
    local limit = 500 * 1000
    local function change_to_generational()
        state = 'generational'
        collectgarbage('generational', 20, 1000)
        collectgarbage('stop')
        local mem = collectgarbage 'count'
        limit = math.max(mem * 5, 200 * 1000)
    end
    local function change_to_incremental()
        -- collectgarbage()
        state = 'incremental'
        collectgarbage('incremental', 0, 100, 13)
        collectgarbage('stop')
        incre_count = 0
        incre_rate = 0.0005
    end
    change_to_generational()
    collectgarbage()
    local last_mem = collectgarbage 'count'
    local function do_collect()
        local mem = collectgarbage 'count'
        if state == 'generational' then
            if mem > limit then
                local c1 = python.debug_ns_timestamp()
                change_to_incremental()
                local c2 = python.debug_ns_timestamp()
                M.print(('切换为增量回收，耗时：% 3.3fms'):format((c2 - c1) / 1000000))
                return
            end
            local delta = mem - last_mem
            collectgarbage('step', math.floor(delta))
            mem = collectgarbage 'count'
            last_mem = mem
        elseif state == 'incremental' then
            local delta = limit * incre_rate
            local full = collectgarbage('step', math.floor(delta))
            mem = collectgarbage 'count'
            if mem > last_mem then
                incre_rate = incre_rate * (mem / last_mem) + 0.0001
            end
            last_mem = mem

            if full then
                incre_count = incre_count + 1
                if mem * 5 < limit or incre_count > 5 then
                    state = 'change_to_generational'
                end
            end
        elseif state == 'change_to_generational' then
            local c1 = python.debug_ns_timestamp()
            change_to_generational()
            local c2 = python.debug_ns_timestamp()
            M.print(('切换为分代回收，耗时：% 3.3fms'):format((c2 - c1) / 1000000))
        end
    end

    return function ()
        local c1 = python.debug_ns_timestamp()

        do_collect()

        local c2 = python.debug_ns_timestamp()
        local ns = c2 - c1

        return ns, state
    end
end

function M.start()
    local do_collect = make_collector()

    local log = y3.game.is_debug_mode()
            and io.open(script_path:match('^(.-)%?') .. '/.log/gctrace.log', 'w+b')

    if log then
        log:setvbuf 'no'
        M.print = function (msg)
            log:write(msg, '\n')
            log:flush()
        end
    end
    y3.ltimer.loop_frame(7, function (timer, count)
        local ns, state = do_collect()
        if log then
            log:write(string.format('%s\t% 3.3fms\t% 3.3fM\n', state, ns / 1000000, collectgarbage('count') / 1000))
            log:flush()
        end
    end)
end

return M
