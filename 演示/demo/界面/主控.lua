-- 整个UI系统是异步的，请注意不要使用同步功能

local MAIN = New 'LocalUILogic' ('Y3主控')

MAIN:bind_unit_attr('头像.属性.攻击速度.文本', '文本', '攻击速度')
MAIN:bind_unit_attr('头像.属性.移动速度.文本', '文本', '移动速度')
MAIN:bind_unit_attr('血条.进度条', '当前值', '生命')
MAIN:bind_unit_attr('血条.进度条', '最大值', '最大生命')
MAIN:bind_unit_attr('血条.文本.当前值', '文本', '生命')
MAIN:bind_unit_attr('血条.文本.最大值', '文本', '最大生命')
MAIN:bind_unit_attr('蓝条.进度条', '当前值', '魔法')
MAIN:bind_unit_attr('蓝条.进度条', '最大值', '最大魔法')
MAIN:bind_unit_attr('蓝条.文本.当前值', '文本', '魔法')
MAIN:bind_unit_attr('蓝条.文本.最大值', '文本', '最大魔法')
MAIN:bind_unit_attr('属性栏.攻击.文本', '文本', '物理攻击')
MAIN:bind_unit_attr('属性栏.防御.文本', '文本', '物理防御')
MAIN:bind_unit_attr('属性栏.力量.文本', '文本', '力量')
MAIN:bind_unit_attr('属性栏.敏捷.文本', '文本', '敏捷')
MAIN:bind_unit_attr('属性栏.智力.文本', '文本', '智力')

MAIN:on_refresh('头像.图片', function (ui, local_player)
    if not local_player:get_selecting_unit() then
        return
    end
    ui:set_image(local_player:get_selecting_unit():get_icon())
end)

MAIN:on_refresh('头像.名字.文本', function (ui, local_player)
    if not local_player:get_selecting_unit() then
        return
    end
    ui:set_text(local_player:get_selecting_unit():get_name())
end)

MAIN:on_refresh('英雄技能', function (ui, local_player)
    if not local_player:get_selecting_unit() then
        return
    end

    for i, slot in ipairs(ui:get_childs()) do
        local ability = local_player:get_selecting_unit():get_ability_by_slot(y3.const.AbilityType.HERO, i)
        if ability then
            slot:set_visible(true)
            --必须要主动绑定，否则会闪烁一下
            slot:bind_ability(ability)
        else
            slot:set_visible(false)
        end
    end
end)

MAIN:on_refresh('经验条.进度条', function (ui, local_player)
    if not local_player:get_selecting_unit() then
        return
    end

    ui:set_max_progress_bar_value(local_player:get_selecting_unit():get_upgrade_exp())
    ui:set_current_progress_bar_value(local_player:get_selecting_unit():get_exp())
end)

MAIN:on_refresh('经验条.经验文本', function (ui, local_player)
    if not local_player:get_selecting_unit() then
        return
    end

    local exp = local_player:get_selecting_unit():get_exp()
    local max_exp = local_player:get_selecting_unit():get_upgrade_exp()

    if max_exp > 0 then
        ui:set_text(string.format('%d/%d', exp, max_exp))
    else
        ui:set_text('最大')
    end
end)

MAIN:on_refresh('经验条.等级文本', function (ui, local_player)
    if not local_player:get_selecting_unit() then
        return
    end

    ui:set_text(string.format('等级%d', local_player:get_selecting_unit():get_level()))
end)

MAIN:on_refresh('*', function (ui, local_player)
    if local_player:get_selecting_unit() then
        ui:set_visible(true)
    else
        ui:set_visible(false)
    end
end)

y3.game:event('选中-单位', function (trg, data)
    MAIN:refresh('*', data.player)
end)

y3.game:event('选中-单位组', function (trg, data)
    MAIN:refresh('*', data.player)
end)

y3.game:event('单位-获得经验后', function (trg, data)
    y3.player.with_local(function (local_player)
        if local_player:get_selecting_unit() == data.unit then
            MAIN:refresh('经验条')
        end
    end)
end)

y3.game:event('单位-升级', function (trg, data)
    y3.player.with_local(function (local_player)
        if local_player:get_selecting_unit() == data.unit then
            MAIN:refresh('经验条')
        end
    end)
end)

return MAIN
