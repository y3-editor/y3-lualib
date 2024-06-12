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
    for i = 0, python_len(self.handle)-1 do
        local iter_item = python_index(self.handle,i)
        table.insert(lua_table,y3.item.get_by_id(iter_item))
    end
    return lua_table
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
