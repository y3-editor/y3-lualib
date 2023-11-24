require 'y3.tools.log'

local log_cache = {}
local log_name = ('lua_player%02d.log'):format(GameAPI.get_client_role():get_role_id_num())
local log_file = io.open(lua_script_path .. '/log/' .. log_name, 'w+b')
            or   io.open(log_name, 'w+b')
if log_file then
    log_file:setvbuf 'no'
end

---@param text string
---@return string
local function remove_bad_utf8(text)
    local buf = {}
    local cur = 1
    while cur <= #text do
        local suc, errpos = utf8.len(text, cur)
        if suc then
            buf[#buf+1] = text:sub(cur, #text)
            break
        end
        buf[#buf+1] = text:sub(cur, errpos - 1)
        cur = errpos + 1
    end
    return table.concat(buf)
end

---@diagnostic disable-next-line: lowercase-global
log = New 'Log' {
    level = 'debug',
    file  = log_file,
    clock = function ()
        return GameAPI.get_cur_game_time():float()
    end,
    print = function (level, message, timeStamp)
        local logger = y3.config.log.logger
        if logger then
            y3.config.log.logger = nil
            local suc, res = xpcall(logger, log.error, level, message, timeStamp)
            y3.config.log.logger = logger
            if suc and res then
                return
            end
        end
        if y3.config.log.toDialog then
            if level == 'error' or level == 'fatal' then
                GameAPI.print_to_dialog(1, message)
            elseif level == 'warn' then
                GameAPI.print_to_dialog(2, message)
            else
                GameAPI.print_to_dialog(3, message)
            end
        end
        if y3.config.log.toGame then
            log_cache[#log_cache+1] = message
            if #log_cache > 10 then
                table.remove(log_cache, 1)
            end
            y3.ui.display_message(y3.player.get_local(), remove_bad_utf8(table.concat(log_cache, '\n')), 60)
        end
    end,
}
