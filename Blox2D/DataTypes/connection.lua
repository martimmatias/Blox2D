local Connection = {}
local ErrorMessages = {
    __newindex = "Attempted to set Connection property: %s to %s (%s)",
}

local ConnectionTable = {
    __type = "Connection",
}
function ConnectionTable:Disconnect()
    self.Connected = false
    self.Func = nil
    self.Signal:Disconnect(self)
    self.Signal = nil
end

local metatable = {
    __index = ConnectionTable,
    __newindex = function(table, index, value)
        error(ErrorMessages.__newindex:format(tostring(index), tostring(value), type(value)))
    end,
}

Connection.new = function(func, signal)
    local connection = {
        Connected = true,
        Func = func,
        Signal = signal
    }
    setmetatable(connection, metatable)
    return connection
end
return Connection