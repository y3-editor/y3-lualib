--单位
---@class Unit
---@field handle py.Unit # py层的单位对象
---@field phandle py.Unit # 代理的对象，用这个调用引擎的方法会快得多
---@field id integer
---@field package _removed_by_py? boolean
---@overload fun(py_unit_id: py.UnitID, py_unit: py.Unit): self
local M = Class 'Unit'

M.type = 'unit'

---@class Unit: GCHost
Extends('Unit', 'GCHost')
---@class Unit: Storage
Extends('Unit', 'Storage')
---@class Unit: CustomEvent
Extends('Unit', 'CustomEvent')
---@class Unit: ObjectEvent
Extends('Unit', 'ObjectEvent')
---@class Unit: KV
Extends('Unit', 'KV')

function M:__tostring()
    return string.format('{unit|%s|%d}'
        , self:get_name()
        , self.id
    )
end

---@param py_unit_id py.UnitID
---@param py_unit py.Unit
---@return self
function M:__init(py_unit_id, py_unit)
    self.handle = py_unit
    self.phandle = y3.py_proxy.wrap(py_unit)
    self.id     = py_unit_id
    return self
end

function M:__del()
    M.ref_manager:remove(self.id)
    y3.py_proxy.kill(self.phandle)
    if self._removed_by_py then
        return
    end
    self.phandle:api_delete()
end

---@package
---@param id py.UnitID
---@return Unit?
M.ref_manager = New 'Ref' ('Unit', function (id)
    local py_unit = GameAPI.get_unit_by_id(id)
    if not py_unit then
        return nil
    end
    return New 'Unit' (id, py_unit)
end)

---通过py层的单位实例获取lua层的单位实例
---@param py_unit py.Unit
---@return Unit?
function M.get_by_handle(py_unit)
    if not py_unit then
        return nil
    end
    local id = y3.py_proxy.wrap(py_unit):api_get_id()
    local unit = M.ref_manager:get(id)
    return unit
end

y3.py_converter.register_py_to_lua('py.Unit', M.get_by_handle)
y3.py_converter.register_lua_to_py('py.Unit', function (lua_value)
    return lua_value.handle
end)

-- 根据唯一ID获取单位。
---@param id py.UnitID
---@return Unit?
function M.get_by_id(id)
    local unit = M.ref_manager:get(id)
    return unit
end

-- 获取摆放在场景上的单位
---@param res_id integer
---@return Unit
function M.get_by_res_id(res_id)
    local u = M.get_by_id(res_id--[[@as py.UnitID]])
    if not u then
        error(('无法找到ID为%d的单位'):format(res_id))
    end
    return u
end

--根据字符串获取单位，字符串是通过 `tostring(Unit)`
--或是使用ECA中的“任意变量转化为字符串”获得的。
---@param str string
---@return Unit?
function M.get_by_string(str)
    local id = str:match('^{unit|.+|(%d+)}$')
            or str:match('<LCreature%((%d+)%)>')
            or str:match('^Unit:(%d+)')
    if not id then
        return nil
    end
    return M.get_by_id(tonumber(id)--[[@as py.UnitID]])
end

y3.py_converter.register_py_to_lua('py.UnitID', M.get_by_id)

y3.py_event_sub.new_global_trigger('ET_UNIT_DELETE', function (data)
    local id = data['__unit_id']
    local unit = M.ref_manager:fetch(id)
    if not unit then
        return
    end
    unit._removed_by_py = true
    unit:remove()
end)

---是否存在
---@return boolean is_exist 是否存在
function M:is_exist()
    return GameAPI.unit_is_exist(self.handle)
end

-- 获取唯一ID
---@return integer
function M:get_id()
    return self.id
end

--移除技能(指定类型)
--> 拼错了，请改用 `Unit:remove_ability_by_key`
---@deprecated
---@param type y3.Const.AbilityType | y3.Const.AbilityTypeAlias 技能类型
---@param ability_key py.AbilityKey 物编id
function M:remove_abilitiy_by_key(type, ability_key)
    self.phandle:api_remove_abilities_in_type(y3.const.AbilityType[type] or type, ability_key)
end

--移除技能(指定类型)
---@param type y3.Const.AbilityType | y3.Const.AbilityTypeAlias 技能类型
---@param ability_key py.AbilityKey 物编id
function M:remove_ability_by_key(type, ability_key)
    self.phandle:api_remove_abilities_in_type(y3.const.AbilityType[type] or type, ability_key)
end

---单位添加物品
---@param item_id py.ItemKey 物品id
---@param slot_type? y3.Const.ShiftSlotTypeAlias 槽位类型
---@return Item?
function M:add_item(item_id, slot_type)
    local py_item = self.phandle:api_add_item(item_id, y3.const.ShiftSlotType[slot_type])
    if not py_item then
        return nil
    end
    return y3.item.get_by_handle(py_item)
end

---单位移除物品
---@param item_id py.ItemKey 物品id
---@param num? integer 数量
function M:remove_item(item_id, num)
    self.phandle:api_delete_item(item_id, num or 1)
end

---移动物品
---@param item Item 物品
---@param type y3.Const.ShiftSlotTypeAlias
---@param index? integer 槽位
---@param force? boolean 是否强制移动，`true`: 如果目标有物品，则移动到另一个空格中；`false`: 如果目标有物品，则要移动的物品会掉落
function M:shift_item(item, type, index, force)
    self.phandle:api_shift_item_new(item.handle, y3.const.ShiftSlotType[type], index or 0, force or false)
end

-- 交换物品
-- 如果目标位置是空的，则相当于把物品移动了过去
---@deprecated
---@param item Item 物品
---@param type y3.Const.ShiftSlotTypeAlias
---@param index integer 槽位
function M:exchange_item(item, type, index)
    self.phandle:api_shift_item(item.handle, y3.const.ShiftSlotType[type], index)
end

---获取指定类型的所有技能
---@param type y3.Const.AbilityType
---@return Ability[]
function M:get_abilities_by_type(type)
    ---@type Ability[]
    local abilities = {}
    local py_list = self.phandle:api_get_abilities_by_type(type)
    if not py_list then
        return abilities
    end
    for i = 0, python_len(py_list) - 1 do
        local lua_ability = y3.ability.get_by_handle(python_index(py_list, i))
        abilities[#abilities+1] = lua_ability
    end
    return abilities
end

---获取单位身上的魔法效果
---@return Buff[] # 魔法效果表
function M:get_buffs()
    ---@type Buff[]
    local buffs = {}
    local py_list = self.phandle:api_get_all_modifiers()
    if not py_list then
        return buffs
    end
    for i = 0, python_len(py_list) - 1 do
        local lua_buff = y3.buff.get_by_handle(python_index(py_list, i))
        buffs[#buffs+1] = lua_buff
    end
    return buffs
end

---交换技能位置
---@param ability_1 Ability 第一个技能
---@param ability_2 Ability 第二个技能
function M:switch_ability(ability_1, ability_2)
    self.phandle:api_switch_ability(ability_1.handle, ability_2.handle)
end

---根据坑位交换技能
---@param type_1 y3.Const.AbilityType 第一个技能类型
---@param slot_1 y3.Const.AbilityIndex 第一个技能坑位
---@param type_2 y3.Const.AbilityType 第二个技能类型
---@param slot_2 y3.Const.AbilityIndex 第二个技能坑位
function M:switch_ability_by_slot(type_1, slot_1, type_2, slot_2)
    self.phandle:api_switch_ability_by_index(type_1, slot_1, type_2, slot_2)
end

---停止所有技能
function M:stop_all_abilities()
    self.phandle:api_stop_all_abilities()
end

---添加技能
---@param type y3.Const.AbilityType | y3.Const.AbilityTypeAlias 技能类型
---@param id py.AbilityKey 物编id
---@param slot? y3.Const.AbilityIndex 技能位
---@param level? integer 等级
---@return Ability?
function M:add_ability(type, id, slot, level)
    local py_ability = self.phandle:api_add_ability(y3.const.AbilityType[type] or type, id, slot or -1, level or 1)
    if not py_ability then
        return nil
    end
    local ability = y3.ability.get_by_handle(py_ability)
    return ability
end

---移除技能
---@param type y3.Const.AbilityType 技能类型
---@param slot y3.Const.AbilityIndex 技能位
function M:remove_ability(type, slot)
    self.phandle:api_remove_ability_by_index(type, slot)
end

---通过技能名寻找技能
---@param type y3.Const.AbilityType | y3.Const.AbilityTypeAlias 技能类型
---@param id py.AbilityKey 物编id
---@return Ability? ability 技能
function M:find_ability(type, id)
    local py_ability = self.phandle:api_get_ability_by_type(y3.const.AbilityType[type] or type, id)
    if not py_ability then
        return nil
    end
    return y3.ability.get_by_handle(py_ability)
end

---获得某个技能位的的技能
---@param type y3.Const.AbilityType | y3.Const.AbilityTypeAlias 技能类型
---@param slot integer 技能位
---@return Ability? ability 技能
function M:get_ability_by_slot(type, slot)
    ---@diagnostic disable-next-line: param-type-mismatch
    local py_ability = self.phandle:api_get_ability(y3.const.AbilityType[type] or type, slot)
    if not py_ability then
        return nil
    end
    return y3.ability.get_by_handle(py_ability)
end

--根据技能序号获取技能
---@param seq py.AbilitySeq
---@return Ability?
function M:get_ability_by_seq(seq)
    local py_ability = self.phandle:api_get_ability_by_seq(seq)
    if not py_ability then
        return nil
    end
    return y3.ability.get_by_handle(py_ability)
end

---comment 获取普攻技能
---@return Ability?
function M:get_common_attack()
    local py_ability = self.handle:api_get_common_atk_ability()

    if py_ability then
        return y3.ability.get_by_handle(py_ability)
    end
end

---获取单位背包槽位上的物品
---@param type y3.Const.SlotType | y3.Const.ShiftSlotTypeAlias 槽位类型
---@param slot integer 位置
---@return Item? item 物品
function M:get_item_by_slot(type, slot)
    local py_item = self.phandle:api_get_item_by_slot(y3.const.ShiftSlotType[type] or type, slot)
    if not py_item then
        return nil
    end
    return y3.item.get_by_handle(py_item)
end

---单位的所有物品
---@return ItemGroup item_group 所有物品
function M:get_all_items()
    local py_item_group = self.phandle:api_get_all_item_pids()
    if not py_item_group then
        return y3.item_group.create()
    end
    return y3.item_group.create_lua_item_group_from_py(py_item_group)
end

---单位获得科技
---@param tech_key py.TechKey 科技类型
function M:unit_gains_tech(tech_key)
    self.phandle:api_add_tech(tech_key)
end

---创建单位
---@param owner Player|Unit
---@param unit_id py.UnitKey 单位类型
---@param point Point 点
---@param direction number 方向
---@return Unit
function M.create_unit(owner, unit_id, point, direction)
    local py_unit = GameAPI.create_unit(
        unit_id,
        point.handle,
        Fix32(direction),
        -- TODO 见问题4
        ---@diagnostic disable-next-line: param-type-mismatch
        owner.handle
    )
    return M.get_by_handle(py_unit) --[[@as Unit]]
end

---杀死单位
---@param killer Unit 凶手单位
function M:kill_by(killer)
    self.phandle:api_kill(killer and killer.handle or nil)
end

---单位是否有正在释放的技能
---@return boolean
function M:is_casting()
    return self.phandle:api_unit_has_running_ability() or false
end

---创建幻象
---@param illusion_unit Unit 幻象复制的单位
---@param call_unit Unit 召唤单位
---@param player Player 玩家
---@param point Point 点
---@param direction number 方向
---@param clone_hp_mp boolean 复制当前的生命值和魔法值
---@return Unit?
function M.create_illusion(illusion_unit, call_unit, player, point, direction, clone_hp_mp)
    local py_unit = GameAPI.create_illusion(illusion_unit.handle, call_unit.handle, player.handle, point.handle, Fix32(direction), clone_hp_mp)
    if not py_unit then
        return nil
    end
    return y3.unit.get_by_handle(py_unit)
end

---删除单位
function M:remove()
    Delete(self)
end

---传送到点
---@param point Point 点
function M:blink(point)
    self.phandle:api_transmit(point.handle)
end

---强制传送到点
---@param point Point 点
---@param isSmooth boolean 是否丝滑
function M:set_point(point, isSmooth)
    self.phandle:api_force_transmit_new(point.handle, isSmooth)
end

---复活单位
---@param point? Point 点
function M:reborn(point)
    -- TODO 见问题2
    ---@diagnostic disable-next-line: param-type-mismatch
    self.phandle:api_revive(point and point.handle or nil)
end

---造成治疗
---@param value number 治疗值
---@param skill? Ability 技能
---@param source_unit? Unit 单位
---@param text_type? string 跳字类型
function M:heals(value, skill, source_unit, text_type)
    ---@diagnostic disable-next-line: missing-parameter
    self.phandle:api_heal(Fix32(value), text_type ~= nil, skill and skill.handle or nil, source_unit and source_unit.handle or nil, text_type or '')
end

---添加标签
---@param tag string 标签
function M:add_tag(tag)
    self.phandle:api_add_tag(tag)
end

---移除标签
---@param tag string 标签
function M:remove_tag(tag)
    self.phandle:api_remove_tag(tag)
end

---添加状态
---@param state_enum integer|y3.Const.UnitEnumState 状态名
function M:add_state(state_enum)
    self.phandle:api_add_state(y3.const.UnitEnumState[state_enum] or state_enum)
end

---移除状态
-- 只有移除次数等同添加次数时才能移除状态
---@param state_enum integer|y3.Const.UnitEnumState 状态名
function M:remove_state(state_enum)
    self.phandle:api_remove_state(y3.const.UnitEnumState[state_enum] or state_enum)
end

---添加多个状态
---使用 `y3.const.UnitEnumState` 中的枚举值
---@param state_enum integer 状态
function M:add_multi_state(state_enum)
    self.handle:api_add_multi_state(state_enum)
end

---移除多个状态
---使用 `y3.const.UnitEnumState` 中的枚举值
---@param state_enum integer 状态
function M:remove_multi_state(state_enum)
    self.handle:api_remove_multi_state(state_enum)
end

---是否有某个状态
---@param state_enum integer|y3.Const.UnitEnumState 状态名
---@return boolean?
function M:has_state(state_enum)
    return self.handle:api_has_state(y3.const.UnitEnumState[state_enum] or state_enum)
end

---添加状态
---@param state_enum integer|y3.Const.UnitEnumState 状态名
---@return GCNode
function M:add_state_gc(state_enum)
    self:add_state(state_enum)
    return New 'GCNode' (function ()
        self:remove_state(state_enum)
    end)
end

---学习技能
---@param ability_key py.AbilityKey 技能id
function M:learn(ability_key)
    self.phandle:api_unit_learn_ability(ability_key)
end

---发布命令
---@param command py.UnitCommand 命令
function M:command(command)
    self.phandle:api_release_command(command)
end

-- 命令移动
---@param point Point 点
---@param range? number 范围
---@return py.UnitCommand # 命令
function M:move_to_pos(point, range)
    local command = GameAPI.create_unit_command_move_to_pos(point.handle, Fix32(range or 0))
    self:command(command)
    return command
end

-- 命令停止
---@return py.UnitCommand # 命令
function M:stop()
    local command = GameAPI.create_unit_command_stop()
    self:command(command)
    return command
end

-- 命令驻守
---@param point Point 点
---@return py.UnitCommand # 命令
function M:hold(point)
    local command = GameAPI.create_unit_command_hold(point.handle)
    self:command(command)
    return command
end

-- 命令攻击移动
---@param point Point 点
---@param range? number 范围
---@return py.UnitCommand # 命令
function M:attack_move(point, range)
    local command = GameAPI.create_unit_command_attack_move(point.handle, Fix32(range or 0))
    self:command(command)
    return command
end

-- 命令攻击目标
---@param target Unit 目标
---@param range number 范围
---@return py.UnitCommand # 命令
function M:attack_target(target, range)
    local command = GameAPI.create_unit_command_attack_target(target.handle, Fix32(range or 0))
    self:command(command)
    return command
end

-- 命令沿路径移动
---@param road Road 路径
---@param patrol_mode integer 移动模式
---@param can_attack boolean 是否自动攻击
---@param start_from_nearest boolean 就近选择起始点
---@param back_to_nearest boolean 偏离后就近返回
---@return py.UnitCommand # 命令
function M:move_along_road(road, patrol_mode, can_attack, start_from_nearest, back_to_nearest)
    local command = GameAPI.create_unit_command_move_along_road(road.handle, patrol_mode, can_attack, start_from_nearest, back_to_nearest)
    self:command(command)
    return command
end

-- 命令发动技能
---@param ability Ability # 技能
---@param target? Point|Unit|Item|Destructible # 目标
---@param extra_target? Point # 额外目标
---@return py.UnitCommand
function M:cast(ability, target, extra_target)
    local tar_pos_1, tar_pos_2, tar_unit, tar_item, tar_dest
    if target then
        if target.type == 'point' then
            ---@cast target Point
            tar_pos_1 = target.handle
        elseif target.type == 'unit' then
            ---@cast target Unit
            tar_unit = target.handle
        elseif target.type == 'item' then
            ---@cast target Item
            tar_item = target.handle
        elseif target.type == 'destructible' then
            ---@cast target Destructible
            tar_dest = target.handle
        end
    end
    if extra_target then
        tar_pos_2 = extra_target.handle
    end
    -- TODO 见问题2
    ---@diagnostic disable-next-line: param-type-mismatch
    local command = GameAPI.create_unit_command_use_skill(ability.handle, tar_pos_1, tar_pos_2, tar_unit, tar_item, tar_dest)
    self:command(command)
    return command
end

-- 命令拾取物品
---@param item Item
---@return py.UnitCommand
function M:pick_item(item)
    local command = GameAPI.create_unit_command_pick_item(item.handle)
    self:command(command)
    return command
end

-- 命令丢弃物品
---@param item Item
---@param point Point
---@return py.UnitCommand
function M:drop_item(item, point)
    local command = GameAPI.create_unit_command_drop_item(item.handle, point.handle)
    self:command(command)
    return command
end

-- 命令给予物品
---@param item Item
---@param target Unit
---@return py.UnitCommand
function M:give_item(item, target)
    local command = GameAPI.create_unit_command_transfer_item(item.handle, target.handle)
    self:command(command)
    return command
end

-- 命令使用物品
---@param item Item
---@param target? Point|Unit|Item|Destructible
---@param extra_target? Point
---@return py.UnitCommand
function M:use_item(item, target, extra_target)
    local tar_pos_1, tar_pos_2, tar_unit, tar_item, tar_dest
    if target then
        if target.type == 'point' then
            ---@cast target Point
            tar_pos_1 = target.handle
        elseif target.type == 'unit' then
            ---@cast target Unit
            tar_unit = target.handle
        elseif target.type == 'item' then
            ---@cast target Item
            tar_item = target.handle
        elseif target.type == 'destructible' then
            ---@cast target Destructible
            tar_dest = target.handle
        end
    end

    if extra_target then
        tar_pos_2 = extra_target.handle
    end

    -- TODO 见问题2
    ---@diagnostic disable-next-line: param-type-mismatch
    local command = GameAPI.create_unit_command_use_item(item.handle, tar_pos_1, tar_pos_2, tar_unit, tar_item, tar_dest)
    self:command(command)
    return command
end

-- 命令跟随单位
---@param target Unit
---@param refresh_interval? number 刷新间隔
---@param near_offset? number 跟随距离
---@param far_offset? number 重新跟随距离
---@param follow_angle? number 跟随角度
---@param follow_dead_target? boolean 是否跟随死亡单位
---@return py.UnitCommand
function M:follow(target, refresh_interval, near_offset, far_offset, follow_angle, follow_dead_target)
    local command = GameAPI.create_unit_command_follow(target.handle
        , Fix32(refresh_interval or 0.5)
        , Fix32(near_offset or -1)
        , Fix32(far_offset or -1)
        , Fix32(follow_angle or -10000)
        , follow_dead_target or false
    )
    self:command(command)
    return command
end

---设置朝向
---@param direction number 朝向
---@param turn_time number 转向时间
function M:set_facing(direction, turn_time)
    self.phandle:api_set_face_angle(Fix32(direction), math.floor(turn_time * 1000))
end

---设置名称
---@param name string 名称
function M:set_name(name)
    self.phandle:api_set_name(name)
end

---设置描述
---@param description string 描述
function M:set_description(description)
    self.phandle:api_set_str_attr("desc", description)
end

---设置属性
---@param attr_name string | y3.Const.UnitAttr 属性名
---@param value number 属性值
---@param attr_type? string | y3.Const.UnitAttrType 属性类型，默认为“基础”
function M:set_attr(attr_name, value, attr_type)
    attr_name = y3.const.UnitAttr[attr_name] or attr_name
    if attr_name == 'main' then
        attr_name = self:get_main_attr()
        if not attr_name then
            error('此单位主属性为空')
        end
    end
    if attr_name == 'hp_cur' then
        self:set_hp(value)
        return
    end
    if attr_name == 'mp_cur' then
        self:set_mp(value)
        return
    end
    if attr_type == nil then
        attr_type = '基础'
    end
    self.phandle:api_set_attr_by_attr_element(y3.const.UnitAttr[attr_name] or attr_name, Fix32(value), y3.const.UnitAttrType[attr_type] or attr_type)
end

---增加属性
---@param attr_name string | y3.Const.UnitAttr 属性名
---@param value number 属性值
---@param attr_type? string | y3.Const.UnitAttrType 属性类型，默认为“增益”
function M:add_attr(attr_name, value, attr_type)
    attr_name = y3.const.UnitAttr[attr_name] or attr_name
    if attr_name == 'main' then
        attr_name = self:get_main_attr()
        if not attr_name then
            error('此单位主属性为空')
        end
    end
    if attr_name == 'hp_cur' then
        self:add_hp(value)
        return
    end
    if attr_name == 'mp_cur' then
        self:add_mp(value)
        return
    end
    if attr_type == nil then
        attr_type = '增益'
    end
    self.phandle:api_add_attr_by_attr_element(attr_name, Fix32(value), y3.const.UnitAttrType[attr_type] or attr_type)
end

---增加属性
---@param attr_name string | y3.Const.UnitAttr 属性名
---@param value number 属性值
---@param attr_type string | y3.Const.UnitAttrType 属性类型
---@return GCNode
function M:add_attr_gc(attr_name, value, attr_type)
    self:add_attr(attr_name, value, attr_type)
    return New 'GCNode' (function ()
        self:add_attr(attr_name, - value, attr_type)
    end)
end

---设置等级
---@param level integer 等级
function M:set_level(level)
    self.phandle:api_set_level(level)
end

---增加等级
---@param level integer 等级
function M:add_level(level)
    self.phandle:api_add_level(level)
end

---设置经验
---@param exp number 经验
function M:set_exp(exp)
    self.phandle:api_set_exp(Fix32(exp))
end

---增加经验值
---@param exp number 经验
function M:add_exp(exp)
    self.phandle:api_add_exp(Fix32(exp))
end

---设置当前生命值
---@param hp number 当前生命值
function M:set_hp(hp)
    self.phandle:api_set_attr("hp_cur", Fix32(hp))
end

---增加当前生命值
---@param hp number 当前生命值
function M:add_hp(hp)
    self.phandle:api_add_attr_base("hp_cur", Fix32(hp))
end

---设置当前魔法值
---@param mp number 当前魔法值
function M:set_mp(mp)
    self.phandle:api_set_attr("mp_cur", Fix32(mp))
end

---增加当前魔法值
---@param mp number 当前魔法值
function M:add_mp(mp)
    self.phandle:api_add_attr_base("mp_cur", Fix32(mp))
end

---设置技能点
---@param skill_point integer 技能点
function M:set_ability_point(skill_point)
    self.phandle:api_set_ability_point(skill_point)
end

---增加技能点
---@param skill_point integer 技能点
function M:add_ability_point(skill_point)
    self.phandle:api_add_ability_point(skill_point)
end

---改变所属玩家
---@param player Player 所属玩家
function M:change_owner(player)
    GameAPI.change_unit_role(self.handle, player.handle)
end

---设置飞行高度
---@param height number 高度
---@param trans_time number 过渡时间
function M:set_height(height, trans_time)
    self.phandle:api_raise_height(Fix32(height), Fix32(trans_time))
end

---设置生命周期
---@param time number 生命周期
function M:set_life_cycle(time)
    self.phandle:api_set_life_cycle(time)
end

---设置生命周期暂停状态
---@param is_stop boolean 生命周期暂停状态
function M:pause_life_cycle(is_stop)
    self.phandle:api_pause_life_cycle(is_stop)
end

---设置警戒范围
---@param range number 范围
function M:set_alert_range(range)
    self.phandle:api_set_unit_alarm_range(range)
end

---设置取消警戒范围
---@param range number 取消警戒范围
function M:set_cancel_alert_range(range)
    self.phandle:api_set_unit_cancel_alarm_range(range)
end

---设置背包栏的槽位数
---@param number integer 槽位数
function M:set_pkg_cnt(number)
    self.phandle:api_set_unit_pkg_cnt(number)
end

---设置物品栏的槽位数
---@param number integer 槽位数
function M:set_bar_cnt(number)
    self.phandle:api_set_unit_bar_cnt(number)
end

---设置默认单位行为
---@param behavior py.UnitBehavior 单位行为
function M:set_behavior(behavior)
    self.phandle:api_set_default_switch_behavior(behavior)
end

--******************************************
---设置属性成长
---@param unit_key py.UnitKey 单位id
---@param attr_name string 属性名
---@param value number 属性成长
function M.set_attr_growth(unit_key, attr_name, value)
    GameAPI.api_set_attr_growth(unit_key, attr_name, Fix32(value))
end

---设置被击杀的经验值奖励
---@param exp number 经验
function M:set_reward_exp(exp)
    self.phandle:api_set_unit_reward_exp(Fix32(exp))
end

---设置被击杀的玩家属性奖励
---@param player_attr_name py.RoleResKey 属性名
---@param value number 属性奖励
function M:set_reward_res(player_attr_name, value)
    self.phandle:api_set_unit_reward_res(player_attr_name, Fix32(value))
end

---设置攻击类型
---@param attack_type integer 攻击类型
function M:set_attack_type(attack_type)
    self.phandle:api_set_attack_type(attack_type)
end

---设置护甲类型
---@param armor_type integer 护甲类型
function M:set_armor_type(armor_type)
    self.phandle:api_set_armor_type(armor_type)
end

--************************残影优化
---开启残影
---@param red number 红
---@param green number 绿
---@param blue number 蓝
---@param alpha number 透明度
---@param interval number 间隔时间
---@param duration number 显示时间
---@param start_time number 开始时间
---@param end_time number 结束时间
---@param is_origin_martial boolean 使用原生材质
function M:start_ghost(red, green, blue, alpha, interval, duration, start_time, end_time, is_origin_martial)
    self.phandle:api_start_ghost(
        Fix32(red),
        Fix32(green),
        Fix32(blue),
        Fix32(alpha),
        Fix32(interval),
        Fix32(duration),
        Fix32(start_time),
        Fix32(end_time),
        is_origin_martial
    )
end

---关闭残影
function M:stop_ghost()
    self.phandle:api_stop_ghost()
end

---设置残影颜色
---@param red number 绿
---@param green number 绿
---@param blue number 蓝
---@param alpha number 透明度
function M:set_ghost_color(red, green, blue, alpha)
    self.phandle:api_set_ghost_color(Fix32(red), Fix32(green), Fix32(blue), Fix32(alpha))
end

---设置残影时间
---@param interval number 间隔时间
---@param duration number 显示时间
---@param start_time number 开始时间
---@param end_time number 结束时间
function M:set_afterimage_time(interval, duration, start_time, end_time)
    self.phandle:api_set_ghost_time(Fix32(interval), Fix32(duration), Fix32(start_time), Fix32(end_time))
end

---设置单位头像
---@param img_id py.Texture 单位头像
function M:set_icon(img_id)
    self.phandle:api_set_unit_icon(img_id)
end

---设置血条样式
---@param bar_type integer 血条样式
function M:set_blood_bar_type(bar_type)
    self.phandle:api_set_blood_bar_type(bar_type)
end

---设置血条显示方式
---@param bar_show_type integer 血条显示方式
function M:set_health_bar_display(bar_show_type)
    self.phandle:api_set_blood_bar_show_type(bar_show_type)
end

--***************敌我合并一条
---设置单位小地图头像
---@param img_id py.Texture 单位小地图头像
function M:set_minimap_icon(img_id)
    self.phandle:api_set_mini_map_icon(img_id)
end

---设置敌方单位小地图头像
---@param img_id py.Texture 敌方单位小地图头像
function M:set_enemy_minimap_icon(img_id)
    self.phandle:api_set_enemy_mini_map_icon(img_id)
end

--设置单位选择框的可见性
---@param bool boolean # 布尔值
function M:set_select_effect_visible(bool)
    self.phandle:api_set_unit_select_effect_visible(bool)
end

---设置模型缩放
---@param scale number 模型缩放
function M:set_scale(scale)
    self.phandle:api_set_scale(scale)
end

---设置单位三轴缩放
---@param sx number X轴缩放
---@param sy number Y轴缩放
---@param sz number Z轴缩放
function M:set_unit_scale(sx, sy, sz)
    self.phandle:api_set_unit_scale(sx, sy, sz)
end

---设置单位描边开启
---@param bool boolean # 布尔值
function M:set_outline_visible(bool)
    self.phandle:set_unit_outlined_enable(bool)
end

---设置单位描边颜色
---@param color_r number # R
---@param color_g number # G
---@param color_b number # B
function M:set_outlined_color(color_r, color_g, color_b)
    self.phandle:set_unit_outlined_color(color_r, color_g, color_b)
end

---设置转身速度
---@param speed number 转身速度
function M:set_turning_speed(speed)
    self.phandle:api_set_turn_speed(Fix32(speed))
end

---替换模型
---@param model_id py.ModelKey 模型id
function M:replace_model(model_id)
    self.phandle:api_replace_model(model_id)
end

---取消模型替换
---@param model_id py.ModelKey 模型id
function M:cancel_replace_model(model_id)
    self.phandle:api_cancel_replace_model(model_id)
end

--**********************这是啥
---设置隐身可见时是否半透明
---@param is_visible boolean 是否半透明
function M:set_transparent_when_invisible(is_visible)
    self.phandle:api_set_transparent_when_invisible(is_visible)
end

---设置尸体消失后是否回收
---@param is_recycle boolean 是否回收
function M:set_recycle_on_remove(is_recycle)
    self.phandle:api_set_recycle_on_remove(is_recycle)
end

---设置透视状态
---@param is_open boolean 是否透视
function M:set_Xray_is_open(is_open)
    self.phandle:api_set_Xray_is_open(is_open)
end

---单位添加科技
---@param tech_id py.TechKey 科技id
function M:add_tech(tech_id)
    self.phandle:api_add_tech(tech_id)
end

---单位删除科技
---@param tech_id py.TechKey 科技id
function M:remove_tech(tech_id)
    self.phandle:api_remove_tech(tech_id)
end

---研究科技
---@param tech_id py.TechKey 科技id
function M:research_tech(tech_id)
    self.phandle:api_upgrade_tech(tech_id)
end

---获取单位可研究的所有科技
---@return py.TechKey[]
function M:get_tech_list()
    local lua_table = {}
    local py_list = self.phandle:api_get_tech_list()
    if not py_list then
        return lua_table
    end
    for i = 0, python_len(py_list) - 1 do
        local tech = python_index(py_list, i)
        table.insert(lua_table, tech)
    end
    return lua_table
end

---获取单位受到影响的所有科技
---@return py.TechKey[]
function M:get_affect_techs()
    local lua_table = {}
    local py_list = self.phandle:api_get_affect_techs()
    if not py_list then
        return lua_table
    end
    for i = 0, python_len(py_list) - 1 do
        local tech = python_index(py_list, i)
        table.insert(lua_table, tech)
    end
    return lua_table
end


-- 设置白天的视野范围
---@param value number
function M:set_day_vision(value)
    self.phandle:api_set_unit_day_vision(value)
end

-- 设置夜晚的视野范围
---@param value number
function M:set_night_value(value)
    self.phandle:api_set_unit_night_vision(value)
end

--*******************播放动画全局统一
---播放动画
---@param anim_name string 动画名
---@param speed? number 速度
---@param start_time? number 开始时间
---@param end_time? number 结束时间(默认-1表示播到最后)
---@param is_loop? boolean 是否循环
---@param is_back_normal? boolean 是否返回默认状态
function M:play_animation(anim_name, speed, start_time, end_time, is_loop, is_back_normal)
    self.phandle:api_play_animation(
        anim_name,
        speed or 1,
        start_time or 0,
        end_time or -1,
        is_loop or false,
        is_back_normal or false
    )
end

---停止动画
---@param anim_name string 动画名
function M:stop_animation(anim_name)
    self.phandle:api_stop_animation(anim_name)
end

---替换动画
---@param replace_anim_name string 动画名
---@param bereplace_anim_name string 动画名
function M:change_animation(replace_anim_name, bereplace_anim_name)
    self.phandle:api_change_animation(replace_anim_name, bereplace_anim_name)
end

---取消动画替换
---@param replace_anim_name string 动画名
---@param bereplace_anim_name string 动画名
function M:cancel_change_animation(replace_anim_name, bereplace_anim_name)
    self.phandle:api_cancel_change_animation(replace_anim_name, bereplace_anim_name)
end

---重置动画替换
---@param anim_name string 动画名
function M:clear_change_animation(anim_name)
    self.phandle:api_clear_change_animation(anim_name)
end

---停止当前正在播放的动画
function M:stop_cur_animation()
    self.phandle:api_stop_cur_animation()
end

---设置动画播放速率
---@param speed number 速度
function M:set_animation_speed(speed)
    self.phandle:api_set_animation_speed(Fix32(speed))
end

---设置走路动画基准速度
---@param speed number 速度
function M:set_base_speed(speed)
    self.phandle:api_set_base_speed(Fix32(speed))
end

---添加可贩卖的商品
---@param tag_name py.TabName 标签名
---@param item_key py.ItemKey 物品id
function M:add_goods(tag_name, item_key)
    self.phandle:api_add_shop_item(tag_name, item_key)
end

---移除可贩卖的商品
---@param item_name py.TabName 物品名
---@param item_key py.ItemKey 物品id
function M:remove_goods(item_name, item_key)
    self.phandle:api_remove_shop_item(item_name, item_key)
end

---设置商品库存
---@param tag_name py.TabName 标签名
---@param item_key py.ItemKey 物品id
---@param number integer 物品库存
function M:set_goods_stack(tag_name, item_key, number)
    self.phandle:api_set_shop_item_stock(tag_name, item_key, number)
end

---单位向商店出售物品
---@param unit Unit 单位
---@param item Item 物品
function M:sell(unit, item)
    self.phandle:api_sell_item(unit.handle, item.handle)
end

---从商店购买商品
---@param unit Unit 单位
---@param tag_num py.TabIdx 页签id
---@param item_key py.ItemKey 物品id
function M:buy(unit, tag_num, item_key)
    self.phandle:api_buy_item_with_tab_name(unit.handle, tag_num, item_key)
end

---@class Buff.AddData
---@field key py.ModifierKey 魔法效果id
---@field source? Unit 来源单位
---@field ability? Ability 关联技能
---@field time? number 持续时间
---@field pulse? number 心跳周期
---@field stacks? integer 层数
---@field data? table 自定义数据

---给单位添加魔法效果
---@param data Buff.AddData
---@return Buff?
function M:add_buff(data)
    local py_buff = self.phandle:api_add_modifier(
        data.key,
        data.source and data.source.handle or nil,
        data.ability and data.ability.handle or nil,
        Fix32(data.time or -1),
        Fix32(data.pulse or 0.0),
        data.stacks or 1,
        data.data or nil
    )
    if not py_buff then
        return nil
    end
    return y3.buff.get_by_handle(py_buff)
end

---单位移除所有指定id的魔法效果
---@param buff_key py.ModifierKey 影响类型的魔法效果
function M:remove_buffs_by_key(buff_key)
    self.phandle:api_remove_modifier_type(buff_key)
end

---单位移除所有指定类型的魔法效果
---@param effect_type y3.Const.EffectType 影响类型的魔法效果
function M:remove_buffs_by_effect_type(effect_type)
    self.phandle:api_delete_all_modifiers_by_effect_type(effect_type)
end

---获取单位指定id的魔法效果
---@param buff_key py.ModifierKey 魔法效果id
---@param index? integer 第几个
---@return Buff? # 单位指定类型的魔法效果
function M:find_buff(buff_key, index)
    local py_modifier = self.phandle:api_get_modifier(index or -1, buff_key)
    if not py_modifier then
        return nil
    end
    return y3.buff.get_by_handle(py_modifier)
end

---获取商店商品的库存间隔
---@param page py.TabIdx 页签id
---@param index integer 序号
---@return number cd 默认间隔时间
function M:get_goods_cd(page, index)
    return y3.helper.tonumber(self.phandle:api_get_shop_item_default_cd(page, index)) or 0.0
end

---获取商店商品的剩余恢复时间
---@param page py.TabIdx 页签id
---@param index integer 序号
---@return number recovery_time 剩余恢复时间
function M:get_goods_remaining_cd(page, index)
    return y3.helper.tonumber(self.phandle:api_get_shop_item_residual_cd(page, index)) or 0.0
end

---获取所有的商店物品
---@param page py.TabIdx 页签
---@return py.ItemKey[]
function M:get_shop_item_list(page)
    local lua_table = {}
    local py_list = self.phandle:api_get_shop_item_list(page)
    if not py_list then
        return lua_table
    end
    for i = 0, python_len(py_list) - 1 do
        local item_key = python_index(py_list, i)
        lua_table[#lua_table+1] = item_key
    end
    return lua_table
end

---获取当前生命值
---@return number current_unit_hp 当前生命值
function M:get_hp()
    return y3.helper.tonumber(self.phandle:api_get_float_attr("hp_cur")) or 0.0
end

---获取当前魔法值
---@return number current_mp 当前魔法值
function M:get_mp()
    return y3.helper.tonumber(self.phandle:api_get_float_attr("mp_cur")) or 0
end

---获取最终属性
---@param attr_name string | y3.Const.UnitAttr 属性名
---@return number
function M:get_final_attr(attr_name)
    return y3.helper.tonumber(self.phandle:api_get_float_attr(y3.const.UnitAttr[attr_name] or attr_name)) or 0.0
end

---获取属性（额外）
---@param attr_name string | y3.Const.UnitAttr 属性名
---@return number
function M:get_attr_other(attr_name)
    return y3.helper.tonumber(self.phandle:api_get_attr_other(y3.const.UnitAttr[attr_name] or attr_name)) or 0.0
end

---获取单属性（基础）
---@param attr_name string | y3.Const.UnitAttr
---@return number attr_base 单位基础属性类型的属性
function M:get_attr_base(attr_name)
    return y3.helper.tonumber(self.phandle:api_get_attr_base(y3.const.UnitAttr[attr_name] or attr_name)) or 0.0
end

---获取属性（基础加成）
---@param attr_name string | y3.Const.UnitAttr
---@return number
function M:get_attr_base_ratio(attr_name)
    return y3.helper.tonumber(self.phandle:api_get_attr_base_ratio(y3.const.UnitAttr[attr_name] or attr_name)) or 0.0
end

---获取属性（增益）
---@param attr_name string | y3.Const.UnitAttr
---@return number
function M:get_attr_bonus(attr_name)
    return y3.helper.tonumber(self.phandle:api_get_attr_bonus(y3.const.UnitAttr[attr_name] or attr_name)) or 0.0
end

---获取属性（最终加成）
---@param attr_name string | y3.Const.UnitAttr
---@return number
function M:get_attr_all_ratio(attr_name)
    return y3.helper.tonumber(self.phandle:api_get_attr_all_ratio(y3.const.UnitAttr[attr_name] or attr_name)) or 0.0
end

---获取属性（增益加成）
---@param attr_name string | y3.Const.UnitAttr
---@return number
function M:get_attr_bonus_ratio(attr_name)
    return y3.helper.tonumber(self.phandle:api_get_attr_bonus_ratio(y3.const.UnitAttr[attr_name] or attr_name)) or 0.0
end

---获取属性（默认为实际属性）
---@param attr_name y3.Const.UnitAttr
---@param attr_type? '实际' | '额外' | y3.Const.UnitAttrType
---@return number
function M:get_attr(attr_name, attr_type)
    if attr_name == '主属性' then
        attr_name = self:get_main_attr()
        if not attr_name then
            error('此单位主属性为空')
        end
    end
    if attr_type == '实际'
    or attr_type == nil then
        return self:get_final_attr(attr_name)
    end
    if attr_type == '额外' then
        return self:get_attr_other(attr_name)
    end
    if attr_type == '基础' then
        return self:get_attr_base(attr_name)
    end
    if attr_type == '基础加成' then
        return self:get_attr_base_ratio(attr_name)
    end
    if attr_type == '增益' then
        return self:get_attr_bonus(attr_name)
    end
    if attr_type == '增益加成' then
        return self:get_attr_bonus_ratio(attr_name)
    end
    if attr_type == '最终加成'
    or attr_type == '总加成' then
        return self:get_attr_all_ratio(attr_name)
    end
    error('未知的属性类型:' .. tostring(attr_type))
end

---获取单位属性成长
---@param unit_key py.UnitKey
---@param attr_name string | y3.Const.UnitAttr
---@return number unit_attribute_growth 单位属性成长
function M.get_attr_growth_by_key(unit_key, attr_name)
    return y3.helper.tonumber(GameAPI.api_get_attr_growth(unit_key, y3.const.UnitAttr[attr_name] or attr_name)) or 0.0
end

---获取单位剩余生命周期
---@return number
function M:get_life_cycle()
    return y3.helper.tonumber(self.phandle:api_get_life_cycle()) or 0.0
end

---获取单位飞行高度
---@return number height 单位飞行高度
function M:get_height()
    return y3.helper.tonumber(self.phandle:api_get_height()) or 0.0
end

---获取单位转身速度
---@return number turning_speed 单位转身速度
function M:get_turning_speed()
    return y3.helper.tonumber(self.phandle:api_get_turn_speed()) or 0.0
end

---获取单位警戒范围
---@return number alert_range 单位警戒范围
function M:get_alert_range()
    return y3.helper.tonumber(self.phandle:api_get_unit_alarm_range()) or 0.0
end

---获取单位取消警戒的范围
---@return number cancel_alert_range 单位取消警戒的范围
function M:get_cancel_alert_range()
    return y3.helper.tonumber(self.phandle:api_get_unit_cancel_alarm_range()) or 0.0
end

---获取单位碰撞半径
---@return number collision_radius 单位碰撞半径
function M:get_collision_radius()
    return y3.helper.tonumber(self.phandle:api_get_unit_collision_radius()) or 0.0
end

---设置单位碰撞半径
---@deprecated
---@param radius number
function M:set_collision_radius(radius)
    ---@diagnostic disable-next-line: undefined-field
    self.handle:api_set_unit_collision_radius(radius)
end

---获取单位所属玩家
---@return Player player 单位所属玩家
function M:get_owner()
    local py_player = self.phandle:api_get_role()
    if not py_player then
        return y3.player(31)
    end
    return y3.player.get_by_handle(py_player)
end

---获取建造此单位消耗的资源（玩家属性）
---@param unit_id py.UnitKey 单位类型
---@param player_attr_name py.RoleResKey 玩家属性名
---@return integer player_attr 单位被击杀玩家属性
function M:get_unit_resource_cost(unit_id, player_attr_name)
    return GameAPI.get_role_attr_by_unit_type(unit_id, player_attr_name)
end

---获取击杀可获得的资源（玩家属性）
---@param player_attr_name py.RoleResKey 玩家属性名
---@return number player_attr 单位被击杀玩家属性
function M:get_reward_res(player_attr_name)
    return y3.helper.tonumber(self.phandle:api_get_unit_reward_res(player_attr_name)) or 0.0
end

---获取单位缩放
---@return number model_scale 单位缩放
function M:get_scale()
    return y3.helper.tonumber(self.phandle:api_get_model_scale()) or 0.0
end

---获取单位选择圈缩放
---@return number range_scale 选择圈缩放
function M:get_unit_selection_range_scale()
    return y3.helper.tonumber(GameAPI.get_select_circle_scale(self.handle)) or 0.0
end

---获取单位的X轴缩放
---@return number xaxis X轴缩放
function M:get_x_scale()
    return self.phandle:api_get_x_scale() or 0
end

---获取单位的Z轴缩放
---@return number zaxis  Z轴缩放
function M:get_z_scale()
    return self.phandle:api_get_y_scale() or 0
end

---获取单位的Y轴缩放
---@return number yaxis Y轴缩放
function M:get_y_scale()
    return self.phandle:api_get_z_scale() or 0
end

---获取商店的购买范围
---@return number purchase_range 购买范围
function M:get_shop_range()
    return y3.helper.tonumber(self.phandle:api_get_shop_range()) or 0.0
end

---获取单位等级
---@return integer unit_level 单位等级
function M:get_level()
    return self.phandle:api_get_level() or 0
end

---获取单位的单位类型ID
---@return py.UnitType unit_type 单位类型ID
function M:get_type()
    return self.phandle:api_get_type() or 0
end

---获取单位类型的ID
---@return py.UnitKey type_id 单位类型的ID
function M:get_key()
    return self.phandle:api_get_key() or 0
end

---获取单位当前的经验值
---@return integer exp 单位当前的经验值
function M:get_exp()
    return self.phandle:api_get_exp() or 0
end

---获取单位当前升级所需经验
---@return number exp 单位当前升级所需经验
function M:get_upgrade_exp()
    return self.phandle:api_get_upgrade_exp() or 0
end

---获取英雄的技能点数量
---@return integer hero_ability_point_number 英雄的技能点数量
function M:get_ability_point()
    return self.phandle:api_get_ability_point() or 0
end

---获取单位背包栏的槽位数
---@return integer slot_number 单位背包栏的槽位数
function M:get_pkg_cnt()
    return self.phandle:api_get_unit_pkg_cnt() or 0
end

---获取单位物品栏的槽位数
---@return integer slot_number 单位物品栏的槽位数
function M:get_bar_cnt()
    return self.phandle:api_get_unit_bar_cnt() or 0
end

---获取单位拥有的物品类型数量
---@param item_key py.ItemKey 物品类型id
---@return integer item_type_number 物品类型数量
function M:get_item_type_number_of_unit(item_key)
    return self.phandle:api_get_num_of_item_type(item_key) or 0
end

---获取单位被击杀经验
---@return integer exp 单位被击杀经验
function M:get_exp_reward()
    return self.phandle:api_get_unit_reward_exp() or 0
end

---获取单位指定护盾类型的护盾值
---@param shield_type integer 护盾类型
---@return integer shield_value 护盾类型的护盾值
function M:get_shield(shield_type)
    return self.phandle:api_get_unit_shield_value(shield_type) or 0
end

---获取商店页签数量
---@return number tab_number 页签数量
function M:get_shop_tab_number()
    return self.phandle:api_get_shop_tab_cnt() or 0
end

---获取商店的物品商品库存
---@param tag_index py.TabIdx 页签
---@param item_key py.ItemKey 物品类型
---@return integer item_stock 商品库存
function M:get_goods_stack(tag_index, item_key)
    return self.phandle:api_get_shop_item_stock(tag_index, item_key) or 0
end

---获取单位名称
---@return string unit_name  单位名称
function M:get_name()
    if not self.phandle.api_get_name then
        return '<无效单位>'
    end
    return self.phandle:api_get_name() or ''
end

---获取单位的描述
---@return string unit_description 单位的描述
function M:get_description()
    return self.phandle:api_get_str_attr("desc") or ''
end

---获取单位类型名称
---@param unit_key py.UnitKey
---@return string type_name 单位类型名称
function M.get_name_by_key(unit_key)
    return GameAPI.get_unit_name_by_type(unit_key)
end

---获取单位类型的描述
---@param unit_key py.UnitKey 单位类型
---@return string des 单位类型的描述
function M.get_description_by_key(unit_key)
    return GameAPI.get_unit_desc_by_type(unit_key)
end

---获取商店的页签名
---@param tag_index py.TabIdx 页签
---@return string tab_name 页签名
function M:get_shop_tab_name(tag_index)
    return self.phandle:api_get_shop_tab_name(tag_index) or ''
end

---获取单位分类
---@return py.UnitType unit_subtype 单位分类
function M:get_subtype()
    return self.phandle:api_get_type() or 0
end

---是否是英雄
---@returr boolean
function M:is_hero()
    return self.phandle:api_get_type() == y3.const.UnitCategory['HERO']
end

--获取单位的头像
---@return py.Texture image 单位的头像
function M:get_icon()
    return GameAPI.get_icon_id_by_unit_type(self:get_key()) --[[@as py.Texture]]
end

---是否是建筑
---@return boolean
function M:is_building()
    return self.handle:api_get_type() == y3.const.UnitCategory['BUILDING']
end

---获取单位类型的头像
---@param unit_key py.UnitKey 单位类型
---@return py.Texture image 单位类型的头像
function M.get_icon_by_key(unit_key)
    return GameAPI.get_icon_id_by_unit_type(unit_key) --[[@as py.Texture]]
end

---最后创建的单位
---@return Unit? unit 最后创建的单位
function M.get_last_created_unit()
    local py_unit = GameAPI.get_last_created_unit()
    if not py_unit then
        return nil
    end
    return y3.unit.get_by_handle(py_unit)
end

---获取单位的拥有者（单位）
---@return Unit? unit 单位的拥有者
function M:get_parent_unit()
    local py_unit = self.phandle:api_get_parent_unit()
    if not py_unit then
        return nil
    end
    return y3.unit.get_by_handle(py_unit)
end

---获取幻象的召唤者
---@return Unit? unit 幻象的召唤者
function M:get_illusion_owner()
    local py_unit = GameAPI.get_illusion_caller_unit(self.handle)
    if not py_unit then
        return nil
    end
    return y3.unit.get_by_handle(py_unit)
end

---获取单位的朝向
---@return number angle 单位的朝向
function M:get_facing()
    return y3.helper.tonumber(self.phandle:get_face_angle()) or 0.0
end

---获得护甲类型
---@return integer DAMAGE_ARMOR_TYPE 护甲类型
function M:get_armor_type()
    return self.phandle:api_get_armor_type() or 0
end

---获得攻击类型
---@return integer DAMAGE_ATTACK_TYPE 攻击类型
function M:get_attack_type()
    return self.phandle:api_get_atk_type() or 0
end

---获取商店的物品id
---@param tag_index py.TabIdx 页签
---@param item_index integer 序号
---@return py.ItemKey item 物品类型
function M:get_goods_key(tag_index, item_index)
    return self.phandle:api_get_shop_tab_item_type(tag_index, item_index) or 0
end

---获取单位的当前模型
---@return py.ModelKey model 当前模型
function M:get_model()
    return self.phandle:api_get_model() or 0
end

---获取单位的原本模型
---@return py.ModelKey model 原本模型
function M:get_source_model()
    return self.phandle:api_get_source_model() or 0
end

---获取单位所在点
---@return Point unit_point 单位所在点
function M:get_point()
    local py_point = self.phandle:api_get_position()
    -- TODO 见问题2
    ---@diagnostic disable-next-line: param-type-mismatch
    return y3.point.get_by_handle(py_point)
end

---获取单位最近的可通行点
---@return Point point 单位最近的可通行点
function M:get_nearest_valid_point()
    local py_point = self.phandle:api_find_nearest_valid_position()
    -- TODO 见问题2
    ---@diagnostic disable-next-line: param-type-mismatch
    return y3.point.get_by_handle(py_point)
end

---获取单位的队伍
---@return py.Camp team 获取单位的队伍
function M:get_team()
    return self.phandle:api_get_camp() or 0--[[@as py.Camp]]
end

---是否具有标签
---@param tag_name string 标签
---@return boolean has_tag 具有标签
function M:has_tag(tag_name)
    return GlobalAPI.has_tag(self.handle, tag_name)
end

---是否存活
---@return boolean alive 是否存活
function M:is_alive()
    return GlobalAPI.is_unit_alive(self.handle)
end

---是否可见
---@param target_unit Unit 目标单位
---@return boolean visibility 目标是否可见
function M:can_visible(target_unit)
    -- TODO 见问题5
    ---@diagnostic disable-next-line: param-type-mismatch
    return GameAPI.get_visibility_of_unit(self.handle, target_unit.handle)
end

---是否正在移动
---@return boolean is_moving 正在移动
function M:is_moving()
    return self.phandle:api_is_moving() or false
end

---是否在另一个单位或点附近
---@param other Unit|Point 单位/点
---@param range number 范围
---@return boolean in_radius 在单位附近
function M:is_in_radius(other, range)
    if other.type == 'unit' then
        ---@cast other Unit
        return self.phandle:api_is_in_range(other.handle, range) or false
    else
        ---@cast other Point
        -- TODO 见问题2
        ---@diagnostic disable-next-line: param-type-mismatch
        return self.phandle:api_is_point_in_range(other.handle, range) or false
    end
end

---是否是商店
---@return boolean is_shop 是商店
function M:is_shop()
    return self.phandle:api_is_shop() or false
end

---是否是幻象单位
---@return boolean illusion 是幻象单位
function M:is_illusion()
    return GameAPI.is_unit_illusion(self.handle)
end

---是否在单位组中
---@param group UnitGroup 单位组
---@return boolean in_group 在单位组中
function M:is_in_group(group)
    return GameAPI.judge_unit_in_group(self.handle, group.handle)
end

---是否在战斗状态
---@return boolean in_battle 在战斗状态
function M:is_in_battle()
    return self.phandle:api_is_in_battle_state() or false
end

---是否有指定状态
--> 请改用 `has_state` 方法
---@deprecated
---@param state_name integer 状态
---@return boolean has_buff_status 有指定状态
function M:has_buff_status(state_name)
    return self.phandle:api_has_state(state_name) or false
end

---是否有指定id的技能
---@param ability_key py.AbilityKey 技能类型
---@return boolean has_ability_type 有指定类型的技能
function M:has_ability_by_key(ability_key)
    return self.phandle:api_check_has_ability_type(ability_key) or false
end

---是否有指定物品
---@param item Item 物品
---@return boolean has_item 有物品
function M:has_item(item)
    return self.phandle:api_has_item(item.handle) or false
end

---是否有指定类型的物品
---@param item_key py.ItemKey 物品类型
---@return boolean has_item_name 有指定类型的物品
function M:has_item_by_key(item_key)
    return self.phandle:api_has_item_key(item_key) or false
end

---是否有指定id的魔法效果
---@param buff_key py.ModifierKey 魔法效果id
---@return boolean has_modifier 有魔法效果
function M:has_buff_by_key(buff_key)
    return self.phandle:api_has_modifier(buff_key) or false
end

---是否有指定类型的魔法效果
---@param effect_type y3.Const.EffectType 魔法效果类型
---@return boolean has_modifier_style 有指定类型的魔法效果
function M:has_buff_by_effect_type(effect_type)
    return self.phandle:api_has_modifier_type(effect_type) or false
end

---是否有指定标签的魔法效果
---@param tag_name string 标签
---@return boolean has_modifier_tag 有指定标签的魔法效果
function M:unit_has_modifier_tag(tag_name)
    return self.phandle:api_has_modifier_with_tag(tag_name) or false
end

---单位类型前置条件是否通过
---@param player Player 玩家
---@param unit_key py.UnitKey 单位类型
---@return boolean unit_precondition 单位类型前置条件是否通过
function M.check_precondition_by_key(player, unit_key)
    return GameAPI.check_unit_key_precondition(player.handle, unit_key) or false
end

---是否是友方
---@param target_unit Unit 目标单位
---@return boolean is_enemy  是敌对关系
function M:is_ally(target_unit)
    return GameAPI.is_ally(self.handle, target_unit.handle)
end

---是否是敌人
---@param target_unit Unit 目标单位
---@return boolean is_enemy  是敌对关系
function M:is_enemy(target_unit)
    return GameAPI.is_enemy(self.handle, target_unit.handle)
end

---能否传送到点
---@param point Point 点
---@return boolean can_teleport 能否传送到点
function M:can_blink_to(point)
    return self.phandle:api_can_teleport_to(point.handle) or false
end

---是否与点碰撞
---@param point Point 点
---@param range number 范围
---@return boolean can_collide 是否与点碰撞
function M:is_collided_with_point(point, range)
    -- TODO 见问题2
    ---@diagnostic disable-next-line: param-type-mismatch
    return GameAPI.unit_can_collide_with_point(self.handle, point.handle, range)
end

---是否寻路可达
---@param start_point Point 起始点
---@param end_point Point 终点
---@return boolean is_reach 是否寻路可达
function M:can_walk_to(start_point, end_point)
    -- TODO 见问题2
    ---@diagnostic disable-next-line: param-type-mismatch
    return GameAPI.can_point_reach_point(self.handle, start_point.handle, end_point.handle)
end

---是否拥有指定碰撞类型
---@param collision_layer integer | y3.Const.CollisionLayers 碰撞类型
---@return boolean # 是否拥有指定碰撞类型
function M:has_move_collision(collision_layer)
    return self.phandle:api_get_move_collision(y3.const.CollisionLayers[collision_layer] or collision_layer) or false
end

---设置单位是否计算某种碰撞类型
---@param collision_layer integer | y3.Const.CollisionLayers # 碰撞mask
---@param enable boolean # 开启状态
function M:set_move_collision(collision_layer, enable)
    self.phandle:api_set_move_collision(y3.const.CollisionLayers[collision_layer] or collision_layer, enable)
end

-- 获取所属玩家
---@return Player
function M:get_owner_player()
    local role_id = self.phandle:api_get_role_id()
    if not role_id then
        return y3.player(31)
    end
    return y3.player.get_by_id(role_id)
end

---玩家是否可以购买商店的物品
---@param player Player
---@return boolean
function M:player_shop_check(player)
    return self.phandle:api_shop_check_camp(player.handle) or false
end

---获取单位类型的模型
---@param unit_key py.UnitKey 单位id
---@return py.ModelKey model 模型
function M.get_model_by_key(unit_key)
    return GameAPI.api_get_unit_type_model(unit_key)
end

---获取单位类型的分类
---@param unit_key py.UnitKey 单位id
---@return integer
function M.get_type_by_id(unit_key)
    return GameAPI.api_get_unit_type_category(unit_key)
end

---单位属性转单位属性名字
---@param key string 属性key
---@return string 属性名字
function M.attr_to_name(key)
    return GameAPI.unit_attr_to_str(key):match("%((.-)%)")
end

--- 造成伤害
---@class Unit.DamageData
---@field target Unit|Item|Destructible
---@field type y3.Const.DamageType | integer # 也可以传任意数字
---@field damage number
---@field ability? Ability # 关联技能
---@field text_type? y3.Const.DamageTextType # 跳字类型
---@field text_track? integer # 跳字轨迹类型
---@field common_attack? boolean # 视为普攻
---@field critical? boolean # 必定暴击
---@field no_miss? boolean # 必定命中
---@field particle? py.SfxKey # 特效
---@field socket? string # 特效挂点

---@param data Unit.DamageData
function M:damage(data)
    ---@diagnostic disable-next-line: missing-parameter
    GameAPI.apply_damage(
        self.handle,
        data.ability and data.ability.handle or nil,
        -- TODO 参考问题3
        ---@diagnostic disable-next-line: param-type-mismatch
        data.target.handle,
        y3.const.DamageTypeMap[data.type] or data.type,
        Fix32(data.damage),
        data.text_type ~= nil,
        nil,
        data.common_attack or false,
        data.critical or false,
        data.no_miss or false,
        data.particle or nil,
        data.socket or '',
        data.text_type or 'physics',
        data.text_track or 0
    )
end

---获取单位主属性(需要开启复合属性)
---@return string
function M:get_main_attr()
    return self.phandle:api_get_main_attr() or ''
end

---设置单位的移动类型为地面
---@param land_limitation? boolean # 陆地限制
---@param item_limitation? boolean # 物件限制
---@param water_limitation? boolean # 海洋限制
function M:set_move_channel_land(land_limitation, item_limitation, water_limitation)
    self.phandle:set_move_channel_land(land_limitation, item_limitation, water_limitation)
end

---设置单位的移动类型为空中
---@param air_limitation? boolean # 空中限制
function M:set_move_channel_air(air_limitation)
    self.phandle:set_move_channel_air(air_limitation)
end

---获取单位阵营ID
---@return py.CampID
function M:get_camp_id()
    return self.phandle:api_get_camp_id() or 0
end

return M
