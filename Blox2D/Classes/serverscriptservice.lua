local Class, Table, getters, setters, newFunc = _Inherit(Instance, "ServerScriptService")

Class.new = function ()
    local instance = newFunc()
    rawset(instance, "_LoadStringEnabled", true)
    return instance
end

return Class