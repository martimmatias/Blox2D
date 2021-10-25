local Class, Table, getters, setters, newFunc = _Inherit(Instance, "BasePlayerGui", Instance.__getters_metatable, Instance.__setters_metatable)

function Table:GetGuiObjectsAtPosition(x, y)

end

Class.new = function ()
    return newFunc()
end

return Class