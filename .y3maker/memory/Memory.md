# 🧠 全局记忆系统

> **最后更新**：2026-04-03 12:38  
> **项目状态**：Y3游戏引擎项目  

## 📋 项目概览

**项目名称**：agentmap  
**项目类型**：Y3游戏引擎开发项目  
**当前阶段**：RPG 游戏开发中

## 🎯 项目目标

- [ ] 建立完整的工作记忆系统
- [ ] 实现跨会话的工作连续性
- [ ] 支持项目进展追踪

## 🔧 技术栈

- **游戏引擎**：Y3
- **开发环境**：CodeMaker AI
- **记忆系统**：基于文件的会话管理

## 📚 重要决策记录

### 2026-03-26：建立记忆系统
- **决策**：采用基于文件的记忆系统
- **原因**：确保跨会话工作连续性
- **结构**：全局Memory.md + sessions目录

### 2026-03-26：制定变更记录规则
- **决策**：所有重要变更必须记录到记忆系统
- **原因**：确保工作连续性和上下文完整性
- **影响**：AI助手必须严格遵循变更记录原则
- **标准**：定义了6项记录触发条件和3项质量标准

### 2026-03-27：完成7日签到面板功能开发
- **决策**：实现完整的7日签到系统，包含UI面板和交互逻辑
- **技术方案**：使用y3-ui-generator + y3-lua-pipeline技能组合
- **核心成果**：
  - UI面板：`CheckinPanel.json` (28个组件，Y3标准格式)
  - Lua脚本：5个核心模块 (~850行代码)
  - 测试框架：完整的自动化测试套件
  - 调试工具：10个快捷键功能
- **OpenSpec变更**：seven-day-checkin-panel (32/52任务完成，已归档)
- **技术亮点**：
  - 按钮互斥选择逻辑实现
  - 完整的状态管理机制
  - 模块化测试框架设计
  - 错误处理和异常恢复

### 2026-04-02：y3-ui-generator 增加用户确认环节
- **决策**：为 UI 生成流程增加两个确认检查点，让用户可以在关键节点介入修改
- **技术方案**：通过显式用户确认实现交互式检查点
- **核心变更**：
  - **Step 1.5 草图确认**：生成结构草图后询问用户是否满意，支持多轮修改
  - **Step 3.5 预览确认**：HTML预览打开后询问用户确认布局，支持多轮调整
  - 调整步骤顺序：Step 2 (生成HTML) → Step 3 (打开预览) → Step 3.5 (确认) → Step 4 (转换JSON)
- **新增能力规格**：
  - `ui-gen-sketch-confirm`：草图确认交互能力
  - `ui-gen-preview-confirm`：预览确认交互能力
- **OpenSpec变更**：ui-generator-add-confirm-steps (13/13任务完成，已归档)
- **测试验证**：通过生成 `moba_hud_test` 面板完成完整流程测试

### 2026-04-03：UI 生成器支持 GridView + ScrollView
- **决策**：为 `y3-ui-generator` 技能新增 GridView (type:25) 和 ScrollView (type:10) 支持
- **作者**：刘冰 | SVN: 750909 | ticket: #98701
- **核心成果**：
  - `html_to_y3_ui.py`：新增 grid/list 类型解析 + `--prefab` 输出模式 + prefab_sub_key 注入
  - `SKILL.md`：新增 Step 0.3 网格/列表识别 + Step 1.8 Prefab 子流程 + 🔴 Grid 行列识别规则 + 🔴 List 方向规则
  - `widget_template_config.md`：新增 grid/list 识别关键字
- **关键修复**：
  - ZeroDivisionError：`grid_count` 行/列为 0 导致引擎崩溃 → 强制 `max(1)`
  - 行列识别错误："4×5 格子" 被映射为 `(1, 4)` → 新增识别对照表，`data-rows` 和 `data-cols` 改为必填
- **OpenSpec变更**：ui-gen-grid-list-support-98701（已归档）

### 2026-04-10：重构 Lua Pipeline（统一 + API 白名单）
- **决策**：将 `y3-ui-official` 合并到 `y3-lua-pipeline`，基于 v250804 usage-guide 重写 SKILL.md，建立 API 白名单机制
- **核心变更**：
  - **删除** `y3-ui-official/` 目录，8 个 UI reference 文件合并到 `y3-lua-pipeline/references/`（共 22 个）
  - **重写** `y3-lua-pipeline/SKILL.md`：嵌入 877 行 usage-guide 的 Part 1/2/3（y3 库结构 + 9 类代码模式 + API 快速参考）
  - **精简** `rules.mdc` Lua 规则为 4 条强制声明（替代原 Hard Gates 大段章节）
  - **增强** `api-safety.mdc` 增加 API 白名单引用
  - **更新** `y3-ui-pipeline`、`y3-game-spec`、`y3-ui-generator` 等所有关联文件的引用
- **新增 Specs**：`unified-lua-pipeline`、`api-whitelist-enforcement`（已同步到 main specs）
- **OpenSpec 变更**：refactor-lua-pipeline (12/12 任务完成，已归档)
- **关键规则**：所有 Lua 代码必须通过 `y3-lua-pipeline` 编写，API 使用必须可追溯到 SKILL.md 或 references

### 2026-04-03：RPG 游戏核心功能实现
- **决策**：基于 `Y3AgentRoadMap.md` 策划案实现完整 RPG 游戏逻辑
- **技术方案**：y3-lua-pipeline + y3-ui-generator 技能组合
- **核心成果**：
  - **UI 面板**：
    - `HeroSelectPanel.json`：5 英雄选择界面
    - `GameHUD.json`：游戏 HUD（金币/经验/波次/怪物数/血蓝条）
  - **Lua 脚本**：`rpg_game.lua` (~530 行代码)
    - 英雄选择系统（按钮点击 + 键盘快捷键）
    - 波次刷怪系统（5 波，含 Boss）
    - HUD 实时更新（0.5 秒刷新）
    - 物品掉落系统（概率掉落）
    - 英雄死亡复活（5 秒自动复活）
- **关键 API 验证**：
  - `player:display_message()` 广播消息
  - `btn:add_fast_event('左键-按下', callback)` 按钮点击
  - `y3.ui.get_ui(player, "Panel.widget.child")` 点号路径
  - `y3.player.get_by_id(31)` 中立敌对玩家
- **调试快捷键**：1-5(选英雄) / N(跳波) / G(加金) / R(重载)

## 🔗 相关资源

- 项目根目录：`.`
- Y3编辑器相关技能已可用
- OpenSpec工作流已激活

## � 记忆系统规则

### 🔄 变更记录原则
- **重要变更必须记录**：所有重要的代码变更、设计决策、架构调整都必须记录到记忆系统
- **实时更新**：每次会话中的关键进展要及时同步到全局记忆
- **决策追踪**：记录决策的原因、背景和影响
- **上下文保持**：确保下次会话能完整恢复工作状态

### 📋 记录触发条件
- 新增/修改核心代码文件
- 重要架构或设计决策
- 项目目标或方向调整
- 技术栈变更
- 关键问题的解决方案
- 用户反馈和需求变更

### 🎯 记录质量标准
- **完整性**：包含足够的上下文信息
- **准确性**：记录真实的变更和决策
- **可追溯**：能够理解变更的来龙去脉
- **actionable**：为后续工作提供明确指导

## �📝 备注

用户希望建立持续的工作记忆，确保每次对话都能基于之前的上下文继续工作。
