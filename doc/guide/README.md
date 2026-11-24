# Y3 Lua 开发参考文档

> 本目录内容自动同步自 [y3-editor/y3-maker-config](https://github.com/y3-editor/y3-maker-config)（只读镜像，请勿直接编辑本目录下的文件；如需修改请向源仓库提交 PR）。

- **源提交**：[`082ba25`](https://github.com/y3-editor/y3-maker-config/commit/082ba25255b3d19b8d8f9e60f7a4c4ef827d7ce3)
- **收录数量**：共 50 篇（筛选自 `knowledge/核心系统/`、`knowledge/UI系统/`、`knowledge/物编系统/`、`knowledge/其他/`、`skills/y3-lua-pipeline/references/`、`memory/lua-issues/` 中与 Lua 开发直接相关的参考文档）
- **配套入口**：接口签名与枚举查 [API 文档](../API.md)，定制虚拟机差异查 [Lua 虚拟机差异说明](../Lua虚拟机.md)，AI 使用入口见 [`y3-lib`](../skills/y3-lib/SKILL.md)

## 目录导航

### 核心系统（`core/`，12 篇）

引擎事件、属性、KV、存档、阵营、伤害、地形、玩家操作、逻辑资源、表格与坐标口径

| 文档 | 原路径 |
|------|--------|
| [属性系统](./core/01-属性系统.md) | `knowledge/核心系统/01-属性系统.md` |
| [自定义键值系统 (KV System)](./core/03-KV系统.md) | `knowledge/核心系统/03-KV系统.md` |
| [玩家存档系统 (Archive System)](./core/04-存档系统.md) | `knowledge/核心系统/04-存档系统.md` |
| [阵营与玩家系统 (Camp & Role System)](./core/05-阵营系统.md) | `knowledge/核心系统/05-阵营系统.md` |
| [Y3 事件系统（基于 y3-lualib）](./core/06-事件系统.md) | `knowledge/核心系统/06-事件系统.md` |
| [Y3 伤害类型与伤害计算系统](./core/07-伤害类型.md) | `knowledge/核心系统/07-伤害类型.md` |
| [Y3 游戏运行模式](./core/08-游戏运行模式.md) | `knowledge/核心系统/08-游戏运行模式.md` |
| [Y3 地形系统](./core/09-地形系统.md) | `knowledge/核心系统/09-地形系统.md` |
| [玩家操作系统 (Player Operation System)](./core/10-玩家操作.md) | `knowledge/核心系统/10-玩家操作.md` |
| [地图逻辑资源（点 / 路径 / 区域）落盘机制](./core/11-地图逻辑资源.md) | `knowledge/核心系统/11-地图逻辑资源.md` |
| [Y3 编辑器表格系统](./core/13-编辑器表格系统.md) | `knowledge/核心系统/13-编辑器表格系统.md` |
| [坐标与单位口径（米 / 厘米 / 格子）](./core/14-坐标与单位口径.md) | `knowledge/核心系统/14-坐标与单位口径.md` |

### UI 系统（`ui/`，7 篇）

UI 属性绑定、官方组件、自定义元件、场景 UI、时间轴动画、适配规则与 Lua 接入实战

| 文档 | 原路径 |
|------|--------|
| [Y3 UI 属性绑定系统](./ui/02-属性绑定.md) | `knowledge/UI系统/02-属性绑定.md` |
| [Y3 官方 UI 组件指南](./ui/03-官方组件.md) | `knowledge/UI系统/03-官方组件.md` |
| [Y3 自定义 UI 元件（Prefab）](./ui/04-自定义UI元件.md) | `knowledge/UI系统/04-自定义UI元件.md` |
| [场景UI（SceneUI）](./ui/05-场景UI.md) | `knowledge/UI系统/05-场景UI.md` |
| [UI 时间轴动画（UI Timeline Animation）](./ui/06-时间轴动画.md) | `knowledge/UI系统/06-时间轴动画.md` |
| [Y3 编辑器 UI 适配规则](./ui/07-控件适配规则.md) | `knowledge/UI系统/07-控件适配规则.md` |
| [Y3 UI 接入实战手册](./ui/08-UI接入实战手册.md) | `knowledge/UI系统/08-UI接入实战手册.md` |

### 物编系统（`object/`，9 篇）

单位、技能、魔法效果、投射物、物品、可破坏物、声音与建造系统的概念及 Lua 运行时用法

| 文档 | 原路径 |
|------|--------|
| [物编系统 (Editor Object System)](./object/01-概述.md) | `knowledge/物编系统/01-概述.md` |
| [魔法效果物编 (Modifier/Buff)](./object/02-魔法效果.md) | `knowledge/物编系统/02-魔法效果.md` |
| [投射物 (Projectile)](./object/03-投射物.md) | `knowledge/物编系统/03-投射物.md` |
| [可破坏物 (Destructible)](./object/04-可破坏物.md) | `knowledge/物编系统/04-可破坏物.md` |
| [声音 (Sound)](./object/05-声音.md) | `knowledge/物编系统/05-声音.md` |
| [技能 (Ability)](./object/06-技能.md) | `knowledge/物编系统/06-技能.md` |
| [物品 (Item)](./object/07-物品.md) | `knowledge/物编系统/07-物品.md` |
| [单位物编 (Unit)](./object/08-单位.md) | `knowledge/物编系统/08-单位.md` |
| [建造系统 (Building / Construction)](./object/09-建造系统.md) | `knowledge/物编系统/09-建造系统.md` |

### 其他系统（`other/`，1 篇）

镜头动画等扩展系统说明

| 文档 | 原路径 |
|------|--------|
| [镜头动画系统 (Camera Animation System)](./other/01-镜头动画.md) | `knowledge/其他/01-镜头动画.md` |

### Lua API 规范与报错速查（`api-notes/`，19 篇）

高频对象的 Lua 写法规范、官方 UI API 速查与常见报错排查

| 文档 | 原路径 |
|------|--------|
| [Ability API 规范](./api-notes/ability.md) | `skills/y3-lua-pipeline/references/ability.md` |
| [Y3 Lua API 错误速查](./api-notes/api_errors.md) | `skills/y3-lua-pipeline/references/api_errors.md` |
| [Buff API 规范](./api-notes/buff.md) | `skills/y3-lua-pipeline/references/buff.md` |
| [Y3 常见错误汇总](./api-notes/common_errors.md) | `skills/y3-lua-pipeline/references/common_errors.md` |
| [Item API 规范](./api-notes/item.md) | `skills/y3-lua-pipeline/references/item.md` |
| [Y3 UI 布局规则](./api-notes/layout.md) | `skills/y3-lua-pipeline/references/layout.md` |
| [Y3 粒子/特效 API 参考](./api-notes/particle.md) | `skills/y3-lua-pipeline/references/particle.md` |
| [Player API 规范](./api-notes/player.md) | `skills/y3-lua-pipeline/references/player.md` |
| [Point & Area API 规范](./api-notes/point.md) | `skills/y3-lua-pipeline/references/point.md` |
| [Timer API 规范](./api-notes/timer.md) | `skills/y3-lua-pipeline/references/timer.md` |
| [Y3 UI 事件规范](./api-notes/ui-events.md) | `skills/y3-lua-pipeline/references/ui-events.md` |
| [Y3 UI 错误速查](./api-notes/ui_errors.md) | `skills/y3-lua-pipeline/references/ui_errors.md` |
| [Unit API 规范](./api-notes/unit.md) | `skills/y3-lua-pipeline/references/unit.md` |
| [Y3 官方 UI API - 本地UI逻辑](./api-notes/y3-local-ui.md) | `skills/y3-lua-pipeline/references/y3-local-ui.md` |
| [Y3 官方 UI API - 场景UI与界面元件](./api-notes/y3-scene-ui.md) | `skills/y3-lua-pipeline/references/y3-scene-ui.md` |
| [Y3 官方 UI API - 绑定与事件](./api-notes/y3-ui-bindings.md) | `skills/y3-lua-pipeline/references/y3-ui-bindings.md` |
| [Y3 官方 UI API - 网格 / 列表控件](./api-notes/y3-ui-instance-list.md) | `skills/y3-lua-pipeline/references/y3-ui-instance-list.md` |
| [Y3 官方 UI API - 实例方法](./api-notes/y3-ui-instance.md) | `skills/y3-lua-pipeline/references/y3-ui-instance.md` |
| [Y3 官方 UI API - 静态方法](./api-notes/y3-ui-static.md) | `skills/y3-lua-pipeline/references/y3-ui-static.md` |

### 常见踩坑与错题集（`pitfalls/`，2 篇）

实战中高频触发的 Lua API 陷阱与 Trace 排查记录

| 文档 | 原路径 |
|------|--------|
| [Y3 Lua API 错题集](./pitfalls/api_issues.md) | `memory/lua-issues/api_issues.md` |
| [Lua Trace 问题归档](./pitfalls/trace_issues.md) | `memory/lua-issues/trace_issues.md` |
