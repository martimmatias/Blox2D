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
    table.print(math)

    local vec1 = Vector2.new(10, 0)
    local vec2 = Vector2.new(0, 10)
    
    local instance = Instance.new()
    
    instance.Changed:Connect(function(property)
        print(property,"changed!")
    end)
    instance.ChildAdded:Connect(function(child)
        print("instance.ChildAdded: ",child)
    end)
    instance.ChildRemoved:Connect(function(child)
        print("instance.ChildRemoved: ",child)
    end)
    instance:GetPropertyChangedSignal("Name"):Connect(function()
        print("GetPropertyChangedSignal Name")
    end)
    instance.Name = "Parent"

    local child = Instance.new()
    child.Name = "Child"
    child.Parent = instance

    print("child.Parent: ", child.Parent)
    print(":FindFirstChild Child: ", instance:FindFirstChild("Child"))
    print(":FindFirstChildOfClass Instance: ", instance:FindFirstChildOfClass("Instance"))
    print(":FindFirstAncestor Parent: ", child:FindFirstAncestor("Parent"))
    print(":FindFirstAncestorOfClass Instance: ", child:FindFirstAncestorOfClass("Instance"))
    print(":GetFullName: ", child:GetFullName())
    print(":IsA Instance", child:IsA("Instance"))

    instance.Parent = workspace

    print(child:GetFullName())
    child:Destroy()--]]
end