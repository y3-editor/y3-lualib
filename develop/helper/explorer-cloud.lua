-- 云脚本仪表盘：独立 TreeView，未握手只显示「无云脚本」，握手后再拉取状态

---@class Develop.Helper.ExplorerCloud
local M = {}

---@param sec integer
---@return string
local function formatTime(sec)
    local hour = sec // 3600
    local min  = sec % 3600 // 60
    local s    = sec % 60
    return string.format('%02d:%02d:%02d', hour, min, s)
end

---@return Develop.Helper.TreeNode
local function createNodes()
    local timeNode = y3.develop.helper.createTreeNode('时间', {
        icon = 'clock',
        description = '-',
    })

    local memNode = y3.develop.helper.createTreeNode('内存', {
        icon = 'eye',
        tooltip = '云脚本 Lua 内存占用',
        description = '-',
    })

    local tickNode = y3.develop.helper.createTreeNode('耗时', {
        icon = 'pulse',
        tooltip = '1秒平均 | 10秒最大',
        description = '-',
    })

    local waitingNode = y3.develop.helper.createTreeNode('无云脚本', {
        icon = 'circle-slash',
        description = '等待握手',
    })

    local posNode = y3.develop.helper.createTreeNode('显示单位位置', {
        tooltip = '绘制云端单位的位置与朝向，200 ms 刷新',
        check = false,
        onCheck = function ()
            y3.cloud.unit.set_pos_debug(true)
        end,
        onUnCheck = function ()
            y3.cloud.unit.set_pos_debug(false)
        end,
    })

    local function update()
        y3.cloud.rpc.request('$Develop.Stats', nil, function (suc, data, err)
            if not suc then
                timeNode.description = '-'
                memNode.description = err
                return
            end
            timeNode.description = formatTime(data.time or 0)
            memNode.description = string.format('%.2f MB', (data.mem_kb or 0) / 1024)
            tickNode.description = string.format('%.2f ms | %.2f ms', data.tick_avg_1s or 0, data.tick_max_10s or 0)
        end)
    end

    ---@type ClientTimer?
    local timer
    local visible = false

    local function start()
        if timer or not y3.cloud.ready then
            return
        end
        update()
        timer = y3.ctimer.loop(1, update)
        timer:execute()
    end

    local function stop()
        if timer then
            timer:remove()
            timer = nil
        end
    end

    local root = y3.develop.helper.createTreeNode('云脚本', {
        icon = 'cloud',
        tooltip = '云脚本状态（每秒刷新）',
        childsGetter = function ()
            if y3.cloud.ready then
                return { timeNode, memNode, tickNode, posNode }
            end
            return { waitingNode }
        end,
        onVisible = function ()
            visible = true
            start()
        end,
        onInvisible = function ()
            visible = false
            stop()
        end,
    })

    y3.cloud.on_ready(function ()
        root:refresh()
        if visible then
            start()
        end
    end)

    return root
end

---创建云脚本仪表盘
---@return Develop.Helper.TreeView
function M.create()
    local treeView
    y3.reload.recycle(function (trash)
        treeView = trash(y3.develop.helper.createTreeView('云脚本', createNodes()))
    end)
    return treeView
end

return M
