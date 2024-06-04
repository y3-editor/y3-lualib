--MEMO:24-06-04 投射物meta临时补充

---@class EditorObject.Projectile: EditorObject.DataModule
---@field key py.ProjectileKey
---@field on_create? fun(projectile: Projectile) # 投射物创建时执行
---@field on_remove? fun(projectile: Projectile) # 投射物销毁时执行
--投射物的物编数据，你可以从里面读取或修改任意物编（部分字段无法修改）
--> 警告：请确保数据类型正确，否则可能导致崩溃
--> 警告：如果创建过此投射物再修改数据，行为是未定义的
---@field data Object.Projectile


--投射物
---@class Object.Projectile
--效果异步
---@field async_effect boolean
--描述
---@field description number
--敌方特效
---@field effect_foes Object.Projectile.Appearance
--友方特效
---@field effect_friend Object.Projectile.Appearance
--特效随投射物销毁立刻移除
---@field effect_destroy_way_is_immediately boolean
--icon
---@field icon number
--key
---@field key number
--kv
---@field kv Object.Projectile.Kv
--最大持续时间
---@field max_duration number
--移动通道
---@field move_channel number
--移动限制
---@field move_limitation number
--名字
---@field name string|integer
--声音是否循环
---@field sfx_loop boolean
--声音时间
---@field sound_event_list any[]
--编辑器后缀
---@field suffix string
--标签
---@field tags any[]
--UID
---@field uid string

---@class Object.Projectile.Appearance
--[[
    {101093, (0.0, 0.0, 0.0), (0.0, 0.0, 0.0), (2.0, 2.0, 2.0), 1.0,
    特效资源ID   Vec3偏移       Vec3旋转       Vec3缩放       播放速度
    {   挂接模型
        'anim': 'idle1', 动画
        'base_color_mod': 1, 颜色叠加
        'base_tint_color': [255, 255, 255, 0.5], 材质颜色
        'is_loop': True, 循环播放动画
        'model': 103014, 模型资源ID
        'model_opacity': 1.0, 模型透明度
        'offset': (0.0, 0.0, 0.0), 偏移
        'rotate': (0.0, 0.0, 0.0), 旋转
        'scale': (1.0, 1.0, 1.0),  缩放
        'use_base_tint_color': False 是否基础材质变色
    }}

]]

---@class Object.Projectile.Kv

---@class EditorObject.Projectile
---@field event fun(self: EditorObject.Projectile, event: "投射物-创建", callback: fun(trg: Trigger, data: EventParam.投射物-创建)): Trigger
---@field event fun(self: EditorObject.Projectile, event: "投射物-死亡", callback: fun(trg: Trigger, data: EventParam.投射物-死亡)): Trigger
