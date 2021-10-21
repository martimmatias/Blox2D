local Class, Table, getters, setters, newFunc = _Inherit(require("Blox2D.Classes.layercollector"), "ScreenGui")

function setters:DisplayOrder(value)
    Check("Set(DisplayOrder)", "number", value, "value")
    self:Set("DisplayOrder", value)
end

function setters:IgnoreGuiInset(value)
    Check("Set(IgnoreGuiInset)", "boolean", value, "value")
    self:Set("IgnoreGuiInset", value)
end

Class.new = function ()
    local instance = newFunc()
    rawset(instance, "_DisplayOrder", 0)
    rawset(instance, "_IgnoreGuiInset", false)
    return instance
end

return Class