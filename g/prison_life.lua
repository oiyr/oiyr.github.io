if game.PlaceId == 155615604 then
local Config = {
    WindowName = "oiyr07",
	Color = Color3.fromRGB(126,161,92),
	Keybind = Enum.KeyCode.H
}
local Library = loadstring(game:HttpGet("https://oiyr.github.io/gui.lua"))()
local Window = Library:CreateWindow(Config, game:GetService("CoreGui"))
local Tab1 = Window:CreateTab("Main")
local Tab2 = Window:CreateTab("UI Settings")
local Section1 = Tab1:CreateSection("Features")
local Section2 = Tab1:CreateSection("LocalPlayer")
local Section3 = Tab1:CreateSection("Team")
local Section4 = Tab2:CreateSection("Menu")
local Section5 = Tab2:CreateSection("Background")
local Section6 = Tab1:CreateSection("Spam")

_G.loopkillall = false

local Button1 = Section1:CreateButton("Kill All", function()
	local function GetPos()
		return game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
	end

	local function GetCamPos()
		return workspace.CurrentCamera.CFrame
	end

	local function GetTeam()
		return game.Players.LocalPlayer.TeamColor.Name
	end

	local function Kill(Player)
		pcall(function()
			if Player.Character:FindFirstChild("ForceField") or not workspace:FindFirstChild(Player.Name) or not workspace:FindFirstChild(Player.Name):FindFirstChild("Head") or Player == nil or Player.Character.Parent ~= workspace then return end
			workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP)

			local MyTeam = GetTeam()
			if Player.TeamColor.Name == game.Players.LocalPlayer.TeamColor.Name then
				local savedcf = GetPos()
				local savedcamcf = GetCamPos()
				workspace.Remote.loadchar:InvokeServer(nil, BrickColor.random().Name)
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = savedcf
				workspace.CurrentCamera.CFrame = savedcamcf
				workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP)
			end

			local Gun = game.Players.LocalPlayer.Character:FindFirstChild("Remington 870") or game.Players.LocalPlayer.Backpack:FindFirstChild("Remington 870")

			local FireEvent = {
				[1] = {
					["RayObject"] = Ray.new(Vector3.new(), Vector3.new()), 
					["Distance"] = 0, 
					["Cframe"] = CFrame.new(), 
					["Hit"] = workspace[Player.Name].Head
				}, [2] = {
					["RayObject"] = Ray.new(Vector3.new(), Vector3.new()), 
					["Distance"] = 0, 
					["Cframe"] = CFrame.new(), 
					["Hit"] = workspace[Player.Name].Head
				}, [3] = {
					["RayObject"] = Ray.new(Vector3.new(), Vector3.new()), 
					["Distance"] = 0, 
					["Cframe"] = CFrame.new(), 
					["Hit"] = workspace[Player.Name].Head
				}, [4] = {
					["RayObject"] = Ray.new(Vector3.new(), Vector3.new()), 
					["Distance"] = 0, 
					["Cframe"] = CFrame.new(), 
					["Hit"] = workspace[Player.Name].Head
				}, [5] = {
					["RayObject"] = Ray.new(Vector3.new(), Vector3.new()), 
					["Distance"] = 0, 
					["Cframe"] = CFrame.new(), 
					["Hit"] = workspace[Player.Name].Head
				}, [6] = {
					["RayObject"] = Ray.new(Vector3.new(), Vector3.new()), 
					["Distance"] = 0, 
					["Cframe"] = CFrame.new(), 
					["Hit"] = workspace[Player.Name].Head
				}, [7] = {
					["RayObject"] = Ray.new(Vector3.new(), Vector3.new()), 
					["Distance"] = 0, 
					["Cframe"] = CFrame.new(), 
					["Hit"] = workspace[Player.Name].Head
				}, [8] = {
					["RayObject"] = Ray.new(Vector3.new(), Vector3.new()), 
					["Distance"] = 0, 
					["Cframe"] = CFrame.new(), 
					["Hit"] = workspace[Player.Name].Head
				}
			}

			game:GetService("ReplicatedStorage").ShootEvent:FireServer(FireEvent, Gun)
			Gun.Parent = game.Players.LocalPlayer.Character
			game.Players.LocalPlayer.Character["Remington 870"]:Destroy()
		end)
	end


	for i,v in pairs(game.Players:GetPlayers()) do
		if v ~= game.Players.LocalPlayer then
			Kill(v)
		end
	end
    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer('[oiyr07 GUI]: Killed All', "all")
end)

local Toggles = Section1:CreateToggle("Loop Kill All", false, function(State)
	_G.loopkillall = State
end)

local Button2 = Section1:CreateButton("Give All Guns", function()
	if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(tonumber((game:GetService("Players").LocalPlayer.CharacterAppearance):split('=')[#((game:GetService("Players").LocalPlayer.CharacterAppearance):split('='))]), 96651) then
		game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer('[oiyr07 GUI]: Gived gamepass Guns', 'all')
		workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP)
		workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["M4A1"].ITEMPICKUP)
		workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["AK-47"].ITEMPICKUP)
		workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["M9"].ITEMPICKUP)
	else
		game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer('[oiyr07 GUI]: Gived non-gamepass Guns', 'all')
		workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP)
		workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["AK-47"].ITEMPICKUP)
		workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["M9"].ITEMPICKUP)
	end
end)

local TextBox1 = Section2:CreateTextBox("WalkSpeed", "WS", true, function(Value)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer('[oiyr07 GUI]: Walkspeed: '..Value, "all")
end)

local TextBox2 = Section2:CreateTextBox("JumpPower", "JP", true, function(Value)
	game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer('[oiyr07 GUI]: Jumppower: '..Value, "all")
end)

local Button3 = Section3:CreateButton("Team Neutral", function()
    Workspace.Remote.TeamEvent:FireServer("Medium stone grey")
    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer('[oiyr07 GUI]: Changes to team neutral', "all")
end)

local Button4 = Section3:CreateButton("Team Inmate", function()
    Workspace.Remote.TeamEvent:FireServer("Bright orange")
    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer('[oiyr07 GUI]: Changes to team inmate', "all")
end)

local Button5 = Section3:CreateButton("Team Police", function()
    Workspace.Remote.TeamEvent:FireServer("Bright blue")
    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer('[oiyr07 GUI]: Changes to team police', "all")
end)

local Button6 = Section1:CreateButton("Arrest Criminals", function()
    local Player = game.Players.LocalPlayer
    local cpos = Player.Character.HumanoidRootPart.CFrame
    for i,v in pairs(game.Teams.Criminals:GetPlayers()) do
    if v.Name ~= Player.Name then
    local i = 10
        repeat
        wait()
        i = i-1
        game.Workspace.Remote.arrest:InvokeServer(v.Character.HumanoidRootPart)
        Player.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 1)
        until i == 0
    end
    end
    Player.Character.HumanoidRootPart.CFrame = cpos
    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer('[oiyr07 GUI]: Arrested All Criminals', "all")
end)

local TextBox23 = Section1:CreateTextBox("Arrest Player", "Enter UserName", false, function(Value)
    function Arrest(Player)
        local Time = 1
        local savedcf = GetPos()
        local savedcamcf = GetCamPos()
        local savedteam = GetTeam()
        if Player then
            repeat wait()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Player.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 1)
                for i = 1,Time do
                    coroutine.wrap(function()
                        workspace.Remote.arrest:InvokeServer(Player.Character.Head)
                    end)()
                end
            until Player.Character:FindFirstChild("Head"):FindFirstChild("handcuffedGui")
            wait()
        end
        workspace.Remote.loadchar:InvokeServer(nil, BrickColor.new(savedteam).Name)
        game.Players.LocalPlayer.Character.Humanoid.Sit = false
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = savedcf
        workspace.CurrentCamera.CFrame = savedcamcf
    end
    local z = GetPlayer(Value)
    if z ~= nil then
        Arrest(z)
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[oiyr07 GUI]: Arrested "..Player.Name, "all")
    else
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[oiyr07 GUI]: No player found", "all")
    end
end)

local TextBox3 = Section1:CreateTextBox("Kill Player", "Enter UserName", false, function(Value)
    local function GetPos()
		return game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
	end

	local function GetCamPos()
		return workspace.CurrentCamera.CFrame
	end

	local function GetTeam()
		return game.Players.LocalPlayer.TeamColor.Name
	end
    
    local function GetPlayer(String)
        if not String then return end
        local Yes = {}
        for _, Player in ipairs(game.Players:GetPlayers()) do
            if string.lower(Player.Name):match(string.lower(String)) or string.lower(Player.DisplayName):match(string.lower(String)) then
                table.insert(Yes, Player)
            end
        end
        if #Yes > 0 then
            return Yes[1]
        elseif #Yes < 1 then
            return nil
        end
    end
    
	local function Kill(Player)
		pcall(function()
			if Player.Character:FindFirstChild("ForceField") or not workspace:FindFirstChild(Player.Name) or not workspace:FindFirstChild(Player.Name):FindFirstChild("Head") or Player == nil or Player.Character.Parent ~= workspace then return end
			workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP)

			local MyTeam = GetTeam()
			if Player.TeamColor.Name == game.Players.LocalPlayer.TeamColor.Name then
				local savedcf = GetPos()
				local savedcamcf = GetCamPos()
				workspace.Remote.loadchar:InvokeServer(nil, BrickColor.random().Name)
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = savedcf
				workspace.CurrentCamera.CFrame = savedcamcf
				workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP)
			end

			local Gun = game.Players.LocalPlayer.Character:FindFirstChild("Remington 870") or game.Players.LocalPlayer.Backpack:FindFirstChild("Remington 870")

			local FireEvent = {
				[1] = {
					["RayObject"] = Ray.new(Vector3.new(), Vector3.new()), 
					["Distance"] = 0, 
					["Cframe"] = CFrame.new(), 
					["Hit"] = workspace[Player.Name].Head
				}, [2] = {
					["RayObject"] = Ray.new(Vector3.new(), Vector3.new()), 
					["Distance"] = 0, 
					["Cframe"] = CFrame.new(), 
					["Hit"] = workspace[Player.Name].Head
				}, [3] = {
					["RayObject"] = Ray.new(Vector3.new(), Vector3.new()), 
					["Distance"] = 0, 
					["Cframe"] = CFrame.new(), 
					["Hit"] = workspace[Player.Name].Head
				}, [4] = {
					["RayObject"] = Ray.new(Vector3.new(), Vector3.new()), 
					["Distance"] = 0, 
					["Cframe"] = CFrame.new(), 
					["Hit"] = workspace[Player.Name].Head
				}, [5] = {
					["RayObject"] = Ray.new(Vector3.new(), Vector3.new()), 
					["Distance"] = 0, 
					["Cframe"] = CFrame.new(), 
					["Hit"] = workspace[Player.Name].Head
				}, [6] = {
					["RayObject"] = Ray.new(Vector3.new(), Vector3.new()), 
					["Distance"] = 0, 
					["Cframe"] = CFrame.new(), 
					["Hit"] = workspace[Player.Name].Head
				}, [7] = {
					["RayObject"] = Ray.new(Vector3.new(), Vector3.new()), 
					["Distance"] = 0, 
					["Cframe"] = CFrame.new(), 
					["Hit"] = workspace[Player.Name].Head
				}, [8] = {
					["RayObject"] = Ray.new(Vector3.new(), Vector3.new()), 
					["Distance"] = 0, 
					["Cframe"] = CFrame.new(), 
					["Hit"] = workspace[Player.Name].Head
				}
			}

			game:GetService("ReplicatedStorage").ShootEvent:FireServer(FireEvent, Gun)
			Gun.Parent = game.Players.LocalPlayer.Character
			game.Players.LocalPlayer.Character["Remington 870"]:Destroy()
		end)
	end

    local Player = GetPlayer(Value)
    if Player ~= nil then
        Kill(Player)
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[oiyr07 GUI]: Killed "..Player.Name, "all")
    else
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[oiyr07 GUI]: No player found", "all")
    end
end)

local Toggle3 = Section4:CreateToggle("UI Toggle", nil, function(State)
	Window:Toggle(State)
end)
Toggle3:CreateKeybind(tostring(Config.Keybind):gsub("Enum.KeyCode.", ""), function(Key)
	Config.Keybind = Enum.KeyCode[Key]
end)
Toggle3:SetState(true)

local Colorpicker3 = Section4:CreateColorpicker("UI Color", function(Color)
	Window:ChangeColor(Color)
end)
Colorpicker3:UpdateColor(Config.Color)

local Dropdown3 = Section5:CreateDropdown("Image", {"Default","Hearts","Abstract","Hexagon","Circles","Lace With Flowers","Floral"}, function(Name)
	if Name == "Default" then
		Window:SetBackground("2151741365")
	elseif Name == "Hearts" then
		Window:SetBackground("6073763717")
	elseif Name == "Abstract" then
		Window:SetBackground("6073743871")
	elseif Name == "Hexagon" then
		Window:SetBackground("6073628839")
	elseif Name == "Circles" then
		Window:SetBackground("6071579801")
	elseif Name == "Lace With Flowers" then
		Window:SetBackground("6071575925")
	elseif Name == "Floral" then
		Window:SetBackground("5553946656")
	end
end)
Dropdown3:SetOption("Default")

local Colorpicker4 = Section5:CreateColorpicker("Color", function(Color)
	Window:SetBackgroundColor(Color)
end)
Colorpicker4:UpdateColor(Color3.new(1,1,1))

local Slider3 = Section5:CreateSlider("Transparency",0,1,nil,false, function(Value)
	Window:SetBackgroundTransparency(Value)
end)
Slider3:SetValue(0)

local Slider4 = Section5:CreateSlider("Tile Scale",0,1,nil,false, function(Value)
	Window:SetTileScale(Value)
end)
Slider4:SetValue(0.5)

_G.txtspam = 'best gui is oiyr07'
_G.spamming = false
local TextBox856 = Section6:CreateTextBox("Spam Text", "msg", false, function(Value)
    _G.txtspam = Value
end)
local Toggle345 = Section6:CreateToggle("Spamming", false, function(State)
	_G.spamming=State
end)
while wait(0.50) do
    if _G.spamming == true then
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(_G.txtspam, "all")
    end
    if _G.loopkillall == true then
        local function GetPos()
            return game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        end
    
        local function GetCamPos()
            return workspace.CurrentCamera.CFrame
        end
    
        local function GetTeam()
            return game.Players.LocalPlayer.TeamColor.Name
        end
    
        local function Kill(Player)
            pcall(function()
                if Player.Character:FindFirstChild("ForceField") or not workspace:FindFirstChild(Player.Name) or not workspace:FindFirstChild(Player.Name):FindFirstChild("Head") or Player == nil or Player.Character.Parent ~= workspace then return end
                workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP)
    
                local MyTeam = GetTeam()
                if Player.TeamColor.Name == game.Players.LocalPlayer.TeamColor.Name then
                    local savedcf = GetPos()
                    local savedcamcf = GetCamPos()
                    workspace.Remote.loadchar:InvokeServer(nil, BrickColor.random().Name)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = savedcf
                    workspace.CurrentCamera.CFrame = savedcamcf
                    workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP)
                end
    
                local Gun = game.Players.LocalPlayer.Character:FindFirstChild("Remington 870") or game.Players.LocalPlayer.Backpack:FindFirstChild("Remington 870")
    
                local FireEvent = {
                    [1] = {
                        ["RayObject"] = Ray.new(Vector3.new(), Vector3.new()), 
                        ["Distance"] = 0, 
                        ["Cframe"] = CFrame.new(), 
                        ["Hit"] = workspace[Player.Name].Head
                    }, [2] = {
                        ["RayObject"] = Ray.new(Vector3.new(), Vector3.new()), 
                        ["Distance"] = 0, 
                        ["Cframe"] = CFrame.new(), 
                        ["Hit"] = workspace[Player.Name].Head
                    }, [3] = {
                        ["RayObject"] = Ray.new(Vector3.new(), Vector3.new()), 
                        ["Distance"] = 0, 
                        ["Cframe"] = CFrame.new(), 
                        ["Hit"] = workspace[Player.Name].Head
                    }, [4] = {
                        ["RayObject"] = Ray.new(Vector3.new(), Vector3.new()), 
                        ["Distance"] = 0, 
                        ["Cframe"] = CFrame.new(), 
                        ["Hit"] = workspace[Player.Name].Head
                    }, [5] = {
                        ["RayObject"] = Ray.new(Vector3.new(), Vector3.new()), 
                        ["Distance"] = 0, 
                        ["Cframe"] = CFrame.new(), 
                        ["Hit"] = workspace[Player.Name].Head
                    }, [6] = {
                        ["RayObject"] = Ray.new(Vector3.new(), Vector3.new()), 
                        ["Distance"] = 0, 
                        ["Cframe"] = CFrame.new(), 
                        ["Hit"] = workspace[Player.Name].Head
                    }, [7] = {
                        ["RayObject"] = Ray.new(Vector3.new(), Vector3.new()), 
                        ["Distance"] = 0, 
                        ["Cframe"] = CFrame.new(), 
                        ["Hit"] = workspace[Player.Name].Head
                    }, [8] = {
                        ["RayObject"] = Ray.new(Vector3.new(), Vector3.new()), 
                        ["Distance"] = 0, 
                        ["Cframe"] = CFrame.new(), 
                        ["Hit"] = workspace[Player.Name].Head
                    }
                }
    
                game:GetService("ReplicatedStorage").ShootEvent:FireServer(FireEvent, Gun)
                Gun.Parent = game.Players.LocalPlayer.Character
                game.Players.LocalPlayer.Character["Remington 870"]:Destroy()
            end)
        end
        for i,v in pairs(game.Players:GetPlayers()) do
            if v ~= game.Players.LocalPlayer then
                Kill(v)
            end
        end
    end
end
end
