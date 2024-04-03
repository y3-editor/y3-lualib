local M = {}
local tips_ui = y3.ui.get_ui(y3.player(1), 'TipInfo')
tips_ui:set_visible(true)

-- 技能tips
local tips_skill = tips_ui:get_child('TipUniversal')
assert(tips_skill)
tips_skill:set_visible(false)


-- 展示技能tips
---@param unit Unit
---@param data Ability
---@param pos_x number 技能图标的x坐标，用于确定tips位置
---@param pos_y number
function M.show_tips_skill(unit, data, pos_x, pos_y)
    local tips_skill_basic_list = tips_skill:get_child('TipUniversal_Basic.TipUniversal_Basic_LIST')
    assert(tips_skill_basic_list)
    local skill_icon = tips_skill_basic_list:get_child('icon.bg')
    local skill_title = tips_skill_basic_list:get_child('title.title_TEXT')
    local skill_desc = tips_skill:get_child('content_TEXT')

    local skill_icon_id = y3.ability.get_icon_by_key(data:get_key())

    assert(skill_icon)
    skill_icon:set_image(skill_icon_id)

    assert(skill_title)
    skill_title:set_text(data:get_name())

    assert(skill_desc)
    skill_desc:set_text(data:get_string_attr('desc'))

    tips_skill:set_pos(pos_x, pos_y)

    tips_skill:set_visible(true)
    -- print('show skill tips')
end

-- 隐藏技能tips
function M.hide_tips_skill()
    tips_skill:set_visible(false)
    -- print('hide skill tips')
end

return M
