--闪电特效（光束）
---@class Beam
---@field handle py.LinkSfx
---@overload fun(py_beam: py.LinkSfx): self
local M = Class "Beam"
M.type = "beam"

---@param py_beam py.LinkSfx
---@return self
function M:__init(py_beam)
    self.handle = py_beam
    return self
end

function M:__del()
    GameAPI.remove_link_sfx(self.handle)
end

---@param py_beam py.LinkSfx
---@return Beam beam
function M.从handle获取(py_beam)
    local beam = New "Beam" (py_beam)
    return beam
end

y3.py_converter.register_py_to_lua("py.LinkSfx", M.从handle获取)
y3.py_converter.register_lua_to_py("py.LinkSfx", function(lua_value)
    return lua_value.handle
end)

---@class Beam.CreateData
---@field key py.SfxKey 特效id
---@field source Unit|Point 目标
---@field target Unit|Point 目标
---@field time? number 存在时间
---@field source_height? number 高度（只在目标是点时生效）
---@field target_height? number 高度（只在目标是点时生效）
---@field source_socket? string 挂接点（只在目标是单位时生效）
---@field target_socket? string 挂接点（只在目标是单位时生效）
---@field immediate? boolean 销毁时，是否有过度

---@class Beam.CreateDataCn
---@field 特效类型 py.SfxKey 特效id
---@field 开始目标 Unit|Point 目标
---@field 结束目标 Unit|Point 目标
---@field 存在时间? number 存在时间
---@field 开始目标高度? number 高度（只在目标是点时生效）
---@field 结束目标高度? number 高度（只在目标是点时生效）
---@field 目标1挂接点? string 挂接点（只在目标是单位时生效）
---@field 目标2挂接点? string 挂接点（只在目标是单位时生效）
---@field 销毁过渡? boolean 销毁时，是否有过度

---@param 参数 Beam.CreateDataCn
---@return Beam
function M.创建(参数)
    ---@type Beam.CreateData
    data = {
        key = 参数.特效类型,
        source = 参数.开始目标,
        target = 参数.结束目标,
        source_height = 参数.开始目标高度,
        target_height = 参数.结束目标高度,
        source_socket = 参数.目标1挂接点,
        target_socket = 参数.目标2挂接点,
        immediate = 参数.销毁过渡,
        time = 参数.存在时间
    }

    调试输出(data)

    ---@type py.LinkSfx
    local link_sfx
    local key           = data.key
    local source        = data.source
    local target        = data.target
    local time          = data.time or -1
    local source_height = data.source_height or 0
    local target_height = data.target_height or 0
    local source_socket = data.source_socket or "origin"
    local target_socket = data.target_socket or "origin"
    local immediate     = data.immediate
    if source.type == "unit" then
        ---@cast source Unit
        if target.type == "point" then
            ---@cast target Point
            link_sfx = GameAPI.create_link_sfx_from_unit_to_point(
                key,
                source.handle,
                source_socket,
                target.handle,
                Fix32(target_height),
                time,
                immediate,
                immediate == nil
            )
        else
            ---@cast target Unit
            link_sfx = GameAPI.create_link_sfx_from_unit_to_unit(
                key,
                source.handle,
                source_socket,
                target.handle,
                target_socket,
                time,
                immediate,
                immediate == nil
            )
        end
    else
        ---@cast source Point
        if target.type == "point" then
            ---@cast target Point
            link_sfx = GameAPI.create_link_sfx_from_point_to_point(
                key,
                source.handle,
                Fix32(source_height),
                target.handle,
                Fix32(target_height),
                time,
                immediate,
                immediate == nil
            )
        else
            ---@cast target Unit
            link_sfx = GameAPI.create_link_sfx_from_point_to_unit(
                key,
                source.handle,
                Fix32(source_height),
                target.handle,
                target_socket,
                time,
                immediate,
                immediate == nil
            )
        end
    end

    local beam = M.从handle获取(link_sfx)
    return beam
end

---链接特效 - 销毁
function M:移除()
    Delete(self)
end

---@param is_show boolean 是否显示
---链接特效 - 显示/隐藏
function M:设置是否可见(is_show)
    GameAPI.enable_link_sfx_show(self.handle, is_show)
end

---@class Beam.LinkData
---@field point_type y3.Const.LinkSfxPointType 起点or终点
---@field target Unit|Point 目标
---@field height? number 高度（只在目标是点时生效）
---@field socket? string 挂接点（只在目标是单位时生效）

---链接特效 - 设置位置
---@param data Beam.LinkData
function M:设置位置(data)
    local target = data.target
    if target.type == "point" then
        ---@cast target Point
        GameAPI.set_link_sfx_point(
            self.handle,
            data.point_type,
            -- TODO 见问题2
            ---@diagnostic disable-next-line: param-type-mismatch
            target.handle,
            data.height or 0
        )
    end
    if target.type == "unit" then
        ---@cast target Unit
        GameAPI.set_link_sfx_unit_socket(
            self.handle,
            data.point_type,
            target.handle,
            data.socket or "origin"
        )
    end
end

return M
