local Class, Table, getters, setters, newFunc = _Inherit(Instance, "ServiceProvider")

Class._Services = {}

function Table:_AddService(service)
    Class._Services[service.ClassName] = service
end

function Table:GetService(name)
    Check("GetService", "string", name, "name")
    local serviceClass = Blox2D._Classes[name]
    if serviceClass ~= nil then
        local service = Class._Services[name]
        if service == nil then
            service = Instance.new(name)
            service.Parent = self
            self:_AddService(service)
        end
        return service
    end
    error((":GetService() called with %s (%s)"):format(name, "string"))
end

function Table:FindService(name)
    Check("FindService", "string", name, "name")
    local serviceClass = Instance._Dictionary[name]
    if serviceClass ~= nil then
        return Class._Services[name]
    end
end

function Class.new()
    return newFunc()
end

return Class