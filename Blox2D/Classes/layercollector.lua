local Class, Table, getters, setters, newFunc = _Inherit(require("Blox2D.Classes.guibase2d"), "LayerCollector")

function setters:ResetOnSpawn(value)
    Check("Set(ResetOnSpawn)", "boolean", value, "value")
    self:Set("ResetOnSpawn", value)
end

function setters:Enabled(value)
    Check("Set(Enabled)", "boolean", value, "value")
    self:Set("Enabled", value)
end

function setters:ZIndexBehavior(value)
    self:_SetEnum("ZIndexBehavior", value, Enum.ZIndexBehavior)
end

Class.new = function ()
    local instance = newFunc()
    rawset(instance, "_ResetOnSpawn", true)
    rawset(instance, "_Enabled", true)
    rawset(instance, "_ZIndexBehavior", Enum.ZIndexBehavior.Sibling)
    return instance
end

return Class