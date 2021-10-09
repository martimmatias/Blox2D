local Vector2 = {}
local ErrorMessages = {
    Dot = "Attempted :Dot() operation on Vector2 and %s (%s)",
    Cross = "Attempted :Cross() operation on Vector2 and %s (%s)",
    Lerp = "Attempted :Lerp() method on Vector2 with goal %s (%s) and alpha %s (%s)",
}
local Vector2Table = {
    __type = "Vector2",
}
function Vector2Table:Dot(otherVector)
    Check(":Dot(otherVector Vector2)", "table", otherVector, "otherVector")
    if Vector2._Is(otherVector) then
        return (self.X*otherVector.X) + (self.Y*otherVector.Y)
    end
    error(Blox2D._ErrorMessages.CollonFunction:format("Dot"))
end

function Vector2Table:Cross(otherVector)
    Check(":Cross(otherVector Vector2)", "table", otherVector, "otherVector")
    if Vector2._Is(otherVector) then
        return self.X*otherVector.Y - self.Y*otherVector.X
    end
    error(Blox2D._ErrorMessages.CollonFunction:format("Cross"))
end

function Vector2Table:Lerp(goalVector, alpha)
    Check(":Lerp(goal Vector2, number alpha)", "table", goalVector, "goal", "number", alpha, "alpha")
    if Vector2._Is(goalVector) then
        local AB = goalVector-self
        return self+AB*alpha
    end
    error(Blox2D._ErrorMessages.CollonFunction:format("Lerp"))
end
function Vector2Table:FuzzyEq(otherVector, epsilon)
    error(Blox2D._ErrorMessages.NotImplemented:format("Vector2:FuzzyEq(otherVector Vector2,number epsilon)"))
end

function Magnitude(vector)
    --if Vector3.Is(vector) then
        return math.sqrt(vector.X^2 + vector.Y^2)
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
        return Vector2Table[key]
    end,
    __add = function(tbl, value)
        if Vector2._Is(value) then
            local vector = Vector2.new(tbl.X + value.X, tbl.Y + value.Y)
            return vector
        end
        error(Blox2D._ErrorMessages.__add:format(Vector2Table.__type, tostring(value), type(value)))
    end,
    __sub = function(tbl, value)
        if Vector2._Is(value) then
            local vector = Vector2.new(tbl.X - value.X, tbl.Y - value.Y)
            return vector
        end
        error(Blox2D._ErrorMessages.__sub:format(Vector2Table.__type, tostring(value), type(value)))
    end,
    __mul = function (tbl, value)
        if Vector2._Is(value) then
            local vector = Vector2.new(tbl.X * value.X, tbl.Y * value.Y)
            return vector
        elseif type(value) == "number" then
            local vector = Vector2.new(tbl.X *value, tbl.Y *value)
            return vector
        end
        error(Blox2D._ErrorMessages.__mul:format(Vector2Table.__type, tostring(value), type(value)))
    end,
    __div = function (tbl, value)
        if Vector2._Is(value) then
            local vector = Vector2.new(tbl.X / value.X, tbl.Y / value.Y)
            return vector
        elseif type(value) == "number" then
            local vector = Vector2.new(tbl.X / value, tbl.Y / value)
            return vector
        end
        error(Blox2D._ErrorMessages.__div:format(Vector2Table.__type, tostring(value), type(value)))
    end,
    __eq = function(tbl, value)
        return Vector2._Is(value) and tbl.X == value.X and tbl.Y == value.Y;
     end,
    __newindex = function(table, index, value)
        error(Blox2D._ErrorMessages.__newindex:format(Vector2Table.__type, tostring(index), tostring(value), type(value)))
    end,
    __tostring = function(tbl)
        return ("%d,%d"):format(tbl.X, tbl.Y)
    end,
}

Vector2.new = function(x, y)
    local vector = {
        X = x or 0,
        Y = y or 0
    }
    setmetatable(vector, metatable)
    return vector
end


Vector2._Is = function(tbl)
    return type(tbl) == "table" and tbl.__type == "Vector2"
end
return Vector2