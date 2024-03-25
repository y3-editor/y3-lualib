Class   = require 'y3.tools.class'.declare
New     = require 'y3.tools.class'.new
Extends = require 'y3.tools.class'.extends
IsValid = require 'y3.tools.class'.isValid

---@class Log
log = {
    error = print,
}

---@class Y3
y3 = {}
y3.util   = require 'y3.tools.utility'
y3.reload = require 'y3.tools.reload'

require 'y3.tools.linked_table'
require 'y3.util.event'
require 'y3.util.event_manager'
require 'y3.util.custom_event'
require 'y3.util.trigger'

require 'y3.unittest.eventtest'
require 'y3.unittest.eventperform'

print('测试完成！')
