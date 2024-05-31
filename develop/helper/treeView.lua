local helper = require 'y3.develop.helper.helper'

---@class Develop.Helper.TreeView: GCHost
---@overload fun(name: string, root: Develop.Helper.TreeNode): Develop.Helper.TreeView
local View = Class 'Develop.Helper.TreeView'
Extends('Develop.Helper.TreeView', 'GCHost')

View.maxID = 0

---@param name string
---@param root Develop.Helper.TreeNode
function View:__init(name, root)
    self.name = name
    self.root = root

    View.maxID = View.maxID + 1
    self.id = View.maxID

    helper.onReady(function ()
        helper.request('createTreeView', {
            id = self.id,
            name = self.name,
            root = self.root.id,
        })
    end)
end

---@class Develop.Helper.TreeNode.Optional
---@field icon? string # 图标，见 https://code.visualstudio.com/api/references/icons-in-labels#icon-listing
---@field description? string # 描述
---@field childs? Develop.Helper.TreeNode[] # 子节点列表。如果子节点计算量较大，可以改用 `childsGetter` 来获取子节点
---@field childsGetter? fun(node: Develop.Helper.TreeNode): Develop.Helper.TreeNode[] # 当试图展开节点时，会调用这个函数获取子节点，和 `childs` 互斥
---@field onVisible? fun(node: Develop.Helper.TreeNode) # 当节点能被看到时调用
---@field onInvisible? fun(node: Develop.Helper.TreeNode) # 当节点看不到时调用

---@class Develop.Helper.TreeNode: GCHost, Class.Base
---@field name string
---@field description? string # 描述
---@field package lastChilds? Develop.Helper.TreeNode[]
---@overload fun(name: string, optional: Develop.Helper.TreeNode.Optional): Develop.Helper.TreeNode
local Node = Class 'Develop.Helper.TreeNode'
Extends('Develop.Helper.TreeNode', 'GCHost')

---@private
Node.maxID = 0

---@private
---@type table<integer, Develop.Helper.TreeNode>
Node.nodeMap = {}

---@param name string
---@param optional Develop.Helper.TreeNode.Optional
function Node:__init(name, optional)
    self.name = name
    self.optional = optional
    self.description = optional.description
    Node.maxID = Node.maxID + 1
    self.id = Node.maxID

    Node.nodeMap[self.id] = self
end

function Node:__del()
    Node.nodeMap[self.id] = nil

    self:changeVisible(false)
end

---@package
Node._description = nil

---@param self Develop.Helper.TreeNode
---@return string?
Node.__getter.description = function (self)
    return self._description
end

---@param self Develop.Helper.TreeNode
---@param desc string
Node.__setter.description = function (self, desc)
    self._description = desc
    self:refresh()
end

---@package
function Node:refresh()
    helper.request('refreshTreeNode', {
        id = self.id,
    })
end

---@private
Node._visible = false

---@param visible boolean
function Node:changeVisible(visible)
    if self._visible == visible then
        return
    end
    self._visible = visible
    if visible then
        if self.optional.onVisible then
            xpcall(self.optional.onVisible, log.error, self)
        end
    else
        if self.optional.onInvisible then
            xpcall(self.optional.onInvisible, log.error, self)
        end
    end
end

helper.registerMethod('getTreeNode', function (params)
    ---@type integer
    local id = params.id
    local node = Node.nodeMap[id]
    if not node then
        return
    end

    node:changeVisible(true)

    return {
        name = node.name,
        desc = node.description,
        icon = node.optional.icon,
        hasChilds = (node.optional.childs or node.optional.childsGetter) and true or false,
    }
end)

helper.registerMethod('getChildTreeNodes', function (params)
    ---@type integer
    local id = params.id
    local node = Node.nodeMap[id]
    if not node then
        return
    end
    local childs = node.optional.childs
    local childsGetter = node.optional.childsGetter
    if not childs and not childsGetter then
        return
    end

    ---@param nodes Develop.Helper.TreeNode[]
    ---@return integer[]
    local function packList(nodes)
        local list = {}
        for i, v in ipairs(nodes) do
            list[i] = v.id
        end
        return list
    end

    ---@param newChilds Develop.Helper.TreeNode[]
    local function updateChilds(newChilds)
        local lastChilds = node.lastChilds
        if lastChilds and lastChilds ~= newChilds then
            local newMap = {}
            for _, v in ipairs(newChilds) do
                newMap[v] = true
            end
            for _, v in ipairs(lastChilds) do
                if not newMap[v] then
                    Delete(v)
                end
            end
        end
        node.lastChilds = newChilds
    end

    if childsGetter then
        local suc, newChilds = xpcall(childsGetter, log.error, node)
        if suc then
            updateChilds(newChilds)
            return packList(newChilds)
        end
    end
    if childs then
        updateChilds(childs)
        return packList(childs)
    end
end)

helper.registerMethod('changeTreeNodeVisible', function (params)
    ---@type integer[]
    local ids = params.ids
    for _, id in ipairs(ids) do
        local node = Node.nodeMap[id]
        if node then
            node:changeVisible(params.visible)
        end
    end
end)
