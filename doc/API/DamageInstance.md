# DamageInstance

伤害实例

会在伤害相关的事件中传递

## data

```lua
EventParam.单位-受到伤害后
```

## get_ability

```lua
(method) DamageInstance:get_ability()
  -> Ability?
```

 获取关联技能
## get_attack_type

```lua
(method) DamageInstance:get_attack_type()
  -> unknown
```

## get_damage

```lua
(method) DamageInstance:get_damage()
  -> number
```

 获取当前伤害
## get_damage_type

```lua
(method) DamageInstance:get_damage_type()
  -> unknown
```

## is_critical

```lua
(method) DamageInstance:is_critical()
  -> boolean
```

 获取当前伤害是否暴击
## is_missed

```lua
(method) DamageInstance:is_missed()
  -> boolean
```

 获取当前伤害是否闪避
## mode

```lua
'伤害前'|'伤害后'|'伤害时'
```

## origin_damage

```lua
number
```

记录一下最开始的原始伤害
## set_critical

```lua
(method) DamageInstance:set_critical(critical: boolean)
```

 设置当前伤害是否暴击
## set_damage

```lua
(method) DamageInstance:set_damage(damage: number)
```

 修改当前伤害
## set_missed

```lua
(method) DamageInstance:set_missed(missed: boolean)
```

 设置当前伤害是否闪避

