---@class UnitTest.EventObject
---@overload fun(): self
local M = Class 'UnitTest.EventObject'

---@class UnitTest.EventObject: CustomEvent
Extends('UnitTest.EventObject', 'CustomEvent')
