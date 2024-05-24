local M = {}

require 'y3.tools.synthesis'
local maker = New 'Synthesis'()

---@type table<string, py.ItemKey> # 物品配置，用来映射物品名和其对应的key，如{item1 = 10001}
local item_config = {}

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

-- 初始化物品配置
function M.init_item_config(config)
    item_config = config
end

---注册合成配方
---@param result any # 合成目标 "target"
---@param ingredients any[] # 合成素材 {"material1", "material2", "material3"}
function M.register(result, ingredients)
    maker:register(result, ingredients)
end

-- 拾取到物品后判断是否可以合成
function M.pick_synthesis_check()
    y3.game:event('物品-获得', function (trg, data)
        -- 存储当前单位全部的物品名
        local item_names = {}
        for i, v in ipairs(data.unit:get_all_items():pick()) do
            table.insert(item_names, v:get_name())
        end

        -- 获取合成结果
        local res = maker:check(item_names)

        -- 如果可以合成
        if res then
            -- 将合成目标所需的素材从该单位身上移除
            for _, v in ipairs(res.lost) do
                local item_key = M.get_item_key_by_name(v)
                if item_key then
                    data.unit:remove_item(item_key, 1)
                end
            end

            -- 给该单位增添合成后的目标物品
            local item_key = M.get_item_key_by_name(res.get)
            if item_key then
                data.unit:add_item(item_key)
            end
        end
    end)
end

---返回maker对象
---@return Synthesis # 合成处理对象
function M.get_maker()
    return maker
end


return M
