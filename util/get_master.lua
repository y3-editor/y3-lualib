local event_configs = require 'y3.meta.eventconfig'
local event_datas   = require 'y3.meta.event'

local function get_master(event_name, lua_params)
    local config = event_configs.config[event_name]
    if not config then
        return nil
    end
    local datas  = event_datas[config.key]
    if not datas then
        return nil
    end
    local master = config.master_data
    if not master then
        if config.master then
            for _, data in ipairs(datas) do
                if data.lua_name == config.master then
                    master = data
                    break
                end
            end
        else
            for _, data in ipairs(datas) do
                if data.lua_type == config.object then
                    master = data
                    break
                end
            end
        end
        config.master_data = master
    end
    return lua_params[master.lua_name]
end

return get_master
