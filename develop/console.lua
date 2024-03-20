---@diagnostic disable-next-line: undefined-global
local console_tips_match = console_tips_match

---@class Develop.Console
local M = Class 'Develop.Console'

local function getHelpInfo()
    local info = {}

    info[#info+1] = '指令列表:'
    local commands = y3.develop.command.getAllCommands()
    for _, command in ipairs(commands) do
        local commandInfo = y3.develop.command.getCommandInfo(command)
        if commandInfo then
            info[#info+1] = ('  .%s - %s'):format(command, commandInfo.desc)
        end
    end
    info[#info+1] = ''
    info[#info+1] = '可以直接输入代码运行，以 `!` 开头的代码会在同步后运行：'
    info[#info+1] = '  1 + 2 --> 当前控制台打印3'
    info[#info+1] = '  !y3.player(1):get_name() --> 多开测试时所有控制台都会打印玩家1的名字'
    info[#info+1] = ''
    info[#info+1] = '输入 `?` 查看此帮助'

    return table.concat(info, '\n')
end

---@param code string
---@return any
local function runCode(code)
    local returnedCode = 'return ' .. code
    local f, err = load(returnedCode, '=console')
    if not f then
        f, err = load(code, '=console')
    end
    if not f then
        assert(err)
        consoleprint(err:gsub('console:1:', 'Error: '))
        return
    end
    local ok, result = pcall(f)
    if not ok then
        consoleprint(result)
        return
    end
    local view = y3.inspect(result)
    if #view > 10000 then
        view = view:sub(1, 10000) .. '...'
    end
    consoleprint(view)
end

y3.game:event('控制台-输入', function (trg, data)
    if not y3.game.is_debug_mode() then
        return
    end
    local input = data.str1

    if input == '?' then
        consoleprint(getHelpInfo())
        return
    end

    if input:sub(1, 1) == '.' then
        y3.sync.send('$console', input)
        return
    end

    if input:sub(1, 1) == '!' then
        local code = input:sub(2)
        y3.sync.send('$run', code)
        return
    end

    runCode(input)
end)

y3.sync.onSync('$console', function (input)
    if not y3.game.is_debug_mode() then
        return
    end
    if type(input) ~= 'string' then
        return
    end
    local content = input:sub(2)
    local strs = {}
    for str in content:gmatch('[^%s]+') do
        strs[#strs+1] = str
    end

    local command = table.remove(strs, 1)
    y3.develop.command.execute(command, table.unpack(strs))
end)

y3.sync.onSync('$run', function (code)
    if not y3.game.is_debug_mode() then
        return
    end
    if type(code) ~= 'string' then
        return
    end
    runCode(code)
end)

---@param inputed string
---@param candidates string[]
---@return string[]
local function filterOut(inputed, candidates)
    local completes = {}
    local lownerInputed = inputed:lower()
    for _, word in ipairs(candidates) do
        local fullWord = word
        if y3.util.stringStartWith(fullWord:lower(), lownerInputed) then
            completes[#completes+1] = fullWord
        end
    end
    return completes
end

y3.game:event('控制台-请求补全', function (trg, data)
    if not y3.game.is_debug_mode() then
        return
    end
    local input = data.str1

    if input:sub(1, 1) == '.' then
        local commands = y3.develop.command.getAllCommands()
        local words = {}
        for _, comman in ipairs(commands) do
            words[#words+1] = '.' .. comman
        end
        local completes = filterOut(input, words)
        console_tips_match(table.concat(completes, ','))
        return
    end
end)

consoleprint(getHelpInfo())

return M
