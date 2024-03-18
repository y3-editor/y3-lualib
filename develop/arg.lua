--启动参数
--
--该功能仅在开发模式有效
---@class Develop.Arg
local arg = {}

pcall(function ()
    if not y3.game.is_debug_mode() then
        return
    end
    if not GameAPI.lua_get_start_args then
        return
    end
    arg = GameAPI.lua_get_start_args()
end)

return arg
