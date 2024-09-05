# Destructible

可破坏物

## add_height

```lua
(method) Destructible:add_height(height: number)
```

增加高度

@*param* `height` — 高度
## add_hp

```lua
(method) Destructible:add_hp(value: number)
```

@*param* `value` — 生命值

增加当前生命值
## add_max_hp

```lua
(method) Destructible:add_max_hp(value: number)
```

@*param* `value` — 生命值

增加最大生命值
## add_max_resource

```lua
(method) Destructible:add_max_resource(value: number)
```

@*param* `value` — 资源数

增加最大资源数
## add_resource

```lua
(method) Destructible:add_resource(value: number)
```

@*param* `value` — 资源数

增加当前资源数
## add_tag

```lua
(method) Destructible:add_tag(tag: string)
```

增加标签

@*param* `tag` — 标签
## can_be_ability_target

```lua
(method) Destructible:can_be_ability_target()
  -> is_lockable: boolean
```

可破坏物能否被技能指示器选中

@*return* `is_lockable` — 能否被选中
## can_be_attacked

```lua
(method) Destructible:can_be_attacked()
  -> is_attackable: boolean
```

可破坏物能否被攻击

@*return* `is_attackable` — 能否被攻击
## can_be_collected

```lua
(method) Destructible:can_be_collected()
  -> is_collectable: boolean
```

可破坏物能否被采集

@*return* `is_collectable` — 能否被采集
## can_be_selected

```lua
(method) Destructible:can_be_selected()
  -> is_selectable: boolean
```

可破坏物能否被选中

@*return* `is_selectable` — 能否被选中
## cancel_replace_model

```lua
(method) Destructible:cancel_replace_model(model_id: py.ModelKey)
```

取消替换模型

@*param* `model_id` — 模型id
## create_destructible

```lua
function Destructible.create_destructible(type_id: py.DestructibleKey, point: Point, angle: number, scale_x?: number, scale_y?: number, scale_z?: number, height?: number)
  -> destructible: Destructible
```

创建可破坏物

@*param* `type_id` — 可破坏物类型id

@*param* `point` — 创建到点

@*param* `angle` — 面向角度

@*param* `scale_x` — 缩放x

@*param* `scale_y` — 缩放y

@*param* `scale_z` — 缩放z

@*param* `height` — 高度

@*return* `destructible` — 可破坏物
## event

```lua
fun(self: Destructible, event: "可破坏物-创建", callback: fun(trg: Trigger, data: EventParam.可破坏物-创建)):Trigger
```

## get_by_handle

```lua
function Destructible.get_by_handle(py_destructible: py.Destructible)
  -> Destructible?
```

通过py层的可破坏物实例获取lua层的可破坏物对象
## get_by_id

```lua
function Destructible.get_by_id(id: py.DestructibleID)
  -> Destructible?
```

 通过可破坏物的唯一ID获取lua的可破坏物对象
## get_description

```lua
(method) Destructible:get_description()
  -> description: string
```

获取可破坏物描述

@*return* `description` — 描述
## get_description_by_key

```lua
function Destructible.get_description_by_key(key: py.DestructibleKey)
  -> description: string
```

获取可破坏物类型的描述

@*param* `key` — 类型id

@*return* `description` — 描述
## get_facing

```lua
(method) Destructible:get_facing()
  -> rotation: number
```

获取可破坏物的面向角度

@*return* `rotation` — 面向角度
## get_height

```lua
(method) Destructible:get_height()
  -> height: number
```

获取可破坏物的高度

@*return* `height` — 高度
## get_hp

```lua
(method) Destructible:get_hp()
  -> cur_hp: number
```

获取可破坏物的生命值

@*return* `cur_hp` — 生命值
## get_id

```lua
(method) Destructible:get_id()
  -> integer
```

 获取唯一ID
## get_item_type

```lua
(method) Destructible:get_item_type()
  -> item_key: py.ItemKey
```

获取可破坏物的物品类型ID

@*return* `item_key` — 物品类型ID
## get_key

```lua
(method) Destructible:get_key()
  -> type: py.DestructibleKey
```

获取可破坏物类型

@*return* `type` — 可破坏物类型
## get_max_hp

```lua
(method) Destructible:get_max_hp()
  -> hp: number
```

获取可破坏物的生命值

@*return* `hp` — 可破坏物的生命值
## get_max_resource

```lua
(method) Destructible:get_max_resource()
  -> max_number: number
```

获取可破坏物的最大资源数

@*return* `max_number` — 最大资源数
## get_model

```lua
(method) Destructible:get_model()
  -> model_key: py.ModelKey
```

获取可破坏物的模型

@*return* `model_key` — 模型id
## get_model_by_type

```lua
function Destructible.get_model_by_type(key: py.DestructibleKey)
  -> model: py.ModelKey
```

获取可破坏物类型的模型

@*param* `key` — 类型id

@*return* `model` — 模型id
## get_name

```lua
(method) Destructible:get_name()
  -> name: string
```

获取可破坏物的名称

@*return* `name` — 可破坏物的名称
## get_name_by_key

```lua
function Destructible.get_name_by_key(key: py.DestructibleKey)
  -> name: string
```

获取可破坏物类型的名称

@*param* `key` — 类型id

@*return* `name` — 名称
## get_position

```lua
(method) Destructible:get_position()
  -> point: Point
```

获取可破坏物对象的位置

@*return* `point` — 可破坏物的位置
## get_resource

```lua
(method) Destructible:get_resource()
  -> source_number: number
```

获取可破坏物的当前资源数

@*return* `source_number` — 当前资源数
## get_resource_name

```lua
(method) Destructible:get_resource_name()
  -> source_name: string
```

获取可破坏物的资源名称

@*return* `source_name` — 资源名称
## get_resource_type

```lua
(method) Destructible:get_resource_type()
  -> player_res_key: py.RoleResKey
```

获取可破坏物的玩家属性名

@*return* `player_res_key` — 玩家属性
## handle

```lua
py.Destructible
```

可破坏物对象
## id

```lua
integer
```

## is_alive

```lua
(method) Destructible:is_alive()
  -> is_alive: boolean
```

可破坏物是否存活

@*return* `is_alive` — 是否存活
## is_destroyed

```lua
(method) Destructible:is_destroyed()
  -> boolean|unknown
```

## is_exist

```lua
(method) Destructible:is_exist()
  -> is_exist: boolean
```

是否存在

@*return* `is_exist` — 是否存在
## is_visible

```lua
(method) Destructible:is_visible()
  -> is_visible: boolean
```

可破坏物是否可见

@*return* `is_visible` — 是否可见
## key

```lua
integer?
```

## kill

```lua
(method) Destructible:kill(killer_unit: Unit)
```

@*param* `killer_unit` — 凶手

杀死可破坏物
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
py.Destructible
```

可破坏物对象
## pick

```lua
function Destructible.pick(area: Area)
  -> Destructible[]
```

遍历区域中的所有可破坏物

@*param* `area` — 区域对象
## pick_in_shape

```lua
function Destructible.pick_in_shape(point: Point, shape: Shape)
  -> destructible_list: table
```

@*param* `point` — 点

@*param* `shape` — 区域

@*return* `destructible_list` — 可破坏物列表

获取不同形状范围内的可破坏物列表
## play_animation

```lua
(method) Destructible:play_animation(anim_name: string, start_time?: number, end_time?: number, is_loop?: boolean, speed?: number)
```

播放动画

@*param* `anim_name` — 动画名字

@*param* `start_time` — 开始时间

@*param* `end_time` — 结束时间(默认-1表示播放到最后)

@*param* `is_loop` — 是否循环

@*param* `speed` — 速度
## reborn

```lua
(method) Destructible:reborn()
```

复活可破坏物
## ref_manager

```lua
unknown
```

## remove

```lua
(method) Destructible:remove()
```

删除可破坏物
## remove_tag

```lua
(method) Destructible:remove_tag(tag: string)
```

移除标签

@*param* `tag` — 标签
## replace_model

```lua
(method) Destructible:replace_model(model_id: py.ModelKey)
```

替换模型

@*param* `model_id` — 模型id
## set_can_be_ability_target

```lua
(method) Destructible:set_can_be_ability_target(can_be_ability_target: boolean)
```

设置能否被技能指示器锁定

@*param* `can_be_ability_target` — 能否被技能指示器锁定
## set_can_be_attacked

```lua
(method) Destructible:set_can_be_attacked(is_attackable: boolean)
```

设置能否被攻击

@*param* `is_attackable` — 能否被攻击
## set_can_be_collected

```lua
(method) Destructible:set_can_be_collected(is_collectable: boolean)
```

设置能否被采集

@*param* `is_collectable` — 能否被采集
## set_can_be_selected

```lua
(method) Destructible:set_can_be_selected(is_selectable: boolean)
```

设置能否被选中

@*param* `is_selectable` — 能否被选中
## set_description

```lua
(method) Destructible:set_description(description: string)
```

@*param* `description` — 描述

设置描述
## set_facing

```lua
(method) Destructible:set_facing(angle: number)
```

设置朝向

@*param* `angle` — 朝向角度
## set_height

```lua
(method) Destructible:set_height(height: number)
```

设置高度

@*param* `height` — 高度
## set_hp

```lua
(method) Destructible:set_hp(value: number)
```

设置生命值

@*param* `value` — 生命值
## set_max_hp

```lua
(method) Destructible:set_max_hp(value: number)
```

@*param* `value` — 生命值

设置最大生命值
## set_max_resource

```lua
(method) Destructible:set_max_resource(value: number)
```

@*param* `value` — 资源数

设置最大资源数
## set_name

```lua
(method) Destructible:set_name(name: string)
```

@*param* `name` — 名字

设置名称
## set_point

```lua
(method) Destructible:set_point(point: Point)
```

移动到点

@*param* `point` — 目标点
## set_resource

```lua
(method) Destructible:set_resource(value: number)
```

@*param* `value` — 资源数

设置当前资源数
## set_scale

```lua
(method) Destructible:set_scale(x: number, y: number, z: number)
```

设置缩放

@*param* `x` — x轴缩放

@*param* `y` — y轴缩放

@*param* `z` — z轴缩放
## set_visible

```lua
(method) Destructible:set_visible(is_visible: boolean)
```

显示/隐藏

@*param* `is_visible` — 是否显示
## stop_animation

```lua
(method) Destructible:stop_animation(anim_name: string)
```

停止动画

@*param* `anim_name` — 动画名字
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


