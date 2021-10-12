local EnumType = {}

local Table = {
    __type = "EnumType"
}

function Table:GetEnumItems()
    return DeepCopy(self._EnumItems)
end

local metatable = {
    __index = function (tbl, index)
        return Table[index] or tbl._EnumItems[index]
    end,
    __newindex = function (tbl, index, value)
        error(Blox2D._ErrorMessages.__newindex:format(Table.__type, tostring(index), tostring(value), type(value)))
    end
}

EnumType.new = function(...)
    local enum = setmetatable({
        ["_EnumItems"] = {...}
    }, metatable)

    for i = 1, #enum._EnumItems do
        local enumType = enum._EnumItems[i]
        enum._EnumItems[enumType.Name] = enumType
        enumType = nil
    end
    for _, v in pairs(enum._EnumItems) do
        rawset(v, "EnumType", enum)
        
    end
    return enum
end

return EnumType