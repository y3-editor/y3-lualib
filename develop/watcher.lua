---@class Develop.TimerWatcher
local TMR = Class 'Develop.TimerWatcher'

---@return table<string, [integer, integer]>
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
        result[mod] = { all, alive }
    end

    return result
end

---@class Develop.TriggerWatcher
local TRG = Class 'Develop.TriggerWatcher'

---@return integer all
---@return integer alive
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

    return all, alive
end

return {
    timerWatcher = TMR,
    triggerWatcher = TRG,
}
