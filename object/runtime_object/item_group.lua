--物品组
---@class ItemGroup
---@field handle py.ItemGroup
---@overload fun(py_item_group: py.ItemGroup): self
local M = Class 'ItemGroup'
M.type = 'item_group'

---@param py_item_group py.ItemGroup
---@return self
function M:__init(py_item_group)
    self.handle = py_item_group
    return self
end

function M:__pairs()
    return self:pairs()
end

---@param py_item_group py.ItemGroup
---@return ItemGroup
function M.create_lua_item_group_from_py(py_item_group)
    local item_group = New 'ItemGroup' (py_item_group)
    return item_group
end

---@param py_item_group py.ItemGroup
---@return ItemGroup
function M.get_by_handle(py_item_group)
    return M.create_lua_item_group_from_py(py_item_group)
end

y3.py_converter.register_py_to_lua('py.ItemGroup', M.get_by_handle)
y3.py_converter.register_lua_to_py('py.ItemGroup', function (lua_value)
    return lua_value.handle
end)

--遍历物品组中玩家做动作
---@return Item[]
function M:pick()
    local lua_table ={}
    for _, iter_item in pairs(self.handle) do
        table.insert(lua_table,y3.item.get_by_id(iter_item))
    end
    return lua_table
end

---遍历物品组，请勿在遍历过程中修改物品组。
---```lua
---for item in ItemGroup:pairs() do
---    print(item)
---end
---```
---也可以直接用 `pairs` 遍历：
---```lua
---for item in pairs(ItemGroup) do
---    print(item)
---end
---```
---@return fun(): Item?
function M:pairs()
    local i = -1
    local len = #self.handle
    return function ()
        i = i + 1
        if i >= len then
            return
        end
        local id = self.handle[i]
        local it = y3.item.get_by_id(id)
        return it
    end
end

---筛选范围内的所有物品
---@param point Point 点
---@param shape Shape 筛选范围
---@return ItemGroup
function M.get_all_items_in_shapes(point,shape)
    local py_item_group = GameAPI.get_all_items_in_shapes(
        -- TODO 见问题2
        ---@diagnostic disable-next-line: param-type-mismatch
        point.handle,
        shape.handle
    )
    return M.create_lua_item_group_from_py(py_item_group)
end

function M.create()
    return M.get_by_handle(GameAPI.create_unit_group()--[[@as py.ItemGroup]])
end

return M
