--[[
    事件总线 (EventBus)

    轻量级观察者模式实现，用于模块间解耦通信。
    典型场景：数据层变化 → 事件总线 → UI层刷新

    使用示例：

    1. 获取全局事件总线
    ```lua
    local event = GamePlay.event
    ```

    2. 订阅事件
    ```lua
    -- 基础订阅
    event:on("currency_change", function(data)
        self:refreshGold(data.gold)
    end)

    -- 保存取消函数，方便后续取消
    self._unsubscribe = event:on("currency_change", function(data)
        self:refreshGold(data.gold)
    end)
    ```

    3. 发布事件
    ```lua
    event:emit("currency_change", { gold = 100 })
    ```

    4. 取消订阅
    ```lua
    -- 方式1：通过返回的取消函数
    self._unsubscribe()

    -- 方式2：手动取消
    event:off("currency_change", self._myCallback)

    -- 方式3：清空某事件的所有监听
    event:clear("currency_change")
    ```

    5. 一次性监听（触发一次后自动取消）
    ```lua
    event:once("game_start", function()
        log.info("游戏开始了！")
    end)
    ```

    设计说明：
    - 使用 xpcall 保护回调，单个回调异常不会影响其他监听者
    - on() 返回 unsubscribe 函数，避免手动管理回调引用
    - 支持 once() 一次性监听，适合初始化场景
    - 不内置帧更新/批处理，保持简洁（用户可自行扩展）
]]

---@class EventBus
---@field _listeners table<string, function[]> 事件名 -> 回调列表
---@overload fun():self
local M = Class "EventBus"

---@return self
function M:__init()
    self._listeners = {}
    return self
end

---订阅事件
---@param event string 事件名
---@param callback function 回调函数
---@return function unsubscribe 取消订阅函数
function M:on(event, callback)
    if not event or not callback then
        log.warn("[EventBus] on(): event 和 callback 不能为空")
        return function() end
    end

    if not self._listeners[event] then
        self._listeners[event] = {}
    end
    table.insert(self._listeners[event], callback)

    -- 返回取消订阅函数
    local removed = false
    return function()
        if not removed then
            removed = true
            self:off(event, callback)
        end
    end
end

---一次性订阅（触发一次后自动取消）
---@param event string 事件名
---@param callback function 回调函数
---@return function unsubscribe 取消订阅函数
function M:once(event, callback)
    local unsubscribe
    unsubscribe = self:on(event, function(...)
        unsubscribe()
        callback(...)
    end)
    return unsubscribe
end

---取消订阅
---@param event string 事件名
---@param callback function 要取消的回调函数
function M:off(event, callback)
    local list = self._listeners[event]
    if not list then
        return
    end
    for i = #list, 1, -1 do
        if list[i] == callback then
            table.remove(list, i)
            break
        end
    end
    -- 如果列表为空，清理引用
    if #list == 0 then
        self._listeners[event] = nil
    end
end

---发布事件
---@param event string 事件名
---@param ... any 传递给回调的参数
function M:emit(event, ...)
    local list = self._listeners[event]
    if not list then
        return
    end
    -- 复制一份列表，防止回调中修改列表（如 once 导致的 off）
    local snapshot = {}
    for i, cb in ipairs(list) do
        snapshot[i] = cb
    end
    for _, cb in ipairs(snapshot) do
        xpcall(cb, log.error, ...)
    end
end

---清空某个事件的所有监听
---@param event string 事件名
function M:clear(event)
    self._listeners[event] = nil
end

---清空所有事件的所有监听
function M:clearAll()
    self._listeners = {}
end

---获取某个事件的监听数量（调试用）
---@param event string 事件名
---@return number
function M:listenerCount(event)
    local list = self._listeners[event]
    return list and #list or 0
end

return M
