local M = {}

function M:init()
    self.tips_ui = y3.ui.get_ui('TipInfo')
    self.tips_ui:set_visible(true)

    -- 技能tips
    self.tips_skill = self.tips_ui:get_child('TipUniversal')
    self.tips_skill:set_visible(false)
end

---更新技能tips
---@param unit? Unit
---@param data? Ability
---@param pos_x? number 技能图标的x坐标，用于确定tips位置
---@param pos_y? number
function M:update_tips_skill(unit, data, pos_x, pos_y)
    local show = false
    if unit and data then
        show = true
        self.tips_skill_basic_list = self.tips_skill:get_child('TipUniversal_Basic.TipUniversal_Basic_LIST')

        self.skill_icon = self.tips_skill_basic_list:get_child('icon.bg')
        self.skill_title = self.tips_skill_basic_list:get_child('title.title_TEXT')
        self.skill_desc = self.tips_skill:get_child('content_TEXT')

        local skill_icon_id = y3.ability.get_icon_by_key(data:get_key())
        self.skill_icon:set_image(skill_icon_id)
        self.skill_title:set_text(data:get_name())
        self.skill_desc:set_text(data:get_string_attr('desc'))

        self.tips_skill:set_pos(pos_x, pos_y)

        print('显示技能tips')
    end
    self.tips_skill:set_visible(show)
end

return M
