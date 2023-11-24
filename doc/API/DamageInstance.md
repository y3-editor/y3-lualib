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
## get_damage

```lua
(method) DamageInstance:get_damage()
  -> number
```

 获取当前伤害
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

