local Class, Table, getters, setters, newFunc = _Inherit(Instance, "UserInputService")

Class.new = function ()
    local instance = newFunc()
    rawset(instance, "WindowFocused", ScriptSignal.new())
    rawset(instance, "WindowFocusReleased", ScriptSignal.new())
    return instance
end

return Class