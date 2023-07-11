-- 单位组
---@class UnitGroup
---@field handle py.UnitGroup
---@overload fun(py_unit_group?: py.UnitGroup): self
local M = Class 'UnitGroup'

---@param py_unit_group py.UnitGroup
---@return self
function M:constructor(py_unit_group)
    self.handle = py_unit_group
    return self
end

---@param py_unit_group py.UnitGroup
---@return UnitGroup
function M.create_lua_unit_group_from_py(py_unit_group)
    local unit_group = New 'UnitGroup' (py_unit_group)
    return unit_group
end

y3.py_converter.register_py_to_lua('py.UnitGroup', M.create_lua_unit_group_from_py)
y3.py_converter.register_lua_to_py('py.UnitGroup', function (lua_value)
    return lua_value.handle
end)

--遍历单位组中单位做动作
---@return Unit[]
function M:pick()
    local lua_table ={}
    for i = 1, python_len(self.handle) do
        local iter_unit = python_index(self.handle,i-1)
        table.insert(lua_table,y3.unit.get_lua_unit_by_id(iter_unit))
    end
    return lua_table
end

--根据单位组选中单位
function M:select_units()
    GameAPI.set_unit_group_selected(self.handle)
end

--添加单位
---@param unit Unit 单位
function M:add_unit(unit)
    GameAPI.add_unit_to_group(unit.handle,self.handle)
end

--移除单位
---@param unit Unit 单位
function M:remove_unit(unit)
    GameAPI.remove_unit_in_group(self.handle, unit.handle)
end

--移除单位类型
---@param unit_key py.UnitKey 单位类型id
function M:remove_units_by_key(unit_key)
    GameAPI.remove_unit_in_group_by_key(self.handle, unit_key)
end

--单位组中随机整数个单位
---@param count integer
---@return UnitGroup unit_group  随机整数个单位
function M:pick_random_n(count)
    local py_unit_group =GameAPI.get_random_n_unit_in_group(self.handle, count)
    return New 'UnitGroup' (py_unit_group)
end

--挑选指定单位类型的单位
---@param unit_key py.UnitKey 单位类型id
---@return UnitGroup unit_group 单位组
function M.pick_by_key(unit_key)
    local py_unit_group = GameAPI.get_units_by_key(unit_key)
    return New 'UnitGroup' (py_unit_group)
end

--获取单位组中单位数量
---@return integer unit_group_num 单位数量
function M:count()
    return GameAPI.get_unit_group_num(self.handle)
end

--单位组中单位类型的数量
---@param unit_key py.UnitKey
---@return integer num_of_unit 单位类型的数量
function M:count_by_key(unit_key)
    return GameAPI.get_num_of_unit_key_in_group(self.handle,unit_key)
end

--获取单位组内第一个单位
---@return Unit unit 单位组内第一个单位
function M:get_first()
    local py_unit = GameAPI.get_first_unit_in_group(self.handle)
    return y3.unit.get_lua_unit_from_py(py_unit)
end

--获取单位组中随机一个单位
---@return Unit unit 单位组中随机一个单位
function M:get_random()
    local py_unit = GameAPI.get_random_unit_in_unit_group(self.handle)
    return y3.unit.get_lua_unit_from_py(py_unit)
end

--获取单位组内最后一个单位
---@return Unit unit 最后一个单位
function M:get_last()
    local py_unit = GameAPI.get_last_unit_in_group(self.handle)
    return y3.unit.get_lua_unit_from_py(py_unit)
end

return M
