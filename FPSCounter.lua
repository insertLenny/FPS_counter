local FPSCounter = {};
FPSCounter.__index = FPSCounter;

local sampleSize = 20;
local FrameTimes = table.create(sampleSize, 1/60);

local function averageFrames()
	local sum = 0;
	
	for _, duration in pairs(FrameTimes) do
		sum += duration;
	end
	
	return sum/sampleSize;
end

local function round(n)
	return math.floor(n + 0.5);
end

local sampleIndex = 1;
local nextIndex = 1;

game:GetService("RunService").Heartbeat:Connect(function(dt)
	nextIndex = sampleIndex + 1;
	
	FrameTimes[nextIndex > sampleSize and 1 or nextIndex] = dt;
end)

function FPSCounter.GetFPS()
	return round(1/averageFrames());
end


return FPSCounter;
