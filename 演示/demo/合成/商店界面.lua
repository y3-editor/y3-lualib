local shop = require 'y3.演示.demo.合成.商店合成'
local MAIN = require 'y3.演示.demo.界面.主控'
local maker = shop.get_maker()

---@type boolean # 判断装备合成UI界面是否打开
local is_equipment_ui_open = false

---@type boolean # 判断合成分支UI界面是否打开
local is_synthesis_ui_visible = false

---@type boolean # 判断物品描述UI界面是否打开
local is_description_ui_visible = false

---@type boolean # 判断购买按钮UI是否打开
local is_buy_btn_visible = false

---@type string? # 当前在物品列表界面中点击的物品
local cur_click_list_item = nil

---@type string? # 当前在物品合成界面中点击的物品
local cur_click_synthesis_item = nil

---@type string[]? # 商店物品名的集合
local shop_item_names = nil

---@type integer # 商店物品数量
local shop_item_num = 7

---@type table<string, string?> # 合成分支上的UI绑定的item
local ui_bound_item = {
    目标装备 = nil,
    素材1 = nil,
    素材2 = nil,
    素材3 = nil,
    素材4 = nil,
    父装备1 = nil,
    父装备2 = nil
}

-- 按Z键打开装备购买界面
y3.game:event('键盘-按下', y3.const.KeyboardKey['Z'], function (trg, data)
    local u = data.player:get_selecting_unit()
    if not u then
        return
    end

    if not is_equipment_ui_open then
        is_equipment_ui_open = true
        if not shop_item_names then
            shop_item_names = shop.get_shop_item_names()
        end
    else
        is_equipment_ui_open = false
        is_synthesis_ui_visible = false
        is_description_ui_visible = false
        is_buy_btn_visible = false

        cur_click_list_item = nil
        cur_click_synthesis_item = nil
    end
    MAIN:refresh('装备合成')
end)

-- 点击装备界面按钮打开装备购买界面
MAIN:on_event('装备界面按钮.btn', '左键-按下', function (ui, local_player)
    local u = local_player:get_selecting_unit()
    if not u then
        return
    end

    if not is_equipment_ui_open then
        is_equipment_ui_open = true
        if not shop_item_names then
            shop_item_names = shop.get_shop_item_names()
        end
    else
        is_equipment_ui_open = false
        is_synthesis_ui_visible = false
        is_description_ui_visible = false
        is_buy_btn_visible = false

        cur_click_list_item = nil
        cur_click_synthesis_item = nil
    end
    MAIN:refresh('装备合成')
end)

MAIN:on_refresh('装备合成', function (ui, local_player)
    if not local_player:get_selecting_unit() then
        return
    end
    ui:set_visible(is_equipment_ui_open)
end)

-- 给物品列表UI增加点击事件
for i = 1, shop_item_num do
    local child_name = string.format('装备合成.物品列表.lines.line1.bg%d', i)
    MAIN:on_refresh(child_name, function (ui, local_player)
        if shop_item_names then
            local item_key = shop.get_item_config()[shop_item_names[i]]
            if item_key then
                ui:set_visible(true)
                ui:get_child('highlight'):set_visible(false)
                ui:get_child('bg'):set_image(y3.item.get_icon_id_by_key(item_key))
                ui:get_child('name'):set_text(y3.item.get_name_by_key(item_key))
            else
                ui:set_visible(false)
            end
        end
    end)

    MAIN:on_event(child_name..'.btn'..tostring(i), '左键-按下', function (ui, local_player)
        if shop_item_names then
            is_synthesis_ui_visible = true
            is_description_ui_visible = false
            is_buy_btn_visible = false
            cur_click_list_item = shop_item_names[i]

            MAIN:refresh('装备合成.合成分支')
            MAIN:refresh('装备合成.描述')
            MAIN:refresh('装备合成.购买按钮')
        end
    end)

    MAIN:on_event(child_name..'.btn'..i, '鼠标-移入', function (ui, local_player)
        if shop_item_names then
            ui:get_parent():get_child('highlight'):set_visible(true)
        end
    end)

    MAIN:on_event(child_name..'.btn'..i, '鼠标-移出', function (ui, local_player)
        if shop_item_names then
            ui:get_parent():get_child('highlight'):set_visible(false)
        end
    end)
end

MAIN:on_refresh('装备合成.合成分支', function (ui, local_player)
    if not local_player:get_selecting_unit() then
        return
    end
    ui:set_visible(is_synthesis_ui_visible)

    -- 先将合成分支中的物品UI都设置为不可见
    ui:get_child('bg'):set_visible(false)
    for i = 1, 4 do
        ui:get_child('cbg'..i):set_visible(false)
    end
    for i = 1, 2 do
        ui:get_child('pbg'..i):set_visible(false)
    end

    -- 如果当前点击了物品列表UI绑定的物品
    if cur_click_list_item then
        local cur_click_list_item_key =  shop.get_item_config()[cur_click_list_item]
        -- 获取当前点击物品的所有配方
        local result = maker:get_recipes_by_item(cur_click_list_item)
        -- 计算当前玩家物品栏中所有的物品名
        local cur_player_item_names = {}
        for i, v in ipairs(local_player:get_selecting_unit():get_all_items():pick()) do
            table.insert(cur_player_item_names, v:get_name())
        end

        -- 设置当前物品的UI显示
        ui:get_child('bg'):set_visible(true)
        ui:get_child('bg.目标装备'):set_image(y3.item.get_icon_id_by_key(cur_click_list_item_key))
        ui:get_child('bg.highlight'):set_visible(false)
        -- 计算花费
        local cur_cost = shop.get_item_price_by_name(cur_click_list_item)
        -- 只有在配方中的物品才计算当前花费，否则维持原价
        if maker:get_recipes()[cur_click_list_item] then
            local cur_res = maker:target_check(cur_click_list_item, cur_player_item_names)
            if cur_res then
                for _, v in ipairs(cur_res.lost) do
                    cur_cost = cur_cost - shop.get_item_price_by_name(v)
                end
            end
        end
        -- 更新当前UI绑定的物品
        ui_bound_item.目标装备 = cur_click_list_item
        ui:get_child('bg.cost'):set_text(tostring(math.tointeger(cur_cost)))

        -- 设置当前物品的素材UI显示
        for i, name in ipairs(result.children) do
            local child_key =  shop.get_item_config()[name]
            if child_key then
                ui:get_child(string.format('cbg%d', i)):set_visible(true)
                ui:get_child(string.format('cbg%d.素材%d', i, i)):set_image(y3.item.get_icon_id_by_key(child_key))
                ui:get_child(string.format('cbg%d.highlight', i)):set_visible(false)
                -- 计算花费
                local child_cost = shop.get_item_price_by_name(name)
                -- 只有在配方中的物品才计算当前花费
                if maker:get_recipes()[name] then
                    local child_res = maker:target_check(name, cur_player_item_names)
                    if child_res then
                        for _, v in ipairs(child_res.lost) do
                            child_cost = child_cost - shop.get_item_price_by_name(v)
                        end
                    end
                end
                -- 更新当前UI绑定的物品
                ui_bound_item[string.format('素材%d', i)] = name
                ui:get_child(string.format('cbg%d.cost', i)):set_text(tostring(math.tointeger(child_cost)))
            end
        end

        -- 设置当前物品的父物品UI显示
        for i, name in ipairs(result.parents) do
            local parent_key = shop.get_item_config()[name]
            if parent_key then
                ui:get_child(string.format('pbg%d', i)):set_visible(true)
                ui:get_child(string.format('pbg%d.父装备%d', i, i)):set_image(y3.item.get_icon_id_by_key(parent_key))
                ui:get_child(string.format('pbg%d.highlight', i)):set_visible(false)
                ui:get_child(string.format('pbg%d.name', i)):set_text(name)
                ui_bound_item[string.format('父装备%d', i)] = name
            end
        end
    end
end)

-- 给合成界面UI注册点击事件
MAIN:on_event('装备合成.合成分支.bg.btn', '左键-按下', function (ui, local_player)
    cur_click_synthesis_item = ui_bound_item.目标装备
    is_description_ui_visible = true
    is_buy_btn_visible = true
    MAIN:refresh('装备合成.描述')
    MAIN:refresh('装备合成.购买按钮')
end)
MAIN:on_event('装备合成.合成分支.bg.btn', '鼠标-移入', function (ui, local_player)
    ui:get_parent():get_child('highlight'):set_visible(true)
end)
MAIN:on_event('装备合成.合成分支.bg.btn', '鼠标-移出', function (ui, local_player)
    ui:get_parent():get_child('highlight'):set_visible(false)
end)
for i = 1, 4 do
    local child_name = string.format('装备合成.合成分支.cbg%d.btn%d', i, i)
    MAIN:on_event(child_name, '左键-按下', function (ui, local_player)
        cur_click_synthesis_item = ui_bound_item[string.format('素材%d', i)]
        is_description_ui_visible = true
        is_buy_btn_visible = true
        MAIN:refresh('装备合成.描述')
        MAIN:refresh('装备合成.购买按钮')
    end)
    MAIN:on_event(child_name, '鼠标-移入', function (ui, local_player)
        ui:get_parent():get_child('highlight'):set_visible(true)
    end)
    MAIN:on_event(child_name, '鼠标-移出', function (ui, local_player)
        ui:get_parent():get_child('highlight'):set_visible(false)
    end)
end
for i = 1, 2 do
    local child_name = string.format('装备合成.合成分支.pbg%d.btn%d', i, i)
    MAIN:on_event(child_name, '左键-按下', function (ui, local_player)
        is_synthesis_ui_visible = true
        is_description_ui_visible = false
        is_buy_btn_visible = false
        cur_click_list_item = ui_bound_item[string.format('父装备%d', i)]

        MAIN:refresh('装备合成.合成分支')
        MAIN:refresh('装备合成.描述')
        MAIN:refresh('装备合成.购买按钮')
    end)
    MAIN:on_event(child_name, '鼠标-移入', function (ui, local_player)
        ui:get_parent():get_child('highlight'):set_visible(true)
    end)
    MAIN:on_event(child_name, '鼠标-移出', function (ui, local_player)
        ui:get_parent():get_child('highlight'):set_visible(false)
    end)
end

MAIN:on_refresh('装备合成.描述', function (ui, local_player)
    if not local_player:get_selecting_unit() then
        return
    end
    ui:set_visible(is_description_ui_visible)

    if cur_click_synthesis_item then
        local cur_click_synthesis_item_key = nil
        if shop_item_names then
            cur_click_synthesis_item_key = shop.get_item_config()[cur_click_synthesis_item]
        end
        if cur_click_synthesis_item_key then
            ui:get_child('图标'):set_image(y3.item.get_icon_id_by_key(cur_click_synthesis_item_key))
            ui:get_child('标题'):set_text(y3.item.get_name_by_key(cur_click_synthesis_item_key))
            ui:get_child('txt'):set_text(y3.item.get_description_by_key(cur_click_synthesis_item_key))
        end
    end
end)

MAIN:on_event('装备合成.购买按钮', '左键-按下', function (ui, local_player)
    local u = local_player:get_selecting_unit()
    if not u then
        return
    end

    if cur_click_synthesis_item then
        -- 发送购买请求
        y3.sync.send('demo-购买商店物品', {
            item_name = cur_click_synthesis_item,
            player_id = local_player:get_id(),
        })
        MAIN:refresh('装备合成.合成分支')
        MAIN:refresh('装备合成.玩家金币')
    end
end)

MAIN:on_refresh('装备合成.购买按钮', function (ui, local_player)
    if not local_player:get_selecting_unit() then
        return
    end
    ui:set_visible(is_buy_btn_visible)
end)

MAIN:on_refresh('装备合成.玩家金币', function (ui, local_player)
    local player_gold = local_player:get_attr("gold")
    ui:get_child('num'):set_text(tostring(math.tointeger(player_gold)))
end)

MAIN:on_event('装备合成.关闭', '左键-按下', function (ui, local_player)
    is_equipment_ui_open = false
    is_synthesis_ui_visible = false
    is_description_ui_visible = false
    is_buy_btn_visible = false

    cur_click_list_item = nil
    cur_click_synthesis_item = nil
    MAIN:refresh('装备合成')
end)
