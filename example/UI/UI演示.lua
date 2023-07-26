--LDBG:event 'wait'

-- 初始化界面
local function init_ui()
    local main = y3.ui.get_ui(y3.player(1), 'panel_1')

    local image = main:create_child('图片')
    image:set_alignment('左', '下')
    image:set_pos(100, 100)
    image:set_image(106330)
end

y3.game:event('游戏-初始化', function ()
    init_ui()
end)
