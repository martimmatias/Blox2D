local Class, Table, getters, setters, newFunc = _Inherit(Instance, "GuiBase2d")

function setters:AutoLocalize(value)
    Check("Set(AutoLocalize)", "boolean", value, "value")
    self:Set("AutoLocalize", value)
end

function setters:AbsolutePosition(value)
    self:Set("AbsolutePosition", value)
    for _, child in pairs(self._Children) do
        if child:IsA("GuiObject") then
            child:_AbsolutePositionChanged()
        end
    end
end

function setters:AbsoluteSize(value)
    self:Set("AbsoluteSize", value)
    for _, child in pairs(self._Children) do
        if child:IsA("GuiObject") then
            child:_AbsoluteSizeChanged()
        end
    end
end

function setters:AbsoluteRotation(value)
    self:Set("AbsoluteRotation", value)
    for _, child in pairs(self._Children) do
        if child:IsA("GuiObject") then
            child:_AbsoluteRotationChanged()
        end
    end
end

function getters:AbsolutePosition()
    return Vector2.new(self._AbsolutePosition.X, self._AbsolutePosition.Y)
end

function getters:AbsoluteSize()
    return Vector2.new(self._AbsoluteSize.X, self._AbsoluteSize.Y)
end

Class.new = function()
    local instance = newFunc()
    rawset(instance, "_AbsoluteSize", Vector2.new())
    rawset(instance, "_AbsolutePosition", Vector2.new())
    rawset(instance, "_AbsoluteRotation", 0)
    rawset(instance, "_AutoLocalize", false)
    return instance
end

return Class