local EnumType = require("Blox2D.DataTypes.enumtype")
local EnumItem = require("Blox2D.DataTypes.enumitem")

local EnumTypes = {
    PartShape = EnumType.new(EnumItem.new("Rectangle", 1), EnumItem.new("Sphere", 0)),
    KeyCode = EnumType.new(
        EnumItem.new("Unknown", 0),
        EnumItem.new("Backspace", 8),
        EnumItem.new("Tab", 9),
        EnumItem.new("Clear", 12),
        EnumItem.new("Return", 13)
    )
}

local Enum = setmetatable({}, {
    __index = EnumTypes,
    __newindex = function (tbl, index, value)
        error(Blox2D._ErrorMessages.__newindex:format("Enum", tostring(index), tostring(value), type(value)))
    end
})

return Enum