-- 云端单位表现：y3.cloud.unit
-- 收到全量与增量后创建 / 移除表现单位、写入属性、执行移动命令；并把寻路中的位置回传云端

---@class Cloud.Unit.Data
---@field key py.UnitKey 物编单位 key
---@field x number
---@field y number
---@field face? number 朝向
---@field owner? integer 归属玩家 id

---@class Cloud.Unit
local M = {}

-- 没有归属玩家时用中立玩家创建
local NEUTRAL_PLAYER_ID = 31

-- 寻路位置上报间隔（秒）
local REPORT_INTERVAL = 0.2

---@type table<integer, Unit>
local units = {}

---@type table<integer, true>
local pathing = {}

---@type table<Unit, integer>
local uid_of = setmetatable({}, { __mode = 'k' })

---@type fun(unit: Unit, name: string, value: number): boolean?
local hook

local report_seq = 0
local last_report_time = 0

---@param unit Unit
---@param attrs table<string, number>?
local function apply_attrs(unit, attrs)
    if type(attrs) ~= 'table' then
        return
    end
    for name, value in pairs(attrs) do
        local handled = hook and hook(unit, name, value)
        if not handled then
            unit:set_attr(name, value)
        end
    end
end

---@param uid integer
local function remove(uid)
    local unit = units[uid]
    if not unit then
        return
    end
    units[uid] = nil
    pathing[uid] = nil
    uid_of[unit] = nil
    unit:remove()
end

---@param uid integer
---@param data Cloud.Unit.Data
local function create(uid, data)
    remove(uid)

    local owner = y3.player.get_by_id(data.owner or NEUTRAL_PLAYER_ID)
    if not owner then
        log.warn('y3.cloud.unit: owner not found, uid=' .. tostring(uid))
        return
    end

    local unit = y3.unit.create_unit(owner, data.key, y3.point(data.x, data.y), data.face or 0)
    unit:add_state('禁止普攻')
    units[uid] = unit
    uid_of[unit] = uid
end

---@param list table<integer, Cloud.Unit.Data>?
local function apply_create(list)
    if type(list) ~= 'table' then
        return
    end
    for uid, data in pairs(list) do
        create(uid, data)
    end
end

---@param list table<integer, true>?
local function apply_remove(list)
    if type(list) ~= 'table' then
        return
    end
    for uid in pairs(list) do
        remove(uid)
    end
end

---@param list table<integer, table<string, number>>?
local function apply_attribute(list)
    if type(list) ~= 'table' then
        return
    end
    for uid, attrs in pairs(list) do
        local unit = units[uid]
        if unit then
            apply_attrs(unit, attrs)
        end
    end
end

---@param list table<integer, table<string, any>>?
local function apply_command(list)
    if type(list) ~= 'table' then
        return
    end
    for uid, command in pairs(list) do
        local unit = units[uid]
        if unit and type(command) == 'table' then
            if command.move_to then
                unit:move_to_pos(y3.point(command.move_to.x, command.move_to.y, 0))
            elseif command.teleport then
                unit:set_point(y3.point(command.teleport.x, command.teleport.y, 0), false)
            elseif command.stop then
                unit:stop()
            end
        end
    end
end

---@param data any
local function on_sync(data)
    if type(data) ~= 'table' then
        return
    end
    apply_create(data.create)
    apply_remove(data.remove)
    apply_attribute(data.attribute)
    apply_command(data.command)
end

y3.cloud.rpc.register('$Unit.Sync', on_sync)

local function pull()
    y3.cloud.rpc.request('$Unit.GetAll', nil, function (suc, data, err)
        if not suc then
            log.warn('y3.cloud.unit: request failed, ' .. tostring(err))
            return
        end

        local list = data and data.units
        if type(list) ~= 'table' then
            return
        end
        for uid in pairs(units) do
            if not list[uid] then
                remove(uid)
            end
        end
        apply_create(list)
        apply_attribute(data.attribute)
    end)
end

y3.cloud.on_ready(pull)

---@param unit Unit
---@return { x: number, y: number }
local function unit_pos(unit)
    local point = unit:get_point()
    return { x = point:get_x(), y = point:get_y() }
end

---@param kind string 'start' | 'move' | 'stop'
---@param list table
local function report(kind, list)
    if not next(list) then
        return
    end
    report_seq = report_seq + 1
    y3.cloud.rpc.notify('$Unit.Pos.Report', {
        seq = report_seq,
        [kind] = list,
    })
end

-- 上报者：存活玩家中 role_id 最小的那个，各端结论一致
---@return Player?
local function get_reporter()
    local reporter
    for player in pairs(y3.player_group.get_all_players()) do
        if player and player:is_alive() then
            if not reporter or player:get_id() < reporter:get_id() then
                reporter = player
            end
        end
    end
    return reporter
end

-- 以 is_moving 轮询为准：寻路事件在移动途中也可能触发（到达/失败 3 次）
local function report_units()
    local reporter = get_reporter()
    if not reporter then
        return
    end

    y3.player.with_local(function (local_player)
        if local_player:get_id() ~= reporter:get_id() then
            return
        end

        local move_list = {}
        local stop_list = {}

        for uid, unit in pairs(units) do
            if not IsValid(unit) then
                pathing[uid] = nil
            elseif unit:is_moving() then
                move_list[uid] = unit_pos(unit)
                pathing[uid] = true
            elseif pathing[uid] then
                pathing[uid] = nil
                stop_list[uid] = unit_pos(unit)
            end
        end

        report('move', move_list)
        report('stop', stop_list)
    end)
end

y3.ltimer.loop(REPORT_INTERVAL, report_units)

y3.game:event('单位-寻路开始', function (_, data)
    local unit = data.unit
    local uid = uid_of[unit]
    if not uid or pathing[uid] then
        return
    end
    local reporter = get_reporter()
    if not reporter then
        return
    end

    y3.player.with_local(function (local_player)
        if local_player:get_id() ~= reporter:get_id() then
            return
        end
        pathing[uid] = true
        -- 只作为"开始寻路"的信号，起点由云端用上次结束的位置
        report('start', { uid })
    end)
end)

---设置属性钩子；返回 true 表示已由钩子处理，该属性不再写入 Y3
---@param callback fun(unit: Unit, name: string, value: number): boolean?
function M.set_unit_hook(callback)
    hook = callback
end

-- 调试绘制：圆柱表示位置，线段表示朝向
-- 圆柱的 point 必须用 y3.point(...).handle；坐标直接用单位读数
local DEBUG_DURATION = 60
local DEBUG_REDRAW_INTERVAL = 0.4
local DEBUG_RADIUS = 60
local DEBUG_HEIGHT = 180
local DEBUG_FACE_LENGTH = 150
local DEBUG_COLORS = { '#FF0000', '#00FF00', '#0088FF', '#FFFF00', '#FF00FF', '#00FFFF' }

local debug_show = false

---@type table<integer, { x: number, y: number, face: number }>
local debug_units = {}

---@type table<integer, integer[]>
local debug_shapes = {}

---@param uid integer
local function clear_shapes(uid)
    local shapes = debug_shapes[uid]
    if not shapes then
        return
    end
    for i = 1, #shapes do
        GameAPI.delete_debug_draw(shapes[i])
    end
    debug_shapes[uid] = nil
end

---@param uid integer
---@param x number
---@param y number
---@param face number
---@param color string
local function draw_debug_unit(uid, x, y, face, color)
    clear_shapes(uid)

    local point = y3.point(x, y, 0)
    ---@diagnostic disable-next-line: param-type-mismatch
    local cylinder = GameAPI.debug_draw_cylinder(point.handle, Fix32(DEBUG_RADIUS), Fix32(DEBUG_HEIGHT), Fix32(DEBUG_DURATION), color)

    -- 朝向与坐标轴的换算按引擎角度约定，实机校验
    local rad = math.rad(face)
    local line = GameAPI.debug_draw_polyline(
        Fix32(x), Fix32(y), Fix32(0),
        Fix32(x + math.cos(rad) * DEBUG_FACE_LENGTH),
        Fix32(y + math.sin(rad) * DEBUG_FACE_LENGTH),
        Fix32(0),
        Fix32(DEBUG_DURATION), color)

    debug_shapes[uid] = { cylinder, line }
end

-- 云端只在位置变化时发，客户端自己按间隔重绘维持显示
local function redraw_debug()
    for uid, info in pairs(debug_units) do
        draw_debug_unit(uid, info.x, info.y, info.face or 0, DEBUG_COLORS[uid % #DEBUG_COLORS + 1])
    end
end

---@param data any
local function on_pos_debug(data)
    if not debug_show then
        return
    end
    local list = data and data.units
    if type(list) ~= 'table' then
        return
    end
    for uid, info in pairs(list) do
        debug_units[uid] = info
    end
    redraw_debug()
end

y3.cloud.rpc.register('$Unit.Pos.Debug', on_pos_debug)

---开关"显示服务器单位位置"：打开后云端定期广播带朝向的位置，客户端绘制圆柱 + 朝向线
---@param enable boolean
function M.set_pos_debug(enable)
    debug_show = enable
    if enable then
    else
        for uid in pairs(debug_units) do
            clear_shapes(uid)
        end
        debug_units = {}
        debug_shapes = {}
    end
    y3.cloud.rpc.notify('$Unit.DebugPos', { enable = enable })
end

y3.cloud.unit = M
