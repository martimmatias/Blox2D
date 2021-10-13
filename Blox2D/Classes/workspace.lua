local Workspace = {}
Instance._Dictionary.Workspace = Workspace

local Table = {
    __setters = {},
    __getters = {},
}
Workspace._Table = Table
setmetatable(Table, {__index = Instance._Table})
setmetatable(Table.__setters, Instance.__setters_metatable)
Workspace.__setters_metatable = {__index = Table.__setters}
setmetatable(Table.__getters, Instance.__getters_metatable)
Workspace.__getters_metatable = {__index = Table.__getters}

function Table.__setters:Gravity(value)
    Check("Set(Gravity)", "number", value, "value")
    self:Set("Gravity", value)
end

function Table.__setters:FallenPartsDestroyHeight(value)
    Check("Set(FallenPartsDestroyHeight)", "number", value, "value")
    self:Set("FallenPartsDestroyHeight", value)
end

function Table.__setters:CurrentCamera(instance)
    local currentCamera = rawget(self, "_CurrentCamera")
    if currentCamera == instance then
        --setting to current value
        return
    end
    if instance == nil then
        instance = Instance.new("Camera")
        instance.Parent = self
    else
        Check("Set(CurrentCamera)", "table", instance, "instance")
        assert(instance:IsA("Camera"), Blox2D._ErrorMessages.__newindex:format(
            self, "CurrentCamera", tostring(instance), type(instance)))
        assert(rawget(instance, "_Parent") == self, "CurrentCamera must be a child of workspace")
    end
    self:Set("CurrentCamera", instance)
end

function Table:Destroy()
    error(Blox2D._ErrorMessages.CantCollonFunction:format("Destroy", tostring(self)))
end

local metatable = {
    __index = function (tbl, key)
        if Table.__getters[key] then
            return Table.__getters[key]()
        end
        return rawget(tbl, "_"..key) or Table[key] or Instance._Table.FindFirstChild(tbl, key)
        --tbl:FindFirstChild(key)
    end,
    __newindex = Instance._metatable.__newindex,
    __tostring = Instance._metatable.__tostring
}

Workspace.new = function(instance)
    setmetatable(instance, metatable)
    table.insert(rawget(instance, "_ClassNames"), "Workspace")
    rawset(instance, "_Gravity", 9.8)
    rawset(instance, "_FallenPartsDestroyHeight", -1000)
    instance.Name = "Workspace"
    instance.ChildRemoved:Connect(function(child)
        if child == rawget(instance, "_CurrentCamera") then
            instance.CurrentCamera = nil
        end
    end)
end

return Workspace