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
    CollonFunction = ":%s()"
}
local MyPath = "Blox2D."
require(MyPath.."Utils")
require(MyPath.."DataTypes")
require(MyPath.."Classes")

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

workspace = game:GetService("Workspace")
workspace.Name = "workspace"
local camera = Instance.new("Camera")
camera.Parent = workspace
workspace.CurrentCamera = camera
camera = nil
--workspace.CurrentCamera = Instance.new("Camera", workspace)

Blox2D.quit = function()
    --table.print(table.create(1000, "e"))
    rawget(game, "_Close"):Fire()
end
love.quit = Blox2D.quit

Blox2D.load = function()
    
end
love.load = Blox2D.load()

Blox2D.update = function(dt)
    
end
love.update = Blox2D.update

Blox2D.focus = function(focus)
    
end
love.focus = Blox2D.focus

Blox2D.resize = function(w, h)
    if workspace.CurrentCamera then
        rawset(workspace.CurrentCamera, "_ViewportSize", Vector2.new(w, h))
    end
end
love.resize = Blox2D.resize

Blox2D.draw = function()
    --local start = love.timer.getTime()
    if rawget(workspace, "_CurrentCamera") == nil then
        warn("CurrentCamera is nil!")
        return
    end
    love.graphics.push()
    love.graphics.translate(rawget(workspace.CurrentCamera, "_Position").X, rawget(workspace.CurrentCamera, "_Position").Y)
    for i, instance in pairs(DrawOrder) do
        love.graphics.setColor(
            rawget(instance, "_Color").R,
            rawget(instance, "_Color").G,
            rawget(instance, "_Color").B,
            1-rawget(instance, "_Transparency")
        )
        love.graphics.rectangle(
        "fill",
        rawget(instance, "_Position").X,
        rawget(instance, "_Position").Y,
        rawget(instance, "_Size").X,
        rawget(instance, "_Size").Y
        )
    end
    love.graphics.pop()
    --print((love.timer.getTime()-start)*1000)
end
love.draw = Blox2D.draw

--return Blox2D