require 'y3.tools.log'

---@param path string
---@param mode openmode
---@return file*?
---@return string? errmsg
local function io_open(path, mode)
    if not io then
        return nil, 'No io module'
    end
    if not io.open then
        return nil, 'No io.open'
    end
    local file, err
    local suc, res = pcall(function ()
        file, err = io.open(path, mode)
    end)
    if not suc then
        return nil, res
    end
    return file, err
end

local log_cache = {}
local log_name = ('lua_player%02d.log'):format(GameAPI.get_client_role():get_role_id_num())
local log_file = io_open(script_path:match('^(.-)%?') .. '/log/' .. log_name, 'w+b')
            or   io_open(log_name, 'w+b')
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

local function print_to_game(message)
    log_cache[#log_cache+1] = message
    if #log_cache > 10 then
        table.remove(log_cache, 1)
    end
    ---@diagnostic disable-next-line: deprecated
    y3.ui.display_message(y3.player.get_local(), remove_bad_utf8(table.concat(log_cache, '\n')), 60)
end

---@diagnostic disable-next-line: lowercase-global
log = New 'Log' {
    level = 'trace',
    file  = log_file,
    clock = function ()
        return GameAPI.get_cur_game_time():float()
    end,
    print = function (level, message, timeStamp)
        if level == 'error' or level == 'fatal' then
            if upload_traceback then
                upload_traceback(message)
            end
        end
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
        if y3.config.log.toConsole then
            consoleprint(message)
        end
        if y3.config.log.toGame then
            print_to_game(message)
        end
        if y3.config.log.toHelper then
            y3.develop.helper.print(message)
        end
    end,
    traceback = function (message, level)
        local err = debug.traceback(message, level + 1)
        if python and python.get_exc_info then
            local py_traceback = python.get_exc_info()
            if py_traceback then
                err = tostring(py_traceback) .. '\n' .. err
            end
        end
        return err
    end,
}

--重载print

--等价于 `log.debug`。另外在开发模式中，还会确保打印到游戏窗口中。
---@param ... any
function print(...)
    local message = log.debug(...)
    if  y3.game.is_debug_mode()
    and not y3.config.log.toGame then
        print_to_game(message)
    end
end
