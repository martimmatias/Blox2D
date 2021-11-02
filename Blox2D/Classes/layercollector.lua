local Class, Table, getters, setters, newFunc = _Inherit(require("Blox2D.Classes.guibase2d"), "LayerCollector")
local GlobalZIndex = Enum.ZIndexBehavior.Global
local SiblingZIndex = Enum.ZIndexBehavior.Sibling
function setters:ResetOnSpawn(value)
    Check("Set(ResetOnSpawn)", "boolean", value, "value")
    self:Set("ResetOnSpawn", value)
end

function setters:Enabled(value)
    Check("Set(Enabled)", "boolean", value, "value")
    self:Set("Enabled", value)
end

function setters:ZIndexBehavior(value)
    self:_SetEnum("ZIndexBehavior", value, Enum.ZIndexBehavior)
end

--_Objects is private
function setters:Objects()
end

local OrderDraw = Blox2D.OrderDraw
local OrderDrawGuiObject = Blox2D.OrderDrawGuiObject
function Table:_Add(value)
    Check("_Add()", "table", value or 1, "value")
    if typeof(value) == "Instance" and value:IsA("GuiObject") then
        table.insert(self._Objects, value)
        if self._ZIndexBehavior == GlobalZIndex then
            self:_ReOrder()
        end
        return true
    end
end

function Table:_Remove(value)
    Check("_Add()", "table", value, "value")
    if typeof(value) == "Instance" and value:IsA("GuiObject") then
        local i = table.find(self._Objects, value)
        if i then
            table.remove(self._Objects, i)
            return true
        end
    end
end

function Table:_ReOrder()
    table.sort(self._Objects, OrderDraw)
end

function Table:_Draw()
    if self._Enabled then
        local siblingMode = self._ZIndexBehavior == SiblingZIndex
        for i, guiObject in pairs(self._Objects) do
            guiObject:_Draw(siblingMode)
        end
    end
end

Class.new = function ()
    local instance = newFunc()
    rawset(instance, "_ResetOnSpawn", true)
    rawset(instance, "_Enabled", true)
    rawset(instance, "_ZIndexBehavior", Enum.ZIndexBehavior.Sibling)
    rawset(instance, "_Objects", {})
    return instance
end

return Class