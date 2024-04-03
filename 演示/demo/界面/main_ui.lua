local tips_ui = require 'y3.演示.demo.界面.tips_ui'

local game_main_ui = y3.ui.get_ui(y3.player(1), '主控UI')
game_main_ui:set_visible(true)

local ability_list = game_main_ui:get_child('主界面.英雄技能'):get_childs()

for i = 1, 5 do
    local slot = ability_list[i]:get_child('slot')
    if slot then
        -- 用于显示技能tips
        slot:add_event('鼠标-移入', '显示技能提示',
            { slot = i, pos_x = slot:get_absolute_x(), pos_y = slot:get_absolute_y() })

        -- 用于隐藏技能tips
        slot:add_event('鼠标-移出', '隐藏技能提示')
    end
end
-- 玩家当前选中的单位
local select_unit

y3.game:event("选中-单位", function(_, data)
    select_unit = data.unit
end)

-- 技能图标 鼠标移入 显示提示
y3.game:event('界面-消息', '显示技能提示', function(trg, data)
    local ability = select_unit:get_ability_by_slot(y3.const.AbilityType.HERO, data.data.slot)
    if ability then
        tips_ui.show_tips_skill(select_unit, ability, data.data.pos_x, data.data.pos_y)
    end
end)

-- 技能图标 鼠标移出 隐藏提示
y3.game:event('界面-消息', '隐藏技能提示', function(trg, data)
    tips_ui.hide_tips_skill()
end)

local avatar_ui = game_main_ui:get_child('头像')
assert(avatar_ui)
local avatar_img = avatar_ui:get_child('图片')          --单位头像
local avatar_title_txt = avatar_ui:get_child('名字.文本')  --单位名称
local attr_spd_txt = avatar_ui:get_child('属性.移动速度.文本')          --移动速度
local attr_atkSpd_txt = avatar_ui:get_child('属性.攻击速度.文本') --攻击速度

local attr_list_ui = game_main_ui:get_child('属性栏')

assert(attr_list_ui)
local attr_atk_txt = attr_list_ui:get_child('atk.atk_TEXT') -- 物理攻击力
local attr_def_txt = attr_list_ui:get_child('def.def_TEXT') -- 物理防御力
local attr_str_txt = attr_list_ui:get_child('str.str_TEXT') -- 力量
local attr_agi_txt = attr_list_ui:get_child('agi.agi_TEXT') -- 敏捷
local attr_int_txt = attr_list_ui:get_child('int.int_TEXT') -- 智力

local heroHp_bar = game_main_ui:get_child('血条.进度条')         --生命值条
local heroHp_txt = game_main_ui:get_child('血条.文本')        --生命值文本

local heroExp_bar = game_main_ui:get_child('经验条.进度条')      --经验值条
local heroExp_txt = game_main_ui:get_child('经验条.经验文本')     --经验值文本

local heroLevel_txt = game_main_ui:get_child('经验条.等级文本') --等级文本


-- 更新主控面板
local function update_main_console_ui()
    ---@type Unit
    local unit = select_unit
    if unit then
        assert(avatar_img)
        avatar_img:set_image(unit.get_icon_by_key(unit:get_key()))                                                 -- 单位头像
        assert(avatar_title_txt)
        avatar_title_txt:set_text(unit:get_name())                                                                 --单位名称
        assert(attr_spd_txt)
        attr_spd_txt:set_text(math.floor(unit:get_final_attr(y3.const.UnitKeyFloatAttr['ORI_SPEED'])) .. '')       --移动速度
        assert(attr_atkSpd_txt)
        attr_atkSpd_txt:set_text(math.floor(unit:get_final_attr(y3.const.UnitKeyFloatAttr['ATTACK_SPEED'])) .. '') --攻击速度

        assert(attr_atk_txt)
        attr_atk_txt:set_text(math.floor(unit:get_final_attr(y3.const.UnitKeyFloatAttr['ATTACK_PHY'])) .. '') -- 物理攻击力
        assert(attr_def_txt)
        attr_def_txt:set_text(math.floor(unit:get_final_attr(y3.const.UnitKeyFloatAttr['DEFENSE_PHY'])) .. '') -- 物理防御力
        assert(attr_str_txt)
        attr_str_txt:set_text('自定义') -- 力量
        assert(attr_agi_txt)
        attr_agi_txt:set_text('自定义') -- 敏捷
        assert(attr_int_txt)
        attr_int_txt:set_text('自定义') -- 智力

        --经验
        local exp_cur = math.ceil(unit:get_exp())
        local exp_max = math.ceil(unit:get_upgrade_exp())
        assert(heroExp_bar)
        heroExp_bar:set_current_progress_bar_value(exp_cur)
        heroExp_bar:set_max_progress_bar_value(exp_max)
        assert(heroExp_txt)
        heroExp_txt:set_text(exp_cur .. '/' .. exp_max)

        --生命
        local hp_cur = math.ceil(unit:get_hp())
        local hp_max = math.ceil(unit:get_final_attr(y3.const.UnitKeyFloatAttr['HP_MAX']))
        assert(heroHp_bar)
        heroHp_bar:set_current_progress_bar_value(hp_cur)
        heroHp_bar:set_max_progress_bar_value(hp_max)
        assert(heroHp_txt)
        heroHp_txt:set_text(hp_cur .. '/' .. hp_max)
        assert(heroLevel_txt)
        heroLevel_txt:set_text('等级: ' .. unit:get_level()) --等级文本
    end
end


y3.timer.loop(0.03, function(_, _)
    update_main_console_ui()
end)
