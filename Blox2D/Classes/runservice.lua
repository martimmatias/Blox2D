local Class, Table, getters, setters, newFunc = _Inherit(Instance, "RunService", Instance.__getters_metatable, Instance.__setters_metatable)
--table.print(testClass)

function Table:IsRunning()
    return true
end

function Table:Stop()
    love.event.quit()
end

function Table:Destroy()
    error(Blox2D._ErrorMessages.CantCollonFunction:format("Destroy", tostring(self)))
end

Class.new = function ()
    local instance = newFunc()
    rawset(instance, "PreRender", ScriptSignal.new())
    rawset(instance, "RenderStepped", ScriptSignal.new())
    rawset(instance, "Stepped", ScriptSignal.new())
    rawset(instance, "Heartbeat", ScriptSignal.new())
    rawset(instance, "PreAnimation", ScriptSignal.new())
    rawset(instance, "PreSimulation", ScriptSignal.new())
    rawset(instance, "PostSimulation", ScriptSignal.new())
    return instance
end

return Class