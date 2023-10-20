---@class SaveData
local M = {}

---@private
M.table_cache = setmetatable({}, { __mode = 'k' })

-- 获取玩家的存档数据（布尔）
---@param player Player
---@param slot integer
---@return boolean
function M.load_boolean(player, slot)
    return player.handle:get_save_data_bool_value(slot)
end

-- 保存玩家的存档数据（布尔）
---@param player Player
---@param slot integer
---@param value boolean
function M.save_boolean(player, slot, value)
    player.handle:set_save_data_bool_value(slot, value)
end

-- 获取玩家的存档数据（整数）
---@param player Player
---@param slot integer
---@return integer
function M.load_integer(player, slot)
    return player.handle:get_save_data_int_value(slot)
end

-- 保存玩家的存档数据（整数）
---@param player Player
---@param slot integer
---@param value integer
function M.save_integer(player, slot, value)
    player.handle:set_save_data_int_value(slot, value)
end

-- 获取玩家的存档数据（实数）
---@param player Player
---@param slot integer
---@return number
function M.load_real(player, slot)
    return player.handle:get_save_data_fixed_value(slot):float()
end

-- 保存玩家的存档数据（实数）
---@param player Player
---@param slot integer
---@param value number
function M.save_real(player, slot, value)
    player.handle:set_save_data_fixed_value(slot, Fix32(value))
end

-- 获取玩家的存档数据（字符串）
---@param player Player
---@param slot integer
---@return string
function M.load_string(player, slot)
    return player.handle:get_save_data_str_value(slot)
end

-- 保存玩家的存档数据（字符串）
---@param player Player
---@param slot integer
---@param value string
function M.save_string(player, slot, value)
    player.handle:set_save_data_str_value(slot, value)
end

-- 获取玩家的存档数据（表）
---@param player Player
---@param slot integer
---@param disable_cover boolean # 是否禁用覆盖，必须和存档设置中的一致
---@return table
function M.load_table(player, slot, disable_cover)
    if disable_cover then
        return {}
    else
        return M.load_table_as_cover(player, slot)
    end
end

---@private
---@param player Player
---@param slot integer
---@return table
function M.load_table_as_cover(player, slot)
    local save_data = player.handle:get_save_data_table_value(slot)
    local create_proxy
    local update_delay = 0.1
    local update_timer

    local function update_save_data()
        if update_timer then
            return
        end
        update_timer = y3.ltimer.wait(update_delay, function ()
            update_timer = nil
            player.handle:set_save_data_table_value(slot, save_data)
            player.handle:upload_save_data()
            log.info('自动保存存档：', player, slot)
        end)
    end

    ---@type Proxy.Config
    local proxy_config = {
        anySetter = function (self, raw, key, value, config, custom)
            if custom >= 3 and type(value) == 'table' then
                error('存档表最多只支持3层嵌套')
            end
            if type(key) ~= 'string'
            and math.type(key) ~= 'integer' then
                error('表的key必须是字符串或者整数')
            end
            if type(value) == 'table' and y3.proxy.raw(value) then
                value = y3.proxy.raw(value)
            end
            raw[key] = value

            update_save_data()
        end,
        anyGetter = function (self, raw, key, config, custom)
            local value = raw[key]
            if type(value) == 'table' then
                return create_proxy(value, custom + 1)
            end
            return value
        end
    }

    function create_proxy(raw, level)
        if M.table_cache[raw] then
            return M.table_cache[raw]
        end
        local v = y3.proxy.new(raw, proxy_config, level)
        M.table_cache[raw] = v
        return v
    end

    local proxy_save_data = create_proxy(save_data, 0)

    return proxy_save_data
end

return M
