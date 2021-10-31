local Class, Table, getters, setters, newFunc = _Inherit(require("Blox2D.Classes.guibase2d"), "GuiObject")

--_Layer is private
function getters:Layer()
    return nil
end

local function UpdateSize(self, udim2)
    if self._Parent then
        local parentSize = self._Parent._AbsoluteSize
        
        self.AbsoluteSize = Vector2.new(
            (parentSize.X*udim2.X.Scale) + (udim2.X.Offset),
            (parentSize.Y*udim2.Y.Scale) + (udim2.Y.Offset)
        )
        return true
    end
end

local function UpdatePosition(self, udim2)
    if self._Parent then
        local parentPos = self._Parent._AbsolutePosition
        local parentSize = self._Parent._AbsoluteSize
        self.AbsolutePosition = Vector2.new(
            (parentSize.X*udim2.X.Scale) + (udim2.X.Offset) + (parentPos.X),
            (parentSize.Y*udim2.Y.Scale) + (udim2.Y.Offset) + (parentPos.Y)
        )
        return true
    end
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
            oldLayerCollector:_Remove(self)
        end
    end
    --new parent is descendant of workspace, old parent wasn't
    if value ~= nil and layerCollector ~= nil then
        layerCollector:_Add(self)
        UpdateSize(self, self._Size)
        UpdatePosition(self, self._Position)
    end
    rawset(self, "_Layer", layerCollector)
end

function setters:Size(udim2)
    Check("Set(Size)", "table", udim2, "udim2")
    assert(typeof(udim2) == "UDim2")
    self:Set("Size", udim2)
    return UpdateSize(self, udim2)
    --Blox2D._ErrorMessages.__newindex:format(tostring(self), "Size", tostring(udim2), type(udim2))
end

function setters:Position(udim2)
    Check("Set(Position)", "table", udim2, "udim2")
    --assert(typeof(udim2) == "UDim2", Blox2D._ErrorMessages.__newindex:format(tostring(self),"Position", tostring(udim2), type(udim2)))
    self:Set("Position", udim2)
    return UpdatePosition(self, udim2)
end

function setters:Rotation(value)
    Check("Set(Rotation)", "number", value, "value")
    self:Set("Rotation", value)
end

function setters:BorderSizePixel(value)
    Check("Set(BorderSizePixel)", "number", value, "value")
    self:Set("BorderSizePixel", value)
end

function setters:BackgroundColor3(color)
    Check("Set(BackgroundColor3)", "table", color, "color")
    if typeof(color) == "Color3" then
        self:Set("BackgroundColor3", color)
    end
end

function setters:BorderColor3(color)
    Check("Set(BorderColor3)", "table", color, "color")
    if typeof(color) == "Color3" then
        self:Set("BorderColor3", color)
    end
end

local destroyFunc = Table.Destroy
function Table:Destroy()
    destroyFunc(self)
    rawset(self, "_Layer", nil)
end

function Table:_AbsoluteSizeChanged()
    UpdateSize(self, self._Size)
    for _, child in pairs(self._Children) do
        if child:IsA("GuiObject") then
            child:_AbsoluteSizeChanged()
        end
    end
end

function Table:_AbsolutePositionChanged()
    UpdatePosition(self, self._Position)
    for _, child in pairs(self._Children) do
        if child:IsA("GuiObject") then
            child:_AbsolutePositionChanged()
        end
    end
end

function Table:_AncestryChanged(child, parent)
    Instance._Table._AncestryChanged(self, child, parent)

    local oldLayerCollector = rawget(self, "_Layer")
    local layerCollector = self:FindFirstAncestorOfClass("LayerCollector")

    if parent ~= nil then
        if layerCollector ~= oldLayerCollector then
            if oldLayerCollector ~= nil then
                oldLayerCollector:_Remove(self)
            end
            if layerCollector ~= nil then
                layerCollector:_Add(self)
            end
        end
        rawset(self, "_Layer", layerCollector)
    end
end

function Table:_Draw()
    if self._Visible == true then
        love.graphics.push()

        local size = self._AbsoluteSize
        local position = self._AbsolutePosition
        
        love.graphics.translate(position.X, position.Y)
        love.graphics.translate(size.X/2, size.Y/2)
        love.graphics.rotate(math.rad(rawget(self, "_Rotation")))
        love.graphics.translate(-size.X/2, -size.Y/2)
        --outline
        if rawget(self, "_BorderSizePixel") > 0 then
            love.graphics.push()
            local borderSize = rawget(self, "_BorderSizePixel")
            local outlineSize = size+Vector2.new(borderSize, borderSize)

            love.graphics.translate(-borderSize/2, -borderSize/2)
            love.graphics.setColor(
                rawget(self, "_BorderColor3").R,
                rawget(self, "_BorderColor3").G,
                rawget(self, "_BorderColor3").B,
                1-rawget(self, "_BackgroundTransparency")
            )
            love.graphics.rectangle(
                "fill",
                0,
                0,
                outlineSize.X,
                outlineSize.Y
            )
            love.graphics.pop()
        end
        
        love.graphics.setColor(
            rawget(self, "_BackgroundColor3").R,
            rawget(self, "_BackgroundColor3").G,
            rawget(self, "_BackgroundColor3").B,
            1-rawget(self, "_BackgroundTransparency")
        )
        love.graphics.rectangle(
            "fill",
            0,
            0,
            size.X,
            size.Y
        )
        
        
        love.graphics.pop()

        for i, child in pairs(rawget(self, "_Children")) do
            if child._Draw ~= nil then
                child:_Draw()
            end
        end
    end
end

Class.new = function()
    local instance = newFunc()
    rawset(instance, "_AnchorPoint", Vector2.new())
    rawset(instance, "_BackgroundColor3", Color3.new(1,1,1))
    rawset(instance, "_BackgroundTransparency", 0)
    rawset(instance, "_BorderColor3", Color3.new(0,0,0))
    rawset(instance, "_BorderSizePixel", 1)
    rawset(instance, "_ClipDescendants", false)
    rawset(instance, "_LayoutOrder", 0)
    rawset(instance, "_Rotation", 0)
    rawset(instance, "_Visible", true)
    rawset(instance, "_ZIndex", 0)

    instance.Size = UDim2.fromOffset(200, 100)
    instance.Position = UDim2.new()
    --rawset(instance, "", )
    return instance
end

return Class