local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")

local DISCORD_WEBHOOK_URL = "https://discord.com/api/webhooks/1325977750993113128/P3KiRqhILC-ZDmE4wYUeKTkWcNJMAZdmglMpUmTb-Ye2T0AZoTS9sQVy2ltAY4Aftg_x"

local reportEvent = ReplicatedStorage:WaitForChild("ReportEvent")

reportEvent.OnServerEvent:Connect(function(player, reportedPlayerName, reportReason)
    if not reportedPlayerName or not reportReason then
        warn("Invalid report data!")
        return
    end

    local data = {
        ["content"] = string.format("**New Report**\nReporter: %s\nReported: %s\nReason: %s", player.Name, reportedPlayerName, reportReason)
    }

    local success, response = pcall(function()
        return HttpService:PostAsync(DISCORD_WEBHOOK_URL, HttpService:JSONEncode(data), Enum.HttpContentType.ApplicationJson)
    end)

    if success then
        print("Report sent successfully!")
    else
        warn("Failed to send report: " .. tostring(response))
    end
end)


--// CC JADENJVL
