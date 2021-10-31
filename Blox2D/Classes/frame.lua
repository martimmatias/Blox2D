local Class, Table, getters, setters, newFunc = _Inherit(require("Blox2D.Classes.guiobject"), "Frame")

Class.new = function ()
    return newFunc()
end

return Class