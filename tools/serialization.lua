local type         = type
local error        = error
local tostring     = tostring
local mathType     = math.type
local stringPack   = string.pack
local stringUnpack = string.unpack
local stringSub    = string.sub
local tableConcat  = table.concat
local tableSort    = table.sort

---@class Serialization
local M = {}

local Number  = 'N'
local UInt8   = 'I'
local UInt16  = 'J'
local UInt24  = 'O'
local UInt32  = 'K'
local Int64   = 'L'
local I0      = '0'
local I1      = '1'
local I2      = '2'
local I3      = '3'
local I4      = '4'
local I5      = '5'
local I6      = '6'
local I7      = '7'
local I8      = '8'
local I9      = '9'
local Char1   = 'V'
local Char2   = 'W'
local Str8    = 'X'
local Str16   = 'Y'
local Str32   = 'Z'
local True    = 'T'
local False   = 'F'
local Nil     = '!'
local ArrayB  = '[' -- 开始一张数组的定义
local ArrayE  = ']' -- 结束一张数组的定义
local TableB  = 'B' -- 开始一张表的定义（废弃，仅用于兼容）
local TableE  = 'E' -- 结束一张表的定义（废弃，仅用于兼容）
local MixB    = '{' -- 开始一张混合表的定义
local MixE    = '}' -- 结束一张混合表的定义
local STableB = '<' -- 开始一张简易表的定义，格式为 [ k1, k2, ..., |,  v1, v2, ... ]，其中key的部分会尝试复用
local Sep     = '|' -- 简易表的键值分隔符
local RTableB = '>' -- 开始复用一张简易表，后面跟的数字表示复用的表ID。复用时长度已知，因此不用结束符。
local Array   = '.' -- 此字段为整数部分
local Ref     = 'R' -- 复用之前定义的字符串或表
local Custom  = 'C' -- 自定义数据

local RefStrLen = 4 -- 字符串长度大于此值时保存引用

local EndSymbol   = { '<END>' }
local ArraySymbol = { '<ARRAY>' }
local SepSymbol   = { '<SEP>' }

---@alias Serialization.SupportTypes
---| number
---| string
---| boolean
---| table
---| nil

local encode

---@param t table
---@return any[] keys
---@return boolean allSimpleKey
---@return integer? arrayLen
local function peekTable(t)
    ---@type integer?
    local maxInteger = 0
    local arrayLen
    local keys = {}
    local allSimpleKey = true
    for k in next, t do
        keys[#keys+1] = k
        local tp = type(k)
        if tp == 'number' then
            if  maxInteger
            and k > maxInteger
            and mathType(k) == 'integer' then
                maxInteger = k --[[@as integer]]
            end
        elseif tp == 'string' then
            maxInteger = nil
        else
            maxInteger = nil
            allSimpleKey = false
        end
    end
    -- 允许一定程度上的稀疏，毕竟稀疏的部分只占一个字节
    if maxInteger and #keys * 4 >= maxInteger then
        arrayLen = maxInteger
    end
    return keys, allSimpleKey, arrayLen
end

local encodeMethods;encodeMethods = {
    ['number'] = function (value, buf)
        if mathType(value) == 'integer' then
            if value >= 0 then
                if value < 10 then
                    buf[#buf+1] = tostring(value)
                    return
                end
                if value < (1 << 8) then
                    buf[#buf+1] = UInt8 .. stringPack('I1', value)
                    return
                elseif value < (1 << 16) then
                    buf[#buf+1] = UInt16 .. stringPack('I2', value)
                    return
                elseif value < (1 << 24) then
                    buf[#buf+1] = UInt24 .. stringPack('I3', value)
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

        local myRef = ex.refid

        local keys, allSimpleKey, arrayLen = peekTable(value)
        if arrayLen then
            buf[#buf+1] = ArrayB

            for i = 1, arrayLen do
                encode(value[i], buf, ex)
            end

            buf[#buf+1] = ArrayE
        elseif allSimpleKey then
            tableSort(keys, function (a, b)
                local ta, tb = type(a), type(b)
                if ta == tb then
                    return a < b
                end
                return ta == 'number'
            end)

            local keyBuf = {}
            local i = 1
            for n = 1, #keys do
                local k = keys[n]

                if k == i then
                    -- 数组部分
                    i = i + 1
                    keyBuf[#keyBuf+1] = Array
                else
                    -- 混合表部分
                    encode(k, keyBuf, ex)
                end
            end
            local keyContent = tableConcat(keyBuf)
            local refid = ex.simpleMap[keyContent]
            if refid then
                buf[#buf+1] = RTableB
                encode(refid, buf, ex)
            else
                buf[#buf+1] = STableB
                ex.simpleMap[keyContent] = myRef
                buf[#buf+1] = keyContent
                buf[#buf+1] = Sep
            end

            for n = 1, #keys do
                local k = keys[n]
                local v = value[k]
                encode(v, buf, ex)
            end
        else
            buf[#buf+1] = MixB

            local i = 1
            for n = 1, #keys do
                local k = keys[n]
                local v = value[k]
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
        end
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

    encode(data, buf, {
        refid = 0,
        refMap = {},
        simpleMap = {},
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
    [UInt24] = function (ex)
        local value, newIndex = stringUnpack('I3', ex.str, ex.index)
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
    [I0] = function ()
        return 0
    end,
    [I1] = function ()
        return 1
    end,
    [I2] = function ()
        return 2
    end,
    [I3] = function ()
        return 3
    end,
    [I4] = function ()
        return 4
    end,
    [I5] = function ()
        return 5
    end,
    [I6] = function ()
        return 6
    end,
    [I7] = function ()
        return 7
    end,
    [I8] = function ()
        return 8
    end,
    [I9] = function ()
        return 9
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
            local k = decode(ex)
            if k == EndSymbol then
                break
            end
            local v = decode(ex)
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
            local v = decode(ex)
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
    [STableB] = function (ex)
        local value = {}
        ex.ref = ex.ref + 1
        ex.refMap[ex.ref] = value

        local myRef = ex.ref

        local i = 1
        local keys = {}
        while true do
            local v = decode(ex)
            if v == SepSymbol then
                break
            end
            if v == ArraySymbol then
                keys[#keys+1] = i
                i = i + 1
            else
                keys[#keys+1] = v
            end
        end

        ex.simpleMap[myRef] = keys

        for n = 1, #keys do
            local k = keys[n]
            local v = decode(ex)
            value[k] = v
        end

        return value
    end,
    [RTableB] = function (ex)
        local value = {}
        ex.ref = ex.ref + 1
        ex.refMap[ex.ref] = value

        local refid = decode(ex)
        local keys = ex.simpleMap[refid]

        for n = 1, #keys do
            local k = keys[n]
            local v = decode(ex)
            value[k] = v
        end

        return value
    end,
    [Ref] = function (ex)
        local value = decode(ex)
        value = ex.refMap[value]
        return value
    end,
    [Sep] = function ()
        return SepSymbol
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

---@param ex table
---@return any
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
        simpleMap = {},
        hook = hook,
    }

    local value = decode(ex)
    assert(ex.index == #str + 1)
    return value
end

return M
