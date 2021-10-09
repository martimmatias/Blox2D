local ErrorMessages = {
    __newindex = "Attempted to set Instance property: %s to %s (%s)",
    __setters = "Attempted to set Instance property: %s to %s (%s)",
    ParentSelf = "Attempted to set Instance Parent to itself",
}
local Instance = {}

local Dictionary = {}
Instance._Dictionary = Dictionary

local InstanceTemplate = {
    _Name = "Instance",
    _Children = {}
}
--memory microoptimization cus of string
InstanceTemplate._ClassNames = {InstanceTemplate._Name}

local InstanceTable = {
    __type = "Instance",
    __setters = {},
    __getters = {},
}
Instance.Table = InstanceTable
Instance.__getters_metatable = {__index = InstanceTable.__getters}
Instance.__setters_metatable = {__index = InstanceTable.__setters}

function InstanceTable.__setters:Parent(value)
    local oldValue = rawget(self, "_Parent")
    if value ~= nil then
        Check("Set(Parent)", "table", value, "value")
        assert(typeof(value) == "Instance" or typeof(value) == "Service", ErrorMessages.__setters:format("Parent", tostring(value), type(value) ))
        assert(self ~= value, ErrorMessages.ParentSelf)
        if not value:_AddChild(self) then
            return
        end
    end
    self:Set("Parent", value)
    if oldValue ~= nil then
        oldValue:_RemoveChild(self)
    end
end
function InstanceTable.__setters:Name(value)
    Check("Set(Name)", "string", value, "value")
    self:Set("Name", value)
end
function InstanceTable.__getters:Children()
    return DeepCopy(rawget(self, "_Children"))
end
function InstanceTable.__getters:ClassName()
    local classNames = rawget(self, "_ClassNames")
    return rawget(classNames, #classNames)
end

function InstanceTable:_AddChild(child)
    table.insert(rawget(self, "_Children"), child)
    self.ChildAdded:Fire(child)
    return true
end
function InstanceTable:_RemoveChild(child)
    local children = rawget(self, "_Children")
    for i = #children, 1, -1 do
        if children[i] == child then
            table.remove(children, i)
            self.ChildRemoved:Fire(child)
            break
        end
    end
    return true
end
function InstanceTable:FindFirstChild(name)
    Check("FindFirstChild", "string", name, "name")
    local children = rawget(self, "_Children")
    local i = #children
    while(i > 0 and children[i] ~= nil and children[i].Name ~= name ) do
        i = i - 1
    end
    if i > 0 then
        return children[i]
    end
end
function InstanceTable:FindFirstChildOfClass(className)
    Check("FindFirstChild", "string", className, "className")
    local children = rawget(self, "_Children")
    local i = #children
    while(i > 0 and children[i] ~= nil and children[i]:IsA(className) ~= true) do
        i = i - 1
    end
    if i > 0 then
        return children[i]
    end
end
function InstanceTable:GetChildren()
    return self.Children
end
function InstanceTable:GetFullName()
    local current = self
    local currentString = self.Name
    while(current.Parent ~= nil) do
        current = current.Parent
        currentString = ("%s.%s"):format(current.Name, currentString)--current.Name.."."..currentString
    end
    return currentString
end
function InstanceTable:FindFirstAncestor(name)
    Check("FindFirstAncestor", "string", name, "name")
    local current = self
    while(current.Parent ~= nil and current.Parent.Name ~= name) do
        current = current.Parent
    end
    return current.Parent
end
function InstanceTable:FindFirstAncestorOfClass(className)
    Check("FindFirstAncestor", "string", className, "className")
    local current = self
    while(current.Parent ~= nil and current.Parent:IsA(className) ~= true) do
        current = current.Parent
    end
    return current.Parent
end
function InstanceTable:GetPropertyChangedSignal(property)
    Check("GetPropertyChangedSignal", "string", property, "property")
    local signalName = ("_%s_Signal"):format(property)
    local signal = rawget(self, signalName)
    if signal == nil then
        signal = ScriptSignal.new()
        rawset(self, signalName, signal)
    end
    return signal
end
function InstanceTable:IsA(className)
    return table.find(self._ClassNames, className) ~= nil
end
function InstanceTable:Destroy()
    self.Parent = nil
end
function InstanceTable:Clone()
    error("Instance:Clone() not implemented yet!")
end

function InstanceTable:Set(index, value)
    --local oldValue = self.index
    --local _index = "_"..index
    rawset(self, "_"..index, value)
    self.Changed:Fire(index)
    --local signalName = ("_%s_Signal"):format(index)
    local signal = rawget(self, ("_%s_Signal"):format(index))--signalName)
    if signal ~= nil then
        signal:Fire()
    end
end
function InstanceTable:Get(index)
    return rawget(self, "_"..index)
end

local metatable = {
    __index = function (tbl, key)
        if InstanceTable.__getters[key] then
            return InstanceTable.__getters[key]()
        end
        return rawget(tbl, "_"..key) or InstanceTable[key] or tbl:FindFirstChild(key)
    end,
    __newindex = function(tbl, key, value)
        local setter = tbl.__setters[key]
        if setter ~= nil then
            setter(tbl, value)
            return true
        end
        error(ErrorMessages.__newindex:format(tostring(key), tostring(value), type(value)))
    end,
    __tostring = function(tbl)
        return tbl.Name
    end,
}
Instance.metatable = metatable

Instance.new = function(className, parent)
    local instance = DeepCopy(InstanceTemplate)
    rawset(instance, "Changed", ScriptSignal.new())
    rawset(instance, "ChildAdded", ScriptSignal.new())
    rawset(instance, "ChildRemoved", ScriptSignal.new()) 
    if type(parent) == "table" and typeof(parent) == "Instance" then
        instance.Parent = parent
    end
    if className then
        Dictionary[className].new(instance)
    else
        setmetatable(instance, metatable)
    end
    return instance
end
return Instance