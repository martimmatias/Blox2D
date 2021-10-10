local Workspace = {}
Instance._Dictionary.Workspace = Workspace

local WorkspaceTable = {
    __setters = {},
    __getters = {},
}
Workspace._Table = WorkspaceTable
setmetatable(WorkspaceTable, {__index = Instance._Table})
setmetatable(WorkspaceTable.__setters, Instance.__setters_metatable)
Workspace.__setters_metatable = {__index = WorkspaceTable.__setters}
setmetatable(WorkspaceTable.__getters, Instance.__getters_metatable)
Workspace.__getters_metatable = {__index = WorkspaceTable.__getters}

function WorkspaceTable.__setters:Gravity(value)
    Check("Set(Gravity)", "number", value, "value")
    WorkspaceTable:Set("Gravity", value)
end

function WorkspaceTable.__setters:FallenPartsDestroyHeight(value)
    Check("Set(FallenPartsDestroyHeight)", "number", value, "value")
    WorkspaceTable:Set("FallenPartsDestroyHeight", value)
end

function WorkspaceTable.__setters:CurrentCamera(instance)
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
    WorkspaceTable:Set("CurrentCamera", instance)
end

function WorkspaceTable:Destroy()
    error(Blox2D._ErrorMessages.CollonFunction:format("Destroy"))
end

local metatable = {
    __index = function (tbl, key)
        if WorkspaceTable.__getters[key] then
            return WorkspaceTable.__getters[key]()
        end
        return rawget(tbl, "_"..key) or WorkspaceTable[key] or Instance._Table.FindFirstChild(tbl, key)
        --tbl:FindFirstChild(key)
    end,
    __newindex = Instance.metatable.__newindex,
    __tostring = Instance.metatable.__tostring
}

Workspace.new = function(instance)
    setmetatable(instance, metatable)
    table.insert(rawget(instance, "_ClassNames"), "Workspace")
    rawset(instance, "_Gravity", 9.8)
    rawset(instance, "_FallenPartsDestroyHeight", -1000)
    instance.Name = "Workspace"
end

return Workspace