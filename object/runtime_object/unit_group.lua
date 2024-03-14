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

function M:__tostring()
    return string.format("{单位组|%d}", self:获取单位数量())
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
        table.insert(lua_table, y3.单位.从唯一id获取(iter_unit))
    end
    return lua_table
end

---@param 回调 fun(索引:integer,遍历到的单位:Unit)
function M:遍历(回调)
    for index, value in ipairs(self:到单位数组()) do
        if 回调(index, value) then
            return
        end
    end
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

--清空单位组
---@return self
function M:清空()
    GlobalAPI.clear_group(self.handle)
    return self
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

---@param 状态 y3.Const.单位存活状态
function M:获取指定状态单位数量(状态)
    return GameAPI.get_state_unit_num_in_group(self.handle, y3.const.单位存活状态[状态])
end

---@param unit_key py.UnitKey
---@return integer num_of_unit 单位类型的数量
function M:获取指定单位类型单位数量(unit_key)
    return GameAPI.get_num_of_unit_key_in_group(self.handle, unit_key)
end

---@return Unit unit 单位组内第一个单位
function M:获取第一个单位()
    local py_unit = GameAPI.get_first_unit_in_group(self.handle)
    return y3.单位.从handle获取(py_unit)
end

---@return Unit unit 单位组中随机一个单位
function M:获取随机一个单位()
    local py_unit = GameAPI.get_random_unit_in_unit_group(self.handle)
    return y3.单位.从handle获取(py_unit)
end

---@return Unit unit 最后一个单位
function M:获取最后一个单位()
    local py_unit = GameAPI.get_last_unit_in_group(self.handle)
    return y3.单位.从handle获取(py_unit)
end

---@param 属性 string
---@param 数量? integer 默认 1
---@param 是否升序? boolean 默认 true
function M:获取属性值排序前几个单位(属性, 数量, 是否升序)
    local py_unit = GameAPI.get_unit_sort_by_attr(self.handle, 属性, 是否升序 or true, 数量 or 1)
    return y3.单位组.从handle获取(py_unit)
end

---@param 目标点 Point
---@param 数量? integer 默认 1
---@param 是否升序? boolean 默认true
function M:获取距离点排序前几个单位(目标点, 数量, 是否升序)
    local py_unit = GameAPI.get_unit_sort_by_position(self.handle, 目标点.handle, 是否升序 or true, 数量 or 1)
    return y3.单位组.从handle获取(py_unit)
end

---@return UnitGroup
function M:获取空单位组()
    return y3.玩家(32):获取所有单位()
end

return M
