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
    ["Bright bluish violet"] = {Number = 110, RGB = {67, 84, 147}},
    ["Tr. Brown"] = {Number = 111, RGB = {191, 183, 177}},
    ["Medium bluish violet"] = {Number = 112, RGB = {104, 116, 172}},
    ["Tr. Medi. reddish violet"] = {Number = 113, RGB = {229, 173, 200}},
    ["Med. yellowish green"] = {Number = 115, RGB = {199, 210, 60}},
    ["Med. bluish green"] = {Number = 116, RGB = {85, 165, 175}},
    ["Light bluish green"] = {Number = 118, RGB = {183, 215, 213}},
    ["Br. yellowish green"] = {Number = 119, RGB = {164, 189, 71}},
    ["Lig. yellowish green"] = {Number = 120, RGB = {217, 228, 167}},
    ["Med. yellowish orange"] = {Number = 121, RGB = {231, 172, 88}},
    ["Br. reddish orange"] = {Number = 123, RGB = {211, 111, 76}},
    ["Bright reddish violet"] = {Number = 124, RGB = {146, 57, 120}},
    ["Light orange"] = {Number = 125, RGB = {234, 184, 146}},
    ["Tr. Bright bluish violet"] = {Number = 126, RGB = {165, 165, 203}},
    --[""] = {Number = 127, RGB = {}},
    ["Dark nougat"] = {Number = 128, RGB = {174, 122, 89}},
    ["Silver"] = {Number = 131, RGB = {156, 163, 168}},
    ["Neon orange"] = {Number = 133, RGB = {213, 115, 61}},
    ["	Neon green"] = {Number = 134, RGB = {216, 221, 86}},
    ["Sand blue"] = {Number = 135, RGB = {116, 134, 157}},
    ["Sand violet"] = {Number = 136, RGB = {135, 124, 144}},
    ["Medium orange"] = {Number = 137, RGB = {224, 152, 100}},
    ["Sand yellow"] = {Number = 138, RGB = {149, 138, 115}},
    ["Earth blue"] = {Number = 140, RGB = {32, 58, 86}},
    ["Earth green"] = {Number = 141, RGB = {39, 70, 45}},
    ["Tr. Flu. Blue"] = {Number = 143, RGB = {207, 226, 247}},
    ["Sand blue metallic"] = {Number = 145, RGB = {121, 136, 161}},
    ["Sand violet metallic"] = {Number = 146, RGB = {149, 142, 163}},
    ["Sand yellow metallic"] = {Number = 147, RGB = {147, 135, 103}},
    ["Dark grey metallic"] = {Number = 148, RGB = {87, 88, 87}},
    ["Black metallic"] = {Number = 149, RGB = {22, 29, 50}},
    ["Light grey metallic"] = {Number = 150, RGB = {171, 173, 172}},
    ["Sand green"] = {Number = 151, RGB = {120, 144, 130}},
    ["Sand red"] = {Number = 153, RGB = {149, 121, 119}},
    ["Dark red"] = {Number = 154, RGB = {123, 46, 47}},
    ["	Tr. Flu. Yellow"] = {Number = 157, RGB = {255, 246, 123}},
    ["Tr. Flu. Red"] = {Number = 158, RGB = {225, 164, 194}},
    ["Gun metallic"] = {Number = 168, RGB = {117, 108, 98}},
    ["Red flip/flop"] = {Number = 176, RGB = {151, 105, 91}},
    ["Yellow flip/flop"] = {Number = 178, RGB = {180, 132, 85}},
    ["Silver flip/flop"] = {Number = 179, RGB = {137, 135, 136}},
    ["Curry"] = {Number = 180, RGB = {215, 169, 75}},
    ["Fire Yellow"] = {Number = 190, RGB = {249, 214, 46}},
    ["Flame yellowish orange"] = {Number = 191, RGB = {232, 171, 45}},
    ["Reddish brown"] = {Number = 192, RGB = {105, 64, 40}},
    ["Flame reddish orange"] = {Number = 193, RGB = {207, 96, 36}},
    ["Medium stone grey"] = {Number = 194, RGB = {163, 162, 165}},
    ["Royal blue"] = {Number = 195, RGB = {70, 103, 164}},
    ["Dark Royal blue"] = {Number = 196, RGB = {35, 71, 139}},
    ["Bright reddish lilac"] = {Number = 198, RGB = {142, 66, 133}},
    ["Dark stone grey"] = {Number = 199, RGB = {99, 95, 98}},
    ["Lemon metalic"] = {Number = 200, RGB = {130, 138, 93}},
    ["Light stone grey"] = {Number = 208, RGB = {229, 228, 223}},
    ["Dark Curry"] = {Number = 209, RGB = {	176, 142, 68}},
    ["Faded green"] = {Number = 210, RGB = {112, 149, 120}},
    ["Turquoise"] = {Number = 211, RGB = {121, 181, 181}},
    ["Light Royal blue"] = {Number = 212, RGB = {159, 195, 233}},
    ["Medium Royal blue"] = {Number = 213, RGB = {108, 129, 183}},
    ["Brown"] = {Number = 217, RGB = {124, 92, 70}},
    ["Reddish lilac"] = {Number = 218, RGB = {150, 112, 159}},
    
    ["Light lilac"] = {Number = 220, RGB = {167, 169, 206}},
    ["Bright purple"] = {Number = 221, RGB = {205, 98, 152}},
    ["Light purple"] = {Number = 222, RGB = {228, 173, 200}},
    ["Light pink"] = {Number = 223, RGB = {220, 144, 149}},
    ["Light brick yellow"] = {Number = 224, RGB = {240, 213, 160}},
    ["Warm yellowish orange"] = {Number = 225, RGB = {235, 184, 127}},
    ["Cool yellow"] = {Number = 226, RGB = {253, 234, 141}},
    ["Dove blue"] = {Number = 232, RGB = {125, 187, 221}},
    ["Medium lilac"] = {Number = 268, RGB = {52, 43, 117}},
    ["Slime green"] = {Number = 301, RGB = {80, 109, 84}},
    ["Smoky grey"] = {Number = 302, RGB = {91, 93, 105}},
    ["Dark blue"] = {Number = 303, RGB = {0, 16, 176}},
    ["Parsley green"] = {Number = 304, RGB = {44, 101, 29}},
    ["Steel blue"] = {Number = 305, RGB = {82, 124, 174}},
    ["Storm blue"] = {Number = 306, RGB = {51, 88, 130}},
    ["Lapis"] = {Number = 307, RGB = {16, 42, 220}},
    ["Dark indigo"] = {Number = 308, RGB = {61, 21, 133}},
    ["Sea green"] = {Number = 309, RGB = {52, 142, 64}},
    ["Shamrock"] = {Number = 310, RGB = {91, 154, 76}},
    ["Fossil"] = {Number = 311, RGB = {159, 161, 172}},
    ["Mulberry"] = {Number = 312, RGB = {89, 34, 89}},
    ["Forest green"] = {Number = 313, RGB = {31, 128, 29}},
    ["Cadet blue"] = {Number = 314, RGB = {159, 173, 192}},
    ["Electric blue"] = {Number = 315, RGB = {9, 137, 207}},
    ["Eggplant"] = {Number = 316, RGB = {123, 0, 123}},
    ["Moss"] = {Number = 317, RGB = {124, 156, 107}},
    ["Artichoke"] = {Number = 318, RGB = {138, 171, 133}},
    ["Sage green"] = {Number = 319, RGB = {185, 196, 177}},
    ["Ghost grey"] = {Number = 320, RGB = {202, 203, 209}},
    
    ["Lilac"] = {Number = 321, RGB = {167, 94, 155}},
    ["Plum"] = {Number = 322, RGB = {123, 47, 123}},
    ["Olivine"] = {Number = 323, RGB = {148, 190, 129}},
    ["Laurel green"] = {Number = 324, RGB = {168, 189, 153}},
    ["Quill grey"] = {Number = 325, RGB = {223, 223, 222}},
    ["Crimson"] = {Number = 327, RGB = {151, 0, 0}},
    ["Mint"] = {Number = 328, RGB = {177, 229, 166}},
    ["Baby blue"] = {Number = 329, RGB = {152, 194, 219}},
    ["Carnation pink"] = {Number = 330, RGB = {255, 152, 220}},
    ["Persimmon"] = {Number = 331, RGB = {255, 89, 89}},
    ["Maroon"] = {Number = 332, RGB = {117, 0, 0}},
    ["Gold"] = {Number = 333, RGB = {239, 184, 56}},
    ["Daisy orange"] = {Number = 334, RGB = {248, 217, 109}},
    ["Pearl"] = {Number = 335, RGB = {231, 231, 236}},
    ["Fog"] = {Number = 336, RGB = {199, 212, 228}},
    ["Salmon"] = {Number = 337, RGB = {255, 148, 148}},
    ["Terra Cotta"] = {Number = 338, RGB = {190, 104, 98}},
    ["Cocoa"] = {Number = 339, RGB = {86, 36, 36}},
    ["Wheat"] = {Number = 340, RGB = {241, 231, 199}},
    ["Buttermilk"] = {Number = 341, RGB = {254, 243, 187}},
    ["Mauve"] = {Number = 342, RGB = {224, 178, 208}},
    ["Sunrise"] = {Number = 343, RGB = {212, 144, 189}},
    ["Tawny"] = {Number = 344, RGB = {150, 85, 85}},
    ["Rust"] = {Number = 345, RGB = {143, 76, 42}},
    ["Cashmere"] = {Number = 346, RGB = {211, 190, 150}},
    ["Khaki"] = {Number = 347, RGB = {226, 220, 188}},
    ["Lily white"] = {Number = 348, RGB = {237, 234, 234}},
    ["Seashell"] = {Number = 349, RGB = {233, 218, 218}},
    ["Burgundy"] = {Number = 350, RGB = {136, 62, 62}},
    ["Cork"] = {Number = 351, RGB = {188, 155, 93}},
    ["Burlap"] = {Number = 352, RGB = {199, 172, 120}},
    ["Beige"] = {Number = 353, RGB = {202, 191, 163}},
    ["Oyster"] = {Number = 354, RGB = {187, 179, 178}},
    ["Pine Cone"] = {Number = 355, RGB = {108, 88, 75}},
    ["Fawn brown"] = {Number = 356, RGB = {160, 132, 79}},
    ["Hurricane grey"] = {Number = 357, RGB = {149, 137, 136}},
    ["Cloudy grey"] = {Number = 358, RGB = {171, 168, 158}},
    ["Linen"] = {Number = 359, RGB = {175, 148, 131}},
    ["Copper"] = {Number = 360, RGB = {150, 103, 102}},
    ["Dirt brown"] = {Number = 361, RGB = {86, 66, 54}},
    ["Bronze"] = {Number = 362, RGB = {126, 104, 63}},
    ["Flint"] = {Number = 363, RGB = {105, 102, 92}},
    ["Dark taupe"] = {Number = 364, RGB = {90, 76, 66}},
    ["Burnt Sienna"] = {Number = 365, RGB = {106, 57, 9}},

    ["Institutional white"] = {Number = 1001, RGB = {248, 248, 248}},
    ["Mid gray"] = {Number = 1002, RGB = {205, 205, 205}},
    ["Really black"] = {Number = 1003, RGB = {17, 17, 17}},
    ["Really red"] = {Number = 1004, RGB = {255, 0, 0}},
    ["Deep orange"] = {Number = 1005, RGB = {255, 176, 0}},
    ["Alder"] = {Number = 1006, RGB = {180, 128, 255}},
    ["Dusty Rose"] = {Number = 1007, RGB = {163, 75, 75}},
    ["Olive"] = {Number = 1008, RGB = {193, 190, 66}},
    ["New Yeller"] = {Number = 1009, RGB = {255, 255, 0}},
    ["Really blue"] = {Number = 1010, RGB = {0, 0, 255}},
    ["Navy blue"] = {Number = 1011, RGB = {0, 32, 96}},
    ["Deep blue"] = {Number = 1012, RGB = {33, 84, 185}},
    ["Cyan"] = {Number = 1013, RGB = {4, 175, 236}},
    ["CGA brown"] = {Number = 1014, RGB = {170, 85, 0}},
    ["Magenta"] = {Number = 1015, RGB = {170, 0, 170}},
    ["Pink"] = {Number = 1016, RGB = {255, 102, 204}},
    
    ["Teal"] = {Number = 1018, RGB = {18, 238, 212}},
    ["Toothpaste"] = {Number = 1019, RGB = {0, 255, 255}},
    ["Lime green"] = {Number = 1020, RGB = {0, 255, 0}},
    ["Camo"] = {Number = 1021, RGB = {58, 125, 21}},
    ["Grime"] = {Number = 1022, RGB = {127, 142, 100}},
    ["Lavender"] = {Number = 1023, RGB = {140, 91, 159}},
    ["Pastel light blue"] = {Number = 1024, RGB = {175, 221, 255}},
    ["Pastel orange"] = {Number = 1025, RGB = {255, 201, 201}},
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
--Colors with duplicate names
BrickColorsArray[127] = {Name = "Gold", Number = 127, RGB = {220, 188, 129}}
BrickColorsArray[216] = {Name = "Rust", Number = 216, RGB = {144, 76, 42}}
BrickColorsArray[219] = {Name = "Lilac", Number = 219, RGB = {107, 98, 155}}
BrickColorsArray[1017] = {Name = "Deep orange", Number = 219, RGB = {255, 176, 0}}
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