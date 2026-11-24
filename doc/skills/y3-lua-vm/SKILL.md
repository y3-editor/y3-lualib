---
name: y3-lua-vm
description: >
  Y3 的 Lua 5.4 定制虚拟机：定点数精度、pairs 遍历顺序保证、math.random / os.clock 语义、
  平台禁用的系统函数清单、平台受限接口（io.open / debug.*）与写代码时的规避方式。

  ALWAYS use this skill when user mentions: 定点数、浮点数精度、pairs 顺序、遍历顺序、
  sortPairs、math.random 一致性、os.clock、os.clock_banned、dofile、loadfile、
  io.open 限制、debug.getinfo、debug.setmetatable、平台禁用函数、Lua 5.4 定制、
  跨平台一致性、序列化精度、数值误差。
---

# Y3 Lua 虚拟机（5.4 定制）

引擎内嵌 Lua 5.4，并针对跨平台一致性与安全性做了定制。写业务代码前先确认下面几处差异，避免在本地正常、上平台报错或数值不一致。

## 1. 定点数（实数不再是浮点数）

- 实数由浮点数改成**定点数**，目的是保证跨平台运算一致
- 精度：约 **13 位十进制数**，有效位数约 **9 位**（原生浮点是 308 位 / 15 位有效）
- 性能：略低于浮点，因为浮点由硬件实现
- 习惯上仍叫「浮点数」

实践要点：

- 更容易观察到精度问题——**不要用实数做等值比较**，比较时带容差（按业务精度定，例如 `math.abs(a - b) < 1e-6`）
- 大数值（生命值、伤害）跨过 9 位有效数字后开始失真，需要「大数字」方案时用字符串/分段表示，不要依赖实数
- 序列化到存档/网络时避免依赖末位小数，先按业务精度取整

## 2. 表遍历顺序

若一张表的**所有索引均为数字或字符串**且**插入顺序一致**，`pairs` / `next` 的遍历顺序是稳定的；否则不保证。

- 同步上下文里遍历一律用 `y3.util.sortPairs`（会做排序后再遍历），避免不同端顺序不同导致状态分叉
- 本地帧遍历若顺序敏感，同样用 `sortPairs`
- 混用数字键与字符串键、或插入顺序不一致的表，不要依赖 `pairs` 的结果顺序

## 3. math.random

`math.random` 换成引擎实现，保证**所有玩家之间结果一致**。不要自己实现随机数发生器，也不要用 `os.time()` 之类做种子。

## 4. os.clock

- `os.clock` 返回**逻辑时间**（游戏时间），用于业务计时
- 需要真实 CPU 时钟时用 `os.clock_banned`（调试/性能测量用，业务不要依赖）

## 5. 平台禁用（置为 nil）的函数

以下函数**只在开发模式可用**，平台运行地图时全部为 `nil`，直接调用会 `attempt to call a nil value`：

| 分类 | 函数 |
|---|---|
| 加载 | `dofile`、`loadfile`、`package.loadlib` |
| debug | `debug.debug`、`gethook`、`getlocal`、`getmetatable`、`getregistry`、`getupvalue`、`getuservalue`、`sethook`、`setlocal`、`setupvalue`、`setuservalue`、`upvaluejoin` |
| io | `io.close`、`flush`、`input`、`lines`、`output`、`popen`、`read`、`stdin`、`stdout`、`tmpfile`、`write` |
| os | `os.execute`、`exit`、`getenv`、`remove`、`rename`、`setlocale`、`tmpname` |

写代码约束：

- 业务逻辑不得依赖上表任何函数；调试脚本里也要用 `if y3.game.is_debug_mode() then ... end` 包裹
- 「读本地文件」不要用 `dofile` / `loadfile`，用 `io.open`（见下）或配表
- 需要环境判断时用引擎提供的 `y3.game.is_debug_mode()`，不要用 `os.getenv`

## 6. 平台受限（不会被置 nil，但行为变化）

| 接口 | 平台行为 |
|---|---|
| `io.open` | 不能用绝对路径；路径不能含 `..`；相对路径基于地图的 `custom` 目录 |
| `io.open` | **不能用 `r` 模式读文件** |
| `debug.getinfo` | 返回的表不含 `func` 字段 |
| `debug.setmetatable` | 对 `table` / `userdata` 使用时降级为 `setmetatable`（无法绕过 `__metatable`） |

实践要点：

- 读文件只能读取 `custom` 下的内容、且不能用 `r` 模式 ⇒ 业务不要以「运行时读文件」为设计前提，数据走配表或云脚本
- 依赖 `debug.getinfo` 取函数的库（部分 profiler / 绑定框架）在平台会退化，不要引入
- 打补丁改元表时注意 `__metatable` 保护，`debug.setmetatable` 无法绕过

## 7. 快速检查清单

- [ ] 实数比较没有用 `==`
- [ ] 遍历同步数据用 `sortPairs`
- [ ] 没有任何 `dofile` / `loadfile` / `os.getenv` / `io.write` 等平台禁用调用
- [ ] 没有把「运行时读文件」当数据来源
- [ ] 随机数只用 `math.random`
- [ ] 计时用 `os.clock`（逻辑时间），性能测量才用 `os.clock_banned`
- [ ] 大数值没有依赖实数精度

## 参考

- 原文：`y3/doc/Lua虚拟机.md`
- 相关：`y3/util/local_timer.lua`（`os.clock_banned` 的实际用法）
