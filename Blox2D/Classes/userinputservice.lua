local Class, Table, getters, setters, newFunc = _Inherit(Instance, "UserInputService")


local keyToKeyCodeName = {
    [string.char(34)] = "QuotedDouble",
    ["#"] = "Hash",
    ["$"] = "Dollar",
    ["%"] = "Percent",
    ["&"] = "Ampersand",
    [string.char(39)] = "Quote",
    ["("] = "LeftParenthesis",
    [")"] = "RightParenthesis",
    ["*"] = "Asterisk",
    ["+"] = "Plus",
    [","] = "Comma",
    ["-"] = "Minus",
    ["."] = "Period",
    ["/"] = "Slash",
    ["0"] = "Zero",
    ["1"] = "One",
    ["2"] = "Two",
    ["3"] = "Three",
    ["4"] = "Four",
    ["5"] = "Five",
    ["6"] = "Six",
    ["7"] = "Seven",
    ["8"] = "Eight",
    ["9"] = "Nine",
    [":"] = "Colon",
    [";"] = "Semicolon",
    ["<"] = "LessThan",
    ["="] = "Equals",
    [">"] = "GreaterThan",
    ["?"] = "Question",
    ["@"] = "At",
    ["["] = "LeftBracket",
    [string.char(92)] = "BackSlash",
    ["]"] = "RightBracket",
    ["^"] = "Caret",
    ["_"] = "Underscore",
    ["`"] = "Backquote",
    ["{"] = "LeftCurly",
    ["|"] = "Pipe",
    ["}"] = "RightCurly",
    ["~"] = "Tilde",
    ["kp0"] = "KeyPadZero",
    ["kp1"] = "KeyPadOne",
    ["kp2"] = "KeyPadTwo",
    ["kp3"] = "KeyPadThree",
    ["kp4"] = "KeyPadFour",
    ["kp5"] = "KeyPadFive",
    ["kp6"] = "KeyPadSix",
    ["kp7"] = "KeyPadSeven",
    ["kp8"] = "KeyPadEight",
    ["kp9"] = "KeyPadNine",
    ["kp."] = "KeyPadPeriod",
    ["kp/"] = "KeyPadDivide",
    ["kp*"] = "KeyPadMultiply",
    ["kp-"] = "KeyPadMinus",
    ["kp+"] = "KeyPad+",
    ["kpenter"] = "KeyPadEnter",
    ["kp="] = "KeyPadEquals",
    ["pageup"] = "PageUp",
    ["pagedown"] = "PageDown",
    ["lshift"] = "LeftShift",
    ["rshift"] = "RightShift",
    ["lalt"] = "LeftAlt",
    ["ralt"] = "RightAlt",
    ["lctrl"] = "LeftControl",
    ["rctrl"] = "RightControl",
    ["capslock"] = "CapsLock",
    ["numlock"] = "NumLock",
    ["scrollock"] = "ScrollLock",
    ["lgui"] = "LeftSuper",
    ["rgui"] = "RightSuper",
    ["printscreen"] = "Print",
    ["sysreq"] = "SysReq",
    ["currencyunit"] = "Euro",
    
}


function Table:_NewInputObject(key)
    local keyCode = Enum.KeyCode[key] or keyToKeyCodeName[key]
    print(key, keyCode)
    if keyCode == nil then
        warn(keyCode, "does not have a corresponding KeyCode Enum")
        return
    end
    local inputObject = Instance.new("InputObject")
    inputObject.KeyCode = keyCode
end

Class.new = function ()
    local instance = newFunc()
    rawset(instance, "WindowFocused", ScriptSignal.new())
    rawset(instance, "WindowFocusReleased", ScriptSignal.new())
    rawset(instance, "InputBegan", ScriptSignal.new())
    rawset(instance, "InputChanged", ScriptSignal.new())
    rawset(instance, "InputEnded", ScriptSignal.new())
    rawset(instance, "_InputObjects", {})
    return instance
end

return Class