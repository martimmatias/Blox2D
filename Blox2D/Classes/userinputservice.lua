local Class, Table, getters, setters, newFunc = _Inherit(Instance, "UserInputService")

--[[function Table:_NewInputObject(key)
    local keyCode = Enum.KeyCode[key] or keyToKeyCodeName[key]
    print(key, keyCode)
    if keyCode == nil then
        warn(keyCode, "does not have a corresponding KeyCode Enum")
        return
    end
    local inputObject = Instance.new("InputObject")
    inputObject.KeyCode = keyCode
end--]]

Class.new = function ()
    local instance = newFunc()
    rawset(instance, "WindowFocused", ScriptSignal.new())
    rawset(instance, "WindowFocusReleased", ScriptSignal.new())
    rawset(instance, "InputBegan", ScriptSignal.new())
    rawset(instance, "InputChanged", ScriptSignal.new())
    rawset(instance, "InputEnded", ScriptSignal.new())
    rawset(instance, "_InputObjects", {})
    return instance
end

return Class