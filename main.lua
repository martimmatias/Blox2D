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
    Blox2D.load()

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

    workspace.CurrentCamera.Position = Vector2.new(000, 0)

    --local zeroPart = Instance.new("BasePart", workspace)

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

    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = game.Players.LocalPlayer.PlayerGui

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0.5,0,0.5,0)
    frame.BorderSizePixel = 1
    frame.Parent = screenGui

    --[[local frame2 = Instance.new("Frame")
    frame2.Size = UDim2.new(.5,0,.5,0)
    frame2.BackgroundColor3 = Color3.new(1,0,0)
    frame2.Parent = frame--]]

    local RunService = game:GetService("RunService")
    RunService.Heartbeat:Connect(function(dt)
        workspace.Model.BasePart.Rotation = workspace.Model.BasePart.Rotation+dt*45
        frame.Rotation = frame.Rotation+dt*45
        --frame.Position = frame.Position+UDim2.new(0,0,0,1)
    end)
end