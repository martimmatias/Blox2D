local Class, Table, getters, setters, newFunc = _Inherit(Instance, "Workspace")

function setters:Gravity(value)
    Check("Set(Gravity)", "number", value, "value")
    self:Set("Gravity", value)
end

function setters:FallenPartsDestroyHeight(value)
    Check("Set(FallenPartsDestroyHeight)", "number", value, "value")
    self:Set("FallenPartsDestroyHeight", value)
end

function setters:CurrentCamera(instance)
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

Class.new = function ()
    local instance = newFunc()
    rawset(instance, "_Gravity", 9.8)
    rawset(instance, "_FallenPartsDestroyHeight", -1000)
    instance.ChildRemoved:Connect(function(child)
        if child == rawget(instance, "_CurrentCamera") then
            instance.CurrentCamera = nil
        end
    end)
    return instance
end

return Class