local Input = {}
Input.InputObjects = {}
local InputObjects = Input.InputObjects

local _mouseX, _mouseY
local _newMouseX, _newMouseY
local UserInputService = game:GetService("UserInputService")

local keyToKeyCodeName ={
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
    ["currencyunit"] = "Euro"
}

function Input:BeginInputObject(name, inputObject)
    inputObject.UserInputState = Enum.UserInputState.Begin
    InputObjects[name] = inputObject
    UserInputService.InputBegan:Fire(inputObject, false)
end

function Input:EndInputObject(name)
    UserInputService.InputEnded:Fire(InputObjects[name], false)
    InputObjects[name].UserInputState = Enum.UserInputState.End
    InputObjects[name] = nil
end

Input.update = function()
    _newMouseX = love.mouse.getX()
    _newMouseY = love.mouse.getY()
    if _newMouseX == _mouseX and _newMouseY == _mouseY then
        local inputObject = InputObjects["MouseMovement"]
        if inputObject ~= nil then
            inputObject.UserInputState = Enum.UserInputState.End
            InputObjects["MouseMovement"] = nil
        end
    end
    _mouseX = _newMouseX
    _mouseY = _newMouseY
end

Input.keypressed = function(key, scanCode, isRepeat)
    local keyCode = Enum.KeyCode[key] or Enum.KeyCode[keyToKeyCodeName[key]]
    if keyCode == nil then
        warn(keyCode, "does not have a corresponding KeyCode Enum")
        return
    end
    local inputObject = Instance.new("InputObject")
    inputObject.KeyCode = keyCode
    inputObject.UserInputType = Enum.UserInputType.Keyboard
    Input:BeginInputObject(key, inputObject)
end

Input.keyreleased = function (key, scanCode)
    local inputObject = InputObjects[key]
    if inputObject ~= nil then
        Input:EndInputObject(key)
    end
end

Input.mousepressed = function (x, y, button, isTouch)
    if button > 3 then
        warn("mousepressed", "Mouse button ", button," is greater than 3")
        return
    end
    local inputObject = Instance.new("InputObject")
    inputObject.Position = Vector2.new(x, y)

    if isTouch == true then
        inputObject.UserInputType = Enum.UserInputType.Touch
    else
        inputObject.UserInputType = Enum.UserInputType["MouseButton"..tostring(button)]
    end

    Input:BeginInputObject(inputObject.UserInputType.Name, inputObject)
end

Input.mousereleased = function (x, y, button, isTouch, presses)
    if button > 3 then
        warn("mousereleased", "Mouse button ", button," is greater than 3")
        return
    end
    local inputObject
    if isTouch == true then
        inputObject = InputObjects["Touch"]
    else
        inputObject = InputObjects["MouseButton"..tostring(button)]
    end
    if inputObject ~= nil then
        inputObject.Position = Vector2.new(x, y)
        Input:EndInputObject(inputObject.UserInputType.Name)
    end
end

Input.mousemoved = function (x, y, dx, dy, isTouch)
    local inputObject = InputObjects["MouseMovement"]
    if inputObject == nil then
        inputObject = Instance.new("InputObject")
        inputObject.UserInputType = Enum.UserInputType.MouseMovement
        Input:BeginInputObject("MouseMovement", inputObject)
        inputObject.Position = Vector2.new(x, y)
    end
    rawset(inputObject.Position, "X", x)
    rawset(inputObject.Position, "Y", y)
    rawset(inputObject.Delta, "X", dx)
    rawset(inputObject.Delta, "Y", dy)
    inputObject.UserInputState = Enum.UserInputState.Change
    UserInputService.InputChanged:Fire(inputObject, false)
end

Input.wheelmoved = function(x, y)
    local inputObject = InputObjects["MouseWheel"]
    if inputObject == nil then
        inputObject = Instance.new("InputObject")
        inputObject.UserInputType = Enum.UserInputType.MouseWheel
        inputObject.Position = Vector2.new(x, y)
        Input:BeginInputObject("MouseWheel", inputObject)
    end
    rawset(inputObject.Position, "X", x)
    rawset(inputObject.Position, "Y", y)
    inputObject.UserInputState = Enum.UserInputState.Change
    UserInputService.InputChanged:Fire(inputObject, false)
end

Input.focus = function (focus)
    if focus then
        UserInputService.WindowFocused:Fire()
    else
        UserInputService.WindowFocusReleased:Fire()
    end
end

return Input