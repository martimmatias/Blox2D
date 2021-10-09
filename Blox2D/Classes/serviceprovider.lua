local ServiceProvider = {}
Instance._Dictionary.ServiceProvider = ServiceProvider

ServiceProvider._Services = {}

local ServiceProviderTable = {
    __setters = {},
    __getters = {},
}
ServiceProvider.Table = ServiceProviderTable
setmetatable(ServiceProviderTable, {__index = Instance.Table})
setmetatable(ServiceProviderTable.__setters, Instance.__setters_metatable)
ServiceProvider.__setters_metatable = {__index = ServiceProviderTable.__setters}
setmetatable(ServiceProviderTable.__getters, Instance.__getters_metatable)
ServiceProvider.__getters_metatable = {__index = ServiceProviderTable.__getters}

function ServiceProviderTable:_AddService(service)
    ServiceProvider._Services[service.Name] = service
end

function ServiceProviderTable:GetService(name)
    Check("GetService", "string", name, "name")
    local serviceClass = Instance._Dictionary[name]
    if serviceClass ~= nil then
        local service = ServiceProvider._Services[name]
        if service == nil then
            service = Instance.new(name)
            service.Parent = self
            self:_AddService(service)
        end
        return service
    end
    error((":GetService() called with %s (%s)"):format(name, "string"))
end

function ServiceProviderTable:FindService(name)
    Check("FindService", "string", name, "name")
    local serviceClass = Instance._Dictionary[name]
    if serviceClass ~= nil then
        return ServiceProvider._Services[name]
    end
end

local metatable = {
    __index = function (tbl, key)
        if ServiceProviderTable.__getters[key] then
            return ServiceProviderTable.__getters[key]()
        end
        return rawget(tbl, "_"..key) or ServiceProviderTable[key] or tbl:FindFirstChild(key)
    end,
    __newindex = Instance.metatable.__newindex,
    __tostring = Instance.metatable.__tostring
}

ServiceProvider.new = function(instance)
    setmetatable(instance, metatable)
    table.insert(rawget(instance, "_ClassNames"), "ServiceProvider")
    instance.Name = "ServiceProvider"
end

return ServiceProvider