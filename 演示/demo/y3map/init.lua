require 'y3'
require 'y3map.common'
require 'y3map.manager'
require 'y3map.object'
require 'y3map.view'
require 'y3map.create_hero'
require 'y3map.ui'

---@class EventEnum
EventEnum = require 'y3map.common.event_enum'

---@class y3map
y3map = {}
y3map.global = require 'y3map.common.global'
y3map.ui_manager = require 'y3map.manager.ui_manager'
y3map.config_manager = require 'y3map.manager.config_manager'
y3map.generator_manager = require 'y3map.manager.generator_manager'
y3map.timer_manager = require 'y3map.manager.timer_manager'
y3map.create_hero = require 'y3map.create_hero'
y3map.keyboard_manager = require 'y3map.manager.keyboard_manager'
