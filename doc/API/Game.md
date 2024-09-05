# Game

游戏接口

## clear_table

```lua
function Game.clear_table(table: any)
```

清空表
## close_role_micro_unit

```lua
function Game.close_role_micro_unit(player: Player)
```

关闭玩家的附近语音聊天

@*param* `player` — 玩家
## create_day_night_human_time

```lua
function Game.create_day_night_human_time(time: number, dur: number)
```

创建人造时间

@*param* `time` — 时间

@*param* `dur` — 持续时间
## current_game_run_time

```lua
function Game.current_game_run_time()
  -> time: number
```

游戏已运行的时间

@*return* `time` — 时间
## custom_event_manager

```lua
EventManager?
```

## download_platform_icon

```lua
function Game.download_platform_icon(url: string, icon: string, callback: fun(real_path: string))
```

下载玩家平台头像，下载完毕后调用回调函数

@*param* `url` — 头像下载地址

@*param* `icon` — 头像路径，如果本地已有头像则不会下载而是立即调用回调函数

@*param* `callback` — 下载完毕后的回调函数
## enable_grass_by_pos

```lua
function Game.enable_grass_by_pos(is_on: boolean, point: Point)
```

开关目标点的草丛

@*param* `is_on` — 开关

@*param* `point` — 点
## enable_soft_pause

```lua
function Game.enable_soft_pause()
```

开启软暂停
## encrypt_table

```lua
function Game.encrypt_table(tab: table)
```

加密表

@*param* `tab` — 表
## end_player_game

```lua
function Game.end_player_game(player: Player, result: string, is_show: boolean)
```

结束玩家游戏

@*param* `player` — 玩家

@*param* `result` — 结果

@*param* `is_show` — 是否展示界面
## event

```lua
fun(self: Game, event: "游戏-初始化", callback: fun(trg: Trigger, data: EventParam.游戏-初始化)):Trigger
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
## event_manager

```lua
unknown
```

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

## get_archive_rank_player_archive_value

```lua
function Game.get_archive_rank_player_archive_value(file: integer, index: integer)
  -> value: integer
```

获取整数存档排行榜玩家存档值

@*param* `file` — 存档

@*param* `index` — 序号

@*return* `value` — 存档值
## get_camp_by_id

```lua
function Game.get_camp_by_id(id: py.CampID)
  -> py.Camp
```

获得阵营

@*param* `id` — 阵营id
## get_compound_attributes

```lua
function Game.get_compound_attributes(primary_attribute: string, secondary_attr: string)
  -> coefficient: number
```

获取三维属性的影响系数

@*param* `primary_attribute` — 一级属性

@*param* `secondary_attr` — 二级属性

@*return* `coefficient` — 系数
## get_current_game_mode

```lua
function Game.get_current_game_mode()
  -> game_mode: py.GameMode
```

获取当前游戏模式

@*return* `game_mode` — 游戏模式
## get_current_server_time

```lua
function Game.get_current_server_time(time_zone?: integer)
  -> ServerTime
```

获取当前的服务器时间。为了保证结果的一致性需要你自己指定时区。

@*param* `time_zone` — 时区，默认为0。获取中国的时间请传入8。
## get_custom_event_manager

```lua
(method) CustomEvent:get_custom_event_manager()
  -> EventManager?
```

## get_damage_ratio

```lua
function Game.get_damage_ratio(attack_type: integer, area_type: integer)
  -> factor: number
```

获取伤害系数

@*param* `attack_type` — 攻击类型

@*param* `area_type` — 护甲类型

@*return* `factor` — 伤害系数
## get_day_night_time

```lua
function Game.get_day_night_time()
  -> time: number
```

获取游戏当前昼夜时间

@*return* `time` — 时间
## get_event_manager

```lua
(method) Game:get_event_manager()
  -> EventManager
```

## get_game_init_time_stamp

```lua
function Game.get_game_init_time_stamp()
  -> time_stamp: integer
```

获取游戏开始时间戳

@*return* `time_stamp` — 时间戳
## get_game_x_resolution

```lua
function Game.get_game_x_resolution()
  -> x_resolution: integer
```

获取初始化横向分辨率

@*return* `x_resolution` — 横向分辨率
## get_game_y_resolution

```lua
function Game.get_game_y_resolution()
  -> y_resolution: integer
```

获取初始化纵向分辨率

@*return* `y_resolution` — 纵向分辨率
## get_global_archive

```lua
function Game.get_global_archive(name: string)
  -> archive: integer
```

获取全局存档

@*param* `name` — 存档名

@*return* `archive` — 存档
## get_global_weather

```lua
function Game.get_global_weather()
  -> weather: integer
```

获取全局天气

@*return* `weather` — 天气
## get_graphics_quality

```lua
function Game.get_graphics_quality()
  -> quality: 'high'|'low'|'medium'
```

获取初始化游戏画质

@*return* `quality` — 画质

```lua
quality:
    | 'low'
    | 'medium'
    | 'high'
```
## get_icon_id

```lua
function Game.get_icon_id(id: integer)
  -> texture: py.Texture
```

根据图片ID获取图片
## get_level

```lua
function Game.get_level()
  -> py.Map
```

获取当前关卡

@*return* — 当前关卡
## get_obj_icon

```lua
function Game.get_obj_icon(obj?: Ability|Buff|Item|Unit)
  -> texture: py.Texture
```

获取任意对象图片

@*param* `obj` — 单位|物品|技能|魔法效果
## get_point_texture

```lua
function Game.get_point_texture(point: Point)
  -> integer
```

获取地形纹理

@*param* `point` — 点
## get_start_mode

```lua
function Game.get_start_mode()
  -> game_mode: integer
```

获取本局游戏环境

@*return* `game_mode` — 游戏环境，1是编辑器，2是平台
## get_table

```lua
function Game.get_table(name: string, as_lua?: boolean)
  -> tb: table
```

获取表

@*param* `name` — 表名

@*param* `as_lua` — 是否将表中的数据转换为Lua的数据类型，例如Fix32转number

@*return* `tb` — 表
## get_tech_description

```lua
function Game.get_tech_description(tech_id: py.TechKey)
  -> description: string
```

获取科技类型的描述

@*param* `tech_id` — 科技类型

@*return* `description` — 描述
## get_tech_icon

```lua
function Game.get_tech_icon(tech_id: py.TechKey, index: integer)
  -> texture: py.Texture
```

获取科技图标

@*param* `tech_id` — 科技

@*param* `index` — 等级

@*return* `texture` — 图标id
## get_tech_max_level

```lua
function Game.get_tech_max_level(tech_id: py.TechKey)
  -> level: integer
```

获取科技最大等级

@*param* `tech_id` — 科技id

@*return* `level` — 最大等级
## get_tech_name

```lua
function Game.get_tech_name(tech_id: py.TechKey)
  -> name: string
```

获取科技类型的名称

@*param* `tech_id` — 科技类型

@*return* `name` — 名称
## get_window_mode

```lua
function Game.get_window_mode()
  -> mode: Game.WindowMode
```

获取窗口化类别

@*return* `mode` — 窗口化类别

```lua
mode:
    | "full_screen" -- 全屏
    | "window_mode" -- 窗口化
    | "window_mode_full_screen" -- 窗口化全屏
```
## is_compound_attributes_enabled

```lua
function Game.is_compound_attributes_enabled()
  -> is_open: boolean
```

是否开启三维属性

@*return* `is_open` — 是否开启
## is_debug_mode

```lua
function Game.is_debug_mode(ignore_config?: boolean)
  -> boolean
```

 是否是调试模式

@*param* `ignore_config` — 是否忽略用户的设置
## locale

```lua
function Game.locale(key: string|integer)
  -> 多语言内容: string
```

获取多语言内容

@*param* `key` — 多语言key
## modify_point_texture

```lua
function Game.modify_point_texture(point: Point, terrain_type: integer, range: integer, area_type: integer)
```

设置某点的地形纹理

@*param* `point` — 点

@*param* `terrain_type` — 纹理类型

@*param* `range` — 范围

@*param* `area_type` — 形状
## on_client_tick

```lua
function Game.on_client_tick(callback: fun(local_player: Player))
```

本地客户端每帧回调此函数  
只能注册一个回调，后注册的会覆盖之前的，
如有需要请自己在回调中分发

>警告：回调函数是在本地玩家的客户端上执行的，注意避免产生不同步的问题。
## pause_game

```lua
function Game.pause_game()
```

暂停游戏
## reg_sound_area

```lua
function Game.reg_sound_area(area: Area)
```

注册区域的附近语音频道

@*param* `area` — 区域
## remove_ability_kv

```lua
function Game.remove_ability_kv(ability_key: py.AbilityKey, key: string)
```

清除技能类型键值

@*param* `ability_key` — 技能id

@*param* `key` — 键
## remove_item_kv

```lua
function Game.remove_item_kv(item_key: py.ItemKey, key: string)
```

清除物品类型键值

@*param* `item_key` — 物品id

@*param* `key` — 键
## remove_unit_kv

```lua
function Game.remove_unit_kv(unit_key: py.UnitKey, key: string)
```

清除单位类型键值

@*param* `unit_key` — 单位id

@*param* `key` — 键
## replace_area_texture

```lua
function Game.replace_area_texture(area: Area, old_texture: integer, new_texture: integer)
```

替换地形纹理

@*param* `area` — 区域

@*param* `old_texture` — 纹理类型

@*param* `new_texture` — 纹理类型
## request_url

```lua
(method) Game:request_url(url: string, body?: string, callback?: fun(body?: string), options?: HttpRequestOptions)
```

发送 http 请求，成功或失败都会触发回调，
成功时回调的参数是 http 返回的 body，失败时回调的参数是 `nil`
## restart_game

```lua
function Game.restart_game(fast_restart: boolean)
```

开始新一轮游戏

@*param* `fast_restart` — 快速重置
## resume_soft_pause

```lua
function Game.resume_soft_pause()
```

恢复软暂停
## send_custom_event

```lua
function Game.send_custom_event(id: integer, table: table)
```

 发送自定义事件给ECA

@*param* `id` — 事件id

@*param* `table` — 事件数据
## send_signal

```lua
function Game.send_signal(player: Player, signal_enum: y3.Const.SignalType, point: Point, visible_enum: y3.Const.VisibleType)
```

发送信号

@*param* `player` — 玩家

@*param* `signal_enum` — 信号枚举值

@*param* `point` — 点

@*param* `visible_enum` — 可见性枚举值
## set_area_weather

```lua
function Game.set_area_weather(area: Area, weather: integer)
```

设置区域天气

@*param* `area` — 区域

@*param* `weather` — 天气
## set_cascaded_shadow_distanc

```lua
function Game.set_cascaded_shadow_distanc(distance: number)
```

设置阴影距离

@*param* `distance` — 距离
## set_cascaded_shadow_distance

```lua
function Game.set_cascaded_shadow_distance(dis: number)
```

设置阴影距离

@*param* `dis` — 距离
## set_cascaded_shadow_enable

```lua
function Game.set_cascaded_shadow_enable(is_enable: boolean)
```

开关级联阴影

@*param* `is_enable` — 开关
## set_compound_attributes

```lua
function Game.set_compound_attributes(primary_attribute: string, secondary_attr: string, value: number)
```

设置复合属性

@*param* `primary_attribute` — 一级属性

@*param* `secondary_attr` — 二级属性

@*param* `value` — 属性值
## set_damage_factor

```lua
function Game.set_damage_factor(attack_type: integer, armor_type: integer, ratio: number)
```

设置伤害系数

@*param* `attack_type` — 攻击类型

@*param* `armor_type` — 护甲类型

@*param* `ratio` — 系数
## set_day_night_speed

```lua
function Game.set_day_night_speed(speed: number)
```

设置游戏时间的流逝速度

@*param* `speed` — 速度
## set_day_night_time

```lua
function Game.set_day_night_time(time: number)
```

设置游戏时间

@*param* `time` — 时间
## set_fog_attr

```lua
function Game.set_fog_attr(fog: table, attr: string, value: number)
```

设置雾效属性(新)

@*param* `fog` — 局部雾

@*param* `attr` — 朝向

@*param* `value` — 位置x
## set_fog_attribute

```lua
function Game.set_fog_attribute(fog: table, direction: number, pos_x: number, pos_y: number, pos_z: number, scale_x: number, scale_y: number, scale_z: number, red: number, green: number, blue: number, concentration: number, speed: number)
```

设置雾效属性

@*param* `fog` — 局部雾

@*param* `direction` — 朝向

@*param* `pos_x` — 位置x

@*param* `pos_y` — 位置y

@*param* `pos_z` — 位置z

@*param* `scale_x` — 缩放x

@*param* `scale_y` — 缩放y

@*param* `scale_z` — 缩放z

@*param* `red` — 颜色r

@*param* `green` — 颜色g

@*param* `blue` — 颜色b

@*param* `concentration` — 浓度

@*param* `speed` — 流速
## set_game_speed

```lua
function Game.set_game_speed(speed: number)
```

设置游戏运行速率

@*param* `speed` — 速率
## set_global_weather

```lua
function Game.set_global_weather(weather: integer)
```

设置全局天气

@*param* `weather` — 天气
## set_globale_view

```lua
function Game.set_globale_view(enable: boolean)
```

 启用全图视野（总是可见的）
## set_jump_word

```lua
function Game.set_jump_word(enable: boolean)
```

关闭localplayer的表现层跳字

@*param* `enable` — 是否关闭
## set_logic_fps

```lua
function Game.set_logic_fps(fps: integer)
```

设置逻辑帧率

@*param* `fps` — 帧率
## set_material_param

```lua
function Game.set_material_param(obj: Unit, mat: integer, r: number, g: number, b: number, intensity: number, alpha: number)
```

设置物体的材质

@*param* `mat` — 材质

@*param* `r` — 红

@*param* `g` — 绿

@*param* `b` — 蓝

@*param* `intensity` — 强度

@*param* `alpha` — 透明度
## set_nearby_micro_switch

```lua
function Game.set_nearby_micro_switch(player: Player, switch: boolean)
```

设置玩家的附近语音聊天发言开关

@*param* `player` — 玩家

@*param* `switch` — 是否关闭
## set_nearby_sound_switch

```lua
function Game.set_nearby_sound_switch(player: Player, switch: boolean)
```

设置玩家的附近语音聊天收听开关

@*param* `player` — 玩家

@*param* `switch` — 是否关闭
## set_nearby_voice_mode

```lua
function Game.set_nearby_voice_mode(switch: boolean)
```

设置附近语音的区域模式开关

@*param* `switch` — 是否关闭
## set_object_color

```lua
function Game.set_object_color(obj: Destructible|Item|Unit, r: integer, g: integer, b: integer, a?: integer, o?: number)
```

设置对象基础材质颜色

@*param* `r` — 红色（0~255）

@*param* `g` — 绿色（0~255）

@*param* `b` — 蓝色（0~255）

@*param* `a` — 强度（0~100）

@*param* `o` — 不透明度（0~1）
## set_object_fresnel

```lua
function Game.set_object_fresnel(obj: Destructible|Item|Unit, r?: integer, g?: integer, b?: integer, alpha?: number, exp?: number, strength?: number)
```

设置对象的菲涅尔效果

@*param* `r` — R

@*param* `g` — G

@*param* `b` — B

@*param* `alpha` — alpha

@*param* `exp` — exp

@*param* `strength` — strength
## set_object_fresnel_visible

```lua
function Game.set_object_fresnel_visible(obj: Destructible|Item|Unit, b: boolean)
```

设置对象的菲涅尔效果
## set_post_effect

```lua
function Game.set_post_effect(player: Player, processing: py.PostEffect)
```

为玩家切换画风

@*param* `player` — 玩家

@*param* `processing` — 画风
## set_random_seed

```lua
function Game.set_random_seed(seed: integer)
```

设置随机数种子

@*param* `seed` — 随机种子
## set_role_all_micro_switch

```lua
function Game.set_role_all_micro_switch(player: Player, switch: boolean)
```

设置玩家的所有人语音聊天发言开关

@*param* `player` — 玩家

@*param* `switch` — 是否关闭
## set_role_all_sound_switch

```lua
function Game.set_role_all_sound_switch(player: Player, switch: boolean)
```

设置玩家的所有人语音聊天收听开关

@*param* `player` — 玩家

@*param* `switch` — 是否关闭
## set_role_camp_micro_switch

```lua
function Game.set_role_camp_micro_switch(player: Player, switch: boolean)
```

设置玩家的同阵营语音聊天发言开关

@*param* `player` — 玩家

@*param* `switch` — 是否关闭
## set_role_camp_sound_switch

```lua
function Game.set_role_camp_sound_switch(player: Player, switch: boolean)
```

设置玩家的同阵营语音聊天收听开关

@*param* `player` — 玩家

@*param* `switch` — 是否关闭
## set_role_micro_unit

```lua
function Game.set_role_micro_unit(player: Player, unit: Unit)
```

设置玩家的声音主单位

@*param* `player` — 玩家

@*param* `unit` — 是否关闭
## sfx_switch

```lua
function Game.sfx_switch(player: Player, switch: boolean)
```

特效播放开关

@*param* `player` — 玩家

@*param* `switch` — 是否关闭
## str_to_ability_cast_type

```lua
function Game.str_to_ability_cast_type(str: string)
  -> py.AbilityCastType
```

字符串转技能释放类型

@*param* `str` — 字符串

@*return* — 技能释放类型
## str_to_ability_key

```lua
function Game.str_to_ability_key(str: string)
  -> py.AbilityKey
```

字符串转技能类型

@*param* `str` — 字符串

@*return* — 技能类型
## str_to_ability_type

```lua
function Game.str_to_ability_type(str: string)
  -> py.AbilityType
```

字符串转技能槽位类型

@*param* `str` — 字符串

@*return* — 技能槽位类型
## str_to_audio_key

```lua
function Game.str_to_audio_key(str: string)
  -> py.AudioKey
```

字符串转声音类型

@*param* `str` — 字符串

@*return* — 声音类型
## str_to_camp

```lua
function Game.str_to_camp(str: string)
  -> py.Camp
```

字符串转阵营

@*param* `str` — 字符串

@*return* — 阵营
## str_to_damage_type

```lua
function Game.str_to_damage_type(str: string)
  -> integer
```

字符串转伤害类型

@*param* `str` — 字符串

@*return* — 伤害类型
## str_to_dest_key

```lua
function Game.str_to_dest_key(str: string)
  -> py.DestructibleKey
```

字符串转可破坏物类型

@*param* `str` — 字符串

@*return* — 可破坏物类型
## str_to_item_key

```lua
function Game.str_to_item_key(str: string)
  -> py.ItemKey
```

字符串转物品类型

@*param* `str` — 字符串

@*return* — 物品类型
## str_to_keyboard_key

```lua
function Game.str_to_keyboard_key(str: string)
  -> py.KeyboardKey
```

字符串转键盘按键

@*param* `str` — 字符串

@*return* — 键盘按键
## str_to_link_sfx_key

```lua
function Game.str_to_link_sfx_key(str: string)
  -> py.SfxKey
```

字符串转链接特效

@*param* `str` — 字符串

@*return* — 链接特效
## str_to_model_key

```lua
function Game.str_to_model_key(str: string)
  -> py.ModelKey
```

字符串转模型类型

@*param* `str` — 字符串

@*return* — 模型类型
## str_to_modifier_effect_type

```lua
function Game.str_to_modifier_effect_type(str: string)
  -> py.ModifierEffectType
```

字符串转魔法效果影响类型

@*param* `str` — 字符串

@*return* — 魔法效果影响类型
## str_to_modifier_key

```lua
function Game.str_to_modifier_key(str: string)
  -> py.ModifierKey
```

字符串转魔法效果类型

@*param* `str` — 字符串

@*return* — 魔法效果类型
## str_to_modifier_type

```lua
function Game.str_to_modifier_type(str: string)
  -> py.ModifierType
```

字符串转魔法效果类别

@*param* `str` — 字符串

@*return* — 魔法效果类别
## str_to_mouse_key

```lua
function Game.str_to_mouse_key(str: string)
  -> py.MouseKey
```

字符串转鼠标按键

@*param* `str` — 字符串

@*return* — 鼠标按键
## str_to_mouse_wheel

```lua
function Game.str_to_mouse_wheel(str: string)
  -> py.MouseWheel
```

字符串转鼠标滚轮

@*param* `str` — 字符串

@*return* — 鼠标滚轮
## str_to_particle_sfx_key

```lua
function Game.str_to_particle_sfx_key(str: string)
  -> py.SfxKey
```

字符串转特效

@*param* `str` — 字符串

@*return* — 特效
## str_to_project_key

```lua
function Game.str_to_project_key(str: string)
  -> py.ProjectileKey
```

字符串转投射物类型

@*param* `str` — 字符串

@*return* — 投射物类型
## str_to_role_relation

```lua
function Game.str_to_role_relation(str: string)
  -> py.RoleRelation
```

字符串转玩家关系

@*param* `str` — 字符串

@*return* — 玩家关系
## str_to_role_res

```lua
function Game.str_to_role_res(str: string)
  -> py.RoleResKey
```

字符串转玩家属性

@*param* `str` — 字符串

@*return* — 3 玩家属性
## str_to_role_status

```lua
function Game.str_to_role_status(status: py.RoleStatus)
  -> string
```

字玩家状态转字符串
## str_to_role_type

```lua
function Game.str_to_role_type(str: string)
  -> py.RoleType
```

字符串转玩家控制状态

@*param* `str` — 字符串

@*return* — 玩家控制状态
## str_to_store_key

```lua
function Game.str_to_store_key(str: string)
  -> store_key: py.StoreKey
```

字符串转平台道具类型

@*param* `str` — 字符串

@*return* `store_key` — 平台道具类型
## str_to_tech_key

```lua
function Game.str_to_tech_key(str: string)
  -> py.TechKey
```

字符串转科技类型

@*param* `str` — 字符串

@*return* — 科技类型
## str_to_ui_event

```lua
function Game.str_to_ui_event(str: string)
  -> string
```

字符串转界面事件

@*param* `str` — 字符串
## str_to_unit_attr_type

```lua
function Game.str_to_unit_attr_type(str: string)
  -> string
```

字符串转单位属性类型

@*param* `str` — 字符串

@*return* — 单位属性类型
## str_to_unit_command_type

```lua
function Game.str_to_unit_command_type(str: string)
  -> py.UnitCommandType
```

字符串转单位命令类型

@*param* `str` — 字符串

@*return* — 单位命令类型
## str_to_unit_key

```lua
function Game.str_to_unit_key(str: string)
  -> py.UnitKey
```

字符串转单位类型

@*param* `str` — 字符串

@*return* — 单位类型
## str_to_unit_name

```lua
function Game.str_to_unit_name(str: string)
  -> string
```

字符串转单位属性

@*param* `str` — 字符串

@*return* — 单位属性
## str_to_unit_type

```lua
function Game.str_to_unit_type(str: string)
  -> py.UnitType
```

字符串转单位分类

@*param* `str` — 字符串

@*return* — 单位分类
## subscribe_event

```lua
(method) Game:subscribe_event(event_type: y3.Const.EventType, ...any)
  -> any[]?
  2. Trigger.CallBack
  3. Unsubscribe: function
```

## switch_level

```lua
function Game.switch_level(level_id_str: py.Map)
```

切换至关卡

@*param* `level_id_str` — 关卡ID
## table_has_key

```lua
function Game.table_has_key(table: table, key: string)
  -> boolean
```

表是否存在字段
## toggle_day_night_time

```lua
function Game.toggle_day_night_time(is_on: boolean)
```

开关时间流逝

@*param* `is_on` — 开关
## unreg_sound_area

```lua
function Game.unreg_sound_area(area: Area)
```

注销区域的附近语音频道

@*param* `area` — 区域
## world_pos_to_camera_pos

```lua
function Game.world_pos_to_camera_pos(world_pos: Point)
  -> x: number
  2. y: number
```

世界坐标转换屏幕坐标

@*param* `world_pos` — 世界坐标

@*return* `x,y` — 屏幕坐标
## world_pos_to_screen_edge_pos

```lua
function Game.world_pos_to_screen_edge_pos(world_pos: Point, delta_dis: number)
  -> x: number
  2. y: number
```

世界坐标转换屏幕边缘坐标

# Game.WindowMode

```lua
Game.WindowMode:
    | "full_screen" -- 全屏
    | "window_mode" -- 窗口化
    | "window_mode_full_screen" -- 窗口化全屏
```


```lua
"full_screen"|"window_mode"|"window_mode_full_screen"
```


