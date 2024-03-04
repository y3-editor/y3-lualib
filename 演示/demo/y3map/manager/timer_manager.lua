local M = {}

function M:init()
    y3.timer.loop(0.03, function(timer, count)
        self:step(count)
    end)
end

function M:step(n)
    y3map.ui_manager.game_info_ui:update_time()
end

return M
