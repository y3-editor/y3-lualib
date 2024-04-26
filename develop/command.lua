--作弊指令
--
--该功能仅在开发模式有效
---@class Develop.Command
local M = Class 'Develop.Command'

---@class Develop.Command.InfoParam
---@field onCommand fun(...)
---@field needSync? boolean
---@field priority? number
---@field desc? string

---@class Develop.Command.Info: Develop.Command.InfoParam
---@field name string
---@field priority number


---@private
---@type table<string, Develop.Command.Info>
M.commands = {}

-- 注册作弊指令（指令名称无视大小写）
---@param command string
---@param info Develop.Command.InfoParam|function
function M.register(command, info)
    local lname = command:lower()
    if type(info) == 'function' then
        info = {
            onCommand = info,
        }
    end
    ---@cast info Develop.Command.Info
    info.name = lname
    info.priority = info.priority or 0
    M.commands[lname] = info
end

---@param reload Reload
local function remove_all_triggers_in_include(reload)
    local event_manager = y3.game:get_event_manager()
    for trigger in event_manager:pairs() do
        local name = trigger:get_include_name()
        if reload:isValidName(name) then
            trigger:remove()
        end
    end
end

---@param reload Reload
local function remove_all_timers_in_include(reload)
    for timer in y3.timer.pairs() do
        local name = timer:get_include_name()
        if reload:isValidName(name) then
            timer:remove()
        end
    end
end

---@param reload Reload
local function remove_all_local_timers_in_include(reload)
    for timer in y3.ltimer.pairs() do
        local name = timer:get_include_name()
        if reload:isValidName(name) then
            timer:remove()
        end
    end
end

M.register('RD', {
    needSync = true,
    priority = 100,
    desc = '重载所有使用 `include` 加载的脚本文件，并清理他们的全局计时器和触发器。',
    onCommand = function ()
        y3.reload.reload()
    end,
})

M.register('SS', {
    desc = '生成内存快照',
    onCommand = function ()
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
    end
})

M.register('CT', {
    desc = '查询某个对象的引用',
    onCommand = function (...)
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
    end
})

y3.reload.onBeforeReload(function (reload, willReload)
    remove_all_triggers_in_include(reload)
    remove_all_timers_in_include(reload)
    remove_all_local_timers_in_include(reload)
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

    if #strs == 0 then
        return
    end

    local command = table.remove(strs, 1):lower()
    local info = M.commands[command]
    if not info then
        return
    end
    info.onCommand(table.unpack(strs))
end)

-- 执行作弊指令
---@param command string
---@param ... any
function M.execute(command, ...)
    command = command:lower()
    local info = M.commands[command]
    assert(info, '作弊指令不存在: ' .. command)
    info.onCommand(...)
end

---@param command string
---@return Develop.Command.Info?
function M.getCommandInfo(command)
    local lname = command:lower()
    return M.commands[lname]
end

---@return string[]
function M.getAllCommands()
    return y3.util.getTableKeys(M.commands, function (a, b)
        return M.getCommandInfo(a).priority > M.getCommandInfo(b).priority
    end)
end

return M
