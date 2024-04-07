-- 整个UI系统是异步的，请注意不要使用同步功能

--当前选中的单位
---@type Unit?
local current_unit

--更新头像
---@param local_player Player
local function update_avatar(local_player)
    local parent = y3.ui.get_ui(local_player, '主控')
    local main = parent:get_child('头像')
    if not main or not current_unit then
        return
    end

    --更新头像的图片
    local image = main:get_child('图片')
    if image then
        image:set_image(current_unit:get_icon())
    end

    --更新头像上方的单位名字
    local name = main:get_child('名字.文本')
    if name then
        name:set_text(current_unit:get_name())
    end
end

--更新技能栏
---@param local_player Player
local function update_ability(local_player)
    local parent = y3.ui.get_ui(local_player, '主控')
    local main = parent:get_child('英雄技能')
    if not main or not current_unit then
        return
    end

    for i, slot in ipairs(main:get_childs()) do
        local ability = current_unit:get_ability_by_slot(y3.const.AbilityType.HERO, i)
        if ability then
            slot:set_visible(true)
            --必须要主动绑定，否则会闪烁一下
            slot:bind_ability(ability)
        else
            slot:set_visible(false)
        end
    end
end

--更新经验条
---@param local_player Player
local function update_exp(local_player)
    local parent = y3.ui.get_ui(local_player, '主控')
    local main = parent:get_child('经验条')
    if not main or not current_unit then
        return
    end

    local level = current_unit:get_level()
    local exp = current_unit:get_exp()
    local max_exp = current_unit:get_upgrade_exp()

    local bar = main:get_child('进度条')
    if bar then
        bar:set_max_progress_bar_value(max_exp)
        bar:set_current_progress_bar_value(exp)
    end

    local exp_text = main:get_child('经验文本')
    if exp_text then
        if max_exp > 0 then
            exp_text:set_text(string.format('%d/%d', exp, max_exp))
        else
            exp_text:set_text('最大')
        end
    end

    local level_text = main:get_child('等级文本')
    if level_text then
        level_text:set_text(string.format('等级%d', level))
    end
end

local has_inited = false

--初始化属性绑定
---@param main UI?
local function init(main)
    if not main then
        return
    end
    if has_inited then
        return
    end
    has_inited = true

    --将子控件的属性绑定到单位的属性
    ---@param child_name string
    ---@param ui_attr y3.Const.UIAttr
    ---@param unit_attr y3.Const.UnitAttr
    local function bind(child_name, ui_attr, unit_attr)
        local ui = main:get_child(child_name)
        if ui then
            ui:bind_unit_attr(ui_attr, unit_attr)
        end
    end

    bind('头像.属性.攻击速度.文本', '文本', '攻击速度')
    bind('头像.属性.移动速度.文本', '文本', '移动速度')
    bind('血条.进度条', '当前值', '生命')
    bind('血条.进度条', '最大值', '最大生命')
    bind('血条.文本.当前值', '文本', '生命')
    bind('血条.文本.最大值', '文本', '最大生命')
    bind('蓝条.进度条', '当前值', '魔法')
    bind('蓝条.进度条', '最大值', '最大魔法')
    bind('蓝条.文本.当前值', '文本', '魔法')
    bind('蓝条.文本.最大值', '文本', '最大魔法')
    bind('属性栏.攻击.文本', '文本', '物理攻击')
    bind('属性栏.防御.文本', '文本', '物理防御')
    bind('属性栏.力量.文本', '文本', '力量')
    bind('属性栏.敏捷.文本', '文本', '敏捷')
    bind('属性栏.智力.文本', '文本', '智力')
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
        update_avatar(local_player)
        update_ability(local_player)
        update_exp(local_player)
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

y3.game:event('单位-获得经验后', function (trg, data)
    if data.unit == current_unit then
        y3.player.with_local(function (local_player)
            update_exp(local_player)
        end)
    end
end)

y3.game:event('单位-升级', function (trg, data)
    if data.unit == current_unit then
        y3.player.with_local(function (local_player)
            update_exp(local_player)
        end)
    end
end)

--模块加载后，等待一帧再刷新界面
y3.ltimer.wait(0, update_main)
