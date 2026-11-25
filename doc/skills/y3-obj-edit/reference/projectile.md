# 投射物脚本参数参考（Projectile）

本文只说明 `<agent>/skills/y3-obj-edit/scripts/y3_obj_edit.py` 当前对 `-type projectile` 实际处理的脚本参数。
完整投射物物编字段、字段语义和更细枚举请参考：`<agent>/knowledge/物编系统/03-投射物.md`（相对链接：[`../../../knowledge/物编系统/03-投射物.md`](../../../knowledge/物编系统/03-投射物.md)）。

- 对应脚本：`<agent>/skills/y3-obj-edit/scripts/y3_obj_edit.py`
- 对应类型：`-type projectile`


## 辅助使用规范（非脚本字段参数）

以下内容用于规划投射物 ID 和选择常用特效；它们不是 `y3_obj_edit.py` 的新增命令行参数。

### 投射物 ID 规划

常用做法是把投射物 ID 编排为：

```text
[英雄ID][2][序号]
  100001  2  01
     ↓    ↓   ↓
   英雄  弹道  基础
```

| 英雄 | 弹道 1 | 弹道 2 | 弹道 3 |
|---|---:|---:|---:|
| 洛坦 (`100001`) | `100001201` | `100001202` | `100001203` |
| 莉莉娅 (`100002`) | `100002201` | `100002202` | `100002203` |

### 常用特效 ID

| 特效 ID | 说明 |
|---:|---|
| `102892` | 紫色弹道 |
| `102247` | 蓝色弹道 |
| `101291` | 火焰弹道 |
| `105525` | 能量球 |

`-effect_foes` / `-effect_friend` 只传特效 ID；脚本当前只替换对应特效 tuple 的主 ID。

## 基本命令

```bash
# 创建投射物
py -3 <agent>/skills/y3-obj-edit/scripts/y3_obj_edit.py -map maps/EntryMap -type projectile -create "100001201,火球,100000" [字段参数...]

# 编辑已有投射物
py -3 <agent>/skills/y3-obj-edit/scripts/y3_obj_edit.py -map maps/EntryMap -type projectile -edit 100001201 [字段参数...]
```

## 创建参数格式

| 参数 | 格式 | 说明 |
|---|---|---|
| `-create` | `"投射物ID,名称,图标ID"` | 创建投射物；名称写入多语言，图标 ID 写入 `icon`。 |
| `-edit` | `投射物ID` | 编辑已有投射物；与 `-create` 二选一。 |
| `-map` | 地图路径 | 例如 `maps/EntryMap`。 |
| `-type` | `projectile` | 固定写 `projectile`。 |

创建时：`-create` 的名称和图标 ID 已分别用于初始化 `name`、`icon`；如同时传入下表字段参数，脚本会按当前实现继续覆盖对应字段。`-description` 不填时默认使用名称作为描述。

## 当前脚本支持的字段参数表

| 参数 | 写入字段 | 脚本解析类型 | 说明 |
|---|---|---|---|
| `-name` | `name` | 字符串 | 更新名称多语言 TID；常用于 `-edit`。 |
| `-description` | `description` | 字符串 | 更新描述多语言 TID；创建时不传则默认使用名称。 |
| `-icon` | `icon` | 整数 | 投射物图标 ID；创建时图标来自 `-create` 第 3 段。 |
| `-max_duration` | `max_duration` | 浮点数 | 最大持续时间。 |
| `-move_channel` | `move_channel` | 整数 | 移动通道；常用取值见下方。 |
| `-move_limitation` | `move_limitation` | 整数 | 移动限制位掩码；常用取值见下方。 |
| `-sfx_loop` | `sfx_loop` | 布尔 | 特效是否循环。 |
| `-effect_foes` | `effect_foes` | 特效 ID | 对敌特效；脚本只替换现有 `items[0]`。 |
| `-effect_friend` | `effect_friend` | 特效 ID | 对友特效；脚本只替换现有 `items[0]`。 |

## 常用枚举或取值说明

### 布尔参数

`-sfx_loop` 可写：`true/false`、`1/0`、`yes/no`。

### 特效 ID 参数

`-effect_foes`、`-effect_friend` 传整数特效 ID。脚本当前只修改对应字段里已有结构的 `items[0]`，保留其他已有配置。

### 移动相关参数

`-move_channel`：`0` 表示地面通道，`1` 表示空中通道。

`-move_limitation` 是位掩码：

| 通道 | 位值 | 含义 |
|---|---|---|
| 地面通道 | `1` | 陆地 |
| 地面通道 | `2` | 物件 |
| 地面通道 | `4` | 海洋 |
| 地面通道 | `8` | 悬崖 |
| 空中通道 | `1` | 空中 |

可通过相加组合地面通道限制，例如 `5` 表示陆地 + 海洋。

## 常用示例命令

```bash
# 创建火球投射物
py -3 <agent>/skills/y3-obj-edit/scripts/y3_obj_edit.py -map maps/EntryMap -type projectile -create "100001201,火球,100000" -max_duration 5.0 -sfx_loop true -effect_foes 102892

# 创建短持续时间投射物并设置移动参数
py -3 <agent>/skills/y3-obj-edit/scripts/y3_obj_edit.py -map maps/EntryMap -type projectile -create "100001202,冰锥,100001" -max_duration 3.0 -move_channel 1 -move_limitation 1

# 编辑已有投射物特效和描述
py -3 <agent>/skills/y3-obj-edit/scripts/y3_obj_edit.py -map maps/EntryMap -type projectile -edit 100001201 -description "向前飞行的火焰弹道" -effect_friend 102247
```






