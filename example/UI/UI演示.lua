--LDBG:event 'wait'

---@type UI?
local main

-- 初始化界面
local function init_ui()
    if main then
        main:remove()
    end
    local panel = y3.ui.get_ui(y3.player(1), 'panel_1')
    main = panel:create_child('空节点')
    --main:set_alignment_type()
    local image = panel:create_child('图片')
    image:set_image(106330)
    image:set_pos(100, 100)
end

y3.game:event('游戏-初始化', function ()
    init_ui()
end)
