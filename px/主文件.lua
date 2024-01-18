事件 = {}


单位 = require "y3.object.editable_object.unit"
单位组 = require "y3.object.runtime_object.unit_group"
玩家 = require "y3.object.runtime_object.player"
玩家组 = require "y3.object.runtime_object.player_group"

-- y3.const = require "y3.game.const"
-- y3.math = require "y3.game.math"
-- y3.game = require "y3.game.game"
-- y3.py_converter = require "y3.game.py_converter"
-- y3.py_event_sub = require "y3.game.py_event_subscribe"
-- y3.helper = require "y3.game.helper"
-- y3.ground = require "y3.game.ground"
-- y3.config = require "y3.game.config"
-- y3.kv = require "y3.game.kv"

-- y3.ability = require "y3.object.editable_object.ability"
-- y3.destructible = require "y3.object.editable_object.destructible"
-- y3.item = require "y3.object.editable_object.item"
-- y3.buff = require "y3.object.editable_object.buff"
-- y3.projectile = require "y3.object.editable_object.projectile"
-- y3.technology = require "y3.object.editable_object.technology"

-- y3.beam = require "y3.object.runtime_object.beam"
-- y3.item_group = require "y3.object.runtime_object.item_group"
-- y3.mover = require "y3.object.runtime_object.mover"
-- y3.particle = require "y3.object.runtime_object.particle"

-- y3.timer = require "y3.object.runtime_object.timer"
-- y3.projectile_group = require "y3.object.runtime_object.projectile_group"
-- y3.selector = require "y3.object.runtime_object.selector"
-- y3.cast = require "y3.object.runtime_object.cast"
-- y3.damage_instance = require "y3.object.runtime_object.damage_instance"
-- y3.heal_instance = require "y3.object.runtime_object.heal_instance"
-- y3.sound = require "y3.object.runtime_object.sound"

-- require "y3.object.runtime_object.local_player"

-- y3.area            = require "y3.object.scene_object.area"
-- y3.camera          = require "y3.object.scene_object.camera"
-- y3.light           = require "y3.object.scene_object.light"
-- y3.road            = require "y3.object.scene_object.road"
-- y3.point           = require "y3.object.scene_object.point"
-- y3.scene_ui        = require "y3.object.scene_object.scene_ui"
-- y3.ui              = require "y3.object.scene_object.ui"
-- y3.ui_prefab       = require "y3.object.scene_object.ui_prefab"
-- y3.shape           = require "y3.object.scene_object.shape"

-- y3.object          = require "y3.util.object"
-- y3.ltimer          = require "y3.util.local_timer"
-- y3.save_data       = require "y3.util.save_data"
-- y3.dump            = require "y3.util.dump"

-- y3.develop         = {}
-- y3.develop.command = include "y3.develop.command"

include "y3.px.表"
include "y3.px.字符串"
include "y3.px.数学"
include "y3.px.工具"

事件.全局事件 = include "y3.px.事件"
