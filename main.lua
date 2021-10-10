require"Blox2D"

function love.draw()
    Blox2D.draw()
    love.graphics.print("Hello World!", 100, 100)
    
end

function love.update(dt)
    Blox2D.update(dt)
end

function love.quit()
    Blox2D.quit()
end

function love.load()
    --local brickColor = BrickColor.new("Bright red")
    --table.print(brickColor)
    
    
    local parent = Instance.new("BasePart")
    parent.Name = "Parent Part"
    parent.Position = Vector2.new(2*90, 2*90)
    parent.Size = Vector2.new(10,10)
    parent.ZIndex = 2
    parent.Transparency = 0.5
    parent.Parent = workspace

    for i = 1, 1 do
        local part = Instance.new("BasePart")
        part.Position = Vector2.new(i*90, i*90)
        part.ZIndex = i
        part.Transparency = i*0.25
        part.Parent = parent
    end

    parent.BasePart.Parent = workspace
end