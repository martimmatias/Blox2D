local EnumItem = {}
local Table = {
    __type = "EnumItem"
}
EnumItem.new = function (name, value)
    Check("EnumItem.new", "string", name, "name")--, "number", value, "value")--, "table", enumType, "enumType")
    local enumItem = setmetatable({
        Name = name,
        Value = value,
        --EnumType = enumType
    }, {__index = Table,
        __eq = function (tbl, value)
            if type(value) == "table" then
                return tbl.Value == value.Value and tbl.Name == value.Name
            end
            return tbl.Name == value or tbl.Value == value
        end,
    })
    return enumItem
end

return EnumItem