---@class LobbyMessageHandler
local message_handler = Class("LobbyMessageHandler")

local const = require "y3.game.lobby.network.protocol"
local net_event = require "y3.game.lobby.network.net_event"
local fsm = require "y3.game.lobby.network.fsm"

---@private
message_handler.coder = require "y3.game.lobby.network.coder"

-- Constructor
---@class LobbyMessageHandler
---@field ip string # ip address for the server
---@field port integer # port number for the server
---@field heartbeat_interval integer # heartbeat interval in seconds
---@field ping_handle? integer # gateway unique identifier
---@field event_handler? function # event handler
---@field connection? Network # network connection
---@field state_machine fsm # finite state machine

---@alias message_handler.ProtocolCoder fun(data: string)
function message_handler:__init(ip, port, heartbeat_interval)
    -- initial member variable
    self.ip = ip
    self.port = port
    self.heartbeat_interval = heartbeat_interval > 0 and heartbeat_interval or 60 -- default 60 seconds
    self.is_running = false
    self.ping_handle = 0
    self.heartbeat_timer = nil
    self.state_machine = nil
    self.net_event_handler = nil

    self:init_state_machine()
end

-- Destructor
function message_handler:__del()
    self:shutdown()
end

---@private
-- initialize the state machine
function message_handler:init_state_machine()
    self.state_machine = fsm:new()

    self.state_machine:init()

    -- add state
    self.state_machine:add_state("connecting", function() return self:do_connect() end, nil)
    -- TODO: add login state
    self.state_machine:add_state("running", function() return self:do_process_message() end, nil)
    self.state_machine:add_state("disconnected", function(err_msg) return self:do_disconnect(err_msg) end, nil)

    -- add transition
    self.state_machine:add_transition("connecting", "running")
    self.state_machine:add_transition("running", "disconnected")
    self.state_machine:add_transition("disconnected", "connecting")
end

---@private
-- connect to the server
---@return boolean # success or failure
function message_handler:do_connect()
    -- create network connection
    self.connection = y3.network.connect(self.ip, self.port)
    --- set event handler
    self.connection:on_connected(function() self:on_connected() end)
    self.connection:on_disconnected(function() self:on_disconnected() end)
    self.connection:on_error(function() self:on_network_error() end)

    return true
end

---@private
-- process the message
---@return boolean # success or failure
function message_handler:do_process_message()
    self.is_running = true

    if self.net_event_handler then
        local ne = net_event:new(const.msgtype.RPC_EVENT, nil)
        ne.sub_type = const.event_subtype.ON_RUNNING
        self.net_event_handler(ne)
    end

    if self.connection then
        ---@async
        self.connection:data_reader(function(read_handler)
            self:handle_message(read_handler)
        end)
    end
    return true
end

---@private
-- disconnect from the server
---@param err_msg string # error message
---@return boolean # success or failure
function message_handler:do_disconnect(err_msg)
    self.is_running = false

    if self.net_event_handler then
        local ne = net_event:new(const.msgtype.RPC_EVENT, nil)
        ne.err_msg = err_msg
        ne.sub_type = const.event_subtype.LOSE_CONNECTION

        self.net_event_handler(ne)
    end

    self:shutdown()

    return true
end

---@private
-- successfull connected to the server
function message_handler:on_connected()
    -- change to running state
    self.state_machine:change_state("running")
end

---@private
-- disconnected from the server
function message_handler:on_disconnected()
    self.state_machine:change_state("disconnected")
end

---@private
function message_handler:on_network_error(error_message)
    self.state_machine:change_state("disconnected", error_message)
end

---@private
--- send heartbeat to the gateway
function message_handler:start_hearbeat()
    if self.heartbeat_timer ~= nil then
        return
    end

    if self.ping_handle == 0 then
        return
    end

    self.heartbeat_timer = y3.ltimer.loop(self.heartbeat_interval, function()
        if self.connection then
            self.connection:send(self.coder.pack_ping(self.ping_handle))
        end
    end)
end

---@private
--- handle the received message
function message_handler:handle_message(read_handler)
    -- reader protocol header and unpack
    local header = read_handler(8)
    local length, proto_type = self.coder.unpack_header(header)
    -- determine if the message type is valid.
    -- read subsequent protocol body.
    local proto_body = read_handler(length - 8)
    if proto_type == const.msgtype.RPC_CALL then
        self:handle_request(proto_body)
    elseif proto_type == const.msgtype.RPC_RETURN then
        self:handle_response(proto_body)
    elseif proto_type == const.msgtype.RAW_PROTOCOL then
        -- unpack the raw protocol
        self:handle_raw_protocol(proto_body)
    elseif proto_type == const.msgtype.RPC_PONG then
        -- unpack the heartbeat protocol
        self:handle_heartbeat(proto_body)
    else
        -- invalid protocol type
        -- In theory, it will never trigger.
        self.state_machine:change_state("disconnected", "invalid protocol type")
    end
end

function message_handler:handle_raw_protocol(msg_body)
    -- unpack the raw protocol
    local proto_type, pb_data = self.coder.unpack_gameplay_proto(msg_body)
    local gp_event = net_event:new(const.msgtype.RAW_PROTOCOL, pb_data)
    gp_event.sub_type = proto_type

    -- triggher event call back
    if self.net_event_handler then
        self.net_event_handler(gp_event)
    end
end

---@private
-- unmarsal the heartbeat protocol
---@param msg_body string # received message bytes
function message_handler:handle_heartbeat(msg_body)
    self.ping_handle = self.coder.unpack_pong(msg_body)
    if self.heartbeat_timer ~= nil then
        --- heartbeat timer has been activated, no need to do anything.
        return
    end
    -- start the heartbeat timer
    self:start_hearbeat()
end

---@private
-- unmarsal the request protocol
---@param msg_body string # received message bytes
function message_handler:handle_request(msg_body)
    -- unpack the request protocol
    local message_id, call_id, method_id, start_pos = self.coder.unpack_request(msg_body)
    local proto_body = start_pos and msg_body:sub(start_pos) or nil

    local request_event = net_event:new(const.msgtype.RPC_CALL, proto_body)
    request_event.message_id = message_id
    request_event.method_id = method_id
    request_event.call_id = call_id

    -- triggher event call back
    if self.net_event_handler then
        self.net_event_handler(request_event)
    end
end

function message_handler:handle_response(msg_body)
    -- unpack the response protocol
    local call_id, error_id, start_pos = self.coder.unpack_response(msg_body)
    local proto_body = start_pos and msg_body:sub(start_pos) or nil

    local response_event = net_event:new(const.msgtype.RPC_RETURN, proto_body)
    response_event.call_id = call_id
    response_event.error_id = error_id

    -- triggher event call back
    if self.net_event_handler then
        self.net_event_handler(response_event)
    end
end

-- start messager handler
function message_handler:start()
    self.state_machine:change_state("connecting")
end

-- shutdown the processing of message
function message_handler:shutdown()
    -- Stop running, no longer accept and send any protocols.
    self.is_running = false

    if self.heartbeat_timer ~= nil then
        self.heartbeat_timer:remove()
        self.heartbeat_timer = nil
    end

    if self.connection ~= nil then
        self.connection:remove()
        self.connection = nil
    end
end

-- set network event handle
---@param net_event_handler function(net_event) # network event handle
function message_handler:set_network_event_handle(net_event_handler)
    self.net_event_handler = net_event_handler
end

--- send request protocol
---@param message_id integer # service uuid
---@param call_id integer # local auto-increment ID, generated by the client
---@param method_id integer # service method indexes
---@param body string # serialized protobuf binary data
---@return boolean, string|nil # success or error message_handler
function message_handler:send_request(message_id, call_id, method_id, body)
    if not self.is_running then
        -- 返回错误信息
        return false, "network is not running"
    end

    local send_data = self.coder.pack_request(message_id, call_id, method_id, body)
    self.connection:send(send_data)
    return true
end

--- send response protocol
---@param call_id integer # received call_id in the request
---@param error_id integer # error code, in const.rpcerror
---@param proto_body string # serialized protobuf binary data
---@return boolean, string|nil # success or error message_handler
function message_handler:send_response(call_id, error_id, proto_body)
    if not self.is_running then
        -- 返回错误信息
        return false, "network is not running"
    end

    local send_data = self.coder.pack_response(call_id, error_id, proto_body)
    self.connection:send(send_data)
    return true
end

--- send raw protocol
---@param proto_type integer #protocol type
---@param pb_data string # pb data
---@return boolean, string|nil
function message_handler:send_raw_message(proto_type, pb_data)
    if not self.is_running then
        -- 返回错误信息
        return false, "network is not running"
    end

    local custom_data = self.coder.pack_gameplay_proto(proto_type, pb_data)
    local send_data = self.coder.pack_raw_message(custom_data)
    self.connection:send(send_data)
    return true
end

---@class network.API # network API
local API = {}

--- Create a message processing handle
---comment
---@param ip string
---@param port integer
---@param heartbeat_interval integer
---@return LobbyMessageHandler
function API.new(ip, port, heartbeat_interval)
    return New "LobbyMessageHandler" (ip, port, heartbeat_interval)
end

return API
