local MyPath = "Blox2D.Utils."
require(MyPath.."table")
require(MyPath.."math")

---@diagnostic disable-next-line: lowercase-global
typeof = function(value)
    if type(value) == "table" then
        return value.__type
    end
end

---@diagnostic disable-next-line: lowercase-global
version = function()
    local major, minor, revision = love.getVersion()
    return string.format("%d.%d.%d", major, minor, revision)
end

---@diagnostic disable-next-line: lowercase-global
warn = function(...)
    local args = {...}
    print(string.char(175).."[WARN]", table.unpack(args))
end

DeepCopy = function(tbl)
    local copy = {}
    --local meta
    for i, v in pairs(tbl) do
        if type(v) == "table" then
            --meta = getmetatable(v)
            v = DeepCopy(v)
            --setmetatable(v, meta)
        end
        copy[i] = v
    end
    return copy
end

function Check(funcname, ...)
    local arg = {...}
 
    if (type(funcname) ~= "string") then
        error("Argument type mismatch at 'Check' ('funcname'). Expected 'string', got '"..type(funcname).."'.", 2)
    end
    if (#arg % 3 > 0) then
        error("Argument number mismatch at 'Check'. Expected #arg % 3 to be 0, but it is "..(#arg % 3)..".", 2)
    end
 
    for i=1, #arg-2, 3 do
        if (type(arg[i]) ~= "string" and type(arg[i]) ~= "table") then
            error("Argument type mismatch at 'Check' (arg #"..i.."). Expected 'string' or 'table', got '"..type(arg[i]).."'.", 2)
        elseif (type(arg[i+2]) ~= "string") then
            error("Argument type mismatch at 'Check' (arg #"..(i+2).."). Expected 'string', got '"..type(arg[i+2]).."'.", 2)
        end
 
        if (type(arg[i]) == "table") then
            local aType = type(arg[i+1])
            for _, pType in next, arg[i] do
                if (aType == pType) then
                    aType = nil
                    break
                end
            end
            if (aType) then
                error("Argument type mismatch at '"..funcname.."' ('"..arg[i+2].."'). Expected '"..table.concat(arg[i], "' or '").."', got '"..aType.."'.", 3)
            end
        elseif (type(arg[i+1]) ~= arg[i]) then
            error("Argument type mismatch at '"..funcname.."' ('"..arg[i+2].."'). Expected '"..arg[i].."', got '"..type(arg[i+1]).."'.", 3)
        end
    end
end

