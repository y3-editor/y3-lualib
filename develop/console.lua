---@diagnostic disable-next-line: undefined-global
local console_tips_match = console_tips_match

---@class Develop.Console
local M = Class 'Develop.Console'

function M.getHelpInfo()
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

---@param message string
local function print_to_console(message)
    consoleprint(message)
    y3.develop.helper.print(message)
end

---@param ok boolean
---@param result any
---@return any
function M.show_result(ok, result)
    if not ok then
        print_to_console(result)
        return
    end
    if getmetatable(result) and getmetatable(result).__tostring then
        print_to_console(tostring(result))
        return
    end
    local view = y3.inspect(result)
    if #view > 10000 then
        view = view:sub(1, 10000) .. '...'
    end
    print_to_console(view)
end

--控制台输入
---@param input string
function M.input(input)
    if input == '?' then
        consoleprint(M.getHelpInfo())
        return
    end

    if input:sub(1, 1) == '.' then
        y3.player.with_local(function (local_player)
            y3.sync.send('$command', {
                input = input,
                player = local_player,
            })
        end)
        return
    end

    if input:sub(1, 1) == '!' then
        local code = input:sub(2)
        y3.develop.code.sync_run(code, nil, '$console')
        return
    end

    local ok, result = y3.develop.code.run(input)
    M.show_result(ok, result)
end

y3.game:event('控制台-输入', function (trg, data)
    if not y3.game.is_debug_mode() then
        return
    end
    local input = data.str1
    M.input(input)
end)

y3.develop.code.on_sync('$console', {
    complete = function (suc, result, data)
        M.show_result(suc, result)
    end
})

y3.sync.onSync('$command', function (data)
    if not y3.game.is_debug_mode() then
        return
    end
    if type(data) ~= 'table' then
        return
    end
    if type(data.input) ~= 'string' then
        return
    end
    y3.develop.command.input('.', data.input, data.player)
end)

---@param word string
---@return table<string, integer>
local function getUsedCharsSet(word)
    local usedChars = {}
    for i = 1, #word do
        local c = word:sub(i, i)
        usedChars[c] = (usedChars[c] or 0) + 1
    end
    return usedChars
end

---@param inputed string
---@param candidates string[]
---@return string[]
local function filterOut(inputed, candidates)
    if not inputed then
        return {}
    end
    local lownerInputed = inputed:lower()
    local inputChars = getUsedCharsSet(lownerInputed)
    local completes = {}
    for _, word in ipairs(candidates) do
        local lword = word:lower()
        local wordChars = getUsedCharsSet(lword)
        local notMatch = false
        for char, count in pairs(inputChars) do
            if (wordChars[char] or 0) < count then
                notMatch = true
                break
            end
        end
        if not notMatch then
            completes[#completes+1] = word
        end
    end

    if #completes == 0 then
        return completes
    end

    local getMatchScore = (function ()
        local cache = {}
        ---@param word string
        ---@return integer
        return function (word)
            if not cache[word] then
                local score = - #word
                for i = 1, #inputed do
                    if inputed:sub(i, i) == word:sub(i, i) then
                        if i == 1 then
                            score = score + 1000
                        else
                            score = score + 100
                        end
                    elseif lownerInputed:sub(i, i) == word:lower():sub(i, i) then
                        if i == 1 then
                            score = score + 100
                        else
                            score = score + 1
                        end
                    else
                        break
                    end
                end
                cache[word] = score
            end
            return cache[word]
        end
    end)()

    table.sort(completes, function (a, b)
        return getMatchScore(a) > getMatchScore(b)
    end)

    if getMatchScore(completes[1]) >= 100 then
        for i = 1, #completes do
            if getMatchScore(completes[i]) < 100 then
                completes[i] = nil
            end
        end
    end

    return completes
end

local function getFieldsOf(t)
    local fields = {}
    for k in pairs(t) do
        if type(k) == 'string' then
            fields[k] = true
        end
    end

    local mtMark = {}
    local function lookIntoMetaTable(mt)
        if mtMark[mt] then
            return
        end
        if type(mt) == 'table' and type(mt.__index) == 'table' then
            for k in pairs(mt.__index) do
                if type(k) == 'string' then
                    fields[k] = true
                end
            end
            lookIntoMetaTable(getmetatable(mt.__index))
        end
    end

    lookIntoMetaTable(getmetatable(t))

    return y3.util.getTableKeys(fields, true)
end

local function requestWordsByField(words)
    local current = _G
    for i = 1, #words - 1 do
        current = current[words[i]]
        if type(current) ~= 'table' then
            return {}
        end
    end
    local fields = getFieldsOf(current)
    return fields
end

local function requestWordsByKeyWord(words)
    if #words > 1 then
        return {}
    end
    return {'if', 'else', 'elseif', 'for', 'while', 'repeat', 'until', 'function', 'local', 'return', 'break', 'do', 'end', 'then', 'in', 'nil', 'true', 'false', 'and', 'or', 'not'}
end

local function mergeAndRemoveDuplicate(...)
    local result = {}
    local mark = {}
    for _, words in ipairs({...}) do
        for _, word in ipairs(words) do
            if not mark[word] then
                mark[word] = true
                result[#result+1] = word
            end
        end
    end
    return result
end

---@param input string
---@return string[]
local function parseWords(input)
    local nearestTokens = input:match '[%w_%.%:%s]*$'
    if nearestTokens:match '^%s*[%.%:]' then
        return {}
    end
    local tokens = {}
    local pos = 1
    for _ = 1, 10000 do
        pos = nearestTokens:match('()%S', pos) or pos
        if pos > #nearestTokens then
            break
        end
        local word, newPos = nearestTokens:match('([%a_][%w_]*)()', pos)
        if word then
            tokens[#tokens+1] = word
            pos = newPos
        end
        local symbol, newPos = nearestTokens:match('([%.%:])()', pos)
        if symbol then
            tokens[#tokens+1] = symbol
            pos = newPos
        end
    end
    if #tokens == 0 then
        return {}
    end
    local words = {}
    local expectSymbol, expectWord
    for i = #tokens, 1, -1 do
        if tokens[i] == '.'
        or tokens[i] == ':' then
            if expectWord then
                break
            end
            expectSymbol = false
            expectWord = true
            if i == #tokens then
                words[#words+1] = ''
            end
        elseif tokens[i]:match '[%w_]+' then
            if expectSymbol then
                break
            end
            expectSymbol = true
            expectWord = false
            words[#words+1] = tokens[i]
        else
            break
        end
    end
    y3.util.revertArray(words)
    return words
end

---@param inputed string
---@return string[]
local function requestWords(inputed)
    local words = parseWords(inputed)
    local result1 = requestWordsByField(words)
    local result2 = requestWordsByKeyWord(words)
    local mergedResult = mergeAndRemoveDuplicate(result1, result2)
    local resultFields = filterOut(words[#words], mergedResult)
    local completes = {}
    for i, field in ipairs(resultFields) do
        completes[i] = inputed:sub(1, -#words[#words] - 1) .. field
    end
    return completes
end

y3.game:event('控制台-请求补全', function (trg, data)
    if not y3.game.is_debug_mode() then
        return
    end
    local input = data.str1

    if input == '?' then
        return
    end

    if input:sub(1, 1) == '.' then
        local commands = y3.develop.command.getAllCommands()
        local words = {}
        for _, comman in ipairs(commands) do
            words[#words+1] = '.' .. comman
        end
        local completes = filterOut(input, words)
        console_tips_match(table.concat(completes, '\x01'))
        return
    end

    local completes = requestWords(input)
    console_tips_match(table.concat(completes, '\x01'))
end)

y3.game:event_on('$Y3-初始化', function ()
    consoleprint(M.getHelpInfo())
end)

return M
