local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local userInput = game:GetService("UserInputService")

local flying = false
local bodyVelocity
local speed = 50

local function startFlying()
    bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.MaxForce = Vector3.new(1e4, 1e4, 1e4) -- High force to ensure flight
    bodyVelocity.Velocity = Vector3.zero -- Start stationary
    bodyVelocity.Parent = character.HumanoidRootPart
end

local function stopFlying()
    if bodyVelocity then
        bodyVelocity:Destroy()
        bodyVelocity = nil
    end
end

local function onChat(message)
    if message:lower() == "/fly" then
        flying = not flying
        if flying then
            startFlying()
        else
            stopFlying()
        end
    end
end

local function onInput(input, gameProcessed)
    if flying and not gameProcessed then
        if input.KeyCode == Enum.KeyCode.W then
            bodyVelocity.Velocity = character.HumanoidRootPart.CFrame.LookVector * speed
        elseif input.KeyCode == Enum.KeyCode.S then
            bodyVelocity.Velocity = -character.HumanoidRootPart.CFrame.LookVector * speed
        elseif input.KeyCode == Enum.KeyCode.Space then
            bodyVelocity.Velocity = Vector3.new(0, speed, 0)
        elseif input.KeyCode == Enum.KeyCode.LeftShift then
            bodyVelocity.Velocity = Vector3.new(0, -speed, 0)
        else
            bodyVelocity.Velocity = Vector3.zero
        end
    end
end

player.Chatted:Connect(onChat)
userInput.InputBegan:Connect(onInput)
userInput.InputEnded:Connect(function(input)
    if flying then
        bodyVelocity.Velocity = Vector3.zero
    end
end)
