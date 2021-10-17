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

Class.new = function ()
    return newFunc()
end

return Class