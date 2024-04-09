local M = {}

M.finished = false

function M.win()
    if M.finished then
        return
    end
    M.finished = true
    y3.player(1):display_message('游戏胜利!')
end

function M.lose()
    if M.finished then
        return
    end
    M.finished = true
    y3.player(1):display_message('游戏失败!')
end

return M
