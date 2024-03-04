local M = {}

M.main_ui = require 'y3map.view.main_ui'
M.tips_ui = require 'y3map.view.tips_ui'
M.game_info_ui = require 'y3map.view.game_info_ui'
M.final_ui = require 'y3map.view.final_ui'

function M:init()
    M.main_ui:init()
    M.tips_ui:init()
    M.game_info_ui:init()
    M.final_ui:init()
end

return M
