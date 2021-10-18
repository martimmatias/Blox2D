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

Blox2D.keypressed = function(key, scanCode, isRepeat)
    UserInputService:_NewInputObject(key)
end
love.keypressed = Blox2D.keypressed

Blox2D.keyreleased = function (key, scanCode)
    
end
love.keyreleased = Blox2D.keyreleased

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