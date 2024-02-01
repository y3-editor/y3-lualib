--物品
---@class Item
---@field handle py.Item
---@field id py.ItemID
---@overload fun(id: py.ItemID, py_item: py.Item): self
local M = Class "Item"

M.type = "item"

---@class Item: Storage
Extends("Item", "Storage")
---@class Item: GCHost
Extends("Item", "GCHost")
---@class Item: CustomEvent
Extends("Item", "CustomEvent")
---@class Item: ObjectEvent
Extends("Item", "ObjectEvent")
---@class Item: KV
Extends("Item", "KV")

function M:__tostring()
    return string.format("{item|%s|%s}"
    , self:get_name()
    , self.handle
    )
end

---@param id py.ItemID
---@param py_item py.Item # py层的道具实例
---@return Item # 返回在lua层初始化后的lua层道具实例
function M:__init(id, py_item)
    self.id     = id
    self.handle = py_item
    return self
end

function M:__del()
    self.handle:api_remove()
end

---@package
---@param id py.ItemID
---@return Item?
M.ref_manager = New "Ref" ("Item", function(id)
    local py_item = GameAPI.get_item(id)
    if not py_item then
        return nil
    end
    return New "Item" (id, py_item)
end)

---通过py层的技能实例获取lua层的道具实例
---@param  py_item py.Item py层的道具实例
---@return Item # 返回在lua层初始化后的lua层道具实例
function M.从句柄获取(py_item)
    local id = py_item:api_get_id()
    return M.从ID获取(id)
end

y3.py_converter.register_py_to_lua("py.Item", M.从句柄获取)
y3.py_converter.register_lua_to_py("py.Item", function(lua_value)
    return lua_value.handle
end)

-- 通过id获取lua层的道具实例
---@param id py.ItemID
---@return Item # 返回在lua层初始化后的lua层道具实例
function M.从ID获取(id)
    local item = M.ref_manager:get(id)
    return item
end

y3.py_converter.register_py_to_lua("py.ItemID", M.从ID获取)

y3.游戏:事件("物品-移除", function(trg, data)
    local item = data.item
    M.ref_manager:remove(item.id)
end)

---是否存在
---@return boolean is_exist 是否存在
function M:是否存在()
    return GameAPI.item_is_exist(self.handle)
end

-- 获取唯一ID
---@return integer
function M:获取ID()
    return self.id
end

---存在标签
---@param tag string 删除标签
---@return boolean is_has_tag 是否有标签
function M:是否存在标签(tag)
    return self.handle:api_has_tag(tag)
end

---是否在场景中
---@return boolean is_in_scene 是否在场景中
function M:是否在场景中()
    if not self:是否存在() then
        return false
    end
    return self.handle:api_is_in_scene()
end

---物品在物品栏
---@return boolean is_in_bar 是否在物品栏
function M:是否在物品栏()
    return self.handle:api_is_in_bar()
end

---物品在背包栏
---@return boolean is_in_bag 是否在背包栏
function M:是否在背包栏()
    return self.handle:api_is_in_pkg()
end

---遍历物品的单位属性
---@return string[] keys 属性key
function M:获取所有单位属性()
    -- 去掉首尾的方括号
    local tmp = tostring(GameAPI.iter_unit_attr_of_item(self.handle)):sub(2, -2)
    local result = {}
    for match in tmp:gmatch("'([^']+)'") do
        table.insert(result, match)
    end
    return result
end

---遍历物品类型的单位属性
---@param item_key py.ItemKey 物品类型
---@return string[] keys 属性key
function M.获取所有单位属性_从类型(item_key)
    -- 去掉首尾的方括号
    local tmp = tostring(GameAPI.iter_unit_attr_of_item_name(item_key)):sub(2, -2)
    local result = {}
    for match in tmp:gmatch("'([^']+)'") do
        table.insert(result, match)
    end
    return result
end

---删除物品
function M:移除()
    Delete(self)
end

---丢弃物品到点
---@param point Point 目标点
---@param count integer 丢弃数量
function M:丢弃到点(point, count)
    self.handle:api_drop_self(point.handle, count)
end

---移动到点
---@param point Point 点
function M:移动到点(point)
    -- TODO 见问题2
    ---@diagnostic disable-next-line: param-type-mismatch
    self.handle:api_transmit(point.handle)
end

---设置物品的名称
---@param name string 名字
function M:设置名称(name)
    self.handle:set_name(name)
end

---设置物品的描述
---@param description string 描述
function M:设置描述(description)
    self.handle:api_set_desc(description)
end

---设置物品的图标
---@param picture_id py.Texture 图片id
function M:设置图标(picture_id)
    self.handle:api_set_item_icon(picture_id)
end

---获取物品的图标
---@return py.Texture
function M:获取图标()
    return self.handle:api_get_item_icon()
end

---设置所属玩家
---@param player Player 所属玩家
function M:设置所属玩家(player)
    self.handle:api_set_creator(player.handle)
end

---设置等级
---@param level integer 等级
function M:设置等级(level)
    self.handle:api_set_level(level)
end

---设置充能数
---@param charge integer 充能数
function M:设置充能数(charge)
    self.handle:api_set_charge_cnt(charge)
end

---增加充能数
---@param charge integer 充能数
function M:增加充能数(charge)
    self.handle:api_add_charge(charge)
end

---设置最大充能数
---@param charge integer 最大充能数
function M:设置最大充能数(charge)
    self.handle:api_set_max_charge(charge)
end

---设置堆叠数
---@param stack integer 堆叠数
function M:设置堆叠数(stack)
    self.handle:api_set_stack_cnt(stack)
end

---增加堆叠数
---@param stack integer 堆叠数
function M:增加堆叠数(stack)
    self.handle:api_add_stack(stack)
end

---设置基础属性
---@param key string 属性key
---@param value number 属性值
function M:设置基础属性(key, value)
    self.handle:api_set_attr("ATTR_BASE", key, value)
end

---增加基础属性
---@param key string 属性key
---@param value number 属性值
function M:增加基础属性(key, value)
    self.handle:api_change_attr("ATTR_BASE", key, value)
end

---获取物品的基础属性
---@param key string 属性key
---@return number
function M:获取基础属性(key)
    return self.handle:api_get_attr("ATTR_BASE", key):float()
end

---设置增益属性
---@param key string 属性key
---@param value number 属性值
function M:设置增益属性(key, value)
    self.handle:api_set_attr("ATTR_BONUS", key, value)
end

---增加增益属性
---@param key string 属性key
---@param value number 属性值
function M:增加增益属性(key, value)
    self.handle:api_change_attr("ATTR_BONUS", key, value)
end

---获取物品的增益属性
---@param key string 属性key
---@return number
function M:获取增益属性(key)
    return self.handle:api_get_attr("ATTR_BONUS", key):float()
end

---设置生命值
---@param value number 生命值
function M:set_hp(value)
    self.handle:api_set_hp(value)
end

---给物品添加被动技能
---@param ability_id py.AbilityKey 技能id
---@param level integer 等级
function M:add_passive_ability(ability_id, level)
    self.handle:api_item_add_passive_ability(ability_id, level)
end

---设置丢弃状态
---@param dropable boolean 状态
function M:set_droppable(dropable)
    self.handle:api_set_droppable(dropable)
end

---添加标签
---@param tag string 标签
function M:add_tag(tag)
    self.handle:api_add_tag(tag)
end

---@param tag string 标签
function M:remove_tag(tag)
    self.handle:api_remove_tag(tag)
end

---设置物品可否出售
---@param state boolean 是否可出售
function M:set_sale_state(state)
    self.handle:api_set_sale_state(state)
end

---设置物品缩放
---@param scale number 缩放
function M:set_scale(scale)
    self.handle:api_set_scale(scale)
end

--设置物品可见性
---@param is_visible boolean # 是否可见
function M:set_visible(is_visible)
    self.handle:api_set_item_visible(is_visible)
end

---设置物品朝向
---@param facing number 朝向
function M:set_facing(facing)
    self.handle:api_set_face_angle(facing)
end

---获取物品类型id
---@return py.ItemKey key 类型
function M:get_key()
    return self.handle:api_get_key()
end

---设置物品商品售价
---@param id py.ItemKey 物品id
---@param player_attr_name py.RoleResKey 玩家属性
---@param price number 价格
function M.set_shop_price(id, player_attr_name, price)
    GameAPI.set_item_buy_price(id, player_attr_name, price)
end

---物品持有者
---@return Unit? owner 持有者
function M:get_owner()
    local py_owner = self.handle:api_get_owner()
    if not py_owner then
        return nil
    end
    return y3.单位.从handle获取(py_owner)
end

---物品所在点
---@return Point position 物品所在点
function M:get_point()
    local py_point = self.handle:api_get_position()
    -- TODO 见问题2
    ---@diagnostic disable-next-line: param-type-mismatch
    return y3.点.从handle获取(py_point)
end

---物品堆叠数
---@return integer stacks 堆叠数
function M:get_stack()
    return self.handle:api_get_stack_cnt()
end

---物品充能数
---@return integer charges 充能数
function M:get_charge()
    return self.handle:api_get_charge_cnt()
end

---获取最大充能数
---@return integer max_charge 最大充能数
function M:get_max_charge()
    return self.handle:api_get_max_charge()
end

---获取物品等级
---@return integer level 物品等级
function M:get_level()
    return self.handle:api_get_level()
end

---获取物品的生命值
---@return number hp 物品的生命值
function M:get_hp()
    return self.handle:api_get_hp():float()
end

---获取物品名
---@return string name 物品名字
function M:get_name()
    return self.handle:get_name()
end

---获取物品描述
---@return string description 物品描述
function M:get_description()
    return self.handle:api_get_desc()
end

---获取物品缩放
---@return number scale 物品缩放
function M:get_scale()
    return self.handle:api_get_scale():float()
end

---获取物品的朝向
---@return number angel 朝向
function M:get_facing()
    return self.handle:api_get_face_angle():float()
end

---获取物品的主动技能
---@return Ability? ability 主动技能
function M:get_ability()
    local py_ability = self.handle:api_get_positive_ability()
    if not py_ability then
        return nil
    end
    return y3.ability.get_by_handle(py_ability)
end

---获取物品的被动技能
---@param index integer
---@return Ability? ability 被动技能
function M:get_passive_ability(index)
    local py_ability = self.handle:api_get_passive_ability(index)
    if not py_ability then
        return nil
    end
    return y3.ability.get_by_handle(py_ability)
end

---获取物品在单位身上的格子位置
---@return integer index 格子位置
function M:get_slot()
    if not self.handle:api_get_owner() then
        return -1
    end
    return self.handle:api_get_item_slot_idx()
end

---获取物品的拥有玩家
---@return Player player 玩家
function M:get_owner_player()
    local py_player = self.handle:api_get_creator()
    return y3.玩家.从句柄获取(py_player)
end

---获取物品在单位身上的背包槽类型
---@return py.SlotType 背包槽类型
function M:get_slot_type()
    if not self.handle:api_get_owner() then
        return -1
    end
    return self.handle:api_get_item_slot_type()
end

--------------------------------------------------------类的方法--------------------------------------------------------

---检查物品类型前置条件
---@param player Player 玩家
---@param item_key py.ItemKey 物品类型ID
---@return boolean
function M.check_precondition_by_key(player, item_key)
    return GameAPI.check_item_key_precondition(player.handle, item_key)
end

---创建物品到点
---@param point Point 点
---@param item_key py.ItemKey 道具类型
---@param player? Player 玩家
---@return Item
function M.create_item(point, item_key, player)
    if not player then
        player = y3.玩家(31)
    end
    local py_item = GameAPI.create_item_by_id(point.handle, item_key, player.handle)
    return M.从句柄获取(py_item)
end

---获取物品购买售价
---@param item_key py.ItemKey 类型
---@param key py.RoleResKey 玩家属性
---@return number price 价格
function M.get_item_buy_price_by_key(item_key, key)
    return GameAPI.get_item_buy_price(item_key, key):float()
end

---获取物品出售售价
---@param item_key py.ItemKey 类型
---@param key py.RoleResKey 玩家属性
---@return number price 价格
function M.get_item_sell_price_by_key(item_key, key)
    return GameAPI.get_item_sell_price(item_key, key):float()
end

---获得区域内所有物品
---@param area Area 区域
---@return ItemGroup
function M.get_item_group_in_area(area)
    local py_item_group = GameAPI.get_item_group_in_area(area.handle)
    return y3.item_group.create_lua_item_group_from_py(py_item_group)
end

---获取物品类型名
---@param item_key py.ItemKey 物品类型
---@return string
function M.get_name_by_key(item_key)
    return GameAPI.get_item_conf_name(item_key)
end

---获取物品类型的icon的图片id
---@param item_key py.ItemKey 物品类型
---@return integer
function M.get_icon_id_by_key(item_key)
    return GameAPI.get_icon_id_by_item_type(item_key)
end

---获取物品类型的描述
---@param item_key py.ItemKey 物品类型
---@return string
function M.get_description_by_key(item_key)
    return GameAPI.get_item_desc_by_type(item_key)
end

---获取物品模型
---@return py.ModelKey model_key 模型类型
function M:get_model()
    return self.handle:api_get_item_model()
end

---获取物品类型的模型
---@param item_key py.ItemKey 物品类型
---@return py.ModelKey model_key 模型类型
function M.get_model_by_key(item_key)
    return GameAPI.api_get_item_type_model(item_key)
end

--物品类型合成所需的物品类型数量
---@param item_key py.ItemKey
---@param comp_item_key py.ItemKey
---@return integer
function M.get_num_of_item_mat(item_key, comp_item_key)
    return GameAPI.api_get_value_of_item_name_comp_mat(item_key, comp_item_key)
end

--物品类型合成所需的玩家属性数量
---@param item_key py.ItemKey
---@param role_res_key py.RoleResKey
---@return number
function M.get_num_of_player_attr(item_key, role_res_key)
    return GameAPI.api_get_value_of_item_name_comp_res(item_key, role_res_key)
end

---获取物品类型的基础属性
---@param key string 属性key
---@param item_key py.ItemKey 物品类型
---@return number
function M.get_attribute_by_key(item_key, key)
    ---@diagnostic disable-next-line: return-type-mismatch
    return GameAPI.api_get_attr_of_item_key(item_key, "ATTR_BASE", key)
end

---物品类型是否存在标签
---@param tag string 标签
---@param item_key py.ItemKey 物品类型
---@return boolean is_has_tag 是否有标签
function M.has_tag_by_key(tag, item_key)
    return GameAPI.item_key_has_tag(item_key, tag)
end

return M
