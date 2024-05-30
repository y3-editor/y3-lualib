---@class y3.develop.helper.explorer
local M = {}

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

---@param name string
---@return Develop.Helper.TreeNode
function M.createRoot(name)
    local root = y3.develop.helper.createTreeNode(name, {
        icon = 'settings',
        childs = {
            M.createMemoryWatcher(),
        }
    })
    return root
end

local function init()
    if not y3.game.is_debug_mode() then
        return
    end

    y3.player.with_local(function (local_player)
        local name = local_player:get_name()
        y3.develop.helper.createTreeView(name, M.createRoot(name))
    end)
end

init()

return M
