---@enum en单位属性类型
em单位属性类型 = {
    基础属性 = "ATTR_BASE",
    基础属性加成 = "ATTR_BASE_RATIO",
    增益属性 = "ATTR_BONUS",
    增益属性加成 = "ATTR_BONUS_RATIO",
    总属性加成 = "ATTR_ALL_RATIO",
    实际属性 = "ATTR_RESULT", --仅用于获取,不可设置
    额外属性 = "ATTR_OTHER" -- 仅用于获取,不可设置
}

---@enum em单位状态
em单位状态 = {
    禁止普攻 = 2,
    禁止施法 = 4,
    禁止移动 = 8,
    禁止转向 = 16,
    动画定帧 = 32,
    无法施加运动 = 64,
    无法被技能指示器锁定 = 128,
    无法被选中 = 256,
    隐身 = 512,
    无视静态碰撞 = 1024,
    无视动态碰撞 = 2048,
    不会死亡 = 4096,
    无敌 = 8192,
    无法控制 = 16384,
    无法被攻击 = 32768,
    AI无视 = 65536,
    物理伤害免疫 = 131072,
    魔法伤害免疫 = 262144,
    负面魔法效果免疫 = 524288,
    隐藏 = 1048576,
    无法被筛选器选中 = 2097152,
    真实伤害免疫 = 4194304,
    禁止使用道具 = 8388608,
}

---@param 单位 Unit
---@param 标签 string[]
function 单位_添加标签(单位, 标签)
    for index, value in ipairs(标签) do
        y3.unit.add_tag(单位, value)
    end
end

---@param 单位 Unit
---@param 名 string
---@param 值 any
function 单位_设置自定义值(单位, 名, 值)
    y3.unit.kv_save(单位, 名, 值)
end

---@param 单位 Unit
---@param 名 string
---@return  any 值
function 单位_获取自定义值(单位, 名, 值)
    return y3.unit.kv_load(单位, 名, 值)
end

---@param 单位 Unit
---@param 标签 string[]
function 单位_移除标签(单位, 标签)
    for index, value in ipairs(标签) do
        y3.unit.remove_tag(单位, value)
    end
end

---@param 单位 Unit
---@param 标签 string
---@return boolean
function 单位_是否存在标签(单位, 标签)
    return y3.unit.has_tag(单位, 标签)
end

---@param id py.UnitID
---@return Unit?
function 单位_从ID获取(id)
    return y3.unit.get_by_id(id)
end

---@param id integer 编辑器场景编辑器中的id
---@return Unit
function 单位_获取场景中单位(id)
    return y3.unit.get_by_res_id(id)
end

---@param 单位 Unit
---@return boolean
function 单位_是否存在(单位)
    return y3.unit.is_exist(单位)
end

---@param 单位 Unit
---@return integer
function 单位_获取唯一ID(单位)
    return y3.unit.get_id(单位)
end

---@param 技能分类 ENUM技能分类
---@param 技能id py.AbilityKey
function 单位_移除技能(单位, 技能分类, 技能id)
    y3.unit.remove_abilitiy_by_key(单位, 技能分类, 技能id)
end

---@param 单位 Unit
---@param 物品id py.ItemKey
---@return Item
function 单位_添加物品(单位, 物品id)
    return y3.unit.add_item(单位, 物品id)
end

---@param 单位 Unit
---@param 物品id py.ItemKey
---@param 数量 integer
function 单位_移除物品(单位, 物品id, 数量)
    y3.unit.remove_item(单位, 物品id, 数量)
end

---@param 单位 Unit
---@param type ENUM技能分类
---@return Ability[]
function 单位_获取指定分类所有技能(单位, type)
    return y3.unit.get_abilities_by_type(单位, type)
end

---@param 单位 Unit
---@return Buff[]
function 单位_获取身上所有魔法鲜果(单位)
    y3.unit.get_buffs(单位)
    return y3.unit.get_buffs(单位)
end

---@param 单位 Unit
---@param 技能1 Ability
---@param 技能2 Ability
function 单位_交换技能(单位, 技能1, 技能2)
    y3.unit.switch_ability(单位, 技能1, 技能2)
end

---@param 单位 Unit
---@param 技能分类1 ENUM技能分类
---@param 槽位1 y3.Const.AbilityIndex 第一个技能坑位
---@param 技能分类2 ENUM技能分类
---@param 槽位2 y3.Const.AbilityIndex 第二个技能坑位
function 单位_交换技能槽位(单位, 技能分类1, 槽位1, 技能分类2, 槽位2)
    y3.unit.switch_ability_by_slot(单位, 技能分类1, 槽位1, 技能分类2, 槽位2)
end

---@param 单位 Unit
function 单位_停止所有技能(单位)
    y3.unit.stop_all_abilities(单位)
end

---@param 单位 Unit
---@param 技能分类 ENUM技能分类
---@param id py.AbilityKey
---@param 槽位? integer
---@param 等级? integer
---@return Ability?
function 单位_添加技能(单位, 技能分类, id, 槽位, 等级)
    return y3.unit.add_ability(单位, 技能分类, id, 槽位, 等级)
end

---@param 单位 Unit
---@param 技能分类 ENUM技能分类
---@param 槽位 y3.Const.AbilityIndex 技能位
function 单位_移除技能(单位, 技能分类, 槽位)
    y3.unit.remove_ability(单位, 技能分类, 槽位)
end

---@param 单位 Unit
---@param 技能分类 ENUM技能分类
---@param 技能id py.AbilityKey 物编id
---@return Ability? ability 技能
function 单位_寻找技能(单位, 技能分类, 技能id)
    return y3.unit.find_ability(单位, 技能分类, 技能id)
end

---@param 单位 Unit
---@param 技能分类 ENUM技能分类
---@param 槽位 y3.Const.AbilityIndex 技能位
---@return Ability? ability 技能
function 单位_获取槽位技能(单位, 技能分类, 槽位)
    return y3.unit.get_ability_by_slot(单位, 技能分类, 槽位)
end

---@param 单位 Unit
---@param 背包槽位类型 ENUM背包槽位类型
---@param 槽位 integer 位置
---@return Item? item 物品
function 单位_获取背包槽位物品(单位, 背包槽位类型, 槽位)
    return y3.unit.get_item_by_slot(单位, 背包槽位类型, 槽位)
end

---@param 单位 Unit
---@return ItemGroup item_group 所有物品
function 单位_获取所有物品(单位)
    return y3.unit.get_all_items(单位)
end

---@param 单位 Unit
---@param 科技类型 py.TechKey 科技类型
function 单位_获得科技(单位, 科技类型)
    y3.unit.unit_gains_tech(单位, 科技类型)
end

---@param 拥有者 Player|Unit
---@param 单位id py.UnitKey
---@param 创建点 Point
---@param 朝向 number
---@return  Unit 创建的单位
function 单位_创建(拥有者, 单位id, 创建点, 朝向)
    -- return y3.unit.create_unit(拥有者, 单位id, 创建点, 朝向)
    return y3.unit.create_unit(拥有者, 单位id, 创建点, 朝向)
end

---@param 单位 Unit
---@param 凶手 Unit
function 单位_杀死(单位, 凶手)
    y3.unit.kill_by(单位, 凶手)
end

---@param 单位 Unit
---@return boolean
function 单位_是否正在释放技能(单位)
    return y3.unit.is_casting(单位)
end

---@param 幻象复制单位 Unit 幻象复制的单位
---@param 召唤单位 Unit 召唤单位
---@param 玩家 Player 玩家
---@param 点 Point 点
---@param 方向 number 方向
---@param 复制当前的生命值和魔法值 boolean 复制当前的生命值和魔法值
function 单位_创建幻象(幻象复制单位, 召唤单位, 玩家, 点, 方向, 复制当前的生命值和魔法值)
    y3.unit.create_illusion(幻象复制单位, 召唤单位, 玩家, 点, 方向, 复制当前的生命值和魔法值)
end

---@param 单位 Unit
function 单位_删除(单位)
    y3.unit.remove(单位)
end

---@param 单位 Unit
---@param 目标点 Point 点
function 单位_传送到点(单位, 目标点)
    y3.unit.blink(单位, 目标点)
end

---@param 单位 Unit
---@param 目标点 Point 点
---@param 平滑移动 boolean 是否丝滑
function 单位_强制传送到点(单位, 目标点, 平滑移动)
    y3.unit.set_point(单位, 目标点, 平滑移动)
end

---@param 单位 Unit
---@param 复活点? Point 点
function 单位_复活(单位, 复活点)
    y3.unit.reborn(单位, 复活点)
end

---@param 单位 Unit
---@param 治疗值 number 治疗值
---@param 来源技能? Ability 技能
---@param 来源单位? Unit 单位
---@param 跳字类型? string 跳字类型
function 单位_造成治疗(单位, 治疗值, 来源技能, 来源单位, 跳字类型)
    y3.unit.heals(单位, 治疗值, 来源技能, 来源单位, 跳字类型)
end

---@param 单位 Unit
---@param 状态数组 em单位状态[]
function 单位_添加状态(单位, 状态数组)
    for index, value in ipairs(状态数组) do
        y3.unit.add_state(单位, value)
    end
end

---@param 单位 Unit
---@param 状态数组 em单位状态[]
function 单位_移除状态(单位, 状态数组)
    for index, value in ipairs(状态数组) do
        y3.unit.remove_state(单位, value)
    end
end

---@param 单位 Unit
---@param 状态名 em单位状态
---@return GCNode
function 单位_添加状态GC(单位, 状态名)
    return y3.unit.add_state_gc(单位, 状态名)
end

---@param 单位 Unit
---@param 技能id py.AbilityKey 技能id
function 单位_学习技能(单位, 技能id)
    y3.unit.learn(单位, 技能id)
end

---@param 单位 Unit
---@param 命令 py.UnitCommand 命令
function 单位_发布命令(单位, 命令)
    y3.unit.command(单位, 命令)
end

---@param 单位 Unit
---@param 目标点 Point 点
---@param 范围? number 范围
---@return py.UnitCommand # 命令
function 单位_命令移动(单位, 目标点, 范围)
    return y3.unit.move_to_pos(单位, 目标点, 范围)
end

---@param 单位 Unit
---@return py.UnitCommand # 命令
function 单位_命令停止(单位)
    return y3.unit.stop(单位)
end

---@param 单位 Unit
---@param 目标点 Point 点
---@return py.UnitCommand # 命令
function 单位_命令驻守(单位, 目标点)
    return y3.unit.hold(单位, 目标点)
end

---@param 单位 Unit
---@param 目标点 Point 点
---@param 范围? number 范围
---@return py.UnitCommand # 命令
function 单位_命令攻击移动(单位, 目标点, 范围)
    return y3.unit.attack_move(单位, 目标点, 范围)
end

---@param 单位 Unit
---@param 目标 Unit 目标
---@param 范围 number 范围
---@return py.UnitCommand # 命令
function 单位_命令攻击目标(单位, 目标, 范围)
    return y3.unit.attack_target(单位, 目标, 范围)
end

---@param 单位 Unit
---@param 路径 Road 路径
---@param 移动模式 integer 移动模式
---@param 是否自动攻击目标 boolean 是否自动攻击
---@param 就近选择起始点 boolean 就近选择起始点
---@param 偏离后就近返回 boolean 偏离后就近返回
---@return py.UnitCommand # 命令
function 单位_命令沿路径移动(单位, 路径, 移动模式, 是否自动攻击目标, 就近选择起始点, 偏离后就近返回)
    return y3.unit.move_along_road(单位, 路径, 移动模式, 是否自动攻击目标, 就近选择起始点, 偏离后就近返回)
end

---@param 单位 Unit
---@param 技能 Ability # 技能
---@param 目标? Point|Unit|Item|Destructible # 目标
---@param 额外目标? Point # 额外目标
---@return py.UnitCommand
function 单位_命令发动技能(单位, 技能, 目标, 额外目标)
    return y3.unit.cast(单位, 技能, 目标, 额外目标)
end

---@param 单位 Unit
---@param 物品 Item
---@return py.UnitCommand
function 单位_命令拾取物品(单位, 物品)
    return y3.unit.pick_item(单位, 物品)
end

--
---@param 单位 Unit
---@param 物品 Item
---@param 丢弃点 Point
---@return py.UnitCommand
function 单位_命令丢弃物品(单位, 物品, 丢弃点)
    return y3.unit.drop_item(单位, 物品, 丢弃点)
end

---@param 单位 Unit
---@param 物品 Item
---@param 目标 Unit
---@return py.UnitCommand
function 单位_命令给予物品(单位, 物品, 目标)
    return y3.unit.give_item(单位, 物品, 目标)
end

---@param 单位 Unit
---@param 物品 Item
---@param 目标? Point|Unit|Item|Destructible
---@param 额外目标? Point
---@return py.UnitCommand
function 单位_命令使用物品(单位, 物品, 目标, 额外目标)
    return y3.unit.use_item(单位, 物品, 目标, 额外目标)
end

---@param 单位 Unit
---@param 目标 Unit
---@return py.UnitCommand
function 单位_命令跟随单位(单位, 目标)
    return y3.unit.follow(单位, 目标)
end

---@param 单位 Unit
---@param 朝向 number
---@param 转向时间 number
function 单位_设置朝向(单位, 朝向, 转向时间)
    y3.unit.set_facing(单位, 朝向, 转向时间)
end

---@param 单位 Unit
---@param 名称 string
function 单位_设置名称(单位, 名称)
    单位:set_name(名称)
end

---@param 单位 Unit
---@param 描述 string 描述
function 单位_设置描述(单位, 描述)
    y3.unit.set_description(单位, 描述)
end

---@param 单位 Unit
---@param 单位属性 string
---@param 属性值 number 属性值
---@param 单位属性类型 en单位属性类型 单位属性类型
function 单位_设置属性(单位, 单位属性, 属性值, 单位属性类型)
    y3.unit.set_attr(单位, 单位属性, 属性值, 单位属性类型)
end

---@param 单位 Unit
---@param 单位属性 string
---@param 属性值 number 属性值
---@param 单位属性类型 string 单位属性类型
function 单位_增加属性(单位, 单位属性, 属性值, 单位属性类型)
    y3.unit.add_attr(单位, 单位属性, 属性值, 单位属性类型)
end

---@param 单位 Unit
---@param 单位属性 string
---@param 单位属性类型 en单位属性类型 单位属性类型
---@return number|nil
function 单位_获取属性(单位, 单位属性, 单位属性类型)
    if 单位属性类型 == em单位属性类型.基础属性 then
        return y3.unit.get_attr_base(单位, 单位属性)
    end
    if 单位属性类型 == em单位属性类型.实际属性 then
        return y3.unit.get_final_attr(单位, 单位属性)
    end
    if 单位属性类型 == em单位属性类型.额外属性 then
        return y3.unit.get_attr_other(单位, 单位属性)
    end
    if 单位属性类型 == em单位属性类型.基础属性加成 then
        return y3.unit.get_attr_base_ratio(单位, 单位属性)
    end
    if 单位属性类型 == em单位属性类型.增益属性 then
        return y3.unit.get_attr_bonus(单位, 单位属性)
    end
    if 单位属性类型 == em单位属性类型.总属性加成 then
        return y3.unit.get_attr_all_ratio(单位, 单位属性)
    end
    if 单位属性类型 == em单位属性类型.增益属性加成 then
        return y3.unit.get_attr_bonus_ratio(单位, 单位属性)
    end
    return nil
end

---@param 单位 Unit
---@param 单位属性 string
---@param 属性值 number 属性值
---@param 单位属性类型 string 单位属性类型
---@return GCNode
function 单位_增加属性GC(单位, 单位属性, 属性值, 单位属性类型)
    return y3.unit.add_attr_gc(单位, 单位属性, 属性值, 单位属性类型)
end

---@param 单位 Unit
---@param 等级 integer 等级
function 单位_设置等级(单位, 等级)
    y3.unit.set_level(单位, 等级)
end

---@param 单位 Unit
---@param 等级 integer 等级
function 单位_增加等级(单位, 等级)
    y3.unit.add_level(单位, 等级)
end

---@param 单位 Unit
---@param 经验 number 经验
function 单位_设置经验(单位, 经验)
    y3.unit.set_exp(单位, 经验)
end

---@param 单位 Unit
---@param 经验 number 经验
function 单位_增加经验(单位, 经验)
    y3.unit.add_exp(单位, 经验)
end

---@param 单位 Unit
---@param hp number 当前生命值
function 单位_设置当前生命值(单位, hp)
    y3.unit.set_hp(单位, hp)
end

---@param 单位 Unit
---@param hp number 当前生命值
function 单位_增加当前生命值(单位, hp)
    y3.unit.add_hp(单位, hp)
end

---@param 单位 Unit
---@param mp number 当前魔法值
function 单位_设置当前魔法值(单位, mp)
    y3.unit.set_mp(单位, mp)
end

---@param 单位 Unit
---@param mp number 当前魔法值
function 单位_增加当前魔法值(单位, mp)
    y3.unit.add_mp(单位, mp)
end

---@param 单位 Unit
---@param 技能点 integer 技能点
function 单位_设置技能点(单位, 技能点)
    y3.unit.set_ability_point(单位, 技能点)
end

---@param 单位 Unit
---@param 技能点 integer 技能点
function 单位_增加技能点(单位, 技能点)
    y3.unit.add_ability_point(单位, 技能点)
end

---@param 单位 Unit
---@param 玩家 Player 所属玩家
function 单位_改变所属玩家(单位, 玩家)
    y3.unit.change_owner(单位, 玩家)
end

---@param 单位 Unit
---@param 高度 number 高度
---@param 过渡时间 number 过渡时间
function 单位_设置飞行高度(单位, 高度, 过渡时间)
    y3.unit.set_height(单位, 高度, 过渡时间)
end

---@param 单位 Unit
---@param 生命周期 number 生命周期
function 单位_设置生命周期(单位, 生命周期)
    y3.unit.set_life_cycle(单位, 生命周期)
end

---@param 单位 Unit
---@param 是否暂停 boolean 生命周期暂停状态
function 单位_设置生命周期暂停状态(单位, 是否暂停)
    y3.unit.pause_life_cycle(单位, 是否暂停)
end

---@param 单位 Unit
---@param 范围 number 范围
function 单位_设置警戒范围(单位, 范围)
    y3.unit.set_alert_range(单位, 范围)
end

---@param 单位 Unit
---@param 范围 number 取消警戒范围
function 单位_设置取消警戒范围(单位, 范围)
    y3.unit.set_cancel_alert_range(单位, 范围)
end

---@param 单位 Unit
---@param 槽位数 integer
function 单位_设置物品栏槽位数(单位, 槽位数)
    y3.unit.set_bar_cnt(单位, 槽位数)
end

---@param 单位 Unit
---@param 槽位数 integer
function 单位_设置背包栏槽位数(单位, 槽位数)
    单位:set_pkg_cnt(槽位数)
end

---@param 单位 Unit
---@param 单位行为 py.UnitBehavior 单位行为
function 单位_设置默认行为(单位, 单位行为)
    y3.unit.set_behavior(单位, 单位行为)
end

---@param 单位 Unit
---@param exp number 经验
function 单位_设置被击杀经验奖励(单位, exp)
    y3.unit.set_reward_exp(单位, exp)
end

---
---@param 单位 Unit
---@param 玩家属性名 py.RoleResKey 单位属性
---@param 属性值 number 属性奖励
function 单位_设置被击杀的玩家属性奖励(单位, 玩家属性名, 属性值)
    y3.unit.set_reward_res(单位, 玩家属性名, 属性值)
end

---
---@param 单位 Unit
---@param 攻击类型 integer 攻击类型
function 单位_设置攻击类型(单位, 攻击类型)
    y3.unit.set_attack_type(单位, 攻击类型)
end

---
---@param 单位 Unit
---@param 护甲类型 integer 护甲类型
function 单位_设置护甲类型(单位, 护甲类型)
    y3.unit.set_armor_type(单位, 护甲类型)
end

---@param 单位 Unit
---@param 红 number 红
---@param 绿 number 绿
---@param 蓝 number 蓝
---@param 透明度 number 透明度
---@param 间隔时间 number 间隔时间
---@param 显示时间 number 显示时间
---@param 开始时间 number 开始时间
---@param 结束时间 number 结束时间
---@param 使用原生材质 boolean 使用原生材质
function 单位_开启残影(单位, 红, 绿, 蓝, 透明度, 间隔时间, 显示时间, 开始时间, 结束时间, 使用原生材质)
    y3.unit.start_ghost(单位, 红, 绿, 蓝, 透明度, 间隔时间, 显示时间, 开始时间, 结束时间, 使用原生材质)
end

---@param 单位 Unit
function 单位_关闭残影(单位)
    y3.unit.stop_ghost(单位)
end

---@param 单位 Unit
---@param 红 number 绿
---@param 绿 number 绿
---@param 蓝 number 蓝
---@param 透明度 number 透明度
function 单位_设置残影颜色(单位, 红, 绿, 蓝, 透明度)
    y3.unit.set_ghost_color(单位, 红, 绿, 蓝, 透明度)
end

---
---@param 单位 Unit
---@param 间隔时间 number 间隔时间
---@param 显示时间 number 显示时间
---@param 开始时间 number 开始时间
---@param 结束时间 number 结束时间
function 单位_设置残影时间(单位, 间隔时间, 显示时间, 开始时间, 结束时间)
    y3.unit.set_afterimage_time(单位, 间隔时间, 显示时间, 开始时间, 结束时间)
end

---@param 单位 Unit
---@param 图片id py.Texture 单位头像
function 单位_设置单位头像(单位, 图片id)
    y3.unit.set_icon(单位, 图片id)
end

---@param 单位 Unit
---@param 血条样式 integer 血条样式
function 单位_设置血条样式(单位, 血条样式)
    y3.unit.set_blood_bar_type(单位, 血条样式)
end

---@param 单位 Unit
---@param 血条显示方式 integer 血条显示方式
function 单位_设置血条显示方式(单位, 血条显示方式)
    y3.unit.set_health_bar_display(单位, 血条显示方式)
end

---@param 单位 Unit
---@param 图片id py.Texture 单位小地图头像
function 单位_设置单位小地图头像(单位, 图片id)
    y3.unit.set_minimap_icon(单位, 图片id)
end

---@param 单位 Unit
---@param 图片id py.Texture 敌方单位小地图头像
function 单位_设置敌方单位小地图头像(单位, 图片id)
    y3.unit.set_enemy_minimap_icon(单位, 图片id)
end

---@param 单位 Unit
---@param 是否显示 boolean # 布尔值
function 单位_设置选择框的可见性(单位, 是否显示)
    y3.unit.set_select_effect_visible(单位, 是否显示)
end

---@param 单位 Unit
---@param scale number 模型缩放
function 单位_设置模型缩放(单位, scale)
    y3.unit.set_scale(单位, scale)
end

---@param 单位 Unit
---@param 转身速度 number
function 单位_设置转身速度(单位, 转身速度)
    y3.unit.set_turning_speed(单位, 转身速度)
end

---@param 单位 Unit
---@param 模型id integer 模型id
function 单位_替换模型(单位, 模型id)
    ---@diagnostic disable-next-line: param-type-mismatch
    y3.unit.replace_model(单位, 模型id)
end

---@param 单位 Unit
---@param 模型id py.ModelKey 模型id
function 单位_取消模型替换(单位, 模型id)
    y3.unit.cancel_replace_model(单位, 模型id)
end

---@param 单位 Unit
---@param 是否半透明 boolean 是否半透明
function 单位_设置隐身可见时是否半透明(单位, 是否半透明)
    y3.unit.set_transparent_when_invisible(单位, 是否半透明)
end

---@param 单位 Unit
---@param 是否回收 boolean 是否回收
function 单位_设置尸体消失后是否回收(单位, 是否回收)
    y3.unit.set_recycle_on_remove(单位, 是否回收)
end

---@param 单位 Unit
---@param 是否透视 boolean 是否透视
function 单位_设置透视状态(单位, 是否透视)
    y3.unit.set_Xray_is_open(单位, 是否透视)
end

---@param 单位 Unit
---@param 科技id py.TechKey 科技id
function 单位_添加科技(单位, 科技id)
    y3.unit.add_tech(单位, 科技id)
end

---@param 单位 Unit
---@param 科技id py.TechKey 科技id
function 单位_删除科技(单位, 科技id)
    y3.unit.remove_tech(单位, 科技id)
end

---@param 单位 Unit
---@param 科技id py.TechKey 科技id
function 单位_研究科技(单位, 科技id)
    y3.unit.research_tech(单位, 科技id)
end

---@param 单位 Unit
---@return py.TechKey[]
function 单位_获取可研究的所有科技(单位)
    return y3.unit.get_tech_list(单位)
end

---@param 单位 Unit
---@return py.TechKey[]
function 单位_获取受到影响的所有科技(单位)
    return y3.unit.get_affect_techs(单位)
end

---@param 单位 Unit
---@param value number
function 单位_设置白天的视野范围(单位, value)
    y3.unit.set_day_vision(单位, value)
end

--
---@param 单位 Unit
---@param value number
function 单位_设置夜晚的视野范围(单位, value)
    y3.unit.set_night_value(单位, value)
end

---@param 单位 Unit
---@param 动画名 string 动画名
---@param 速度? number 速度
---@param 开始时间? number 开始时间
---@param 结束时间? number 结束时间
---@param 是否循环? boolean 是否循环
---@param 是否返回默认状态? boolean 是否返回默认状态
function 单位_播放动画(单位, 动画名, 速度, 开始时间, 结束时间, 是否循环, 是否返回默认状态)
    y3.unit.play_animation(单位, 动画名, 速度, 开始时间, 结束时间, 是否循环, 是否返回默认状态)
end

---@param 单位 Unit
---@param 动画名 string 动画名
function 单位_停止动画(单位, 动画名)
    y3.unit.stop_animation(单位, 动画名)
end

---@param 单位 Unit
---@param 替换动画名 string 动画名
---@param 被替换动画名 string 动画名
function 单位_替换动画(单位, 替换动画名, 被替换动画名)
    y3.unit.change_animation(单位, 替换动画名, 被替换动画名)
end

---@param 单位 Unit
---@param 替换动画名 string 动画名
---@param 被替换动画名 string 动画名
function 单位_取消动画替换(单位, 替换动画名, 被替换动画名)
    y3.unit.cancel_change_animation(单位, 替换动画名, 被替换动画名)
end

---@param 单位 Unit
---@param 动画名 string 动画名
function 单位_重置动画替换(单位, 动画名)
    y3.unit.clear_change_animation(单位, 动画名)
end

---@param 单位 Unit
function 单位_停止当前正在播放的动画(单位)
    y3.unit.stop_cur_animation(单位)
end

---@param 单位 Unit
---@param speed number 速度
function 单位_设置动画播放速率(单位, speed)
    y3.unit.set_animation_speed(单位, speed)
end

---@param 单位 Unit
---@param page py.TabIdx 页签id
---@param index integer 序号
---@return number cd 默认间隔时间
function 商店_获取商品的库存间隔(单位, page, index)
    return y3.unit.get_goods_cd(单位, page, index)
end

---@param 单位 Unit
---@param page py.TabIdx 页签id
---@param index integer 序号
---@return number recovery_time 剩余恢复时间
function 商店_获取商品的剩余恢复时间(单位, page, index)
    return y3.unit.get_goods_remaining_cd(单位, page, index)
end

---@param 单位 Unit
---@param page py.TabIdx 页签
---@return py.ItemKey[]
function 商店_获取所有的物品(单位, page)
    return y3.unit.get_shop_item_list(单位, page)
end

---
---@param 单位 Unit
---@param tag_name py.TabName 标签名
---@param item_key py.ItemKey 物品id
function 商店_添加可贩卖的商品(单位, tag_name, item_key)
    y3.unit.add_goods(单位, tag_name, item_key)
end

---@param 单位 Unit
---@param item_name py.TabName 物品名
---@param item_key py.ItemKey 物品id
function 商店_移除可贩卖的商品(单位, item_name, item_key)
    y3.unit.remove_goods(单位, item_name, item_key)
end

---@param 单位 Unit
---@param tag_name py.TabName 标签名
---@param item_key py.ItemKey 物品id
---@param number integer 物品库存
function 商店_设置商品库存(单位, tag_name, item_key, number)
    y3.unit.set_goods_stack(单位, tag_name, item_key, number)
end

---@param 单位 Unit
---@param 商店 Unit 单位
---@param item Item 物品
function 单位_向商店出售物品(单位, 商店, item)
    y3.unit.sell(单位, 商店, item)
end

---@param 购买单位 Unit
---@param 商店单位 Unit 单位
---@param tag_num py.TabIdx 页签id
---@param item_key py.ItemKey 物品id
function 单位_从商店购买商品(购买单位, 商店单位, tag_num, item_key)
    y3.unit.buy(购买单位, 商店单位, tag_num, item_key)
end

---@param 单位 Unit
---@return boolean is_shop 是商店
function 单位_是否为商店(单位)
    return y3.unit.is_shop(单位)
end

---@param 单位 Unit
---@param 页签 py.TabIdx 页签
---@param 序号 integer 序号
---@return py.ItemKey item 物品类型
function 商店_获取物品ID(单位, 页签, 序号)
    return y3.unit.get_goods_key(单位, 页签, 序号)
end

---@param 单位 Unit
---@param tag_index py.TabIdx 页签
---@return string tab_name 页签名
function 商店_获取页签名(单位, tag_index)
    return y3.unit.get_shop_tab_name(单位, tag_index)
end

---@param 单位 Unit
---@return number purchase_range 购买范围
function 商店_获取购买范围(单位)
    return y3.unit.get_shop_range(单位)
end

---@param 单位 Unit
---@return number tab_number 页签数量
function 商店_获取页签数量(单位)
    return y3.unit.get_shop_tab_number(单位)
end

---@param 单位 Unit
---@param 页签 py.TabIdx 页签
---@param 物品类型 py.ItemKey 物品类型
---@return integer item_stock 商品库存
function 商店_获取物品类型库存(单位, 页签, 物品类型)
    return y3.unit.get_goods_stack(单位, 页签, 物品类型)
end

---@param 单位 Unit
---@param 参数 {魔法效果id:py.ModifierKey,来源单位?:Unit,关联技能?:Ability,持续时间?:number,心跳周期?:number,层数?:integer}
---@return Buff?
function 单位_添加魔法效果(单位, 参数)
    return y3.unit.add_buff(单位,
                            {
                                key = 参数.魔法效果id,
                                ability = 参数.关联技能,
                                pulse = 参数.心跳周期,
                                source = 参数.来源单位,
                                stacks = 参数.层数,
                                time =
                                    参数.持续时间
                            })
end

---@param 单位 Unit
---@param buff_key py.ModifierKey 影响类型的魔法效果
function 单位_移除所有指定ID的魔法效果(单位, buff_key)
    y3.unit.remove_buffs_by_key(单位, buff_key)
end

---@param 单位 Unit
---@param effect_type y3.Const.EffectType 影响类型的魔法效果
function 单位_移除所有指定类型的魔法效果(单位, effect_type)
    y3.unit.remove_buffs_by_effect_type(单位, effect_type)
end

---@param 单位 Unit
---@param buff_key py.ModifierKey 魔法效果id
---@param index? integer 第几个
---@return Buff? # 单位指定类型的魔法效果
function 单位_获取指定ID的魔法效果(单位, buff_key, index)
    return y3.unit.find_buff(单位, buff_key, index)
end

---@param 单位 Unit
---@return number current_unit_hp 当前生命值
function 单位_获取当前生命值(单位)
    return y3.unit.get_hp(单位)
end

---@param 单位 Unit
---@return number current_mp 当前魔法值
function 单位_获取当前魔法值(单位)
    return y3.unit.get_mp(单位)
end

-- ---@param 单位 Unit
-- ---@param 单位属性类型 string
-- ---@return number
-- function 单位_获取属性_最终(单位, 单位属性类型)
--     return y3.unit.get_final_attr(单位, 单位属性类型)
-- end

-- ---@param 单位 Unit
-- ---@param 单位属性类型 string
-- ---@return number
-- function 单位_获取属性_额外(单位, 单位属性类型)
--     return y3.unit.get_attr_other(单位, 单位属性类型)
-- end

-- ---@param 单位 Unit
-- ---@param 单位属性类型 string
-- ---@return number attr_base
-- function 单位_获取属性_基础(单位, 单位属性类型)
--     return y3.unit.get_attr_base(单位, 单位属性类型)
-- end

-- ---@param 单位 Unit
-- ---@param 单位属性类型 string
-- ---@return number
-- function 单位_获取属性_基础加成(单位, 单位属性类型)
--     return y3.unit.get_attr_base_ratio(单位, 单位属性类型)
-- end

-- ---@param 单位 Unit
-- ---@param 单位属性类型 string
-- ---@return number
-- function 单位_获取属性_增益(单位, 单位属性类型)
--     return y3.unit.get_attr_bonus(单位, 单位属性类型)
-- end

-- ---@param 单位 Unit
-- ---@param 单位属性类型 string
-- ---@return number
-- function 单位_获取属性_最终加成(单位, 单位属性类型)
--     return y3.unit.get_attr_all_ratio(单位, 单位属性类型)
-- end

-- ---@param 单位 Unit
-- ---@param 单位属性类型 string
-- ---@return number
-- function 单位_获取属性_增益加成(单位, 单位属性类型)
--     return y3.unit.get_attr_bonus_ratio(单位, 单位属性类型)
-- end

---@param 单位 Unit
---@return number
function 单位_获取剩余生命周期(单位)
    return y3.unit.get_life_cycle(单位)
end

---@param 单位 Unit
---@return number height 单位飞行高度
function 单位_获取飞行高度(单位)
    return y3.unit.get_height(单位)
end

---@param 单位 Unit
---@return number turning_speed 单位转身速度
function 单位_获取转身速度(单位)
    return y3.unit.get_turning_speed(单位)
end

---@param 单位 Unit
---@return number alert_range 单位警戒范围
function 单位_获取警戒范围(单位)
    return y3.unit.get_alert_range(单位)
end

---@param 单位 Unit
---@return number cancel_alert_range 单位取消警戒的范围
function 单位_获取取消警戒范围(单位)
    return y3.unit.get_cancel_alert_range(单位)
end

---@param 单位 Unit
---@return number collision_radius 单位碰撞半径
function 单位_获取碰撞半径(单位)
    return y3.unit.get_collision_radius(单位)
end

---@param 单位 Unit
---@return Player player 单位所属玩家
function 单位_获取所属玩家(单位)
    return y3.unit.get_owner(单位)
end

---@param 单位 Unit
---@param 玩家属性 py.RoleResKey 玩家属性名
---@return number player_attr 单位被击杀玩家属性
function 单位_获取击杀可获得资源(单位, 玩家属性)
    return y3.unit.get_reward_res(单位, 玩家属性)
end

---@param 单位 Unit
---@return number model_scale 单位缩放
function 单位_获取缩放(单位)
    return y3.unit.get_scale(单位)
end

---@param 单位 Unit
---@return number range_scale 选择圈缩放
function 单位_获取单位选择圈缩放(单位)
    return y3.unit.get_unit_selection_range_scale(单位)
end

---@param 单位 Unit
---@return number xaxis X轴缩放
function 单位获取X轴缩放(单位)
    return y3.unit.get_x_scale(单位)
end

---@param 单位 Unit
---@return number zaxis  Z轴缩放
function 单位_获取Z轴缩放(单位)
    return y3.unit.get_z_scale(单位)
end

---@param 单位 Unit
---@return number yaxis Y轴缩放
function 单位_获取Y轴缩放(单位)
    return y3.unit.get_y_scale(单位)
end

---@param 单位 Unit
---@return number unit_level 单位等级
function 单位_获取等级(单位)
    return y3.unit.get_level(单位)
end

---@param 单位 Unit
---@return py.UnitType unit_type 单位类型ID
function 单位_获取单位的单位类型ID(单位)
    return y3.unit.get_type(单位)
end

---@param 单位 Unit
---@return py.UnitKey type_id 单位类型的ID
function 单位_获取单位类型的ID(单位)
    return y3.unit.get_key(单位)
end

---@param 单位 Unit
---@return integer exp 单位当前的经验值
function 单位_获取当前经验(单位)
    return y3.unit.get_exp(单位)
end

---@param 单位 Unit
---@return number exp 单位当前升级所需经验
function 单位_获取当前升级所需经验(单位)
    return y3.unit.get_upgrade_exp(单位)
end

---@param 单位 Unit
---@return integer hero_ability_point_number 英雄的技能点数量
function 单位_获取技能点数量(单位)
    return y3.unit.get_ability_point(单位)
end

---@param 单位 Unit
---@return integer slot_number 单位背包栏的槽位数
function 单位_获取背包栏的槽位数(单位)
    return y3.unit.get_pkg_cnt(单位)
end

---@param 单位 Unit
---@return integer slot_number 单位物品栏的槽位数
function 单位_获取物品栏的槽位数(单位)
    return y3.unit.get_bar_cnt(单位)
end

---@param 单位 Unit
---@param 物品类型 py.ItemKey 物品类型id
---@return integer item_type_number 物品类型数量
function 单位_获取拥有的物品类型数量(单位, 物品类型)
    return y3.unit.get_item_type_number_of_unit(单位, 物品类型)
end

---@param 单位 Unit
---@return integer exp 单位被击杀经验
function 单位_获取被击杀经验(单位)
    return y3.unit.get_exp_reward(单位)
end

---@param 单位 Unit
---@param 护盾类型 integer 护盾类型
---@return integer shield_value 护盾类型的护盾值
function 单位_获取指定护盾类型护盾值(单位, 护盾类型)
    return y3.unit.get_shield(单位, 护盾类型)
end

---@param 单位 Unit
---@return string unit_name  单位名称
function 单位_获取名称(单位)
    return y3.unit.get_name(单位)
end

---@param 单位 Unit
---@return string unit_description 单位的描述
function 单位_获取描述(单位)
    return y3.unit.get_description(单位)
end

---@param 单位 Unit
---@return py.UnitType unit_subtype 单位分类
function 单位_获取分类(单位)
    return y3.unit.get_subtype(单位)
end

---@param 单位 Unit
---@returr boolean
function 单位_是否为英雄(单位)
    return y3.unit.is_hero(单位)
end

---
---@return Unit? unit 最后创建的单位
function 单位_最后创建的单位()
    return y3.unit.get_last_created_unit()
end

---@param 单位 Unit
---@return Unit? unit 单位的拥有者
function 单位_获取拥有单位(单位)
    return y3.unit.get_parent_unit(单位)
end

---@param 单位 Unit
---@return Unit? unit 幻象的召唤者
function 单位_获取幻象召唤者(单位)
    return y3.unit.get_illusion_owner(单位)
end

---@param 单位 Unit
---@return number angle 单位的朝向
function 单位_获取朝向(单位)
    return y3.unit.get_facing(单位)
end

---@param 单位 Unit
---@return integer DAMAGE_ARMOR_TYPE 护甲类型
function 单位_获取护甲类型(单位)
    return y3.unit.get_armor_type(单位)
end

---@param 单位 Unit
---@return integer DAMAGE_ATTACK_TYPE 攻击类型
function 单位_获取攻击类型(单位)
    return y3.unit.get_attack_type(单位)
end

---@param 单位 Unit
---@return py.ModelKey model 当前模型
function 单位_获取模型(单位)
    return y3.unit.get_model(单位)
end

---@param 单位 Unit
---@return py.ModelKey model 原本模型
function 单位_获取原本模型(单位)
    return y3.unit.get_source_model(单位)
end

---@param 单位 Unit
---@return Point unit_point 单位所在点
function 单位_获取所在点(单位)
    return y3.unit.get_point(单位)
end

---@param 单位 Unit
---@return Point point 单位最近的可通行点
function 单位_获取最近的可通行点(单位)
    return y3.unit.get_nearest_valid_point(单位)
end

---@param 单位 Unit
---@return py.Camp team 获取单位的队伍
function 单位_获取队伍(单位)
    return y3.unit.get_team(单位)
end

---@param 单位 Unit
---@return boolean alive 是否存活
function 单位_是否存活(单位)
    return y3.unit.is_alive(单位)
end

---@param 单位 Unit
---@param 目标 Unit 目标单位
---@return boolean visibility 目标是否可见
function 单位_目标是否可见(单位, 目标)
    return y3.unit.can_visible(单位, 目标)
end

---@param 单位 Unit
---@return boolean is_moving 正在移动
function 单位_是否正在移动(单位)
    return y3.unit.is_moving(单位)
end

---@param 单位 Unit
---@param 目标 Unit|Point 单位/点
---@param range number 范围
---@return boolean in_radius 在单位附近
function 单位_是否在目标附近(单位, 目标, range)
    return y3.unit.is_in_radius(单位, 目标, range)
end

---@param 单位 Unit
---@return boolean illusion 是幻象单位
function 单位_是否为幻象(单位)
    return y3.unit.is_illusion(单位)
end

---@param 单位 Unit
---@param group UnitGroup 单位组
---@return boolean in_group 在单位组中
function 单位_是否在单位组(单位, group)
    return y3.unit.is_in_group(单位, group)
end

---@param 单位 Unit
---@return boolean in_battle 在战斗状态
function 单位_是否在战斗状态(单位)
    return y3.unit.is_in_battle(单位)
end

---@param 单位 Unit
---@param state_name integer 状态
---@return boolean has_buff_status 有指定状态
function 单位_是否有指定状态(单位, state_name)
    return y3.unit.has_buff_status(单位, state_name)
end

---@param 单位 Unit
---@param ability_key py.AbilityKey 技能类型
---@return boolean has_ability_type 有指定类型的技能
function 单位_是否有指定ID的技能(单位, ability_key)
    return y3.unit.has_ability_by_key(单位, ability_key)
end

---@param 单位 Unit
---@param item Item 物品
---@return boolean has_item 有物品
function 单位_是否有指定物品(单位, item)
    return y3.unit.has_item(单位, item)
end

---@param 单位 Unit
---@param 物品类型 py.ItemKey 物品类型
---@return boolean has_item_name 有指定类型的物品
function 单位_是否有指定类型物品(单位, 物品类型)
    return y3.unit.has_item_by_key(单位, 物品类型)
end

---@param 单位 Unit
---@param buff_key py.ModifierKey 魔法效果id
---@return boolean has_modifier 有魔法效果
function 单位_是否有指定ID魔法效果(单位, buff_key)
    return y3.unit.has_buff_by_key(单位, buff_key)
end

---@param 单位 Unit
---@param effect_type y3.Const.EffectType 魔法效果类型
---@return boolean has_modifier_style 有指定类型的魔法效果
function 单位_是否有指定类型魔法效果(单位, effect_type)
    return y3.unit.has_buff_by_effect_type(单位, effect_type)
end

---@param 单位 Unit
---@param tag_name string 标签
---@return boolean has_modifier_tag 有指定标签的魔法效果
function 单位_是否具有指定标签魔法效果(单位, tag_name)
    return y3.unit.unit_has_modifier_tag(单位, tag_name)
end

---@param 单位 Unit
---@param 目标 Unit 目标单位
---@return boolean is_enemy  是敌对关系
function 单位_是否为友方(单位, 目标)
    return y3.unit.is_ally(单位, 目标)
end

---@param 单位 Unit
---@param 目标 Unit 目标单位
---@return boolean is_enemy  是敌对关系
function 单位_是否为敌人(单位, 目标)
    return y3.unit.is_enemy(单位, 目标)
end

---@param 单位 Unit
---@param point Point 点
---@return boolean can_teleport 能否传送到点
function 单位_是否能传送到点(单位, point)
    return y3.unit.can_blink_to(单位, point)
end

---@param 单位 Unit
---@param point Point 点
---@param range number 范围
---@return boolean can_collide 是否与点碰撞
function 单位_是否与点碰撞(单位, point, range)
    return y3.unit.is_collided_with_point(单位, point, range)
end

---
---@param 单位 Unit
---@param 起点 Point 起始点
---@param 终点 Point 终点
---@return boolean is_reach 是否寻路可达
function 单位_是否寻路可达(单位, 起点, 终点)
    return y3.unit.can_walk_to(单位, 起点, 终点)
end

---@param 单位 Unit
---@param collision_type integer 碰撞类型
---@return boolean # 是否拥有指定碰撞类型
function 单位_是否拥有指定碰撞类型(单位, collision_type)
    return y3.unit.has_move_collision(单位, collision_type)
end

---@param 单位 Unit
---@return Player
function 单位_获取所属玩家(单位)
    return y3.unit.get_owner_player(单位)
end

---@param 单位 Unit
---@param 玩家  Player
---@return boolean
function 单位_玩家是否可以购买物品(单位, 玩家)
    return y3.unit.player_shop_check(单位, 玩家)
end

---@param 单位id py.UnitKey 单位id
---@return py.ModelKey model 模型
function 单位类型_获取模型(单位id)
    return y3.unit.get_model_by_key(单位id)
end

---@param 单位id py.UnitKey 单位id
---@return integer
function 单位类型_获取分类(单位id)
    return y3.unit.get_type_by_id(单位id)
end

---@param 单位id py.UnitKey 单位id
---@param 属性名称 string
---@param 成长值 number 属性成长
function 单位类型_设置属性成长(单位id, 属性名称, 成长值)
    y3.unit.set_attr_growth(单位id, 属性名称, 成长值)
end

---@param 单位类型 py.UnitKey
---@param 单位属性类型 any
---@return number unit_attribute_growth 单位属性成长
function 单位类型_获取属性成长(单位类型, 单位属性类型)
    return y3.unit.get_attr_growth_by_key(单位类型, 单位属性类型)
end

---@param 单位类型 py.UnitKey 单位类型
---@param 玩家属性名 py.RoleResKey 玩家属性名
---@return integer player_attr 单位被击杀玩家属性
function 单位类型_获取建造此单位消耗的资源(单位类型, 玩家属性名)
    return y3.unit:get_unit_resource_cost(单位类型, 玩家属性名)
end

---@param 单位类型 py.UnitKey
---@return string type_name 单位类型名称
function 单位类型_获取名称(单位类型)
    return y3.unit.get_name_by_key(单位类型)
end

---@param 单位类型 py.UnitKey 单位类型
---@return string des 单位类型的描述
function 单位类型_获取描述(单位类型)
    return y3.unit.get_description_by_key(单位类型)
end

---@param 单位类型 py.UnitKey 单位类型
---@return py.Texture image 单位类型的头像
function 单位类型_获取头像(单位类型)
    return y3.unit.get_icon_by_key(单位类型) --[[@as py.Texture]]
end

---@param 玩家 Player 玩家
---@param 单位类型 py.UnitKey 单位类型
---@return boolean unit_precondition 单位类型前置条件是否通过
function 单位类型_前置条件是否通过(玩家, 单位类型
)
    return y3.unit.check_precondition_by_key(玩家, 单位类型)
end

---@param 属性key string 属性key
---@return string 属性名字
function 单位_属性ID转名称(属性key)
    return y3.unit.attr_to_name(属性key)
end

---@class 造成伤害参数
---@field 目标 Unit|Item|Destructible
---@field 伤害类型 y3.Const.DamageType
---@field 伤害值 number
---@field 关联技能? Ability
---@field 跳字? y3.Const.DamageTextType
---@field 跳字轨迹? integer
---@field 视为普攻? boolean
---@field 必定暴击? boolean
---@field 必定命中? boolean
---@field 特效? py.SfxKey
---@field 特效挂接点? string

---@param 单位 Unit
---@param 参数 造成伤害参数
function 单位_造成伤害(单位, 参数)
    y3.unit.damage(单位,
                   {
                       damage = 参数.伤害值,
                       target = 参数.目标,
                       type = 参数.伤害类型,
                       ability = 参数.关联技能,
                       common_attack = 参数.视为普攻,
                       critical = 参数
                           .必定暴击,
                       no_miss = 参数.必定命中,
                       particle = 参数.特效,
                       socket = 参数.特效挂接点,
                       text_track = 参数.跳字轨迹,
                       text_type = 参数.跳字
                   })
end

--- 需要开启复合属性
---@param 单位 Unit
---@return string
function 单位_获取主属性(单位)
    return y3.unit.get_main_attr(单位)
end
