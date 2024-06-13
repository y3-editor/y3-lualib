--本地UI逻辑框架
---@class LocalUILogic
---@field private _main UI
---@overload fun(main?: string | UI): self
local M = Class 'LocalUILogic'

---@class LocalUILogic: Storage
Extends('LocalUILogic', 'Storage')

---@type table<LocalUILogic, boolean>
local all_instances = setmetatable({}, { __mode = 'k' })

---@diagnostic disable-next-line: deprecated
local local_player = y3.player.get_local()

---@class LocalUILogic.OnRefreshInfo
---@field name string
---@field on_refresh fun(ui: UI, local_player: Player, kv: table)

---@class LocalUILogic.OnInitInfo
---@field name string
---@field on_init fun(ui: UI, local_player: Player, kv: table)

---@class LocalUILogic.OnEventInfo
---@field name string
---@field event y3.Const.UIEvent
---@field on_event fun(ui: UI, local_player: Player, kv: table)

---@param path_or_ui? string | UI
function M:__init(path_or_ui)
    if y3.game.is_debug_mode() then
        all_instances[self] = true
    end
    ---@private
    self._bind_unit_attr = {}
    ---@package
    ---@type LocalUILogic.OnRefreshInfo[]
    self._on_refreshs = {}
    ---@package
    ---@type LocalUILogic.OnEventInfo[]
    self._on_events = {}
    ---@package
    ---@type LocalUILogic.OnInitInfo[]
    self._on_inits = {}

    if type(path_or_ui) == 'string' then
        y3.ltimer.wait(0, function ()
            local main = y3.ui.get_ui(local_player, path_or_ui)
            self:attach(main)
        end)
    end
    if type(path_or_ui) == 'table' then
        self:attach(path_or_ui)
    end
end

---@package
function M:as_template()
    ---@private
    self._as_template = true
end

---@private
---@param kv? table
---@return self
function M:make_instance(kv)
    local instance = New 'LocalUILogic' ()
    instance._bind_unit_attr = self._bind_unit_attr
    instance._on_refreshs = self._on_refreshs
    instance._on_events = self._on_events
    instance._on_inits = self._on_inits

    if kv then
        for k, v in pairs(kv) do
            instance:storage_set(k, v)
        end
    end

    return instance
end

--附着到一个UI上
---@param ui UI
---@param kv? table # 数据会在事件里传给你
---@return self
function M:attach(ui, kv)
    assert(not self._main, '已经附着到UI上了！')
    --如果自己是模板，就复制一个实例出来再附着
    if self._as_template then
        local instance = self:make_instance(kv)
        instance:attach(ui)
        return instance
    end
    self._main = ui
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
    ---@type table<string, LocalUILogic.OnRefreshInfo[]>
    self._refresh_targets = setmetatable({}, { __index = function (t, k)
        local uis = self:get_refresh_targets(k)
        t[k] = uis
        return t[k]
    end })

    self._childs[''] = self._main
    self:init()
    self:refresh('*')

    self:register_events()

    return self
end

--将子控件的属性绑定到单位的属性
---@param child_name string
---@param ui_attr y3.Const.UIAttr
---@param unit_attr y3.Const.UnitAttr | string
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


--订阅控件刷新，回调函数在 *本地玩家* 环境中执行。
--使用空字符串表示主控件。
---@param child_name string
---@param on_refresh fun(ui: UI, local_player: Player, kv: table)
function M:on_refresh(child_name, on_refresh)
    table.insert(self._on_refreshs, {
        name = child_name,
        on_refresh = on_refresh
    })
end

--订阅控件的本地事件，回调函数在 *本地玩家* 环境中执行。
---@param child_name string
---@param event y3.Const.UIEvent
---@param callback fun(ui: UI, local_player: Player, kv: table)
function M:on_event(child_name, event, callback)
    table.insert(self._on_events, {
        name = child_name,
        event = event,
        on_event = callback
    })
end

--订阅控件的初始化事件，回调函数在 *本地玩家* 环境中执行。
---@param child_name string
---@param on_init fun(ui: UI, local_player: Player, kv: table)
function M:on_init(child_name, on_init)
    table.insert(self._on_inits, {
        name = child_name,
        on_init = on_init
    })
end

---@private
function M:register_events()
    for _, info in ipairs(self._on_events) do
        local ui = self._childs[info.name]
        if ui then
            ui:add_local_event(info.event, function ()
                info.on_event(ui, local_player, self:storage_all())
            end)
        end
    end
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
---@return LocalUILogic.OnRefreshInfo[]
function M:get_refresh_targets(name)
    if name == '*' then
        return self._on_refreshs
    end
    local targets = {}
    for _, info in ipairs(self._on_refreshs) do
        if is_child_name(name, info.name) then
            targets[#targets+1] = info
        end
    end
    return targets
end

---@private
function M:init()
    for _, info in ipairs(self._on_inits) do
        local ui = self._childs[info.name]
        if ui then
            info.on_init(ui, local_player, self:storage_all())
        end
    end
end

--刷新控件，指定的控件以及其子控件都会收到刷新消息。
--参数为 `*` 时，刷新所有控件。
---@param name string
---@param player? Player # 只刷新此玩家的
function M:refresh(name, player)
    if not self._main then
        return
    end

    if player and player ~= local_player then
        return
    end

    local infos = self._refresh_targets[name]
    for _, info in ipairs(infos) do
        local ui = self._childs[info.name]
        if ui then
            info.on_refresh(ui, local_player, self:storage_all())
        end
    end
end

y3.reload.onBeforeReload(function (reload, willReload)
    for instance in pairs(all_instances) do
        for _, info in pairs(instance._on_refreshs) do
            if reload:isValidName(y3.reload.getIncludeName(info.on_refresh)) then
                info.on_refresh = function () end
            end
        end
        for _, info in pairs(instance._on_events) do
            if reload:isValidName(y3.reload.getIncludeName(info.on_event)) then
                info.on_event = function () end
            end
        end
    end
end)

---@class LocalUILogic.API
local API = {}

--创建一个本地UI逻辑
---@param path_or_ui string | UI
---@return LocalUILogic
function API.create(path_or_ui)
    return New 'LocalUILogic' (path_or_ui)
end

--创建一个本地UI逻辑的模板，之后调用 `attach` 方法附着到一个UI上。
---@return LocalUILogic
function API.template()
    local logic = New 'LocalUILogic' ()
    logic:as_template()
    return logic
end

return API
