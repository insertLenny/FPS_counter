# FPSCounter
This small ModuleScript gets a **stable** FPS count by averaging the last `sampleSize` rendering durations (20 by default).

### API
`FPSCounter.GetFPS(): number`.

### Example
The following code creates a TextLabel on the bottom left of the screen which updates every time Heartbeat fires.
```lua
local FPSCounter = require(game:GetService("ReplicatedStorage"):WaitForChild("FPSCounter"));

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

game:GetService("RunService").Heartbeat:Connect(function()
	TextLabel.Text = tostring(FPSCounter.GetFPS()).." FPS";
end)
```
