local type         = type
local error        = error
local tostring     = tostring
local mathType     = math.type
local stringPack   = string.pack
local stringUnpack = string.unpack
local stringSub    = string.sub
local tableConcat  = table.concat

---@class Serialization
local M = {}

local Number  = 'N'
local UInt8   = 'I'
local UInt16  = 'J'
local UInt32  = 'K'
local Int64   = 'L'
local Char1   = 'V'
local Char2   = 'W'
local Str8    = 'X'
local Str16   = 'Y'
local Str32   = 'Z'
local True    = 'T'
local False   = 'F'
local Nil     = '!'
local ArrayB  = '[' -- 开始一张数组的定义（废弃，仅用于兼容）
local ArrayE  = ']' -- 结束一张数组的定义（废弃，仅用于兼容）
local TableB  = 'B' -- 开始一张表的定义（废弃，仅用于兼容）
local TableE  = 'E' -- 结束一张表的定义（废弃，仅用于兼容）
local MixB    = '{' -- 开始一张混合表的定义
local MixE    = '}' -- 结束一张混合表的定义
local Array   = '.' -- 此字段为整数部分
local Ref     = 'R' -- 复用之前定义的字符串或表
local Custom  = 'C' -- 自定义数据

local RefStrLen = 4 -- 字符串长度大于此值时保存引用

local EndSymbol   = { '<End>' }
local ArraySymbol = { '<Array>' }

---@alias Serialization.SupportTypes
---| number
---| string
---| boolean
---| table
---| nil

local encode

local encodeMethods;encodeMethods = {
    ['number'] = function (value, buf)
        if mathType(value) == 'integer' then
            if value >= 0 then
                if value < (1 << 8) then
                    buf[#buf+1] = UInt8 .. stringPack('I1', value)
                    return
                elseif value < (1 << 16) then
                    buf[#buf+1] = UInt16 .. stringPack('I2', value)
                    return
                elseif value < (1 << 32) then
                    buf[#buf+1] = UInt32 .. stringPack('I4', value)
                    return
                end
            end
            buf[#buf+1] = Int64 .. stringPack('j', value)
        else
            buf[#buf+1] = Number .. stringPack('n', value)
        end
    end,
    ['string'] = function (value, buf, ex)
        local len = #value
        if len > RefStrLen then
            local ref = ex.refMap[value]
            if ref then
                buf[#buf+1] = Ref
                encodeMethods['number'](ref, buf)
                return
            end
        end
        if len == 1 then
            buf[#buf+1] = Char1 .. value
        elseif len == 2 then
            buf[#buf+1] = Char2 .. value
        elseif len < (1 << 8) then
            buf[#buf+1] = Str8 .. stringPack('s1', value)
        elseif len < (1 << 16) then
            buf[#buf+1] = Str16 .. stringPack('s2', value)
        elseif len < (1 << 32) then
            buf[#buf+1] = Str32 .. stringPack('s4', value)
        else
            error('不支持这么长的字符串！')
        end
        if len > RefStrLen then
            ex.refid = ex.refid + 1
            ex.refMap[value] = ex.refid
        end
    end,
    ['boolean'] = function (value, buf)
        if value then
            buf[#buf+1] = True
        else
            buf[#buf+1] = False
        end
    end,
    ['nil'] = function (value, buf)
        buf[#buf+1] = Nil
    end,
    ['table'] = function (value, buf, ex, disableHook)
        local ref = ex.refMap[value]
        if ref then
            buf[#buf+1] = Ref
            encodeMethods['number'](ref, buf)
            return
        end

        if ex.hook and not disableHook then
            local newValue, tag = ex.hook(value)
            if newValue ~= nil then
                buf[#buf+1] = Custom
                encode(newValue, buf, ex, true)
                encode(tag or false, buf, ex, true)
                return
            end
        end

        ex.refid = ex.refid + 1
        ex.refMap[value] = ex.refid
        buf[#buf+1] = MixB

        local i = 1
        for k, v in next, value do
            if k == i then
                -- 数组部分
                i = i + 1
                buf[#buf+1] = Array
                encode(v, buf, ex)
            else
                -- 混合表部分
                encode(k, buf, ex)
                encode(v, buf, ex)
            end
        end

        buf[#buf+1] = MixE
    end,
}

function encode(value, buf, ex, disableHook)
    local tp = type(value)
    encodeMethods[tp](value, buf, ex, disableHook)
end

-- 将一个Lua值序列化为二进制数据。请勿做为长期存储方案，因为二进制数据可能会因为版本更新而不兼容。
---@param data Serialization.SupportTypes | nil
---@param hook? fun(value: table): Serialization.SupportTypes | nil, string?
---@param ignoreUnknownType? boolean
---@return string
function M.encode(data, hook, ignoreUnknownType)
    if data == nil then
        return ''
    end
    local buf = {}
    local refid = 0
    local refMap = {}

    encode(data, buf, {
        refid = refid,
        refMap = refMap,
        hook = hook,
        ignoreUnknownType = ignoreUnknownType,
    })

    return tableConcat(buf)
end

local decode

local decodeMethods;decodeMethods = {
    [Number] = function (ex)
        local value, newIndex = stringUnpack('n', ex.str, ex.index)
        ex.index = newIndex
        return value
    end,
    [UInt8] = function (ex)
        local value, newIndex = stringUnpack('I1', ex.str, ex.index)
        ex.index = newIndex
        return value
    end,
    [UInt16] = function (ex)
        local value, newIndex = stringUnpack('I2', ex.str, ex.index)
        ex.index = newIndex
        return value
    end,
    [UInt32] = function (ex)
        local value, newIndex = stringUnpack('I4', ex.str, ex.index)
        ex.index = newIndex
        return value
    end,
    [Int64] = function (ex)
        local value, newIndex = stringUnpack('j', ex.str, ex.index)
        ex.index = newIndex
        return value
    end,
    [Char1] = function (ex)
        local value = stringSub(ex.str, ex.index, ex.index)
        ex.index = ex.index + 1
        if #value > RefStrLen then
            ex.ref = ex.ref + 1
            ex.refMap[ex.ref] = value
        end
        return value
    end,
    [Char2] = function (ex)
        local value = stringSub(ex.str, ex.index, ex.index + 1)
        ex.index = ex.index + 2
        if #value > RefStrLen then
            ex.ref = ex.ref + 1
            ex.refMap[ex.ref] = value
        end
        return value
    end,
    [Str8] = function (ex)
        local value, newIndex = stringUnpack('s1', ex.str, ex.index)
        ex.index = newIndex
        if #value > RefStrLen then
            ex.ref = ex.ref + 1
            ex.refMap[ex.ref] = value
        end
        return value
    end,
    [Str16] = function (ex)
        local value, newIndex = stringUnpack('s2', ex.str, ex.index)
        ex.index = newIndex
        if #value > RefStrLen then
            ex.ref = ex.ref + 1
            ex.refMap[ex.ref] = value
        end
        return value
    end,
    [Str32] = function (ex)
        local value, newIndex = stringUnpack('s4', ex.str, ex.index)
        ex.index = newIndex
        if #value > RefStrLen then
            ex.ref = ex.ref + 1
            ex.refMap[ex.ref] = value
        end
        return value
    end,
    [True] = function ()
        return true
    end,
    [False] = function ()
        return false
    end,
    [Nil] = function ()
        return nil
    end,
    [TableB] = function (ex)
        local value = {}
        ex.ref = ex.ref + 1
        ex.refMap[ex.ref] = value
        while true do
            local k = decode()
            if k == EndSymbol then
                break
            end
            local v = decode()
            ---@diagnostic disable-next-line: need-check-nil
            value[k] = v
        end
        return value
    end,
    [TableE] = function ()
        return EndSymbol
    end,
    [ArrayB] = function (ex)
        local value = {}
        ex.ref = ex.ref + 1
        ex.refMap[ex.ref] = value
        local i = 0
        while true do
            local v = decode()
            if v == EndSymbol then
                break
            end
            i = i + 1
            value[i] = v
        end
        return value
    end,
    [ArrayE] = function ()
        return EndSymbol
    end,
    [Array] = function ()
        return ArraySymbol
    end,
    [MixE] = function ()
        return EndSymbol
    end,
    [MixB] = function (ex)
        local value = {}
        ex.ref = ex.ref + 1
        ex.refMap[ex.ref] = value
        local i = 1
        while true do
            local k = decode(ex)
            if k == EndSymbol then
                break
            end
            if k == ArraySymbol then
                -- 数组部分
                local v = decode(ex)
                value[i] = v
                i = i + 1
            else
                -- 哈希部分
                local v = decode(ex)
                ---@diagnostic disable-next-line: need-check-nil
                value[k] = v
            end
        end
        return value
    end,
    [Ref] = function (ex)
        local value = decode(ex)
        value = ex.refMap[value]
        return value
    end,
    [Custom] = function (ex)
        local value = decode(ex)
        ---@cast value -?
        local tag = decode(ex)
        ---@cast tag string | false
        value = ex.hook(value, tag or nil)
        return value
    end,
}

function decode(ex)
    local tp = stringSub(ex.str, ex.index, ex.index)
    ex.index = ex.index + 1
    return decodeMethods[tp](ex)
end

-- 反序列化二进制数据为Lua值
---@param str string
---@param hook? fun(value: Serialization.SupportTypes, tag?: string): Serialization.SupportTypes | nil
---@return Serialization.SupportTypes | nil
function M.decode(str, hook)
    if str == '' then
        return nil
    end

    local ex = {
        str = str,
        index = 1,
        ref = 0,
        refMap = {},
        hook = hook,
    }

    local value = decode(ex)
    assert(ex.index == #str + 1)
    return value
end

return M
