local assert = assert
local pairs = pairs
local tableInsert = table.insert
local New = New
---@class NPBehave.Clock.AddTimerStruct
---@field public TimerId number
---@field public Timer NPBehave.Clock.Timer
---@overload fun(): NPBehave.Clock.AddTimerStruct
local AddTimerStruct = Class("NPBehave.Clock.AddTimerStruct")

---@class NPBehave.Clock.Timer
---@field Action? NPBehave.Tool.BindCallback
---@overload fun(): NPBehave.Clock.Timer
local Timer = Class("NPBehave.Clock.Timer")
---@return self
function Timer:__init()
    self.ScheduledTime = 0.0
    -- 重复次数, 设为 -1 则重复直至取消注册.
    self.Repeat = 0
    self.Used = false
    self.Delay = 0.0
    self.RandomVariance = 0.0
    self.Action = nil
    self.repeat_count = 0
    return self
end

---@param elapsedTime number
function Timer:ScheduleAbsoluteTime(elapsedTime)
    self.ScheduledTime = elapsedTime + self.Delay - self.RandomVariance * 0.5 +
        self.RandomVariance * NPBehave.Context.Platform:GenerateRandom()
end

---@class NPBehave.Clock
---@overload fun(): NPBehave.Clock
local Clock = Class("NPBehave.Clock")

---@return self
function Clock:__init()
    ---@type {[fun()]: number}
    self._timerLookup = {}
    ---@private
    ---@class SortedDictionary.Clock: SortedDictionary --@ 由于不支持泛型提示, 必须手动添加类型提示
    ---@field package get fun(self:self, key: number): NPBehave.Clock.Timer
    ---@field package add fun(self:self, key: number, value: NPBehave.Clock.Timer)
    self._timers = New('SortedDictionary')()
    ---@type {[fun()]: boolean} 用于标记需要移除的计时器, 模拟`hashset`
    self._removeTimers = {}
    ---@type {[fun()]: NPBehave.Clock.AddTimerStruct}
    self._addTimers = {}
    self._isInUpdate = false
    self._timerNum = 0

    self.ElapsedTime = 0.0 -- 经过时间
    ---@type NPBehave.Clock.Timer[]
    self._timerPool = {}
    self._currentTimerPoolIndex = 0
    return self
end

---注册一个具有随机方差的计时器函数
---@param delay number 延迟时间(以毫秒为单位)
---@param repeat_count number 重复次数, 设为 -1 则重复直至取消注册.
---@param action NPBehave.Tool.BindCallback 回调函数
---@param randomVariance? number 随机方差
function Clock:AddTimer(delay, repeat_count, action, randomVariance)
    randomVariance = randomVariance or 0.0
    ---@type NPBehave.Clock.Timer
    local timer = nil
    ---@type number
    local timerId;

    if not self._isInUpdate then
        if not self._timerLookup[action] then
            timerId = self._timerNum
            self._timerNum = self._timerNum + 1
            self._timerLookup[action] = timerId
            self._timers:add(timerId, self:GetTimerFromPool())
        else
            timerId = self._timerLookup[action]
        end
        timer = self._timers:get(timerId)
    else
        if not self._addTimers[action] then
            timerId = self._timerNum
            self._timerNum = self._timerNum + 1
            local addTimer = New("NPBehave.Clock.AddTimerStruct")()
            addTimer.TimerId = timerId
            addTimer.Timer = self:GetTimerFromPool()
            self._addTimers[action] = addTimer
            timer = self._addTimers[action].Timer
        else
            timer = self._addTimers[action].Timer
        end

        if self._removeTimers[action] then
            self._removeTimers[action] = nil
        end
    end
    assert(timer.Used)
    timer.Delay = delay
    timer.RandomVariance = randomVariance
    timer.repeat_count = repeat_count
    timer.Action = action
    timer:ScheduleAbsoluteTime(self.ElapsedTime)
end

---移除计时器
---@param action NPBehave.Tool.BindCallback 回调函数
function Clock:RemoveTimer(action)
    if not self._isInUpdate then
        if self._timerLookup[action] then
            local timerId = self._timerLookup[action]
            self._timers:get(timerId).Used = false
            self._timers:remove(timerId)
            self._timerLookup[action] = nil
        end
    else
        if self._timerLookup[action] then
            self._removeTimers[action] = true
        end

        if self._addTimers[action] then
            local addTimer = self._addTimers[action]
            assert(addTimer.Timer.Used)
            addTimer.Timer.Used = false
            self._addTimers[action] = nil
        end
    end
end

---检查是否存在计时器
---@param action NPBehave.Tool.BindCallback 回调函数
---@return boolean
function Clock:HasTimer(action)
    if not self._isInUpdate then
        return self._timerLookup[action] ~= nil
    else
        if self._removeTimers[action] then
            return false
        elseif self._addTimers[action] then
            return true
        else
            return self._timerLookup[action] ~= nil
        end
    end
end

---注册一个每帧都会调用的函数
---@param action NPBehave.Tool.BindCallback 要调用的函数
function Clock:AddUpdateObserver(action)
    self:AddTimer(0.0, -1, action)
end

---移除每帧调用的函数
---@param action NPBehave.Tool.BindCallback 要移除的函数
function Clock:RemoveUpdateObserver(action)
    self:RemoveTimer(action)
end

---检查是否存在每帧调用的函数
---@param action NPBehave.Tool.BindCallback 要检查的函数
---@return boolean @是否存在每帧调用的函数
function Clock:HasUpdateObserver(action)
    return self:HasTimer(action)
end

---更新函数
---@param deltaTime number 时间增量
function Clock:Update(deltaTime)
    self.ElapsedTime = self.ElapsedTime + deltaTime

    self._isInUpdate = true
    for timerId, timer in self._timers:SortedPairs() do
        assert(timer.Used)
        if self._removeTimers[timer.Action] then
            goto continue
        end
        if timer.ScheduledTime <= self.ElapsedTime then
            if timer.Repeat == 0 then
                self:RemoveTimer(timer.Action)
            elseif timer.Repeat >= 0 then
                timer.Repeat = timer.Repeat - 1
            end

            timer.Action()
            timer:ScheduleAbsoluteTime(self.ElapsedTime)
        end
        ::continue::
    end
    for action, _ in pairs(self._removeTimers) do
        local timerId = self._timerLookup[action]
        assert(self._timers:get(timerId).Used)
        self._timers:get(timerId).Used = false
        self._timers:remove(timerId)

        self._timerLookup[action] = nil
    end

    for action, addTimer in pairs(self._addTimers) do
        if self._timerLookup[action] then
            self._timers:get(self._timerLookup[action]).Used = false
            self._timers:remove(self._timerLookup[action])
        end
        assert(addTimer.Timer.Used)
        local timerId = addTimer.TimerId
        self._timers:add(timerId, addTimer.Timer)
        self._timerLookup[action] = timerId
    end

    self._addTimers = {}
    self._removeTimers = {}

    self._isInUpdate = false
end

---从池中获取计时器
---@return NPBehave.Clock.Timer timer 计时器
function Clock:GetTimerFromPool()
    local i = 0
    local l = #self._timerPool
    ---@type NPBehave.Clock.Timer
    local timer = nil
    while i < l do
        ---@type number
        local timerIndex = (i + self._currentTimerPoolIndex) % l
        timerIndex = timerIndex + 1
        if not self._timerPool[timerIndex].Used then
            self._currentTimerPoolIndex = timerIndex
            timer = self._timerPool[timerIndex]
            break
        end
        i = i + 1
    end

    if timer == nil then
        timer = New("NPBehave.Clock.Timer")()
        self._currentTimerPoolIndex = 0
        tableInsert(self._timerPool, timer)
    end

    timer.Used = true
    return timer
end

return Clock
