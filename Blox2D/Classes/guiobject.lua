local Class, Table, getters, setters, newFunc = _Inherit(require("Blox2D.Classes.guibase2d"), "GuiObject")

Class.new = function()
    local instance = newFunc()
    rawset(instance, "_AnchorPoint", Vector2.new())
    rawset(instance, "_BackgroundColor3", Color3.new(1,1,1))
    rawset(instance, "_BackgroundTransparency", )
    rawset(instance, "_BorderColor3", Color3.new())
    rawset(instance, "_BorderSizePixel", 0)
    rawset(instance, "_ClipDescendants", false)
    rawset(instance, "_LayoutOrder", 0)
    rawset(instance, "_Position", UDim2.new(0, 0))
    rawset(instance, "_Rotation", 0)
    rawset(instance, "_Size", UDim2.fromOffset(200, 100))
    rawset(instance, "_Visible", true)
    rawset(instance, "_ZIndex", 0)
    --rawset(instance, "", )
    return instance
end

return Class