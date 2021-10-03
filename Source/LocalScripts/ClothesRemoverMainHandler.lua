-- Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Variables
local GUI = script.Parent
local FaceRemover = GUI:WaitForChild("FaceRemover")
local ShirtRemover = GUI:WaitForChild("ShirtRemover")
local PantsRemover = GUI:WaitForChild("PantsRemover")
local TShirtRemover = GUI:WaitForChild("TShirtRemover")
local AccessoryRemover = GUI:WaitForChild("AccessoryRemover")

local Event = ReplicatedStorage:WaitForChild("ClothingRemovalEvent")

-- Scripting
FaceRemover.MouseButton1Click:connect(function()
	Event:FireServer("Face")
end)

ShirtRemover.MouseButton1Click:connect(function()
	Event:FireServer("Shirt")
end)

PantsRemover.MouseButton1Click:connect(function()
	Event:FireServer("Pants")
end)

TShirtRemover.MouseButton1Click:connect(function()
	Event:FireServer("TShirt")
end)

AccessoryRemover.MouseButton1Click:connect(function()
	Event:FireServer("Accessories")
end)
