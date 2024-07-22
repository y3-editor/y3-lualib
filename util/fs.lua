local M = {}

local files

local function normalize(fileName)
    local paths = {}
    for path in fileName:gmatch('[^/\\]+') do
        if path == '.' then
            -- do nothing
        elseif path == '..' then
            if #path == 0 then
                return nil, '路径不能回到根节点之前'
            end
            table.remove(paths)
        elseif path:match '^%a:$' then
            return nil, '必须使用相对路径'
        else
            paths[#paths+1] = path
        end
    end
    return table.concat(paths, '/')
end

local function init()
    if files then
        return
    end
    files = {}

    for name, content in pairs(_G['game_lua_files']) do
        local fname = normalize(name:gsub('virtual_script/', ''))
        if fname then
            files[fname:lower()] = content
        end
    end
end

---加载 `script` 目录下的文件，文件名不区分大小写。
---路径中不能包含 `.` 开头的目录。只能使用相对路径。
---@param fileName string
---@return string? content
---@return string? errmsg
function M.load(fileName)
    init()
    local fname, err = normalize(fileName)
    if not fname then
        return nil, err
    end
    local content = files[fname:lower()]
    if not content then
        return nil, '文件不存在'
    end
    return content
end

---保存文件。使用编辑器或助手启动时保存在 `script` 目录下，
---平台启动时保存在 `custom` 目录下。只能使用相对路径。
---写入时路径中可以包含 `.` 开头的目录，但是下次启动游戏会读不到。
---目录必须存在，否则会保存失败。
---文件名不区分大小写。
---@param fileName string
---@param content string
---@return boolean success
---@return string? errmsg
function M.save(fileName, content)
    if type(content) ~= 'string' then
        return false, '文件内容必须是字符串'
    end
    init()
    local fname, err = normalize(fileName)
    if not fname then
        return false, err
    end
    local f, err = io.open(script_path:match('^(.-)%?') .. '/' .. fname, 'wb')
    if not f then
        f, err = io.open(fname, 'wb')
        if not f then
            return false, err
        end
    end
    f:write(content)
    f:close()
    files[fname:lower()] = content
    return true
end

return M
