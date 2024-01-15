---@enum ENUM玩家游戏状态
ENUM玩家游戏状态 = {
    游戏中 = y3.const.RoleStatus["PLAYING"],
    不存在 = y3.const.RoleStatus["NONE"],
    掉线 = y3.const.RoleStatus["LOST"],
    LEFT = y3.const.RoleStatus["LEFT"],
    观战 = y3.const.RoleStatus["WATCHING"],
}

---@param 句柄 py.Role 编辑器传入的玩家
---@return Player
function 玩家_从句柄获取(句柄)
    return y3.player.get_by_handle(句柄)
end

---@param id integer
---@return Player 返回玩家
function 玩家_转换ID到玩家(id)
    return y3.player.get_by_id(id)
end

---@param 玩家 Player
---@return  integer 玩家id
function 玩家_获取玩家ID(玩家)
    return y3.player.get_id(玩家)
end

---@return ENUM玩家游戏状态 @ 1=游戏中 2=不存在 3=掉线 4=LEFT 5=观战
---@param 当前玩家 Player
function 玩家_获取游戏状态(当前玩家)
    return 当前玩家:get_state()
end

---@param 回调函数 fun(本地玩家:Player)
function 玩家_为本地玩家执行代码(回调函数)
    y3.player.with_local(function(local_player)
        回调函数(local_player)
    end)
end

---@deprecated
---@return Player 容易造成异步的命令
function 玩家_获取本地玩家()
    ---@diagnostic disable-next-line: deprecated
    return y3.player.get_local()
end

---@param 玩家  Player
---@param 单位 Unit | UnitGroup
function 玩家_选中单位_单位组(玩家, 单位)
    玩家:select_unit(单位)
end

---@param 玩家 Player
---@return UnitGroup
function 玩家_获取所有单位(玩家)
    return 玩家:get_all_units()
end
