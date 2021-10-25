local Class, Table, getters, setters, newFunc = _Inherit(require("Blox2D.Classes.guibase2d"), "GuiObject")

--_Layer is private
function getters:Layer()
    return
end

function setters:Parent(value)
    --default parent implementation
    Instance._Table.__setters.Parent(self, value)

    local oldLayerCollector = rawget(self, "_Layer")
    local layerCollector = self:FindFirstAncestorOfClass("LayerCollector")

    if oldLayerCollector ~= nil then
        --was descendant of a LayerCollector
        if layerCollector == nil or layerCollector ~= oldLayerCollector then
            --no longer descendant of a LayerCollector
            --or changed LayerCollector
            oldLayerCollector._Remove(self)
        end
    end
    --new parent is descendant of workspace, old parent wasn't
    if value ~= nil and layerCollector ~= nil then
        layerCollector._Add(self)
    end
    rawset(self, "_Layer", layerCollector)
end

local destroyFunc = Table.Destroy
function Table:Destroy()
    destroyFunc(self)
    rawset(self, "_Layer", nil)
end

function Table:_AncestryChanged(child, parent)
    Instance._Table._AncestryChanged(self, child, parent)

    local oldLayerCollector = rawget(self, "_Layer")
    local layerCollector = self:FindFirstAncestorOfClass("LayerCollector")

    if parent ~= nil then
        if layerCollector ~= oldLayerCollector then
            if oldLayerCollector ~= nil then
                oldLayerCollector._Remove(self)
            end
            if layerCollector ~= nil then
                layerCollector._Add(self)
            end
        end
        rawset(self, "_Layer", layerCollector)
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