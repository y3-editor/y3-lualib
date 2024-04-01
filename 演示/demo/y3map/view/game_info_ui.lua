local M = {}

function M:init()
    local player = y3map.global:get_local_player()
    self.game_main_ui = y3.ui.get_ui('GameMain')
    self.game_main_ui:set_visible(true)

    self.head_info_ui = self.game_main_ui:get_child('HeadInfo')

    -- 波次ui，例如 波次：1/5
    self.batch_info_ui = self.head_info_ui:get_child('HeadInfo_BatchInfo')
    self.batch_info_txt = self.batch_info_ui:get_child('BatchInfo_TEXT')

    -- 倒计时ui
    self.time_info_ui = self.head_info_ui:get_child('HeadInfo_TimeInfo')
    self.time_info_txt = self.time_info_ui:get_child('time_TEXT')

    -- 初始是第0波怪
    self:update_batch_info(0)

    self:initEvent(player)
end

---@param batch_index integer 刷的第几波怪
function M:update_batch_info(batch_index)
    -- 游戏总的刷怪波数
    self.batch_count = y3map.config_manager.get_batch_count()
    self.batch_info_txt:set_text('波次:' .. batch_index .. '/' .. self.batch_count)
end

---@param player Player
function M:initEvent(player)
    -- 每当刷怪的时候，更新此ui
    y3.game:event_on('刷怪', function(_, batch_index)
        self:update_batch_info(batch_index)
    end)
end

---更新时间
function M:update_time()
    -- 总的游戏时长
    local game_duration = y3map.config_manager.get_game_end_time()

    -- 当前时间戳
    local timestamp = y3.game.get_current_server_time().timestamp

    -- 游戏结束的时间戳
    local game_end_time = y3.game.get_game_init_time_stamp() + game_duration

    -- 剩余游戏时长
    local remain_time = math.max(game_end_time - timestamp, 0)

    -- 规定时间内没有打完全部怪，则游戏失败
    if remain_time <= 0 then
        y3.game:event_dispatch(EventEnum.Game.玩家失败)
    end

    local result = os.date('!*t', remain_time)
    self.time_info_txt:set_text(result.min .. ":" .. result.sec)
end

return M
