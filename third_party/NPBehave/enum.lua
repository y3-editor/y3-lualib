---@enum NPBehaveNodeState
NPBehaveNodeState = {
    Inactive = "Inactive",
    Active = "Active",
    StopRequested = "StopRequested",
}

---@enum NPBehaveStops
NPBehaveStops = {
    None = "None",
    Self = "Self",
    LowerPriority = "LowerPriority",
    Both = "Both",
    ImmediateRestart = "ImmediateRestart",
    LowerPriorityImmediateRestart = "LowerPriorityImmediateRestart"
}

---@enum NPBehaveOperator
NPBehaveOperator = {
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

---@enum NPBehaveParallelPolicy
NPBehaveParallelPolicy = {
    One = "One",
    All = "All",
}