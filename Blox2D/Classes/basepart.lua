local BasePart = {}
Instance._Dictionary.BasePart = BasePart

local BasePartTable = {
    __setters = {},
    __getters = {},
}
BasePart.Table = BasePartTable
setmetatable(BasePartTable, {__index = Instance.Table})
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
    self:Set("ZIndex", math.floor(value))
end

function BasePartTable.__setters:Parent(value)
    local wasDescendant = self:FindFirstAncestor("workspace")
    --default parent implementation
    Instance.Table.__setters.Parent(self, value)

    if wasDescendant then
        --was descendant of workspace
        if not self:FindFirstAncestor("workspace") then
            --no longer descendant of workspace
            --print("REMOVING FROM DRAW ORDER")
            Blox2D._RemoveFromDrawOrder(self)
            return
        end
    end

    --new parent is descendant of workspace, old parent wasn't
    if value ~= nil and self:FindFirstAncestor("workspace") then
        --print("ADDING TO DRAW ORDER")
        Blox2D._AddToDrawOrder(self)
    end
end

function BasePartTable:Destroy()
    Instance.Table.Destroy(self)
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
    rawset(instance, "_Anchored", true)
    rawset(instance, "_CanCollide", true)
    rawset(instance, "_Massless", false)
    rawset(instance, "_Rotation", 0)
    rawset(instance, "_Position", Vector2.new())
    rawset(instance, "_Size", Vector2.new(100,100))
    rawset(instance, "_ZIndex", 1)
    rawset(instance, "Touched", ScriptSignal.new())
    rawset(instance, "Touchended", ScriptSignal.new())
    
end

return BasePart