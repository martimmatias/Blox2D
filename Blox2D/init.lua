Blox2D = {}
Blox2D._Instances = {}
local DrawOrder = {}
Blox2D._DrawOrder = DrawOrder

Blox2D._ErrorMessages = {
    NotImplemented = "%s is not implemented",
    __newindex = "Attempted to set %s property: %s to %s (%s)",
    __div = "Attempted division operation on %s and %s (%s)",
    __mul = "Attempted multiply operation on %s and %s (%s)",
    __add = "Attempted addition operation on %s and %s (%s)",
    __sub = "Attempted subtraction operation on %s and %s (%s)",
    CollonFunction = ":%s()",
    CantCollonFunction = "Can't use :%s() on %s",
    WrongEnumType = "%s is not of the %s EnumType!",
}

local MyPath = "Blox2D."
require(MyPath.."Utils")
require(MyPath.."DataTypes")
Blox2D._Classes = require(MyPath.."Classes")

Blox2D._Draw = ScriptSignal.new()

local function OrderDraw(instanceA, instanceB)
    return rawget(instanceA, "_ZIndex") < rawget(instanceB, "_ZIndex")
end

function Blox2D._AddToDrawOrder(instance)
    table.insert(DrawOrder, instance)
    table.sort(DrawOrder, OrderDraw)
end

function Blox2D._RemoveFromDrawOrder(instance)
    for i,v in pairs(DrawOrder) do
        if v == instance then
            table.remove(DrawOrder, i)
            break
        end
    end
end

function Blox2D._UpdateDrawOrder(instance)
    table.sort(DrawOrder, OrderDraw)
end

---@diagnostic disable-next-line: lowercase-global
game = Instance.new("DataModel")
game.Name = "game"

local RunService = game:GetService("Run Service")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
local ServerScriptService = game:GetService("ServerScriptService")

---@diagnostic disable-next-line: lowercase-global
workspace = game:GetService("Workspace")

local camera = Instance.new("Camera")
camera.Parent = workspace
workspace.CurrentCamera = camera
camera = nil


Blox2D.quit = function()
    rawget(game, "_Close"):Fire()
end
love.quit = Blox2D.quit

Blox2D.load = function()
    
end
love.load = Blox2D.load()

Blox2D.update = function(dt)
    RunService.Stepped:Fire()

    RunService.Heartbeat:Fire()
end
love.update = Blox2D.update

Blox2D.focus = function(focus)
    print(focus)
end
love.focus = Blox2D.focus

Blox2D.resize = function(w, h)
    if workspace.CurrentCamera then
        rawset(workspace.CurrentCamera, "_ViewportSize", Vector2.new(w, h))
    end
end
love.resize = Blox2D.resize

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
local InputObjects = {}
Blox2D.keypressed = function(key, scanCode, isRepeat)
    local keyCode = Enum.KeyCode[key] or Enum.KeyCode[keyToKeyCodeName[key]]
    if keyCode == nil then
        warn(keyCode, "does not have a corresponding KeyCode Enum")
        return
    end
    local inputObject = Instance.new("InputObject")
    inputObject.KeyCode = keyCode
    inputObject.UserInputState = Enum.UserInputState.Begin
    inputObject.UserInputType = Enum.UserInputType.Keyboard
    InputObjects[key] = inputObject
    UserInputService.InputBegan:Fire(inputObject, false)
    --UserInputService:_NewInputObject(key)
end
love.keypressed = Blox2D.keypressed

Blox2D.keyreleased = function (key, scanCode)
    --local keyCode = Enum.KeyCode[key] or Enum.KeyCode[keyToKeyCodeName[key]]
    --if keyCode == nil then return end
    local inputObject = InputObjects[key]
    if inputObject ~= nil then
        inputObject.UserInputState = Enum.UserInputState.End
        UserInputService.InputEnded:Fire(inputObject, false)
    end
end
love.keyreleased = Blox2D.keyreleased

Blox2D.mousepressed = function (x, y, button, isTouch)
    if button > 3 then
        return
    end
    local inputObject = Instance.new("InputObject")
    inputObject.UserInputState = Enum.UserInputState.Begin
    inputObject.Position = Vector2.new(x, y)

    if isTouch == true then
        inputObject.UserInputType = Enum.UserInputType.Touch
    else
        inputObject.UserInputType = Enum.UserInputType["MouseButton"..tostring(button)]
    end
    InputObjects[inputObject.UserInputType.Name] = inputObject
    UserInputService.InputBegan:Fire(inputObject, false)
end
love.mousepressed = Blox2D.mousepressed

Blox2D.mousereleased = function (x, y, button, isTouch, presses)
    if button > 3 then
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
        inputObject.UserInputState = Enum.UserInputState.End
        UserInputService.InputEnded:Fire(inputObject, false)
    end
end
love.mousereleased = Blox2D.mousereleased

Blox2D.mousemoved = function (x, y, dx, dy, isTouch)
    local inputObject = InputObjects["MouseMovement"]
    if inputObject == nil then
        Instance.new("InputObject")
        inputObject.Position = Vector2.new(x, y)
        InputObjects["MouseMovement"] = inputObject
    end
    rawset(inputObject.Position, "X", x)
    rawset(inputObject.Position, "Y", y)
    rawset(inputObject.Delta, "X", dx)
    rawset(inputObject.Delta, "Y", dy)
    inputObject.UserInputState = Enum.UserInputState.Change
    UserInputService.InputChanged:Fire(inputObject, false)
end
love.mousemoved = Blox2D.mousemoved

Blox2D.draw = function()
    RunService.PreRender:Fire()
    RunService.RenderStepped:Fire()
    --local start = love.timer.getTime()
    if rawget(workspace, "_CurrentCamera") == nil then
        warn("CurrentCamera is nil!")
        return
    end
    love.graphics.push()
    
    local cameraX = rawget(workspace.CurrentCamera, "_Position").X
    local cameraY = rawget(workspace.CurrentCamera, "_Position").Y

    local position
    local size
    love.graphics.translate(cameraX, cameraY)
    
    for i, instance in pairs(DrawOrder) do
       --love.graphics.origin()
        love.graphics.push()

        size = rawget(instance, "_Size")
        position = rawget(instance, "_Position")

        love.graphics.translate(position.X, position.Y)
        love.graphics.rotate(math.rad(rawget(instance, "_Rotation")))
        love.graphics.translate(-size.X/2, -size.Y/2)
        
        love.graphics.setColor(
            rawget(instance, "_Color").R,
            rawget(instance, "_Color").G,
            rawget(instance, "_Color").B,
            1-rawget(instance, "_Transparency")
        )
        love.graphics.rectangle(
        "fill",
        0,
        0,
        size.X,
        size.Y
        )
        love.graphics.pop()
    end
    
    love.graphics.pop()
    
    --print((love.timer.getTime()-start)*1000)
end
love.draw = Blox2D.draw

--return Blox2D