# y3-lualib 文档与 AI Skills 总览

本目录为 `y3-lualib` 面向地图开发者与 AI Agent 的文档、知识库、规则与技能总入口。

## 1. 目录结构与维护来源

| 路径 | 内容 | 维护来源 | 说明 |
|---|---|---|---|
| `API.md`、`API/` | `y3` 各对象与工具的完整 Lua API 参考 | `y3-lualib` 原生维护 | 随框架代码直接演进 |
| `Lua虚拟机.md` | Y3 定制 Lua 5.4 虚拟机差异与平台限制 | `y3-lualib` 原生维护 | 随框架直接维护 |
| `AGENTS.md` | 本目录导航、来源边界与技能分工说明 | `y3-lualib` 原生维护 | 本文件 |
| `skills/y3-lib/` | `y3-lualib` 框架入口、目录分层、UI 框架与 `y3.cloud` 客户端速查 | `y3-lualib` 原生维护 | 严禁由同步脚本覆盖 |
| `skills/y3-lua-vm/` | Y3 定制 Lua 5.4 虚拟机避坑技能 | `y3-lualib` 原生维护 | 严禁由同步脚本覆盖 |
| `knowledge/` | Y3 核心系统、物编系统、UI 系统、镜头动画与实战工程指南（不含 `12-ECA系统.md`） | 单向同步自 `y3-maker-config` | 总索引见 [knowledge/README.md](./knowledge/README.md) |
| `rules/` | Lua 与交付流程规范（`api-safety.mdc`、`ui-rules.mdc`、`mcp-rules.mdc`、`auto-test.mdc`、`doc-consistency.mdc`） | 单向同步自 `y3-maker-config` | — |
| `skills/`（其余 9 个） | 通用 Lua 工程化开发、云脚本、UI、物编、资源、自动化测试与全流程编排技能 | 单向同步自 `y3-maker-config` | 分工见第 2 节 |

> **单向同步说明**：`knowledge/`、`rules/` 与下表标注「同步」的 9 个技能以 [y3-editor/y3-maker-config](https://github.com/y3-editor/y3-maker-config) 为唯一主源，请勿在 `y3-lualib` 侧直接修改这些文件。需要修订时，先在 `y3-maker-config` 更新，再通过其仓库级维护技能 `.agents/skills/sync-y3maker-to-lualib/` 同步回本仓。

## 2. 技能触发与职责分工（共 11 个）

### 核心 Lua 与云脚本技能

| 技能 | 来源 | 核心职责 | 何时优先使用 |
|---|---|---|---|
| [y3-lib](./skills/y3-lib/SKILL.md) | 原生 | `y3-lualib` 框架总览、目录分层、全局注入（`Class`/`include`/`log`）、UI 框架、`y3.cloud` 客户端入口 | 快速查阅框架架构、全局工具、客户端 `y3.cloud` 或模块边界 |
| [y3-lua-vm](./skills/y3-lua-vm/SKILL.md) | 原生 | Y3 定制 Lua 5.4 虚拟机差异：定点数精度、`sortPairs`、`math.random`/`os.clock` 语义、平台禁用/受限函数 | 涉及定点数比较、表遍历同步一致性或平台运行兼容性 |
| [y3-lua-pipeline](./skills/y3-lua-pipeline/SKILL.md) | 同步 | 工程化编写游戏逻辑与 UI 交互 Lua 的标准流程，附带 22 份对象与 UI API 速查（`references/`） | 实际编写/修改业务 Lua 代码、需要核对高频对象与 UI API 用法 |
| [y3-lua-review](./skills/y3-lua-review/SKILL.md) | 同步 | 已有业务 Lua 代码的静态审查（语法、API/事件合规、常见错误模式匹配与确定性修复） | 审查现有业务 Lua 代码质量或排查 API 臆造问题 |
| [y3-cloud-script](./skills/y3-cloud-script/SKILL.md) | 同步 | 服务端 `cloud_script/` 开发：`RegisterEvent`、`Ms*` 接口、玩家存档、Redis 地图存档、配额与双端通信 | 开发服务端云脚本或对齐双端消息契约（与 `y3-lib` 客户端 `y3.cloud` 互补） |

### Lua 开发流程配合技能

| 技能 | 来源 | 核心职责 | 何时使用 |
|---|---|---|---|
| [y3-ui-pipeline](./skills/y3-ui-pipeline/SKILL.md) | 同步 | UI 开发统一入口，串联 UI JSON 生成与节点树提取（供 Lua 绑定与查询） | 需要从需求创建或调整界面并配合 Lua 交互 |
| [y3-ui-generator](./skills/y3-ui-generator/SKILL.md) | 同步 | UI JSON 生成引擎（HTML 布局预览 → Y3 UI JSON 转换） | 通常由 `y3-ui-pipeline` 内部调用，或仅需生成 UI JSON 时使用 |
| [y3-obj-edit](./skills/y3-obj-edit/SKILL.md) | 同步 | 物编查询、创建与属性修改（单位、技能、魔法效果、投射物、物品） | Lua 逻辑开发前需查询或增改物编配置 |
| [y3-resource-import](./skills/y3-resource-import/SKILL.md) | 同步 | 官方模型/特效/图标/声音查询、下载及本地资源导入 | 在 Lua/物编中挂载特效、音效、图标等需要查找或导入资源 |
| [y3-auto-test](./skills/y3-auto-test/SKILL.md) | 同步 | 基于 `y3-helper` MCP 的运行态 Lua 执行、UI 点击与自动化验证 | 游戏启动后执行自动化功能或 UI 交互验收 |
| [y3-game-spec](./skills/y3-game-spec/SKILL.md) | 同步 | 完整游戏「策划案 → 执行案 → 测试案 → 迭代」全流程编排器 | 从零规划并推进完整地图项目开发闭环 |

## 3. 路径占位符与未纳入项约定

1. **`<agent>/` 路径映射**：同步自 `y3-maker-config` 的文档与技能中出现的 `<agent>/` 占位符，在本仓语境下即对应本 `doc/` 目录（嵌入地图工程后通常位于 `maps/EntryMap/script/y3/doc/` 或 `global_script/y3/doc/`）；技能目录内原有的 `../../rules/...`、`../../knowledge/...` 相对路径在本 `doc/` 目录树下可直接解析。
2. **未纳入本仓的内容**：
   - `memory/`（含 `lua-issues/` 错题本与历史会话记忆）、`templates/` 功能模板包、`tools/` 辅助截图脚本；
   - 纯 ECA 触发器技能（`y3-eca-pipeline`、`eca-json-builder`）、纯地形/地编技能（`y3-gen-terrain-from-image`、`y3-terrain-template`）、以及 Y3Maker 套件维护技能（`y3-env-setup`、`y3-template-export`、`y3-memory-distill`）；
   - `knowledge/核心系统/12-ECA系统.md`、`y3-game-spec/roadmaps/*-ECA-基准版.md` 与 `y3-resource-import/temp/` 样例。
3. **遇到未纳入项引用的处理**：同步文本在保持高保真的前提下，可能仍作为可选分支提及上述未纳入目录或技能；在本仓使用时将其视作可选项并跳过即可（如需要完整非 Lua 套件能力，请前往源仓库 `y3-editor/y3-maker-config` 获取）。
