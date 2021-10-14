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
    
    
    --[[local parent = Instance.new("BasePart")
    parent.Name = "Parent Part"
    parent.Position = Vector2.new(2*90, 2*90)
    parent.Size = Vector2.new(10,10)
    parent.ZIndex = 2
    parent.Transparency = 1
    parent.Parent = workspace--]]

    local model = Instance.new("Model", workspace)

    for i = 1, 2 do
        local part = Instance.new("BasePart")
        part.Position = Vector2.new(i*90, i*90)
        part.ZIndex = i
        part.Transparency = i*0.25
        part.Parent = model--parent
    end

    model.BasePart.BrickColor = BrickColor.Red()

    local model2 = Instance.new("Model", model)
    local part = Instance.new("BasePart")
    part.Position = Vector2.new(180, 90)
    part.Parent = model2

    model:MoveTo(Vector2.new(100, 340))

    --parent.BasePart.Parent = workspace

    --parent.BrickColor = BrickColor.Red()

    --[[local testClass, tbl, getters, setters, newFunc = _Inherit(Instance, "Test", Instance.__getters_metatable, Instance.__setters_metatable)
    --table.print(testClass)

    testClass.new = function ()
        local instance = newFunc()
        rawset(instance, "_Test", true)
        return instance
    end--]]

    --[[local runservice = game:GetService("Run Service")
    --table.print(runservice)
    print(runservice)
    runservice.PreRender:Connect(function ()
        print("prerender")
    end)--]]
end