# Player

玩家

## add

```lua
(method) Player:add(key: string|y3.Const.PlayerAttr, value: number)
```

增加属性值

@*param* `key` — 属性名

@*param* `value` — 值
## add_global_save_data

```lua
(method) Player:add_global_save_data(key: string, value: integer)
```

增加全局存档

@*param* `key` — 键

@*param* `value` — 值
## add_tech_level

```lua
(method) Player:add_tech_level(tech_type: py.TechKey, level: integer)
```

增加科技等级

@*param* `tech_type` — 科技等级

@*param* `level` — 等级
## create_unit

```lua
(method) Player:create_unit(unit_id: py.UnitKey, point?: Point, facing?: number)
  -> Unit
```

创建单位

@*param* `unit_id` — 单位类型

@*param* `point` — 单位

@*param* `facing` — 朝向
## custom_event_manager

```lua
EventManager?
```

## display_info

```lua
(method) Player:display_info(msg: string, localize?: boolean)
```

向玩家发送提示

@*param* `msg` — 消息

@*param* `localize` — 是否支持语言环境
## display_message

```lua
(method) Player:display_message(message: string, localize?: boolean)
```

 对玩家显示文本消息

@*param* `message` — 消息

@*param* `localize` — 是否支持语言环境
## enable_vignetting

```lua
function Player.enable_vignetting(player: Player, is_enable: boolean)
```

@*param* `player` — 玩家

@*param* `is_enable` — 开关

设置暗角开关
## event

```lua
fun(self: Player, event: "玩家-加入游戏", callback: fun(trg: Trigger, data: EventParam.玩家-加入游戏)):Trigger
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

## exit_game

```lua
(method) Player:exit_game()
```

 退出游戏
## get_achieve_point

```lua
(method) Player:get_achieve_point()
  -> integer|true
```

获取玩家当前地图的成就点数
## get_all_units

```lua
(method) Player:get_all_units()
  -> unit_group: UnitGroup
```

属于某玩家的所有单位

@*return* `unit_group` — 单位组
## get_attr

```lua
(method) Player:get_attr(key: string|y3.Const.PlayerAttr)
  -> role_res: number
```

获取玩家属性

@*param* `key` — 属性名

@*return* `role_res` — 玩家属性
## get_by_handle

```lua
function Player.get_by_handle(py_player: py.Role)
  -> Player
```

## get_by_id

```lua
function Player.get_by_id(id: integer)
  -> player: Player
```

转换玩家ID为玩家

@*param* `id` — 玩家ID

@*return* `player` — 玩家
## get_by_string

```lua
function Player.get_by_string(str: string)
  -> Player?
```

根据字符串获取玩家，字符串是通过 `tostring(Player)`
或是使用ECA中的“任意变量转化为字符串”获得的。
## get_camp

```lua
(method) Player:get_camp()
  -> py.Camp
```

## get_color

```lua
(method) Player:get_color()
  -> HEX颜色: string
```

获取玩家颜色
## get_controller

```lua
(method) Player:get_controller()
  -> role_type: y3.Const.RoleType
```

获取玩家控制者类型

@*return* `role_type` — 玩家控制者类型
## get_custom_event_manager

```lua
(method) CustomEvent:get_custom_event_manager()
  -> EventManager?
```

## get_exp_rate

```lua
(method) Player:get_exp_rate()
  -> exp_rate: number
```

获取经验获得率

@*return* `exp_rate` — 经验获得率
## get_id

```lua
(method) Player:get_id()
  -> role_id_num: integer
```

获取玩家ID

@*return* `role_id_num` — 玩家ID
## get_local

```lua
function Player.get_local()
  -> Player
```

 获取本地玩家，注意这可能会导致不同步！  
> 警告：如果你不确定这个函数在做什么，请不要使用它！

> 已废弃：请改用 `y3.player.with_local`
## get_map_level

```lua
(method) Player:get_map_level()
  -> integer
```

获取玩家的此地图平台等级
## get_map_level_rank

```lua
(method) Player:get_map_level_rank()
  -> integer
```

获取玩家在本地图的平台等级排名
## get_mouse_pos

```lua
(method) Player:get_mouse_pos()
  -> point: Point
```

 获取鼠标在游戏内的所在点。
 必须先设置 `y3.config.sync.mouse = true`。

@*return* `point` — 点
## get_mouse_pos_x

```lua
(method) Player:get_mouse_pos_x()
  -> pos_x: number
```

获取鼠标在屏幕上的X坐标

@*return* `pos_x` — X坐标
## get_mouse_pos_y

```lua
(method) Player:get_mouse_pos_y()
  -> pos_y: number
```

获取鼠标在屏幕上的y坐标

@*return* `pos_y` — Y坐标
## get_mouse_ui_x_percent

```lua
(method) Player:get_mouse_ui_x_percent()
  -> x_per: number
```

获取玩家鼠标屏幕坐标X的占比。
 必须先设置 `y3.config.sync.mouse = true`。

@*return* `x_per` — X的占比
## get_mouse_ui_y_percent

```lua
(method) Player:get_mouse_ui_y_percent()
  -> y_per: number
```

获取玩家鼠标屏幕坐标y的占比。
 必须先设置 `y3.config.sync.mouse = true`。

@*return* `y_per` — Y的占比
## get_name

```lua
(method) Player:get_name()
  -> role_name: string
```

获取玩家名字

@*return* `role_name` — 玩家名字
## get_operation_key

```lua
(method) Player:get_operation_key(key: py.NormalKey, assist_key: py.RecordKey)
  -> shortcut: py.EditableGameFunc
```

获取玩家响应键盘按键的基础操作（过滤掉禁止设置的）

@*param* `key` — 键名

@*param* `assist_key` — 键盘按键

@*return* `shortcut` — 基础操作
## get_platform_icon

```lua
(method) Player:get_platform_icon()
  -> icon: string
```

获取玩家平台头像

@*return* `icon` — 平台头像
## get_platform_icon_url

```lua
(method) Player:get_platform_icon_url()
  -> icon_url: string
```

获取玩家平台头像下载地址

@*return* `icon_url` — 平台头像下载地址
## get_platform_id

```lua
(method) Player:get_platform_id()
  -> plat_aid: integer
```

获取玩家平台唯一ID

@*return* `plat_aid` — 平台唯一ID
## get_platform_level

```lua
(method) Player:get_platform_level()
  -> map_level: integer
```

获取玩家平台等级

@*return* `map_level` — 平台等级
## get_platform_model

```lua
(method) Player:get_platform_model()
  -> model: py.ModelKey
```

获取玩家平台外观模型

@*return* `model` — 模型id
## get_platform_name

```lua
(method) Player:get_platform_name()
  -> name: string
```

获取玩家唯一名称

@*return* `name` — 属性名称
## get_platform_uuid

```lua
(method) Player:get_platform_uuid()
  -> string
```

获取玩家加密UUID
## get_played_times

```lua
(method) Player:get_played_times()
  -> integer
```

获取玩家在本地图的累计局数
## get_rank_num

```lua
(method) Player:get_rank_num(key: integer)
  -> rank_num: integer
```

获取整数存档玩家排名

@*param* `key` — 存档key

@*return* `rank_num` — 整数存档玩家排名
## get_res_icon

```lua
function Player.get_res_icon(key: py.RoleResKey)
  -> icon: integer
```

获取玩家属性的货币图标

@*param* `key` — 属性名

@*return* `icon` — 图标id
## get_res_keys

```lua
function Player.get_res_keys(only_coin: boolean)
  -> py.RoleResKey[]
```

 获取所有玩家属性的属性名

@*param* `only_coin` — 只获取货币类型的玩家属性
## get_res_name

```lua
function Player.get_res_name(key: py.RoleResKey)
  -> name: string
```

获取玩家属性名称

@*param* `key` — 属性名

@*return* `name` — 属性名称
## get_save_data_bool_value

```lua
(method) Player:get_save_data_bool_value(index: integer)
  -> bool_value: boolean
```

布尔型玩家存档数据

@*param* `index` — 存档key

@*return* `bool_value` — 布尔型玩家存档数据
## get_save_data_float

```lua
(method) Player:get_save_data_float(key: integer)
  -> int_value: number
```

实数型存档数据

@*param* `key` — 存档key

@*return* `int_value` — 实数型存档数据
## get_save_data_int

```lua
(method) Player:get_save_data_int(key: integer)
  -> int_value: integer
```

获取整数型存档数据

@*param* `key` — 存档key

@*return* `int_value` — 整数型存档数据
## get_save_data_string

```lua
(method) Player:get_save_data_string(key: integer)
  -> str_value: string
```

字符串型玩家存档数据

@*param* `key` — 存档key

@*return* `str_value` — 字符串玩家存档数据
## get_save_data_table

```lua
(method) Player:get_save_data_table(key: integer)
  -> table_value: table?
```

表格型玩家存档数据

@*param* `key` — 存档key

@*return* `table_value` — 表格型玩家存档数据
## get_selecting_unit

```lua
(method) Player:get_selecting_unit()
  -> Unit?
```

## get_selecting_unit_group

```lua
(method) Player:get_selecting_unit_group()
  -> UnitGroup?
```

## get_state

```lua
(method) Player:get_state()
  -> role_status: y3.Const.RoleStatus
```

获取玩家游戏状态

@*return* `role_status` — 玩家游戏状态
See: [y3.Const.RoleStatus](file:///d%3A/y3-2/games/2.0/game/LocalData/Y3%E5%BA%93%E5%BC%80%E5%8F%913/maps/EntryMap/script/y3/game/const.lua#250#9)
## get_store_item_end_time

```lua
(method) Player:get_store_item_end_time(id: py.StoreKey)
  -> store_item_end_time: integer
```

玩家平台道具到期时间戳

@*param* `id` — 平台道具id

@*return* `store_item_end_time` — 平台道具到期时间戳
## get_store_item_number

```lua
(method) Player:get_store_item_number(id: py.StoreKey)
  -> store_item_cnt: integer
```

玩家平台道具数量

@*param* `id` — 平台道具id

@*return* `store_item_cnt` — 平台道具数量
## get_team_id

```lua
(method) Player:get_team_id()
  -> camp_id: integer
```

获取队伍ID

@*return* `camp_id` — 队伍ID
## get_tech_level

```lua
(method) Player:get_tech_level(tech_id: py.TechKey)
  -> tech_level: integer
```

获取科技等级

@*param* `tech_id` — 科技id

@*return* `tech_level` — 科技等级
## handle

```lua
py.Role
```

玩家
## id

```lua
integer
```

## is_achieve_unlock

```lua
(method) Player:is_achieve_unlock(id: string)
  -> boolean
```

判断指定成就是否解锁
## is_enemy

```lua
(method) Player:is_enemy(player: Player)
  -> is_enemy: boolean
```

玩家间是否是敌对关系

@*param* `player` — 玩家

@*return* `is_enemy` — 是否是敌对关系
## is_in_fog

```lua
(method) Player:is_in_fog(point: Point)
  -> is_point_in_fog: boolean
```

某个位置是否处于玩家的迷雾中

@*param* `point` — 点

@*return* `is_point_in_fog` — 点在迷雾中
## is_in_group

```lua
(method) Player:is_in_group(player_group: PlayerGroup)
  -> is_in_group: boolean
```

玩家在玩家组中

@*param* `player_group` — 玩家组

@*return* `is_in_group` — 玩家在玩家组中
## is_in_shadow

```lua
(method) Player:is_in_shadow(point: Point)
  -> is_point_in_shadow: boolean
```

某个位置是否处于玩家的黑色阴影中

@*param* `point` — 点

@*return* `is_point_in_shadow` — 点在黑色阴影中
## is_key_pressed

```lua
(method) Player:is_key_pressed(key: y3.Const.KeyboardKey|y3.Const.MouseKey)
  -> 是否被按下: boolean
```

玩家的按键是否被按下

@*param* `key` — 按键
## is_middle_join

```lua
(method) Player:is_middle_join()
  -> is_middle_join: boolean
```

玩家是否中途加入

@*return* `is_middle_join` — 是否中途加入
## is_operation_key_occupied

```lua
(method) Player:is_operation_key_occupied(key: py.NormalKey, assist_key: py.RecordKey)
  -> is_conf: boolean
```

玩家基础操作快捷键是否被占用
TODO:功能键lua层表示需要处理

@*param* `key` — 键名

@*param* `assist_key` — 辅助键名

@*return* `is_conf` — 是否被占用
## is_visible

```lua
(method) Player:is_visible(point: Point)
  -> visible: boolean
```

玩家是否可以看到某个位置

@*param* `point` — 点

@*return* `visible` — 点对于玩家可见
## key

```lua
integer?
```

## kick

```lua
(method) Player:kick(reason: string)
```

强制踢出

@*param* `reason` — 踢出原因
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

## open_platform_shop

```lua
(method) Player:open_platform_shop(id: py.StoreKey)
```

请求购买平台道具

@*param* `id` — 平台道具id
## phandle

```lua
py.Role
```

玩家
## ref_manager

```lua
unknown
```

## request_random_pool

```lua
(method) Player:request_random_pool(id: integer, callback: fun(code: 0|1|2|999, result: { [integer]: integer }))
```

请求执行随机池掉落
执行完毕后调用回调函数，返回的参数如下：
* `code`: 结果代码
  + `0`: 成功
  + `1`: 不满足触发间隔
  + `2`: 不满足每日限制
  + `999`: 服务器无法连接，必须在平台上才能测试
* `result`: 结果表，`key` 表示影响的存档编号，`value` 表示改变的值

@*param* `id` — 随机池的编号

@*param* `callback` — 执行完毕后的回调函数
## select_unit

```lua
(method) Player:select_unit(unit_or_group: Unit|UnitGroup)
```

选中单位/单位组

@*param* `unit_or_group` — 单位/单位组
## set

```lua
(method) Player:set(key: string|y3.Const.PlayerAttr, value: number)
```

设置属性值

@*param* `key` — 属性名

@*param* `value` — 值
## set_all_operation_key

```lua
(method) Player:set_all_operation_key(operation: py.AllGameFunc, is_enable: boolean)
```

设置玩家的基础操作开关（包含所有基础操作）
TODO:operation在lua层的表示方式待整理 方法名英文待确认

@*param* `operation` — 可编辑操作

@*param* `is_enable` — 是否开
## set_color_grading

```lua
(method) Player:set_color_grading(value: integer)
```

 设置滤镜

@*param* `value` — 滤镜
## set_exp_rate

```lua
(method) Player:set_exp_rate(rate: number)
```

设置经验获得率

@*param* `rate` — 经验获得率
## set_follow_distance

```lua
(method) Player:set_follow_distance(distance: number)
```

设置跟随距离

@*param* `distance` — 距离
## set_hostility

```lua
(method) Player:set_hostility(player: Player, is_hostile: boolean)
```

设置敌对关系

@*param* `player` — 玩家

@*param* `is_hostile` — 是否敌视
## set_local_terrain_visible

```lua
(method) Player:set_local_terrain_visible(is_visible: boolean)
```

显示/隐藏玩家地表纹理

@*param* `is_visible` — 显示/隐藏
## set_mouse_click_selection

```lua
(method) Player:set_mouse_click_selection(is_enable: boolean)
```

为玩家开/关鼠标点选

@*param* `is_enable` — 是否开鼠标点选
## set_mouse_drag_selection

```lua
(method) Player:set_mouse_drag_selection(is_enable: boolean)
```

为玩家开/关鼠标框选

@*param* `is_enable` — 是否开鼠标框选
## set_mouse_wheel

```lua
(method) Player:set_mouse_wheel(is_enable: boolean)
```

为玩家开/关鼠标滚轮

@*param* `is_enable` — 是否开鼠标滚轮
## set_name

```lua
(method) Player:set_name(name: string)
```

设置名字

@*param* `name` — 名字
## set_operation_key

```lua
(method) Player:set_operation_key(operation: py.EditableGameFunc, key: py.NormalKey, assist_key: py.RecordKey)
```

设置玩家的基础操作快捷键（过滤掉禁止设置的） 
TODO:operation在lua层的表示方式待整理 方法名英文待确认

@*param* `operation` — 可编辑操作

@*param* `key` — 功能按键

@*param* `assist_key` — 辅助按键
## set_role_vignetting_breath_rate

```lua
(method) Player:set_role_vignetting_breath_rate(circle_time: number)
```

设置暗角呼吸周期

@*param* `circle_time` — 呼吸周期
## set_strict_group_navigation

```lua
(method) Player:set_strict_group_navigation(is_strict: boolean)
```

设置群体寻路严格模式

@*param* `is_strict` — 是否严格
## set_team

```lua
(method) Player:set_team(id: py.Camp)
```

设置队伍ID
## set_tech_level

```lua
(method) Player:set_tech_level(tech_type: py.TechKey, level: integer)
```

设置科技等级

@*param* `tech_type` — 科技等级

@*param* `level` — 等级
## set_vignetting_change_range

```lua
(method) Player:set_vignetting_change_range(range: number)
```

设置暗角变化幅度

@*param* `range` — 幅度
## set_vignetting_color

```lua
(method) Player:set_vignetting_color(red: number, green: number, blue: number, time: number)
```

设置暗角颜色

@*param* `red` — 颜色r

@*param* `green` — 颜色g

@*param* `blue` — 颜色b

@*param* `time` — 过渡时间
## set_vignetting_size

```lua
(method) Player:set_vignetting_size(size: number)
```

设置暗角大小

@*param* `size` — 大小
## share_vision_of_unit

```lua
(method) Player:share_vision_of_unit(unit: Unit, share: boolean)
```

获取单位的视野

@*param* `unit` — 单位
## share_vision_with_player

```lua
(method) Player:share_vision_with_player(target_player: Player, share: boolean)
```

对玩家开放视野

@*param* `target_player` — 玩家
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

## upload_save_data

```lua
(method) Player:upload_save_data()
```

上传存档
## upload_tracking_data

```lua
(method) Player:upload_tracking_data(key: string, cnt: integer)
```

 上传埋点数据
## use_store_item

```lua
(method) Player:use_store_item(count: integer, item_id: py.StoreKey)
```

消耗玩家平台道具

@*param* `count` — 个数

@*param* `item_id` — 平台道具id
## with_local

```lua
function Player.with_local(callback: fun(local_player: Player))
```

在本地玩家环境中执行代码。  
在开发模式中会阻止这些代码修改上值、修改全局变量、调用同步函数，因此也会产生额外的开销。（暂时失效）  
在平台上不会检测，也不会有额外开销。

---


```lua
y3.player.with_local(function (local_player)
    -- 在此回调函数中修改上值、修改全局变量、调用同步函数会给出警告
    print(local_player)
end)
```

