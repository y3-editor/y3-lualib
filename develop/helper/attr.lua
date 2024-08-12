local dattr = require 'y3.develop.attr'

---@class Develop.Helper.Attr
local M = Class 'Develop.Helper.Attr'

---@class Develop.Helper.Attr.API
local API = {}

function M:__init()
    ---@type Develop.Helper.TreeNode[]
    self.childs = {}
    self.root = y3.develop.helper.createTreeNode('属性监控', {
        icon = 'compass',
        childs = self.childs,
    })
    self.tree = y3.develop.helper.createTreeView('属性监控', self.root)
end

function M:__del()
    self.tree:remove()
end

---@param unit Unit
---@param attr y3.Const.UnitAttr
---@return Develop.Helper.TreeNode
---@return fun(value: Develop.Attr.Accept) # 设置断点
function M:add(unit, attr)
    local core = dattr.create(unit, attr)
    local name = string.format('%s(%d): %s'
        , unit:get_name()
        , unit:get_id()
        , attr
    )

    local watch
    local break_point
    local function set_break_point(value)
        if not value then
            return
        end
        if watch then
            watch:remove()
            watch = nil
        end
        if value == '' then
            break_point.description = nil
            return
        end
        watch = core:watch(value, function (_, watch, oldValue)
            if not break_point.check then
                return
            end
            local template = [[

已触发属性断点：
%s(%d)：%s
%s -> %s

断点表达式为：
%s]]
            local msg = string.format(template
                , unit:get_name()
                , unit:get_id()
                , attr
                , ('%.2f'):format(oldValue)
                , ('%.2f'):format(unit:get_attr(attr))
                , watch.conditionStr
            )
            pcall(error, msg)
        end)
        break_point.description = watch.conditionStr
        break_point.check = true
        break_point:bindGC(watch)
    end

    break_point = y3.develop.helper.createTreeNode('断点', {
        icon = 'eye',
        check = true,
        onClick = function ()
            local prompt = '请输入表达式，如 “>= 100”，“<= `最大生命` / 2”'
            y3.develop.helper.createInputBox {
                title = '监控属性变化',
                value = watch and watch.conditionStr,
                prompt = prompt,
                validateInput = function (value)
                    if value == '' then
                        return nil
                    end
                    local f, err = dattr.compileCondition(value)
                    if not f then
                        return '表达式错误：' .. err .. '\n' .. prompt
                    end
                    return nil
                end,
            }:show(set_break_point)
        end,
    })

    local node = y3.develop.helper.createTreeNode(name, {
        onInit = function (node)
            node:bindGC(y3.ltimer.loop(0.5, function (timer, count)
                node.description = ('%.2f'):format(unit:get_attr(attr))
            end)):execute()
        end,
        onClick = function (node)
            API.show_modify(unit, attr)
        end,
        childsGetter = function (node)
            return {
                break_point,
                y3.develop.helper.createTreeNode('详情', {
                    icon = 'info',
                    onInit = function (node)
                        local attrTypes = {'基础', '基础加成', '增益', '增益加成', '最终加成'}
                        local childs = {}

                        for _, attr_type in ipairs(attrTypes) do
                            childs[#childs+1] = y3.develop.helper.createTreeNode(attr_type, {
                                onClick = function (node)
                                    API.show_modify(unit, attr, {
                                        attr_type = attr_type,
                                    })
                                end
                            })
                        end

                        node:bindGC(y3.ltimer.loop(0.5, function (timer, count)
                            for i, child in ipairs(childs) do
                                local attrValue = unit:get_attr(attr, attrTypes[i])
                                child.description = ('%.2f'):format(attrValue)
                            end
                        end)):execute()

                        node.childs = childs
                    end,
                }),
                y3.develop.helper.createTreeNode('删除', {
                    icon = 'trash',
                    onClick = function ()
                        node:remove()
                    end,
                }),
            }
        end
    })
    node:bindGC(core)
    node:bindGC(function ()
        y3.util.arrayRemove(self.childs, node)
        self.root:refresh()
    end)

    self.childs[#self.childs+1] = node
    self.root:refresh()
    return node, set_break_point
end

---@param unit Unit
---@param attr y3.Const.UnitAttr
---@param condition? Develop.Attr.Accept
---@return Develop.Helper.TreeNode
function API.add(unit, attr, condition)
    local node, set_break_point = API.create():add(unit, attr)
    if condition then
        set_break_point(condition)
    end
    return node
end

---@class Develop.Helper.Attr.ModifyOptions
---@field attr_type? y3.Const.UnitAttrType
---@field can_create_watch? boolean

---@param unit Unit
---@param attr y3.Const.UnitAttr
---@param options? Develop.Helper.Attr.ModifyOptions
function API.show_modify(unit, attr, options)
    local attr_type = options and options.attr_type
    local can_create_watch = options and options.can_create_watch or false
    local prompt = ('修改%s值。使用 + 开头表示增加值。'):format(attr_type or '基础')
    if can_create_watch then
        prompt = prompt .. '使用 ~ 创建一个新的监视。使用表达式创建断点。'
    end
    y3.develop.helper.createInputBox({
        title = string.format('修改 "%s(%d)" 的 "%s"'
            , unit:get_name()
            , unit:get_id()
            , attr
        ),
        value = ('%.3f'):format(unit:get_attr(attr, attr_type))
            : gsub('(%..-)0+$', '%1')
            : gsub('%.$', ''),
        prompt = prompt,
        validateInput = function (value)
            if value == '' then
                return '请输入要修改的值!'
            end
            if value == '~' and can_create_watch then
                return nil
            end
            local op = value:sub(1, 1)
            if op == '>' or op == '<' or op == '=' or op == '~' then
                local f, err = dattr.compileCondition(value)
                if f then
                    return nil
                else
                    return '断点表达式错误：' .. err
                end
            end
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
        if value == '~' and can_create_watch then
            API.add(unit, attr)
            return
        end
        local op = value:sub(1, 1)
        if op == '>' or op == '<' or op == '=' or op == '~' then
            API.add(unit, attr, value)
            return
        end
        if op == '+' then
            value = value:sub(2)
        end
        local num = tonumber(value)
        if not num then
            return
        end
        if op == '+' then
            y3.develop.code.sync_run('unit:add_attr(name, num, attr_type)', {
                unit = unit,
                name = attr,
                num = num,
                attr_type = attr_type,
            })
        else
            y3.develop.code.sync_run('unit:set_attr(name, num, attr_type)', {
                unit = unit,
                name = attr,
                num = num,
                attr_type = attr_type,
            })
        end
    end)
end

---@return Develop.Helper.Attr
function API.create()
    if not API.instance then
        API.instance = New 'Develop.Helper.Attr' ()
    end
    return API.instance
end

return API
