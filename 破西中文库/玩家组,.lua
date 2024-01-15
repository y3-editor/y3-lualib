---@param 玩家组 PlayerGroup
---@param 回调函数 fun(索引:integer,遍历到的玩家:Player) return false 则跳出遍历
function 玩家组_遍历(玩家组, 回调函数)
    for k, v in pairs(玩家组:pick()) do
        if 回调函数(k, v) == false then
            break
        end
    end
end

---@param 玩家组 PlayerGroup
function 玩家组_清空(玩家组)
    玩家组_遍历(玩家组, function(索引, 遍历到的玩家)
        玩家组_移除玩家(玩家组, 遍历到的玩家)
    end)
end

---@param 玩家组 PlayerGroup
---@param 玩家 Player
function 玩家组_添加玩家(玩家组, 玩家)
    玩家组:add_player(玩家)
end

---@param 玩家组 PlayerGroup
---@param 玩家 Player
function 玩家组_移除玩家(玩家组, 玩家)
    玩家组:remove_player(玩家)
end

---@return PlayerGroup
function 玩家组_获取所有玩家()
    return y3.player_group.get_all_players()
end

---@return PlayerGroup
function 玩家组_获取所有非中立玩家()
    return y3.player_group.get_neutral_player_group()
end

---@param 句柄 py.RoleGroup
---@return PlayerGroup
function 玩家组_从句柄获取(句柄)
    return y3.player_group.get_by_handle(句柄)
end

---@param 玩家 Player
---@return PlayerGroup
function 玩家组_获取所有敌对玩家(玩家)
    return y3.player_group.get_enemy_player_group_by_player(玩家)
end

---@return PlayerGroup
function 玩家组_获取所有失败玩家()
    return y3.player_group.get_defeated_player_group()
end

---@return PlayerGroup
function 玩家组_获取所有胜利玩家()
    return y3.player_group.get_victorious_player_group()
end

---@param 玩家 Player
---@return PlayerGroup
function 玩家组_获取所有同盟玩家(玩家)
    return y3.player_group.get_ally_player_group_by_player(玩家)
end

---@return PlayerGroup
function 玩家组_获取所有非中立在线玩家()
    local 非中立玩家组 = y3.player_group.get_neutral_player_group()
    玩家组_遍历(非中立玩家组, function(索引, 遍历到的玩家)
        if 玩家_获取游戏状态(遍历到的玩家) ~= 1 then
            玩家组_移除玩家(非中立玩家组, 遍历到的玩家)
        end
    end)
    return 非中立玩家组
end

---@param 阵营 py.Camp @ 编辑器内的阵营id
---@return PlayerGroup
function 玩家组_获取阵营内所有玩家(阵营)
    return y3.player_group.get_player_group_by_camp(阵营)()
end
