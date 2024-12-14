local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create a ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CreditsGui"
screenGui.Parent = playerGui

-- Create a TextLabel
local textLabel = Instance.new("TextLabel")
textLabel.Name = "CreditsLabel"
textLabel.Parent = screenGui
textLabel.Text = "Credits"
textLabel.Size = UDim2.new(0.3, 0, 0.1, 0) -- Width: 30%, Height: 10%
textLabel.Position = UDim2.new(0.35, 0, 0.45, 0) -- Centered on the screen
textLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Black background
textLabel.BackgroundTransparency = 0.5 -- Semi-transparent background
textLabel.TextColor3 = Color3.fromRGB(255, 255, 255) -- White text
textLabel.TextScaled = true -- Automatically scale text
textLabel.Font = Enum.Font.SourceSansBold -- Bold font

