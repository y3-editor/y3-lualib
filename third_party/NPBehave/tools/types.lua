---@enum NPBehaveClassName
local NPBehaveClassName = {
    Node = "NPBehave.Node",
    Root = "NPBehave.Root",

    Decorator = "NPBehave.Decorator.Decorator",
    ObservingDecorator = "NPBehave.Decorator.ObservingDecorator",
    BlackboardCondition = "NPBehave.Decorator.BlackboardCondition",
    Service = "NPBehave.Decorator.Service",
    BlackboardQuery = "NPBehave.Decorator.BlackboardQuery",
    Condition = "NPBehave.Decorator.Condition",
    Cooldown = "NPBehave.Decorator.Cooldown",
    Failer = "NPBehave.Decorator.Failer",
    Hook = "NPBehave.Decorator.Hook",
    Inverter = "NPBehave.Decorator.Inverter",
    Observer = "NPBehave.Decorator.Observer",
    Random = "NPBehave.Decorator.Random",
    Repeater = "NPBehave.Decorator.Repeater",
    Succeeder = "NPBehave.Decorator.Succeeder",
    TimeMax = "NPBehave.Decorator.TimeMax",
    TimeMin = "NPBehave.Decorator.TimeMin",
    WaitForCondition = "NPBehave.Decorator.WaitForCondition",

    Composite = "NPBehave.Composite.Composite",
    Sequence = "NPBehave.Composite.Sequence",
    Parallel = "NPBehave.Composite.Parallel",
    Selector = "NPBehave.Composite.Selector",
    RandomSelector = "NPBehave.Composite.RandomSelector",
    RandomSequence = "NPBehave.Composite.RandomSequence",

    Action = "NPBehave.Task.Action",
    Task = "NPBehave.Task.Task",
    WaitUntilStopped = "NPBehave.Task.WaitUntilStopped",
    Wait = "NPBehave.Task.Wait",
}

return NPBehaveClassName
