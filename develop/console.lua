---@diagnostic disable-next-line: undefined-global
local console_tips_match = console_tips_match

---@class Develop.Console
local M = {}

y3.sync.onSync('$console', function (input)
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

y3.game:event('控制台-输入', function (trg, data)
    if not y3.game.is_debug_mode() then
        return
    end
    local input = data.str1

    if input:sub(1, 1) == '.' then
        y3.sync.send('$console', input)
        return
    end
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

return M
