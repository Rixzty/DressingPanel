-- Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Variables
local GUI = script.Parent
local TextBox = GUI:WaitForChild("TextBox")
local Button = GUI:WaitForChild("TextButton")

local Event = ReplicatedStorage:WaitForChild("ClothingEvent")

-- Script
Button.MouseButton1Click:connect(function()
	local ID = tonumber(TextBox.Text) or nil
	if ID then
		Event:FireServer(ID)
	end
end)
