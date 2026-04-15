# Session Report: GridView 行列识别修复

## 日期
2026-04-03 18:30

## 关联变更
`openspec/changes/ui-gen-grid-list-support-98701/`

## 问题描述

用户测试 TC04、TC08、TC11 后发现以下问题：

### TC04 (背包 - GridView 4×5)
- **需求**: 4×5 格子（4列5行 = 20个格子）
- **实际**: `grid_count` 为 `(1, 32)` — 行数为1，列数被错误设置为32
- **原因**: SKILL.md 中 `data-rows` 默认值为 1，且属性表未标记为必填，AI 生成 HTML 时遗漏了 `data-rows`

### TC08 (英雄选择 - GridView 4×3)
- **需求**: 4列×3行 = 12个英雄格子
- **实际**: `grid_count` 为 `(1, 4)` — 行数为1
- **原因**: 同上，AI 只设置了 `data-cols` 没设置 `data-rows`

### TC11 (排行榜 - ScrollView)
- 需要正确设置 `data-direction`（vertical/horizontal），之前未强调

## 修复方案

### SKILL.md 修改

1. **Grid 属性表**:
   - `data-rows` 和 `data-cols` 均标记为 **必填**（无默认值）
   - 顺序调整为 rows 在前、cols 在后（与引擎 `grid_count = (rows, cols)` 一致）

2. **新增 "🔴 Grid 行列识别规则" 章节**:
   - 识别对照表：覆盖 "4×5 格子"、"4列×3行"、"3行4列"、"九宫格" 等常见描述
   - "N×M" 歧义处理：默认理解为 N列×M行（宽×高习惯）
   - 自动计算规则：未指定时根据 GridView 尺寸和子项尺寸计算

3. **新增 "🔴 List 布局方向规则" 章节**:
   - 场景对照表：排行榜→vertical, 横向列表→horizontal
   - `data-direction` 从可选改为必填

4. **草图/HTML 示例更新**:
   - Grid 示例增加 `data-rows="5"` 属性
   - List 示例增加 `data-direction="vertical"` / `data-direction="horizontal"`
   - 草图格式从 `[grid] 名称 (宽×高, cols=N)` 改为 `[grid] 名称 (宽×高, rows=M, cols=N)`
   - 列表格式增加 `direction=xxx`

## 影响文件
- `.codemaker/skills/y3-ui-generator/SKILL.md` — 行列识别规则、属性表、示例
