local Class, Table, getters, setters, newFunc = _Inherit(Instance, "Player")

Class.new = function ()
    local instance = newFunc()
    rawset(instance, "_AccountAge", 1000)
    rawset(instance, "_UserId", 1)
    rawset(instance, "CharacterAdded", ScriptSignal.new())
    rawset(instance, "CharacterAppearanceLoaded", ScriptSignal.new())
    rawset(instance, "CharacterRemoving", ScriptSignal.new())
    return instance
end

return Class