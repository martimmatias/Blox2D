require"Blox2D"

function love.draw()
    Blox2D.draw()
    love.graphics.print("Hello World!", 100, 100)
    
end

function love.update(dt)
    Blox2D.update(dt)
    workspace.Model.BasePart.Rotation = workspace.Model.BasePart.Rotation+dt*45
end

function love.quit()
    Blox2D.quit()
end

function love.load()
    Blox2D.load()
    --local brickColor = BrickColor.new("Bright red")
    --table.print(brickColor)

    local model = Instance.new("Model", workspace)

    for i = 1, 2 do
        local part = Instance.new("BasePart")
        part.Position = Vector2.new((i-1)*100, (i-1)*0)
        part.ZIndex = i
        part.Transparency = (i-1)*0.4
        part.BrickColor = BrickColor.palette(i*16)
        part.Parent = model--parent
    end

    

    local model2 = Instance.new("Model", model)
    local part = Instance.new("BasePart")
    part.Position = Vector2.new(0, 105)
    part.BrickColor = BrickColor.Red()
    part.PartShape = Enum.PartShape.Circle
    part.Parent = model2

    model:MoveTo(Vector2.new(100, 400))

    workspace.CurrentCamera.Position = Vector2.new(200, 0)

    local UserInputService = game:GetService("UserInputService")
    local testInputObject
    UserInputService.InputBegan:Connect(function (inputObject, uiProcessed)
        if inputObject.KeyCode == Enum.KeyCode.Comma then
            testInputObject = inputObject
        end
    end)
    UserInputService.InputEnded:Connect(function (inputObject, uiProcessed)
        if testInputObject == inputObject then
            print(testInputObject.UserInputState.Name)
        end
    end)
    --print(Enum.KeyCode.Zero.Name, Enum.KeyCode.Zero.Value, Enum.KeyCode[48].Value)
    --local clone = part:Clone()
    --clone.Position = clone.Position+Vector2.new(300, 0)
    --[[local runservice = game:GetService("Run Service")
    --table.print(runservice)
    print(runservice)
    runservice.PreRender:Connect(function ()
        print("prerender")
    end)--]]
end