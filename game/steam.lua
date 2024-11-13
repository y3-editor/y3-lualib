---@class Steam
local M = {}

---【异步】获取本地玩家在组队系统中的队伍id。如果不在队伍中则返回 `0`。
---@return integer
function M.get_team_id()
    return GameAPI.steam_get_team_id() or 0
end

---【异步】获取本地玩家的玩家id。
---@return integer
function M.get_player_id()
    return GameAPI.steam_get_player_id() or 0
end

---【异步】获取本地玩家的头像资源url
---@return string
function M.get_avatar_url()
    return GameAPI.steam_get_player_head_icon_url() or ''
end

---【异步】请求开始匹配
---@param score integer # 匹配分数
---@param level_id string # 目标地图id
---@param game_mode? integer # 目标地图模式
function M.start_match(score, level_id, game_mode)
    GameAPI.steam_start_match(score, level_id, game_mode or 1002)
end

---【异步】请求取消匹配
function M.cancel_match()
    GameAPI.steam_cancel_match()
end

---@alias Steam.TeamState
---| 1 # 空闲
---| 2 # 匹配中

---【异步】获取当前队伍的状态
---@return Steam.TeamState state
function M.get_team_state()
    return GameAPI.steam_get_team_state()
end

---@alias Steam.PlayerState
---| 1 # 空闲
---| 2 # 匹配中
---| 3 # 游戏中

---【异步】获取本地玩家的状态
---@return Steam.PlayerState state
function M.get_player_state()
    return GameAPI.steam_get_player_state()
end

---【异步】获取本地玩家的昵称
---@return string
function M.get_nickname()
    return GameAPI.steam_get_player_nickname() or ''
end

---获取玩家的商店物品
---@param player Player
---@return {
--- item_id: integer,
--- group_name: string,
--- second_name: string,
--- nickname: string,
---}[]
function M.get_player_store_items(player)
    return GameAPI.steam_get_player_storm_items(player.handle)
end

---【异步】设置全局存档值
---@param key string
---@param value string|integer
function M.set_global_archive_data(key, value)
    ---@diagnostic disable-next-line: param-type-mismatch
    GameAPI.set_steam_global_archive_data(key, value)
end

---【异步】增加全局存档值
---@param key string
---@param value integer
function M.add_global_archive_data(key, value)
    GameAPI.add_steam_global_archive_data(key, value)
end

return M
