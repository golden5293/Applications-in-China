- 【纯净托管版】XuHub脚本+防卡死接管
-- 前置防卡死逻辑（必须放在最开头）
当地的oldWarn，oldError，oldPrint = warn，Error，Print
警告=功能(...) 结束
打印=功能(...) 结束
错误=功能（消息，拉特)
    如果味精和 不(消息:查找("404") 或者消息:查找("无法加载") 或者消息:查找(“动画”) 或者消息:查找(" MeshContentProvider ")) 然后
旧错误(消息，拉特或者2)
    结束
结束

-强制开启超文本传送协议(超文本传输协议的缩写)服务
游戏:获取服务(" HttpService ").HttpEnabled =真实的

-xhub核心功能代码
当地的 功能applyParadoxBackground()
    -- 清理旧背景，避免重复创建
当地的旧血糖=游戏1000名球员。当地的玩家。玩家GUI:findfirst child("悖论背景")
如果oldBg然后oldBg:Destroy()结束

    -- 1. 设置暗黑底色
当地的背景= Instance.new("屏幕图形界面")
背景。名称=“悖论背景”
背景。家长=游戏。玩家
背景ZIndexBehavior = Enum .zindex行为。同胞

当地的背景层= Instance.new("框架")
背景层。名称="背景图层"
背景层。父=背景
背景层。背景颜色3 =颜色3 .新(0.05, 0.04, 0.08)
背景层。背景透明度=0
背景层。边框像素=0
背景层。Size = UDim2.new(1, 0, 1, 0)

    -- 2. 添加霓虹红发光边框
当地的glowBorder = Instance.new("框架")
格洛博德。名称=“全球订单”
格洛博德。父=背景层
格洛博德。Size = UDim2.new(1, -16, 1, -16)
格洛博德. Position = UDim2.new(0, 8, 0, 8)
格洛博德。背景透明度=1
格洛博德。边框像素=3
格洛博德BorderColor3 = Color3.new(0.9, 0.9, 0.3)
格洛博德ZIndex =2

    -- 3. 添加绿色噪点闪烁效果
当地的噪声覆盖= Instance.new("框架")
噪声覆盖。名称=“噪声覆盖”
噪声覆盖。父=背景层
噪声覆盖. Size = UDim2.new(1, 0, 1, 0)
噪声覆盖. Position = UDim2.new(0, 0, 0, 0)
噪声覆盖。背景透明度=0.85
噪声覆盖。背景颜色3 =颜色3 .新(0, 0.6, 0.2)
噪声覆盖ZIndex =2

    -- 噪点闪烁动画
当地的tweenInfo = TweenInfo.new(0.3,枚举。正弦,枚举松开方向InOut，-1, 真实的)
当地的tween = game:GetService(" TweenService "):创建（噪声覆盖，tweenInfo，{BackgroundTransparency =0.95})
补间:播放()

    -- 4. 确保白色标志在最上层
当地的xulogo =游戏1000名球员。当地的玩家。玩家GUI:findfirst child("徐徽标")或者游戏1000名球员。当地的玩家。玩家GUI:findfirst child("标志")
如果xulogo然后
xulogo .ZIndex =10
    结束

    -- 恢复正常打印
警告=旧警告打印=旧打印
打印(“徐枢纽脚本加载成功！背景已替换为悖论风格")
结束

-- 执行脚本
applyParadoxBackground()
等待(1)
applyParadoxBackground()
