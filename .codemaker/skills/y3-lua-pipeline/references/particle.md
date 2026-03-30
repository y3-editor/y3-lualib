# Y3 粒子/特效 API 参考

> 本文档记录 Y3 引擎中粒子特效的创建和管理 API。

---

## 核心 API

### 创建粒子

```lua
---@param data table 粒子配置
---@return Particle? 粒子对象
y3.particle.create(data)
```

### 参数说明

| 参数 | 类型 | 必需 | 说明 |
|------|------|------|------|
| `type` | integer | ✅ | 特效物编 ID |
| `target` | Point | ✅ | 目标位置（必须是 Point 对象） |
| `scale` | number | ⚠️ | 缩放比例（默认 1.0） |
| `time` | number | ⚠️ | 持续时间（秒），-1 表示永久 |
| `height` | number | ⚠️ | 离地高度 |

---

## 使用示例

### 基础创建

```lua
-- 创建点
local point = y3.point.create(100, 200, 0)

-- 创建特效
local effect = y3.particle.create({
    type = 101117,      -- 特效 ID
    target = point,     -- 位置
    scale = 1.0,        -- 缩放
    time = -1,          -- 永久
    height = 10.0,      -- 高度
})
```

### 安全创建（推荐）

```lua
local function safe_create_particle(id, point, scale, height)
    local success, effect = pcall(function()
        return y3.particle.create({
            type = id,
            target = point,
            scale = scale or 1.0,
            time = -1,
            height = height or 0,
        })
    end)
    
    if success and effect then
        print("[Particle] 创建成功: ID=" .. id)
        return effect
    else
        print("[Particle] 创建失败: " .. tostring(effect))
        return nil
    end
end

-- 使用
local marker = safe_create_particle(101117, buildPoint, 1.0, 10.0)
```

---

## 常见问题

### 1. 特效不可见

| 原因 | 解决方案 |
|------|----------|
| scale 太小 | 增大 scale 值 |
| height 不正确 | 调整到合适高度 |
| 特效 ID 不存在 | 检查 editor_table 中的特效 |
| target 不是 Point | 使用 `y3.point.create()` |

### 2. 大地图特效配置

| 地图大小 | 建议 scale | 建议 height |
|----------|------------|-------------|
| 1024x1024 | 0.5-1.0 | 1.0-5.0 |
| 6400x6400 | 1.0-3.0 | 5.0-10.0 |
| 12800x12800 | 1.0-5.0 | 10.0-50.0 |

### 3. 常用特效 ID

> ⚠️ 特效 ID 因项目而异，以下仅供参考

| ID | 类型 | 用途 |
|----|------|------|
| 101117 | 光环 | 建造点标记 |
| 100001 | 基础特效 | 通用效果 |

---

## 验证命令

```bash
# 查看 particle API
grep -rn "function.*create" maps/EntryMap/script/y3/game/particle.lua

# 查看可用特效
ls editor_table/editoreffect/
```

---

*最后更新: 2026-03-11*
