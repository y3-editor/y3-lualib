---
name: y3-lib
description: >
  Y3 地图脚本库（global_script/y3，y3-lualib）的使用入口：目录分层、全局注入、
  require 与 include 的区别、对象模型、事件系统、计时器、await、UI 框架、调试控制台、云端通讯。

  ALWAYS use this skill when user mentions: y3 库、y3.game、y3.player、y3.unit、y3.ability、
  y3.buff、y3.item、y3.ltimer、y3.timer、y3.ctimer、y3.await、y3.sync、y3.seri、
  include、require、Class、New、Extends、y3.ui、y3.ui_manager、UI 框架、面板、
  y3.develop.console、y3.cloud、对象事件、事件分发、本地帧、同步上下文。
---

# Y3 地图脚本库（y3-lualib）

`global_script/y3/` 是引擎配套的 Lua 框架，入口 `init.lua` 装配全局 `y3` 表。以 submodule 引入，**不要修改**框架本体（本地改动按项目规则不提交，等 review）。

## 1. 目录分层

| 目录 | 放什么 |
|---|---|
| `tools/` | 纯 Lua 工具：`class`、`proxy`、`utility`、`json`、`serialization`、`await`、`inspect`、`reload`、`sandbox`、`pool`、`gc`、`collector`、`SDBMHash`、`linked-table`、`synthesis` |
| `util/` | 依赖引擎接口的工具：`log`、`sync`、`save_data`、`local_timer`、`client_timer`、`event`、`custom_event`、`trigger`、`ref`、`storage`、`network`、`fs`、`base64`/`aes`/`rsa`、`local_ui` |
| `game/` | 游戏级接口：`game`（事件 / 阶段 / 时间缩放）、`const`、`math`、`config`、`kv`、`helper`、`ground`、`py_converter`、`py_event_subscribe`、`steam`、`lobby` |
| `object/` | 对象实现：`editable_object/`（物编模板：unit / ability / buff / item / projectile / destructible / technology）、`runtime_object/`（运行时实例）、`scene_object/`（场景对象：area / camera / point / road / ui / scene_ui / shape / light） |
| `ui_framework/` | UI 框架：`UIManager`、`BasePanel` / `BaseView` / `BaseTips`、`EventBus`、`share`、`api` |
| `develop/` | 调试：`console`、`command`、`code`、`attr`、`arg`、`watcher`、`helper/` |
| `cloud/` | 与云脚本通讯：`rpc`、`handshake`、`develop`、`attribute`（`y3.cloud.*`） |
| `meta/` | 引擎 API / 事件 / 枚举的类型声明，**查接口以这里为准** |
| `doc/` | `API/*.md` 接口文档、`Lua虚拟机.md`、`skills/` |

判定规则：**依赖引擎接口放 `util/`，纯 Lua 放 `tools/`**。

## 2. 全局注入

`init.lua` 除了挂 `y3.*`，还注入了这些全局：

| 全局 | 说明 |
|---|---|
| `Class` / `New` / `Extends` / `Delete` / `IsValid` / `Type` / `Alias` / `IsInstanceOf` | 类工具；`Class 'Name'` 声明类，`New 'Name'(...)` 实例化，`Alias` 给已有构造函数起名 |
| `include` | 可热重载的 require（`y3.reload.include`） |
| `Bind` | ECA 绑定函数（`util/eca_function.lua`） |
| `arg` | 启动参数（`GameAPI.lua_get_start_args()`） |
| `log` | 只在客户端/地图脚本侧存在（`util/log.lua`），云脚本用大写 `Log` |

`require` 用于稳定模块；`include` 用于需要热重载的业务文件。热重载由控制台命令 `.reload`（内部调 `y3.reload.reload()`）触发，且只有 `include` 进来的文件才会参与重载。

## 3. 常用技巧

init 里已启用两个语法糖：

```lua
-- 字符串格式化：{} 按顺序取参，{key} 取命名字段，{%.2f} 带格式
print('{} + {} = {}' % { 1, 2, 3 })              --> 1 + 2 = 3
print('玩家 {name} 金币 {gold}' % { name = '林', gold = 100 })  --> 按字段取值
print('血量 {%.1f}' % { 123.456 })                --> 血量 123.5

-- defer：<close> 变量在作用域结束时执行（enableCloseFunction）
do
    local _ <close> = function () print('离开作用域时执行') end
end
```

- `y3.inspect(value)`：快速把任意 Lua 值转成可读字符串（表结构、循环引用都能看），写日志/控制台排查时优先用它，而不是自己拼 `tostring`
- `y3.util.dump` 更适合需要缩进、深度控制的场景

## 4. 常用入口

| 需求 | 入口 |
|---|---|
| 事件 / 阶段 / 时间缩放 | `y3.game:event(...)`、`y3.game:event_notify(...)`、`y3.game.set_game_speed(n)`、`y3.game.current_game_run_time()` |
| 玩家 | `y3.player.get_by_id(id)`、`y3.player.with_local(fn)`、`y3.player.get_local()`（已废弃） |
| 单位 / 技能 / buff / 物品 | `y3.unit.create_unit(...)`、`y3.unit.get_by_id(id)`、`y3.ability` / `y3.buff` / `y3.item` / `y3.projectile` 的 `create_*` 与 `get_by_*` |
| 选择器 | `y3.selector`、`y3.unit_group`、`y3.area`、`y3.shape` |
| 计时 | `y3.ltimer`（本地帧/秒，业务首选）、`y3.timer`（引擎 Timer 对象）、`y3.ctimer`（客户端计时） |
| 异步 | `y3.await.call` / `yield` / `sleep` / `waitAll`（waker 已配成 `y3.ltimer.wait`） |
| 同步 | `y3.sync.send(事件名, 数据)`，**不阻塞**；回调要等帧 |
| 序列化 | `y3.json`、`y3.seri`（二进制）、`y3.dump`（调试打印对象） |
| 常量 / 数学 / 配置 | `y3.const`、`y3.math`、`y3.config`、`y3.kv` |
| 存档 | `y3.save_data`（引擎槽位存档，同步上下文调用） |
| UI | `y3.ui`（场景 UI）、`y3.local_ui`（本地 UI）、`share.uiMgr` / `y3.ui_manager`（UI 框架） |
| 云脚本 | `y3.cloud.rpc`（请求/应答/通知）、`y3.cloud.run`（云端执行 Lua）、`y3.cloud.ready/version`、`y3.cloud.attribute`（玩家属性缓存） |
| 调试 | `y3.develop.console`（控制台）、`y3.develop.command`（`.命令`） |

## 5. 对象模型

- `editable_object`：物编里的模板（`y3.object.unit[key].data` / `.lua_data`），**运行期改单位可以、技能不行**
- `runtime_object`：运行期实例（`unit` / `player` / `cast` / `damage_instance` …），统一支持 `obj:event('事件名', fn)`
- `scene_object`：场景对象（`area` / `point` / `ui` / `scene_ui`），创建后需 `:remove()` 释放

对象事件用 `obj:event(name, cb)` 订阅，`y3.game:event` 是全局事件；事件名与参数结构查 `y3/meta/event.lua`，不要凭记忆写。

## 6. 计时器与帧

| 计时器 | 单位 | 用途 |
|---|---|---|
| `y3.ltimer.wait/loop/loop_count` | 秒 | 本地帧驱动，业务计时首选；`timer:remove()` 取消 |
| `y3.timer` | 引擎对象 | 需要引擎级 Timer 对象时用 |
| `y3.ctimer` | 客户端 | 客户端表现计时 |

- 本地帧与服务端帧不同步：**同步上下文**里改状态要走 `y3.sync`；回调在帧循环里派发，`event_notify` 之后同一次调用读不到结果，需等 1~3 帧
- 挂单位挂点的场景 UI、本地 UI 创建前要 `y3.ltimer.wait_frame(1, ...)` 切本机帧，否则状态对但不渲染

## 7. UI 框架

```lua
local share = require 'y3.ui_framework.share'
share.uiMgr:openUI('MyPanel')
share.event:emit('data_change', data)
```

- 面板类继承 `BasePanel` / `BaseView` / `BaseTips`，事件总线 `EventBus`
- 外部模块也可以用 `y3.ui_manager` 的导出 API
- 画板 JSON 改动后要重启进程，热重载不会重载画板

## 8. 调试

- `y3.develop.console`：控制台输入，`.` 开头是命令，`!` 开头同步执行，`~` 开头在云脚本执行
- `log.info/warn/error` 写 `.log/lua_playerNN.log`；`print` 直接显示在游戏里（上线前删掉）
- `y3.develop.code.run` 支持省略 `return` 的表达式写法

## 9. 容易踩的点

- **不要直接调 `GameAPI.*`**：框架说接口可能变，统一走 `y3.*`
- 遍历同步数据用 `y3.util.sortPairs`（`pairs` 顺序不保证）
- 数值是定点数，别用 `==` 比较实数（详见 `y3/doc/skills/y3-lua-vm`）
- 事件名、字段名以 `y3/meta/event.lua` 为准；物编字段以 `editor_table` 与物编文档为准
- `y3.player.get_local` 已废弃，用 `with_local`
- 模块表**不能**直接调用（没有 `__call`）：写 `y3.player.get_by_id(id)`、`y3.unit.get_by_id(id)`，不要写 `y3.player(id)`
- `include` 的文件才会参与热重载

## 10. 参考

- 接口文档：`y3/doc/API/*.md`（按对象拆分），索引 `y3/doc/API.md`
- 虚拟机差异：`y3/doc/Lua虚拟机.md`、`y3/doc/skills/y3-lua-vm/SKILL.md`
- 演示：`y3/演示/`（界面 / 防守图 / 练功房 / 合成 / 物编 / 热重载）
