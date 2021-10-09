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

---@diagnostic disable-next-line: lowercase-global
game = Instance.new("DataModel")
game.Name = "game"

workspace = game:GetService("Workspace")
workspace.Name = "workspace"

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

function DrawWorkspaceInstance()
    
end

Blox2D.draw = function()
    for i, instance in pairs(DrawOrder) do
        love.graphics.setColor( 1/i, 0, 0)
        love.graphics.rectangle( "fill", instance.Position.X, instance.Position.Y,
        instance.Size.X, instance.Size.Y)
    end
end
love.draw = Blox2D.draw

--return Blox2D