--LDBG:event 'wait'

-- 初始化界面
local function init_ui()
    local main = y3.ui.get_ui(y3.player(1), 'panel_1')

    -- 随便创建个图片看看
    local image = main:create_child('图片')
    image:set_pos(100, main:get_height() / 2)
    image:set_image(106330)

    -- 创建一个技能按钮组件
    local skill_btn = main:create_child('技能按钮')
    skill_btn:set_pos(500, main:get_height() / 2)

    -- 把挡住的2个子控件隐藏
    skill_btn:get_child('skill_consume_mask_img'):set_visible(false)
    skill_btn:get_child('skill_disable_img'):set_visible(false)

    -- 修改技能图片
    local skill_image = skill_btn:get_child('skill_icon_img')
    assert(skill_image)
    skill_image:set_image(106728)
end

y3.game:event('游戏-初始化', function ()
    init_ui()
end)
