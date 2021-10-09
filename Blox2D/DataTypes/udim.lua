local UDim = {}
local UDimTable = {
    __type = "UDim",
}

local metatable = {
    __index = function (tbl, key)
        return UDimTable[key]
    end,
    __add = function(tbl, value)
        if UDim.Is(value) then
            local udim = UDim.new(tbl.Scale + value.Scale, tbl.Offset + value.Offset)
            return udim
        end
        error(Blox2D._ErrorMessages.__add:format(UDimTable.__type, tostring(value), type(value)))
    end,
    __sub = function(tbl, value)
        if UDim.Is(value) then
            local udim = UDim.new(tbl.Scale - value.Scale, tbl.Offset - value.Offset)
            return udim
        end
        error(Blox2D._ErrorMessages.__sub:format(UDimTable.__type, tostring(value), type(value)))
    end,
    __mul = function (tbl, value)
        if UDim.Is(value) then
            local udim = UDim.new(tbl.Scale * value.Scale, tbl.Offset * value.Offset)
            return udim
        elseif type(value) == "number" then
            local udim = UDim.new(tbl.Scale *value, tbl.Offset *value)
            return udim
        end
        error(Blox2D._ErrorMessages.__mul:format(UDimTable.__type, tostring(value), type(value)))
    end,
    __div = function (tbl, value)
        if UDim.Is(value) then
            local udim = UDim.new(tbl.Scale / value.Scale, tbl.Offset / value.Offset)
            return udim
        elseif type(value) == "number" then
            local udim = UDim.new(tbl.Scale / value, tbl.Offset / value)
            return udim
        end
        error(Blox2D._ErrorMessages.__div:format(UDimTable.__type, tostring(value), type(value)))
    end,
    __eq = function(tbl, value)
        return UDim.Is(value) and tbl.Scale == value.Scale and tbl.Offset == value.Offset;
     end,
    __newindex = function(table, index, value)
        error(Blox2D._ErrorMessages.__newindex:format(UDimTable.__type, tostring(index),tostring(value), type(value)))
    end,
    __tostring = function(tbl)
        return ("%f,%f"):format(tbl.Scale, tbl.Offset)
    end,
}

UDim.new = function(scale, offset)
    local udim = {
        Scale = scale or 0,
        Offset = offset or 0
    }
    setmetatable(udim, metatable)
    return udim
end

UDim.Is = function(tbl)
    return type(tbl) == "table" and tbl.__type == "UDim"
end
return UDim