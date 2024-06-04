---@class Develop.TimerWatcher
local TMR = Class 'Develop.TimerWatcher'

---@return table<string, { all: integer, alive: integer }>
function TMR.count()
    local result = {}

    for _, mod in ipairs {'timer', 'ltimer', 'ctimer'} do
        local all = 0
        local alive = 0
        for _, timer in pairs(y3[mod].all_timers) do
            all = all + 1
            if not timer.removed then
                alive = alive + 1
            end
        end
        result[mod] = { all = all, alive = alive }
    end

    return result
end

---@class Develop.TriggerWatcher
local TRG = Class 'Develop.TriggerWatcher'

---@return { all: integer, alive: integer }
function TRG.count()
    local all = 0
    local alive = 0

    local triggerModule = require 'y3.util.trigger'

    for _, trigger in pairs(triggerModule.all_triggers) do
        all = all + 1
        if not trigger.removed then
            alive = alive + 1
        end
    end

    return { all = all, alive = alive }
end

--开始监控触发器
function TRG.start()
    if TRG.activeWatcher then
        return
    end
    ---@type Develop.TriggerWatcherInstance
    TRG.activeWatcher = New 'Develop.TriggerWatcherInstance' ()
end

--停止监控触发器
function TRG.stop()
    if not TRG.activeWatcher then
        return
    end
    Delete(TRG.activeWatcher)
    TRG.lastWatcher = TRG.activeWatcher
end

--获取监控报告
function TRG.report()
    local watcher = TRG.activeWatcher or TRG.lastWatcher
    if not watcher then
        return
    end
    return watcher:makeReport()
end

---@class Develop.TriggerWatcherInstance
local TRGI = Class 'Develop.TriggerWatcherInstance'

function TRGI:__init()
    local triggerModule = require 'y3.util.trigger'
    --开始时间（毫秒）
    self.startTime = y3.ltimer.clock()
    self.originalExecute = triggerModule.execute

    local index = 0
    local runnedClock    = {}
    local runnedCost     = {}
    local runnedCallback = {}

    self.runnedClock    = runnedClock
    self.runnedCost     = runnedCost
    self.runnedCallback = runnedCallback

    local ltimerClock = y3.ltimer.clock
    local osClock = os.clock_banned

    ---@diagnostic disable-next-line: duplicate-set-field
    triggerModule.execute = function (trg, ...)
        index = index + 1
        runnedClock[index] = ltimerClock()
        local c1 = osClock()
        runnedCallback[index] = trg._callback
        local a, b, c, d = self.originalExecute(trg, ...)
        runnedCost[index] = osClock() - c1
        return a, b, c, d
    end
end

function TRGI:__del()
    --结束时间（毫秒）
    self.endTime = y3.ltimer.clock()
    local triggerModule = require 'y3.util.trigger'
    triggerModule.execute = self.originalExecute
end

---@param inTime? number # 只统计最后X秒的数据
---@param topCount? integer # 统计前X个耗时最长的函数位置
---@return { count: integer, cost: number, time: number, average: number, tops?: string[] }
function TRGI:makeReport(inTime, topCount)
    local report = {}

    return report
end


return {
    timerWatcher = TMR,
    triggerWatcher = TRG,
}
