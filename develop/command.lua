---@class Command
local M = {}

---@private
---@type table<string, fun(...)>
M.commands = {}

-- 注册作弊指令（指令名称无视大小写）
---@param command string
---@param callback fun(...)
function M.register(command, callback)
    M.commands[command:lower()] = callback
end

---@param reload Reload
local function remove_all_triggers_in_include(reload)
    local event_manager = y3.game:get_event_manager()
    for trigger in event_manager:pairs() do
        local source = trigger:get_info_source()
        local path = source:match('^@(.+)$')
        if reload:isValidPath(path) then
            trigger:remove()
        end
    end
end

---@param reload Reload
local function remove_all_timers_in_include(reload)
    for timer in y3.timer.pairs() do
        local source = timer:get_info_source()
        local path = source:match('^@(.+)$')
        if reload:isValidPath(path) then
            timer:remove()
        end
    end
end

M.register('RD', function ()
    y3.reload.reload()
end)

M.register('SS', function ()
    collectgarbage()
    collectgarbage()
    local reports = y3.doctor.report()
    local lines = {}
    for _, report in ipairs(reports) do
        lines[#lines+1] = string.format('%16s(%d): %s'
            , report.point
            , report.count
            , report.name
        )
    end
    local content = table.concat(lines, '\n')
    ---@diagnostic disable-next-line: undefined-global
    py_write_file(lua_script_path .. '/log/snapshot.txt', 'w', content)
    log.debug('快照已保存到 script/log/snapshot.txt')
end)

M.register('CT', function (...)
    collectgarbage()
    collectgarbage()
    local results = y3.doctor.catch(...)
    local lines = {}
    for _, result in ipairs(results) do
        result[1] = 'root'
        lines[#lines+1] = table.concat(result, '->')
    end
    local content = table.concat(lines, '\n')
    ---@diagnostic disable-next-line: undefined-global
    py_write_file(lua_script_path .. '/log/catch.txt', 'w', content)
    log.debug('快照已保存到 script/log/catch.txt')
end)

y3.reload.onBeforeReload(function (reload, willReload)
    remove_all_triggers_in_include(reload)
    remove_all_timers_in_include(reload)
end)

y3.game:event('玩家-发送消息', function (trg, data)
    if not y3.game.is_debug_mode() then
        return
    end
    if not y3.util.stringStartWith(data.str1, '.') then
        return
    end

    local content = data.str1:sub(2)
    local strs = {}
    for str in content:gmatch('[^%s]+') do
        strs[#strs+1] = str
    end

    local command = table.remove(strs, 1):lower()
    local f = M.commands[command]
    if not f then
        return
    end
    f(table.unpack(strs))
end)

-- 执行作弊指令
---@param command string
---@param ... string
function M.execute(command, ...)
    command = command:lower()
    local f = M.commands[command]
    assert(f, '作弊指令不存在: ' .. command)
    f(...)
end

return M
