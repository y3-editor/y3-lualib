---@class NPBehave.GamePlatform
local GamePlatform = Class("NPBehave.GamePlatform")

---@class NPBehave.GamePlatform: NPBehave.Platform
Extends('NPBehave.GamePlatform', 'NPBehave.Platform')

---override<br>
---@return number
function GamePlatform:GenerateRandom()
    return math.random();
end

---@class NPBehave.GameContext
local GameContext = Class("NPBehave.GameContext")
local superName = "NPBehave.Context"
---@class NPBehave.GameContext: NPBehave.Context
Extends('NPBehave.GameContext', superName)
NPBehave.Context.Instance = New("NPBehave.GameContext")();
NPBehave.Context.Platform = New("NPBehave.GamePlatform")();

---@param gameTime number
function GameContext.Update(gameTime)
    GameContext.Clock:Update(gameTime);
end

return GameContext
