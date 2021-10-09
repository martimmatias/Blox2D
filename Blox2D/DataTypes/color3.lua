local Color3 = {}

local Table = {
    __type = "Color3"
}

function Table:Lerp(goalColor, alpha)
    Check(":Lerp(goal Color3, number alpha)", "table", goalColor, "goal", "number", alpha, "alpha")
    if typeof(goalColor) == "Color3" then
        local AB = goalColor-self
        return self+AB*alpha
    end
    error(Blox2D._ErrorMessages.CollonFunction:format("Lerp"))
end

local metatable = {
    __index = function(tbl, index)
        return Table[index] or rawget(tbl, string.upper(index))
    end,
    __newindex = function(tbl, index, value)
        error(Blox2D._ErrorMessages.__newindex:format(Table.__type, tostring(index), tostring(value), type(value)))
    end,
    __tostring = function(tbl)
        return ("%f,%f,%f"):format(tbl.R, tbl.G, tbl.B)
    end,
    __add = function(tbl, value)
        if Color3._Is(value) then
            local color = Color3.new(tbl.R + value.R, tbl.G + value.G, tbl.B + value.B)
            return color
        end
        error(Blox2D._ErrorMessages.__add:format(Table.__type, tostring(value), type(value)))
    end,
    __sub = function(tbl, value)
        if Color3._Is(value) then
            local color = Color3.new(tbl.R - value.R, tbl.G - value.G, tbl.B - value.B)
            return color
        end
        error(Blox2D._ErrorMessages.__sub:format(Table.__type, tostring(value), type(value)))
    end,
    __mul = function (tbl, value)
        if Color3._Is(value) then
            local color = Color3.new(tbl.R * value.R, tbl.G * value.G, tbl.B * value.B)
            return color
        elseif type(value) == "number" then
            local color = Color3.new(tbl.R *value, tbl.G *value, tbl.B *value)
            return color
        end
        error(Blox2D._ErrorMessages.__mul:format(Table.__type, tostring(value), type(value)))
    end,
    __div = function (tbl, value)
        if Color3._Is(value) then
            local color = Color3.new(tbl.R / value.R, tbl.G / value.G, tbl.B / value.B)
            return color
        elseif type(value) == "number" then
            local color = Color3.new(tbl.R / value, tbl.G / value, tbl.B / value)
            return color
        end
        error(Blox2D._ErrorMessages.__div:format(Table.__type, tostring(value), type(value)))
    end,
    __eq = function(tbl, value)
        return Color3._Is(value) and tbl.R == value.R and tbl.G == value.G and tbl.B == value.B;
     end,
}

local function hsvToRgb(h, s, v)
    if s <= 0 then return v,v,v end
    h, s, v = h/256*6, s/255, v/255
    local c = v*s
    local x = (1-math.abs((h%2)-1))*c
    local m,r,g,b = (v-c), 0,0,0
    if h < 1     then r,g,b = c,x,0
    elseif h < 2 then r,g,b = x,c,0
    elseif h < 3 then r,g,b = 0,c,x
    elseif h < 4 then r,g,b = 0,x,c
    elseif h < 5 then r,g,b = x,0,c
    else              r,g,b = c,0,x
    end return (r+m)*255,(g+m)*255,(b+m)*255
end

local function hexToRgb (hex)
    local hex = hex:gsub("#","")
    if hex:len() == 3 then
      return (tonumber("0x"..hex:sub(1,1))*17)/255, (tonumber("0x"..hex:sub(2,2))*17)/255, (tonumber("0x"..hex:sub(3,3))*17)/255
    else
      return tonumber("0x"..hex:sub(1,2))/255, tonumber("0x"..hex:sub(3,4))/255, tonumber("0x"..hex:sub(5,6))/255
    end
end

Color3.new = function(r, g, b)
    local color = setmetatable({
        R = r,
        G = g,
        B = b,
    }, metatable)

    return color
end
Color3.fromRGB = function(r, g, b)
    return Color3.new(r/255, g/255, b/255)
end

Color3.fromHSV = function(h, s, v)
    return Color3.fromRGB(hsvToRgb(h, s, v))
end

Color3.fromHEX = function(hex)
    return Color3.new(hexToRgb(hex))
end

Color3._Is = function(tbl)
    return type(tbl) == "table" and tbl.__type == "Color3"
end

return Color3