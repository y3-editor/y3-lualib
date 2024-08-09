---@class Develop.Helper.Watcher
local M = Class 'Develop.Helper.Watcher'

---@class Develop.Helper.Watcher.API
local API = {}

function M:__init()
    ---@type Develop.Helper.TreeNode[]
    self.childs = {}
    self.root = y3.develop.helper.createTreeNode('属性监视', {
        icon = 'compass',
        childs = self.childs,
    })
    self.tree = y3.develop.helper.createTreeView('属性监视', self.root)
end

function M:__del()
    self.tree:remove()
end

---@param unit Unit
---@param attr y3.Const.UnitAttr
---@return Develop.Helper.TreeNode
function M:add(unit, attr)
    local core = y3.develop.attr.create(unit, attr)
    local name = string.format('%s(%d): %s'
        , unit:get_name()
        , unit:get_id()
        , attr
    )
    local node = y3.develop.helper.createTreeNode(name, {
        onInit = function (node)
            node:bindGC(y3.ltimer.loop(0.5, function (timer, count)
                node.description = ('%.2f'):format(unit:get_attr(attr))
            end)):execute()
        end,
        onClick = function (node)
            API.show_modify(unit, attr)
        end
    })
    node:bindGC(core)
    node:bindGC(function ()
        y3.util.arrayRemove(self.childs, node)
        self.root:refresh()
    end)

    self.childs[#self.childs+1] = node
    self.root:refresh()
    return node
end

---@param unit Unit
---@param attr y3.Const.UnitAttr
---@return Develop.Helper.TreeNode
function API.add(unit, attr)
    return API.create():add(unit, attr)
end

---@param unit Unit
---@param attr y3.Const.UnitAttr
function API.show_modify(unit, attr)
    y3.develop.helper.createInputBox({
        title = string.format('修改 "%s(%d)" 的 "%s"'
            , unit:get_name()
            , unit:get_id()
            , attr
        ),
        value = ('%.3f'):format(unit:get_attr(attr))
            : gsub('(%..-)0+$', '%1')
            : gsub('%.$', ''),
        prompt = '修改基础值。使用 + 开头表示增加值。使用 ~ 创建一个新的监视。',
        validateInput = function (value)
            if value == '' then
                return '请输入要修改的值!'
            end
            if value == '~' then
                return nil
            end
            local op = value:sub(1, 1)
            if op == '+' then
                value = value:sub(2)
            end
            local num = tonumber(value)
            if num then
                return nil
            else
                return '不是有效数字!'
            end
        end
    }):show(function (value)
        if not value then
            return
        end
        if value == '~' then
            API.add(unit, attr)
            return
        end
        local op = value:sub(1, 1)
        if op == '+' then
            value = value:sub(2)
        end
        local num = tonumber(value)
        if not num then
            return
        end
        if op == '+' then
            y3.develop.code.sync_run('unit:add_attr(name, num)', {
                unit = unit,
                name = attr,
                num = num,
            })
        else
            y3.develop.code.sync_run('unit:set_attr(name, num)', {
                unit = unit,
                name = attr,
                num = num,
            })
        end
    end)
end

---@return Develop.Helper.Watcher
function API.create()
    if not API.instance then
        API.instance = New 'Develop.Helper.Watcher' ()
    end
    return API.instance
end

return API
