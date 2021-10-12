local EnumType = require("Blox2D.DataTypes.enumtype")
local EnumItem = require("Blox2D.DataTypes.enumitem")

local EnumTypes = {
    PartShape = EnumType.new(EnumItem.new("Rectangle", 1), EnumItem.new("Sphere"))
}

local Enum = setmetatable({}, {
    __index = EnumTypes,
    __newindex = function (tbl, index, value)
        error(Blox2D._ErrorMessages.__newindex:format("Enum", tostring(index), tostring(value), type(value)))
    end
})

return Enum