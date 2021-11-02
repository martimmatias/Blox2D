local Class, Table, getters, setters, newFunc = _Inherit(require("Blox2D.Classes.guibase2d"), "LayerCollector")
local GlobalZIndex = Enum.ZIndexBehavior.Global
local SiblingZIndex = Enum.ZIndexBehavior.Sibling
local ToRads = math.rad
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

local function rotatePoint(x, y, centerX, centerY, radians)
	-- Translate the plane on which rotation is occurring.
	-- We want to rotate around the center. We'll add these back later.
	x = x - centerX;
	y = y - centerY;

	-- Perform the rotation
	local newPointX = x * math.cos(radians) - y * math.sin(radians);
	local newPointY = x * math.sin(radians) + y * math.cos(radians);

	-- Translate the plane back to where it was.
	newPointX = newPointX + centerX;
	newPointY = newPointY + centerY;

	return newPointX, newPointY;
end

local function distance(x1, y1, x2, y2)
	--return math.abs(x1 - x2) + math.abs(y1-y2)
    return math.sqrt(((x1-x2)^2)+((y1-y2)^2))
end

--Heron's formula (triangle area)
local function triangleArea(d1, d2, d3)
	local s = (d1 + d2 + d3) / 2;
	return math.sqrt(s * (s - d1) * (s - d2) * (s - d3));
end

local function IsMouseInsideGuiObject(guiObject, x, y)
    local position = guiObject._AbsolutePosition
    local size = guiObject._AbsoluteSize
    local rot = ToRads(guiObject._AbsoluteRotation)
    if rot == 0 then
        return ((x > position.X and x < position.X + size.X) and (y > position.Y and y < position.Y + size.Y))
    else
        local topLeftX = position.X
        local topLeftY = position.Y
        local topRightX = position.X + size.X
        local topRightY = position.Y
        local botLeftX = position.X
        local botLeftY = position.Y + size.Y
        local botRightX = topRightX
        local botRightY = botLeftY

        local centerX = topLeftX + size.X/2
        local centerY = topLeftY + size.Y/2

        topLeftX, topLeftY = rotatePoint(topLeftX, topLeftY, centerX, centerY, rot)
        topRightX, topRightY = rotatePoint(topRightX, topRightY, centerX, centerY, rot)
        botLeftX, botLeftY = rotatePoint(botLeftX, botLeftY, centerX, centerY, rot)
        botRightX, botRightY = rotatePoint(botRightX, botRightY, centerX, centerY, rot)

        --Click, topLeft, topRight
        local triAreas = triangleArea(
            distance(x, y, topLeftX, topLeftY),
            distance(topLeftX, topLeftY, topRightX, topRightY),
            distance(topRightX, topRightY, x, y)
        )
        --Click, topRight, botRight
        + triangleArea(
            distance(x, y, topRightX, topRightY),
            distance(topRightX, topRightY, botRightX, botRightY),
            distance(botRightX, botRightY, x, y)
        )
        --Click, botRight, botLeft
        + triangleArea(
            distance(x, y, botRightX, botRightY),
            distance(botRightX, botRightY, botLeftX, botLeftY),
            distance(botLeftX, botLeftY, x, y)
        )
        --Click, botLeft, topLeft
        + triangleArea(
            distance(x, y, botLeftX, botLeftY),
            distance(botLeftX, botLeftY, topLeftX, topLeftY),
            distance(topLeftX, topLeftY, x, y)
        )

        if math.floor(triAreas) == math.floor(size.X*size.Y) then
            return true
        end
    end
    return false
end


function Table:_OnMouseMoved(x, y, dx, dy, istouch)
    if self._Enabled then
        for i, guiObject in pairs(self._Objects) do
            if guiObject._Visible == true then
                --print(IsMouseInsideGuiObject(guiObject, x, y))
            end
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