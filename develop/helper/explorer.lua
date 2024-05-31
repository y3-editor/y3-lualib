---@class Develop.Helper.Explorer
local M = Class 'Develop.Helper.Explorer'

---@return Develop.Helper.TreeNode
function M.createGameTimer()
    local function formatTime(sec)
        local hour = sec // 3600
        local min  = sec % 3600 // 60
        local s    = sec % 60
        return string.format('%02d:%02d:%02d', hour, min, s)
    end
    local node = y3.develop.helper.createTreeNode('时间', {
        icon = 'clock',
        description = formatTime(y3.ltimer.clock()),
    })
    node:bindGC(y3.ltimer.loop(1, function ()
        node.description = formatTime(y3.ltimer.clock())
    end))
    return node
end

---@return Develop.Helper.TreeNode
function M.createMemoryWatcher()
    local function getMemory()
        local mem = collectgarbage 'count'
        return string.format('%.2f MB', mem / 1000)
    end

    ---@type ClientTimer
    local timer

    local node = y3.develop.helper.createTreeNode('内存占用', {
        icon = 'eye',
        description = getMemory(),
        tooltip = '只统计Lua的内存占用',
        onVisible = function (node)
            node.description = getMemory()
            timer = y3.ctimer.loop(1, function ()
                node.description = getMemory()
            end)
        end,
        onInvisible = function ()
            timer:remove()
        end,
    })

    return node
end

---@return Develop.Helper.TreeNode
function M.createTimerWatcher()
    local node = y3.develop.helper.createTreeNode('计时器', {
        icon = ''
    })

    return node
end

---@param name string
---@return Develop.Helper.TreeNode
function M.createRoot(name)
    local root = y3.develop.helper.createTreeNode(name, {
        icon = 'account',
        childs = {
            M.createGameTimer(),
            M.createMemoryWatcher(),
            M.createTimerWatcher(),
        }
    })
    return root
end

y3.game:event_on('$Y3-初始化', function ()
    if not y3.game.is_debug_mode() then
        return
    end

    y3.player.with_local(function (local_player)
        local name = local_player:get_name()
        y3.reload.newLife(function (trash)
            trash(y3.develop.helper.createTreeView(name, M.createRoot(name)))
        end)
    end)
end)

return M
