local EnumType = {}

local Table = {
    __type = "EnumType"
}

function Table:GetEnumItems()
    return DeepCopy(self._EnumItems)
end

local metatable = {
    __index = function (tbl, index)
        local e = Table[index]
        if e ~= nil then
            return e
        end
        if type(index) == "number" then
            return tbl._EnumItems[index+1]
        else
            return tbl._EnumItems[index]
        end
    end,
    __newindex = function (tbl, index, value)
        error(Blox2D._ErrorMessages.__newindex:format(Table.__type, tostring(index), tostring(value), type(value)))
    end
}

EnumType.new = function(...)
    local args = {...}
    local enum = setmetatable({
        ["_EnumItems"] = {}
    }, metatable)

    for i, v in pairs(args) do
        enum._EnumItems[v.Value+1] = v
        enum._EnumItems[v.Name] = v
        rawset(v, "EnumType", enum)
    end

    return enum
end

return EnumType