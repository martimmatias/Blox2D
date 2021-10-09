local BrickColor = {}

local Table = {
    __type = "BrickColor"
}

--setup named colors
local BrickColorsArray = {}
local BrickColorsDictionary = {
    ["White"] = {Number = 1, RGB = {242, 243, 243}},
    ["Grey"] = {Number = 2, RGB = {161, 165, 162}},
    ["Light yellow"] = {Number = 3, RGB = {249, 233, 153}},

    ["Brick yellow"] = {Number = 5, RGB = {215, 197, 154}},
    ["Light green (Mint)"] = {Number = 6, RGB = {194, 218, 184}},

    ["Light reddish violet"] = {Number = 9, RGB = {232, 186, 200}},

    ["Pastel Blue"] = {Number = 11, RGB = {128, 187, 219}},
    ["Light orange brown"] = {Number = 12, RGB = {203, 132, 66}},

    ["Nougat"] = {Number = 18, RGB = {204, 142, 105}},
    ["Bright red"] = {Number = 21, RGB = {196, 40, 28}},

    ["Med. reddish violet"] = {Number = 22, RGB = {196, 112, 160}},
    ["Bright blue"] = {Number = 23, RGB = {13, 105, 172}},
    ["Bright yellow"] = {Number = 24, RGB = {245, 205, 48}},
    ["Earth orange"] = {Number = 25, RGB = {98, 71, 50}},
    ["Black"] = {Number = 26, RGB = {27, 42, 53}},
    ["Dark grey"] = {Number = 27, RGB = {109, 110, 108}},
    ["Dark green"] = {Number = 28, RGB = {40, 127, 71}},
    ["Medium green"] = {Number = 29, RGB = {161, 196, 140}},

    ["Lig. Yellowich orange"] = {Number = 36, RGB = {243, 207, 155}},
    ["Bright green"] = {Number = 37, RGB = {75, 151, 75}},
    ["Dark orange"] = {Number = 38, RGB = {160, 95, 53}},
    ["Light bluish violet"] = {Number = 39, RGB = {193, 202, 222}},
    ["Transparent"] = {Number = 40, RGB = {236, 236, 236}},
    ["Tr. Red"] = {Number = 41, RGB = {205, 84, 75}},
    ["Tr. Lg Blue"] = {Number = 42, RGB = {193, 223, 240}},
    ["Tr. Blue"] = {Number = 43, RGB = {123, 182, 232}},
    ["Tr.Yellow"] = {Number = 44, RGB = {247, 241, 141}},
    ["Light blue"] = {Number = 45, RGB = {180, 210, 228}},
    ["Tr. Flu. Reddish orange"] = {Number = 47, RGB = {217, 133, 108}},
    ["Tr. Green"] = {Number = 48, RGB = {132, 182, 141}},
    ["Tr. Flu. Green"] = {Number = 49, RGB = {248, 241, 132}},
    ["Phosph. White"] = {Number = 50, RGB = {236, 232, 222}},

    ["Light red"] = {Number = 100, RGB = {238, 196, 182}},
    ["Medium red"] = {Number = 101, RGB = {218, 134, 122}},
    ["Medium blue"] = {Number = 102, RGB = {110, 153, 202}},
    ["Light grey"] = {Number = 103, RGB = {199, 193, 183}},
    ["Bright violet"] = {Number = 104, RGB = {107, 50, 124}},
    ["Br. yellowish orange"] = {Number = 105, RGB = {226, 155, 64}},
    ["Bright orange"] = {Number = 106, RGB = {218, 133, 65}},
    ["Bright bluish green"] = {Number = 107, RGB = {0, 143, 156}},
    ["Earth yellow"] = {Number = 108, RGB = {104, 92, 67}},
    ["Bright bluish violet"] = {Number = 109, RGB = {	67, 84, 147}},
    ["Tr. Brown"] = {Number = 110, RGB = {191, 183, 177}},
    ["Medium bluish violet"] = {Number = 111, RGB = {104, 116, 172}},
    ["Tr. Medi. reddish violet"] = {Number = 112, RGB = {229, 173, 200}},
    ["Med. yellowish green"] = {Number = 113, RGB = {199, 210, 60}},--[[
    [""] = {Number = 115, RGB = {}},
    [""] = {Number = 116, RGB = {}},
    [""] = {Number = 118, RGB = {}},
    [""] = {Number = 119, RGB = {}},
    [""] = {Number = 120, RGB = {}},
    [""] = {Number = 121, RGB = {}},
    [""] = {Number = 123, RGB = {}},
    [""] = {Number = 124, RGB = {}},
    [""] = {Number = 125, RGB = {}},
    [""] = {Number = 126, RGB = {}},
    [""] = {Number = 127, RGB = {}},
    [""] = {Number = 128, RGB = {}},
    [""] = {Number = 131, RGB = {}},
    [""] = {Number = 133, RGB = {}},
    [""] = {Number = 134, RGB = {}},
    [""] = {Number = 135, RGB = {}},
    [""] = {Number = 136, RGB = {}},
    [""] = {Number = 137, RGB = {}},
    [""] = {Number = 138, RGB = {}},
    [""] = {Number = 140, RGB = {}},
    [""] = {Number = 141, RGB = {}},
    [""] = {Number = 143, RGB = {}},
    [""] = {Number = 146, RGB = {}},
    [""] = {Number = 147, RGB = {}},
    [""] = {Number = 148, RGB = {}},
    [""] = {Number = 149, RGB = {}},
    [""] = {Number = 150, RGB = {}},
    [""] = {Number = 151, RGB = {}},
    [""] = {Number = 153, RGB = {}},
    [""] = {Number = 154, RGB = {}},
    [""] = {Number = 157, RGB = {}},
    [""] = {Number = 158, RGB = {}},
    [""] = {Number = 168, RGB = {}},
    [""] = {Number = 176, RGB = {}},
    [""] = {Number = 178, RGB = {}},
    [""] = {Number = 179, RGB = {}},
    [""] = {Number = 180, RGB = {}},
    [""] = {Number = 190, RGB = {}},
    [""] = {Number = 191, RGB = {}},
    [""] = {Number = 193, RGB = {}},--]]
    ["Medium stone grey"] = {Number = 194, RGB = {163, 162, 165}},--[[
    [""] = {Number = 195, RGB = {}},
    [""] = {Number = 196, RGB = {}},
    [""] = {Number = 198, RGB = {}},
    [""] = {Number = 199, RGB = {}},
    [""] = {Number = 200, RGB = {}},
    [""] = {Number = 208, RGB = {}},
    [""] = {Number = 209, RGB = {}},
    [""] = {Number = 210, RGB = {}},
    [""] = {Number = 211, RGB = {}},
    [""] = {Number = 212, RGB = {}},
    [""] = {Number = 213, RGB = {}},
    [""] = {Number = 216, RGB = {}},
    ["Brown"] = {Number = 217, RGB = {124, 92, 70}},
    [""] = {Number = 218, RGB = {}},
    [""] = {Number = 219, RGB = {}},
    [""] = {Number = 220, RGB = {}},
    [""] = {Number = 221, RGB = {}},
    [""] = {Number = 222, RGB = {}},
    [""] = {Number = 223, RGB = {}},
    [""] = {Number = 224, RGB = {}},
    [""] = {Number = 225, RGB = {}},
    [""] = {Number = 226, RGB = {}},
    [""] = {Number = 232, RGB = {}},
    [""] = {Number = 268, RGB = {}},
    [""] = {Number = 301, RGB = {}},
    [""] = {Number = 302, RGB = {}},
    [""] = {Number = 303, RGB = {}},
    [""] = {Number = 304, RGB = {}},
    [""] = {Number = 305, RGB = {}},
    [""] = {Number = 306, RGB = {}},
    [""] = {Number = 307, RGB = {}},
    [""] = {Number = 308, RGB = {}},
    [""] = {Number = 309, RGB = {}},
    [""] = {Number = 310, RGB = {}},
    [""] = {Number = 311, RGB = {}},
    [""] = {Number = 312, RGB = {}},
    [""] = {Number = 313, RGB = {}},
    [""] = {Number = 314, RGB = {}},
    [""] = {Number = 315, RGB = {}},
    [""] = {Number = 316, RGB = {}},
    [""] = {Number = 317, RGB = {}},
    [""] = {Number = 318, RGB = {}},
    [""] = {Number = 319, RGB = {}},
    [""] = {Number = 320, RGB = {}},
    [""] = {Number = 321, RGB = {}},
    [""] = {Number = 322, RGB = {}},
    [""] = {Number = 323, RGB = {}},
    [""] = {Number = 324, RGB = {}},
    [""] = {Number = 325, RGB = {}},
    [""] = {Number = 327, RGB = {}},
    [""] = {Number = 328, RGB = {}},
    [""] = {Number = 329, RGB = {}},
    [""] = {Number = 330, RGB = {}},
    [""] = {Number = 331, RGB = {}},
    [""] = {Number = 332, RGB = {}},
    [""] = {Number = 334, RGB = {}},
    [""] = {Number = 335, RGB = {}},
    [""] = {Number = 336, RGB = {}},
    [""] = {Number = 337, RGB = {}},
    [""] = {Number = 338, RGB = {}},
    [""] = {Number = 339, RGB = {}},
    [""] = {Number = 340, RGB = {}},
    [""] = {Number = 341, RGB = {}},
    [""] = {Number = 342, RGB = {}},
    [""] = {Number = 343, RGB = {}},
    [""] = {Number = 344, RGB = {}},
    [""] = {Number = 345, RGB = {}},
    [""] = {Number = 346, RGB = {}},
    [""] = {Number = 347, RGB = {}},
    [""] = {Number = 348, RGB = {}},
    [""] = {Number = 349, RGB = {}},
    [""] = {Number = 350, RGB = {}},
    [""] = {Number = 351, RGB = {}},
    [""] = {Number = 352, RGB = {}},
    [""] = {Number = 353, RGB = {}},
    [""] = {Number = 354, RGB = {}},
    [""] = {Number = 355, RGB = {}},
    [""] = {Number = 356, RGB = {}},
    [""] = {Number = 357, RGB = {}},
    [""] = {Number = 358, RGB = {}},
    [""] = {Number = 359, RGB = {}},
    [""] = {Number = 360, RGB = {}},
    [""] = {Number = 361, RGB = {}},
    [""] = {Number = 362, RGB = {}},
    [""] = {Number = 363, RGB = {}},
    [""] = {Number = 364, RGB = {}},
    [""] = {Number = 365, RGB = {}},
    [""] = {Number = 1001, RGB = {}},
    [""] = {Number = 1002, RGB = {}},
    [""] = {Number = 1003, RGB = {}},
    [""] = {Number = 1004, RGB = {}},
    [""] = {Number = 1005, RGB = {}},
    [""] = {Number = 1006, RGB = {}},
    [""] = {Number = 1007, RGB = {}},
    [""] = {Number = 1008, RGB = {}},
    [""] = {Number = 1009, RGB = {}},
    [""] = {Number = 1010, RGB = {}},
    [""] = {Number = 1011, RGB = {}},
    [""] = {Number = 1012, RGB = {}},
    [""] = {Number = 1013, RGB = {}},
    [""] = {Number = 1014, RGB = {}},
    [""] = {Number = 1015, RGB = {}},
    [""] = {Number = 1016, RGB = {}},
    [""] = {Number = 1017, RGB = {}},
    [""] = {Number = 1018, RGB = {}},
    [""] = {Number = 1019, RGB = {}},
    [""] = {Number = 1020, RGB = {}},
    [""] = {Number = 1021, RGB = {}},
    [""] = {Number = 1022, RGB = {}},
    ["Lavender"] = {Number = 1023, RGB = {}},
    ["Pastel light blue"] = {Number = 1024, RGB = {}},
    ["Pastel orange"] = {Number = 1025, RGB = {}},--]]
    ["Pastel violet"] = {Number = 1026, RGB = {177, 167, 255}},
    ["Pastel blue-green"] = {Number = 1027, RGB = {159, 243, 233}},
    ["Pastel green"] = {Number = 1028, RGB = {204, 255, 204}},
    ["Pastel yellow"] = {Number = 1029, RGB = {255, 255, 204}},
    ["Pastel brown"] = {Number = 1030, RGB = {255, 204, 153}},
    ["Royal purple"] = {Number = 1031, RGB = {98, 37, 209}},
    ["Hot pink"] = {Number = 1032, RGB = {255, 0, 191}},
}
local name, bc
for name, bc in pairs(BrickColorsDictionary) do
    bc.Name = name
    BrickColorsArray[bc.Number] = bc
end
--

local metatable = {
    __index = function(tbl, index)
        return Table[index] or rawget(tbl, string.upper(index))
    end,
    __newindex = function(tbl, index, value)
        error(Blox2D._ErrorMessages.__newindex:format(Table.__type, tostring(index), tostring(value), type(value)))
    end,
    __tostring = function(tbl)
        return rawget(tbl, "Name") or "BrickColor"
    end
}

BrickColor.new = function(...)
    local args = {...}
    local brickColor = setmetatable({}, metatable)
    local template
    if #args == 3 then
        Check("BrickColor.new",
        "number", args[1], "R",
        "number", args[2], "B",
        "number", args[3], "G"
        )
        rawset(brickColor, "R", args[1])
        rawset(brickColor, "G", args[2])
        rawset(brickColor, "B", args[3])
    elseif #args == 1 then
        local value = args[1]
        if type(value) == "string" then
            template = BrickColorsDictionary[value]
            if template == nil then
                error()
            end
        elseif type(value) == "number" then
            template = BrickColorsArray[value]
            if template == nil then
                error()
            end
        end
    else
        template = BrickColorsDictionary["Medium stone grey"]
    end
    rawset(brickColor, "Number", template.Number)
    rawset(brickColor, "R", template.RGB[1])
    rawset(brickColor, "G", template.RGB[2])
    rawset(brickColor, "B", template.RGB[3])
    rawset(brickColor, "Name", template.Name)
    rawset(brickColor, "Color", Color3.fromRGB(brickColor.R, brickColor.G, brickColor.B))
    return brickColor
end

return BrickColor