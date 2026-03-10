-- 加载悬浮窗
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
    Name = "忍者专属脚本",
    LoadingTitle = "加载中...",
    LoadingSubtitle = "By 你",
    Theme = "Default",
    ToggleUIKeybind = Enum.KeyCode.K,
})

-- 标签页
local MovementTab = Window:CreateTab("移动功能", 0)
local PerformanceTab = Window:CreateTab("性能设置", 0)
local CombatTab = Window:CreateTab("战斗功能", 0)

-- 变量
local plr = game:GetService("Players").LocalPlayer
local char, hrp, humanoid
local speed = 16
local fps = 60
local wallhack = false
local noVoid = false
local throwAway = false

-- 刷新角色
function refreshChar()
    char = plr.Character or plr.CharacterAdded:Wait()
    hrp = char:WaitForChild("HumanoidRootPart")
    humanoid = char:WaitForChild("Humanoid")
end
refreshChar()
plr.CharacterAdded:Connect(refreshChar)

-- 速度
MovementTab:CreateSlider({
    Name = "移动速度",
    Range = {16, 200},
    CurrentValue = 16,
    Callback = function(val)
        speed = val
        if humanoid then humanoid.WalkSpeed = val end
    end
})

-- 穿墙（不穿地）
MovementTab:CreateToggle({
    Name = "穿墙（不穿地）",
    CurrentValue = false,
    Callback = function(val)
        wallhack = val
        while wallhack do task.wait()
            if hrp then
                hrp.CanCollide = false
            end
        end
        if hrp then hrp.CanCollide = true end
    end
})

-- 防虚空伤害
MovementTab:CreateToggle({
    Name = "禁止虚空伤害",
    CurrentValue = false,
    Callback = function(val)
        noVoid = val
        while noVoid do task.wait()
            if hrp and hrp.Position.Y < -50 then
                hrp.Velocity = Vector3.new(0, 0, 0)
            end
        end
    end
})

-- 帧率锁定
PerformanceTab:CreateSlider({
    Name = "帧率 FPS",
    Range = {10, 120},
    CurrentValue = 60,
    Callback = function(val)
        fps = val
        setfpscap(val)
    end
})

-- 碰到人直接甩飞
CombatTab:CreateToggle({
    Name = "碰到人直接甩飞",
    CurrentValue = false,
    Callback = function(val)
        throwAway = val
        while throwAway do task.wait(0.1)
            for _, v in pairs(game.Players:GetPlayers()) do
                if v ~= plr and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                    local ehrp = v.Character.HumanoidRootPart
                    if (hrp.Position - ehrp.Position).Magnitude < 6 then
                        ehrp.Velocity = Vector3.new(0, 80, 0) + (ehrp.Position - hrp.Position).Unit * 30
                    end
                end
            end
        end
    end
})
