local Class, Table, getters, setters, newFunc = _Inherit(Instance, "ReplicatedStorage")

Class.new = function ()
    return newFunc()
end

return Class