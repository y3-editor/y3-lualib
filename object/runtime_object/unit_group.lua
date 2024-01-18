---@class UnitGroup
---@field handle py.UnitGroup
---@overload fun(py_unit_group?: py.UnitGroup): self
local M = Class "UnitGroup"

---@param py_unit_group py.UnitGroup
---@return self
function M:__init(py_unit_group)
    self.handle = py_unit_group
    return self
end

---@param py_unit_group py.UnitGroup
---@return UnitGroup
function M.从handle获取(py_unit_group)
    local unit_group = New "UnitGroup" (py_unit_group)
    return unit_group
end

y3.py_converter.register_py_to_lua("py.UnitGroup", M.从handle获取)
y3.py_converter.register_lua_to_py("py.UnitGroup", function(lua_value)
    return lua_value.handle
end)

---@return Unit[]
function M:到单位数组()
    local lua_table = {}
    for i = 1, python_len(self.handle) do
        local iter_unit = python_index(self.handle, i - 1)
        table.insert(lua_table, y3.unit.从唯一id获取(iter_unit))
    end
    return lua_table
end

function M:选中组内单位()
    GameAPI.set_unit_group_selected(self.handle)
end

---@param unit Unit 单位
function M:添加单位(unit)
    GameAPI.add_unit_to_group(unit.handle, self.handle)
end

---@param unit Unit 单位
function M:移除单位(unit)
    GameAPI.remove_unit_in_group(self.handle, unit.handle)
end

---@param unit_key py.UnitKey 单位类型id
function M:移除单位类型(unit_key)
    GameAPI.remove_unit_in_group_by_key(self.handle, unit_key)
end

---@param count integer
---@return UnitGroup unit_group  随机整数个单位
function M:获取随机数量单位(count)
    local py_unit_group = GameAPI.get_random_n_unit_in_group(self.handle, count)
    return M.从handle获取(py_unit_group)
end

---@param unit_key py.UnitKey 单位类型id
---@return UnitGroup unit_group 单位组
function M.获取指定单位类型(unit_key)
    local py_unit_group = GameAPI.get_units_by_key(unit_key)
    return M.从handle获取(py_unit_group)
end

---@return integer unit_group_num 单位数量
function M:获取单位数量()
    return GameAPI.get_unit_group_num(self.handle)
end

---@param unit_key py.UnitKey
---@return integer num_of_unit 单位类型的数量
function M:获取指定单位类型单位数量(unit_key)
    return GameAPI.get_num_of_unit_key_in_group(self.handle, unit_key)
end

---@return Unit unit 单位组内第一个单位
function M:获取第一格单位()
    local py_unit = GameAPI.get_first_unit_in_group(self.handle)
    return y3.unit.从句柄获取(py_unit)
end

---@return Unit unit 单位组中随机一个单位
function M:获取随机一个单位()
    local py_unit = GameAPI.get_random_unit_in_unit_group(self.handle)
    return y3.unit.从句柄获取(py_unit)
end

---@return Unit unit 最后一个单位
function M:获取最后一个单位()
    local py_unit = GameAPI.get_last_unit_in_group(self.handle)
    return y3.unit.从句柄获取(py_unit)
end

return M
