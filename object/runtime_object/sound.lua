--声音
---@class Sound
---@overload fun(py_sound: py.SoundEntity):self
local M = Class 'Sound'

---@param py_sound py.SoundEntity
function M:__init(py_sound)
    self.handle = py_sound
end

---@param py_sound py.SoundEntity
---@return Sound
function M.get_by_handle(py_sound)
    local sound = New 'Sound' (py_sound)
    return sound
end

---@class Sound.PlayOptions
---@field loop? boolean # 是否循环
---@field fade_in? number # 渐入时间
---@field fade_out? number # 渐出时间

---播放声音
---@param player Player 玩家
---@param sound py.AudioKey 声音
---@param options Sound.PlayOptions? # 播放选项
---@return Sound?
function M.play(player, sound, options)
    local py_sound = GameAPI.play_sound_for_player(
        player.handle,
        sound,
        options and options.loop or false,
        options and options.fade_in or 0.0,
        options and options.fade_out or 0.0
    )
    if not py_sound then
        return nil
    end
    return M.get_by_handle(py_sound)
end

---@class Sound.Play3DOptions: Sound.PlayOptions
---@field height? number # 高度
---@field ensure? boolean # 是否确保播放

---播放3D声音
---@param player Player 玩家
---@param sound py.AudioKey 声音
---@param point Point 目标点
---@param options Sound.Play3DOptions? # 播放选项
---@return Sound?
function M.play_3d(player, sound, point, options)
    local py_sound = GameAPI.play_3d_sound_for_player(
        player.handle,
        sound,
        -- TODO 见问题2
        ---@diagnostic disable-next-line: param-type-mismatch
        point.handle,
        options and options.height or 0.0,
        options and options.fade_in or 0.0,
        options and options.fade_out or 0.0,
        options and options.ensure or false,
        options and options.loop or false
    )
    if not py_sound then
        return nil
    end
    return M.get_by_handle(py_sound)
end

---@class Sound.PlayUnitOptions: Sound.PlayOptions
---@field ensure? boolean # 是否确保播放
---@field offset_x? number # X轴偏移
---@field offset_y? number # Y轴偏移
---@field offset_z? number # Z轴偏移

---跟随单位播放声音
---@param player Player 玩家
---@param sound py.AudioKey 声音
---@param unit Unit 跟随的单位
---@param options Sound.PlayUnitOptions? # 播放选项
---@return Sound?
function M.play_with_object(player, sound, unit, options)
    local py_sound = GameAPI.follow_object_play_3d_sound_for_player(
        player.handle,
        sound,
        unit.handle,
        options and options.fade_in or 0.0,
        options and options.fade_out or 0.0,
        options and options.ensure or false,
        options and options.loop or false,
        options and options.offset_x or 0.0,
        options and options.offset_y or 0.0,
        options and options.offset_z or 0.0
    )
    if not py_sound then
        return nil
    end
    return M.get_by_handle(py_sound)
end

---停止播放声音
---@param player Player 玩家
---@param is_immediately? boolean 是否立即停止
function M:stop(player, is_immediately)
    GameAPI.stop_sound(player.handle, self.handle, not is_immediately or false)
end

-- 设置音量
---@param player Player 玩家
---@param volume integer 音量(0-100)
function M:set_volume(player, volume)
    GameAPI.set_sound_volume(player.handle, self.handle, volume)
end

return M
