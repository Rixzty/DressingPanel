-- Services --

local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Variables --

local Button = script.Parent
local Event = ReplicatedStorage:WaitForChild("RefreshEvent")

-- Scripting --

Button.MouseButton1Click:connect(function()
	Event:FireServer()
end)
