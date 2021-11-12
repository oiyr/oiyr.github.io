local oiyrkey = Instance.new("ScreenGui")
local login = Instance.new("Frame")
local title = Instance.new("TextLabel")
local enterbtn = Instance.new("TextButton")
local keytxt = Instance.new("TextBox")
local url = Instance.new("TextLabel")

oiyrkey.Name = "oiyrkey"
oiyrkey.Parent = game.CoreGui
oiyrkey.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

login.Name = "login"
login.Parent = oiyrkey
login.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
login.Position = UDim2.new(0.194657698, 0, 0.520429909, 0)
login.Size = UDim2.new(0, 297, 0, 201)

title.Name = "title"
title.Parent = login
title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
title.Size = UDim2.new(0, 297, 0, 31)
title.Font = Enum.Font.SourceSans
title.Text = "oiyr | key"
title.TextColor3 = Color3.fromRGB(0, 0, 0)
title.TextSize = 14.000

keytxt.Name = "keytxt"
keytxt.Parent = login
keytxt.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
keytxt.Position = UDim2.new(0.161616161, 0, 0.388059705, 0)
keytxt.Size = UDim2.new(0, 200, 0, 29)
keytxt.Font = Enum.Font.SourceSans
keytxt.PlaceholderText = "enter key"
keytxt.Text = ""
keytxt.TextColor3 = Color3.fromRGB(0, 0, 0)
keytxt.TextSize = 14.000

enterbtn.Name = "enterbtn"
enterbtn.Parent = login
enterbtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
enterbtn.Position = UDim2.new(0.313131303, 0, 0.587064683, 0)
enterbtn.Size = UDim2.new(0, 110, 0, 22)
enterbtn.Font = Enum.Font.SourceSans
enterbtn.Text = "Enter"
enterbtn.TextColor3 = Color3.fromRGB(0, 0, 0)
enterbtn.TextSize = 14.000

url.Name = "url"
url.Parent = login
url.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
url.Position = UDim2.new(0, 0, 0.925373137, 0)
url.Size = UDim2.new(0, 297, 0, 15)
url.Font = Enum.Font.SourceSans
url.Text = "oiyr.github.io/key.txt"
url.TextColor3 = Color3.fromRGB(0, 0, 0)
url.TextSize = 14.000


enterbtn.MouseButton1Click:Connect(function()
	if keytxt.Text == "" then
		keytxt.Text = "Enter A Key!"
		wait(0.50)
		keytxt.Text = ""
	elseif keytxt.Text == "oiyrguibest" then
		if game.PlaceId == 155615604 then
			game.CoreGui.oiyrkey:Destroy()
			loadstring(game:HttpGet('https://oiyr.github.io/g/prison_life.lua'))();
		elseif game.PlaceId == 5535087806 then
			game.CoreGui.oiyrkey:Destroy()
			loadstring(game:HttpGet('https://oiyr.github.io/g/tapping_mania.lua'))();
		else
			keytxt.Text = "Good Key But...\nGame Not Supported"
			wait(1)
			keytxt.Text = ""
		end
	else
		keytxt.Text = "Invaled Key!"
		wait(0.50)
		keytxt.Text = ""
	end
end)
