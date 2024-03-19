---@diagnostic disable-next-line: undefined-global
local console_tips_match = console_tips_match

---@class Develop.Console
local M = {}

y3.game:event('控制台-输入', function (trg, data)
    if not y3.game.is_debug_mode() then
        return
    end
    local input = data.str1

    if input:sub(1, 1) == '.' then
        local content = input:sub(2)
        local strs = {}
        for str in content:gmatch('[^%s]+') do
            strs[#strs+1] = str
        end

        local command = table.remove(strs, 1)
        y3.develop.command.execute(command, table.unpack(strs))
        return
    end
end)

---@param inputed string
---@param candidates string[]
---@param prefix? string
---@return string[]
local function filterOut(inputed, candidates, prefix)
    local completes = {}
    local lownerInputed = inputed:lower()
    for _, word in ipairs(candidates) do
        local fullWord = (prefix or '') .. word
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
        local completes = filterOut(input, commands, '.')
        console_tips_match(table.concat(completes, ','))
        return
    end
end)

return M
