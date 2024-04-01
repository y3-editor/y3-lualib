# Math

数学库

均使用角度制

## acos

```lua
function Math.acos(value: number)
  -> float: number
```

反余弦（角度制）

@*param* `value` — 实数

@*return* `float` — 实数
## asin

```lua
function Math.asin(value: number)
  -> float: number
```

反正弦（角度制）

@*param* `value` — 实数

@*return* `float` — 实数
## atan

```lua
function Math.atan(y: number, x: number)
  -> float: number
```

反正切（角度制）

@*return* `float` — 实数
## cos

```lua
function Math.cos(value: number)
  -> float: number
```

余弦（角度制）

@*param* `value` — 实数

@*return* `float` — 实数
## get_random_angle

```lua
function Math.get_random_angle()
  -> number
```

获取随机角度
## get_random_seed

```lua
function Math.get_random_seed()
  -> seed: integer
```

获取随机种子

@*return* `seed` — 随机种子
## includedAngle

```lua
function Math.includedAngle(r1: number, r2: number)
  -> angle: number
  2. direction: number
```

计算2个角度之间的夹角（角度制）

@*return* `angle` — 夹角，取值范围[0, 180]

@*return* `direction` — 方向，1为顺时针，-1为逆时针
## isBetween

```lua
function Math.isBetween(number: number, min: number, max: number)
  -> boolean
```

 检查数字是否在[min, max]范围内
## random_float

```lua
function Math.random_float(min: number, max: number)
  -> float: number
```

范围内随机实数

@*param* `min` — 范围内最小实数

@*param* `max` — 范围内最大实数

@*return* `float` — 随机实数
## sin

```lua
function Math.sin(value: number)
  -> float: number
```

正弦（角度制）

@*param* `value` — 实数

@*return* `float` — 实数
## tan

```lua
function Math.tan(value: number)
  -> float: number
```

正切（角度制）

@*param* `value` — 实数

@*return* `float` — 实数

