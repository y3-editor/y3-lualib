pcall(function ()
    require "y3.debugger":start "127.0.0.1:12399"--:event 'wait'
end)

-- 全局方法类，提供各种全局方法
---@class Y3
y3 = {}

y3.proxy = require 'y3.tools.proxy'
y3.class = require 'y3.tools.class'
y3.util  = require 'y3.tools.utility'

Class = y3.class.declare
New   = y3.class.new
Super = y3.class.super

---@diagnostic disable-next-line: lowercase-global
log      = require 'y3.tools.log'

require 'y3.util.gc'
require 'y3.util.linked_table'
require 'y3.util.eca_function'
require 'y3.util.trigger'
require 'y3.util.event'
require 'y3.util.event_manager'

---@param ... any
function print(...)
    local t = table.pack(...)
    for i = 1, t.n do
        t[i] = tostring(t[i])
    end
    local str = table.concat(t, '\t', 1, t.n)
    GameAPI.print_to_dialog(3, str)
end

y3.const        = require 'y3.game.const'
y3.game         = require 'y3.game.game'
y3.py_converter = require 'y3.game.py_converter'
y3.py_event_sub = require 'y3.game.py_event_subscribe'
y3.helper       = require 'y3.game.helper'

y3.unit         = require 'y3.object.editable_object.unit'
y3.ability      = require 'y3.object.editable_object.ability'
y3.destructible = require 'y3.object.editable_object.destructible'
y3.item         = require 'y3.object.editable_object.item'
y3.buff         = require 'y3.object.editable_object.buff'
y3.projectile   = require 'y3.object.editable_object.projectile'

y3.beam         = require 'y3.object.runtime_object.beam'
y3.item_group   = require 'y3.object.runtime_object.item_group'
y3.math         = require 'y3.object.runtime_object.math'
y3.mover        = require 'y3.object.runtime_object.mover'
y3.particle     = require 'y3.object.runtime_object.particle'
y3.player       = require 'y3.object.runtime_object.player'
y3.player_group = require 'y3.object.runtime_object.player_group'
y3.timer        = require 'y3.object.runtime_object.timer'
y3.unit_group   = require 'y3.object.runtime_object.unit_group'
y3.projectile_group = require 'y3.object.runtime_object.projectile_group'
y3.selector     = require 'y3.object.runtime_object.selector'

y3.area         = require 'y3.object.scene_object.area'
y3.camera       = require 'y3.object.scene_object.camera'
y3.light        = require 'y3.object.scene_object.light'
y3.road         = require 'y3.object.scene_object.road'
y3.point        = require 'y3.object.scene_object.point'
y3.scene_ui     = require 'y3.object.scene_object.scene_ui'
y3.ui           = require 'y3.object.scene_object.ui'
y3.ui_prefab    = require 'y3.object.scene_object.ui_prefab'
y3.shape        = require 'y3.object.scene_object.shape'
