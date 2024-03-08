local m = {}
---@enum NPBehave.Enum.NodeState
m.NodeState = {
    Inactive = "Inactive",
    Active = "Active",
    StopRequested = "StopRequested",
}

---@enum NPBehave.Enum.Stops
m.Stops = {
    None = "None",
    Self = "Self",
    LowerPriority = "LowerPriority",
    Both = "Both",
    ImmediateRestart = "ImmediateRestart",
    LowerPriorityImmediateRestart = "LowerPriorityImmediateRestart"
}

---@enum NPBehave.Enum.Operator
m.Operator = {
    IsSet = "IsSet",
    IsNotSet = "IsNotSet",
    IsEqual = "IsEqual",
    IsNotEqual = "IsNotEqual",
    IsGreaterOrEqual = "IsGreaterOrEqual",
    IsGreater = "IsGreater",
    IsSmallerOrEqual = "IsSmallerOrEqual",
    IsSmaller = "IsSmaller",
    AlwaysTrue = "AlwaysTrue"
}

---@enum NPBehave.Enum.ParallelPolicy
m.ParallelPolicy = {
    One = "One",
    All = "All",
}
return m