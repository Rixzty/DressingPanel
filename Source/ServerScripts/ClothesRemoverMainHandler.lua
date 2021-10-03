-- Services --

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Variables --

local Event = ReplicatedStorage:WaitForChild("ClothingRemovalEvent")

-- Functions --

function GetAssetID(ID)
	local Success, Model = pcall(function() 
		return game:GetService("InsertService"):LoadAsset(ID) 
	end)
	if Success then
		local NewID = nil
		if Model:FindFirstChildWhichIsA("Shirt") then
			NewID = Model.Shirt.ShirtTemplate
		elseif Model:FindFirstChildWhichIsA("Pants") then
			NewID = Model.Pants.PantsTemplate
		elseif Model:FindFirstChildWhichIsA("ShirtGraphic") then
			Model.Parent = workspace
			NewID = Model["Shirt Graphic"].Graphic
		elseif Model:FindFirstChildWhichIsA("Decal") then
			local Decal = Model:FindFirstChildWhichIsA("Decal")
			if Decal.Name == "face" then
				NewID = Model.face.Texture
			end
		elseif Model:FindFirstChildWhichIsA("Accessory") then
			local Accessory = Model:FindFirstChildWhichIsA("Accessory")
			return Accessory
		end
		Model:Destroy()
		return NewID
	else
		return nil
	end
end

function RemoveClothes(Player, Type)
	local Character = Player.Character or Player.Chracter:Wait()
	--local HumanoidDescription
	
	--pcall(function()
		--HumanoidDescription = Players:GetHumanoidDescriptionFromUserId(Player.UserId)
	--end)
	
	if Type == "Face" then
		Character.Head:WaitForChild("face"):Destroy()
	elseif Type == "Shirt" then
		--if HumanoidDescription then
			--local ShirtId = GetAssetID(HumanoidDescription.Shirt)
			local Shirt = Character:FindFirstChildWhichIsA("Shirt")
			
			--if not Shirt then
			--	if ShirtId then
			--		Shirt = Instance.new("Shirt", Character)
			--	else
			--		return
			--	end
			--end
			
			--if ShirtId then
			--	Shirt.ShirtTemplate = ShirtId
			--else
			--	Shirt:Destroy()
			--end
			
			if Shirt then
				Shirt:Destroy()
			end
		--end
	elseif Type == "Pants" then
		--if HumanoidDescription then
			--local PantsId = GetAssetID(HumanoidDescription.Pants)
			local Pants = Character:FindFirstChildWhichIsA("Pants")
			
			--if not Pants then
			--	if PantsId then
			--		Pants = Instance.new("Pants", Character)
			--	else
			--		return
			--	end
			--end
			
			--if PantsId then
			--	Pants.PantsTemplate = PantsId
			--else
			--	Pants:Destroy()
			--end
		
			if Pants then
				Pants:Destroy()
			end
		--end
	elseif Type == "TShirt" then
		--if HumanoidDescription then
		--	local TShirtId = GetAssetID(HumanoidDescription.GraphicTShirt)
			local TShirt = Character:FindFirstChildWhichIsA("ShirtGraphic")
			
		--	if not TShirt then
		--		if TShirtId then
		--			TShirt = Instance.new("ShirtGraphic", Character)
		--		else
		--			return
		--		end
		--	end
			
		--	if TShirtId then
		--		TShirt.Graphic = TShirt
		--	else
		--		TShirt:Destroy()
		--	end
			
			if TShirt then
				TShirt:Destroy()
			end
		--end
	elseif Type == "Accessories" then
		for _, Accessory in pairs(Character:GetChildren()) do
			if Accessory:IsA("Accessory") then
				Accessory:Destroy()
			end
		end
	end
end

-- Scripting --

Event.OnServerEvent:connect(RemoveClothes)
