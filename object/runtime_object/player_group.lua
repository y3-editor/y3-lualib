--玩家组
---@class PlayerGroup
---@field handle py.RoleGroup
---@field private _removed? boolean
---@overload fun(py_player_group?: py.RoleGroup): self
local M = Class 'PlayerGroup'

M.type = 'player_group'

function M:__tostring()
    return string.format('{PlayerGroup|%s}'
        , self.handle
    )
end

---@param py_player_group py.RoleGroup
---@return self
function M:__init(py_player_group)
    self.handle = py_player_group
    return self
end

function M:__len()
    return self:count()
end

---@param py_role_group py.RoleGroup
---@return PlayerGroup
function M.get_by_handle(py_role_group)
    local player_group = New 'PlayerGroup' (py_role_group)
    return player_group
end

y3.py_converter.register_type_alias('py.RoleGroup', 'PlayerGroup')
y3.py_converter.register_py_to_lua('py.RoleGroup', M.get_by_handle)
y3.py_converter.register_lua_to_py('py.RoleGroup', function (lua_value)
    return lua_value.handle
end)

--创建空玩家组
---@return PlayerGroup
function M.create()
    return M.get_by_handle(GameAPI.create_role_group())
end

--获取玩家组中玩家数量
---@return integer
function M:count()
    return python_len(self.handle)
end

--将玩家组转换为Lua的玩家数组
---@return Player[]
function M:pick()
    local lua_table = {}
    for i = 1, python_len(self.handle) do
        local iter_player = python_index(self.handle,i-1)
        table.insert(lua_table, y3.player.get_by_id(iter_player))
    end
    return lua_table
end

--添加玩家
---@param player Player 玩家
function M:add_player(player)
    GameAPI.add_role_to_group(player.handle, self.handle)
end

--移除玩家
---@param player Player 玩家
function M:remove_player(player)
    GameAPI.rem_role_from_group(player.handle, self.handle)
end

--清空玩家组
function M:clear()
    GlobalAPI.clear_group(self.handle)
end

---@private
M.ALL_PLAYERS = M.get_by_handle(GameAPI.get_all_role_ids())

---获取所有玩家
---@return PlayerGroup player_group 单位组
function M.get_all_players()
    return M.ALL_PLAYERS
end

---阵营內所有玩家
---@param camp py.Camp 阵营
---@return PlayerGroup player_group 单位组
function M.get_player_group_by_camp(camp)
    local py_player_group = GameAPI.get_role_ids_by_camp(camp)
    return M.get_by_handle(py_player_group)
end

---玩家的所有敌对玩家
---@param player Player 玩家
---@return PlayerGroup player_group 单位组
function M.get_enemy_player_group_by_player(player)
    local py_player_group = GameAPI.get_enemy_ids_by_role(player.handle)
    return M.get_by_handle(py_player_group)
end

---玩家的所有同盟玩家
---@param player Player 玩家
---@return PlayerGroup player_group 单位组
function M.get_ally_player_group_by_player(player)
    local py_player_group = GameAPI.get_ally_ids_by_role(player.handle)
    return M.get_by_handle(py_player_group)
end

---获取所有胜利的玩家
---@return PlayerGroup player_group 单位组
function M.get_victorious_player_group()
    local py_player_group = GameAPI.get_victorious_role_ids()
    return M.get_by_handle(py_player_group)
end

---获取所有失败的玩家
---@return PlayerGroup player_group 单位组
function M.get_defeated_player_group()
    local py_player_group = GameAPI.get_defeated_role_ids()
    return M.get_by_handle(py_player_group)
end

---所有非中立玩家
---@return PlayerGroup player_group 单位组
function M.get_neutral_player_group()
    local py_player_group = GameAPI.get_role_ids_by_type(1)
    return M.get_by_handle(py_player_group)
end

return M
