-- 整个UI系统是异步的，请注意不要使用同步功能

--当前选中的单位
---@type Unit?
local current_unit

--更新头像
---@param main UI?
local function update_avatar(main)
    if not main then
        return
    end

    --更新头像的图片
    local image = main:get_child('图片')
    if image then
        if current_unit then
            image:set_image(current_unit:get_icon())
        else
            image:set_image(0)
        end
    end

    --更新头像上方的单位名字
    local name = main:get_child('名字.文本')
    if name then
        if current_unit then
            name:set_text(current_unit:get_name())
        else
            name:set_text('')
        end
    end

    --更新头像下方的属性
    local attr = main:get_child('属性')
    if attr then
        local attack_speed = attr:get_child('攻击速度.文本')
        local move_speed = attr:get_child('移动速度.文本')
        if current_unit then
            if attack_speed then
                attack_speed:bind_unit(current_unit)
            end
            if move_speed then
                move_speed:bind_unit(current_unit)
            end
        end
    end
end

--更新技能栏
---@param main UI?
local function update_ability(main)
    if not main then
        return
    end

    for i, slot in ipairs(main:get_childs()) do
        local ability = current_unit and current_unit:get_ability_by_slot(y3.const.AbilityType.HERO, i)
        if ability then
            slot:set_visible(true)
            slot:bind_ability(ability)
        else
            slot:set_visible(false)
        end
    end
end

local has_inited = false

---@param main UI?
local function init(main)
    if not main then
        return
    end
    if has_inited then
        return
    end
    has_inited = true

    local attack_speed = main:get_child('头像.属性.攻击速度.文本')
    if attack_speed then
        attack_speed:bind_unit_attr('文本', '攻击速度')
    end

    local move_speed = main:get_child('头像.属性.移动速度.文本')
    if move_speed then
        move_speed:bind_unit_attr('文本', '移动速度')
    end
end

local function update_main()
    y3.player.with_local(function (local_player)
        local main = y3.ui.get_ui(local_player, '主控')
        if not current_unit then
            main:set_visible(false)
            return
        end
        main:set_visible(true)
        init(main)
        update_avatar(main:get_child('头像'))
        update_ability(main:get_child('英雄技能'))
    end)
end

y3.game:event('选中-单位', function (trg, data)
    current_unit = data.unit
    update_main()
end)

y3.game:event('选中-单位组', function (trg, data)
    current_unit = data.unit_group_id_list:get_first()
    update_main()
end)

--模块加载后，等待一帧再刷新界面
y3.ltimer.wait(0, update_main)
