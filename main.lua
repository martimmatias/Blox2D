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
    for i = 1, 5 do
        local part = Instance.new("BasePart")
        part.Position = Vector2.new(i*90, i*90)
        part.ZIndex = i
        part.Transparency = i*0.25
        part.Parent = workspace
    end
end