local Class, Table, getters, setters, newFunc = _Inherit(require("Blox2D.Classes.guibase2d"), "GuiObject")

function setters:Parent(value)
    --local wasDescendant = self:FindFirstAncestor("workspace")
    --default parent implementation
    Instance._Table.__setters.Parent(self, value)

    local isDescendant = self:FindFirstAncestorOfClass("LayerCollector") and self:IsDescendantOf(game)

    if rawget(self, "__Draw") then
        --was descendant of workspace
        if isDescendant == false then
            --no longer descendant of workspace
            --print("REMOVING FROM DRAW ORDER")
            rawset(self, "__Draw", false)
            Blox2D._RemoveFromDrawOrder(self)
            return
        end
    end

    --new parent is descendant of workspace, old parent wasn't
    if value ~= nil and isDescendant == true then
        --print("ADDING TO DRAW ORDER")
        rawset(self, "__Draw", true)
        Blox2D._AddToDrawOrder(self)
    end
end

function Table:_AncestryChanged(child, parent)
    Instance._Table._AncestryChanged(self, child, parent)
    local isDescendant = self:FindFirstAncestorOfClass("LayerCollector") and self:IsDescendantOf(game)

    if parent ~= nil then
        if isDescendant == true then
            --print("ADDING TO DRAW ORDER")
            Blox2D._AddToDrawOrder(self)
        else
            --print("REMOVING FROM DRAW ORDER")
            Blox2D._RemoveFromDrawOrder(self)
        end
        rawset(self, "__Draw", isDescendant)
    end
end


Class.new = function()
    local instance = newFunc()
    rawset(instance, "_AnchorPoint", Vector2.new())
    rawset(instance, "_BackgroundColor3", Color3.new(1,1,1))
    rawset(instance, "_BackgroundTransparency", 0)
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