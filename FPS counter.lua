local LocalPlayer = game:GetService("Players").LocalPlayer
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FPScounter"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local TextLabel = Instance.new("TextLabel")
TextLabel.Name = "FPS"
TextLabel.AnchorPoint = Vector2.new(0, 1)
TextLabel.BackgroundTransparency = 1
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0, 20, 1, 0)
TextLabel.Size = UDim2.new(0, 80, 0, 30)
TextLabel.TextColor3 = Color3.new(1, 1, 1)
TextLabel.TextScaled = true
TextLabel.TextXAlignment = Enum.TextXAlignment.Right
TextLabel.Parent = ScreenGui

local sampleSize = 20

local FrameTimes = table.create(sampleSize, 1/60)

local function mean(t)
	local sum = 0
	
	for _, duration in pairs(t) do
		sum += duration
	end
	
	return sum/sampleSize
end

local sampleIndex = 1

game:GetService("RunService").Heartbeat:Connect(function(dt)
	local nextIndex = sampleIndex + 1
	
	sampleIndex = nextIndex > sampleSize and 1 or nextIndex
	
	FrameTimes[sampleIndex] = dt
	
	TextLabel.Text = math.floor(1/mean(FrameTimes)).." FPS"
end)
