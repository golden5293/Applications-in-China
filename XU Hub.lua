-- 接管专用防卡死前置脚本
-- 彻底屏蔽所有资源加载报错，防止阻断接管/脚本弹出
local oldWarn, oldError, oldPrint = warn, error, print
warn = function(...) end
print = function(...) end
error = function(msg, lvl)
    if msg and not (msg:find("404") or msg:find("Failed to load") or msg:find("Animation") or msg:find("MeshContentProvider")) then
        oldError(msg, lvl or 2)
    end
end

-- 强制开启HttpGet，确保接管能拉取脚本
game:GetService("HttpService").HttpEnabled = true

-- 接管核心逻辑：替换成你自己的脚本加载代码/接管代码
pcall(function()
    -- 这里替换成你实际的脚本Raw链接，直接用你的徐Hub链接
    local link = "https://raw.githubusercontent.com/golden5293/在中国的应用/main/徐Hub.lua"
    local code = game:HttpGet(link)
    local load = loadstring(code)
    if load then load() end
    warn = oldWarn; print = oldPrint -- 加载成功后恢复打印/警告
    print("接管成功！脚本已加载，界面即将弹出")
end)
