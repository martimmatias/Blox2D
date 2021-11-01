local Class, Table, getters, setters, newFunc = _Inherit(require("Blox2D.Classes.serviceprovider"), "DataModel")

function Table:BindToClose(func)
    Check("BindToClose", "function", func, "function")
    rawget(self, "_Close"):Connect(func)
end

function Table:Destroy()
    error(Blox2D._ErrorMessages.CantCollonFunction:format("Destroy", tostring(self)))
end

Class.new = function ()
    local instance = newFunc()
    rawset(instance, "_Close", ScriptSignal.new())
    return instance
end

return Class