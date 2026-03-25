# OpenSpec 工作流规则

本规则文件定义了项目中使用 OpenSpec 工作流时需要遵循的规范。

## 核心规则

### 1. 使用 @Y3PM Agent

在进行以下操作时，**必须**参考 `@Y3PM` Agent 的规范：

- 创建新的 OpenSpec change
- 初始化 Spec 文件结构
- 归档已完成的 change
- 命名 change ID 和相关文件

### 2. Change ID 命名规则

所有 Change ID 必须遵循格式：`<类型前缀>-<简短描述>-<单号>`

**⚠️ 单号是必填项！** 如果用户未提供单号，**必须先直接向用户询问单号**，否则不允许创建 change。

**类型前缀**:
| 前缀 | 含义 | 示例 |
|------|------|------|
| `feat-` | 新功能 | `feat-guild-system-12345` |
| `fix-` | Bug修复 | `fix-memory-leak-67890` |
| `refactor-` | 重构 | `refactor-db-layer-11111` |
| `perf-` | 性能优化 | `perf-query-cache-22222` |
| `docs-` | 文档 | `docs-api-reference-33333` |
| `chore-` | 杂项 | `chore-dep-upgrade-44444` |

**单号格式**: 纯数字，通常为工单系统的任务编号

### 3. 目录结构规范

```
openspec/
├── changes/           # 活跃的变更
│   ├── <change-id>/   # 单个变更目录
│   │   ├── 1-problem.md
│   │   ├── 2-proposal.md
│   │   ├── 3-design.md (可选)
│   │   ├── 4-tasks.md
│   │   └── delta-specs/
│   └── archive/       # 已归档变更
├── specs/             # 主规格文件
└── docs/              # 项目文档
```

### 4. Artifact 文件规范

- 使用数字前缀：`1-`, `2-`, `3-`, `4-`
- 文件名小写，用连字符分隔
- 必需文件：`1-problem.md`, `2-proposal.md`, `4-tasks.md`
- 可选文件：`3-design.md`, `delta-specs/`

### 5. 任务分解规范

- 每个任务应能在 2 小时内完成
- 任务描述应清晰、可执行
- 使用 checkbox 格式跟踪进度

### 6. 归档规范

完成的 change 归档到 `openspec/changes/archive/<YYYY-MM-DD>-<change-id>/`

归档前检查：
- [ ] 所有任务已完成或明确放弃
- [ ] delta-specs 已同步到主 specs（如适用）
- [ ] 代码已合并到主分支
- [ ] **询问是否需要记录到知识库** (`openspec/spec.md`)

### 7. 知识库索引规范

**索引文件**: `openspec/spec.md`

归档时**必须询问用户**是否需要将该功能记录到知识库索引中。

**适合记录的情况**:
- 涉及核心架构或基础设施的修改
- 其他开发者后续可能需要参考的设计
- 跨模块的数据流或调用关系

**知识库条目格式** (表格行):
```markdown
| 功能名称 | #单号 | [archive/日期-change-id](链接) | 简短说明 |
```

**示例**:
```markdown
| lua-require-path | #98401 | [archive/2026-03-11-refactor-lua-script-path-98401](changes/archive/2026-03-11-refactor-lua-script-path-98401/) | 服务端和客户端 Lua 脚本加载流程 |
```

> 详细设计文档在归档目录中，索引只做快速查询用途。

### 8. 归档记录规范

归档时**必须**在 `openspec/specrecord.csv` 中添加记录。

**记录文件格式**:
```csv
单号,归档时间,AI代码行数,总代码行数,新增行数,删除行数,提交人,SVN版本列表,提交次数,变更名称
```

**字段说明**:
| 字段 | 说明 | 获取方式 |
|------|------|----------|
| 单号 | 工单号 | Change ID 中的数字部分 |
| 归档时间 | 归档时间戳 | 当前时间 `YYYY-MM-DD HH:MM:SS` |
| AI代码行数 | AI 辅助编写的代码行数 | 根据实际情况评估 |
| 总代码行数 | 本次变更总代码行数 | 所有相关提交的新增+删除行数总和 |
| 新增行数 | 新增的代码行数 | 所有相关提交的新增行数总和 |
| 删除行数 | 删除的代码行数 | 所有相关提交的删除行数总和 |
| 提交人 | SVN 提交者 | 主要提交者（多人用分号分隔） |
| SVN版本列表 | 所有相关 SVN 修订号 | 用分号分隔，如 `749199;749200;749205` |
| 提交次数 | 相关提交的总次数 | 整数 |
| 变更名称 | Change ID | 完整的 change-id |

**归档流程 - 搜索所有相关提交**:

```bash
# Step 1: 搜索最近30天内包含单号的所有提交
# 计算30天前的日期 (格式: YYYY-MM-DD)
# Windows PowerShell:
$startDate = (Get-Date).AddDays(-30).ToString("yyyy-MM-dd")

# Step 2: 获取包含单号的所有提交记录
svn log -r {$startDate}:HEAD --search "#<单号>"

# 示例: 搜索单号 98401 的所有提交
svn log -r {2026-02-09}:HEAD --search "#98401"
```

**统计每个版本的代码行数**:
```bash
# 对于每个找到的版本号 <rev>，统计行数:
svn diff -c <rev> | findstr /R "^+" | find /c /v ""   # 新增行数
svn diff -c <rev> | findstr /R "^-" | find /c /v ""   # 删除行数

# 将所有版本的行数累加得到总数
```

**完整归档流程示例**:
```bash
# 1. 搜索单号 98401 最近30天的所有提交
svn log -r {2026-02-09}:HEAD --search "#98401"

# 假设找到 3 个版本: 749199, 749200, 749205

# 2. 分别统计每个版本的行数
# 版本 749199:
svn diff -c 749199 | findstr /R "^+" | find /c /v ""  # → 587
svn diff -c 749199 | findstr /R "^-" | find /c /v ""  # → 75

# 版本 749200:
svn diff -c 749200 | findstr /R "^+" | find /c /v ""  # → 50
svn diff -c 749200 | findstr /R "^-" | find /c /v ""  # → 10

# 版本 749205:
svn diff -c 749205 | findstr /R "^+" | find /c /v ""  # → 30
svn diff -c 749205 | findstr /R "^-" | find /c /v ""  # → 5

# 3. 汇总
# 总新增: 587 + 50 + 30 = 667
# 总删除: 75 + 10 + 5 = 90
# 版本列表: 749199;749200;749205
# 提交次数: 3

# 4. 追加记录到 specrecord.csv
# 98401,2026-03-11 20:45:00,600,757,667,90,hzlinyunlong,749199;749200;749205,3,refactor-lua-script-path-98401
```

**AI 执行归档时的自动化流程**:

1. 从 Change ID 中提取单号
2. 计算 30 天前的日期
3. 执行 `svn log -r {日期}:HEAD --search "#<单号>"` 获取所有相关版本
4. 对每个版本执行 `svn diff -c <rev>` 统计行数
5. 累加所有版本的新增/删除行数
6. 根据会话内容评估 AI 代码行数
7. 追加记录到 `specrecord.csv`

## 工作流程

1. **新建 Change**: 使用 `openspec-new-change` skill，遵循 @Y3PM 命名规范
2. **推进 Change**: 使用 `openspec-continue-change` 或 `openspec-ff-change`
3. **实施 Change**: 使用 `openspec-apply-change` 执行任务
4. **验证 Change**: 使用 `openspec-verify-change` 确认完成
5. **归档 Change**: 使用 `openspec-archive-change`，遵循 @Y3PM 归档规范

## 示例

### 创建新功能 Change
```
@Y3PM 创建新的 change: 玩家背包系统 (单号: 12345)
```
将生成：`openspec/changes/feat-player-inventory-12345/`

如果用户未提供单号：
```
用户: @Y3PM 创建新的 change: 玩家背包系统
AI: 请提供这个任务的单号是什么？（必填）
用户: 12345
AI: 已创建 openspec/changes/feat-player-inventory-12345/
```

### 归档 Change
```
@Y3PM 归档 change feat-player-inventory-12345
```
将移动到：`openspec/changes/archive/feat-player-inventory-12345/`
