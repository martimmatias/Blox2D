local Class, Table, getters, setters, newFunc = _Inherit(Instance, "Players")

function Table:GetPlayers()
    local players = {}
    for _, player in pairs(self._Children) do
        if player:IsA("Player") then
            table.insert(players, player)
        end
    end
    return players
end

function Table:CreateLocalPlayer()
    local player = Instance.new("Player")
    local playerGui = Instance.new("PlayerGui", player)
    player.Parent = self
    rawset(self, "_LocalPlayer", player)
    return player
end

Class.new = function ()
    local instance = newFunc()
    rawset(instance, "PlayerAdded", ScriptSignal.new())
    rawset(instance, "PlayerRemoving", ScriptSignal.new())
    rawset(instance, "_RespawnTime", 5)
    return instance
end

return Class