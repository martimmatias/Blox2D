Blox2D = {}
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


---@diagnostic disable-next-line: lowercase-global
game = Instance.new("DataModel")
game.Name = "game"

workspace = game:GetService("Workspace")

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

Blox2D.draw = function()
    
end
love.draw = Blox2D.draw

--return Blox2D