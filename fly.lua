local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local flying = false
local speed = 50

local function onChat(message)
    if message:lower() == "/fly" then
        flying = not flying
        if flying then
            local bodyVelocity = Instance.new("BodyVelocity")
            bodyVelocity.Velocity = Vector3.new(0, speed, 0)
            bodyVelocity.MaxForce = Vector3.new(1e4, 1e4, 1e4)
            bodyVelocity.Parent = character.HumanoidRootPart
        else
            for _, obj in pairs(character.HumanoidRootPart:GetChildren()) do
                if obj:IsA("BodyVelocity") then
                    obj:Destroy()
                end
            end
        end
    end
end

player.Chatted:Connect(onChat)
