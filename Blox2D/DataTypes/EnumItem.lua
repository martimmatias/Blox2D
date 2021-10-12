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
    }, {__index = Table})
    return enumItem
end

return EnumItem