function MakeStorage()
	local Storage = Instance.new("Folder")
	Storage.Parent = game:GetService("LocalizationService")
	Storage.Name = "Storage"
	
	return Storage
end

local Steward = {}
Steward.__index = Steward

function Steward.new()
	MakeStorage()
	local self = setmetatable({}, Steward)
	return self
end

function Steward.Make(Type, Parent, Name, Value)
	if Type == "String" then
		local String = Instance.new("StringValue")
		
		String.Parent = Parent
		String.Name = Name
		String.Value = Value
	end
	
	if Type == "Number" then
		local Number = Instance.new("NumberValue")

		Number.Parent = Parent
		Number.Name = Name
		Number.Value = Value
	end
	
	if Type == "Int" then
		local Int = Instance.new("IntValue")

		Int.Parent = Parent
		Int.Name = Name
		Int.Value = Value
	end
	
	if Type == "Bool" then
		local Bool = Instance.new("BoolValue")

		Bool.Parent = Parent
		Bool.Name = Name
		Bool.Value = Value
	end
	
	if Type == "Color3" then
		local Color3V = Instance.new("Color3Value")

		Color3V.Parent = Parent
		Color3V.Name = Name
		Color3V.Value = Value
	end
	
	if Type == "CFrame" then
		local Cframe = Instance.new("CFrameValue")

		Cframe.Parent = Parent
		Cframe.Name = Name
		Cframe.Value = Value
	end
	
	if Type == "BrickColor" then
		local BrickColour = Instance.new("BrickColorValue")

		BrickColour.Parent = Parent
		BrickColour.Name = Name
		BrickColour.Value = Value
	end
	
	if Type == "Ray" then
		local RayV = Instance.new("RayValue")

		RayV.Parent = Parent
		RayV.Name = Name
		RayV.Value = Value
	end
	
	if Type == "Object" then
		local Object = Instance.new("ObjectValue")

		Object.Parent = Parent
		Object.Name = Name
		Object.Value = Value
	end
end

function Steward.Find(Name)
	for i, v in pairs(game:GetDescendants()) do
		if v.Name == Name then
			return v
		else
			warn("No string found such as "..Name)
		end
	end
end

function Steward.Destroy(Name)
	for i, v in pairs(game:GetDescendants()) do
		if v.Name == Name then
			local Backup = v:Clone()
			Backup.Parent = MakeStorage()
			
			v:Destroy()
		end
	end
end

function Steward.Restore(Name, Parent)
	for i, v in pairs(MakeStorage():GetChildren()) do
		if v.Name == Name then
			v.Parent = Parent
			return v
		else
			warn("No String Found")
		end
	end
end

return Steward
