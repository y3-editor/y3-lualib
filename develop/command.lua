--作弊指令
--
--该功能仅在开发模式有效
---@class Develop.Command
local M = Class 'Develop.Command'

---@class Develop.Command.ExecuteParam
---@field command string # 输入的命令（和输入一致，不保证大小写状态）
---@field args string[] # 命令参数
---@field player? Player # 调用命令的玩家

---@class Develop.Command.InfoParam
---@field onCommand? fun(...)
---@field onCommandEX? fun(param: Develop.Command.ExecuteParam)
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
local function remove_all_custom_triggers_in_include(reload)
    local event_manager = y3.game:get_custom_event_manager()
    if not event_manager then
        return
    end
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

---@param reload Reload
local function remove_all_client_timers_in_include(reload)
    for timer in y3.ctimer.pairs() do
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
    onCommand = function (extraInfo)
        y3.doctor.toString('onlylua', 'onlylua')
        local reports = y3.doctor.report()
        local lines = {}
        lines[#lines+1] = '===GCObject==='
        for _, report in ipairs(reports.report) do
            lines[#lines+1] = string.format('%16s(%d): %s'
                , report.point
                , report.count
                , report.name
            )
        end
        if extraInfo then
            lines[#lines+1] = '===WeakTable==='
            lines[#lines+1] = string.format('TotalSize: %d', reports.weakTableInfo.totalSize)
            for _, info in ipairs(reports.weakTableInfo.tables) do
                lines[#lines+1] = string.format('%16s(%d): %s'
                    , info.point
                    , info.size
                    , info.name
                )
            end

            lines[#lines+1] = '===GCTable==='
            lines[#lines+1] = string.format('TotalCount: %d', #reports.gcTableInfo.tables)
            for _, info in ipairs(reports.gcTableInfo.tables) do
                lines[#lines+1] = string.format('%16s: %s => %s'
                    , info.point
                    , info.name
                    , info.gc
                )
            end

            lines[#lines+1] = '===String==='
            lines[#lines+1]  = string.format('TotalNum:  %d', reports.stringInfo.count)
            lines[#lines+1]  = string.format('TotalSize: %.3fKB', reports.stringInfo.totalSize / 1024)
            lines[#lines+1] = '===Large Strings==='
            for _, str in ipairs(reports.stringInfo.largeStrings) do
                lines[#lines+1] = string.format('(↓↓↓ Len = %.3fKB)\n%s...\n(↑↑↑ Len = %.3fKB)', #str / 1024, str:sub(1, 1000), #str / 1024)
            end
        end
        lines[#lines+1] = '===Finish==='
        local content = table.concat(lines, '\n')
        ---@diagnostic disable-next-line: undefined-global
        y3.fs.save('.log/snapshot.txt', content)
        log.debug('快照已保存到 script/.log/snapshot.txt')
    end
})

M.register('CT', {
    desc = '查询某个对象的引用',
    onCommand = function (...)
        collectgarbage()
        collectgarbage()
        y3.doctor.toString('onlylua', 'onlylua')
        local results = y3.doctor.catch(...)
        local lines = {}
        for _, result in ipairs(results) do
            result[1] = 'root'
            lines[#lines+1] = table.concat(result, '\n\t')
        end
        local content = table.concat(lines, '\n')
        ---@diagnostic disable-next-line: undefined-global
        y3.fs.save('.log/catch.txt', content)
        log.debug('快照已保存到 script/.log/catch.txt')
    end
})

M.register('RR', {
    desc = '重启游戏',
    onCommand = function ()
        y3.sync.send('$restart')
    end
})

local hasRestartd = false
y3.sync.onSync('$restart', function ()
    if hasRestartd then
        return
    end
    hasRestartd = true
    y3.game.restart_game()
end)

y3.reload.onBeforeReload(function (reload, willReload)
    remove_all_triggers_in_include(reload)
    remove_all_custom_triggers_in_include(reload)
    remove_all_timers_in_include(reload)
    remove_all_local_timers_in_include(reload)
    remove_all_client_timers_in_include(reload)
end)

y3.game:event('玩家-发送消息', function (trg, data)
    M.input('.', data.str1, data.player)
end)

-- 输入作弊指令
---@param prefix string
---@param input string
---@param player? Player
function M.input(prefix, input, player)
    if not y3.game.is_debug_mode() then
        return
    end
    if not y3.util.stringStartWith(input, prefix) then
        return
    end

    local content = input:sub(1 + #prefix)
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
    M.executeEX {
        command = command,
        args = strs,
        player = player,
        info = info,
    }
end

-- 执行作弊指令
---@param command string
---@param ... any
function M.execute(command, ...)
    M.executeEX {
        command = command,
        args = {...},
    }
end

-- 执行作弊指令
---@param param Develop.Command.ExecuteParam
function M.executeEX(param)
    local command = param.command:lower()
    local info = M.commands[command]
    assert(info, '作弊指令不存在: ' .. param.command)
    M.params = param
    if info.onCommand then
        info.onCommand(table.unpack(param.args))
    end
    if info.onCommandEX then
        info.onCommandEX(param)
    end
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

---@return Develop.Command.ExecuteParam
function M.getParams()
    return M.params
end

return M
