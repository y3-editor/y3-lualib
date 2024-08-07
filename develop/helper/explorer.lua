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
        description = formatTime(y3.ltimer.clock() // 1000),
    })
    node:bindGC(y3.ltimer.loop(1, function ()
        node.description = formatTime(y3.ltimer.clock() // 1000)
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
            for className, refs in y3.util.sortPairs(reflib.all_managers) do
                ---@type ClientTimer?
                local timer
                childs[#childs+1] = y3.develop.helper.createTreeNode(className, {
                    onVisible = function (child)
                        timer = y3.ctimer.loop(1, function ()
                            local strongCount = 0
                            local weakCount   = 0
                            local youngCount  = 0
                            local oldCount    = 0
                            for _, ref in pairs(refs) do
                                ---@diagnostic disable-next-line: invisible
                                strongCount = strongCount + countTable(ref.strongRefMap)
                                ---@diagnostic disable-next-line: invisible
                                weakCount   = weakCount   + countTable(ref.weakRefMap)
                                ---@diagnostic disable-next-line: invisible
                                youngCount  = youngCount  + countTable(ref.waitingListYoung)
                                ---@diagnostic disable-next-line: invisible
                                oldCount    = oldCount    + countTable(ref.waitingListOld)
                            end

                            local aliveCount  = strongCount - youngCount - oldCount
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
            onClick = function (node)
                if not y3.const.UnitAttr[def.name] then
                    return
                end
                y3.develop.helper.createInputBox({
                    title = string.format('修改 "%s(%d)" 的 "%s"'
                        , unit:get_name()
                        , unit:get_id()
                        , def.name
                    ),
                    value = ('%.3f'):format(unit:get_attr(def.name))
                        : gsub('(%..-)0+$', '%1')
                        : gsub('%.$', ''),
                    prompt = '目前只支持修改基础值',
                    validateInput = function (value)
                        if value == '' then
                            return '请输入要修改的值!'
                        end
                        local num = tonumber(value)
                        if num then
                            return nil
                        else
                            return '不是有效数字!'
                        end
                    end
                }):show(function (value)
                    local num = tonumber(value)
                    if num then
                        unit:set_attr(def.name, num)
                    end
                end)
            end
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
    local list = New 'LinkedTable' ()

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
                local ug = local_player:get_selecting_unit_group()
                if ug then
                    for _, unit in ipairs(ug:pick()) do
                        list:pushTail(unit)
                    end
                else
                    list:pushTail(local_player:get_selecting_unit())
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

            local i = 0
            for unit in list:pairsSafe() do
                if i <= 10 then
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
                M.createSelectingButton(),
            }
        end,
    })
    return root
end

function M.create()
    y3.player.with_local(function (local_player)
        local name = string.format('仪表盘（%s）', local_player:get_name())
        y3.reload.recycle(function (trash)
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
