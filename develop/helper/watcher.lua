---@class Develop.Helper.Watcher
local M = Class 'Develop.Helper.Watcher'

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
    local node = y3.develop.helper.createTreeNode(attr, {
        onInit = function (node)
            node.description = ('%.2f'):format(unit:get_attr(attr))
            node:bindGC(y3.ltimer.loop(0.5, function (timer, count)
                node.description = ('%.2f'):format(unit:get_attr(attr))
            end))
        end,
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

---@class Develop.Helper.Watcher.API
local API = {}

---@param unit Unit
---@param attr y3.Const.UnitAttr
---@return Develop.Helper.TreeNode
function API.add(unit, attr)
    return API.create():add(unit, attr)
end

---@return Develop.Helper.Watcher
function API.create()
    if not API.instance then
        y3.reload.recycle(function (trash)
            API.instance = trash(New 'Develop.Helper.Watcher' ())
        end)
    end
    return API.instance
end

return API
