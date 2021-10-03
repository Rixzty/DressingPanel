-- Services --

local InsertService = game:GetService("InsertService")
local MarketplaceService = game:GetService("MarketplaceService")

local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Variables --

local Event = ReplicatedStorage:WaitForChild("ClothingEvent")

-- Functions --

function IsAccessory(AssetType)
	local AccessoryTypes = {8, 40, 41, 42, 43, 44, 45, 46, 47, 57, 58, 63, 64, 65, 66, 67, 68, 69, 70, 71}
	
	for _, Type in pairs(AccessoryTypes) do
		if Type == AssetType then
			return true
		end
	end
	return false
end

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

function ChangeAppearance(Player, ID)
	local Character = Player.Character or Player.Chracter:Wait()

	ID = tonumber(ID) or nil
	if nil then return end
	pcall(function()
		local Info = MarketplaceService:GetProductInfo(ID)
		local AssetID = GetAssetID(ID)

		if Info.AssetTypeId == 2 then
			local ShirtGraphic = Character:FindFirstChildWhichIsA("ShirtGraphic")
			if not ShirtGraphic then
				ShirtGraphic = Instance.new("ShirtGraphic")
				ShirtGraphic.Parent = Character
			end
			ShirtGraphic.Graphic = AssetID
		elseif Info.AssetTypeId == 11 then
			local Shirt = Character:FindFirstChildWhichIsA("Shirt")
			if not Shirt then
				Shirt = Instance.new("Shirt")
				Shirt.Parent = Character
			end
			Shirt.ShirtTemplate = AssetID
		elseif Info.AssetTypeId == 12 then
			local Pants = Character:FindFirstChildWhichIsA("Pants")
			if not Pants then
				Pants = Instance.new("Pants")
				Pants.Parent = Character
			end
			Pants.PantsTemplate = AssetID
		elseif Info.AssetTypeId == 18 then
			local Face = Character.Head:FindFirstChild("face")
			if not Face then
				Face = Instance.new("Decal")
				Face.Parent = Character.Head
				Face.Name = "face"
			end
			Face.Texture = AssetID
		elseif IsAccessory(Info.AssetTypeId) then
			local AccessoryParent = AssetID.Parent
			AssetID.Parent = Character
			AccessoryParent:Destroy()
		end
	end)
end

-- Scripting --

Event.OnServerEvent:connect(ChangeAppearance)
