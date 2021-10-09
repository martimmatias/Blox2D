local m = math
math = setmetatable({}, {__index = m})

math.clamp = function(x, min, max)
    Check("clamp", "number", x, "x", "number", min, "min", "number", max, "max")
    if min > max then
        error("min can't be bigger than max")
    end
    if x > max then
        x = max
    elseif x < min then
        x = min
    end
end
