local Class, Table, getters, setters, newFunc = _Inherit(Instance, "Camera")

function setters:Position(vector)
    Check("Set(Position)", "table", vector, "vector")
    if typeof(vector) == "Vector2" then
        self:Set("Position", vector)
    end
end
function setters:Rotation(value)
    Check("Set(Rotation)", "number", value, "value")
    self:Set("Rotation", value)
end

Class.new = function ()
    local instance = newFunc()
    rawset(instance, "_Name", "Camera")
    rawset(instance, "_Position", Vector2.new())
    rawset(instance, "_Rotation", 0)
    rawset(instance, "_ViewportSize", Vector2.new(love.graphics.getDimensions()))
    return instance
end

return Class
--[[local Camera = {}
Instance._Dictionary.Camera = Camera

local Table = {
    __setters = {},
    __getters = {},
}
Camera._Table = Table
setmetatable(Table, {__index = Instance._Table})
setmetatable(Table.__setters, Instance.__setters_metatable)
Camera.__setters_metatable = {__index = Table.__setters}
setmetatable(Table.__getters, Instance.__getters_metatable)
Camera.__getters_metatable = {__index = Table.__getters}

function Table.__setters:Position(vector)
    Check("Set(Position)", "table", vector, "vector")
    if typeof(vector) == "Vector2" then
        self:Set("Position", vector)
    end
end
function Table.__setters:Rotation(value)
    Check("Set(Rotation)", "number", value, "value")
    self:Set("Rotation", value)
end

local metatable = {
    __index = function (tbl, key)
        if Table.__getters[key] then
            return Table.__getters[key]()
        end
        return rawget(tbl, "_"..key) or Table[key] or tbl:FindFirstChild(key)
    end,
    __newindex = Instance._metatable.__newindex,
    __tostring = Instance._metatable.__tostring
}

Camera.new = function(instance)
    setmetatable(instance, metatable)
    table.insert(rawget(instance, "_ClassNames"), "Camera")
    rawset(instance, "_Name", "Camera")
    rawset(instance, "_Position", Vector2.new())
    rawset(instance, "_Rotation", 0)
    rawset(instance, "_ViewportSize", Vector2.new(love.graphics.getDimensions()))
end

return Camera--]]