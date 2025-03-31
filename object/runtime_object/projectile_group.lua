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

function M:__pairs()
    return self:pairs()
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

---取两个投射物组的交集
---@param projectile_group ProjectileGroup 另一个投射物组
---@return ProjectileGroup 交集投射物组
function M:intersection(projectile_group)
    local py_projectile_group = GameAPI.get_projectile_group_intersection(self.handle, projectile_group.handle)
    return M.create_lua_projectile_group_from_py(py_projectile_group)
end

---取两个投射物组的差集（属于本组但不属于另一组的投射物）
---@param projectile_group ProjectileGroup 另一个投射物组
---@return ProjectileGroup 差集投射物组
function M:difference(projectile_group)
    local py_projectile_group = GameAPI.get_projectile_group_diff(self.handle, projectile_group.handle)
    return M.create_lua_projectile_group_from_py(py_projectile_group)
end

---遍历投射物组中投射物做动作
---@return Projectile[]
function M:pick()
    local lua_table ={}
    for _, id in pairs(self.handle) do
        table.insert(lua_table,y3.projectile.get_by_id(id))
    end
    return lua_table
end

---遍历投射物组，请勿在遍历过程中修改投射物组。
---```lua
---for projectile in ProjectileGroup:pairs() do
---    print(projectile)
---end
---```
---也可以直接用 `pairs` 遍历：
---```lua
---for projectile in pairs(ProjectileGroup) do
---    print(projectile)
---end
---```
---@return fun(): Projectile?
function M:pairs()
    local i = -1
    local len = #self.handle
    return function ()
        i = i + 1
        if i >= len then
            return
        end
        local id = self.handle[i]
        local pr = y3.projectile.get_by_id(id)
        return pr
    end
end

return M
