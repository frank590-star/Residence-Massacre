local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Remotes = ReplicatedStorage:WaitForChild("Remotes", 15)

local Teleport_Locations = {
	Shack = Vector3.new(-79, 4.5, -129),
	FuseBox = Vector3.new(-1, 4.5, -92.5),
	Entrance = Vector3.new(-11.5, 4.6, -24.2)
}
local Connections = {}

-- Main functions --
local function Notify(Title1, Content2, Duration3, Image)
	Rayfield:Notify({Title = Title1, Content = Content2, Duration = Duration3, Image = 4483362458})
end

-- Main Tab --
function KillAntiCheat()
	local Plr = Players.LocalPlayer

	if not Plr then
		warn("Plr is not valid.")
	end

	if Plr:FindFirstChild("PlayerScripts") and Plr.PlayerScripts:FindFirstChild("LocalScript") then
		Plr.PlayerScripts.LocalScript.Parent = game:GetService("TestService")
		Notify("Success", "Succesfully killed the client anti-cheat", 8)
	else
		Notify("Error", "The Anti-cheat doesn't exist", 8)
	end
end

-- Badges Tab --
function Asphyxia_Badge()
	if not Remotes then
		warn("Remotes is not valid.")
		Notify("Error", "Remotes is not valid.", 8)
	end

	local Badge = Remotes:FindFirstChild("Asphyxia")

	if Badge and Badge:IsA("RemoteEvent") then
		Badge:FireServer()
		Notify("Success", "Succesfully executed Asphyxia badge", 8)
	end
end

function WarmSip_Badge()
	if not Remotes then
		warn("Remotes is not valid.")
	end
	local Badge = Remotes:FindFirstChild("HotChocolate")

	if Badge and Badge:IsA("RemoteEvent") then
		Badge:FireServer()
		Notify("Success", "Succesfully executed Warm Sip badge", 8)
	end
end

------------ -----------------------

-- Character Tab --
function InfStamina(Value)
	local Plr = Players.LocalPlayer

	if not Plr then
		warn("Plr is not valid.")
	end

	if Value == true then
		Connections["Infinite_Stamina"] = RunService.RenderStepped:Connect(function()
			if Plr.Character then
				if Plr.Character:FindFirstChild("Sprint") and Plr.Character.Sprint:FindFirstChild("Stam") then
					Plr.Character.Sprint.Stam.Value = Plr.Character.Sprint.Stam:GetAttribute("Max") or 5
				else
					Connections["Infinite_Stamina"]:Disconnect()
					Notify("Error", "Sprint code doesn't exist.", 8)
				end
			else
				Connections["Infinite_Stamina"]:Disconnect()
				Notify("Error", "Character doesn't exist.", 8)
			end
		end)
	elseif Value == false then
		if Connections["Infinite_Stamina"] then
			Connections["Infinite_Stamina"]:Disconnect()
		end
	end
end

function InfOxygen(Value)
	local Plr = Players.LocalPlayer

	if not Plr then
		warn("Plr is not valid.")
	end

	if Value == true then
		Connections["Infinite_Oxygen"] = RunService.RenderStepped:Connect(function()
			if Plr.Character then
				if Plr.Character:FindFirstChild("Breath") then
					Plr.Character.Breath.Value = Plr.Character.Breath:GetAttribute("Max") or 20
				else
					Connections["Infinite_Oxygen"]:Disconnect()
					Notify("Error", "Breath value doesn't exist.", 8)
				end
			else
				Connections["Infinite_Oxygen"]:Disconnect()
				Notify("Error", "Character doesn't exist.", 8)
			end
		end)
	elseif Value == false then
		if Connections["Infinite_Oxygen"] then
			Connections["Infinite_Oxygen"]:Disconnect()
		end
	end
end

function InfBattery(Value)
	local Plr = Players.LocalPlayer

	if not Plr then
		warn("Plr is not valid.")
	end

	if Value == true then
		Connections["Infinite_Battery"] = RunService.RenderStepped:Connect(function()
			if Plr.Character then
				if Plr.Character:FindFirstChild("Flashlight") and Plr.Character.Flashlight:FindFirstChild("Battery") then
					Plr.Character.Flashlight.Battery.Value = Plr.Character.Flashlight.Battery:GetAttribute("Max") or 130
				else
					Connections["Infinite_Battery"]:Disconnect()
					Notify("Error", "Battery value doesn't exist. Please pick up the flashlight if you didn't", 8)
				end
			else
				Connections["Infinite_Battery"]:Disconnect()
				Notify("Error", "Character doesn't exist.", 8)
			end
		end)
	elseif Value == false then
		if Connections["Infinite_Battery"] then
			Connections["Infinite_Battery"]:Disconnect()
		end
	end
end

function ForceThirdPerson(Value)
	local Plr = Players.LocalPlayer

	if not Plr then
		warn("Plr is not valid.")
	end

	if Value == true then
		Connections["ForceThirdPerson"] = RunService.RenderStepped:Connect(function()
			Plr.CameraMode = Enum.CameraMode.Classic
		end)
	elseif Value == false then
		if Connections["ForceThirdPerson"] then
			Connections["ForceThirdPerson"]:Disconnect()
		end
	end
end

-- Teleport tab --
function Teleport_Shack()
	local Plr = Players.LocalPlayer

	if not Plr then
		warn("Plr is not valid.")
	end

	local Chr = Plr.Character

	if not Chr then
		warn("Chr is not valid.")
		Notify("Error", "Character doesn't exist.", 8)
	end

	local Pos = Teleport_Locations.Shack

	if not Pos then
		warn("Pos is not valid.")
		Notify("Failed to teleport", "The shack teleportation has failed, doesn't exist.", 8)
	end

	Chr:MoveTo(Pos)
	
	Notify("Success", "Teleported to Shack", 8)
end

function Teleport_FuseBox()
	local Plr = Players.LocalPlayer

	if not Plr then
		warn("Plr is not valid.")
	end

	local Chr = Plr.Character

	if not Chr then
		warn("Chr is not valid.")
		Notify("Error", "Character doesn't exist.", 8)
	end

	local Pos = Teleport_Locations.FuseBox

	if not Pos then
		warn("Pos is not valid.")
		Notify("Failed to teleport", "The FuseBox teleportation has failed, doesn't exist.", 8)
	end

	Chr:MoveTo(Pos)
	Notify("Success", "Teleported to FuseBox", 8)
end

function Teleport_Entrance()
	local Plr = Players.LocalPlayer

	if not Plr then
		warn("Plr is not valid.")
	end

	local Chr = Plr.Character

	if not Chr then
		warn("Chr is not valid.")
		Notify("Error", "Character doesn't exist.", 8)
	end

	local Pos = Teleport_Locations.Entrance

	if not Pos then
		warn("Pos is not valid.")
		Notify("Failed to teleport", "The Entrance teleportation has failed, doesn't exist.", 8)
	end

	Chr:MoveTo(Pos)

	Notify("Success", "Teleported to Entrance", 8)
end
------------------
-- ESP tab --
function Mutant_ESP(Value)
	if Value == true then
		Connections["Mutant_ESP1"] = RunService.RenderStepped:Connect(function()
			local Mutant = workspace:FindFirstChild("Mutant")

			if Mutant and not Mutant:FindFirstChild("Spy") then
				local Spy = Instance.new("Highlight")
				Spy.Name = "Spy"
				Spy.FillColor = Color3.fromRGB(170, 0, 0)
				Spy.OutlineColor = Color3.fromRGB(255, 0, 0)
				Spy.Parent = Mutant
			end
		end)
	elseif Value == false then
		if Connections["Mutant_ESP1"] then
			Connections["Mutant_ESP1"]:Disconnect()

			if workspace:FindFirstChild("Mutant") and workspace.Mutant:FindFirstChild("Spy") then
				workspace.Mutant.Spy:Destroy()
			end
		end
	end
end

-- Misc tab --
function Full_Bright(Value)
	if Value == true then
		Connections["Full_Bright1"] = RunService.RenderStepped:Connect(function()
			Lighting.Ambient = Color3.fromRGB(255, 255, 255)
			Lighting.Brightness = 3

			if Lighting:FindFirstChild("Atmosphere") then
				Lighting.Atmosphere.Density = 0
			end
		end)
	elseif Value == false then
		if Connections["Full_Bright1"] then
			Connections["Full_Bright1"]:Disconnect()
		end
	end
end

-- Window creating step --
local Window = Rayfield:CreateWindow({
   Name = "Residence Massacre Night 1",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Residence Massacre Night 1 Hub",
   LoadingSubtitle = "By INSANE590",
   ShowText = "Rayfield", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

--------------- ---------------------------------------------------------

-- Main tab creation --
local MainTab = Window:CreateTab("Main", 0) -- Title, Image

local KillAntiCheat_Button = MainTab:CreateButton({
   Name = "Kill Client Anti-cheat",
   Callback = KillAntiCheat
})

-- Badges tab creation --
local BadgesTab = Window:CreateTab("Badges", 0) -- Title, Image

local Asphyxia_Button = BadgesTab:CreateButton({
   Name = "Asphyxia",
   Callback = Asphyxia_Badge
})

local WarmSip_Button = BadgesTab:CreateButton({
   Name = "Warm Sip",
   Callback = WarmSip_Badge
})

-- Character tab creation --
local CharacterTab = Window:CreateTab("Character", 0) -- Title, Image

local InfStamina_Button = CharacterTab:CreateToggle({
   Name = "Infinite Stamina",
   CurrentValue = false,
   Flag = "InfStam1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = InfStamina
})

local InfOxygen_Button = CharacterTab:CreateToggle({
   Name = "Infinite Oxygen",
   CurrentValue = false,
   Flag = "InfOxy1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = InfOxygen
})

local InfBattery_Button = CharacterTab:CreateToggle({
   Name = "Infinite Battery",
   CurrentValue = false,
   Flag = "InfBat1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = InfBattery
})

local ForceThirdPerson_Button = CharacterTab:CreateToggle({
   Name = "Force Third Person",
   CurrentValue = false,
   Flag = "ForceThirdP1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = ForceThirdPerson
})

local WalkSpeed_Slider = CharacterTab:CreateSlider({
   Name = "WalkSpeed",
   Range = {0, 100},
   Increment = 1,
   Suffix = "Bananas",
   CurrentValue = 12,
   Flag = "WalkSpeed_Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function
})

-- Teleport tab creation --
local TeleportTab = Window:CreateTab("Teleport", 0) -- Title, Image

local Shack_Button = TeleportTab:CreateButton({
   Name = "Shack",
   Callback = Teleport_Shack
})

local FuseBox_Button = TeleportTab:CreateButton({
   Name = "Fuse Box",
   Callback = Teleport_FuseBox
})

local Entrance_Button = TeleportTab:CreateButton({
   Name = "Entrance",
   Callback = Teleport_Entrance
})

-- ESP tab creation --
local ESPTab = Window:CreateTab("ESP", 0) -- Title, Image

local MutantESP_Button = ESPTab:CreateToggle({
   Name = "Mutant ESP",
   CurrentValue = false,
   Flag = "Mutant_ESP1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = Mutant_ESP
})

-- Misc tab creation --
local MiscTab = Window:CreateTab("Misc", 0) -- Title, Image

local FullBright_Button = MiscTab:CreateToggle({
   Name = "Full Bright",
   CurrentValue = false,
   Flag = "FullBright1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = Full_Bright
})
