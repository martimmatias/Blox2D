local ErrorMessages = {
    __newindex = "Attempted to set Instance property: %s to %s (%s)",
    __setters = "Attempted to set Instance property: %s to %s (%s)",
    ParentSelf = "Attempted to set Instance Parent to itself",
}
local Instance = {}

local classesPath = "Blox2D.Classes."

local InstanceTemplate = {
    _Name = "Instance",
    _Children = {}
}

local InstanceTable = {
    __type = "Instance",
    __setters = {},
    __getters = {},
    _ClassNames = {"Instance"}
}
Instance._Table = InstanceTable
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
    
    --print(("Setting %s's parent to %s"):format(self, value))
    --table.print(self._Children)
    for _, child in pairs(rawget(self, "_Children")) do
        --fire children AncestryChanged
        child:_AncestryChanged(self, value)
        child.AncestryChanged:Fire(self, value)
    end
end
function InstanceTable.__setters:Name(value)
    Check("Set(Name)", "string", value, "value")
    self:Set("Name", value)
end
function InstanceTable.__getters:Children()
    local shallowCopy = {}
    for i, child in pairs(rawget(self, "_Children")) do
        shallowCopy[i] = v
    end
    return shallowCopy
end
function InstanceTable.__getters:ClassName()
    local classNames = self._ClassNames
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
function InstanceTable:_AncestryChanged(child, parent)
    if parent == nil then
        self:Destroy()
    end
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
function InstanceTable:IsDescendantOf(instance)
    Check("IsDescendantOf", "table", instance, "instance")
    local current = self
    while(current.Parent ~= nil and current.Parent ~= instance) do
        current = current.Parent
    end
    return current.Parent ~= nil
end
function InstanceTable:IsAncestorOf(instance)
    return InstanceTable.IsDescendantOf(instance, self)
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

local function _CloneObjectTable(tbl, _clone)
    local vType
    local clone = _clone or {}
    for i, v in pairs(tbl) do
        if type(v) == "table" then
            vType = typeof(v)
            if vType == nil then
                rawset(clone, i, _CloneObjectTable(v))
            elseif vType == "ScriptSignal" then
                rawset(clone, i, ScriptSignal.new())
            elseif vType == "Instance" then
                rawset(clone, i, v:Clone())
            elseif vType == "EnumItem" then
                rawset(clone, i, v)
            else
                rawset(clone, i, setmetatable(DeepCopy(v), getmetatable(v)))
            end
        else
            rawset(clone, i, v)
        end
    end
    return clone
end

function InstanceTable:Clone()
    --error("Instance:Clone() not implemented yet!")
    local clone = Instance.new(self.ClassName)
    _CloneObjectTable(self, clone)
    
    return clone
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
    return true
end

function InstanceTemplate:_SetEnum(index, value, enumType)
    local valueType = type(value)
    local EnumItem

    if valueType == "table" and typeof(value) == "EnumItem" then
        assert(value.EnumType == enumType, Blox2D._ErrorMessages.WrongEnumType:format(value.EnumType, enumType))
        EnumItem = value
    elseif valueType == "number" or valueType == "string" then
        assert(enumType[value] ~= nil, error(Blox2D._ErrorMessages.__newindex:format(self, index, tostring(value), type(value))))
        EnumItem = enumType[value]
    else
        error(Blox2D._ErrorMessages.__newindex:format(self, index, tostring(value), type(value)))
    end
    return self:Set(index, value)
end

function InstanceTable:Get(index)
    return rawget(self, "_"..index)
end

local metatable = {
    __index = function (tbl, key)
        if InstanceTable.__getters[key] then
            return InstanceTable.__getters[key](tbl)
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
Instance._metatable = metatable

Instance.new = function (className, parent)
    local instance
    if className ~= nil then
        Check("Instance.new", "string", className, "className")
        instance = Blox2D._Classes[className].new()
    else
        instance = DeepCopy(InstanceTemplate)
        rawset(instance, "Changed", ScriptSignal.new())
        rawset(instance, "ChildAdded", ScriptSignal.new())
        rawset(instance, "ChildRemoved", ScriptSignal.new())
        rawset(instance, "AncestryChanged", ScriptSignal.new())
    end
    if type(parent) == "table" and typeof(parent) == "Instance" then
        instance.Parent = parent
    end
    return instance
end

function _Inherit(parentClass, newClassName, __getters_metatable, __setters_metatable)
    if not parentClass or not newClassName then
        error()
    end
    local newClass = {}
    newClass._Table = setmetatable({
        __type = parentClass._Table.__type,
        __getters = setmetatable({}, parentClass.__getters_metatable),
        __setters = setmetatable({}, parentClass.__setters_metatable),
        _ClassNames = DeepCopy(parentClass._Table._ClassNames)
    }, {__index = parentClass._Table})

    local Table = newClass._Table
    table.insert(Table._ClassNames, newClassName)
    local getters = Table.__getters
    newClass.__getters_metatable = __getters_metatable or {__index = Table.__getters}
    newClass.__setters_metatable = __setters_metatable or {__index = Table.__setters}

    
    newClass._metatable = {
        __index = function (tbl, key)
            if getters[key] then
                return getters[key](tbl)
            end
            return rawget(tbl, "_"..key) or Table[key] or Instance._Table.FindFirstChild(tbl, key)
            --tbl:FindFirstChild(key)
        end,
        __newindex = parentClass._metatable.__newindex,
        __tostring = parentClass._metatable.__tostring,
    }


    return newClass, Table, getters, Table.__setters, function ()
        local instance = parentClass.new()
        setmetatable(instance, newClass._metatable)
        rawset(instance, "_Name", newClassName)
        return instance
    end
end
return Instance