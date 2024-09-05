# Item

物品

## add_attribute

```lua
(method) Item:add_attribute(key: string, value: number)
```

增加基础属性

@*param* `key` — 属性key

@*param* `value` — 属性值
## add_bonus_attribute

```lua
(method) Item:add_bonus_attribute(key: string, value: number)
```

增加增益属性

@*param* `key` — 属性key

@*param* `value` — 属性值
## add_charge

```lua
(method) Item:add_charge(charge: integer)
```

增加充能数

@*param* `charge` — 充能数
## add_passive_ability

```lua
(method) Item:add_passive_ability(ability_id: py.AbilityKey, level: integer)
```

给物品添加被动技能

@*param* `ability_id` — 技能id

@*param* `level` — 等级
## add_stack

```lua
(method) Item:add_stack(stack: integer)
```

增加堆叠数

@*param* `stack` — 堆叠数
## add_tag

```lua
(method) Item:add_tag(tag: string)
```

添加标签

@*param* `tag` — 标签
## attr_pick

```lua
(method) Item:attr_pick()
  -> keys: string[]
```

遍历物品的单位属性

@*return* `keys` — 属性key
## attr_pick_by_key

```lua
function Item.attr_pick_by_key(item_key: py.ItemKey)
  -> keys: string[]
```

遍历物品类型的单位属性

@*param* `item_key` — 物品类型

@*return* `keys` — 属性key
## check_precondition_by_key

```lua
function Item.check_precondition_by_key(player: Player, item_key: py.ItemKey)
  -> boolean
```

检查物品类型前置条件

@*param* `player` — 玩家

@*param* `item_key` — 物品类型ID
## create_item

```lua
function Item.create_item(point: Point, item_key: py.ItemKey, player?: Player)
  -> Item
```

创建物品到点

@*param* `point` — 点

@*param* `item_key` — 道具类型

@*param* `player` — 玩家
## custom_event_manager

```lua
EventManager?
```

## drop

```lua
(method) Item:drop(point: Point, count: integer)
```

丢弃物品到点

@*param* `point` — 目标点

@*param* `count` — 丢弃数量
## event

```lua
fun(self: Item, event: "物品-获得", callback: fun(trg: Trigger, data: EventParam.物品-获得)):Trigger
```

## event_dispatch

```lua
(method) CustomEvent:event_dispatch(event_name: string, ...any)
  -> any
  2. any
  3. any
  4. any
```

发起自定义事件（回执模式），与通知模式不同，允许插入结算。
可以接受到事件的返回值，有多处注册事件时会按照注册顺序调用，
当任何事件回调返回了非 `nil` 的值后，后续触发器将不再调用。

```lua
Obj:event_on('获取', function (trigger,...)
    print('获取1')
    return 1
end)
Obj:event_on('获取', function (trigger,...)
    print('获取2')
    return 2
end)

local result = Obj:event_dispatch('获取')

print('结果为：', result)
```

以上代码会打印：

```
获取1
结果为：    1
```

## event_dispatch_with_args

```lua
(method) CustomEvent:event_dispatch_with_args(event_name: string, args: any, ...any)
  -> any
  2. any
  3. any
  4. any
```

 发起带事件参数的自定义事件（回执模式）
## event_notify

```lua
(method) CustomEvent:event_notify(event_name: string, ...any)
```

发起自定义事件（通知模式），同一个对象身上只会有一个正在执行的事件，
当发生插入结算时，后面的事件会进入队列

```lua
Obj:event_on('获得', function ()
    print('触发获得')
    print('发起移除前')
    Obj:event_notify('移除') -- 实际业务中，可能你获得的buff把你自己杀死了，而死亡会清除buff
    print('发起移除后')
end)

Obj:event_on('移除', function ()
    print('触发移除')
end)

Obj:event_notify('获得')
```

这段代码会打印：

```
触发获得
发起移除前
发起移除后
触发移除
```

## event_notify_with_args

```lua
(method) CustomEvent:event_notify_with_args(event_name: string, args: any[], ...any)
```

 发起带事件参数的自定义事件（通知模式）
## event_on

```lua
(method) CustomEvent:event_on(...any)
  -> Trigger
```

注册自定义事件，当触发时，会执行回调函数。

```lua
Obj:event_on('输入', function (trigger, ...)
    print('触发了输入事件', ...)
end)

Obj:event_notify('输入', '123', '456')
```

以上会打印：

```
触发了输入事件 123 456
```

---

注册时可以指定事件的参数：

```lua
Obj:event_on('输入', {'123'}, function (trigger, ...)
    print('触发了输入事件', ...)
end)

Obj:event_notify('输入', 1) -- 不能触发事件
Obj:event_notify_with_args('输入', {'123'}, 2) -- 可以触发事件
Obj:event_notify_with_args('输入', {'456'}, 3) -- 不能触发事件
Obj:event_notify_with_args('输入', {'123', '666'}, 4) -- 可以触发事件
```

## get_ability

```lua
(method) Item:get_ability()
  -> ability: Ability?
```

获取物品的主动技能

@*return* `ability` — 主动技能
## get_attribute

```lua
(method) Item:get_attribute(key: string)
  -> number
```

获取物品的基础属性

@*param* `key` — 属性key
## get_attribute_by_key

```lua
function Item.get_attribute_by_key(item_key: py.ItemKey, key: string)
  -> number
```

获取物品类型的基础属性

@*param* `key` — 属性key

@*param* `item_key` — 物品类型
## get_bonus_attribute

```lua
(method) Item:get_bonus_attribute(key: string)
  -> number
```

获取物品的增益属性

@*param* `key` — 属性key
## get_by_handle

```lua
function Item.get_by_handle(py_item: py.Item)
  -> Item?
```

通过py层的技能实例获取lua层的道具实例

@*param* `py_item` — py层的道具实例

@*return* — 返回在lua层初始化后的lua层道具实例
## get_by_id

```lua
function Item.get_by_id(id: py.ItemID)
  -> Item
```

 通过id获取lua层的道具实例

@*return* — 返回在lua层初始化后的lua层道具实例
## get_charge

```lua
(method) Item:get_charge()
  -> charges: integer
```

物品充能数

@*return* `charges` — 充能数
## get_custom_event_manager

```lua
(method) CustomEvent:get_custom_event_manager()
  -> EventManager?
```

## get_description

```lua
(method) Item:get_description()
  -> description: string
```

获取物品描述

@*return* `description` — 物品描述
## get_description_by_key

```lua
function Item.get_description_by_key(item_key: py.ItemKey)
  -> string
```

获取物品类型的描述

@*param* `item_key` — 物品类型
## get_facing

```lua
(method) Item:get_facing()
  -> angel: number
```

获取物品的朝向

@*return* `angel` — 朝向
## get_hp

```lua
(method) Item:get_hp()
  -> hp: number
```

获取物品的生命值

@*return* `hp` — 物品的生命值
## get_icon

```lua
(method) Item:get_icon()
  -> py.Texture
```

获取物品的图标
## get_icon_id_by_key

```lua
function Item.get_icon_id_by_key(item_key: py.ItemKey)
  -> py.Texture
```

获取物品类型的icon的图片id

@*param* `item_key` — 物品类型
## get_id

```lua
(method) Item:get_id()
  -> integer
```

 获取唯一ID
## get_item_buy_price_by_key

```lua
function Item.get_item_buy_price_by_key(item_key: py.ItemKey, key: string|y3.Const.PlayerAttr)
  -> price: number
```

获取物品购买售价

@*param* `item_key` — 类型

@*param* `key` — 玩家属性

@*return* `price` — 价格
## get_item_group_in_area

```lua
function Item.get_item_group_in_area(area: Area)
  -> ItemGroup
```

获得区域内所有物品

@*param* `area` — 区域
## get_item_sell_price_by_key

```lua
function Item.get_item_sell_price_by_key(item_key: py.ItemKey, key: string|y3.Const.PlayerAttr)
  -> price: number
```

获取物品出售售价

@*param* `item_key` — 类型

@*param* `key` — 玩家属性

@*return* `price` — 价格
## get_key

```lua
(method) Item:get_key()
  -> key: py.ItemKey
```

获取物品类型id

@*return* `key` — 类型
## get_level

```lua
(method) Item:get_level()
  -> level: integer
```

获取物品等级

@*return* `level` — 物品等级
## get_max_charge

```lua
(method) Item:get_max_charge()
  -> max_charge: integer
```

获取最大充能数

@*return* `max_charge` — 最大充能数
## get_model

```lua
(method) Item:get_model()
  -> model_key: py.ModelKey
```

获取物品模型

@*return* `model_key` — 模型类型
## get_model_by_key

```lua
function Item.get_model_by_key(item_key: py.ItemKey)
  -> model_key: py.ModelKey
```

获取物品类型的模型

@*param* `item_key` — 物品类型

@*return* `model_key` — 模型类型
## get_name

```lua
(method) Item:get_name()
  -> name: string
```

获取物品名

@*return* `name` — 物品名字
## get_name_by_key

```lua
function Item.get_name_by_key(item_key: py.ItemKey)
  -> string
```

获取物品类型名

@*param* `item_key` — 物品类型
## get_num_of_item_mat

```lua
function Item.get_num_of_item_mat(item_key: py.ItemKey, comp_item_key: py.ItemKey)
  -> integer
```

物品类型合成所需的物品类型数量
## get_num_of_player_attr

```lua
function Item.get_num_of_player_attr(item_key: py.ItemKey, role_res_key: py.RoleResKey)
  -> number
```

物品类型合成所需的玩家属性数量
## get_owner

```lua
(method) Item:get_owner()
  -> owner: Unit?
```

物品持有者

@*return* `owner` — 持有者
## get_owner_player

```lua
(method) Item:get_owner_player()
  -> player: Player?
```

获取物品的拥有玩家

@*return* `player` — 玩家
## get_passive_ability

```lua
(method) Item:get_passive_ability(index: integer)
  -> ability: Ability?
```

获取物品的被动技能

@*return* `ability` — 被动技能
## get_point

```lua
(method) Item:get_point()
  -> position: Point
```

物品所在点

@*return* `position` — 物品所在点
## get_scale

```lua
(method) Item:get_scale()
  -> scale: number
```

获取物品缩放

@*return* `scale` — 物品缩放
## get_slot

```lua
(method) Item:get_slot()
  -> index: integer
```

获取物品在单位身上的格子位置

@*return* `index` — 格子位置
## get_slot_type

```lua
(method) Item:get_slot_type()
  -> 背包槽类型: py.SlotType
```

获取物品在单位身上的背包槽类型
## get_stack

```lua
(method) Item:get_stack()
  -> stacks: integer
```

物品堆叠数

@*return* `stacks` — 堆叠数
## get_tags_by_key

```lua
function Item.get_tags_by_key(item_key: py.ItemKey)
  -> string[]
```

获取物品的所有标签
## handle

```lua
py.Item
```

物品对象
## has_tag

```lua
(method) Item:has_tag(tag: string)
  -> is_has_tag: boolean
```

存在标签

@*param* `tag` — 删除标签

@*return* `is_has_tag` — 是否有标签
## has_tag_by_key

```lua
function Item.has_tag_by_key(tag: string, item_key: py.ItemKey)
  -> is_has_tag: boolean
```

物品类型是否存在标签

@*param* `tag` — 标签

@*param* `item_key` — 物品类型

@*return* `is_has_tag` — 是否有标签
## id

```lua
py.ItemID
```

物品ID
## is_destroyed

```lua
(method) Item:is_destroyed()
  -> boolean|unknown
```

## is_exist

```lua
(method) Item:is_exist()
  -> is_exist: boolean
```

是否存在

@*return* `is_exist` — 是否存在
## is_in_bag

```lua
(method) Item:is_in_bag()
  -> is_in_bag: boolean
```

物品在背包栏

@*return* `is_in_bag` — 是否在背包栏
## is_in_bar

```lua
(method) Item:is_in_bar()
  -> is_in_bar: boolean
```

物品在物品栏

@*return* `is_in_bar` — 是否在物品栏
## is_in_scene

```lua
(method) Item:is_in_scene()
  -> is_in_scene: boolean
```

是否在场景中

@*return* `is_in_scene` — 是否在场景中
## key

```lua
integer?
```

## kv_has

```lua
(method) KV:kv_has(key: string)
  -> boolean
```

 是否拥有指定键值对。可以与ECA互通。
## kv_key

```lua
string?
```

## kv_load

```lua
(method) KV:kv_load(key: string, lua_type: 'boolean'|'integer'|'number'|'string'|'table'...(+1))
  -> any
```

```lua
lua_type:
    | 'boolean'
    | 'number'
    | 'integer'
    | 'string'
    | 'table'
```
## kv_remove

```lua
(method) KV:kv_remove(key: any)
```

## kv_save

```lua
(method) KV:kv_save(key: string, value: KV.SupportType)
```

 保存自定义键值对。可以与ECA互通。
## object_event_manager

```lua
EventManager?
```

## phandle

```lua
py.Item
```

物品对象
## ref_manager

```lua
unknown
```

## remove

```lua
(method) Item:remove()
```

删除物品
## remove_tag

```lua
(method) Item:remove_tag(tag: string)
```

@*param* `tag` — 标签
## set_attr

```lua
(method) Item:set_attr(attr_name: string, value: number, attr_type: string)
```

设置属性

@*param* `attr_name` — 属性名

@*param* `value` — 属性值

@*param* `attr_type` — 属性类型
## set_attribute

```lua
(method) Item:set_attribute(key: string, value: number)
```

设置基础属性

@*param* `key` — 属性key

@*param* `value` — 属性值
## set_bonus_attribute

```lua
(method) Item:set_bonus_attribute(key: string, value: number)
```

设置增益属性

@*param* `key` — 属性key

@*param* `value` — 属性值
## set_charge

```lua
(method) Item:set_charge(charge: integer)
```

设置充能数

@*param* `charge` — 充能数
## set_description

```lua
(method) Item:set_description(description: string)
```

设置物品的描述

@*param* `description` — 描述
## set_droppable

```lua
(method) Item:set_droppable(dropable: boolean)
```

设置丢弃状态

@*param* `dropable` — 状态
## set_facing

```lua
(method) Item:set_facing(facing: number)
```

设置物品朝向

@*param* `facing` — 朝向
## set_hp

```lua
(method) Item:set_hp(value: number)
```

设置生命值

@*param* `value` — 生命值
## set_icon

```lua
(method) Item:set_icon(picture_id: py.Texture)
```

设置物品的图标

@*param* `picture_id` — 图片id
## set_level

```lua
(method) Item:set_level(level: integer)
```

设置等级

@*param* `level` — 等级
## set_max_charge

```lua
(method) Item:set_max_charge(charge: integer)
```

设置最大充能数

@*param* `charge` — 最大充能数
## set_name

```lua
(method) Item:set_name(name: string)
```

设置物品的名称

@*param* `name` — 名字
## set_owner_player

```lua
(method) Item:set_owner_player(player: Player)
```

设置所属玩家

@*param* `player` — 所属玩家
## set_point

```lua
(method) Item:set_point(point: Point)
```

移动到点 

@*param* `point` — 点
## set_sale_state

```lua
(method) Item:set_sale_state(state: boolean)
```

设置物品可否出售

@*param* `state` — 是否可出售
## set_scale

```lua
(method) Item:set_scale(scale: number)
```

设置物品缩放

@*param* `scale` — 缩放
## set_shop_price

```lua
function Item.set_shop_price(id: py.ItemKey, player_attr_name: py.RoleResKey, price: number)
```

设置物品商品售价

@*param* `id` — 物品id

@*param* `player_attr_name` — 玩家属性

@*param* `price` — 价格
## set_stack

```lua
(method) Item:set_stack(stack: integer)
```

设置堆叠数

@*param* `stack` — 堆叠数
## set_visible

```lua
(method) Item:set_visible(is_visible: boolean)
```

设置物品可见性

@*param* `is_visible` — 是否可见
## storage_all

```lua
(method) Storage:storage_all()
  -> table
```

 获取存储数据的容器
## storage_get

```lua
(method) Storage:storage_get(key: any)
  -> any
```

 获取存储的值
## storage_set

```lua
(method) Storage:storage_set(key: any, value: any)
```

 存储任意值
## storage_table

```lua
table
```

## subscribe_event

```lua
(method) ObjectEvent:subscribe_event(event_name: string, ...any)
  -> any[]?
  2. Trigger.CallBack
  3. Unsubscribe: function
```

## type

```lua
string
```


# Item.DrapOperation

```lua
"无" | "左键" | "右键"
```


# Item.UseOperation

```lua
"无" | "左键单击" | "右键单击" | "左键双击"
```


