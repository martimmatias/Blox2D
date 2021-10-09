local ScriptSignal = {}
local ErrorMessages = {
    __newindex = "Attempted to set a ScriptSignal's property: %s to %s (%s)",
    Connect = "Attempted to connect ScriptSignal to %s (%s)",
}
local ScriptSignalTable = {
    __type = "ScriptSignal",
}
function ScriptSignalTable:Connect(func)
    if type(func) == "function" then
        local connection = Connection.new(func, self)
        table.insert(self.Connections, connection)
        return connection
    end
    error(ErrorMessages.Connect:format(tostring(func), type(func)))
end

function ScriptSignalTable:Disconnect(connection)
    for i = 1, #self.Connections do
        if self.Connections[i] == connection then
            table.remove(self.Connections, i)
        end
    end
end

function ScriptSignalTable:Fire(...)
    local args = {...}
    for i = 1, #self.Connections do
        self.Connections[i].Func(unpack(args))
    end
end

local metatable = {
    __index = ScriptSignalTable,
    __newindex = function(table, index, value)
        error(ErrorMessages.__newindex:format(tostring(index), tostring(value), type(value)))
    end,
}

ScriptSignal.new = function()
    local signal = {
        --Name = name or "ScriptSignal",
        Connections = {},
    }
    setmetatable(signal, metatable)
    return signal
end

return ScriptSignal