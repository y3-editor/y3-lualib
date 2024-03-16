---@overload fun(atLeast: number, gcObject: Class.Base):GCBuffer
---@class GCBuffer
local M = Class "GCBuffer"

---@package
M.passedTime = 0

---@param atLeast number # 至少等待这么长时间后再移除
---@param gcObject Class.Base # 要移除的对象
function M:__init(atLeast, gcObject)
    ---@package
    self.atLeast = atLeast
    ---@package
    self.gcObject = gcObject
end

function M:__del()
    M.startTimer()
    self.queue[#self.queue + 1] = self
end

---@package
function M.startTimer()
    if M.timer then
        return
    end
    local needDelete = {}
    ---@package
    M.queue = {}
    ---@private
    M.timer = y3.本地计时器.loop(1, function()
        for i, buffer in pairs(M.queue) do
            buffer.passedTime = buffer.passedTime + 1
            if buffer.passedTime > buffer.atLeast then
                M.queue[i] = nil
                needDelete[#needDelete + 1] = buffer.gcObject
            end
        end
        for i, gcObject in ipairs(needDelete) do
            gcObject:移除()
            needDelete[i] = nil
        end
    end)
end
