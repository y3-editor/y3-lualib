---@class Await
local M = {}

---@type fun(traceback: string)?
local errorHandler

---@type fun(time: number, callback: fun())?
local waker

local function presume(co, ...)
    local suc, err = coroutine.resume(co, ...)
    if not suc and errorHandler then
        errorHandler(debug.traceback(co, err))
    end
end

---@class Await.API
local API = {}

--当前协程休眠一会儿
---@async
---@param time number
function API.sleep(time)
    if not waker then
        error('需要先试用 setSleepWaker 设置唤醒器')
    end
    if not coroutine.isyieldable() then
        if errorHandler then
            errorHandler(debug.traceback('当前协程无法让出！'))
        end
        return
    end
    local co = coroutine.running()
    waker(time, function ()
        if coroutine.status(co) ~= 'suspended' then
            return
        end
        presume(co)
    end)
    coroutine.yield()
end

--当前协程让出
---@async
---@param callback fun(resume: fun(...)) # 当前协程让出，直到 resume 被调用。调用 resume 传入的参数将作为当前协程的返回值。
---@return ...
function API.yield(callback)
    local co = coroutine.running()
    local resolved, yielded, fastResults
    local function resume(...)
        if resolved then
            return
        end
        resolved = true
        if yielded then
            if coroutine.status(co) ~= 'suspended' then
                return
            end
            presume(co, ...)
        else
            fastResults = table.pack(...)
        end
    end
    callback(resume)
    if resolved then
        return table.unpack(fastResults, 1, fastResults.n)
    else
        yielded = true
        return coroutine.yield()
    end
end

---@param callback async fun()
---@return thread
function API.call(callback)
    local co = coroutine.create(callback)
    presume(co)
    return co
end

---当前协程等待多个异步函数执行完毕
---@async
---@param callbacks async fun()[]
---@return [boolean, ...][]
function API.waitAll(callbacks)
    if not waker then
        error('需要先试用 setSleepWaker 设置唤醒器')
    end
    local cos = {}
    local results = {}
    ---@type LocalTimer?
    local awakeTimer = nil
    local hasFastward = false
    for i = 1, #callbacks do
        local callback = callbacks[i]
        local co = coroutine.create(function ()
            results[i] = xpcall(callback, log.error)
            cos[i] = nil
            if awakeTimer and not hasFastward then
                hasFastward = true
                awakeTimer:set_remaining_time(0)
            end
        end)
        cos[i] = co
        coroutine.resume(co)
    end
    local co = coroutine.running()
    while next(cos) do
        if awakeTimer then
            awakeTimer:remove()
        end
        awakeTimer = waker(1, function ()
            coroutine.resume(co)
        end)
        hasFastward = false
        coroutine.yield()
    end
    return results
end

--设置错误处理器
---@param handler fun(traceback: string) # 当有错误发生时，会以错误堆栈为参数调用该函数
function API.setErrorHandler(handler)
    errorHandler = handler
end

--设置唤醒器
---@param f fun(time: number, callback: fun()) # 需要传入一个计时器实现函数。当时间到达时，实现函数需要调用 callback。
function API.setSleepWaker(f)
    waker = f
end

return API
