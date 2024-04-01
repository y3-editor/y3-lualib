local M = {}
local win_ui
local loss_ui

-- 显示胜利的ui界面
local function init_win()
    win_ui = y3.ui.get_ui('win')
    win_ui:set_visible(false)
end

-- 显示失败的ui界面
local function init_loss()
    loss_ui = y3.ui.get_ui('loss')
    loss_ui:set_visible(false)
end


function M:init()
    init_win()
    init_loss()

    -- 胜利或者失败后，显示对应界面，暂停游戏
    y3.game:event_on(EventEnum.Game.玩家胜利, function(_, type)
        self:updateView(1, {})
        y3.game.pause_game()
        print('玩家胜利')
    end)

    y3.game:event_on(EventEnum.Game.玩家失败, function(_, type)
        self:updateView(0, {})
        y3.game.pause_game()
        print('玩家失败')
    end)
end

--- 单位死亡事件处理函数
---@param type integer 0 失败 1 胜利
---@param data {playId:py.RoleID}
function M:updateView(type, data)
    if type == 1 then
        win_ui:set_visible(true)
    else
        loss_ui:set_visible(true)
    end
end

return M
