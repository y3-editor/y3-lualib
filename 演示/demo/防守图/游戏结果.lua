local M = {}

-- 胜利的ui界面
local win_ui = y3.ui.get_ui(y3.player(1), 'win')
win_ui:set_visible(false)

-- 失败的ui界面
local loss_ui = y3.ui.get_ui(y3.player(1), 'loss')
loss_ui:set_visible(false)

function M.win()
    win_ui:set_visible(true)
    y3.game.pause_game()
end

function M.lose()
    loss_ui:set_visible(true)
    y3.game.pause_game()
end

return M
