--投射物组
---@class ProjectileGroup
---@field handle py.ProjectileGroup
---@overload fun(py_projectile_group: py.ProjectileGroup): self
local M = Class 'ProjectileGroup'

M.type = 'projectile_group'

---@param py_projectile_group py.ProjectileGroup
---@return self
function M:__init(py_projectile_group)
    self.handle = py_projectile_group
    return self
end

---@param py_projectile_group py.ProjectileGroup
---@return ProjectileGroup
function M.create_lua_projectile_group_from_py(py_projectile_group)
    local projectile_group = New 'ProjectileGroup' (py_projectile_group)
    return projectile_group
end

y3.py_converter.register_py_to_lua('py.ProjectileGroup', M.create_lua_projectile_group_from_py)
y3.py_converter.register_lua_to_py('py.ProjectileGroup', function (lua_value)
    return lua_value.handle
end)

---筛选范围内的所有投射物
---@param point Point 点
---@param shape Shape 筛选范围
---@return ProjectileGroup
function M.get_all_projectile_in_shapes(point, shape)
    local py_projectile_group = GameAPI.filter_projectile_id_list_in_area(
        -- TODO 见问题2
        ---@diagnostic disable-next-line: param-type-mismatch
        point.handle,
        shape.handle)
    return M.create_lua_projectile_group_from_py(py_projectile_group)
end

---获取拥有指定标签的投射物
---@param tag string 点
---@return ProjectileGroup
function M.get_all_projectiles_with_tag(tag)
    local py_projectile_group = GameAPI.get_all_projectiles_with_tag(tag)
    return M.create_lua_projectile_group_from_py(py_projectile_group)
end

---遍历投射物组中投射物做动作
---@return Projectile[]
function M:pick()
    local lua_table ={}
    for i = 0, python_len(self.handle)-1 do
        local id = python_index(self.handle,i)
        table.insert(lua_table,y3.projectile.get_by_id(id))
    end
    return lua_table
end

return M
