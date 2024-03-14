--选取器
--
--用来选取某个区域内的单位
---@class Selector
---@overload fun(): self
local M = Class "Selector"

---@return self
function M:__init()
    return self
end

-- 形状 - 添加形状对象
---@param pos Point
---@param shape Shape
---@return self
function M:在区域内(pos, shape)
    ---@private
    self._pos   = pos
    ---@private
    self._shape = shape
    return self
end

-- 条件 - 属于某个玩家
---@param p Player
---@return self
function M:属于玩家(p)
    ---@private
    self._owner_player = p
    return self
end

-- 条件 - 对某个玩家可见
---@param p Player
---@return self
function M:对玩家可见(p)
    ---@private
    self._visible_player = p
    return self
end

-- 条件 - 对某个玩家不可见
---@param p Player
---@return self
function M:对玩家不可见(p)
    ---@private
    self._invisible_player = p
    return self
end

-- 条件 - 不在某个单位组中
---@param ug UnitGroup
---@return self
function M:不在单位组(ug)
    ---@private
    self._not_in_unit_group = ug
    return self
end

-- 条件 - 拥有特定标签
---@param tag 别名.单位.标签
---@return self
function M:拥有标签(tag)
    ---@private
    self._with_tag = tag
    return self
end

-- 条件 - 不拥有特定标签
---@param tag 别名.单位.标签
---@return self
function M:排除标签(tag)
    ---@private
    self._without_tag = tag
    return self
end

-- 条件 - 不是某个特定的单位
---@param u Unit
---@return self
function M:排除特定单位(u)
    ---@private
    self._not_is = u
    return self
end

-- 条件 - 拥有某个特定的状态
---@param state integer
---@return self
function M:拥有状态(state)
    ---@private
    self._in_state = state
    return self
end

-- 条件 - 不拥有某个特定的状态
---@param state integer
---@return self
function M:排除状态(state)
    ---@private
    self._not_in_state = state
    return self
end

-- 条件 - 是某个特定的单位类型
---@param unit_key py.UnitKey
---@return self
function M:是特定单位类型(unit_key)
    ---@private
    self._unit_key = unit_key
    return self
end

-- 条件 - 是某个特定的单位类型
---@param unit_type py.UnitType
---@return self
function M:排除单位类型(unit_type)
    ---@private
    self._unit_type = unit_type
    return self
end

-- 选项 - 包含死亡的单位
---@param 包含? boolean 默认false
---@return self
function M:是否包含死亡单位(包含)
    ---@private
    self._include_dead = 包含
    return self
end

-- 选项 - 选取的数量
---@param count integer
---@return self
function M:选取数量(count)
    ---@private
    self._count = count
    return self
end

---@alias y3.Const.选择器筛选方式 "由近到远"|"由远到近"|"随机筛选"

local 选择器筛选方式 = {
    由近到远 = 0,
    由远到近 = 1,
    随机筛选 = 2,
}


---@param 筛选方式 y3.Const.选择器筛选方式
---@return self
function M:筛选方式(筛选方式)
    ---@private
    self.sort_type = 选择器筛选方式[筛选方式]
    return self
end

-- 进行选取
---@return UnitGroup
function M:获取()
    local pos = self._pos
    local shape = self._shape
    assert(pos, "必须设置中心点！")
    assert(shape, "必须设置形状！")
    local py_unit_group = GameAPI.filter_unit_id_list_in_area_v2(
    -- TODO 见问题2
    ---@diagnostic disable-next-line: param-type-mismatch
        pos.handle,
        shape.handle,
        self._owner_player and self._owner_player.handle or nil,
        self._visible_player and self._visible_player.handle or nil,
        self._invisible_player and self._invisible_player.handle or nil,
        self._not_in_unit_group and self._not_in_unit_group.handle or nil,
        self._with_tag,
        self._without_tag,
        self._unit_key or 0,
        self._not_is and self._not_is.handle or nil,
        self._unit_type,
        self._in_state or 0,
        self._not_in_state or 0,
        self._include_dead,
        self._count or -1,
        self.sort_type or 2
    )
    return New "UnitGroup" (py_unit_group)
end

-- 创建选取器
---@return Selector
function M.创建()
    return New "Selector" ()
end

return M
