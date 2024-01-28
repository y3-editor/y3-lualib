include "y3.px.常量"
include "y3.px.枚举"
include "y3.px.基础.表"
include "y3.px.基础.字符串"
include "y3.px.基础.数学"
include "y3.px.基础.工具"

y3.事件 = include "y3.px.事件.事件"
include "y3.px.事件.单位事件"


include "src.模块.物编资源生成模块"
include "src.模块.界面操作模块"

-- y3.const = require "y3.game.const"
-- y3.math = require "y3.game.math"
-- y3.py_converter = require "y3.game.py_converter"
-- y3.py_event_sub = require "y3.game.py_event_subscribe"
-- y3.helper = require "y3.game.helper"
-- y3.ground = require "y3.game.ground"
-- y3.config = require "y3.game.config"
-- y3.kv = require "y3.game.kv"

-- y3.ability = require "y3.object.editable_object.ability"
-- y3.destructible = require "y3.object.editable_object.destructible"
-- y3.buff = require "y3.object.editable_object.buff"
-- y3.projectile = require "y3.object.editable_object.projectile"
-- y3.technology = require "y3.object.editable_object.technology"

-- y3.beam = require "y3.object.runtime_object.beam"
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
-- y3.light           = require "y3.object.scene_object.light"
-- y3.road            = require "y3.object.scene_object.road"
-- y3.scene_ui        = require "y3.object.scene_object.scene_ui"
-- y3.ui              = require "y3.object.scene_object.ui"
-- y3.ui_prefab       = require "y3.object.scene_object.ui_prefab"
-- y3.shape           = require "y3.object.scene_object.shape"

-- y3.object          = require "y3.util.object"
-- y3.ltimer          = require "y3.util.local_timer"

-- y3.dump            = require "y3.util.dump"

-- y3.develop         = {}
-- y3.develop.command = include "y3.develop.command"


function _预设数据初始化()
    常量.中立友善玩家 = y3.玩家.从id获取(32)

    ---@diagnostic disable-next-line: inject-field
    常量.中立敌对玩家 = y3.玩家.从id获取(31)
    ---@diagnostic disable-next-line: inject-field
    常量.空玩家组 = y3.玩家组.获取所有玩家():清空()
    常量.空单位组 = y3.玩家:获取所有单位():清空()
end

local function _游戏初始化()
    _预设数据初始化()
    y3.事件.发送_自定义_带标识("游戏初始化", "插件加载", {})
    y3.事件.发送_自定义_带标识("游戏初始化", "文件加载", {})
    y3.事件.发送_自定义_带标识("游戏初始化", "游戏初始化", {})
end

---@param 参数 参_玩家加入游戏
local function _玩家加入(参数)
    y3.事件.发送_自定义_带标识("玩家加入游戏", "插件加载", 参数)
    y3.事件.发送_自定义_带标识("玩家加入游戏", "玩家初始化", 参数)
    y3.事件.发送_自定义_带标识("玩家加入游戏", "玩家加入游戏", 参数)
end


y3.game:event("游戏-初始化", function(trg, data)
    _游戏初始化()
    y3.game:event("玩家-加入游戏", function(trg, data)
        _玩家加入({ 加入玩家 = data.player, 是否中途加入 = data.is_middle_join })
    end)
end)

y3.reload.onAfterReload(function(reload, hasReloaded)
    _游戏初始化()
    y3.玩家组.获取所有非中立玩家():遍历(function(索引, 遍历到的玩家)
        if 遍历到的玩家:get_state() == 1 then
            _玩家加入({ 加入玩家 = 遍历到的玩家, 是否中途加入 = false })
        end
    end)
end)
