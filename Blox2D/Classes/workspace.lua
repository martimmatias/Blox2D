local Workspace = {}
Instance._Dictionary.Workspace = Workspace

local WorkspaceTable = {
    __setters = {},
    __getters = {},
}
Workspace.Table = WorkspaceTable
setmetatable(WorkspaceTable, {__index = Instance.Table})
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

function WorkspaceTable:GetService(name)

end

local metatable = {
    __index = function (tbl, key)
        if WorkspaceTable.__getters[key] then
            return WorkspaceTable.__getters[key]()
        end
        return rawget(tbl, "_"..key) or WorkspaceTable[key]
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