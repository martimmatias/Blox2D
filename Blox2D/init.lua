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

local InputObjects = {}

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
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")

Blox2D.Input = require(MyPath.."blox2dinput")

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
    RunService.Stepped:Fire(0, dt)
    
    Blox2D.Input.update()

    RunService.Heartbeat:Fire(dt)
end
love.update = Blox2D.update

Blox2D.focus = function(focus)
    Blox2D.Input.focus(focus)
end
love.focus = Blox2D.focus

Blox2D.resize = function(w, h)
    if workspace.CurrentCamera then
        rawset(workspace.CurrentCamera, "_ViewportSize", Vector2.new(w, h))
    end
end
love.resize = Blox2D.resize

Blox2D.keypressed = function(key, scanCode, isRepeat)
    Blox2D.Input.keypressed(key, scanCode, isRepeat)
end
love.keypressed = Blox2D.keypressed

Blox2D.keyreleased = function (key, scanCode)
    Blox2D.Input.keyreleased(key, scanCode)
end
love.keyreleased = Blox2D.keyreleased

Blox2D.mousepressed = function (x, y, button, isTouch)
    Blox2D.Input.mousepressed(x, y, button, isTouch)
end
love.mousepressed = Blox2D.mousepressed

Blox2D.mousereleased = function (x, y, button, isTouch, presses)
    Blox2D.Input.mousereleased(x, y, button, isTouch, presses)
end
love.mousereleased = Blox2D.mousereleased

Blox2D.mousemoved = function (x, y, dx, dy, isTouch)
    Blox2D.Input.mousemoved(x, y, dx, dy, isTouch)
end
love.mousemoved = Blox2D.mousemoved

Blox2D.wheelmoved = function(x, y)
    Blox2D.Input.wheelmoved(x, y)
end
love.wheelmoved = Blox2D.wheelmoved

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
        if instance._PartShape == Enum.PartShape.Circle then
            love.graphics.circle(
                "fill",
                0,
                0,
                size.X/2
            )
        else
            love.graphics.rectangle(
                "fill",
                0,
                0,
                size.X,
                size.Y
            )
        end
        
        love.graphics.pop()
    end
    
    love.graphics.pop()
    
    --print((love.timer.getTime()-start)*1000)
end
love.draw = Blox2D.draw

--return Blox2D