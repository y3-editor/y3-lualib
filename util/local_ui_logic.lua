--本地UI逻辑框架
---@class LocalUILogic
---@field private _main UI
---@overload fun(main_name: string): self
local M = Class 'LocalUILogic'

---@diagnostic disable-next-line: deprecated
local local_player = y3.player.get_local()

---@class LocalUILogic.RegisterInfo
---@field name string
---@field on_update fun(ui: UI, local_player: Player)

function M:__init(main_name)
    ---@private
    self._main_name = main_name
    ---@private
    self._bind_unit_attr = {}
    ---@private
    ---@type LocalUILogic.RegisterInfo[]
    self._registers = {}
    y3.ltimer.wait(0, function ()
        self._main = y3.ui.get_ui(local_player, self._main_name)
        assert(self._main)
        for _, v in ipairs(self._bind_unit_attr) do
            self:bind_unit_attr(v.child_name, v.ui_attr, v.unit_attr)
        end

        ---@private
        ---@type table<string, UI|false>
        self._childs = setmetatable({}, { __index = function (t, k)
            local ui = self._main:get_child(k)
            t[k] = ui or false
            return t[k]
        end })

        ---@private
        ---@type table<string, LocalUILogic.RegisterInfo[]>
        self._update_targets = setmetatable({}, { __index = function (t, k)
            local uis = self:get_update_targets(k)
            t[k] = uis
            return t[k]
        end })

        self._childs['*'] = self._main
        self:update('*')
    end)
end

--将子控件的属性绑定到单位的属性
---@param child_name string
---@param ui_attr y3.Const.UIAttr
---@param unit_attr y3.Const.UnitAttr
function M:bind_unit_attr(child_name, ui_attr, unit_attr)
    if not self._main then
        table.insert(self._bind_unit_attr, {
            child_name = child_name,
            ui_attr = ui_attr,
            unit_attr = unit_attr
        })
        return
    end
    local child = self._main:get_child(child_name)
    if not child then
        return
    end
    child:bind_unit_attr(ui_attr, unit_attr)
end


--订阅控件刷新，回调函数在 *本地玩家* 环境中执行
---@param child_name string
---@param on_update fun(ui: UI, local_player: Player)
function M:register(child_name, on_update)
    table.insert(self._registers, {
        name = child_name,
        on_update = on_update
    })
end

local function is_child_name(target, name)
    if target == name then
        return true
    end
    if y3.util.stringStartWith(name, target .. '.') then
        return true
    end
    return false
end

---@private
---@param name string
---@return LocalUILogic.RegisterInfo[]
function M:get_update_targets(name)
    if name == '*' then
        return self._registers
    end
    local targets = {}
    for _, info in ipairs(self._registers) do
        if is_child_name(name, info.name) then
            targets[#targets+1] = info
        end
    end
    return targets
end

--刷新控件，指定的控件以及其子控件都会收到刷新消息。
--参数为 `*` 时，刷新所有控件。
---@param name string
---@param player? Player # 只刷新此玩家的
function M:update(name, player)
    if not self._main then
        return
    end

    if player and player ~= local_player then
        return
    end

    local infos = self._update_targets[name]
    for _, info in ipairs(infos) do
        local ui = self._childs[info.name]
        if ui then
            info.on_update(ui, local_player)
        end
    end
end
