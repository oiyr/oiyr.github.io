if game.PlaceId == 5535087806 then
local Config = {
    WindowName = "Tapping Mania | oiyr.github.io",
	Color = Color3.fromRGB(126,161,92),
	Keybind = Enum.KeyCode.H
}
local Library = loadstring(game:HttpGet("https://oiyr.github.io/gui.lua"))()
local Window = Library:CreateWindow(Config, game:GetService("CoreGui"))
local Tab1 = Window:CreateTab("Main")
local Tab2 = Window:CreateTab("UI Settings")
local Section1 = Tab1:CreateSection("Misc")
local Section2 = Tab2:CreateSection("Menu")
local Section3 = Tab2:CreateSection("Background")
local web = Window:CreateTab("Credits")
local Section4 = web:CreateSection(" ")
Section4:CreateLabel("scripter: oiyr")
Section4:CreateLabel("lib: AlexR32")
Section4:CreateLabel("Web: oiyr.github.io")

_G.autotap=false
_G.autoreb=false

local Toggle1 = Section1:CreateToggle("AutoTap", false, function(bool)
	_G.autotap = bool
end)


local Toggle2 = Section1:CreateToggle("AutoRebirth", false, function(bool)
	_G.autoreb = bool
end)

local Toggle3 = Section2:CreateToggle("UI Toggle", nil, function(State)
	Window:Toggle(State)
end)
Toggle3:CreateKeybind(tostring(Config.Keybind):gsub("Enum.KeyCode.", ""), function(Key)
	Config.Keybind = Enum.KeyCode[Key]
end)
Toggle3:SetState(true)

local Colorpicker3 = Section2:CreateColorpicker("UI Color", function(Color)
	Window:ChangeColor(Color)
end)
Colorpicker3:UpdateColor(Config.Color)

local Dropdown3 = Section3:CreateDropdown("Image", {"Default","Hearts","Abstract","Hexagon","Circles","Lace With Flowers","Floral"}, function(Name)
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

local Colorpicker4 = Section3:CreateColorpicker("Color", function(Color)
	Window:SetBackgroundColor(Color)
end)
Colorpicker4:UpdateColor(Color3.new(1,1,1))

local Slider3 = Section3:CreateSlider("Transparency",0,1,nil,false, function(Value)
	Window:SetBackgroundTransparency(Value)
end)
Slider3:SetValue(0)

local Slider4 = Section3:CreateSlider("Tile Scale",0,1,nil,false, function(Value)
	Window:SetTileScale(Value)
end)
Slider4:SetValue(0.5)

while wait() do
    if _G.autotap == true then
        game:GetService("ReplicatedStorage").RemoteEvents.Click:FireServer()
    elseif _G.autoreb == true then
        game:GetService("ReplicatedStorage").RemoteEvents.Rebirth:FireServer(1)
    end
end
end
