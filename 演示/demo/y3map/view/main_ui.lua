local M = {}

function M:init()
    local player = y3map.global:get_local_player()

    self.game_main_ui = y3.ui.get_ui('GameMain')
    self.game_main_ui:set_visible(true)

    self.main_console_ui = self.game_main_ui:get_child('MainConsole')
    self.main_console_ui:set_visible(true)

    self.ability_list = self.main_console_ui:get_child('main.main.hero_skill'):get_ui_comp_children()

    for i = 1, 5 do
        local slot = self.ability_list[i]:get_child('slot')
        if slot then
            -- 用于显示技能tips
            slot:add_event('鼠标-移入', EventEnum.UI.显示技能提示,
                { slot = i, pos_x = slot:get_absolute_x(), pos_y = slot:get_absolute_y() })

            -- 用于隐藏技能tips
            slot:add_event('鼠标-移出', EventEnum.UI.隐藏技能提示, { slot = i })
        end
    end

    self.avatar_ui = self.main_console_ui:get_child('main.avatar')
    self.avatar_img = self.avatar_ui:get_child('main.heroAvatar_IMG')          --单位头像
    self.avatar_title_txt = self.avatar_ui:get_child('main.title.title_TEXT')  --单位名称
    self.attr_spd_txt = self.avatar_ui:get_child('attr.spd.spd_TEXT')          --移动速度
    self.attr_atkSpd_txt = self.avatar_ui:get_child('attr.atkSPD.atkSpd_TEXT') --攻击速度

    self.attr_list_ui = self.main_console_ui:get_child('attr')

    self.attr_atk_txt = self.attr_list_ui:get_child('atk.atk_TEXT') -- 物理攻击力
    self.attr_def_txt = self.attr_list_ui:get_child('def.def_TEXT') -- 物理防御力
    self.attr_str_txt = self.attr_list_ui:get_child('str.str_TEXT') -- 力量
    self.attr_agi_txt = self.attr_list_ui:get_child('agi.agi_TEXT') -- 敏捷
    self.attr_int_txt = self.attr_list_ui:get_child('int.int_TEXT') -- 智力
    self.bar_ui = self.main_console_ui:get_child('main.main.bar')

    self.heroHp_bar = self.bar_ui:get_child('hp.heroHp_BAR')         --生命值条
    self.heroHp_txt = self.bar_ui:get_child('hp.heroHp_TEXT')        --生命值文本

    self.heroExp_bar = self.bar_ui:get_child('exp.heroExp_BAR')      --经验值条
    self.heroExp_txt = self.bar_ui:get_child('exp.heroExp_TEXT')     --经验值文本

    self.heroLevel_txt = self.bar_ui:get_child('exp.heroLevel_TEXT') --等级文本

    self:initEvent(player)
end

---@param player Player
function M:initEvent(player)
    y3.game:event("选中-单位", function(trg, data)
        self:update_select_obj(data.unit)
    end)

    y3.game:event("选中-物品", function(trg, data)
        self:update_select_obj(data.item)
    end)

    y3.timer.loop(0.03, function(timer, count)
        self:update_bottom()
    end)

    y3.game:event('界面-消息', EventEnum.UI.显示技能提示, function(trg, data)
        local ab = self.select_obj:get_ability_by_slot(y3.const.AbilityType.HERO, data.data.slot)
        if ab then
            y3map.ui_manager.tips_ui:update_tips_skill(self.select_obj, ab, data.data.pos_x, data.data.pos_y)
        end
    end)

    y3.game:event('界面-消息', EventEnum.UI.隐藏技能提示, function(trg, data)
        y3map.ui_manager.tips_ui:update_tips_skill()
    end)
end

function M:update_bottom()
    self:update_unit()
end

-- 更新主控面板
function M:update_unit()
    ---@type Unit
    local unit = self.select_obj
    if unit then
        self.avatar_img:set_image(unit.get_icon_by_key(unit:get_key())) -- 单位头像
        self.avatar_title_txt:set_text(unit:get_name()) --单位名称
        self.attr_spd_txt:set_text(math.floor(unit:get_final_attr(y3.const.UnitKeyFloatAttr['ORI_SPEED'])) .. '') --移动速度
        self.attr_atkSpd_txt:set_text(math.floor(unit:get_final_attr(y3.const.UnitKeyFloatAttr['ATTACK_SPEED'])) .. '') --攻击速度

        self.attr_atk_txt:set_text(math.floor(unit:get_final_attr(y3.const.UnitKeyFloatAttr['ATTACK_PHY'])) .. '') -- 物理攻击力
        self.attr_def_txt:set_text(math.floor(unit:get_final_attr(y3.const.UnitKeyFloatAttr['DEFENSE_PHY'])) .. '') -- 物理防御力
        self.attr_str_txt:set_text('自定义') -- 力量
        self.attr_agi_txt:set_text('自定义') -- 敏捷
        self.attr_int_txt:set_text('自定义') -- 智力

        --经验
        local exp_cur = math.ceil(unit:get_exp())
        local exp_max = math.ceil(unit:get_upgrade_exp())
        self.heroExp_bar:set_current_progress_bar_value(exp_cur)
        self.heroExp_bar:set_max_progress_bar_value(exp_max)
        self.heroExp_txt:set_text(exp_cur .. '/' .. exp_max)

        --生命
        local hp_cur = math.ceil(unit:get_hp())
        local hp_max = math.ceil(unit:get_final_attr(y3.const.UnitKeyFloatAttr['HP_MAX']))
        self.heroHp_bar:set_current_progress_bar_value(hp_cur)
        self.heroHp_bar:set_max_progress_bar_value(hp_max)
        self.heroHp_txt:set_text(hp_cur .. '/' .. hp_max)


        self.heroLevel_txt:set_text('等级: ' .. unit:get_level()) --等级文本
    end
end

---更新选中对象的物品 技能 商品
---@param select_obj Unit | Item | Destructible
function M:update_select_obj(select_obj)
    self.select_obj = select_obj
end

return M
