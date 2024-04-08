-- 整个UI系统是异步的，请注意不要使用同步功能
local MAIN = require 'y3.演示.demo.界面.主控'

local DESC = New 'LocalUILogic' ('Y3描述')

---@type Ability?
local current_ability

---@type UI?
local current_ui

for i = 1, 4 do
    local child_name = string.format('英雄技能.%d', i)

    MAIN:on_event(child_name, '鼠标-移入', function (ui, local_player)
        local selecting_unit = local_player:get_selecting_unit()
        if selecting_unit then
            current_ability = selecting_unit:get_ability_by_slot(y3.const.AbilityType.HERO, i)
        else
            current_ability = nil
        end
        current_ui = ui
        DESC:refresh('*')
    end)

    MAIN:on_event(child_name, '鼠标-移出', function (ui, local_player)
        current_ability = nil
        current_ui = nil
        DESC:refresh('*')
    end)
end

DESC:on_refresh('*', function (ui, local_player)
    if current_ability and current_ui then
        ui:set_visible(true)
    else
        ui:set_visible(false)
    end
end)

DESC:on_refresh('面板', function (ui, local_player)
    if not current_ui then
        return
    end
    ui:set_absolute_pos(current_ui:get_absolute_x() - 100, current_ui:get_absolute_y() + 100)
end)

DESC:on_refresh('面板.标题.图标', function (ui, local_player)
    if not current_ability then
        return
    end
    ui:set_image(current_ability:get_icon())
end)

DESC:on_refresh('面板.标题.文本', function (ui, local_player)
    if not current_ability then
        return
    end
    ui:set_text(current_ability:get_name())
end)

DESC:on_refresh('面板.描述', function (ui, local_player)
    if not current_ability then
        return
    end
    ui:set_text(current_ability:get_description())
end)
