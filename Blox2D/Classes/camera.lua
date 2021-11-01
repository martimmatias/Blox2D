local Class, Table, getters, setters, newFunc = _Inherit(Instance, "Camera")

function setters:Position(vector)
    Check("Set(Position)", "table", vector, "vector")
    if typeof(vector) == "Vector2" then
        self:Set("Position", vector)
    end
end
function setters:Rotation(value)
    Check("Set(Rotation)", "number", value, "value")
    self:Set("Rotation", value)
end

Class.new = function ()
    local instance = newFunc()
    rawset(instance, "_Name", "Camera")
    rawset(instance, "_Position", Vector2.new())
    rawset(instance, "_Rotation", 0)
    rawset(instance, "_ViewportSize", Vector2.new(love.graphics.getDimensions()))
    return instance
end

return Class