# HealInstance

治疗实例

在治疗相关的事件中传递

## data

```lua
EventParam.单位-受到治疗后
```

## get_ability

```lua
(method) HealInstance:get_ability()
  -> Ability?
```

 获取关联技能
## get_heal

```lua
(method) HealInstance:get_heal()
  -> number
```

 获取当前治疗
## mode

```lua
'治疗前'|'治疗后'|'治疗时'
```

## set_heal

```lua
(method) HealInstance:set_heal(value: number)
```

 修改当前治疗

