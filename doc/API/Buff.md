# Buff

魔法效果

## add_aura_range

```lua
(method) Buff:add_aura_range(range: number)
```

增加魔法效果光环影响范围

@*param* `range` — 影响范围
## add_cycle_time

```lua
(method) Buff:add_cycle_time(time: number)
```

增加魔法效果循环周期

@*param* `time` — 变化时间
## add_shield

```lua
(method) Buff:add_shield(value: number)
```

增加护盾值

@*param* `value` — 护盾值
## add_stack

```lua
(method) Buff:add_stack(stack: integer)
```

增加堆叠层数

@*param* `stack` — 层数
## add_time

```lua
(method) Buff:add_time(time: number)
```

增加剩余持续时间

@*param* `time` — 剩余持续时间
## custom_event_manager

```lua
EventManager?
```

## event

```lua
fun(self: Buff, event: "效果-获得", callback: fun(trg: Trigger, data: EventParam.效果-获得)):Trigger
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
(method) Buff:get_ability()
  -> ability: Ability|nil
```

获得关联技能

@*return* `ability` — 投射物或魔法效果的关联技能
## get_aura

```lua
(method) Buff:get_aura()
  -> aura: Buff?
```

获取所属光环

@*return* `aura` — 所属光环
## get_buff_aura_effect_key

```lua
(method) Buff:get_buff_aura_effect_key()
  -> type: py.ModifierKey
```

获取魔法效果的光环效果类型ID

@*return* `type` — 光环效果类型ID
## get_buff_aura_range

```lua
(method) Buff:get_buff_aura_range()
  -> range: number
```

获取魔法效果的光环范围

@*return* `range` — 光环范围
## get_buff_effect_type

```lua
(method) Buff:get_buff_effect_type()
  -> type: y3.Const.EffectType
```

获取魔法效果影响类型

@*return* `type` — 魔法效果影响类型
## get_buff_type

```lua
(method) Buff:get_buff_type()
  -> type: y3.Const.ModifierType
```

获取魔法效果类型

@*return* `type` — 魔法效果类型
## get_by_handle

```lua
function Buff.get_by_handle(py_buff: py.ModifierEntity)
  -> Buff?
```

通过py层的魔法效果实例获取lua层的魔法效果实例

@*param* `py_buff` — py层的魔法效果实例

@*return* — 返回在lua层初始化后的lua层魔法效果实例
## get_by_id

```lua
function Buff.get_by_id(id: integer)
  -> Buff
```

## get_custom_event_manager

```lua
(method) CustomEvent:get_custom_event_manager()
  -> EventManager?
```

## get_cycle_time

```lua
(method) Buff:get_cycle_time()
  -> time: number
```

获取魔法效果循环周期

@*return* `time` — 循环周期
## get_description

```lua
(method) Buff:get_description()
  -> description: string
```

获取魔法效果对象的描述

@*return* `description` — 描述
## get_description_by_key

```lua
function Buff.get_description_by_key(buff_key: py.ModifierKey)
  -> description: string
```

获取魔法效果类型的描述

@*param* `buff_key` — 类型

@*return* `description` — 描述
## get_icon_by_key

```lua
function Buff.get_icon_by_key(buff_key: py.ModifierKey)
  -> py.Texture
```

获取魔法效果类型的icon图标的图片

@*param* `buff_key` — 类型

@*return* — 图片id
## get_key

```lua
(method) Buff:get_key()
  -> buff_key: py.ModifierKey
```

获得魔法效果的类别

@*return* `buff_key` — 类别
## get_level

```lua
(method) Buff:get_level()
  -> level: integer
```

获取等级

@*return* `level` — 等级
## get_max_stack

```lua
(method) Buff:get_max_stack()
  -> stack: integer
```

获取魔法效果的最大堆叠层数

@*return* `stack` — 层数
## get_name

```lua
(method) Buff:get_name()
  -> name: string
```

获取魔法效果对象的名称

@*return* `name` — 名字
## get_owner

```lua
(method) Buff:get_owner()
  -> owner: Unit?
```

获取魔法效果的携带者

@*return* `owner` — 携带者
## get_passed_time

```lua
(method) Buff:get_passed_time()
  -> duration: number
```

魔法效果的已持续时间

@*return* `duration` — 持续时间
## get_shield

```lua
(method) Buff:get_shield()
  -> shield: number
```

获取魔法效果的护盾

@*return* `shield` — 护盾值
## get_source

```lua
(method) Buff:get_source()
  -> provider: Unit?
```

获取魔法效果的施加者

@*return* `provider` — 施加者
## get_stack

```lua
(method) Buff:get_stack()
  -> stack: integer
```

获取魔法效果的堆叠层数

@*return* `stack` — 层数
## get_time

```lua
(method) Buff:get_time()
  -> time: number
```

获取魔法效果的剩余持续时间

@*return* `time` — 剩余持续时间
## handle

```lua
py.ModifierEntity
```

py层的魔法效果对象
## has_tag

```lua
(method) Buff:has_tag(tag: string)
  -> boolean
```

是否具有标签

@*param* `tag` — 标签
## id

```lua
integer
```

## is_destroyed

```lua
(method) Buff:is_destroyed()
  -> boolean|unknown
```

## is_exist

```lua
(method) Buff:is_exist()
  -> is_exist: boolean
```

是否存在

@*return* `is_exist` — 是否存在
## is_icon_visible

```lua
(method) Buff:is_icon_visible()
  -> is_visible: boolean
```

魔法效果的图标是否可见

@*return* `is_visible` — 是否可见
## is_icon_visible_by_key

```lua
function Buff.is_icon_visible_by_key(buff_key: py.ModifierKey)
  -> is_visible: boolean
```

魔法效果类型的图标是否可见

@*param* `buff_key` — 类型

@*return* `is_visible` — 是否可见
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
py.ModifierEntity
```

代理的对象，用这个调用引擎的方法会快得多
## ref_manager

```lua
unknown
```

所有魔法效果实例
## remove

```lua
(method) Buff:remove()
```

移除
## set_aura_range

```lua
(method) Buff:set_aura_range(range: number)
```

设置魔法效果光环影响范围

@*param* `range` — 影响范围
## set_cycle_time

```lua
(method) Buff:set_cycle_time(time: number)
```

设置魔法效果循环周期

@*param* `time` — 循环周期
## set_description

```lua
(method) Buff:set_description(description: string)
```

设置魔法效果对象的描述

@*param* `description` — 描述
## set_name

```lua
(method) Buff:set_name(name: string)
```

设置魔法效果的名称

@*param* `name` — 名字
## set_shield

```lua
(method) Buff:set_shield(value: number)
```

设置护盾值

@*param* `value` — 护盾值
## set_stack

```lua
(method) Buff:set_stack(stack: integer)
```

设置堆叠层数

@*param* `stack` — 层数
## set_time

```lua
(method) Buff:set_time(time: number)
```

设置剩余持续时间

@*param* `time` — 剩余持续时间
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


# Buff.AddData

## ability

```lua
Ability
```

关联技能
## data

```lua
table
```

自定义数据
## key

```lua
py.ModifierKey
```

魔法效果id
## pulse

```lua
number
```

心跳周期
## source

```lua
Unit
```

来源单位
## stacks

```lua
integer
```

层数
## time

```lua
number
```

持续时间

