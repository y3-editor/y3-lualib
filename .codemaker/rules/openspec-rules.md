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

**⚠️ 单号是必填项！** 如果用户未提供单号，**必须使用 ask_user_question 工具询问单号**，否则不允许创建 change。

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

归档时**必须**在 `openspec/specrecord.txt` 中添加记录。

> ⚠️ **MUST 规则**:
> 1. 记录文件**必须**使用 `specrecord.txt`（不是 `.csv`），文件编码**必须**为 **UTF-8**（无 BOM）
> 2. **严禁修改文件编码格式**！读取和写入时都必须使用 UTF-8 编码，不得将文件转换为 GBK、UTF-8-BOM 或其他编码
> 3. 表头使用英文字段名，与下方字段说明一致

**记录文件格式**:
```
ticket_id,archive_time,ai_lines,total_lines,author,svn_revisions,commit_count,change_name,note
```

**字段说明**:
| 字段 | 说明 | 获取方式 |
|------|------|----------|
| ticket_id | 工单号 | Change ID 中的数字部分 |
| archive_time | 归档时间戳 | 当前时间，格式 `YYYY/M/D H:MM` |
| ai_lines | AI 辅助编写的代码行数 | 根据实际情况评估（通常等于代码行数） |
| total_lines | 本次变更涉及的代码行数 | 新增行数 + 删除行数（增删改都算修改） |
| author | SVN/Git 提交者 | 主要提交者（多人用分号分隔） |
| svn_revisions | 所有相关 SVN/Git 修订号 | 用分号分隔，如 `749199;749200;749205` |
| commit_count | 相关提交的总次数 | 整数 |
| change_name | Change ID | 完整的 change-id |
| note | 备注 | 可选，简要说明本次变更内容 |

**归档流程 - 第一步：检测版本控制系统类型**:

> ⚠️ **必须先检测仓库类型，再选择对应接口。** 禁止在 Git 仓库中使用 SVN 接口，反之亦然。

```bash
# 检测当前目录是否为 SVN 仓库
svn info 2>nul
# 若输出包含 "URL:" 则为 SVN 仓库；若报错则不是 SVN 仓库

# 检测当前目录是否为 Git 仓库
git rev-parse --is-inside-work-tree 2>nul
# 若输出 "true" 则为 Git 仓库
```

**判断逻辑（伪代码）**:
```
if svn info 成功:
    → 使用 SVN 流程（见下方 SVN 分支）
elif git rev-parse --is-inside-work-tree 成功:
    → 使用 Git 流程（见下方 Git 分支）
else:
    → 提示用户：当前目录不在任何已知版本控制仓库中，无法自动统计行数，请手动填写
```

---

#### SVN 分支 - 搜索所有相关提交

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

> ⚠️ **注意**: 只统计代码文件，**排除** `.md`、`.yaml`、`openspec/`、`.codemaker/` 目录的改动

```bash
# Step 1: 查看版本涉及的文件（排除文档和配置）
svn diff -c <rev> --summarize | findstr /V ".md .yaml openspec .codemaker"

# Step 2: 对筛选后的文件统计行数
svn diff -c <rev> <file1> <file2> ... | findstr /R "^+" | find /c /v ""   # 新增行数
svn diff -c <rev> <file1> <file2> ... | findstr /R "^-" | find /c /v ""   # 删除行数

# 将所有版本的行数累加得到总数
```

**SVN 完整归档流程示例**:
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

# 4. 追加记录到 specrecord.txt（UTF-8 编码）
# 98401,2026/3/11 20:45,600,757,hzlinyunlong,749199;749200;749205,3,refactor-lua-script-path-98401,
```

---

#### Git 分支 - 搜索所有相关提交

```bash
# Step 1: 搜索最近30天内包含单号的所有提交
# 计算30天前的日期
# Windows cmd:
# 使用 git log --since 参数直接指定

# Step 2: 获取包含单号的所有提交记录
git log --since="30 days ago" --all --oneline --grep="#<单号>"

# 示例: 搜索单号 98275 的所有提交
git log --since="30 days ago" --all --oneline --grep="#98275"
```

**统计每个提交的代码行数**:

> ⚠️ **注意**: 只统计代码文件，**排除** `.md`、`.yaml`、`openspec/`、`.codemaker/` 目录的改动

```bash
# Step 1: 查看某次提交涉及的文件（排除文档和配置）
git diff-tree --no-commit-id -r --name-only <commit_hash> | findstr /V ".md .yaml openspec .codemaker"

# Step 2: 对筛选后的文件统计行数
git diff <commit_hash>^..<commit_hash> -- ":(exclude)*.md" ":(exclude)*.yaml" ":(exclude)openspec/" ":(exclude).codemaker/" | findstr /R "^+" | find /c /v ""   # 新增行数
git diff <commit_hash>^..<commit_hash> -- ":(exclude)*.md" ":(exclude)*.yaml" ":(exclude)openspec/" ":(exclude).codemaker/" | findstr /R "^-" | find /c /v ""   # 删除行数

# 将所有提交的行数累加得到总数
```

**Git 完整归档流程示例**:
```bash
# 1. 搜索单号 98275 最近30天的所有提交
git log --since="30 days ago" --all --oneline --grep="#98275"

# 假设找到 3 个提交: 26a2d10, c713103, 9c69383

# 2. 分别统计每个提交的行数
# 提交 26a2d10:
git diff 26a2d10^..26a2d10 -- ":(exclude)*.md" ":(exclude)openspec/" | findstr /R "^+" | find /c /v ""  # → 1200
git diff 26a2d10^..26a2d10 -- ":(exclude)*.md" ":(exclude)openspec/" | findstr /R "^-" | find /c /v ""  # → 300

# 提交 c713103:
git diff c713103^..c713103 -- ":(exclude)*.md" ":(exclude)openspec/" | findstr /R "^+" | find /c /v ""  # → 400
git diff c713103^..c713103 -- ":(exclude)*.md" ":(exclude)openspec/" | findstr /R "^-" | find /c /v ""  # → 50

# 3. 汇总
# 总新增: 1200 + 400 + ... = 1667
# 总删除: 300 + 50 + ... = 117
# 版本列表: 26a2d10;c713103;9c69383
# 提交次数: 3

# 4. 追加记录到 specrecord.txt（UTF-8 编码）
# 98275,2026/3/18 16:24,1667,1784,王浩辰,26a2d10;c713103;9c69383,3,feat-codemaker-integration-with-y3helper-98275,CodeMaker集成Y3Helper
```

---

**AI 执行归档时的自动化流程**:

1. 从 Change ID 中提取单号
2. **检测仓库类型**（`svn info` 或 `git rev-parse --is-inside-work-tree`）
3. 计算 30 天前的日期
4. **根据仓库类型选择对应接口**：
   - **SVN**: 执行 `svn log -r {日期}:HEAD --search "#<单号>"` 获取所有相关版本
   - **Git**: 执行 `git log --since="30 days ago" --all --oneline --grep="#<单号>"` 获取所有相关提交
5. 对每个版本/提交执行 diff 统计行数（SVN: `svn diff -c`，Git: `git diff <hash>^..<hash>`）
6. 累加所有版本的新增/删除行数
7. 根据会话内容评估 AI 代码行数
8. 追加记录到 `specrecord.txt`（**必须保持 UTF-8 编码**）
9. **生成 `report.md` 归档报告**

### 9. 归档报告规范

归档时**必须**在归档目录下生成 `report.md` 文件，用于分享和汇报。

**报告文件位置**: `openspec/changes/archive/<date>-<change-id>/report.md`

**报告模板**:

```markdown
# 【AI进化】- 【<功能类型>-<功能描述>】

**需求制作人**: <姓名>
**AI 生成代码**: 客户端 X 行、服务端 Y 行
**AI 代码占比**: X%

---

**核心痛点**: <描述当前存在的问题，为什么需要这个改动>

**落地成效**: <描述改动后的效果，包含量化指标：提交次数、任务完成度、测试结果等>

**关键方法**: <描述使用的方法论和关键步骤>

**[解决分享]**: <总结经验和建议>
```

**示例**:
```markdown
# 【AI进化】- 【功能研发-俱乐部新增会员赠送】

**需求制作人**: AI
**AI 生成代码**: 客户端 365 行、服务端 3355 行
**AI 代码占比**: 100%

---

**核心痛点**: 当前的俱乐部体系缺少裂变动因，大部分会员行为留存在个人循环内。人工开发理解过往代码成本高。

**落地成效**: 基于 spec-coding 完成从需求到落地，AI 代码占比 100%。合计 4008 行，预估 12.5 人天，实际 8 人天。

**关键方法**: 根据需求文档让 AI 生成 spec 并人工校验，生成 task 列表依次执行，AI 生成测试用例保证正确性。

**[解决分享]**: 本次实践印证了 spec-coding 可行性，AI 能按文档快速生成代码，前期投入在文档校验，后期仅需少量人工验证。
```

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
