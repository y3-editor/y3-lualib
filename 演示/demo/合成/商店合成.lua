local M = {}

require 'y3.tools.synthesis'
local maker = New 'Synthesis'()

---@type table<string, py.ItemKey> # 物品配置，用来映射物品名和其对应的key，如{item1 = 10001}
local item_config = {}

---@type string[] # 商店物品集合，{'item1', 'item2'}
local item_names = {}

---输入物品名返回对应的key
---@param name string # 物品名
---@return py.ItemKey? # 对应的key
function M.get_item_key_by_name(name)
    -- 判断是否在配置中
    if item_config[name] then
        return item_config[name]
    else
        return nil
    end
end

---输入物品名返回其购买价格
---@param name string # 物品名
---@return number? # 对应的价格
function M.get_item_price_by_name(name)
    local item_key = M.get_item_key_by_name(name)
    if not item_key then
        return nil
    end
    local price = y3.item.get_item_buy_price_by_key(item_key, 'gold')
    return price
end

-- 初始化物品配置
function M.init_item_config(config)
    item_config = config
end

---商店物品初始化
---@param items string[] # 物品名{'item1', 'item2'}
function M.init_shop_item(items)
    item_names = items
end

---注册合成配方
---@param result any # 合成目标 "target"
---@param ingredients any[] # 合成素材 {"material1", "material2", "material3"}
function M.register(result, ingredients)
    maker:register(result, ingredients)
end

-- 进行帧同步
y3.sync.onSync('demo-购买商店物品', function (data, source)
    if not data then
        return
    end
    local item_name = data.item_name
    local player = y3.player(data.player_id)
    local u = player:get_selecting_unit()
    if not u then
        return
    end

    -- 判断是否有足够gold来购买
    local gold = player:get_attr('gold')

    -- 获取当前玩家物品栏中所有物品名
    local player_item_names = {}
    for i, v in ipairs(u:get_all_items():pick()) do
        table.insert(player_item_names, v:get_name())
    end

    -- 计算当前物品花费
    local item_cost = M.get_item_price_by_name(item_name)
    -- 只有在配方中的物品才需计算当前所需花费
    local res = nil
    if maker:get_recipes()[item_name] then
        res = maker:target_check(item_name, player_item_names)
        if res then
            for _, v in ipairs(res.lost) do
                item_cost = item_cost - M.get_item_price_by_name(v)
            end
        end
    end

    if gold >= item_cost then
        -- 如果购买的物品存在配方则需移除其合成素材
        if res then
            for _, v in ipairs(res.lost) do
                local cur_item_key = M.get_item_key_by_name(v)
                if cur_item_key then
                    u:remove_item(cur_item_key, 1)
                end
            end
        end
        -- 扣除玩家gold并给玩家添加该物品
        player:set('gold', gold - item_cost)
        local item_key = M.get_item_key_by_name(item_name)
        if item_key then
            u:add_item(item_key)
        end
    else
        print('玩家金币不足')
    end
end)

---返回maker对象
---@return Synthesis # 合成处理对象
function M.get_maker()
    return maker
end

---返回商店物品名集合
---@return string[]
function M.get_shop_item_names()
    return item_names
end

---返回商店物品配置
---@return table<string, py.ItemKey>
function M.get_item_config()
    return item_config
end

return M
