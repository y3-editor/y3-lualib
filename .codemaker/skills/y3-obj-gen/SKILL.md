---
name: y3-obj-gen
description: >
  Generate Y3 editor object data (物编) JSON files for units, abilities, modifiers (Buff), and projectiles.
  
  ALWAYS use this skill when user mentions: 生成物编、创建单位、生成怪物、生成敌人、生成英雄、创建技能、
  创建Buff、创建魔法效果、创建投射物、批量生成单位、添加新单位、添加新技能、做个怪物、做个Boss、
  设计技能、设计Buff、物编数据、单位数据、技能数据、新建物编、制作单位、制作技能。
  
  Even if user doesn't explicitly say "物编", trigger this skill when they describe creating any game entity
  like monsters, heroes, abilities, buffs, or projectiles that need editor data.
version: 5.2
updated: 2026-03-18
---

# Y3 物编生成器 v5.2

AI 直接执行模式：读取资源库，语义匹配模型，**使用脚本**生成物编 JSON。

---

## 🚨 必须使用脚本生成（强制）

**物编 JSON 文件体量大（300+ 行），禁止 AI 直接手写！**

| 物编类型 | 生成脚本 | 命令示例 |
|----------|----------|----------|
| 单位 | `y3_obj_gen_ai.py` | `py -3 y3_obj_gen_ai.py -m "maps/EntryMap" --batch "怪物名:类型:模型ID:头像ID"` |
| 技能/Buff/投射物/物品 | `y3_obj_generator.py` | `py -3 y3_obj_generator.py -m "maps/EntryMap" -t ability -n "火球术"` |

### 为什么必须使用脚本？

| 问题 | 说明 |
|------|------|
| **Token 消耗** | 一个物编约 300-400 行，AI 输出成本极高 |
| **容易出错** | 手写大型 JSON 易遗漏字段、格式错误 |
| **难以维护** | 每次修改都需要重新生成完整文件 |

### AI 可以手写的情况

- 修改已有物编的**少量字段**（如 `dead_exp`、`dead_money`）
- 创建**配置文件**（< 50 行）

---

## 🚨 输出路径（必读）

**物编文件必须生成到 `maps/` 目录下，禁止生成到 `.codemaker/` 或其他位置！**

### 正确路径

```
{map_path}/editor_table/{type_dir}/{id}.json
    ↓              ↓         ↓       ↓
maps/EntryMap  固定目录   类型目录   物编ID
```

| 正确示例 | 错误示例 |
|----------|----------|
| `maps/EntryMap/editor_table/editorunit/` | ❌ `.codemaker/skills/.../editor_table/` |
| `maps/EntryMap/editor_table/abilityall/` | ❌ `./editor_table/` |

---

## 🎯 AI 模型匹配流程

### 步骤 1：读取数据源

| 数据源 | 获取方式 | 说明 |
|--------|----------|------|
| 预设资源表 | 读取 `excels/resources.csv` | 169 条预配置资源（含模型、头像、特效） |
| 官方模型库 | **MCP 工具获取** | 通过 `y3editor.get_official_editor_model` 获取完整模型列表 |

> ⚠️ **注意**：项目中不包含本地模型库文件，必须通过 MCP 获取模型信息！

### MCP 模型查询

```
工具: y3editor.get_official_editor_model
参数: 
  - 不传 ID → 返回完整模型列表（56000+ 条）
  - 传入 ID → 返回单个模型详情
返回: [{ "ID", "类型", "名称", "标签" }, ...]
```

**工作流程**：
1. 先在 `resources.csv` 中查找（优先使用预设配置）
2. 如果没有合适的 → 调用 MCP 获取官方模型列表
3. AI 从返回的模型列表中根据名称和标签进行语义匹配，选择最合适的模型

### 🔍 MCP 返回数据处理

MCP 返回的数据会保存到临时文件 `.codemaker/cmtmp/` 目录下。由于数据量很大（56000+），需要使用脚本搜索：

**搜索特定名称的模型**：
```python
# 创建临时脚本搜索蜘蛛相关模型
content = open(r'临时文件路径', encoding='utf-8').read()
pos = 0
while True:
    idx = content.find('蛛', pos)
    if idx == -1:
        break
    print(content[max(0,idx-300):idx+150])
    pos = idx + 1
```

**模型选择示例（火焰蜘蛛）**：

| ID | 名称 | 标签 | 适合度 |
|-----|------|------|--------|
| 100409 | 蜘蛛女妖 | boss, 妖精, 蜘蛛, 紫色 | ❌ Boss级别 |
| 100642 | 蜘蛛怪 | boss, 蜘蛛, 紫色 | ❌ Boss级别 |
| 100788 | 毒蛛 | **喽啰**, 兽族, 蜘蛛, 紫色 | ✅ 小怪级别 |
| **100906** | **血蜘蛛** | 宠物, 蜘蛛, **红色** | ✅✅ **最佳**（红色=火焰感） |
| 101415 | 蜘蛛 | 怪物, 蜘蛛, 白色 | ✅ 基础蜘蛛 |

**选择逻辑**：
- 「火焰蜘蛛」→ 优先找红色/橙色的蜘蛛模型
- 「近战小怪」→ 排除 boss 标签，优先 喽啰/宠物 标签
- 最终选择：**100906 血蜘蛛**（红色符合火焰主题）

### 步骤 2：匹配优先级

```
1. resources.csv 精确匹配 → 预设名称 == 单位名称
2. resources.csv 语义匹配 → 预设名称/标签 与单位描述语义相关
3. MCP 模型列表匹配      → 从官方模型库中按名称/标签语义选择
4. 兜底默认              → 使用默认模型 134224609（怪物锤手）
```

### 步骤 3：AI 选择逻辑

AI 应该考虑：
- **名称语义**：「丛林蜘蛛」→ 找带「蜘蛛」「丛林」「森林」标签的模型
- **类型体型**：「Boss」→ 找体型较大、气势强的模型；「小怪」→ 普通体型
- **风格一致**：同一批单位尽量选同一美术风格（写实/卡通/国风）
- **⚠️ 避免重复**：同一批次生成的单位，尽量使用不同的模型（见下方规则）

### 💡 攻击类型不是硬性筛选条件

**远程/近战可以通过调整特效配置来转换**，选择模型时优先考虑外观匹配度：

| 场景 | 处理方式 |
|------|----------|
| 目标是**远程**，但选中的模型是**近战** | ✅ 给单位加上弹道特效和受击特效 |
| 目标是**近战**，但选中的模型是**远程** | ✅ 把弹道特效移除（设为 0） |

**示例**：用户要「火焰蜘蛛，近战小怪」
- 最佳模型是「血蜘蛛」（红色，符合火焰主题）
- 即使「血蜘蛛」原本是远程配置，也可以选择它
- 生成物编时，将 `attack_trajectory.effect` 设为 `0`，变成近战

### 🚫 避免重复匹配规则

1. **批量生成时**：AI 必须记录已选择的模型 ID，后续单位不得重复使用
2. **检查已有物编**：生成前扫描 `editor_table/editorunit/` 目录，获取已使用的模型 ID 列表
3. **优先选择未使用的**：在多个候选模型中，优先选择未被使用过的
4. **冲突处理**：如果所有合适的模型都已使用，可以：
   - 选择次优但未使用的模型
   - 询问用户是否允许重复
   - 使用默认模型

### 步骤 4：确认与生成

| 场景 | 行为 |
|------|------|
| 单个单位 | 直接生成，输出匹配理由 |
| 批量单位 | 先列出匹配结果表格让用户确认，确认后再生成 |

### 匹配结果输出格式

```markdown
| 单位名称 | 模型ID | 模型名称 | 匹配来源 | 匹配理由 |
|----------|--------|----------|----------|----------|
| 丛林蜘蛛 | 211064 | 蛛魔 | resources | 预设名称语义相近，远程小怪 |
| 火焰法师 | 211025 | 哥布林法师 | resources | 远程英雄，法师类型 |
```

> 💡 如果存在重复风险，在表格中标注 `⚠️ 重复` 提醒用户

### 步骤 5：编辑器下载资源

**物编生成完成后，统计新增物编中使用的资源 ID，通过 MCP 工具下载到编辑器。**

#### 资源类型与提取规则

| 资源类型 | 物编类型 | 字段路径 | MCP 工具 |
|----------|----------|----------|----------|
| **模型** | 单位 | `model` | `download_editor_model_resource` |
| **模型** | 物品 | `model` | `download_editor_model_resource` |
| **模型** | 魔法效果 | `model` | `download_editor_model_resource` |
| **模型** | 魔法效果 | `attach_model_list[*].model` | `download_editor_model_resource` |
| **模型** | 投射物 | `effect_foes[5]['model']` | `download_editor_model_resource` |
| **特效** | 投射物 | `effect_foes[0]` | `download_editor_effect_resource` |
| **特效** | 魔法效果 | `get_effect_list[*][0]` | `download_editor_effect_resource` |
| **特效** | 魔法效果 | `lose_effect_list[*][0]` | `download_editor_effect_resource` |
| **图标** | 单位 | `icon` | `download_editor_icon_resource` |
| **图标** | 技能 | `ability_icon` | `download_editor_icon_resource` |
| **图标** | 物品 | `icon` | `download_editor_icon_resource` |
| **图标** | 魔法效果 | `modifier_icon` | `download_editor_icon_resource` |
| **图标** | 投射物 | `icon` | `download_editor_icon_resource` |

#### 下载流程

1. **统计资源**：遍历新增物编，按上表提取资源 ID
2. **去重合并**：相同类型的资源 ID 合并到一个列表
3. **批量下载**：调用对应 MCP 工具下载

#### 示例

假设新增了 1 个单位、1 个技能、1 个魔法效果：

```
新增资源统计:
- 模型: [211128, 211131]
- 特效: [106009]
- 图标: [132974, 100508]

MCP 调用:
1. download_editor_model_resource(editor_model_id_list=[211128, 211131])
2. download_editor_effect_resource(editor_effect_id_list=[106009])
3. download_editor_icon_resource(editor_icon_id_list=[132974, 100508])
```

> ⚠️ **注意**：资源 ID 为 `0` 或不存在的字段无需下载

### 步骤 6：热更并保存 🔴🔴🔴

**⚠️ 必须先热更再保存，否则生成的内容会丢失！**

#### 执行顺序（必须严格遵守）

```
1. 热更物编（让编辑器读取新的 JSON）
   └─ use_mcp_tool: y3editor.hotfix_object_editor

2. 等待 3 秒（让编辑器完成内存同步）

3. 保存（让编辑器将内存数据写入 GMP）
   └─ use_mcp_tool: y3editor.save_editor
```

#### MCP 调用示例

```
# 1. 热更物编
use_mcp_tool:
  server_name: "y3editor"
  tool_name: "hotfix_object_editor"
  arguments: {}

# 2. 等待 3 秒（必须）

# 3. 保存
use_mcp_tool:
  server_name: "y3editor"
  tool_name: "save_editor"
  arguments: {}
```

#### ❌ 错误做法（会导致内容丢失！）

```
# 错误：只保存不热更
use_mcp_tool:
  server_name: "y3editor"
  tool_name: "save_editor"  ← 直接保存，物编内容会丢失！
  arguments: {}
```

> ⚠️ **多语言特殊情况**：如果同时修改了 `zhlanguage.json`，参见下方"多语言文件规范"章节的保存顺序说明。

---

## 🎯 支持的物编类型

| 类型 | 存储目录 | ID 范围 | 模板文件 |
|------|----------|---------|----------|
| 单位 | `editorunit/` | 100001-499999 | 见下方单位类型表 |
| 技能 | `abilityall/` | 100001001+ | 主动技能模板.json |
| 魔法效果 | `modifierall/` | 100001101+ | 魔法效果模板.json |
| 投射物 | `projectileall/` | 100001201+ | 投射物模板.json |
| 物品 | `editoritem/` | 500001+ | 物品模板.json |

---

## 🚀 单位生成

### 单位类型与模板

| 类型 | ID前缀 | 模板 |
|------|--------|------|
| `近战小怪` | 2xxxxx | 近程小怪模板.json |
| `远程小怪` | 2xxxxx | 远程小怪模板.json |
| `近战精英` | 3xxxxx | 近战boss模板.json |
| `远程精英` | 3xxxxx | 远程boss模板.json |
| `近战boss` | 4xxxxx | 近战boss模板.json |
| `远程boss` | 4xxxxx | 远程boss模板.json |
| `近战英雄` | 1xxxxx | 近战英雄模板.json |
| `远程英雄` | 1xxxxx | 远程英雄模板.json |
| `建筑` | - | 建筑模板.json |

### ID 分配规则

```
英雄: 100001 - 199999 (前缀 1)
小怪: 200001 - 299999 (前缀 2)
精英: 300001 - 399999 (前缀 3)
Boss: 400001 - 499999 (前缀 4)
```

### 生成单位时 AI 需要：

1. **检查已有 ID**：扫描 `editor_table/editorunit/` 目录，获取下一个可用 ID
2. **读取模板**：从 `data_template/` 加载对应类型的模板 JSON
3. **匹配模型**：按照上述匹配流程选择模型
4. **填充字段**：
   - `key`: 单位 ID（整数）
   - `uid`: 单位 ID（字符串）
   - `name`: 多语言键（使用 murmur3 hash）
   - `model`: 模型 ID
   - `icon`: 头像 ID
   - 攻击特效（如果是远程）
   - **击杀奖励**（怪物单位必填，见下表）
5. **更新多语言**：在 `zhlanguage.json` 添加名称映射
6. **保存文件**：输出到 `editor_table/editorunit/{id}.json`

### 🎯 击杀奖励字段（重要！）

**怪物单位必须配置击杀奖励，引擎会自动发放，无需 Lua 代码！**

| 字段名 | 用途 | 示例值 |
|--------|------|--------|
| `reward_exp` | 击杀经验奖励 | 小怪=10, 精英=50, Boss=200 |
| `reward_official_res_1` | 击杀金币奖励 | 小怪=5, 精英=30, Boss=100 |

**⚠️ 注意**：`dead_exp` 和 `dead_money` 字段**不是**击杀奖励字段，不要搞混！

```json
// ✅ 正确 - 使用 reward_* 字段
{
    "reward_exp": 50,
    "reward_official_res_1": 25
}

// ❌ 错误 - 这些字段不是击杀奖励
{
    "dead_exp": 50,   // 错误！
    "dead_money": 25  // 错误！
}
```

| 单位类型 | 推荐 reward_exp | 推荐 reward_official_res_1 |
|----------|-----------------|---------------------------|
| 小怪 | 10-20 | 5-10 |
| 精英 | 50-80 | 25-50 |
| Boss | 150-300 | 80-150 |

### 🎁 死亡掉落物品配置

**怪物单位可以配置死亡时掉落物品，引擎会自动处理掉落！**

| 字段名 | 用途 | 格式 |
|--------|------|------|
| `drop_items_tuple` | 死亡掉落物品列表 | `[[物品ID, 概率], ...]` |

**⚠️ 格式注意事项**：
- 这个字段**不需要** `__tuple__` 包装，直接使用数组格式
- 每个元素是 `[物品ID, 掉落概率]`，概率范围 `0.0 - 1.0`
- 概率必须是**浮点数**（如 `1.0`、`0.5`），不是整数

```json
// ✅ 正确格式
"drop_items_tuple": [
    [510001, 1.0],    // 100% 掉落物品 510001
    [510002, 0.5],    // 50% 掉落物品 510002
    [510003, 0.3]     // 30% 掉落物品 510003
]

// ❌ 错误格式 - 不要使用 __tuple__ 包装
"drop_items_tuple": {
    "__tuple__": true,
    "items": [[510001, 50, 1]]  // 错误！
}

// ❌ 错误格式 - 概率不是浮点数
"drop_items_tuple": [
    [510001, 50, 1]   // 错误！应该是 [510001, 0.5]
]
```

| 单位类型 | 推荐掉落概率 |
|----------|--------------|
| 小怪 | 0.1 - 0.3 (10%-30%) |
| 精英 | 0.5 - 0.8 (50%-80%) |
| Boss | 1.0 (100%) |

### 多语言键生成

使用 murmur3 32-bit hash：

```python
import mmh3
def murmur3_hash(text: str) -> int:
    return mmh3.hash(text, signed=True)
    # 示例: murmur3_hash("火焰蜘蛛") → -982215672
```

**命令行计算**：
```bash
py -3 -c "import mmh3; print(mmh3.hash('单位名称', signed=True))"
```

---

## 🌐 多语言文件规范（重要！）

### 文件位置
```
{map_path}/zhlanguage.json
```

### ⚠️ 格式要求

**必须使用 Unicode 编码**，不能直接写中文字符：

```json
// ✅ 正确格式 - 使用 \uXXXX 编码
{
    "-982215672": "\u706b\u7130\u8718\u86db"
}

// ❌ 错误格式 - 直接写中文
{
    "-982215672": "火焰蜘蛛"
}
```

**Unicode 转换命令**：
```bash
py -3 -c "s = '火焰蜘蛛'; print(''.join(f'\\u{ord(c):04x}' for c in s))"
# 输出: \u706b\u7130\u8718\u86db
```

### ⚠️ 新增多语言条目生效方式

编辑器**不会**自动加载新增的多语言条目！需要以下方式之一：

| 方式 | 说明 |
|------|------|
| **重新打开地图** | 关闭地图后重新打开，编辑器会重新加载 zhlanguage.json |
| **编辑器内修改** | 在编辑器中直接修改单位名称，会自动更新多语言表 |

> 💡 **提示**：`hotfix_object_editor` 只能热更物编数据，不能热更多语言文件！

### ⚠️ 保存顺序

**统一规则**：所有物编改动都遵循同一顺序：**热更 → 等待 3 秒 → 保存**。

**正确的操作顺序**：
1. 生成物编 JSON 文件
2. 热更物编 (`hotfix_object_editor`)
3. 等待 3 秒（让编辑器完成内存同步）
4. 保存 (`save_editor`)
5. 如果修改了 `zhlanguage.json`，建议关闭并重新打开地图以确认多语言显示

---

## ⚔️ 技能物编生成

### 手动创建流程

1. **复制模板**: `data_template/主动技能模板.json`
2. **修改必要字段**:
   - `key`: 技能ID（整数）
   - `uid`: 技能ID（字符串）
   - `name`: 名称TID
   - `description`: 描述TID
3. **保存到**: `{map_path}/editor_table/abilityall/{id}.json`
4. **绑定到单位**: 修改单位物编的 `hero_ability_list`

### 技能关键字段

| 字段 | 说明 | 示例值 |
|------|------|--------|
| `ability_cast_type` | 技能类型 | 2=主动技能 |
| `sight_type` | 释放方式 | 0=立即, 1=圆形选地点, 2=扇形, 3=箭头, 4=选目标 |
| `cold_down_time` | 冷却时间 | `["8"]` (数组格式) |
| `ability_cost` | 魔法消耗 | `["70"]` |
| `ability_damage` | 基础伤害 | `["150"]` |
| `ability_cast_range` | 施法距离 | `["10.0"]` |
| `ability_damage_range` | 伤害范围 | `["3.0"]` |
| `ability_max_level` | 最大等级 | 5 |
| `is_immediate` | 是否立即释放 | true/false |
| `is_meele` | 是否近战 | true/false |
| `ability_icon` | 技能图标ID | 100508 |

### 技能 ID 规范

```
[英雄ID][技能槽位][等级修饰]
  100001  00       1
     ↓     ↓       ↓
   洛坦    Q      基础
```

| 英雄 | Q 技能 | W 技能 | E 技能 | R 技能 |
|------|--------|--------|--------|--------|
| 洛坦 (100001) | 100001001 | 100001002 | 100001003 | 100001004 |
| 莉莉娅 (100002) | 100002001 | 100002002 | 100002003 | 100002004 |
| ... | ... | ... | ... | ... |

### 绑定技能到英雄

修改单位物编中的 `hero_ability_list` 和 `common_ability_list`：

```json
// ✅ 正确格式 - 必须使用 __tuple__ 包装
"hero_ability_list": {
    "__tuple__": true,
    "items": [
        [100001001, 1],  // [技能ID, 技能槽位]
        [100001002, 2],
        [100001003, 3],
        [100001004, 4]
    ]
},
"common_ability_list": {
    "__tuple__": true,
    "items": [
        [100001005, 1]
    ]
}
```

> ⚠️ **注意**：技能列表字段**必须使用** `__tuple__` 格式，与其他数组字段保持一致！
> 
> ```json
> // ❌ 错误格式 - 会导致地图无法加载
> "hero_ability_list": [
>     [100001001, 1]
> ]
> ```

---

## 🛡️ 魔法效果（Buff/Debuff）生成

### 手动创建流程

1. **复制模板**: `data_template/魔法效果模板.json`
2. **修改必要字段**
3. **保存到**: `{map_path}/editor_table/modifierall/{id}.json`

### 魔法效果关键字段

| 字段 | 说明 | 示例值 |
|------|------|--------|
| `modifier_type` | Buff类型 | 1=增益, 2=减益 |
| `layer_max` | 最大层数 | 1 |
| `disappear_when_dead` | 死亡消失 | true |
| `modifier_icon` | 图标ID | 100008 |
| `show_on_ui` | UI显示 | true |
| `material_color` | 材质颜色 | [255, 255, 100] |

### 魔法效果 ID 规范

```
[英雄ID][1][序号]
  100001  1  01
     ↓    ↓   ↓
   洛坦 Buff  眩晕
```

---

## 🚀 投射物生成

### 手动创建流程

1. **复制模板**: `data_template/投射物模板.json`
2. **修改必要字段**
3. **保存到**: `{map_path}/editor_table/projectileall/{id}.json`

### 投射物关键字段

| 字段 | 说明 |
|------|------|
| `effect_foes` | 对敌特效配置 |
| `effect_friend` | 对友特效配置 |
| `max_duration` | 最大持续时间 |
| `move_channel` | 移动通道 |

### 投射物 ID 规范

```
[英雄ID][2][序号]
  100001  2  01
     ↓    ↓   ↓
   洛坦 弹道  基础
```

---

## 🎁 物品物编生成

### 手动创建流程

1. **复制模板**: `data_template/物品模板.json`
2. **修改必要字段**
3. **保存到**: `{map_path}/editor_table/editoritem/{id}.json`

### 物品 ID 规范

```
物品ID: 500001 - 599999 (前缀 5)
消耗品: 500001 - 509999
装备:   510001 - 519999
材料:   520001 - 529999
```

### 物品关键字段

| 字段 | 说明 | 示例值 |
|------|------|--------|
| `key` | 物品ID（整数） | `500001` |
| `uid` | 物品ID（字符串） | `"500001"` |
| `name` | 名称TID（murmur3 hash） | `-1935409530` |
| `description` | 描述TID | `1917686408` |
| `icon` | 物品图标ID | `100000` |
| `model` | 掉落物模型ID | `10022` |
| `level` | 物品等级 | `1` |
| `maximum_stacking` | 最大堆叠数量 | `5` |
| `maximum_charging` | 最大充能数量 | `5` |
| `cur_stack` | 初始堆叠数量 | `1` |
| `cur_charge` | 初始充能数量 | `0` |
| `auto_use` | 是否自动使用 | `false` |
| `use_consume` | 使用消耗类型 | `1` |
| `discard_enable` | 可丢弃 | `true` |
| `discard_when_dead` | 死亡时丢弃 | `true` |
| `delete_on_discard` | 丢弃时删除 | `false` |
| `sale_enable` | 可出售 | `true` |
| `drop_stay_time` | 掉落物存在时间 | `9999` |
| `hp_max` | 掉落物最大生命 | `100` |

### 物品属性附加字段

| 字段 | 说明 |
|------|------|
| `attached_hp_max` | 附加最大生命 |
| `attached_hp_rec` | 附加生命恢复 |
| `attached_strength` | 附加力量 |
| `attached_agility` | 附加敏捷 |
| `attached_intelligence` | 附加智力 |
| `attached_critical_chance` | 附加暴击率 |
| `attached_dodge_rate` | 附加闪避率 |
| `attached_hit_rate` | 附加命中率 |
| `attached_pene_phy` | 附加物理穿透 |
| `attached_pene_mag` | 附加魔法穿透 |

### 物品技能绑定

```json
// 主动技能
"attached_ability": {
    "__tuple__": true,
    "items": [100001001]  // 技能ID列表
}

// 被动技能
"attached_passive_abilities": {
    "__tuple__": true,
    "items": [100001002]  // 被动技能ID列表
}
```

### 物品合成配方

```json
"compose_list": {
    "__tuple__": true,
    "items": [
        [500002, 1],  // [物品ID, 数量]
        [500003, 2]
    ]
}
```

### 物品购买/出售价格

```json
// 购买价格（资源类型 -> 数量）
"buy_res_list": {
    "__tuple__": true,
    "items": [
        ["gold", 100]  // [资源类型, 数量]
    ]
}

// 出售价格
"sell_res_list": {
    "__tuple__": true,
    "items": [
        ["gold", 50]
    ]
}
```

---

## 📁 文件结构

```
y3-obj-gen/
├── SKILL.md                           ← 本文件
├── scripts/
│   ├── y3_obj_gen_ai.py               ← 单位物编生成脚本 (AI协作版)
│   └── y3_obj_generator.py            ← 技能/魔法效果/投射物/物品生成脚本
├── data_template/                     ← 物编模板
│   ├── 近程小怪模板.json
│   ├── 远程小怪模板.json
│   ├── 近战boss模板.json
│   ├── 远程boss模板.json
│   ├── 近战英雄模板.json
│   ├── 远程英雄模板.json
│   ├── 建筑模板.json
│   ├── 主动技能模板.json
│   ├── 魔法效果模板.json
│   ├── 投射物模板.json
│   └── 物品模板.json
└── excels/
    └── resources.csv                  ← 预设资源配置 (169条)
```

> 📌 **官方模型库**：不存储本地文件，通过 MCP `y3editor.get_official_editor_model` 按需查询

---

## 📂 输出目录

| 物编类型 | 输出路径 |
|----------|----------|
| 单位 | `{map_path}/editor_table/editorunit/{id}.json` |
| 技能 | `{map_path}/editor_table/abilityall/{id}.json` |
| 魔法效果 | `{map_path}/editor_table/modifierall/{id}.json` |
| 投射物 | `{map_path}/editor_table/projectileall/{id}.json` |
| 物品 | `{map_path}/editor_table/editoritem/{id}.json` |
| 多语言 | `{map_path}/zhlanguage.json` |

---

## ⚠️ 重要规则

### 字段类型要求

| 字段 | 正确类型 | 错误示例 |
|------|----------|----------|
| `uid` | 字符串 `"100001001"` | ❌ 整数 |
| `key` | 整数 `100001001` | ✓ |
| `name` / `description` | TID 整数 | ✓ |
| 数值数组 | `["10.0"]` | ❌ `[10.0]` |
| **`kv` 字段** | 空对象 `{}` | ❌ `{"key": 1.5}` **会导致地图损坏！** |

### ⛔ KV 字段警告

**绝对不要**在物编的 `kv` 字段中使用原始类型值：

```json
// ❌ 错误 - 会导致编辑器崩溃，地图无法打开
"kv": {
    "stun_duration": 1.5,
    "damage": 100
}

// ✅ 正确 - 保持空对象
"kv": {}
```

如果需要自定义参数，应该使用 Lua 代码在运行时处理，而不是写入物编 KV。

### __tuple__ 格式

Y3 使用特殊的 tuple 格式表示数组：

```json
"cold_down_time": {
    "__tuple__": true, 
    "items": ["8"]
}
```

### 热更物编

修改物编后可通过 MCP 热更：
```
y3editor.hotfix_object_editor
```

---

## 🔧 完整示例：创建一个技能

### 1. 创建技能物编 `100001001.json`

```json
{
    "_custom_": true,
    "key": 100001001,
    "uid": "100001001",
    "name": 100001001,
    "description": 100001001,
    "ability_cast_type": 2,
    "sight_type": 0,
    "cold_down_time": {"__tuple__": true, "items": ["8"]},
    "ability_cost": {"__tuple__": true, "items": ["70"]},
    "ability_damage": {"__tuple__": true, "items": ["150"]},
    "ability_icon": 134239299,
    "is_immediate": true,
    // ... 其他字段从模板复制
}
```

### 2. 绑定到英雄

修改 `editorunit/100001.json`:
```json
"hero_ability_list": {
    "__tuple__": true,
    "items": [[100001001, 1]]
}
```

### 3. 编写技能效果脚本

```lua
y3.game:event('技能-释放结束', function(trg, data)
    local ability = data.ability
    if ability:get_key() == 100001001 then
        -- 执行技能效果
    end
end)
```

---

## 🔄 从 resources.csv 获取完整配置

当从 `resources.csv` 匹配到预设时，可以获取完整的视觉配置：

| 字段 | 说明 |
|------|------|
| `预设名称` | 用于匹配的名称 |
| `模型ID` | 单位模型 |
| `头像ID` | 单位头像（icon 字段） |
| `攻击类型` | 0=近战, 1=远程 |
| `弹道特效ID` | 远程攻击弹道特效 |
| `受击特效ID` | 受击时特效 |
| `标签` | 用于语义匹配的标签 |

### 攻击特效配置

`simple_common_atk` 中的特效配置决定了攻击表现：

```json
"simple_common_atk": {
    "attack_trajectory": {
        "effect": 102892,  // 弹道特效ID（0=无弹道，即近战）
        // ...
    },
    "hit_effect": {
        "effect": 104982,  // 受击特效ID
        // ...
    }
}
```

### 🔄 远程/近战转换配置

| 转换方向 | 配置修改 |
|----------|----------|
| **近战 → 远程** | `attack_trajectory.effect` 设为弹道特效 ID（如 102892） |
| **远程 → 近战** | `attack_trajectory.effect` 设为 `0` |

**常用弹道特效 ID**（可从 `resources.csv` 获取）：
- `102892` - 黄色弹道
- `102106` - 绿色弹道  
- `102107` - 火焰弹道
- `104317` - 红色受击

**示例：将远程模型改为近战**
```json
"simple_common_atk": {
    "attack_trajectory": {
        "effect": 0,  // 设为0，无弹道 = 近战
        "duration": -1.0,
        // ... 其他字段保持不变
    }
}
```

---

*最后更新: 2026-03-16 v5.1 - 补充多语言规范和MCP搜索经验*
