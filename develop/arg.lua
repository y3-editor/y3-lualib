--启动参数
---@class Develop.Arg
local arg = {}

pcall(function ()
    if not GameAPI.lua_get_start_args then
        return
    end
    arg = GameAPI.lua_get_start_args()
end)

return arg
