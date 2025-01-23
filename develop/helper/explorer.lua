local watcher = require 'y3.develop.watcher'
local attr    = require 'y3.develop.helper.attr'
local helper  = require 'y3.develop.helper.helper'

---@class Develop.Helper.Explorer
local M = Class 'Develop.Helper.Explorer'

---@type number
M.gameSpeed = M.gameSpeed or 4

M.gameSpeedApply = M.gameSpeedApply or false

M.gamePaused = M.gamePaused or false

function M.createGameSpeed()
    return y3.develop.helper.createTreeNode('速度', {
        description = string.format('%.1f', M.gameSpeed),
        tooltip = '游戏速度',
        onClick = function (node)
            y3.develop.helper.createInputBox {
                title = '设置游戏速度',
                value = string.format('%.1f', M.gameSpeed),
                validateInput = function (value)
                    if not tonumber(value) then
                        return '请输入数字'
                    end
                    if tonumber(value) < 0 then
                        return '速度不能小于0'
                    end
                    if tonumber(value) > 100 then
                        return '速度不能大于100'
                    end
                    return nil
                end,
            } :show(function (value)
                local newSpeed = tonumber(value)
                if not newSpeed or newSpeed < 0 or newSpeed > 100 then
                    return
                end
                y3.sync.send('$game_speed', newSpeed)
            end)
        end,
        check = M.gameSpeedApply,
        onCheck = function (node)
            y3.sync.send('$game_speed_apply', true)
        end,
        onUnCheck = function (node)
            y3.sync.send('$game_speed_apply', false)
        end,
    })
end

function M.createGamePause()
    return y3.develop.helper.createTreeNode('暂停', {
        icon = 'debug-pause',
        onClick = function (node)
            y3.sync.send('$game_pause', not M.gamePaused)
        end,
    })
end

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
        description = formatTime(y3.ltimer.clock() // 1000),
        childsGetter = function ()
            M.gameSpeedButton = M.createGameSpeed()
            M.gamePauseButton = M.createGamePause()
            return {
                M.gameSpeedButton,
                M.gamePauseButton,
            }
        end
    })
    node:bindGC(y3.ltimer.loop(1, function ()
        node.description = formatTime(y3.ltimer.clock() // 1000)
    end))
    return node
end

---@param source Player
local function updateGameSpeed(source)
    local speed = M.gameSpeedApply and M.gameSpeed or 1
    print(string.format('%s 将游戏速度调整为：%.1f', source, speed))
    GameAPI.api_set_time_scale(speed)
end

---@param speed number
---@param source Player
y3.sync.onSync('$game_speed', function (speed, source)
    M.gameSpeed = speed
    if M.gameSpeedButton then
        M.gameSpeedButton.description = string.format('%.1f', M.gameSpeed)
    end
    updateGameSpeed(source)
end)

---@param apply boolean
---@param source Player
y3.sync.onSync('$game_speed_apply', function (apply, source)
    M.gameSpeedApply = apply
    if M.gameSpeedButton then
        M.gameSpeedButton.check = apply
    end
    updateGameSpeed(source)
end)

y3.sync.onSync('$game_pause', function (pause, source)
    M.gamePaused = pause
    if pause then
        print(string.format('%s 暂停了游戏', source))
        y3.game.enable_soft_pause()
    else
        print(string.format('%s 继续了游戏', source))
        y3.game.resume_soft_pause()
    end
    if M.gamePauseButton then
        if pause then
            M.gamePauseButton.name = '继续'
            M.gamePauseButton.icon = 'debug-start'
        else
            M.gamePauseButton.name = '暂停'
            M.gamePauseButton.icon = 'debug-pause'
        end
    end
end)

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
    local reflib = require 'y3.util.ref'

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
            for className, ref in y3.util.sortPairs(reflib.all_managers) do
                ---@type ClientTimer?
                local timer
                childs[#childs+1] = y3.develop.helper.createTreeNode(className, {
                    onVisible = function (child)
                        timer = y3.ctimer.loop(1, function ()
                            ---@diagnostic disable-next-line: invisible
                            local strongCount = countTable(ref.strongRefMap)
                            ---@diagnostic disable-next-line: invisible
                            local weakCount   =countTable(ref.weakRefMap)

                            child.description = string.format('%d | %d'
                                , strongCount
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
        onInit = function (node)
            local last = countTable(reflib.all_managers)
            node:bindGC(y3.ctimer.loop(1, function (timer, count, local_player)
                local now = countTable(reflib.all_managers)
                if now ~= last then
                    last = now
                    node:refresh()
                end
            end))
        end
    })

    return node
end

function M.createTracy()
    return y3.develop.helper.createTreeNode('启动Tracy', {
        icon = 'rss',
        tooltip = '对Lua进行性能分析，但是会大幅影响运行效率',
        onClick = function ()
            enable_lua_profile(true)
            helper.request('createTracy', {})
        end,
    })
end

function M.createReloadButton()
    local node = y3.develop.helper.createTreeNode('重载Lua', {
        icon = 'refresh',
        tooltip = '省的你输入 `.rd`',
        onClick = function ()
            y3.develop.command.execute('RD')
        end,
    })

    return node
end

function M.createRestartGameButton()
    local node = y3.develop.helper.createTreeNode('重启游戏', {
        icon = 'warning',
        tooltip = '省的你输入 `.rr`',
        onClick = function ()
            y3.develop.command.execute('RR')
        end,
    })

    return node
end

---给这个变量重新赋值即可重新定义排版，语法自己研究吧
M.attrLayout = [[
生命 ${生命} / ${最大生命}
    最大生命
    生命恢复
    百分比生命恢复
魔法 ${魔法} / ${最大魔法}
    最大魔法
    魔法恢复
移动速度
物理攻击
    攻击速度
    攻击间隔
    攻击范围
    暴击率
    暴击伤害
    物理穿透
    物理穿透比例
    物理吸血
    伤害加成
    命中率
法术攻击
    法术攻击
    法术穿透
    法术穿透比例
    法术吸血
    冷却缩减
防御 ${物理防御} | ${法术防御}
    物理防御
    法术防御
    被治疗加成
    躲避率
    受伤减免
属性 ${力量} | ${敏捷} | ${智力}
    力量
    敏捷
    智力
    主属性
白天视野
    白天扇形视野半径
    白天扇形视野夹角
    夜晚视野
    夜晚扇形视野半径
    夜晚扇形视野夹角
    真实视野
自定义属性
    ...
]]

---@param layout string
---@return table[]
local function compileAttrLayout(layout)
    local used = {}
    local result = {
        childs = {},
    }
    local currentNode = result
    local function pushNode(name, desc, indent)
        if name == '...' then
            for attr in y3.util.sortPairs(y3.const.UnitAttr) do
                if not used[attr] then
                    local myNode = {
                        name = attr,
                        indent = indent,
                        childs = {},
                    }
                    myNode.parent = currentNode
                    currentNode.childs[#currentNode.childs+1] = myNode
                end
            end
        else
            local myNode = {
                name = name,
                desc = desc,
                indent = indent,
                childs = {},
            }
            myNode.parent = currentNode
            currentNode.childs[#currentNode.childs+1] = myNode
        end
    end
    for line in y3.util.eachLine(layout) do
        local indent = line:match '^[ \t]*'
        local name, desc = line:match '^[ \t]*([^\t ]+)[ \t]*(.*)$'
        if not name then
            goto continue
        end
        if desc == '' then
            desc = nil
        end
        used[name] = true
        local lastNode = currentNode.childs[#currentNode.childs]
        if not lastNode or #indent == #lastNode.indent then
            pushNode(name, desc, indent)
        elseif #indent > #lastNode.indent then
            currentNode = lastNode
            pushNode(name, desc, indent)
        else
            while #indent < #lastNode.indent do
                currentNode = currentNode.parent
                lastNode = currentNode.childs[#currentNode.childs]
            end
            pushNode(name, desc, indent)
        end
        ::continue::
    end
    return result
end

local compiledAttrLayout

---@param unit Unit
---@param layout table
---@param nodes Develop.Helper.TreeNode[]
---@return Develop.Helper.TreeNode[]
local function makeAttrList(unit, layout, nodes)
    local list = {}

    for _, def in ipairs(layout.childs) do
        local node = y3.develop.helper.createTreeNode(def.name, {
            description = def.desc,
            childsGetter = #def.childs > 0 and function (node)
                return makeAttrList(unit, def, nodes)
            end or nil,
            ---@param node Develop.Helper.TreeNode
            updateAttr = function (node)
                if not node:isVisible() then
                    return
                end
                local desc
                if def.desc then
                    desc = def.desc:gsub('${(.-)}', function (name)
                        local attr = unit:get_attr(name)
                        return string.format('%.2f', attr)
                    end)
                elseif y3.const.UnitAttr[def.name] then
                    local attr = unit:get_attr(def.name)
                    desc = string.format('%.2f', attr)
                end
                node.description = desc
            end,
            onVisible = function (node)
                ---@diagnostic disable-next-line: undefined-field
                node.optional.updateAttr(node)
            end,
            onClick = y3.const.UnitAttr[def.name] and function (node)
                attr.show_modify(unit, def.name, {
                    can_create_watch = true,
                })
            end or nil,
        })
        list[#list+1] = node
        nodes[#nodes+1] = node
    end

    return list
end

---@param unit Unit
---@return Develop.Helper.TreeNode
function M.createUnitButton(unit)
    local name = string.format('%s(%d)', unit:get_name(), unit:get_id())
    local attrNodes = {}

    local function update()
        for _, node in ipairs(attrNodes) do
            node.optional.updateAttr(node)
        end
    end

    local timer
    local node = y3.develop.helper.createTreeNode(name, {
        childsGetter = function (node)
            if not compiledAttrLayout then
                compiledAttrLayout = compileAttrLayout(M.attrLayout)
            end

            local childs = makeAttrList(unit, compiledAttrLayout, attrNodes)

            update()

            return childs
        end,
        onExpand = function (node)
            update()
            timer = y3.ltimer.loop(0.5, function ()
                update()
            end)
        end,
        onCollapse = function (node)
            timer:remove()
        end,
    })

    return node
end

function M.createSelectingButton()
    local list = y3.linked_table.create()

    local node = y3.develop.helper.createTreeNode('选中单位', {
        icon = 'organization',
        onInit = function (node)
            local function updateSelecting()
                ---@type Unit?
                local first = list:getHead()
                if first then
                    node.description = string.format('%s(%d)', first:get_name(), first:get_id())
                else
                    node.description = '未选中单位'
                end
                node:refresh()
            end

            y3.player.with_local(function (local_player)
                local ug = local_player:get_local_selecting_unit_group()
                if ug then
                    for _, unit in ipairs(ug:pick()) do
                        list:pushTail(unit)
                    end
                else
                    list:pushTail(local_player:get_local_selecting_unit())
                end

                updateSelecting()

                node:bindGC(y3.game:event('本地-选中-单位', function (trg, data)
                    list:pop(data.unit)
                    list:pushHead(data.unit)
                    updateSelecting()
                end))
                node:bindGC(y3.game:event('本地-选中-单位组', function (trg, data)
                    local last
                    for _, unit in ipairs(data.unit_group_id_list:pick()) do
                        list:pop(unit)
                        if last then
                            list:pushAfter(unit, last)
                        else
                            list:pushHead(unit)
                        end
                        last = unit
                    end
                    updateSelecting()
                end))
            end)
        end,
        childsGetter = function (node)
            local childs = {}

            ---@param unit Unit
            for unit in list:pairsSafe() do
                if unit:is_exist() and #childs <= 10 then
                    childs[#childs+1] = M.createUnitButton(unit)
                else
                    list:pop(unit)
                end
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
                M.createReloadButton(),
                M.createRestartGameButton(),
                M.createGameTimer(),
                M.createMemoryWatcher(),
                M.createTimerWatcher(),
                M.createTriggerWatcher(),
                M.createRefWatcher(),
                M.createTracy(),
                M.createSelectingButton(),
            }
        end,
    })
    return root
end

---@return Develop.Helper.TreeView
function M.create()
    local treeView
    y3.player.with_local(function (local_player)
        local name = string.format('仪表盘（%s）', local_player:get_name())
        y3.reload.recycle(function (trash)
            treeView = trash(y3.develop.helper.createTreeView(name, M.createRoot(name)))
        end)
    end)
    return treeView
end

return M
