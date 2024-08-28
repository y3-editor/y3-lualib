---@class UI
---@field player Player
---@field handle string
---@overload fun(player: Player, ui_name: string): self
local M = Class 'UI'

M.type = 'ui'

---@param player Player
---@param handle string
---@return self
function M:__init(player, handle)
    self.player = player
    self.handle = handle
    self.name   = GameAPI.get_ui_comp_name(player.handle, handle)
    return self
end

function M:__del()
    local parent_ui = self:get_parent()
    if parent_ui ~= nil then
        parent_ui:remove_get_child_cache(self.name)
    end
    local player = self.player
    if player._ui_cache then
        player._ui_cache[self.handle] = nil
    end
    GameAPI.del_ui_comp(player.handle, self.handle)
end

function M:__tostring()
    return string.format('{UI|%s|%s} @ %s'
        , self.name
        , self.handle
        , self.player
    )
end

function M:__eq(other)
    return IsInstanceOf(other, 'UI')
        and self.handle == other.handle
end

---@private
M.map = {}

M.comp_id = y3.proxy.new({}, {
    cache = true,
    anyGetter = function (self, raw, key, config, custom)
        if not GameAPI.get_prefab_ins_id_by_name then
            return key
        end
        local id = GameAPI.get_prefab_ins_id_by_name(key)
        if id == '' or id == nil then
            return key
        else
            return id
        end
    end
})

---@class Player
---@field package _ui_cache table<string, UI>

---通过py层的界面实例获取lua层的界面实例
---@param player Player
---@param handle string
---@return UI
function M.get_by_handle(player, handle)
    if not player._ui_cache then
        player._ui_cache = setmetatable({}, {
            __mode = 'v',
            __index = function (t, k)
                if not k then
                    return nil
                end
                local ui = New 'UI' (player, k)
                t[k] = ui
                return ui
            end
        })
    end
    local ui = player._ui_cache[handle]
    return ui
end

--创建界面控件
---@param player Player 玩家
---@param parent_ui UI ui控件
---@param comp_type y3.Const.UIComponentType ui控件
---@return UI 返回在lua层初始化后的lua层技能实例
function M.create_ui(player, parent_ui, comp_type)
    local py_ui = GameAPI.create_ui_comp(player.handle, parent_ui.handle, y3.const.UIComponentType[comp_type] or 7)
    return y3.ui.get_by_handle(player, py_ui)
end

---@param player Player 玩家
---@param ui_path string ui对象路径，自画板一级开始，父节点与子节点使用“.”链接
---@return UI
function M.get_ui(player, ui_path)
    local py_ui = GameAPI.get_comp_by_absolute_path(player.handle, ui_path)
    if not py_ui then
        error(string.format('UI “%s” 不存在。注意，在界面编辑器中放置的UI需要在游戏初始化事件之后才能获取。', ui_path))
    end
    return y3.ui.get_by_handle(player, py_ui)
end

---@param comp_type y3.Const.UIComponentType ui控件
---@return UI 返回在lua层初始化后的lua层技能实例
function M:create_child(comp_type)
    return M.create_ui(self.player, self, comp_type)
end

--创建界面事件
---@param event y3.Const.UIEvent 界面事件类型
---@param name string 事件名
---@param data? Serialization.SupportTypes 自定义数据，在事件中通过 `data` 字段获取
---@return string
function M:add_event(event, name, data)
    return GameAPI.create_ui_comp_event_ex_ex(self.handle, y3.const.UIEventMap[event] or event, name, y3.dump.encode(data))
end

--创建本地界面事件  
--触发事件后立即调用回调函数，不会与其他玩家同步。
--
-->警告：回调函数是在本地玩家的客户端上执行的，注意避免产生不同步的问题。
---@param event y3.Const.UIEvent # 界面事件类型
---@param callback fun(local_player: Player) # 回调函数
function M:add_local_event(event, callback)
    assert(y3.const.UIEventMap[event], '无效的事件类型')
    GameAPI.bind_local_listener(self.handle, y3.const.UIEventMap[event], function ()
        y3.player.with_local(function (local_player)
            xpcall(callback, log.error, local_player)
        end)
    end)
end

-- 设置相对父级位置. 目前不建议使用, 引擎层存在 bug, 建议手动计算位置赋值.
---@param direction y3.Const.UIRelativeParentPosType
---@param offset number # 相对父级位置
---@return UI
function M:set_relative_parent_pos(direction, offset)
    GameAPI.set_ui_comp_adapt_option(self.player.handle, self.handle, y3.const.UIRelativeParentPosType[direction], offset)
    return self
end

-- 对玩家触发UI事件
---@param event_name string
function M:send_event(event_name)
    GameAPI.trigger_ui_event(self.player.handle, self.handle, event_name)
end

--设置UI控件显隐
---@param visible boolean 显示/隐藏
---@return self
function M:set_visible(visible)
    GameAPI.set_ui_comp_visible(self.player.handle, visible, self.handle)
    return self
end

---@private
M._image_version = 0

---设置图片
---@param img py.Texture | string 图片id
---@return self
function M:set_image(img)
    self._image_version = self._image_version + 1
    ---@diagnostic disable-next-line: param-type-mismatch
    GameAPI.set_ui_comp_image_with_icon(self.player.handle, self.handle, img)
    return self
end

---设置来自网络的图片
---@param url string 图片url
---@param aid? string 图片的唯一id，如果不指定会从url中提取。如果本地已经有该aid的图片，会直接使用本地图片。必须是操作系统可用的文件名。
---@return self
function M:set_image_url(url, aid)
    local version = self._image_version + 1
    self._image_version = version
    if not aid then
        aid = (url:match('.+/(.+)$') or ''):gsub('%.[^%.]+$', '') or ''
    end
    y3.game.download_platform_icon(url, aid, function (real_path)
        if version ~= self._image_version then
            return
        end
        -- 必须要延迟一小会儿，否则同时设置多张
        -- 图片时会出现几张图片设置失败的情况
        y3.ltimer.wait(0.1, function ()
            if version ~= self._image_version then
                return
            end
            self:set_image(real_path)
        end)
    end)
    return self
end

--设置图片颜色
---@param r number 红色
---@param g number 绿色
---@param b number 蓝色
---@param a number 透明度
---@return self
function M:set_image_color(r, g, b, a)
    GameAPI.set_ui_image_color(self.player.handle, self.handle, r, g, b, a)
    return self
end

--设置图片颜色(hex)
---@param color string hex
---@param a number 透明度
---@return self
function M:set_image_color_hex(color, a)
    GameAPI.set_ui_image_color_hex(self.player.handle, self.handle, color, a)
    return self
end

--设置文本
---@param str string 文本
---@return self
function M:set_text(str)
    GameAPI.set_ui_comp_text(self.player.handle, self.handle, str)
    return self
end


--设置控件透明度
---@param value number 透明度
---@return self
function M:set_alpha(value)
    GameAPI.set_ui_comp_opacity(self.player.handle, self.handle, value)
    return self
end

--播放UI透明度动画
---@param start_alpha number # 开始alpha
---@param end_alpha number # 结束alpha
---@param duration number # 持续时间
---@param ease_type? y3.Const.EaseType # 曲线类型
---@return self
function M:set_anim_opacity(start_alpha, end_alpha, duration, ease_type)
    GameAPI.set_ui_comp_anim_opacity(self.player.handle, self.handle, start_alpha, end_alpha, duration, ease_type)
    return self
end

--设置控件是否可拖动
---@param isdrag boolean 是否可拖动
---@return self
function M:set_is_draggable(isdrag)
    GameAPI.set_ui_comp_drag(self.player.handle, self.handle, isdrag)
    return self
end


--设置控件是否拦截操作
---@param intercepts boolean 是否拦截操作
---@return self
function M:set_intercepts_operations(intercepts)
    GameAPI.set_ui_comp_swallow(self.player.handle, self.handle, intercepts)
    return self
end


--设置控件深度
---@param deep integer 深度
---@return self
function M:set_z_order(deep)
    GameAPI.set_ui_comp_z_order(self.player.handle, self.handle, deep)
    return self
end


--设置进度条最大值
---@param progress number 进度条最大值
---@return self
function M:set_max_progress_bar_value(progress)
    GameAPI.set_progress_bar_max_value(self.player.handle, self.handle, progress)
    return self
end


--设置进度条当前值
---@param progress number 进度条当前值
---@param time number? 渐变时间
---@return self
function M:set_current_progress_bar_value(progress, time)
    GameAPI.set_progress_bar_current_value(self.player.handle, self.handle, progress, time or 0)
    return self
end


--启用/禁用按钮
---@param enable boolean 启用/禁用按钮
---@return self
function M:set_button_enable(enable)
    GameAPI.set_ui_comp_enable(self.player.handle, self.handle, enable)
    return self
end


--设置控件尺寸
---@param width number 宽度
---@param height number 高度
---@return self
function M:set_ui_size(width, height)
    GameAPI.set_ui_comp_size(self.player.handle, self.handle, width, height)
    return self
end

--设置控件9宫格
---@param x_left integer # x
---@param x_right integer # y
---@param y_top integer # width
---@param y_bottom integer # height
---@return self
function M:set_ui_9(x_left, x_right, y_top, y_bottom)
    GameAPI.set_ui_comp_cap_insets(self.player.handle, self.handle, x_left, x_right, y_top, y_bottom)
    return self
end

--设置控件9宫格启用
---@param switch boolean # 启用/禁用
---@return self
function M:set_ui_9_enable(switch)
    GameAPI.set_ui_comp_scale_9_enable(self.player.handle, self.handle, switch)
    return self
end

--设置文本字体大小
---@param size integer 字体大小
---@return self
function M:set_font_size(size)
    GameAPI.set_ui_comp_font_size(self.player.handle, self.handle, size)
    return self
end

--让输入框获取焦点
---@return self
function M:set_input_field_focus()
    GameAPI.set_input_field_focus(self.player.handle, self.handle)
    return self
end

--设置列表视图百分比
---@param percent number # 百分比
function M:set_list_view_percent(percent)
    GameAPI.set_list_view_percent(self.player.handle, self.handle, percent)
end

--绑定技能对象到控件
---@param skill? Ability 技能对象
---@return self
function M:set_skill_on_ui_comp(skill)
    local handle = skill and skill.handle or nil
    ---@diagnostic disable-next-line: param-type-mismatch
    GameAPI.set_skill_on_ui_comp(self.player.handle, handle, self.handle)
    return self
end

--绑定技能
---@param ability? Ability 技能对象
---@return self
function M:bind_ability(ability)
    return self:set_skill_on_ui_comp(ability)
end

--绑定单位到魔法效果显示栏组件
---@param unit Unit 单位
---@return self
function M:set_buff_on_ui(unit)
    GameAPI.set_buff_on_ui_comp(self.player.handle, unit.handle, self.handle)
    return self
end


-- 绑定物品对象到物品组件
---@param item Item 物品对象
---@return self
function M:set_item_on_ui(item)
    GameAPI.set_item_on_ui_comp(self.player.handle, item.handle, self.handle)
    return self
end

--设置默认游戏界面的开关
---@param player Player 玩家
---@param visible boolean 游戏界面的开关
function M.set_prefab_ui_visible(player,visible)
    GameAPI.set_prefab_ui_visible(player.handle, visible)
end


--设置模型控件的模型
---@param modelid py.ModelKey 模型id
---@return self
function M:set_ui_model_id(modelid)
    ---@diagnostic disable-next-line: param-type-mismatch
    GameAPI.set_ui_model_id(self.player.handle, self.handle, modelid)
    return self
end

--设置UI模型控件的单位
---@param model_unit Unit 单位
---@param clone_effect? boolean # 继承特效
---@param clone_attach? boolean # 继承挂接模型
---@param clone_material? boolean # 继承材质变化
function M:set_ui_model_unit(model_unit, clone_effect, clone_attach, clone_material)
    GameAPI.set_ui_model_unit(self.player.handle, self.handle, model_unit.handle, clone_effect, clone_attach, clone_material)
end

--改变小地图图片
---@param player Player 玩家
---@param img py.Texture 图片id
function M.change_mini_map_img(player,img)
    GameAPI.change_mini_map_img_with_icon(player.handle, img)
end


--设置物品组件绑定单位
---@param unit Unit
---@param field y3.Const.SlotType 背包槽位类型名
---@param index integer 格子位置
---@return self
function M:set_ui_unit_slot(unit, field, index)
    GameAPI.set_ui_comp_unit_slot(self.player.handle, self.handle, unit.handle, field, index)
    return self
end

--设置按钮快捷键
---@param key integer 快捷键
---@return self
function M:set_button_shortcut(key)
    GameAPI.set_btn_short_cut(self.player.handle, self.handle, key)
    return self
end

--设置按钮组合快捷键
---@param key integer 辅助按键
---@return self
function M:set_btn_meta_key(key)
    GameAPI.set_btn_func_short_cut(self.player.handle, self.handle, key)
    return self
end

--设置按钮不同状态下的文本
---@param status y3.Const.UIButtonStatus 状态
---@param text string 文本
---@return self
function M:set_btn_status_string(status, text)
    GameAPI.set_ui_btn_status_string(self.player.handle, self.handle, status, text)
    return self
end

--设置按钮不同状态下的图片
---@param status y3.Const.UIButtonStatus 状态
---@param img integer 图片id
---@return self
function M:set_btn_status_image(status, img)
    GameAPI.set_ui_btn_status_image(self.player.handle, self.handle, status, img)
    return self
end

--设置智能施法快捷键
---@param key integer 快捷键
---@return self
function M:set_skill_btn_smart_cast_key(key)
    GameAPI.set_skill_btn_smart_cast_key(self.player.handle, self.handle, key)
    return self
end


--设置智能施法组合快捷键
---@param key integer 辅助按键
---@return self
function M:set_skill_btn_func_meta_key(key)
    GameAPI.set_skill_btn_func_smart_cast_key(self.player.handle, self.handle, key)
    return self
end


--播放/停止技能按钮激活动效
---@param isopen boolean 播放/停止技能按钮激活动效
---@return self
function M:set_skill_btn_action_effect(isopen)
    GameAPI.set_skill_btn_action_effect(self.player.handle, self.handle, isopen)
    return self
end


--设置文本颜色
---@param r number 红色
---@param g number 绿色
---@param b number 蓝色
---@param a number 透明度
---@return self
function M:set_text_color(r,g,b,a)
    GameAPI.set_ui_comp_font_color(self.player.handle, self.handle, r, g, b, a)
    return self
end

--设置文本颜色(HEX)
---@param color string # hex
---@param a number 透明度
---@return self
function M:set_text_color_hex(color, a)
    GameAPI.set_ui_comp_font_color_hex(self.player.handle, self.handle, color, a)
    return self
end


--设置模型控件的镜头视野
---@param fov number 视野范围
---@return self
function M:change_showroom_fov(fov)
    GameAPI.change_showroom_fov(self.player.handle, self.handle, fov)
    return self
end


--设置模型控件的镜头坐标
---@param x number x轴
---@param y number y轴
---@param z number z轴
---@return self
function M:change_showroom_cposition(x,y,z)
    GameAPI.change_showroom_cposition(self.player.handle, self.handle, x, y, z)
    return self
end


--设置模型控件的镜头旋转
---@param x number x轴
---@param y number y轴
---@param z number z轴
---@return self
function M:change_showroom_crotation(x,y,z)
    GameAPI.change_showroom_crotation(self.player.handle, self.handle, x, y, z)
    return self
end


--系统消息提示
---@param player Player 玩家
---@param msg string 消息
---@param time number 持续时间
---@param isSupportLanguage? boolean 是否支持语言环境
function M.display_message(player, msg, time, isSupportLanguage)
    GameAPI.show_tips_text(player.handle, msg, Fix32(time), isSupportLanguage)
end

--设置界面模型控件背景色
---@param r number 红色
---@param g number 绿色
---@param b number 蓝色
---@param a number 透明度
---@return self
function M:set_show_room_background_color(r, g, b, a)
    GameAPI.set_show_room_background_color(self.player.handle, self.handle, r, g, b, a)
    return self
end

--设置控件相对旋转
---@param rot number 角度
---@return self
function M:set_widget_relative_rotation(rot)
    GameAPI.set_ui_comp_rotation(self.player.handle,self.handle, rot)
    return self
end


--设置控件绝对坐标
--> 同 `UI:set_absolute_pos`
---@param x number x轴
---@param y number y轴
---@return self
function M:set_widget_absolute_coordinates(x,y)
    GameAPI.set_ui_comp_world_pos(self.player.handle,self.handle, x, y)
    return self
end


--设置控件绝对旋转
---@param rot number 角度
---@return self
function M:set_widget_absolute_rotation(rot)
    GameAPI.set_ui_comp_world_rotation(self.player.handle,self.handle, rot)
    return self
end


--设置控件绝对缩放
---@param x number x轴
---@param y number y轴
---@return self
function M:set_widget_absolute_scale(x, y)
    GameAPI.set_ui_comp_world_scale(self.player.handle,self.handle, x, y)
    return self
end


--设置控件相对缩放
---@param x number x轴
---@param y number y轴
---@return self
function M:set_widget_relative_scale(x, y)
    GameAPI.set_ui_comp_scale(self.player.handle,self.handle, x, y)
    return self
end


--设置小地图显示模式
---@param player Player 玩家
---@param type integer 小地图显示模式
function M.change_minimap_display_mode(player,type)
    GameAPI.change_mini_map_color_type(player.handle,type)
end


--设置滑动条的进度
---@param percent number 滑动条的进度
---@return self
function M:set_slider_value(percent)
    GameAPI.set_slider_cur_percent(self.player.handle,self.handle, percent)
    return self
end

--解绑控件
---@return self
function M:unbind_widget()
    GameAPI.unbind_ui_comp(self.player.handle,self.handle)
    return self
end

--遍历某个界面控件的子节点
--> 名字太长了，改用 `get_childs` 吧
---@return UI[]
function M:get_ui_comp_children()
    return self:get_childs()
end

--遍历某个界面控件的子节点
---@return UI[]
function M:get_childs()
    local py_list = GameAPI.get_ui_comp_children(self.player.handle, self.handle)
    local uis = y3.helper.unpack_list(py_list, function (py_object)
        return y3.ui.get_by_handle(self.player, py_object)
    end)
    return uis
end

--播放时间轴动画
---@param player Player 玩家
---@param anim string | y3.Const.UIAnimKey 动画
---@param speed? number 播放速度
---@param mode? boolean | '保持' | '常规' | '往复' | '循环'  播放模式
---@param start? integer 开始帧
---@param finish? integer 结束帧
function M.play_timeline_animation(player, anim, speed, mode, start, finish)
    local playMode
    if mode == true or mode == '循环' then
        playMode = 3
    elseif mode == '保持' then
        playMode = 0
    elseif mode == '常规' then
        playMode = 1
    elseif mode == '往复' then
        playMode = 2
    end
    -- TODO 见问题7
    ---@diagnostic disable-next-line: redundant-parameter
    GameAPI.play_ui_comp_anim_new(
        player.handle,
    ---@diagnostic disable-next-line: param-type-mismatch
        y3.const.UIAnimKey[anim] or anim,
        start,
        finish,
        speed,
        playMode
    )
end

--播放动画移动
---@param start_x number # 开始x
---@param start_y number # 开始y
---@param end_x number # 结束x
---@param end_y number # 结束y
---@param duration number # 持续时间
---@param ease_type? integer # 曲线类型
---@return UI
function M:set_anim_pos(start_x, start_y, end_x, end_y, duration, ease_type)
    GameAPI.set_ui_comp_anim_pos(self.player.handle, self.handle, start_x, start_y, end_x, end_y, duration, ease_type)
    return self
end

--播放UI缩放动画
---@param start_x number # 开始x
---@param start_y number # 开始y
---@param end_x number # 结束x
---@param end_y number # 结束y
---@param duration number # 持续时间
---@param ease_type? integer # 曲线类型
---@return self
function M:set_anim_scale(start_x, start_y, end_x, end_y, duration, ease_type)
    GameAPI.set_ui_comp_anim_scale(self.player.handle, self.handle, start_x, start_y, end_x, end_y, duration, ease_type)
    return self
end

--设置模型控件观察点
---@param x number x轴
---@param y number y轴
---@param z number z轴
---@return self
function M:set_ui_model_focus_pos(x, y, z)
    GameAPI.set_ui_model_focus_pos(self.player.handle, self.handle, x, y, z)
    return self
end

--绑定单位属性到玩家界面控件的属性
--> 请改用 `UI:bind_unit_attr`
---@deprecated
---@param uiAttr string 界面控件属性
---@param attr string 单位属性
---@param accuracy integer 小数精度
---@return self
function M:bind_player_attribute(uiAttr, attr, accuracy)
    GameAPI.set_ui_comp_bind_attr(self.player.handle, self.handle, uiAttr, attr, accuracy)
    return self
end

--绑定单位属性到玩家界面控件的属性
---@param uiAttr y3.Const.UIAttr 界面控件属性
---@param attr_name y3.Const.UnitAttr 单位属性
---@param accuracy? integer 小数精度，默认为0
---@return self
function M:bind_unit_attr(uiAttr, attr_name, accuracy)
    GameAPI.set_ui_comp_bind_attr(self.player.handle, self.handle, y3.const.UIAttr[uiAttr], y3.const.UnitAttr[attr_name] or attr_name, accuracy or 0)
    return self
end

--绑定玩家属性到玩家界面控件的属性
---@param uiAttr string 界面控件属性
---@param player Player # 玩家
---@param attr_or_var string # 玩家属性key
---@param accuracy integer 小数精度
---@return self
function M:bind_player_prop(uiAttr, player, attr_or_var, accuracy)
    GameAPI.set_ui_comp_bind_player_prop(self.player.handle, self.handle, uiAttr, player.handle, attr_or_var, accuracy)
    return self
end

--绑定全局变量到玩家界面控件的属性
---@param uiAttr y3.Const.UIAttr | string 界面控件属性
---@param globalVar string 全局属性
---@param accuracy? integer 小数精度
---@return self
function M:bind_global_variable(uiAttr, globalVar, accuracy)
    GameAPI.set_ui_comp_bind_var(self.player.handle, self.handle, y3.const.UIAttr[uiAttr] or uiAttr, globalVar, accuracy or 0)
    return self
end

--解绑界面控件属性绑定
---@param uiAttr string 界面控件属性
---@return self
function M:unbind(uiAttr)
    GameAPI.ui_comp_unbind(self.player.handle, self.handle, uiAttr)
    return self
end

--界面控件属性绑定指定单位
---@param unit Unit 单位
---@return self
function M:bind_unit(unit)
    GameAPI.ui_comp_bind_unit(self.player.handle, self.handle, unit.handle)
    return self
end

--设置禁用图片(图片类型)
---@param img integer 图片id
---@return self
function M:set_disable_image_type(img)
    GameAPI.set_ui_comp_disabled_image(self.player.handle, self.handle, img)
    return self
end

--设置悬浮图片(图片类型)
---@param img integer 图片id
---@return self
function M:set_hover_image_type(img)
    GameAPI.set_ui_comp_suspend_image(self.player.handle, self.handle, img)
    return self
end

--设置按下图片(图片类型)
---@param img integer 图片id
---@return self
function M:set_press_image_type(img)
    GameAPI.set_ui_comp_press_image(self.player.handle, self.handle, img)
    return self
end

--设置文本的对齐方式
---@param h? y3.Const.UIHAlignmentType # 横向对齐方式
---@param v? y3.Const.UIVAlignmentType # 纵向对齐方式
---@return self
function M:set_text_alignment(h, v)
    if h then
        GameAPI.set_ui_comp_align(self.player.handle, self.handle, y3.const.UIHAlignmentType[h])
    end
    if v then
        GameAPI.set_ui_comp_align(self.player.handle, self.handle, y3.const.UIVAlignmentType[v])
    end
    return self
end

--开启绘制单位路径线
---@param player Player 玩家
---@param unit Unit 单位
function M.enable_drawing_unit_path(player, unit)
    GameAPI.enable_unit_path_drawing(player.handle, unit.handle)
end

--关闭绘制单位路径线
---@param player Player 玩家
---@param unit Unit 单位
function M.disable_drawing_unit_path(player, unit)
    GameAPI.disable_unit_path_drawing(player.handle, unit.handle)
end

--删除界面控件
function M:remove()
    Delete(self)
end

-- 是否被删除
function M:is_removed()
    return not GameAPI.ui_comp_is_exist(self.handle)
end

--绑定技能冷却时间到玩家界面控件的属性
---@param uiAttr string 界面控件属性
---@param skill Ability 技能
---@return self
function M:bind_ability_cd(uiAttr, skill)
    GameAPI.set_ui_comp_bind_ability_cd(self.player.handle, self.handle, uiAttr, skill.handle)
    return self
end

--绑定魔法效果剩余时间到玩家界面控件的属性
---@param uiAttr string 界面控件属性
---@param buff Buff 魔法效果
---@return self
function M:bind_buff_time(uiAttr, buff)
    GameAPI.set_ui_comp_bind_modifier_cd(self.player.handle, self.handle, uiAttr, buff.handle)
    return self
end

--开启/禁用发送聊天功能
---@param enable boolean 开启/禁用发送聊天功能
---@return self
function M:enable_chat(enable)
    GameAPI.set_chat_send_enabled(self.player.handle, self.handle, enable)
    return self
end

--显示/隐藏聊天框
---@param enable boolean 显示/隐藏聊天框
---@param player Player 目标玩家
---@return self
function M:show_chat(player, enable)
    GameAPI.set_player_chat_show(self.player.handle, self.handle, player.handle,enable)
    return self
end

--清空聊天信息
---@return self
function M:clear_chat()
    GameAPI.clear_player_chat_panel(self.player.handle, self.handle)
    return self
end

--发送私聊信息
---@param player Player 玩家
---@param msg string 信息
---@return self
function M:send_chat(player, msg)
    GameAPI.send_chat_to_role(self.player.handle, self.handle, player.handle, msg)
    return self
end

--获取复选框当前选中状态
---@return boolean # 当前选中状态
function M:get_checkbox_selected()
    return GameAPI.get_checkbox_selected(self.player.handle, self.handle)
end

--创建悬浮文字
--> 请改用 `UI.create_floating_text2`
---@deprecated
---@param point Point 点
---@param text_type y3.Const.HarmTextType 跳字类型
---@param str string 文字
---@param player_group? PlayerGroup 玩家组
---@param jump_word_track? integer 跳字轨迹类型
function M.create_floating_text(point, text_type, str, player_group, jump_word_track)
    -- TODO 见问题2
    ---@diagnostic disable-next-line: param-type-mismatch
    GameAPI.create_harm_text_ex(point.handle, y3.const.HarmTextType[text_type] or text_type, str, (player_group or y3.player_group.get_all_players()).handle, jump_word_track or 0)
end

--创建悬浮文字
---@param point Point 点
---@param text_type y3.Const.FloatTextType | string | integer 跳字类型
---@param str string 文字
---@param jump_word_track? y3.Const.FloatTextJumpType 跳字轨迹类型，如果不传会使用随机轨迹
---@param player_group? PlayerGroup 可见的玩家组。传入 `nil` 表示所有玩家都可见
function M.create_floating_text2(point, text_type, str, jump_word_track, player_group)
    GameAPI.create_harm_text_ex(
        -- TODO 见问题2
        ---@diagnostic disable-next-line: param-type-mismatch
        point.handle,
        ---@diagnostic disable-next-line: param-type-mismatch
        y3.const.FloatTextType[text_type] or text_type,
        str,
        (player_group or y3.player_group.get_all_players()).handle,
        ---@diagnostic disable-next-line: param-type-mismatch
        y3.const.FloatTextJumpType[jump_word_track] or jump_word_track or 0
    )
end

--设置窗口类型
---@param player Player 玩家
---@param window_mode Game.WindowMode 窗口类型
function M.set_window_mode(player, window_mode)
    GameAPI.set_window_type(player.handle, window_mode)
end

--设置画质
---@param player Player 玩家
---@param quality string 画质
function M.set_graphics_quality(player, quality)
    GameAPI.set_image_quality(player.handle, quality)
end

--屏幕分辨率
---@param player Player 玩家
---@param x number x轴
---@param y number y轴
function M.set_screen_resolution(player, x, y)
    GameAPI.set_screen_resolution(player.handle, x, y)
end

--获取本地控件相对坐标的X
---@return number x x相对坐标
function M:get_relative_x()
    return y3.helper.tonumber(GameAPI.get_ui_comp_pos_x(self.handle)) or 0.0
end

--获取本地控件相对坐标的Y
---@return number y y坐标
function M:get_relative_y()
    return y3.helper.tonumber(GameAPI.get_ui_comp_pos_y(self.handle)) or 0.0
end

--获取本地控件绝对坐标的X
---@return number x x绝对坐标
function M:get_absolute_x()
    return y3.helper.tonumber(GameAPI.get_ui_comp_world_pos_x(self.handle)) or 0.0
end

--获取本地控件绝对坐标的Y
---@return number y y绝对坐标
function M:get_absolute_y()
    return y3.helper.tonumber(GameAPI.get_ui_comp_world_pos_y(self.handle)) or 0.0
end

--获取本地控件相对旋转
---@return number rot 相对旋转
function M:get_relative_rotation()
    return y3.helper.tonumber(GameAPI.get_ui_comp_rotation(self.handle)) or 0.0
end

--获取本地控件绝对旋转
---@return number rot 绝对旋转
function M:get_absolute_rotation()
    return y3.helper.tonumber(GameAPI.get_ui_comp_world_rotation(self.handle)) or 0.0
end

--获取本地控件相对缩放的X
---@return number x x相对缩放
function M:get_relative_scale_x()
    return y3.helper.tonumber(GameAPI.get_ui_comp_scale_x(self.handle)) or 0.0
end

--获取本地控件相对缩放的Y
---@return number y y绝对缩放
function M:get_relative_scale_y()
    return y3.helper.tonumber(GameAPI.get_ui_comp_scale_y(self.handle)) or 0.0
end

--获取本地控件绝对缩放的X
---@return number x x绝对缩放
function M:get_absolute_scale_x()
    return y3.helper.tonumber(GameAPI.get_ui_comp_world_scale_x(self.handle)) or 0.0
end

--获取本地控件绝对缩放的Y
---@return number y y绝对缩放
function M:get_absolute_scale_y()
    return y3.helper.tonumber(GameAPI.get_ui_comp_world_scale_y(self.handle)) or 0.0
end

--设置动画旋转
---@param start_rotation number # 开始旋转
---@param end_rotation number # 结束旋转
---@param duration number # 持续时间
---@param ease_type? integer # 曲线类型
function M:set_anim_rotate(start_rotation, end_rotation, duration, ease_type)
    GameAPI.set_ui_comp_anim_rotate(self.player.handle, self.handle, start_rotation, end_rotation, duration, ease_type)
end

--界面控件转化为字符串
---@return string str 字符串
function M:to_string()
    return GlobalAPI.comp_to_str(self.handle)
end

--获取滑动条当前值
---@return number slider_value 滑动条当前值
function M:get_slider_current_value()
    return y3.helper.tonumber(GameAPI.get_slider_cur_percent(self.handle)) or 0.0
end

--获得界面控件名
---@return string  uiname 控件名
function M:get_name()
    return GameAPI.get_ui_comp_name(self.player.handle, self.handle)
end

--获取指定命名的子控件
---@param name string
---@return UI? ui_comp ui控件
function M:get_child(name)
    local py_ui
    if not y3.config.cache.ui then
        py_ui = GameAPI.get_comp_by_path(self.player.handle, self.handle, name)
    else
        if not self._get_child_py_ui_cache then
            ---@private
            self._get_child_py_ui_cache = setmetatable({}, {
                __index = function(t, k)
                    local py_ui_ = GameAPI.get_comp_by_path(self.player.handle, self.handle, k)
                    t[k] = py_ui_
                    return py_ui_
                end
            })
        end
        py_ui = self._get_child_py_ui_cache[name]
    end
    if not py_ui or py_ui == '' then
        return nil
    end
    return y3.ui.get_by_handle(self.player, py_ui)
end

---@package
function M:remove_get_child_cache(name)
    if self._get_child_py_ui_cache then
        self._get_child_py_ui_cache[name] = nil
    end
end

--获得控件宽度
---@return number width 控件宽度
function M:get_width()
    return GameAPI.get_ui_comp_width(self.handle)
end

--获得控件高度
---@return number height 控件高度
function M:get_height()
    return GameAPI.get_ui_comp_height(self.handle)
end

--获得控件真实宽度
--> 注意：该结果是不同步的
---@return number width 控件真实宽度
function M:get_real_width()
    if self.player:get_state() ~= 1 then
        return 0
    end
    local r = GameAPI.get_role_ui_comp_real_width(self.player.handle, self.handle)
    if type(r) == 'number' then
        return r
    else
        ---@cast r py.Fixed
        return y3.helper.tonumber(r) or 0.0
    end
end

--获得控件真实高度
--> 注意：该结果是不同步的
---@return number height 控件真实高度
function M:get_real_height()
    if self.player:get_state() ~= 1 then
        return 0
    end
    local r = GameAPI.get_role_ui_comp_real_height(self.player.handle, self.handle)
    if type(r) == 'number' then
        return r
    else
        ---@cast r py.Fixed
        return y3.helper.tonumber(r) or 0.0
    end
end

--获得界面控件的父控件
---@return UI? ui_comp ui控件
function M:get_parent()
    local py_ui = GameAPI.get_ui_comp_parent(self.player.handle, self.handle)
    if not py_ui then
        return nil
    end
    return y3.ui.get_by_handle(self.player, py_ui)
end

--获得玩家输入框文本内容
---@return string msg 文本内容
function M:get_input_field_content()
    return GameAPI.get_input_field_content(self.player.handle, self.handle)
end

--获得控件可见性
---@return boolean ui_visible 控件可见性
function M:is_visible()
    return GameAPI.get_ui_comp_visible(self.player.handle, self.handle)
end

---设置控件相对坐标
---@param x number x轴
---@param y number y轴
---@return self
function M:set_pos(x, y)
    GameAPI.set_ui_comp_pos_no_trans(self.player.handle, self.handle, x, y)
    return self
end

---设置控件绝对坐标
---@param x number x轴
---@param y number y轴
---@return self
function M:set_absolute_pos(x, y)
    GameAPI.set_ui_comp_world_pos(self.player.handle, self.handle, x, y)
    return self
end

---设置界面控件的锚点
---@param x number x轴
---@param y number y轴
---@return self
function M:set_anchor(x, y)
    GameAPI.set_ui_comp_anchor(self.player.handle, self.handle, x, y)
    return self
end

---设置聊天频道
---@param switch boolean 开关
---@return self
function M:set_nearby_micro_switch(switch)
    GameAPI.set_ui_comp_chat_channel(self.player.handle, self.handle, switch)
    return self
end

--获取屏幕横向分辨率
---@return integer horizontal_res 横向分辨率
function M.get_screen_width()
    return GameAPI.get_screen_x_resolution()
end

--获取屏幕纵向分辨率
---@return integer vertical_res 纵向分辨率
function M.get_screen_height()
    return GameAPI.get_screen_y_resolution()
end

-- 获取窗口宽度
---@return integer
function M:get_window_width()
    return GameAPI.get_window_real_x_size()
end

-- 获取窗口高度
---@return integer
function M:get_window_height()
    return GameAPI.get_window_real_y_size()
end

-- 设置控件跟随鼠标
---@param follow_mouse boolean
---@param offset_x? number # 偏移x轴
---@param offset_y? number # 偏移y轴
---@return self
function M:set_follow_mouse(follow_mouse, offset_x, offset_y)
    GameAPI.set_ui_comp_follow_mouse(self.player.handle, self.handle, follow_mouse, offset_x or 0, offset_y or 0)
    return self
end

-- 设置鼠标样式
---@param player Player
---@param state y3.Const.CursorState
---@param key py.CursorKey
---@return self
function M:set_cursor(player, state, key)
    player.handle:api_set_role_cursor(
        y3.const.CursorState[state],
        key
    )
    return self
end

-- 播放序列帧
---@param loop? boolean # 是否循环
---@param space? number # 间隔帧数
---@param start_frame? integer # 起始帧
---@param end_frame? integer # 结束帧
---@return self
function M:play_ui_sequence(loop, space, start_frame, end_frame)
    ---@diagnostic disable-next-line: param-type-mismatch
    GameAPI.play_ui_comp_sequence(self.player.handle, self.handle, loop or false, space or 0.1, start_frame or 0, end_frame or -1)
    return self
end

---@enum(key) Item.UseOperation
local use_operation_map = {
    ['无'] = 0,
    ['左键单击'] = 1,
    ['右键单击'] = 2,
    ['左键双击'] = 3,
}

--设置使用物品操作方式
---@param use_operation Item.UseOperation # 操作方式
function M:set_equip_slot_use_operation(use_operation)
    GameAPI.set_equip_slot_use_operation(self.player.handle, self.handle, use_operation_map[use_operation] or 0)
end

---@enum(key) Item.DrapOperation
local drag_operation_map = {
    ['无'] = 0,
    ['左键'] = 1,
    ['右键'] = 2,
}

--设置拖拽物品操作方式
---@param drag_operation Item.DrapOperation # 操作方式
function M:set_equip_slot_drag_operation(drag_operation)
    GameAPI.set_equip_slot_drag_operation(self.player.handle, self.handle, drag_operation_map[drag_operation] or 0)
end

--添加UI到网格列表
---@param child UI
---@param child_index? integer 默认是最后一个, 如果位置大于当前最大位置, 也是默认最后一个
function M:insert_ui_gridview_comp(child, child_index)
    ---@diagnostic disable-next-line: param-type-mismatch
    GameAPI.insert_ui_gridview_comp(self.player.handle, child.handle, self.handle, child_index)
end

--设置网格列表布局方式
---@param layout_type integer # 布局方式
function M:set_ui_gridview_type(layout_type)
    GameAPI.set_ui_gridview_type(self.player.handle, self.handle, layout_type)
end

--设置网格列表行数列数
---@param row_count integer # 行数
---@param column_count integer # 列数
function M:set_ui_gridview_count(row_count, column_count)
    GameAPI.set_ui_gridview_count(self.player.handle, self.handle, row_count, column_count)
end

--设置网格列表单元格宽高
---@param width number # 宽
---@param height number # 高
function M:set_ui_gridview_size(width, height)
    GameAPI.set_ui_gridview_size(self.player.handle, self.handle, width, height)
end

--设置网格列表边距
---@param top number # 上
---@param bottom number # 下
---@param left number # 左
---@param right number # 右
function M:set_ui_gridview_margin(top, bottom, left, right)
    GameAPI.set_ui_gridview_margin(self.player.handle, self.handle, top, bottom, left, right)
end

--设置网格列表单元格间距
---@param width number # 横向
---@param height number # 纵向
function M:set_ui_gridview_space(width, height)
    GameAPI.set_ui_gridview_space(self.player.handle, self.handle, width, height)
end

--设置网格列表对齐方式
---@param align_type integer # 对齐方式
function M:set_ui_gridview_align(align_type)
    GameAPI.set_ui_gridview_align(self.player.handle, self.handle, align_type)
end

--设置网格列表启用/禁止滚动
---@param enable boolean # 是否启用
function M:set_ui_gridview_scroll(enable)
    GameAPI.set_ui_gridview_scroll(self.player.handle, self.handle, enable)
end

--设置网格列表启用/禁止尺寸随内容变化
---@param enable boolean # 是否启用
function M:set_ui_gridview_size_adaptive(enable)
    GameAPI.set_ui_gridview_size_adaptive(self.player.handle, self.handle, enable)
end

--设置网格列表横向/纵向跳转百分比
---@param direction integer # 横向/纵向
---@param ratio number # 百分比
function M:set_ui_gridview_bar_percent(direction, ratio)
    GameAPI.set_ui_gridview_bar_percent(self.player.handle, self.handle, direction, ratio)
end

--设置界面控件的父控件
---@param parent_uid string # 父控件uid
---@param keep_pos? boolean # 保持位置
---@param keep_rotation? boolean # 保持旋转
---@param keep_scale? boolean # 保持缩放
function M:set_ui_comp_parent(parent_uid, keep_pos, keep_rotation, keep_scale)
    local parent_ui = self:get_parent()
    if parent_ui ~= nil then
        parent_ui:remove_get_child_cache(self.name)
    end
    GameAPI.set_ui_comp_parent(self.player.handle, self.handle, parent_uid, keep_pos, keep_rotation, keep_scale)
end

--清空UI控件图片
function M:clear_ui_comp_image()
    GameAPI.clear_ui_comp_image(self.player.handle, self.handle)
end

---设置列表允许/禁止滚动
---@param enable boolean # 是否允许滚动
function M:set_scrollview_scroll(enable)
    GameAPI.set_ui_scrollview_scroll(self.player.handle, self.handle, enable)
end

return M
