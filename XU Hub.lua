-- 服务初始化
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")
local TweenService = game:GetService("TweenService")

-- 定位并替换XU HUB背景
local function applyParadoxBackground()
    -- 找到XU HUB主界面
    local xuHubGui = PlayerGui:FindFirstChild("XU HUB") or PlayerGui:FindFirstChild("xTHub")
    if not xuHubGui then return end

    -- 定位背景层
    local background = xuHubGui:FindFirstChild("Background", true) or xuHubGui:FindFirstChild("MainFrame", true)
    if not background then
        -- 若原背景不存在，创建新背景层
        background = Instance.new("Frame")
        background.Name = "ParadoxBackground"
        background.Size = UDim2.new(1, 0, 1, 0)
        background.Position = UDim2.new(0, 0, 0, 0)
        background.ZIndex = 1
        background.Parent = xuHubGui
    end

    -- 1. 设置暗黑底色（匹配PARADOX的深黑紫背景）
    background.BackgroundColor3 = Color3.new(0.05, 0.04, 0.08)
    background.BorderSizePixel = 0

    -- 2. 添加绿色霓虹发光边框（纯代码实现，无需外部资源）
    local glowBorder = Instance.new("Frame")
    glowBorder.Name = "GlowBorder"
    glowBorder.Size = UDim2.new(1, -16, 1, -16)
    glowBorder.Position = UDim2.new(0, 8, 0, 8)
    glowBorder.BackgroundTransparency = 1
    glowBorder.BorderColor3 = Color3.new(0, 0.9, 0.3) -- 霓虹绿色
    glowBorder.BorderSizePixel = 4
    glowBorder.ZIndex = 2
    glowBorder.Parent = background

    -- 3. 添加绿色噪点闪烁效果（模拟PARADOX的发光纹理）
    local noiseOverlay = Instance.new("Frame")
    noiseOverlay.Name = "NoiseOverlay"
    noiseOverlay.Size = UDim2.new(1, 0, 1, 0)
    noiseOverlay.Position = UDim2.new(0, 0, 0, 0)
    noiseOverlay.BackgroundTransparency = 0.85
    noiseOverlay.BackgroundColor3 = Color3.new(0, 0.6, 0.2)
    noiseOverlay.ZIndex = 2
    noiseOverlay.Parent = background

    -- 噪点闪烁动画
    local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)
    local tween = TweenService:Create(noiseOverlay, tweenInfo, {BackgroundTransparency = 0.95})
    tween:Play()

    -- 4. 确保XU白色Logo在最上层
    local xuLogo = xuHubGui:FindFirstChild("XULogo", true) or xuHubGui:FindFirstChild("Logo", true)
    if xuLogo then
        xuLogo.ZIndex = 10
    end

    print(" XU HUB 背景已成功替换为PARADOX风格（纯代码实现）")
end

-- 立即执行背景替换
applyParadoxBackground()

-- 监听XU HUB加载完成事件
Player.CharacterAdded:Connect(function()
    wait(1)
    applyParadoxBackground()
end)
