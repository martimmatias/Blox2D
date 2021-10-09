local Vector3 = {}
local ErrorMessages = {
    __add = "Attempted add operation on Vector3 and %s (%s)",
    __sub = "Attempted subtract operation on Vector3 and %s (%s)",
    __mul = "Attempted multiply operation on Vector3 and %s (%s)",
    __div = "Attempted div operation on Vector3 and %s (%s)",
    __newindex = "Attempted to set Vector3.%s to %s (%s)",
    Dot = "Attempted :Dot() operation on Vector3 and %s (%s)",
    Cross = "Attempted :Cross() operation on Vector3 and %s (%s)",
    Lerp = "Attempted :Lerp() method on Vector3 with goal %s (%s) and alpha %s (%s)",
    NotImplemented = "%s is not implemented yet D: Sorry lol"
}
local Vector3Table = {
    __type = "Vector3",
}
function Vector3Table:Dot(otherVector)
    if Vector3.Is(otherVector) then
        return (self.X*otherVector.X) + (self.Y*otherVector.Y) + (self.Z*otherVector.Z)
    end
    error(ErrorMessages.Dot:format(tostring(otherVector), type(otherVector)))
end
function Vector3Table:Cross(otherVector)
    if Vector3.Is(otherVector) then
        local resultVector = Vector3.new(
        self.Y*otherVector.Z - self.Z*otherVector.Y,
        self.Z*otherVector.X - self.X*otherVector.Z,
        self.X*otherVector.Y - self.Y*otherVector.X
        )
        return resultVector
    end
    error(ErrorMessages.Cross:format(tostring(otherVector), type(otherVector)))
end
function Vector3Table:Lerp(goalVector, alpha)
    if Vector3.Is(goalVector) then
        local AB = goalVector-self
        return self+AB*alpha
    end
    error(ErrorMessages.Lerp:format(
        tostring(goalVector), type(goalVector), tostring(alpha), type(alpha)
    ))
end
function Vector3Table:FuzzyEq(otherVector, epsilon)
    error(ErrorMessages.NotImplemented:format("Vector3:FuzzyEq(other Vector3, epsilon)"))
end

function Magnitude(vector)
    --if Vector3.Is(vector) then
        return math.sqrt(vector.X^2 + vector.Y^2 + vector.Z^2)
    --end
end
function Unit(vector)
    --if Vector3.Is(vector) then
        return vector/vector.Magnitude
    --end
end

local metatable = {
    __index = function (tbl, key)
        if key == "Magnitude" then
            return Magnitude(tbl)
        elseif key == "Unit" then
            return Unit(tbl)
        end
        return Vector3Table[key]
    end,
    __add = function(tbl, value)
        if Vector3.Is(value) then
            local vector = Vector3.new(tbl.X + value.X, tbl.Y + value.Y, tbl.Z + value.Z)
            return vector
        end
        error(ErrorMessages.__add:format(tostring(value), type(value)))
    end,
    __sub = function(tbl, value)
        if Vector3.Is(value) then
            local vector = Vector3.new(tbl.X - value.X, tbl.Y - value.Y, tbl.Z - value.Z)
            return vector
        end
        error(ErrorMessages.__sub:format(tostring(value), type(value)))
    end,
    __mul = function (tbl, value)
        if Vector3.Is(value) then
            local vector = Vector3.new(tbl.X * value.X, tbl.Y * value.Y, tbl.Z * value.Z)
            return vector
        elseif type(value) == "number" then
            local vector = Vector3.new(tbl.X *value, tbl.Y *value, tbl.Z * value)
            return vector
        end
        error(ErrorMessages.__mul:format(tostring(value), type(value)))
    end,
    __div = function (tbl, value)
        if Vector3.Is(value) then
            local vector = Vector3.new(tbl.X / value.X, tbl.Y / value.Y, tbl.Z / value.Z)
            return vector
        elseif type(value) == "number" then
            local vector = Vector3.new(tbl.X / value, tbl.Y / value, tbl.Z / value)
            return vector
        end
        error(ErrorMessages.__div:format(tostring(value), type(value)))
    end,
    __eq = function(tbl, value)
        return Vector3.Is(value) and tbl.X == value.X and tbl.Y == value.Y and tbl.Z == value.Z;
     end,
    __newindex = function(table, index, value)
        error(ErrorMessages.__newindex:format(tostring(index), tostring(value), type(value)))
    end,
    __tostring = function(tbl)
        return ("%d,%d,%d"):format(tbl.X, tbl.Y, tbl.Z)
    end,
}

Vector3.new = function(x, y, z)
    local vector = {
        X = x or 0,
        Y = y or 0,
        Z = z or 0
    }
    setmetatable(vector, metatable)
    return vector
end

Vector3.Is = function(tbl)
    return type(tbl) == "table" and tbl.__type == "Vector3"
end
return Vector3