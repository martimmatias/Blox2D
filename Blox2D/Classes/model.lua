local Class, Table, getters, setters, newFunc = _Inherit(Instance, "Model")

function setters:PrimaryPart(part)
    if part ~= nil then
        Check("Set(PrimaryPart)", "table", part, "part")
        if not typeof(part) == "Instance" and not part:IsA("BasePart") then return end
        if not part:IsDescendantOf(self) then return end
    end
    self:Set("PrimaryPart", part)
end

function Table:MoveTo(position)
    Check("Model:MoveTo", "table", position, "position")
    if not typeof(position) == "Vector2" then return end

    local children = rawget(self, "_Children")
    if #children < 1 then
        return
    end

    local primaryPart = rawget(self, "_PrimaryPart") or children[1] --PrimaryPart or root part

    local startPos = rawget(primaryPart, "_Position")
    local moveVector = position-startPos

    for _, child in pairs(children) do
        if child:IsA("BasePart") then
            --maybe reset orientation to keep up with rblx behaviour
            child.Position = child.Position + moveVector
        elseif child:IsA("Model") then
            local pp = rawget(child, "_PrimaryPart") or rawget(child, "_Children")[1]
            if pp ~= nil then
                child:MoveTo(position+(pp.Position-startPos))
            end
        end
    end
end

Class.new = function ()
    local instance = newFunc()
    instance.ChildRemoved:Connect(function(child)
        if child == rawget(instance, "_PrimaryPart") then
            instance.PrimaryPart = nil
        end
    end)
    return instance
end

return Class