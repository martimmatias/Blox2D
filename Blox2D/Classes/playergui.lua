local Class, Table, getters, setters, newFunc = _Inherit(require("Blox2D.Classes.baseplayergui"), "PlayerGui")

Class.new = function ()
    local instance = newFunc()

    return instance
end

return Class