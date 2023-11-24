# Object.Ability

## ability_attribute

```lua
number
```

技能特殊属性（暂不生效）  
## ability_break_cast_range

```lua
any[]
```

当技能施法开始或施法出手阶段结束时，如果与施法目标的距离超过该值，会打断技能释放。
## ability_bw_point

```lua
number
```

后摇时长  
施法完成时间
## ability_cast_point

```lua
number
```

前摇时长  
施法开始时间
## ability_cast_range

```lua
any[]
```

释放范围  
以角色为圆心，以该值为半径的圆形区域。是角色不需要移动即可释放技能的最远距离。
## ability_cast_type

```lua
number
```

技能的释放类型。
## ability_channel_time

```lua
number
```

施法时长  
施法出手时间
## ability_cost

```lua
any[]
```

技能资源消耗值  
释放技能消耗的MP(会根据单位自身的技能资源进行变化)数值
## ability_damage

```lua
any[]
```

技能伤害值  
技能造成的伤害，可使用公式编辑，需在触发内引用才可生效
## ability_damage_range

```lua
any[]
```

当前技能的影响范围，
## ability_hp_cost

```lua
any[]
```

使用该技能时会消耗的生命值
## ability_icon

```lua
number
```

图标  
技能的图标，会在编辑器和游戏的ui上显示
## ability_max_level

```lua
number
```

技能最大等级  
技能的等级上限
## ability_max_stack_count

```lua
any[]
```

最大充能层数  
技能的最大充能数，必须满足充能数大于0且不在冷却状态才能施放该技能
## ability_prepare_time

```lua
number
```

施法引导时间
## ability_stack_cd

```lua
any[]
```

充能cd  
每增加一层充能数所需的时间（单位为秒）
## allow_none_target

```lua
boolean
```

是否允许无目标攻击  
## animation

```lua
string
```

动画
## animation_speed

```lua
number
```

动画速率
## arrow_length

```lua
any[]
```

箭头长度  
箭头指示器的长度
## arrow_width

```lua
any[]
```

箭头宽度  
箭头指示器的宽度
## art_resource_btn

```lua
any
```

## auto_pick

```lua
boolean
```

当采集到的资源是物品时，是否自动将物品拾取。如果不自动拾取则物品会创建在地面。
## bs_sfx_list

```lua
any[]
```

后摇特效
## bs_sound_effect

```lua
any[]
```

后摇音效
## build_list

```lua
any[]
```

建造技能建造的单位类型
## can_bs_interrupt

```lua
boolean
```

技能施法完成阶段能否被其他技能或者移动打断
## can_cache

```lua
boolean
```

是否可以缓存  
开启时，被控制时，控制结束 依旧可以继续释放（例如被禁止施法时发布施放命令，禁止施法解除后就会自动施放出来）
## can_cast_interrupt

```lua
boolean
```

技能施法出手阶段能否被其他技能或者移动打断
## can_cast_when_hp_insufficient

```lua
boolean
```

如果单位当前生命值不满足消耗时，能否施放技能
## can_cost_hp

```lua
boolean
```

开启后可以配置消耗生命值相关的技能参数。如无需要请勿开启该配置，会增加系统消耗。
## can_interrupt_others

```lua
boolean
```

释放该技能时候会尝试打断当前正在释放的技能
## can_prepare_interrupt

```lua
boolean
```

技能施法引导阶段能否被其他技能或者移动打断
## can_ps_interrupt

```lua
boolean
```

技能施法开始阶段能否被其他技能或者移动打断
## circle_radius

```lua
any[]
```

圆形半径  
圆形指示器的半径
## cold_down_time

```lua
any[]
```

冷却时间  
技能的冷却时间，释放一次技能后需要等待该时间才可继续释放（单位为秒）
## collection_animation

```lua
string
```

使用采集技能时会播放的动画。会在技能施法开始时播放，施法停止时停止。
## collection_animation_loop

```lua
boolean
```

采集技能时播放的采集动画是否会循环播放。
## collection_continuously

```lua
boolean
```

是否在采集完成后继续采集（仅在技能冷却时间为0时生效）
## collection_destructible_tags

```lua
any[]
```

可破坏物标签要求
## cost_hp_can_die

```lua
boolean
```

如果单位当前生命值不满足消耗时施放技能，则该项为true时单位会死亡，为false时会保留1点生命值
## cst_sfx_list

```lua
any[]
```

施法特效
## cst_sound_effect

```lua
any[]
```

施法音效
## description

```lua
number
```

描述  
描述
## end_sfx_list

```lua
any[]
```

结束特效
## end_sound_effect

```lua
any[]
```

结束音效
## filter_condition_camp

```lua
number
```

索敌条件 - 阵营  
按阵营选取目标。
## filter_condition_type

```lua
number
```

索敌条件 - 类型  
按种类选取目标。
## filter_item_tags

```lua
any[]
```

物品标签要求
## filter_modifier_unit

```lua
number
```

过滤效果单位  
## filter_unit_tags

```lua
any[]
```

单位标签要求
## hit_sfx_list

```lua
any[]
```

受击特效
## hit_sound_effect

```lua
any[]
```

击中音效
## influenced_by_cd_reduce

```lua
boolean
```

技能受到单位属性中的冷却缩短的影响
## influenced_by_move

```lua
boolean
```

勾选后移动会尝试打断当前技能，不勾选则可以实现移动施法
## is_channel

```lua
boolean
```

流程-是否持续施法  
## is_charge_ability

```lua
boolean
```

蓄力技能专属，为true时，技能开始和引导时间会一起作为蓄力技能一阶段的引导时间
## is_immediate

```lua
boolean
```

流程-是否立刻施法  
释放这个技能是否需要施法过程，开启时可以在单位存活的任何时期发动该技能，即使被禁止施法也可以正常释放。
## is_meele

```lua
boolean
```

是否是近战攻击  
开启时，标记这个技能造成的伤害为近战伤害
## is_toggle

```lua
boolean
```

是否开关技能（暂不生效）  
## key

```lua
number
```

ID
## kv

```lua
Object.Ability.Kv
```

## magicbook_list

```lua
any[]
```

魔法书中存放的技能list
## name

```lua
string|integer
```

名称  
名称
## need_turn_to_target

```lua
boolean
```

开启时，技能释放后单位会自动转到技能释放的方向（转身速度为单位的转身速度）
## pick_count

```lua
number
```

每次使用采集技能时获取到的资源数量。如果采集的是玩家属性，则获得对应的玩家属性值，如果采集的是物品，则获得对应数量的物品。
## player_props_cost

```lua
any[]
```

施放技能消耗的玩家属性，技能拥有者的玩家该属性不足时无法施放技能
## precondition_list

```lua
any[]
```

释放技能的前置条件
## ps_sfx_list

```lua
any[]
```

前摇特效
## ps_sound_effect

```lua
any[]
```

前摇音效
## release_immediately_out_of_range

```lua
boolean
```

如果技能目标点超出施法范围，会在施法范围内离目标最近的点施放
## required_level

```lua
Object.Ability.RequiredLevel
```

允许学习等级  
单位学习该技能所需要的等级
## sector_angle

```lua
any[]
```

扇形指示器的角度
## sector_radius

```lua
any[]
```

扇形半径  
扇形指示器的边长
## sight_type

```lua
number
```

指示器类型  
释放技能时的鼠标指示器的样式
## sound_event_list

```lua
any[]
```

可以设置触发指定事件时播放的声音
## sp_count_down

```lua
boolean
```

开启时，会根据技能的施法时间显示相应的进度条
## sp_countdown

```lua
boolean
```

## sp_sfx_list

```lua
any[]
```

准备特效
## sp_sound_effect

```lua
any[]
```

准备音效
## suffix

```lua
string
```

编辑器后缀
## tags

```lua
any[]
```

标签  
用于对技能的分类处理。为技能贴上标签后可以对其进行更方便的关系，例如编写游戏逻辑：所有拥有XX标签的技能等级+1
## target_attribute

```lua
number
```

特殊筛选（只有尸体有效）  
特殊的技能目标筛选规则
## theme

```lua
number
```

主题  
## uid

```lua
string
```

UID

# Object.Ability.Kv

## AttackTimes

```lua
Object.Ability.Kv.AttackTimes
```


# Object.Ability.Kv.AttackTimes

## annotation

```lua
string
```

## desc

```lua
string
```

## etype

```lua
number
```

## key

```lua
string
```

ID
## prop_cls

```lua
string
```

## remark

```lua
string
```

## type

```lua
number
```

主类型  
## value

```lua
number
```


# Object.Ability.RequiredLevel

## formula

```lua
string
```

## required_levels

```lua
any[]
```


# Object.Buff

## attach_model_list

```lua
string
```

挂接模型列表
## cycle_time

```lua
number
```

每隔多长时间触发一次循环周期到期事件
## description

```lua
number
```

描述  
描述
## disappear_when_dead

```lua
boolean
```

死亡时是否销毁这个魔法效果。永久型的魔法效果不要勾选该选项。
## effect_button

```lua
any
```

## gain_list

```lua
any[]
```

获得特效列表  
## get_effect_list

```lua
any[]
```

## halo_effect

```lua
number
```

光环会对附近符合条件的单位添加该光环效果
## ign_inf_unit_tag

```lua
any[]
```

不会对拥有指定标签的单位施加光环效果。  
只有满足所有判断条件时，单位才会获得光环效果。
## ign_inf_unit_type

```lua
number
```

不会对指定类型的单位施加光环效果。  
只有满足所有判断条件时，单位才会获得光环效果。
## influence_rng

```lua
number
```

对多大范围内的单位添加光环效果
## is_influence_self

```lua
boolean
```

是否对光环的拥有者添加光环效果
## key

```lua
number
```

ID
## kv

```lua
Object.Buff.Kv
```

## layer_change_of_cover

```lua
number
```

不变会保留旧的魔法效果对象（事件中获取），覆盖会保留新的对象。
## layer_max

```lua
number
```

魔法效果的最大层数，如果最大层数为1则魔法效果在局内的属性面板中不会显示层数
## lose_effect_list

```lua
any[]
```

## lose_list

```lua
any[]
```

失去特效列表  
## material_alpha

```lua
number
```

## material_change

```lua
number
```

影响魔法效果携带者的材质
## material_color

```lua
any[]
```

## material_color_intensity

```lua
number
```

## model

```lua
number
```

模型  
模型
## modifier_cover_type

```lua
number
```

用于决定单位获得相同的魔法效果时，是否进行覆盖以及如何进行覆盖。
## modifier_effect

```lua
number
```

仅用于标记，用来进行效果分类，在ECA中可以对单位身上同一分类的魔法效果统一处理
## modifier_icon

```lua
number
```

效果图标  
## modifier_type

```lua
number
```

不同类别的魔法效果将会有
## name

```lua
string|integer
```

名称  
名称
## same_origin_cover

```lua
boolean
```

“同源”指覆盖发生时2个魔法效果的关联技能类型和来源单位相同  
  
当同源覆盖要求为是，2个不同源的魔法效果不会发生覆盖，走不覆盖规则
## shield_change_of_cover

```lua
number
```

护盾发生覆盖时的护盾值的处理方式
## shield_type

```lua
number
```

通用类可以抵挡物理或法术伤害，物理和法术护盾只能抵挡对应的伤害
## shield_value

```lua
number
```

护盾可以抵挡的伤害值
## show_on_ui

```lua
boolean
```

勾选后会在局内单位的魔法效果栏中显示该魔法效果
## sound_event_list

```lua
any[]
```

可以设置触发指定事件时播放的声音
## suffix

```lua
string
```

编辑器后缀
## tags

```lua
any[]
```

标签  
## target_allow

```lua
number
```

根据敌我关系决定是否对单位施加光环效果
## time_change_of_cover

```lua
number
```

若覆盖类型为覆盖时，不变会保留旧的持续时间，覆盖会保留新的持续时间，若覆盖类型为叠加时，规则相反。
## uid

```lua
string
```

UID

# Object.Buff.Kv


# Object.Item

## agility

```lua
number
```

敏捷  
为物品携带者提供的额外敏捷
## attached_ability

```lua
number
```

主动技能  
使用该物品的时释放的主动技能
## attached_agility

```lua
any[]
```

敏捷  
为物品携带者提供的额外敏捷
## attached_attack_mag

```lua
any[]
```

法术攻击力  
为物品携带者提供的额外魔法攻击力的数值
## attached_attack_phy

```lua
any[]
```

物理攻击力  
为物品携带者提供的额外物理攻击力的数值
## attached_attack_speed

```lua
any[]
```

攻击速度(%)  
为物品携带者提供的额外攻击速度的倍数值
## attached_buffs

```lua
any[]
```

## attached_cd_reduce

```lua
any[]
```

冷却缩减(%)  
为物品携带者提供的额外冷却缩短的百分比
## attached_critical_chance

```lua
any[]
```

暴击率(%)  
为物品携带者提供的额外暴击率
## attached_critical_dmg

```lua
any[]
```

暴击伤害(%)  
为物品携带者提供的额外暴击伤害的倍率。发生暴击时，造成的暴击伤害倍数
## attached_defense_mag

```lua
any[]
```

法术防御力  
为物品携带者提供的额外法术防御力的数值
## attached_defense_phy

```lua
any[]
```

物理防御力  
为物品携带者提供的额外物理防御力的数值
## attached_dmg_reduction

```lua
any[]
```

伤害减免(%)  
为物品携带者提供的额外伤害减免
## attached_dodge_rate

```lua
any[]
```

躲避率(%)  
为物品携带者提供的额外闪避率
## attached_extra_dmg

```lua
any[]
```

所有伤害加成(%)  
为物品携带者提供的额外伤害加成
## attached_gainvalue

```lua
any[]
```

技能伤害加成(%)  
该字段并无实际效果
## attached_heal_effect

```lua
any[]
```

被治疗效果提升(%)  
为物品携带者提供的额外受到治疗增益加成
## attached_hit_rate

```lua
any[]
```

命中率(%)  
为物品携带者提供的额外命中率
## attached_hp_max

```lua
any[]
```

最大生命值  
为物品携带者提供的额外最大生命值
## attached_hp_rec

```lua
any[]
```

生命恢复  
为物品携带者提供的额外每秒恢复生命值
## attached_intelligence

```lua
any[]
```

智力  
为物品携带者提供的额外智力
## attached_mp_max

```lua
any[]
```

最大技能资源  
为物品携带者提供的额外最大法力值
## attached_mp_rec

```lua
any[]
```

技能资源恢复  
为物品携带者提供的额外的每秒法力恢复值
## attached_ori_speed

```lua
any[]
```

移动速度  
为物品携带者提供的额外移动速度
## attached_passive_abilities

```lua
any[]
```

携带该物品时会获得的被动技能
## attached_pene_mag

```lua
any[]
```

法穿数值  
为物品携带者提供的额外法术穿透。先计算固定穿透，再计算百分比穿透
## attached_pene_mag_ratio

```lua
any[]
```

法术穿透(%)  
为物品携带者提供的额外百分比法术穿透。先计算固定穿透，再计算百分比穿透
## attached_pene_phy

```lua
any[]
```

物穿数值  
为物品携带者提供的额外物理穿透。先计算固定穿透，再计算百分比穿透
## attached_pene_phy_ratio

```lua
any[]
```

物理穿透(%)  
为物品携带者提供的额外百分比物理穿透。先计算固定穿透，再计算百分比穿透
## attached_resilience

```lua
any[]
```

该字段并无实际效果
## attached_strength

```lua
any[]
```

力量  
为物品携带者提供的额外力量
## attached_vampire_mag

```lua
any[]
```

法术吸血(%)  
为物品携带者提供的额外法术吸血
## attached_vampire_phy

```lua
any[]
```

物理吸血(%)  
为物品携带者提供的额外物理吸血
## attached_vision_true

```lua
any[]
```

为物品携带者提供的额外真实视野
## attack_mag

```lua
number
```

法攻数值  
为物品携带者提供的额外魔法攻击力的数值
## attack_phy

```lua
number
```

物攻数值  
为物品携带者提供的额外物理攻击力的数值
## attack_speed

```lua
number
```

攻速数值  
为物品携带者提供的额外攻击速度的倍数值
## auto_use

```lua
boolean
```

自动使用  
勾选后获得该物品时会自动使用该物品，如果不满足该物品的主动技能消耗条件则无法拾取
## base_color_mod

```lua
number
```

## base_tint_color

```lua
any[]
```

## body_size

```lua
number
```

尺寸  
物品模型的缩放比例
## buy_res_list

```lua
any[]
```

购买所需资源  
从商店里购买这件物品所需要的资源
## can_sell

```lua
boolean
```

## cd_reduce

```lua
number
```

冷却缩减  
为物品携带者提供的额外冷却缩短的百分比
## cd_type

```lua
string
```

CD组  
该物品所在的CD组，物品使用时会使单位持有的相同CD组内所有物品进入使用物品的主动技能冷却
## compose_list

```lua
any[]
```

合成素材  
合成这件物品所需要的材料，拥有所有合成原料后会自动合成该物品
## compose_sfx

```lua
number
```

## critical_chance

```lua
number
```

暴击率  
为物品携带者提供的额外暴击率
## critical_dmg

```lua
number
```

暴击效果数值  
为物品携带者提供的额外暴击伤害的倍率。发生暴击时，造成的暴击伤害倍数
## cur_charge

```lua
number
```

物品创建后的初始充能层数
## cur_stack

```lua
number
```

物品创建后的初始堆叠层数
## defense_mag

```lua
number
```

法防数值  
为物品携带者提供的额外法术防御力的数值
## defense_phy

```lua
number
```

物防数值  
为物品携带者提供的额外物理防御力的数值
## delete_on_discard

```lua
boolean
```

物品在地面上是否会自动销毁
## description

```lua
number
```

描述  
描述
## disable_overlapping

```lua
boolean
```

开启后物品与物品之间会发生碰撞，可以防止物品堆叠在一起。碰撞范围设置在游戏规则-通用-物品碰撞范围中。
## discard_enable

```lua
boolean
```

可以遗弃  
玩家是否可以将物品丢弃到地面
## discard_when_dead

```lua
boolean
```

持有者死亡时掉落  
物品是否会在携带者死亡时掉落地面
## dmg_reduction

```lua
number
```

受到伤害减免比例  
为物品携带者提供的额外伤害减免
## dodge_rate

```lua
number
```

躲避率  
为物品携带者提供的额外闪避率
## drop_stay_time

```lua
number
```

消失时间  
掉落在地面上的消失时间
## effect_button

```lua
any
```

合成效果编辑按钮  
## effect_list

```lua
any[]
```

获得特效列表
## extra_dmg

```lua
number
```

所有伤害加成(%)  
为物品携带者提供的额外伤害加成
## fresnel_exp

```lua
number
```

## gold_cost

```lua
number
```

## heal_effect

```lua
number
```

被治疗效果提升(%)  
为物品携带者提供的额外受到治疗增益加成
## hit_rate

```lua
number
```

命中率  
为物品携带者提供的额外命中率
## hp_max

```lua
number
```

最大生命值  
生命值
## hp_rec

```lua
number
```

生命恢复  
为物品携带者提供的额外每秒恢复生命值
## icon

```lua
number
```

图标  
物品的头像
## init_stock

```lua
number
```

初始库存  
物品作为商品时在商店中的初始可购买数
## intelligence

```lua
number
```

智力  
为物品携带者提供的额外智力
## item_billboard_type

```lua
number
```

鼠标悬浮到物品上时显示的名称样式
## key

```lua
number
```

ID  
ID
## kv

```lua
Object.Item.Kv
```

玩家自定义  
## level

```lua
number
```

等级  
物品的等级
## material_color

```lua
any[]
```

## material_color_intensity

```lua
number
```

## max_stock

```lua
number
```

最大库存  
物品作为商品时在商店中的最大可购买数
## maximum_charging

```lua
number
```

最大充能数  
物品可以设置的最大充能层数
## maximum_stacking

```lua
number
```

最大堆叠  
物品可以叠加的最大堆叠层数。重复获得物品时，在不大于该值的情况下物品会自动堆叠。
## model

```lua
number
```

模型  
模型
## model_opacity

```lua
number
```

## mp_max

```lua
number
```

最大技能资源  
为物品携带者提供的额外最大法力值
## mp_rec

```lua
number
```

技能资源恢复  
为物品携带者提供的额外的每秒法力恢复值
## name

```lua
string|integer
```

名称  
名称
## non_zero_stacking

```lua
boolean
```

## pene_mag

```lua
number
```

法穿数值  
为物品携带者提供的额外法术穿透。先计算固定穿透，再计算百分比穿透
## pene_mag_ratio

```lua
number
```

法术穿透(%)  
为物品携带者提供的额外百分比法术穿透。先计算固定穿透，再计算百分比穿透
## pene_phy

```lua
number
```

物穿数值  
为物品携带者提供的额外物理穿透。先计算固定穿透，再计算百分比穿透
## pene_phy_ratio

```lua
number
```

无视目标物抗百分比  
为物品携带者提供的额外百分比物理穿透。先计算固定穿透，再计算百分比穿透
## precondition_list

```lua
any[]
```

前置条件  
只有满足对应条件之后物品才会在商店中可购买。
## refresh_interval

```lua
number
```

库存恢复间隔  
当前物品作为商品时，商店库存增加的间隔时间
## sale_enable

```lua
boolean
```

可以被抵押  
是否可以将该物品出售到商店
## sell_gold

```lua
number
```

## sell_res_list

```lua
any[]
```

出售获得资源  
出售到商店时获得的资源
## sound_event_list

```lua
any[]
```

可以设置触发指定事件时播放的声音
## source_player_prop

```lua
string
```

## stack_type

```lua
number
```

堆叠类型  
物品的堆叠或者充能逻辑。
## start_rft

```lua
number
```

购买开始时间  
游戏开始后多长时间才能购买该类物品
## strength

```lua
number
```

力量  
力量
## suffix

```lua
string
```

编辑器后缀  
编辑器后缀
## tags

```lua
any[]
```

标签  
用于对物体的分类处理。为单位贴上标签后可以对其进行更方便的关系，例如编写游戏逻辑：杀死所有拥有XX标签的单位
## uid

```lua
string
```

UID  
UID
## use_consume

```lua
number
```

使用消耗次数  
物品是堆叠类型时，每次使用该物品消耗的堆叠层数

# Object.Item.Kv


# Object.Unit

## affect_techs

```lua
any[]
```

应用科技  
单位的可应用科技（会受到该科技的影响）
## agility

```lua
number
```

敏捷  
敏捷
## agility_grow

```lua
number
```

敏捷  
敏捷
## alarm_range

```lua
number
```

锁敌范围  
单位的警戒范围(AI)
## angle_tolerance

```lua
number
```

当单位转向时，如果转向角度小于该值，则移速不会受影响。
## armor_type

```lua
number
```

防御类型  
单位的护甲类型，具体效果可在游戏规则中查看
## attack_interval

```lua
number
```

攻击间隔  
单位两次普通攻击之前间隔的秒数，当普攻技能替换为自定义类型时，会使用技能的冷却时间
## attack_interval_grow

```lua
number
```

两次普通攻击之间的间隔时间
## attack_mag

```lua
number
```

法攻数值  
单位的法术攻击力
## attack_mag_grow

```lua
number
```

法术攻击力  
单位的法术攻击力
## attack_phy

```lua
number
```

物攻数值  
单位的物理攻击力
## attack_phy_grow

```lua
number
```

物理攻击力  
单位的物理攻击力
## attack_range

```lua
number
```

攻击范围  
单位可以攻击攻击范围内的可见单位，当普攻技能替换为自定义类型时，会使用技能的释放范围
## attack_range_grow

```lua
number
```

普通攻击的攻击范围
## attack_speed

```lua
number
```

攻速数值  
单位的攻击速度百分比，局内显示的实际攻速为:1/单位当前普通攻击技能冷却时间*攻击速度
## attack_speed_grow

```lua
number
```

攻击速度(%)  
攻击速度(倍数)
## attack_type

```lua
number
```

攻击类型  
单位的攻击类型，具体效果可在游戏规则中查看
## back_range

```lua
number
```

## bar_show_name

```lua
string|integer
```

头顶名称显示方式  
影响游戏内物体上方的文本显示内容。
## bar_show_scale

```lua
boolean
```

是否显示血条刻度  
单位血条上是否会出现刻度线
## bar_show_title

```lua
boolean
```

## bar_slot_size

```lua
number
```

物品栏  
单位的物品栏格数
## bar_title_style

```lua
number
```

## base_tint_color

```lua
any[]
```

## billboard_height_offset

```lua
number
```

单位血条高度偏移  
## billboard_name_font

```lua
string
```

头顶名称字体  
在单位头顶显示的文字字体
## billboard_scale_x

```lua
number
```

x轴缩放  
## billboard_scale_y

```lua
number
```

y轴缩放  
## blood_bar

```lua
number
```

血条样式  
该单位在游戏内的血条样式
## blood_show_type

```lua
number
```

血条显示模式  
该单位在游戏内的血条的显示时机
## body_size

```lua
number
```

模型缩放  
对当前物体模型的缩放倍数，用于调整模型大小。
## box_angle

```lua
number
```

夹角  
## box_r

```lua
number
```

半径  
## box_type

```lua
number
```

盒子类型  
## build_precondition_list

```lua
any[]
```

## build_res_cost_list

```lua
any[]
```

资源消耗  
单位作为建筑时建造会消耗的资源
## building_rotatable

```lua
boolean
```

## buy_res_list

```lua
any[]
```

购买所需资源  
单位作为商品的购买所需资源
## can_flee

```lua
boolean
```

无法反击时会逃跑  
当单位受到伤害且自身无法反击时，会向伤害来源的相反方向移动一段距离，仅在警戒状态下生效
## cancel_alarm_range

```lua
number
```

解除锁定范围  
单位的取消警戒范围(AI)，敌方离开取消警戒范围后会不再主动攻击敌方
## cd_reduce

```lua
number
```

冷却缩减  
单位技能进入cd时减少部分冷却时间
## cd_reduce_grow

```lua
number
```

冷却缩减(%)  
单位技能进入cd时减少部分冷却时间
## collision

```lua
number
```

碰撞  
## collision_box_turning_enable

```lua
boolean
```

静态碰撞跟随面向  
仅对建筑类型单位生效。勾选时，单位改变朝向时会使静态碰撞跟随旋转。
## collision_points

```lua
any[]
```

## combat_range

```lua
number
```

## common_ability_list

```lua
any[]
```

通用技能  
单位的通用技能。在默认UI界面中，会显示在前6个技能栏内，超出的不显示但依然生效。
## common_atk

```lua
any[]
```

普攻  
单位的普通攻击，唯一，单位对目标普通攻击时释放的技能
## common_atk_type

```lua
number
```

单位普通攻击的类型，选择自定义需要绑定技能
## copper_coin

```lua
number
```

## critical_chance

```lua
number
```

暴击率  
单位普通攻击有概率造成额外伤害
## critical_chance_grow

```lua
number
```

暴击率(%)  
单位普通攻击有概率造成额外伤害
## critical_dmg

```lua
number
```

暴击效果数值  
发生暴击时，造成的暴击伤害倍数
## critical_dmg_grow

```lua
number
```

暴击伤害(%)  
发生暴击时，造成的暴击伤害倍数
## custom_1_grow

```lua
number
```

## custom_2_grow

```lua
number
```

## custom_5_grow

```lua
number
```

## custom_6_grow

```lua
number
```

## custom_7_grow

```lua
number
```

## default_behaviour_type

```lua
string
```

默认行为  
单位默认状态下会执行的行为
## defense_mag

```lua
number
```

法防数值  
单位的法术防御力
## defense_mag_grow

```lua
number
```

法术防御力  
单位的法术防御力
## defense_phy

```lua
number
```

物防数值  
单位的物理防御力
## defense_phy_grow

```lua
number
```

物理防御力  
单位的物理防御力
## description

```lua
number
```

描述  
单位的介绍说明，用在编辑器内和游戏内的Tips显示上
## destroy_after_die

```lua
boolean
```

死亡后是否销毁单位  
死亡后是否会把单位完全销毁。（会在尸体消失时间结束后进行销毁，销毁后将无法再获取单位相关信息）
## die_anim

```lua
string
```

死亡  
死亡状态下会播放的动画
## disk_shadow_size

```lua
number
```

## dmg_reduction

```lua
number
```

受到伤害减免比例  
百分比降低受到的伤害
## dmg_reduction_grow

```lua
number
```

伤害减免(%)  
百分比降低受到的伤害
## dodge_rate

```lua
number
```

躲避率  
单位躲避其他单位普通攻击的概率
## dodge_rate_grow

```lua
number
```

躲避率(%)  
单位躲避其他单位普通攻击的概率
## drop_item

```lua
any[]
```

死亡后掉落物品  
## drop_items_tuple

```lua
any[]
```

掉落物品  
单位死亡后会掉落的物品
## dye_color

```lua
string
```

换色颜色  
## dye_color_plan

```lua
number
```

换色方式  
## dynamic_collision_r

```lua
number
```

碰撞动态半径  
碰撞动态半径，每50为1个标准格。
## dynamic_collision_type

```lua
number
```

动态碰撞类型  
## dynamic_collision_x

```lua
number
```

碰撞宽度  
## dynamic_collision_z

```lua
number
```

碰撞长度  
## enemy_mini_map_icon

```lua
number
```

敌方小地图头像  
## extra_dmg

```lua
number
```

所有伤害加成(%)  
百分比提高造成的伤害
## extra_dmg_grow

```lua
number
```

所有伤害加成(%)  
百分比提高造成的伤害
## force_show_on_mini_map

```lua
boolean
```

强制显示在小地图  
勾选后单位将强制显示在小地图上，无视战争阴影
## fresnel_exp

```lua
number
```

## gainvalue

```lua
number
```

技能伤害加成(%)  
该字段并无实际效果
## gainvalue_grow

```lua
number
```

技能伤害加成(%)  
该字段并无实际效果
## gold_coin

```lua
number
```

## has_mp

```lua
boolean
```

是否有技能资源条  
该单位是否有可以用来释放技能的能量
## has_shield

```lua
boolean
```

是否显示白色护盾值  
## heal_effect

```lua
number
```

被治疗效果加成(%)  
提高接受治疗时受到的治疗效果
## heal_effect_grow

```lua
number
```

被治疗效果提升(%)  
提高接受治疗时受到的治疗效果
## healing_effect

```lua
number
```

当单位受到治疗效果时，提升治疗量
## healing_effect_grow

```lua
number
```

## hero_ability_list

```lua
any[]
```

英雄技能  
单位的英雄技能，可以通过学习升级，每次学习需要消耗一个技能点（升级时获取）。在默认UI界面中，会显示在后6个技能栏内，超出的不显示但依然生效。
## hit_rate

```lua
number
```

命中率  
单位普通攻击命中其他单位的概率
## hit_rate_grow

```lua
number
```

命中率(%)  
单位普通攻击命中其他单位的概率
## hp_max

```lua
number
```

最大生命值  
单位的最大生命值
## hp_max_grow

```lua
number
```

最大生命值  
单位的最大生命值
## hp_rec

```lua
number
```

生命恢复  
单位的每秒生命恢复数值
## hp_rec_grow

```lua
number
```

生命恢复  
单位的每秒生命恢复数值
## icon

```lua
number
```

头像  
单位在游戏中显示的头像
## idle_anim

```lua
string
```

默认状态  
默认状态下会播放的动画
## init_stock

```lua
number
```

初始库存  
单位作为商品的初始库存
## intelligence

```lua
number
```

智力  
智力
## intelligence_grow

```lua
number
```

智力  
智力
## is_apply_role_color

```lua
boolean
```

是否应用玩家颜色光圈  
## is_mini_map_show

```lua
boolean
```

是否在小地图显示  
单位是否会在小地图上显示出来
## is_open_Xray

```lua
boolean
```

勾选后如果该单位被遮挡，会看到该单位的描边
## is_open_outline_pass

```lua
boolean
```

是否开启描边  
## is_shop

```lua
boolean
```

是否做为商店  
开启后单位可以作为商店编辑出售的物品
## keep_dead_body_time

```lua
number
```

尸体消失时间  
尸体消失时间
## keep_target

```lua
boolean
```

无法移动时仍然保持目标  
该字段未勾选时，在目标移动出自身的警戒范围后，且自身不能移动时，会立即开始寻找一个新的攻击目标。多用于定点守卫。
## key

```lua
number
```

ID  
单位的唯一表示
## kv

```lua
Object.Unit.Kv
```

玩家自定义  
## level

```lua
number
```

等级  
单位的默认等级
## logic_rotate_speed_valid

```lua
boolean
```

## logic_upper_rotate_speed_valid

```lua
boolean
```

## main_attr

```lua
string
```

主属性  
英雄单位的主要属性，一般主属性的提升会对英雄有额外加成
## max_stock

```lua
number
```

最大库存  
单位作为商品的最大库存
## mini_map_icon

```lua
number
```

小地图头像  
单位在小地图上的头像
## mini_map_icon_scale

```lua
number
```

小地图头像缩放  
单位在小地图上的头像的缩放
## model

```lua
number
```

模型  
当前单位所使用的的模型
## model_height

```lua
number
```

离地高度  
单位的离地高度
## model_opacity

```lua
number
```

## move_channel

```lua
number
```

移动类型  
单位的移动类型，决定单位究竟是在地面移动还是在空中移动。
## move_limitation

```lua
number
```

可移动通道  
对单位移动类型的补充，决定单位究竟是在哪些通道移动。任意通道被碰撞阻挡该单位均无法通过。
## move_type

```lua
number
```

移动类型  
影响可用的可移动通道。
## mp_color

```lua
string
```

技能资源条颜色  
该单位用来释放技能的能量的颜色
## mp_key

```lua
string
```

技能资源类型标识  
该单位用来释放技能的能量的名称
## mp_max

```lua
number
```

最大技能资源  
单位的最大技能资源
## mp_max_grow

```lua
number
```

最大技能资源  
单位的最大技能资源
## mp_rec

```lua
number
```

技能资源恢复  
单位的每秒技能资源恢复数值
## mp_rec_grow

```lua
number
```

技能资源恢复  
单位的每秒技能资源恢复数值
## name

```lua
string|integer
```

名称  
当前单位的名称
## need_preview_billboard

```lua
boolean
```

## ori_bits

```lua
number
```

单位状态  
进入游戏时，为单位附加的初始状态
## ori_speed

```lua
number
```

移速数值  
单位每秒移动的距离。
## ori_speed_grow

```lua
number
```

移动速度  
单位每秒移动的距离。
## passive_ability_list

```lua
any[]
```

被动技能列表  
隐藏技能，放在这类技能位中的技能将不会被显示在游戏中。
## pene_mag

```lua
number
```

法穿数值  
穿透敌人法术防御力。先计算固定穿透，再计算百分比穿透
## pene_mag_grow

```lua
number
```

法术穿透  
穿透敌人法术防御力。先计算固定穿透，再计算百分比穿透
## pene_mag_ratio

```lua
number
```

法术穿透(%)  
百分比穿透敌人法术防御力。先计算固定穿透，再计算百分比穿透
## pene_mag_ratio_grow

```lua
number
```

法术穿透(%)  
百分比穿透敌人法术防御力。先计算固定穿透，再计算百分比穿透
## pene_phy

```lua
number
```

物穿数值  
穿透敌人物理防御力。先计算固定穿透，再计算百分比穿透
## pene_phy_grow

```lua
number
```

物理穿透  
穿透敌人物理防御力。先计算固定穿透，再计算百分比穿透
## pene_phy_ratio

```lua
number
```

无视目标物抗百分比  
百分比穿透敌人物理防御力。先计算固定穿透，再计算百分比穿透
## pene_phy_ratio_grow

```lua
number
```

物理穿透(%)  
百分比穿透敌人物理防御力。先计算固定穿透，再计算百分比穿透
## pkg_slot_size

```lua
number
```

背包栏  
单位的背包栏格数
## precondition_list

```lua
any[]
```

前置条件  
训练、购买、建造该单位的前置条件
## preview_billboard_health_value

```lua
number
```

## refresh_interval

```lua
number
```

库存恢复间隔  
单位作为商品的库存恢复间隔
## research_techs

```lua
any[]
```

可研发科技  
这些科技，可以在单位身上研发、升级。
## resilience

```lua
number
```

韧性(%)  
该字段并无实际效果
## resilience_grow

```lua
number
```

韧性(%)  
该字段并无实际效果
## reward_exp

```lua
number
```

该单位被击杀后提供的经验奖励
## role_color_scale

```lua
number
```

玩家颜色缩放  
## rotate_speed

```lua
number
```

转身速度(弧度)  
单位的转身速度
## scale

```lua
number
```

## sell_list

```lua
any[]
```

出售列表  
单位作为商店时的出售列表
## sell_res_list

```lua
any[]
```

出售获得资源  
单位作为商品的出售获得资源
## separate_enemy_icon

```lua
boolean
```

是否敌友方显示不同头像  
## shop_camp_args

```lua
number
```

出售阵营参数  
## shop_key

```lua
any[]
```

商店组件  
## shop_range

```lua
number
```

出售范围  
## shop_select

```lua
boolean
```

打开同时选中  
## shop_sell_type

```lua
number
```

出售阵营类型  
## show_y3_extra_info

```lua
boolean
```

悬浮信息显示  
开启后鼠标悬浮到单位身上时会显示单位名称和等级的文本框
## silver_coin

```lua
number
```

## simple_common_atk

```lua
Object.Unit.SimpleCommonAtk
```

## sound_event_list

```lua
any[]
```

可以设置触发指定事件时播放的声音
## special_idle_anim

```lua
string
```

特殊状态  
特殊状态下会播放的动画
## speed_ratio_in_turn

```lua
number
```

当单位转向时，移动速度会受到一定的影响
## standard_walk_rate

```lua
number
```

移动动画播放速率系数  
单位移动时动画的播放速度
## start_rft

```lua
number
```

购买开始时间  
单位作为商品的可购买时间(游戏开始多久后可以购买）
## strength

```lua
number
```

力量  
力量
## strength_grow

```lua
number
```

力量  
力量
## suffix

```lua
string
```

编辑器后缀  
给使用编辑器的用户看的备注，无实际作用
## support_range

```lua
number
```

## tags

```lua
any[]
```

标签  
用于对物体的分类处理。为单位贴上标签后可以对其进行更方便的关系，例如编写游戏逻辑：杀死所有拥有XX标签的单位
## theme

```lua
number
```

主题  
## title_bg_opacity

```lua
number
```

## title_bg_scale

```lua
number
```

## title_font_type

```lua
string
```

## title_scale

```lua
number
```

## title_text_size

```lua
number
```

## turn_speed

```lua
number
```

## type

```lua
number
```

主类型  
单位类型决定了这类单位的一些特性，包括其可编辑的属性和某些属性的默认值。
## uid

```lua
string
```

UID  
## unit_hold_angle_speed

```lua
number
```

## unit_title

```lua
string
```

## use_base_tint_color

```lua
boolean
```

## use_simple_mini_map_icon

```lua
boolean
```

使用简易小地图头像  
简易小地图头像的表现为一个小点。简易小地图头像的绘制性能消耗相比普通小地图头像更小，如果地图上会出现大量的该类型单位，建议使用简易小地图头像。
## vampire_mag

```lua
number
```

法术吸血数值  
造成法术伤害后可以恢复自身生命值
## vampire_mag_grow

```lua
number
```

法术吸血(%)  
造成法术伤害后可以恢复自身生命值
## vampire_phy

```lua
number
```

物理吸血数值  
造成物理伤害后可以恢复自身生命值
## vampire_phy_grow

```lua
number
```

物理吸血(%)  
造成物理伤害后可以恢复自身生命值
## vect_drawing

```lua
number
```

立绘  
## view_type

```lua
number
```

视野类型  
单位与战争迷雾相关的一些属性
## vision_night

```lua
number
```

夜晚视野  
单位在夜晚可以看到（驱散战争迷雾）的范围
## vision_night_grow

```lua
number
```

## vision_rng

```lua
number
```

白天视野  
单位在白天可以看到（驱散战争迷雾）的范围
## vision_rng_grow

```lua
number
```

## vision_sector_angle_day

```lua
number
```

扇形视野白天夹角  
单位在白天拥有的扇形视野夹角。
## vision_sector_angle_day_grow

```lua
number
```

## vision_sector_angle_night

```lua
number
```

扇形视野夜晚夹角  
单位在夜晚拥有的扇形视野夹角。
## vision_sector_angle_night_grow

```lua
number
```

## vision_sector_night

```lua
number
```

扇形视野夜晚半径  
单位在夜晚拥有的扇形视野半径。
## vision_sector_night_grow

```lua
number
```

## vision_sector_rng

```lua
number
```

扇形视野白天半径  
单位在白天拥有的扇形视野半径。
## vision_sector_rng_grow

```lua
number
```

## vision_true

```lua
number
```

真实视野  
单位所能侦测到隐身单位的范围
## vision_true_grow

```lua
number
```

单位所能侦测到隐身单位的范围
## walk_anim

```lua
string
```

行走  
行走状态下会播放的动作

# Object.Unit.Kv


# Object.Unit.SimpleCommonAtk

## ability_animations

```lua
any[]
```

## ability_bw_point

```lua
number
```

后摇时长  
## ability_cast_point

```lua
number
```

前摇时长  
## attack_trajectory

```lua
Object.Unit.SimpleCommonAtk.AttackTrajectory
```

## cast_effect_list

```lua
any[]
```

## cast_sound

```lua
number
```

## critical_anim

```lua
string
```

## damage

```lua
any[]
```

## damage_type

```lua
number
```

## filter_condition_camp

```lua
number
```

索敌条件 - 阵营  
## filter_condition_type

```lua
number
```

索敌条件 - 类型  
## hit_effect

```lua
Object.Unit.SimpleCommonAtk.HitEffect
```

## hit_sound

```lua
number
```

## order_play_anim

```lua
boolean
```

## order_play_reset_time

```lua
number
```

## trajectory_radian

```lua
number
```

## trajectory_speed

```lua
number
```


# Object.Unit.SimpleCommonAtk.AttackTrajectory

## effect

```lua
number
```

## follow_scale

```lua
boolean
```

## scale

```lua
number
```

## socket

```lua
string
```


# Object.Unit.SimpleCommonAtk.HitEffect

## effect

```lua
number
```

## follow_scale

```lua
boolean
```

## scale

```lua
number
```

## socket

```lua
string
```


