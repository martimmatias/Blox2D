local EnumType = require("Blox2D.DataTypes.enumtype")
local EnumItem = require("Blox2D.DataTypes.enumitem")

local keyCodes = {
    EnumItem.new("Unknown", 0),
        EnumItem.new("Backspace", 8),
        EnumItem.new("Tab", 9),
        EnumItem.new("Clear", 12),
        EnumItem.new("Return", 13),
        EnumItem.new("Pause", 19),
        EnumItem.new("Escape", 27),
        EnumItem.new("Space", 32),
        EnumItem.new("QuotedDouble", 34),
        EnumItem.new("Hash", 35),
        EnumItem.new("Dollar", 36),
        EnumItem.new("Percent", 37),
        EnumItem.new("Ampersand", 38),
        EnumItem.new("Quote", 39),
        EnumItem.new("LeftParenthesis", 40),
        EnumItem.new("RightParenthesis", 41),
        EnumItem.new("Asterisk", 42),
        EnumItem.new("Plus", 43),
        EnumItem.new("Comma", 44),
        EnumItem.new("Minus", 45),
        EnumItem.new("Period", 46),
        EnumItem.new("Slash", 47),
        EnumItem.new("Zero", 48),
        EnumItem.new("One", 49),
        EnumItem.new("Two", 50),
        EnumItem.new("Three", 51),
        EnumItem.new("Four", 52),
        EnumItem.new("Five", 53),
        EnumItem.new("Six", 54),
        EnumItem.new("Seven", 55),
        EnumItem.new("Eight", 56),
        EnumItem.new("Nine", 57),
        EnumItem.new("Colon", 58),
        EnumItem.new("Semicolon", 59),
        EnumItem.new("LessThan", 60),
        EnumItem.new("Equals", 61),
        EnumItem.new("GreaterThan", 62),
        EnumItem.new("Question", 63),
        EnumItem.new("At", 64),
        EnumItem.new("LeftBracket", 91),
        EnumItem.new("BackSlash", 92),
        EnumItem.new("RightBracket", 93),
        EnumItem.new("Caret", 94),
        EnumItem.new("Underscore", 95),
        EnumItem.new("Backquote", 96),
        EnumItem.new("A", 97),
        EnumItem.new("B", 98),
        EnumItem.new("C", 99),
        EnumItem.new("D", 100),
        EnumItem.new("E", 101),
        EnumItem.new("F", 102),
        EnumItem.new("G", 103),
        EnumItem.new("H", 104),
        EnumItem.new("I", 105),
        EnumItem.new("J", 106),
        EnumItem.new("K", 107),
        EnumItem.new("L", 108),
        EnumItem.new("M", 109),
        EnumItem.new("N", 110),
        EnumItem.new("O", 111),
        EnumItem.new("P", 112),
        EnumItem.new("Q", 113),
        EnumItem.new("R", 114),
        EnumItem.new("S", 115),
        EnumItem.new("T", 116),
        EnumItem.new("U", 117),
        EnumItem.new("V", 118),
        EnumItem.new("W", 119),
        EnumItem.new("X", 120),
        EnumItem.new("Y", 121),
        EnumItem.new("Z", 122),
        EnumItem.new("LeftCurly", 123),
        EnumItem.new("Pipe", 124),
        EnumItem.new("RightCurly", 125),
        EnumItem.new("Tilde", 126),
        EnumItem.new("Delete", 127),
        EnumItem.new("KeypadZero", 256),
        EnumItem.new("KeypadOne", 257),
        EnumItem.new("KeypadTwo", 258),
        EnumItem.new("KeypadThree", 259),
        EnumItem.new("KeypadFour", 260),
        EnumItem.new("KeypadFive", 261),
        EnumItem.new("KeypadSix", 262),
        EnumItem.new("KeypadSeven", 263),
        EnumItem.new("KeypadEight", 264),
        EnumItem.new("KeypadNine", 265),
        EnumItem.new("KeypadPeriod", 266),
        EnumItem.new("KeypadDivide", 267),
        EnumItem.new("KeypadMultiply", 268),
        EnumItem.new("KeypadMinus", 269),
        EnumItem.new("KeypadPlus", 270),
        EnumItem.new("KeypadEnter", 271),
        EnumItem.new("KeypadEquals", 272),
        EnumItem.new("Up", 273),
        EnumItem.new("Down", 274),
        EnumItem.new("Right", 275),
        EnumItem.new("Left", 276),
        EnumItem.new("Insert", 277),
        EnumItem.new("Home", 278),
        EnumItem.new("End", 279),
        EnumItem.new("PageUp", 280),
        EnumItem.new("PageDown", 281),
        EnumItem.new("LeftShift", 304),
        EnumItem.new("RightShift", 303),
        EnumItem.new("LeftMeta", 310),
        EnumItem.new("RightMeta", 309),
        EnumItem.new("LeftAlt", 308),
        EnumItem.new("RightAlt", 307),
        EnumItem.new("LeftControl", 306),
        EnumItem.new("RightControl", 305),
        EnumItem.new("CapsLock", 301),
        EnumItem.new("NumLock", 300),
        EnumItem.new("ScrollLock", 302),
        EnumItem.new("LeftSuper", 311),
        EnumItem.new("RightSuper", 312),
        EnumItem.new("Mode", 313),
        EnumItem.new("Compose", 314),
        EnumItem.new("Help", 315),
        EnumItem.new("Print", 316),
        EnumItem.new("SysReq", 317),
        EnumItem.new("Break", 318),
        EnumItem.new("Menu", 319),
        EnumItem.new("Power", 320),
        EnumItem.new("Euro", 321),
        EnumItem.new("Undo", 322),
        EnumItem.new("F1", 282),
        EnumItem.new("F2", 283),
        EnumItem.new("F3", 284),
        EnumItem.new("F4", 285),
        EnumItem.new("F5", 286),
        EnumItem.new("F6", 287),
        EnumItem.new("F7", 288),
        EnumItem.new("F8", 289),
        EnumItem.new("F9", 290),
        EnumItem.new("F10", 291),
        EnumItem.new("F11", 292),
        EnumItem.new("F12", 293),
        EnumItem.new("F13", 294),
        EnumItem.new("F14", 295),
        EnumItem.new("F15", 296),
        EnumItem.new("World0", 160),
        EnumItem.new("ButtonX", 1000),
        EnumItem.new("ButtonY", 1001),
        EnumItem.new("ButtonA", 1002),
        EnumItem.new("ButtonB", 1003),
        EnumItem.new("ButtonR1", 1004),
        EnumItem.new("ButtonL1", 1005),
        EnumItem.new("ButtonR2", 1006),
        EnumItem.new("ButtonL2", 1007),
        EnumItem.new("ButtonR3", 1008),
        EnumItem.new("ButtonL3", 1009),
        EnumItem.new("ButtonStart", 1010),
        EnumItem.new("ButtonSelect", 1011),
        EnumItem.new("DPadLeft", 1012),
        EnumItem.new("DPadRight", 1013),
        EnumItem.new("DPadUp", 1014),
        EnumItem.new("DPadDown", 1015),
        EnumItem.new("Thumbstick1", 1016),
        EnumItem.new("Thumbstick2", 1017)
}
for i = 1, 95 do
    table.insert(keyCodes, EnumItem.new("World"..tostring(i), 160+i))
end


local EnumTypes = {
    PartShape = EnumType.new(EnumItem.new("Rectangle", 1), EnumItem.new("Circle", 0)),
    KeyCode = EnumType.new(
        table.unpack(keyCodes)
    ),
    UserInputType = EnumType.new(
        EnumItem.new("MouseButton1", 0),
        EnumItem.new("MouseButton2", 1),
        EnumItem.new("MouseButton3", 2),
        EnumItem.new("MouseWheel", 3),
        EnumItem.new("MouseMovement", 4),
        EnumItem.new("Touch", 7),
        EnumItem.new("Keyboard", 8),
        EnumItem.new("Focus", 9),
        EnumItem.new("Accelerometer", 10),
        EnumItem.new("Gyro", 11),
        EnumItem.new("Gamepad1", 12),
        EnumItem.new("Gamepad2", 13),
        EnumItem.new("Gamepad3", 14),
        EnumItem.new("Gamepad4", 15),
        EnumItem.new("Gamepad5", 16),
        EnumItem.new("Gamepad6", 17),
        EnumItem.new("Gamepad7", 18),
        EnumItem.new("Gamepad8", 19),
        EnumItem.new("TextInput", 20),
        EnumItem.new("InputMethod", 21),
        EnumItem.new("None", 22)
    ),
    UserInputState = EnumType.new(
        EnumItem.new("Begin", 0),
        EnumItem.new("Change", 1),
        EnumItem.new("End", 2),
        EnumItem.new("Cancel", 3),
        EnumItem.new("None", 4)
    ),
    ZIndexBehavior = EnumType.new(
        EnumItem.new("Global", 0),
        EnumItem.new("Sibling", 1)
    )
}

local _Name, _EnumType
for _Name, _EnumType in pairs(EnumTypes) do
    rawset(_EnumType, "_Name", _Name)
end

local Enum = setmetatable({}, {
    __index = EnumTypes,
    __newindex = function (tbl, index, value)
        error(Blox2D._ErrorMessages.__newindex:format("Enum", tostring(index), tostring(value), type(value)))
    end
})

return Enum