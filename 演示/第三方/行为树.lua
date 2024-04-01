--[[
    参考: https://github.com/meniku/NPBehave/tree/2.0-dev, 本示例为链接的标题`Example: An event-driven behavior tree`的示例
 ]]


require("y3.third_party.NPBehave")
-- 这个是内置的上下文, 可以按照格式自己实现一个独立的上下文
local GameContext = require("y3.third_party.NPBehave.GameContext")
local ClassName = NPBehave.ClassName
-- 事先声明行为树
---@type NPBehave.Root
local behaviorTree

-- 构造树
local tree = New(ClassName.Service)(0.5,
    function()
        local v = not behaviorTree.Blackboard:Get("foo")
        behaviorTree.Blackboard:Set("foo", v)
    end,
    New(ClassName.Selector)(
        New(ClassName.BlackboardCondition)("foo", NPBehave.Enum.Operator.IsEqual, true,
            NPBehave.Enum.Stops.ImmediateRestart,
            New(ClassName.Sequence)(
                New(ClassName.Action)({
                    action = function() print("foo") end
                }),
                New(ClassName.WaitUntilStopped)()
            )
        ),
        New(ClassName.Sequence)(
            New(ClassName.Action)({
                action = function()
                    print("bar")
                end
            }),
            New(ClassName.WaitUntilStopped)()
        )
    )
)
-- 将树置入Root
behaviorTree = New(ClassName.Root)(tree)
behaviorTree:Start()
---@type Timer
local timer
y3.game:event("键盘-按下", y3.const.KeyboardKey["NUM_4"], function(trg, data)
    local player = data.player
    timer        = y3.timer.loop(0.5, function()
        -- 更新上下文时间, 树在在更新上下文时间时执行
        GameContext.Update(0.5)
    end)
end)


y3.game:event("键盘-按下", y3.const.KeyboardKey["NUM_5"], function(trg, data)
    local player = data.player
    -- timer:remove()
    -- 停止行为树, 上下文仍然更新时间, 但是行为树不再执行
    if behaviorTree ~= nil and behaviorTree.CurrentState == NPBehave.Enum.NodeState.Active then
        behaviorTree:CancelWithoutReturnResult()
    end
end)
