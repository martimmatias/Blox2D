--local UDim = require("udim")
local UDim2 = {}
local UDim2Table = {
    __type = "UDim2",
}

function UDim2Table:Lerp(goalVector, alpha)
    Check(":Lerp(goal UDim2, number alpha)", "table", goalVector, "goal", "number", alpha, "alpha")
    if UDim2._Is(goalVector) then
        local AB = goalVector-self
        return self+AB*alpha
    end
    error(Blox2D._ErrorMessages.CollonFunction:format("Lerp"))
end


local metatable = {
    __index = function (tbl, key)
        return UDim2Table[key]
    end,
    __add = function(tbl, value)
        if UDim2._Is(value) then
            local udim2 = UDim2.fromUDims(tbl.X+value.X, tbl.Y+value.Y)
            --[[local udim2 = UDim2.new(tbl.X.Scale + value.X.Scale, tbl.X.Offset + value.X.Offset,
            value.Y.Scale + value.Y.Scale, value.Y.Offset + value.Y.Offset)--]]
            return udim2
        end
        error(Blox2D._ErrorMessages.__add:format(UDim2Table.__type, tostring(value), type(value)))
    end,
    __sub = function(tbl, value)
        if UDim2._Is(value) then
            local udim2 = UDim2.fromUDims(tbl.X-value.X, tbl.Y-value.Y)
            return udim2
        end
        error(Blox2D._ErrorMessages.__sub:format(UDim2Table.__type, tostring(value), type(value)))
    end,
    __mul = function (tbl, value)
        if UDim2._Is(value) then
            local udim2 = UDim2.fromUDims(tbl.X * value, tbl.Y * value)
            return udim2
        elseif type(value) == "number" then
            local udim2 = UDim2.fromUDims(tbl.X * value.X, tbl.Y * value.Y)
            return udim2
        end
        error(Blox2D._ErrorMessages.__mul:format(UDim2Table.__type, tostring(value), type(value)))
    end,
    __div = function (tbl, value)
        if UDim2._Is(value) then
            local udim2 = UDim2.fromUDims(tbl.X / value, tbl.Y / value)
            return udim2
        elseif type(value) == "number" then
            local udim2 = UDim2.fromUDims(tbl.X / value.X, tbl.Y / value.Y)
            return udim2
        end
        error(Blox2D._ErrorMessages.__div:format(UDim2Table.__type, tostring(value), type(value)))
    end,
    __eq = function(tbl, value)
        return UDim2._Is(value) and tbl.X == value.X and tbl.Y == value.Y;
     end,
    __newindex = function(table, index, value)
        error(Blox2D._ErrorMessages.__newindex:format(UDim2Table.__type, tostring(index), tostring(value), type(value)))
    end,
    __tostring = function(tbl)
        return ("%s,%s"):format(tostring(tbl.X), tostring(tbl.Y))
    end,
}

UDim2.new = function(xScale, xOffset, yScale, yOffset)
    local udim2 = {
        X = UDim.new(xScale, xOffset),
        Y = UDim.new(yScale, yOffset)
    }
    setmetatable(udim2, metatable)
    return udim2
end
UDim2.fromScale = function(xScale, yScale)
    return UDim2.new(xScale, 0, yScale)
end
UDim2.fromOffset = function(xOffset, yOffset)
    return UDim2.new(0, xOffset, 0, yOffset)
end
UDim2.fromUDims = function (xUDim, yUDim)
    return UDim2.new(xUDim.Scale, xUDim.Offset, yUDim.Scale, yUDim.Offset)
end

UDim2._Is = function(tbl)
    return type(tbl) == "table" and tbl.__type == "UDim2"
end
return UDim2