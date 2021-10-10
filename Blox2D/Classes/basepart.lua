local BasePart = {}
Instance._Dictionary.BasePart = BasePart

local BasePartTable = {
    __setters = {},
    __getters = {},
}
BasePart._Table = BasePartTable
setmetatable(BasePartTable, {__index = Instance._Table})
setmetatable(BasePartTable.__setters, Instance.__setters_metatable)
BasePart.__setters_metatable = {__index = BasePartTable.__setters}
setmetatable(BasePartTable.__getters, Instance.__getters_metatable)
BasePart.__getters_metatable = {__index = BasePartTable.__getters}

function BasePartTable.__setters:Anchored(value)
    Check("Set(Anchored)", "boolean", value, "value")
    self:Set("Anchored", value)
end
function BasePartTable.__setters:CanCollide(value)
    Check("Set(CanCollide)", "boolean", value, "value")
    self:Set("CanCollide", value)
end
function BasePartTable.__setters:Massless(value)
    Check("Set(Massless)", "boolean", value, "value")
    self:Set("Massless", value)
end
function BasePartTable.__setters:Rotation(value)
    Check("Set(Rotation)", "number", value, "value")
    self:Set("Rotation", value)
end
function BasePartTable.__setters:Transparency(value)
    Check("Set(Transparency)", "number", value, "value")
    self:Set("Transparency", value)
end
function BasePartTable.__setters:Position(vector)
    Check("Set(Position)", "table", vector, "vector")
    if typeof(vector) == "Vector2" then
        self:Set("Position", vector)
    end
end
function BasePartTable.__setters:Size(vector)
    Check("Set(Size)", "table", vector, "vector")
    if typeof(vector) == "Vector2" then
        self:Set("Size", vector)
    end
end
function BasePartTable.__setters:ZIndex(value)
    Check("Set(ZIndex)", "number", value, "value")
    local oldValue = rawget(self, "_ZIndex")
    self:Set("ZIndex", math.floor(value))
    if oldValue ~= rawget(self, "_ZIndex") and self:FindFirstAncestor("workspace") then
        --value changed
        Blox2D._UpdateDrawOrder(self)
    end
end
function BasePartTable.__setters:BrickColor(brickColor)
    Check("Set(BrickColor)", "table", brickColor, "brickColor")
    if typeof(brickColor) == "BrickColor" then
        self:Set("BrickColor", brickColor)
        self:Set("Color", brickColor.Color)--considering cloning instead 🤔
    end
end
function BasePartTable.__setters:Color(color)
    Check("Set(Color)", "table", color, "color")
    if typeof(color) == "Color3" then
        self:Set("Color", color)
        self:Set("BrickColor", BrickColor.new(color))
    end
end

function BasePartTable.__setters:Parent(value)
    --local wasDescendant = self:FindFirstAncestor("workspace")
    --default parent implementation
    Instance._Table.__setters.Parent(self, value)

    local isDescendant = self:IsDescendantOf(workspace)
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

function BasePartTable:_AncestryChanged(child, parent)
    Instance._Table._AncestryChanged(self, child, parent)
    local isDescendant = parent == workspace or child:IsDescendantOf(workspace)

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

function BasePartTable:Destroy()
    print("destroying self :)")
    Instance._Table.Destroy(self)
    --
end

local metatable = {
    __index = function (tbl, key)
        if BasePartTable.__getters[key] then
            return BasePartTable.__getters[key]()
        end
        return rawget(tbl, "_"..key) or BasePartTable[key] or tbl:FindFirstChild(key)
    end,
    __newindex = Instance.metatable.__newindex,
    __tostring = Instance.metatable.__tostring
}

BasePart.new = function(instance)
    setmetatable(instance, metatable)
    table.insert(rawget(instance, "_ClassNames"), "BasePart")
    instance.Name = "BasePart"
    rawset(instance, "__Draw", false)
    rawset(instance, "_Anchored", true)
    rawset(instance, "_CanCollide", true)
    rawset(instance, "_Massless", false)
    rawset(instance, "_Rotation", 0)
    rawset(instance, "_Position", Vector2.new())
    rawset(instance, "_Size", Vector2.new(100,100))
    rawset(instance, "_ZIndex", 1)
    rawset(instance, "_Transparency", 0)
    rawset(instance, "_BrickColor", BrickColor.new())
    rawset(instance, "_Color", instance.BrickColor.Color)
    rawset(instance, "Touched", ScriptSignal.new())
    rawset(instance, "Touchended", ScriptSignal.new())
    --table.print(instance)
    
end

return BasePart