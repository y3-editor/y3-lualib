local watcher = require 'y3.develop.watcher'

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

    local node = y3.develop.helper.createTreeNode('内存占用', {
        icon = 'eye',
        description = getMemory(),
        tooltip = '只统计Lua的内存占用',
    })
    node:bindGC(y3.ctimer.loop(1, function ()
        node.description = getMemory()
    end)):execute()

    return node
end

---@return Develop.Helper.TreeNode
function M.createTimerWatcher()
    ---@type table<string, Develop.Helper.TreeNode>
    local subNodes = {}
    for _, mod in ipairs {'timer', 'ltimer', 'ctimer'} do
        subNodes[mod] = y3.develop.helper.createTreeNode(mod)
    end

    local node = y3.develop.helper.createTreeNode('计时器', {
        icon = 'watch',
        tooltip = 'Lua持有的计时器数量(括号内为已经移除但还未被Lua回收的数量)',
        childs = {
            subNodes['timer'],
            subNodes['ltimer'],
            subNodes['ctimer'],
        },
    })

    node:bindGC(y3.ctimer.loop(1, function ()
        local counts = watcher.timerWatcher.count()
        local all = 0
        local alive = 0
        for mod, count in pairs(counts) do
            subNodes[mod].description = string.format('数量：%d(%d)', count.alive, count.all - count.alive)
            all = all + count.all
            alive = alive + count.alive
        end
        node.description = string.format('总计：%d(%d)', alive, all - alive)
    end)):execute()

    return node
end

---@return Develop.Helper.TreeNode
function M.createTriggerWatcher()
    local node = y3.develop.helper.createTreeNode('触发器', {
        icon = 'eye',
        tooltip = 'Lua持有的触发器数量(括号内为已经移除但还未被Lua回收的数量)',
    })

    node:bindGC(y3.ctimer.loop(1, function ()
        local count = watcher.triggerWatcher.count()
        node.description = string.format('总计：%d(%d)', count.alive, count.all - count.alive)
    end)):execute()

    return node
end

---@return Develop.Helper.TreeNode
function M.createRefWatcher()
    local ref = require 'y3.util.ref'

    local function countTable(t)
        local n = 0
        for _ in pairs(t) do
            n = n + 1
        end
        return n
    end

    local node = y3.develop.helper.createTreeNode('引用', {
        icon = 'list-selection',
        tooltip = 'Lua持有的对象数量( 存活 | 死亡 | 未回收 )',
        childsGetter = function (node)
            local childs = {}
            for className, manager in y3.util.sortPairs(ref.all_managers) do
                ---@type ClientTimer?
                local timer
                childs[#childs+1] = y3.develop.helper.createTreeNode(className, {
                    onVisible = function (child)
                        timer = y3.ctimer.loop(1, function ()
                            ---@diagnostic disable-next-line: invisible
                            local strong = manager.strongRefMap
                            ---@diagnostic disable-next-line: invisible
                            local weak  = manager.weakRefMap
                            ---@diagnostic disable-next-line: invisible
                            local young = manager.waitingListYoung
                            ---@diagnostic disable-next-line: invisible
                            local old   = manager.waitingListOld

                            local strongCount = countTable(strong)
                            local aliveCount  = strongCount - countTable(young) - countTable(old)
                            local weakCount   = countTable(weak)
                            child.description = string.format('%d | %d | %d'
                                , aliveCount
                                , strongCount - aliveCount
                                , weakCount
                            )
                        end)
                        timer:execute()
                    end,
                    onInvisible = function (child)
                        if timer then
                            timer:remove()
                            timer = nil
                        end
                    end,
                })
            end
            return childs
        end,
    })

    return node
end

---@param name string
---@return Develop.Helper.TreeNode
function M.createRoot(name)
    local root = y3.develop.helper.createTreeNode(name, {
        icon = 'account',
        childsGetter = function ()
            return {
                M.createGameTimer(),
                M.createMemoryWatcher(),
                M.createTimerWatcher(),
                M.createTriggerWatcher(),
                M.createRefWatcher(),
            }
        end,
    })
    return root
end

function M.create()
    y3.player.with_local(function (local_player)
        local name = local_player:get_name()
        y3.reload.newLife(function (trash)
            trash(y3.develop.helper.createTreeView(name, M.createRoot(name)))
        end)
    end)
end

y3.game:event_on('$Y3-初始化', function ()
    if not y3.game.is_debug_mode() then
        return
    end
    M.create()
end)

return M
