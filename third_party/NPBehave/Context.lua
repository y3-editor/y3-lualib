---abstract<br>
---@class NPBehave.Platform
---@field GenerateRandom fun(): number abstract<br>
local Platform = Class("NPBehave.Platform")

---abstract<br>
---@class NPBehave.Context
---@field Blackboards table<string, NPBehave.Blackboard>
local Context = Class("NPBehave.Context")
NPBehave.Context = NPBehave.Context or Context;
---@type NPBehave.Context
Context.Instance = nil;


---@return NPBehave.Context
function Context.GetInstance()
    return Context.Instance;
end

---@type NPBehave.Platform
Context.Platform = nil;
---@type NPBehave.Clock
Context.Clock = New("NPBehave.Clock")();


function Context:__init()
    self.Blackboards = {};
    return self;
end

---获取共享黑板
---@param key string
---@return NPBehave.Blackboard
function Context.GetSharedBlackboard(key)
    local context = Context.GetInstance();
    if not context.Blackboards[key] then
        context.Blackboards[key] = New("NPBehave.Blackboard")(Context.Clock);
    end
    return context.Blackboards[key];
end

