local TextLabel = script.Parent

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
