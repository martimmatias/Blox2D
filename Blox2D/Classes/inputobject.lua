local Class, Table, getters, setters, newFunc = _Inherit(Instance, "InputObject")

function setters:Delta(vector)
    Check("Set(Delta)", "table", vector, "vector")
    assert(typeof(vector) == "Vector2", Blox2D._ErrorMessages.__newindex:format(self, "Delta", tostring(vector), type(vector)))
    self:Set("Delta", vector)
end

function setters:Position(vector)
    Check("Set(Position)", "table", vector, "vector")
    assert(typeof(vector) == "Vector2", Blox2D._ErrorMessages.__newindex:format(self, "Position", tostring(vector), type(vector)))
    self:Set("Position", vector)
end

function setters:KeyCode(value)
    self:_SetEnum("KeyCode", value, Enum.KeyCode)
end

Class.new = function ()
    local instance = newFunc()
    rawset(instance, "_Delta", Vector2.new())
    rawset(instance, "_Position", Vector2.new())
    return instance
end

return Class