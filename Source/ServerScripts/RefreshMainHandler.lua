-- Services --

local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Variables --

local Event = ReplicatedStorage:WaitForChild("RefreshEvent")

-- Scripting --

Event.OnServerEvent:connect(function(Player)
	local Character = Player.Character or Player.Character:Wait()
	local OldPosition = Character.HumanoidRootPart.CFrame
	Player:LoadCharacter()
	
	local Character = Player.Character or Player.Character:Wait()
	Character.HumanoidRootPart.CFrame = OldPosition
end)
