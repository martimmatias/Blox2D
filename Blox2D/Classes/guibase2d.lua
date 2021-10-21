local Class, Table, getters, setters, newFunc = _Inherit(Instance, "GuiBase2d")

function setters:AutoLocalize()
    Check("Set(AutoLocalize)", "boolean", value, "value")
    self:Set("AutoLocalize", value)
end

function getters:AbsolutePosition()
    return Vector2.new(self._AbsolutePosition.X, self._AbsolutePosition.Y)
end

function getters:AbsoluteSize()
    return Vector2.new(self._AbsoluteSize.X, self._AbsoluteSize.Y)
end

GuiBase2d.new = function()
    local instance = newFunc()
    rawset(instance, "_AbsoluteSize", Vector2.new())
    rawset(instance, "_AbsolutePosition", Vector2.new())
    rawset(instance, "_AbsoluteRotation", 0)
    rawset(instance, "_AutoLocalize", false)
    return instance
end

return Class