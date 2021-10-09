local DataModel = {}
Instance._Dictionary.DataModel = DataModel

local DataModelTable = {
    __setters = {},
    __getters = {},
}
DataModel.Table = DataModelTable
setmetatable(DataModelTable, {__index = Instance._Dictionary.ServiceProvider.Table})
setmetatable(DataModelTable.__setters, Instance._Dictionary.ServiceProvider.__setters_metatable)
setmetatable(DataModelTable.__getters, Instance._Dictionary.ServiceProvider.__getters_metatable)

function DataModelTable:BindToClose(func)
    Check("BindToClose", "function", func, "function")
    rawget(self, "_Close"):Connect(func)
end

local metatable = {
    __index = function (tbl, key)
        if DataModelTable.__getters[key] then
            return DataModelTable.__getters[key]()
        end
        return rawget(tbl, "_"..key) or DataModelTable[key] or tbl:FindFirstChild(key)
    end,
    __newindex = Instance.metatable.__newindex,
    __tostring = Instance.metatable.__tostring
}

DataModel.new = function(instance)
    Instance._Dictionary.ServiceProvider.new(instance)
    setmetatable(instance, metatable)
    table.insert(rawget(instance, "_ClassNames"), "DataModel")
    instance.Name = "DataModel"
    rawset(instance, "_Close", ScriptSignal.new())
end

return DataModel