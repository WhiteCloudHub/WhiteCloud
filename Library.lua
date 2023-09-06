local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local Library = {}
function Library:CreateWindow(GameText)
	if game.CoreGui:FindFirstChild("WhiteCloud") then
		game.CoreGui:FindFirstChild("WhiteCloud"):Destroy()
	end
	
	local WhiteCloud = Instance.new("ScreenGui")
	local Main_1 = Instance.new("Frame")
	local UIGradient_1 = Instance.new("UIGradient")
	local UICorner_1 = Instance.new("UICorner")
	local TopBar_1 = Instance.new("Frame")
	local UICorner_2 = Instance.new("UICorner")
	local Title_1 = Instance.new("TextLabel")
	local UIPadding_1 = Instance.new("UIPadding")
	local Logo_1 = Instance.new("ImageLabel")
	local GameName_1 = Instance.new("TextLabel")
	local UIPadding_2 = Instance.new("UIPadding")
	local ElementsHolder_1 = Instance.new("Frame")
	local TabsHolder_1 = Instance.new("Frame")
	local UICorner_11 = Instance.new("UICorner")
	local Close_1 = Instance.new("Frame")
	local CloseBtn_1 = Instance.new("TextButton")
	local ToggleGui_1 = Instance.new("Frame")
	local UICorner_12 = Instance.new("UICorner")
	local UIGradient_2 = Instance.new("UIGradient")
	local ToggleGuiBtn_1 = Instance.new("ImageButton")
	local Tabs_1 = Instance.new("ScrollingFrame")
	local UIListLayout_3 = Instance.new("UIListLayout")
	local UIPadding_10 = Instance.new("UIPadding")
	
	
	-- OPEN GUI
	local targetPositionOpen = UDim2.new(0.5, 0, 0.5, 0)
	local tweenInfoOpen = TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
	local tweenOpen = TweenService:Create(Main_1, tweenInfoOpen, { Position = targetPositionOpen })


	-- CLOSE GUI
	local targetPositionClose = UDim2.new(0.5, 0, 1.5, 0)
	local tweenInfoClose = TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
	local tweenClose = TweenService:Create(Main_1, tweenInfoClose, { Position = targetPositionClose })


	-- OPEN BTN
	local targetPositionOpenBtn = UDim2.new(0.5, 0,0.07, 0)
	local tweenInfoOpenBtn = TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
	local tweenOpenBtn = TweenService:Create(ToggleGui_1, tweenInfoOpenBtn, { Position = targetPositionOpenBtn })


	-- CLOSE BTN
	local targetPositionCloseBtn = UDim2.new(0.5, 0, -0.5, 0)
	local tweenInfoCloseBtn = TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
	local tweenCloseBtn = TweenService:Create(ToggleGui_1, tweenInfoCloseBtn, { Position = targetPositionCloseBtn })
	
	WhiteCloud.Name = "WhiteCloud"
	WhiteCloud.Parent = game.CoreGui
	WhiteCloud.Enabled = true
	
	Main_1.Name = "Main"
	Main_1.Parent = WhiteCloud
	Main_1.AnchorPoint = Vector2.new(0.5, 0.5)
	Main_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
	Main_1.BorderColor3 = Color3.fromRGB(0,0,0)
	Main_1.BorderSizePixel = 0
	Main_1.Position = UDim2.new(0.5, 0, 1.5, 0)
	Main_1.Size = UDim2.new(0, 368,0, 233)
	
	local gui = Main_1

	local dragging
	local dragInput
	local dragStart
	local startPos

	local function update(input)
		local delta = input.Position - dragStart
		gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end

	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
	
	UIGradient_1.Parent = Main_1
	UIGradient_1.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(7, 114, 221)), ColorSequenceKeypoint.new(1, Color3.fromRGB(221, 21, 208))}
	UIGradient_1.Rotation = 15

	UICorner_1.Parent = Main_1
	UICorner_1.CornerRadius = UDim.new(0,12)

	TopBar_1.Name = "TopBar"
	TopBar_1.Parent = Main_1
	TopBar_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
	TopBar_1.BackgroundTransparency = 0.6000000238418579
	TopBar_1.BorderColor3 = Color3.fromRGB(0,0,0)
	TopBar_1.BorderSizePixel = 0
	TopBar_1.Position = UDim2.new(0.0271739122, 0,0.0429184549, 0)
	TopBar_1.Size = UDim2.new(0, 291,0, 40)

	UICorner_2.Parent = TopBar_1
	UICorner_2.CornerRadius = UDim.new(0,12)

	Title_1.Name = "Title"
	Title_1.Parent = TopBar_1
	Title_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
	Title_1.BackgroundTransparency = 1
	Title_1.BorderColor3 = Color3.fromRGB(0,0,0)
	Title_1.BorderSizePixel = 0
	Title_1.Position = UDim2.new(0, 0,0.075000003, 0)
	Title_1.Size = UDim2.new(0, 134,0, 34)
	Title_1.Font = Enum.Font.GothamBold
	Title_1.Text = "WhiteCloud |"
	Title_1.TextColor3 = Color3.fromRGB(255,255,255)
	Title_1.TextSize = 16
	Title_1.TextXAlignment = Enum.TextXAlignment.Left

	UIPadding_1.Parent = Title_1
	UIPadding_1.PaddingLeft = UDim.new(0,37)

	Logo_1.Name = "Logo"
	Logo_1.Parent = TopBar_1
	Logo_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
	Logo_1.BackgroundTransparency = 1
	Logo_1.BorderColor3 = Color3.fromRGB(0,0,0)
	Logo_1.BorderSizePixel = 0
	Logo_1.Position = UDim2.new(0.0206185561, 0,0.224999994, 0)
	Logo_1.Size = UDim2.new(0, 28,0, 22)
	Logo_1.Image = "rbxassetid://14697422184"

	GameName_1.Name = "GameName"
	GameName_1.Parent = TopBar_1
	GameName_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
	GameName_1.BackgroundTransparency = 1
	GameName_1.BorderColor3 = Color3.fromRGB(0,0,0)
	GameName_1.BorderSizePixel = 0
	GameName_1.Position = UDim2.new(0.460481107, 0,0.075000003, 0)
	GameName_1.Size = UDim2.new(0, 157,0, 34)
	GameName_1.Font = Enum.Font.GothamBold
	GameName_1.Text = GameText
	GameName_1.TextColor3 = Color3.fromRGB(255,255,255)
	GameName_1.TextSize = 16
	GameName_1.TextXAlignment = Enum.TextXAlignment.Left

	UIPadding_2.Parent = GameName_1
	UIPadding_2.PaddingLeft = UDim.new(0,4)

	ElementsHolder_1.Name = "ElementsHolder"
	ElementsHolder_1.Parent = Main_1
	ElementsHolder_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
	ElementsHolder_1.BackgroundTransparency = 1
	ElementsHolder_1.BorderColor3 = Color3.fromRGB(0,0,0)
	ElementsHolder_1.BorderSizePixel = 0
	ElementsHolder_1.Position = UDim2.new(0.0271739122, 0,0.253218889, 0)
	ElementsHolder_1.Size = UDim2.new(0, 291,0, 161)
	
	TabsHolder_1.Name = "TabsHolder"
	TabsHolder_1.Parent = Main_1
	TabsHolder_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
	TabsHolder_1.BackgroundTransparency = 0.6000000238418579
	TabsHolder_1.BorderColor3 = Color3.fromRGB(0,0,0)
	TabsHolder_1.BorderSizePixel = 0
	TabsHolder_1.Position = UDim2.new(0.842391312, 0,0.0429184549, 0)
	TabsHolder_1.Size = UDim2.new(0, 48,0, 210)

	UICorner_11.Parent = TabsHolder_1
	UICorner_11.CornerRadius = UDim.new(0,12)

	Close_1.Name = "Close"
	Close_1.Parent = TabsHolder_1
	Close_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
	Close_1.BackgroundTransparency = 1
	Close_1.BorderColor3 = Color3.fromRGB(0,0,0)
	Close_1.BorderSizePixel = 0
	Close_1.Size = UDim2.new(0, 48,0, 37)

	CloseBtn_1.Name = "CloseBtn"
	CloseBtn_1.Parent = Close_1
	CloseBtn_1.Active = true
	CloseBtn_1.AnchorPoint = Vector2.new(0.5, 0.5)
	CloseBtn_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
	CloseBtn_1.BackgroundTransparency = 1
	CloseBtn_1.BorderColor3 = Color3.fromRGB(0,0,0)
	CloseBtn_1.BorderSizePixel = 0
	CloseBtn_1.Position = UDim2.new(0.5, 0,0.5, 0)
	CloseBtn_1.Size = UDim2.new(0, 48,0, 48)
	CloseBtn_1.Font = Enum.Font.FredokaOne
	CloseBtn_1.Text = "X"
	CloseBtn_1.TextColor3 = Color3.fromRGB(255,255,255)
	CloseBtn_1.TextSize = 33
	CloseBtn_1.MouseButton1Click:Connect(function()
		wait(0.1)
		tweenClose:Play()
		tweenOpenBtn:Play()
	end)
	
	ToggleGui_1.Name = "ToggleGui"
	ToggleGui_1.Parent = WhiteCloud
	ToggleGui_1.AnchorPoint = Vector2.new(0.5, 0.5)
	ToggleGui_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
	ToggleGui_1.BorderColor3 = Color3.fromRGB(0,0,0)
	ToggleGui_1.BorderSizePixel = 0
	ToggleGui_1.Position = UDim2.new(0.5, 0,0.07, 0)
	ToggleGui_1.Size = UDim2.new(0, 40,0, 40)

	UICorner_12.Parent = ToggleGui_1
	UICorner_12.CornerRadius = UDim.new(0,12)

	UIGradient_2.Parent = ToggleGui_1
	UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(7, 114, 221)), ColorSequenceKeypoint.new(1, Color3.fromRGB(221, 21, 208))}
	UIGradient_2.Rotation = 15

	ToggleGuiBtn_1.Name = "ToggleGuiBtn"
	ToggleGuiBtn_1.Parent = ToggleGui_1
	ToggleGuiBtn_1.AnchorPoint = Vector2.new(0.5, 0.5)
	ToggleGuiBtn_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
	ToggleGuiBtn_1.BackgroundTransparency = 1
	ToggleGuiBtn_1.BorderColor3 = Color3.fromRGB(0,0,0)
	ToggleGuiBtn_1.BorderSizePixel = 0
	ToggleGuiBtn_1.Position = UDim2.new(0.491665661, 0,0.487500012, 0)
	ToggleGuiBtn_1.Size = UDim2.new(0, 33,0, 25)
	ToggleGuiBtn_1.Image = "rbxassetid://14697422184"
	ToggleGuiBtn_1.MouseButton1Click:Connect(function()
		wait(0.1)
		tweenCloseBtn:Play()
		tweenOpen:Play()
	end)
	
	Tabs_1.Name = "Tabs"
	Tabs_1.Parent = TabsHolder_1
	Tabs_1.Active = true
	Tabs_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
	Tabs_1.BackgroundTransparency = 1
	Tabs_1.BorderColor3 = Color3.fromRGB(0,0,0)
	Tabs_1.BorderSizePixel = 0
	Tabs_1.Position = UDim2.new(0, 0,0.202380955, 0)
	Tabs_1.Size = UDim2.new(0, 48,0, 159)
	Tabs_1.ClipsDescendants = true
	Tabs_1.AutomaticCanvasSize = Enum.AutomaticSize.Y
	Tabs_1.BottomImage = "rbxasset://textures/ui/Scroll/scroll-bottom.png"
	Tabs_1.CanvasPosition = Vector2.new(0, 0)
	Tabs_1.CanvasSize = UDim2.new(0, 0,0, 0)
	Tabs_1.ElasticBehavior = Enum.ElasticBehavior.Never
	Tabs_1.HorizontalScrollBarInset = Enum.ScrollBarInset.None
	Tabs_1.MidImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
	Tabs_1.ScrollBarImageTransparency = 1
	Tabs_1.ScrollBarThickness = 1
	Tabs_1.ScrollingDirection = Enum.ScrollingDirection.Y
	Tabs_1.TopImage = "rbxasset://textures/ui/Scroll/scroll-top.png"
	Tabs_1.VerticalScrollBarInset = Enum.ScrollBarInset.None
	Tabs_1.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right
	
	UIListLayout_3.Parent = Tabs_1
	UIListLayout_3.Padding = UDim.new(0,2)
	UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder

	UIPadding_10.Parent = Tabs_1
	UIPadding_10.PaddingBottom = UDim.new(0,-2)
	UIPadding_10.PaddingLeft = UDim.new(0,2)
	
	
	function Library:CreatePopup(PopupTitle,PopupText)
		local Popup_1 = Instance.new("Frame")
		local UICorner_13 = Instance.new("UICorner")
		local UIGradient_3 = Instance.new("UIGradient")
		local Title_2 = Instance.new("Frame")
		local UICorner_14 = Instance.new("UICorner")
		local PopupTitle_1 = Instance.new("TextLabel")
		local UIPadding_11 = Instance.new("UIPadding")
		local PopupLogo_1 = Instance.new("ImageLabel")
		local Text_1 = Instance.new("Frame")
		local UICorner_15 = Instance.new("UICorner")
		local PopupText_1 = Instance.new("TextLabel")
		local UIPadding_12 = Instance.new("UIPadding")
		
		Popup_1.Name = "Popup"
		Popup_1.Parent = WhiteCloud
		Popup_1.AnchorPoint = Vector2.new(0.5, 0.5)
		Popup_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
		Popup_1.BorderColor3 = Color3.fromRGB(0,0,0)
		Popup_1.BorderSizePixel = 0
		Popup_1.Position = UDim2.new(1.2, 0,0.8, 0)
		Popup_1.Size = UDim2.new(0, 210,0, 76)

		UICorner_13.Parent = Popup_1
		UICorner_13.CornerRadius = UDim.new(0,12)

		UIGradient_3.Parent = Popup_1
		UIGradient_3.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(7, 114, 221)), ColorSequenceKeypoint.new(1, Color3.fromRGB(221, 21, 208))}
		UIGradient_3.Rotation = 15

		Title_2.Name = "Title"
		Title_2.Parent = Popup_1
		Title_2.BackgroundColor3 = Color3.fromRGB(255,255,255)
		Title_2.BackgroundTransparency = 0.6000000238418579
		Title_2.BorderColor3 = Color3.fromRGB(0,0,0)
		Title_2.BorderSizePixel = 0
		Title_2.Position = UDim2.new(0.0270000007, 0,0.140000001, 0)
		Title_2.Size = UDim2.new(0, 198,0, 23)

		UICorner_14.Parent = Title_2
		UICorner_14.CornerRadius = UDim.new(0,12)

		PopupTitle_1.Name = "PopupTitle"
		PopupTitle_1.Parent = Title_2
		PopupTitle_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
		PopupTitle_1.BackgroundTransparency = 1
		PopupTitle_1.BorderColor3 = Color3.fromRGB(0,0,0)
		PopupTitle_1.BorderSizePixel = 0
		PopupTitle_1.Position = UDim2.new(0.0307197962, 0,0.123994246, 0)
		PopupTitle_1.Size = UDim2.new(0, 191,0, 17)
		PopupTitle_1.Font = Enum.Font.GothamBold
		PopupTitle_1.Text = PopupTitle
		PopupTitle_1.TextColor3 = Color3.fromRGB(255,255,255)
		PopupTitle_1.TextSize = 13
		PopupTitle_1.TextXAlignment = Enum.TextXAlignment.Left

		UIPadding_11.Parent = PopupTitle_1
		UIPadding_11.PaddingLeft = UDim.new(0,23)

		PopupLogo_1.Name = "PopupLogo"
		PopupLogo_1.Parent = Title_2
		PopupLogo_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
		PopupLogo_1.BackgroundTransparency = 1
		PopupLogo_1.BorderColor3 = Color3.fromRGB(0,0,0)
		PopupLogo_1.BorderSizePixel = 0
		PopupLogo_1.Position = UDim2.new(0.0256711394, 0,0.202352777, 0)
		PopupLogo_1.Size = UDim2.new(0, 19,0, 14)
		PopupLogo_1.Image = "rbxassetid://14697422184"

		Text_1.Name = "Text"
		Text_1.Parent = Popup_1
		Text_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
		Text_1.BackgroundTransparency = 0.6000000238418579
		Text_1.BorderColor3 = Color3.fromRGB(0,0,0)
		Text_1.BorderSizePixel = 0
		Text_1.Position = UDim2.new(0.0270000007, 0,0.529999971, 0)
		Text_1.Size = UDim2.new(0, 198,0, 27)

		UICorner_15.Parent = Text_1
		UICorner_15.CornerRadius = UDim.new(0,12)

		PopupText_1.Name = "PopupText"
		PopupText_1.Parent = Text_1
		PopupText_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
		PopupText_1.BackgroundTransparency = 1
		PopupText_1.BorderColor3 = Color3.fromRGB(0,0,0)
		PopupText_1.BorderSizePixel = 0
		PopupText_1.Position = UDim2.new(-0.00463373959, 0,0, 0)
		PopupText_1.Size = UDim2.new(0, 191,0, 27)
		PopupText_1.ClipsDescendants = true
		PopupText_1.Font = Enum.Font.GothamBold
		PopupText_1.Text = PopupText
		PopupText_1.TextColor3 = Color3.fromRGB(255,255,255)
		PopupText_1.TextSize = 11
		PopupText_1.TextXAlignment = Enum.TextXAlignment.Left

		UIPadding_12.Parent = PopupText_1
		UIPadding_12.PaddingLeft = UDim.new(0,6)
		UIPadding_12.PaddingRight = UDim.new(0,6)
		
		local targetPosition1 = UDim2.new(0.8, 0,0.8, 0)
		local tweenInfo1 = TweenInfo.new(2, Enum.EasingStyle.Exponential)
		local tween1 = TweenService:Create(Popup_1, tweenInfo1, {Position = targetPosition1})
		local targetPosition2 = UDim2.new(1.2, 0,0.8, 0)
		local tweenInfo2 = TweenInfo.new(2, Enum.EasingStyle.Exponential)
		local tween2 = TweenService:Create(Popup_1, tweenInfo2, {Position = targetPosition2})

		tween1:Play()
		wait(3.5)
		tween2:Play()
		
	end
	local Tabs = {}
	local first = true
	local currentTab = nil
	function Tabs:CreateTab(ImageId)
		local targetTabColorOn = Color3.fromRGB(210,210,210)
		local targetTabColorOff = Color3.fromRGB(255,255,255)
		
		local TabIcon_1 = Instance.new("ImageButton")
		local Elements_1 = Instance.new("Frame")
		local UICorner_3 = Instance.new("UICorner")
		local Items_1 = Instance.new("ScrollingFrame")
		local UIListLayout_1 = Instance.new("UIListLayout")
		local UIPadding_4 = Instance.new("UIPadding")
		
		TabIcon_1.Name = "TabIcon"
		TabIcon_1.Parent = Tabs_1
		TabIcon_1.Active = true
		TabIcon_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
		TabIcon_1.BackgroundTransparency = 1
		TabIcon_1.BorderColor3 = Color3.fromRGB(0,0,0)
		TabIcon_1.BorderSizePixel = 0
		TabIcon_1.Size = UDim2.new(0, 45,0, 45)
		TabIcon_1.Image = "rbxassetid://"..ImageId
		TabIcon_1.ImageTransparency = 0.20000000298023224
		
		Elements_1.Name = "Elements"
		Elements_1.Parent = ElementsHolder_1
		Elements_1.AnchorPoint = Vector2.new(0.5, 0.5)
		Elements_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
		Elements_1.BackgroundTransparency = 0.6
		Elements_1.BorderColor3 = Color3.fromRGB(0,0,0)
		Elements_1.BorderSizePixel = 0
		Elements_1.Position = UDim2.new(0.5, 0,0.5, 0)
		Elements_1.Size = UDim2.new(0, 291,0, 161)
		
		UICorner_3.Parent = Elements_1
		UICorner_3.CornerRadius = UDim.new(0,12)
		
		Items_1.Name = "Items"
		Items_1.Parent = Elements_1
		Items_1.Active = true
		Items_1.AnchorPoint = Vector2.new(0.5, 0.5)
		Items_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
		Items_1.BackgroundTransparency = 1
		Items_1.BorderColor3 = Color3.fromRGB(0,0,0)
		Items_1.BorderSizePixel = 0
		Items_1.Position = UDim2.new(0.5, 0,0.5, 0)
		Items_1.Size = UDim2.new(0, 291,0, 149)
		Items_1.ClipsDescendants = true
		Items_1.AutomaticCanvasSize = Enum.AutomaticSize.Y
		Items_1.BottomImage = "rbxasset://textures/ui/Scroll/scroll-bottom.png"
		Items_1.CanvasPosition = Vector2.new(0, 0)
		Items_1.CanvasSize = UDim2.new(0, 0,0.5, 0)
		Items_1.ElasticBehavior = Enum.ElasticBehavior.Never
		Items_1.HorizontalScrollBarInset = Enum.ScrollBarInset.None
		Items_1.MidImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
		Items_1.ScrollBarImageTransparency = 0
		Items_1.ScrollBarThickness = 4
		Items_1.ScrollingDirection = Enum.ScrollingDirection.Y
		Items_1.TopImage = "rbxasset://textures/ui/Scroll/scroll-top.png"
		Items_1.VerticalScrollBarInset = Enum.ScrollBarInset.None
		Items_1.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right
		
		UIListLayout_1.Parent = Items_1
		UIListLayout_1.Padding = UDim.new(0,6)
		UIListLayout_1.SortOrder = Enum.SortOrder.LayoutOrder
		
		UIPadding_4.Parent = Items_1
		UIPadding_4.PaddingBottom = UDim.new(0,2)
		UIPadding_4.PaddingLeft = UDim.new(0,6)
		UIPadding_4.PaddingTop = UDim.new(0,2)
		
		local tweenInfo = TweenInfo.new(0.2)

		local tweenton = TweenService:Create(TabIcon_1, tweenInfo, {ImageColor3 = targetTabColorOn})
		local tweentoff = TweenService:Create(TabIcon_1, tweenInfo, {ImageColor3 = targetTabColorOff})

		if first then
			first = false
			Elements_1.Visible = true
			currentTab = TabIcon_1 -- Set the first tab as the current tab
			tweenton:Play()
		else
			Elements_1.Visible = false
		end

		TabIcon_1.MouseButton1Click:Connect(function()
			if currentTab then
					tweentoff:Play() -- Turn off color for the previous tab
			end
			
			tweenton:Play() -- Turn on color for the new tab

			if currentTab and currentTab ~= TabIcon_1 then
				currentTab.ImageColor3 = targetTabColorOff -- Set the color of the previously selected tab to off
			end
				
			currentTab = TabIcon_1 -- Update the current tab
			for i, v in next, ElementsHolder_1:GetChildren() do
				v.Visible = false
			end
				
			Elements_1.Visible = true
		end)
		
		local Elements = {}
		function Elements:CreateLabel(LabelText)
			local Label_1 = Instance.new("Frame")
			local LabelText_1 = Instance.new("TextLabel")
			
			Label_1.Name = "Label"
			Label_1.Parent = Items_1
			Label_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
			Label_1.BackgroundTransparency = 1
			Label_1.BorderColor3 = Color3.fromRGB(0,0,0)
			Label_1.BorderSizePixel = 0
			Label_1.Position = UDim2.new(0, 0,0.827586234, 0)
			Label_1.Size = UDim2.new(0, 274,0, 16)

			LabelText_1.Name = "LabelText"
			LabelText_1.Parent = Label_1
			LabelText_1.Active = true
			LabelText_1.AnchorPoint = Vector2.new(0.5, 0.5)
			LabelText_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
			LabelText_1.BackgroundTransparency = 1
			LabelText_1.BorderColor3 = Color3.fromRGB(0,0,0)
			LabelText_1.BorderSizePixel = 0
			LabelText_1.Position = UDim2.new(0.5, 0,0.5, 0)
			LabelText_1.Size = UDim2.new(0, 274,0, 16)
			LabelText_1.Font = Enum.Font.GothamBold
			LabelText_1.Text = LabelText
			LabelText_1.TextColor3 = Color3.fromRGB(255,255,255)
			LabelText_1.TextSize = 14	
		end
		function Elements:CreateButton(ButtonText,Callback)
			Callback = Callback or function()
			end
			
			local targetButtonColorOn = Color3.fromRGB(200,200,200)
			local targetButtonColorOff = Color3.fromRGB(255,255,255)
			
			local Button_1 = Instance.new("Frame")
			local UICorner_4 = Instance.new("UICorner")
			local ButtonBtn_1 = Instance.new("TextButton")
			
			Button_1.Name = "Button"
			Button_1.Parent = Items_1
			Button_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
			Button_1.BackgroundTransparency = 0.6000000238418579
			Button_1.BorderColor3 = Color3.fromRGB(0,0,0)
			Button_1.BorderSizePixel = 0
			Button_1.Size = UDim2.new(0, 274,0, 28)

			UICorner_4.Parent = Button_1
			UICorner_4.CornerRadius = UDim.new(0,12)

			ButtonBtn_1.Name = "ButtonBtn"
			ButtonBtn_1.Parent = Button_1
			ButtonBtn_1.Active = true
			ButtonBtn_1.AnchorPoint = Vector2.new(0.5, 0.5)
			ButtonBtn_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
			ButtonBtn_1.BackgroundTransparency = 1
			ButtonBtn_1.BorderColor3 = Color3.fromRGB(0,0,0)
			ButtonBtn_1.BorderSizePixel = 0
			ButtonBtn_1.Position = UDim2.new(0.5, 0,0.5, 0)
			ButtonBtn_1.Size = UDim2.new(0, 274,0, 28)
			ButtonBtn_1.Font = Enum.Font.GothamBold
			ButtonBtn_1.Text = ButtonText
			ButtonBtn_1.TextColor3 = Color3.fromRGB(255,255,255)
			ButtonBtn_1.TextSize = 16
			
			local tweenInfo = TweenInfo.new(0.2)

			local tweenbon = TweenService:Create(Button_1, tweenInfo, {BackgroundColor3 = targetButtonColorOn})
			local tweenboff = TweenService:Create(Button_1, tweenInfo, {BackgroundColor3 = targetButtonColorOff})

			ButtonBtn_1.MouseButton1Click:Connect(function()
				tweenbon:Play()
				wait(0.1)
				tweenboff:Play()
				Callback()
			end)
		end
		function Elements:CreateToggle(ToggleText,Callback)
			Callback = Callback or function()
			end

			local toggled = false
			local debounce = false
			
			local targetToggleColorOn = 0
			local targetToggleColorOff = 1
			
			local Toggle_1 = Instance.new("Frame")
			local UICorner_5 = Instance.new("UICorner")
			local ToggleBtn_1 = Instance.new("TextButton")
			local UIPadding_3 = Instance.new("UIPadding")
			local Toggler_1 = Instance.new("Frame")
			local UIStroke_1 = Instance.new("UIStroke")
			local UICorner_6 = Instance.new("UICorner")
			
			Toggle_1.Name = "Toggle"
			Toggle_1.Parent = Items_1
			Toggle_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
			Toggle_1.BackgroundTransparency = 0.6000000238418579
			Toggle_1.BorderColor3 = Color3.fromRGB(0,0,0)
			Toggle_1.BorderSizePixel = 0
			Toggle_1.Size = UDim2.new(0, 274,0, 28)

			UICorner_5.Parent = Toggle_1
			UICorner_5.CornerRadius = UDim.new(0,12)

			ToggleBtn_1.Name = "ToggleBtn"
			ToggleBtn_1.Parent = Toggle_1
			ToggleBtn_1.Active = true
			ToggleBtn_1.AnchorPoint = Vector2.new(0.5, 0.5)
			ToggleBtn_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
			ToggleBtn_1.BackgroundTransparency = 1
			ToggleBtn_1.BorderColor3 = Color3.fromRGB(0,0,0)
			ToggleBtn_1.BorderSizePixel = 0
			ToggleBtn_1.Position = UDim2.new(0.5, 0,0.5, 0)
			ToggleBtn_1.Size = UDim2.new(0, 274,0, 28)
			ToggleBtn_1.Font = Enum.Font.GothamBold
			ToggleBtn_1.Text = ToggleText
			ToggleBtn_1.TextColor3 = Color3.fromRGB(255,255,255)
			ToggleBtn_1.TextSize = 16
			ToggleBtn_1.TextXAlignment = Enum.TextXAlignment.Left

			UIPadding_3.Parent = ToggleBtn_1
			UIPadding_3.PaddingLeft = UDim.new(0,7)

			Toggler_1.Name = "Toggler"
			Toggler_1.Parent = Toggle_1
			Toggler_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
			Toggler_1.BackgroundTransparency = 1
			Toggler_1.BorderColor3 = Color3.fromRGB(0,0,0)
			Toggler_1.BorderSizePixel = 0
			Toggler_1.Position = UDim2.new(0.912408769, 0,0.214285716, 0)
			Toggler_1.Size = UDim2.new(0, 15,0, 15)

			UIStroke_1.Parent = Toggler_1
			UIStroke_1.Color = Color3.fromRGB(255,255,255)
			UIStroke_1.Thickness = 2

			UICorner_6.Parent = Toggler_1
			UICorner_6.CornerRadius = UDim.new(0,12)
			
			local tweenInfo = TweenInfo.new(0.2)

			local tweentcon = TweenService:Create(Toggler_1, tweenInfo, {BackgroundTransparency = targetToggleColorOn})
			local tweentcoff = TweenService:Create(Toggler_1, tweenInfo, {BackgroundTransparency = targetToggleColorOff})

			ToggleBtn_1.MouseButton1Click:Connect(
				function()
					if debounce == false then
						if toggled == false then
							debounce = true
							tweentcon:Play()
							debounce = false
							toggled = true
							pcall(Callback, toggled)
						elseif toggled == true then
							debounce = true
							tweentcoff:Play()
							debounce = false
							toggled = false
							pcall(Callback, toggled)
						end
					end
				end
			)
		end
		function Elements:CreateSlider(SliderText,max,Callback)
			local Slider_1 = Instance.new("Frame")
			local UICorner_7 = Instance.new("UICorner")
			local SliderText_1 = Instance.new("TextLabel")
			local UIPadding_5 = Instance.new("UIPadding")
			local SliderValue_1 = Instance.new("TextLabel")
			local UIPadding_6 = Instance.new("UIPadding")
			local SliderHolder_1 = Instance.new("Frame")
			local SliderBtn_1 = Instance.new("TextButton")
			local SliderInner_1 = Instance.new("Frame")
			local UICorner_8 = Instance.new("UICorner")
			local UIStroke_2 = Instance.new("UIStroke")
			
			Slider_1.Name = "Slider"
			Slider_1.Parent = Items_1
			Slider_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
			Slider_1.BackgroundTransparency = 0.6000000238418579
			Slider_1.BorderColor3 = Color3.fromRGB(0,0,0)
			Slider_1.BorderSizePixel = 0
			Slider_1.Position = UDim2.new(0, 0,0.46896553, 0)
			Slider_1.Size = UDim2.new(0, 274,0, 46)

			UICorner_7.Parent = Slider_1
			UICorner_7.CornerRadius = UDim.new(0,12)

			SliderText_1.Name = "SliderText"
			SliderText_1.Parent = Slider_1
			SliderText_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
			SliderText_1.BackgroundTransparency = 1
			SliderText_1.BorderColor3 = Color3.fromRGB(0,0,0)
			SliderText_1.BorderSizePixel = 0
			SliderText_1.Position = UDim2.new(0, 0,0.130434781, 0)
			SliderText_1.Size = UDim2.new(0, 200,0, 14)
			SliderText_1.Font = Enum.Font.GothamBold
			SliderText_1.Text = SliderText
			SliderText_1.TextColor3 = Color3.fromRGB(255,255,255)
			SliderText_1.TextSize = 16
			SliderText_1.TextXAlignment = Enum.TextXAlignment.Left

			UIPadding_5.Parent = SliderText_1
			UIPadding_5.PaddingLeft = UDim.new(0,7)

			SliderValue_1.Name = "SliderValue"
			SliderValue_1.Parent = Slider_1
			SliderValue_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
			SliderValue_1.BackgroundTransparency = 1
			SliderValue_1.BorderColor3 = Color3.fromRGB(0,0,0)
			SliderValue_1.BorderSizePixel = 0
			SliderValue_1.Position = UDim2.new(0.729927003, 0,0.130434781, 0)
			SliderValue_1.Size = UDim2.new(0, 74,0, 14)
			SliderValue_1.Font = Enum.Font.GothamBold
			SliderValue_1.Text = "0"
			SliderValue_1.TextColor3 = Color3.fromRGB(255,255,255)
			SliderValue_1.TextSize = 16
			SliderValue_1.TextXAlignment = Enum.TextXAlignment.Right

			UIPadding_6.Parent = SliderValue_1
			UIPadding_6.PaddingRight = UDim.new(0,7)

			SliderHolder_1.Name = "SliderHolder"
			SliderHolder_1.Parent = Slider_1
			SliderHolder_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
			SliderHolder_1.BackgroundTransparency = 1
			SliderHolder_1.BorderColor3 = Color3.fromRGB(0,0,0)
			SliderHolder_1.BorderSizePixel = 0
			SliderHolder_1.Position = UDim2.new(0.0260000862, 0,0.570000052, 0)
			SliderHolder_1.Size = UDim2.new(0, 260,0, 12)

			SliderBtn_1.Name = "SliderBtn"
			SliderBtn_1.Parent = SliderHolder_1
			SliderBtn_1.Active = true
			SliderBtn_1.AnchorPoint = Vector2.new(0.5, 0.5)
			SliderBtn_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
			SliderBtn_1.BackgroundTransparency = 1
			SliderBtn_1.BorderColor3 = Color3.fromRGB(0,0,0)
			SliderBtn_1.BorderSizePixel = 0
			SliderBtn_1.Position = UDim2.new(0.5, 0,0.5, 0)
			SliderBtn_1.Size = UDim2.new(0, 260,0, 12)
			SliderBtn_1.Font = Enum.Font.SourceSans
			SliderBtn_1.Text = ""
			SliderBtn_1.TextSize = 14

			SliderInner_1.Name = "SliderInner"
			SliderInner_1.Parent = SliderBtn_1
			SliderInner_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
			SliderInner_1.BorderColor3 = Color3.fromRGB(0,0,0)
			SliderInner_1.BorderSizePixel = 0
			SliderInner_1.Size = UDim2.new(0, 0,0, 12)

			UICorner_8.Parent = SliderInner_1
			UICorner_8.CornerRadius = UDim.new(0,12)

			UIStroke_2.Parent = SliderInner_1
			UIStroke_2.Color = Color3.fromRGB(255,255,255)
			UIStroke_2.Thickness = 2
			
			local isDragging = false

			SliderBtn_1.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
					isDragging = true
				end
			end)

			game:GetService("UserInputService").InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
					isDragging = false
				end
			end)

			game:GetService("RunService").RenderStepped:Connect(function()
				if isDragging then
					local mousePosition = game:GetService("UserInputService"):GetMouseLocation()
					local sliderPosition = SliderBtn_1.AbsolutePosition
					local sliderWidth = SliderBtn_1.AbsoluteSize.X
					local fillWidth = math.clamp(mousePosition.X - sliderPosition.X, 0, sliderWidth)
					SliderInner_1.Size = UDim2.new(0, fillWidth, 1, 0)

					-- Calculate and display value label
					local value = fillWidth / sliderWidth
					local minValue = 0
					local maxValue = max
					local displayValue = math.floor(minValue + (maxValue - minValue) * value, 2)
					SliderValue_1.Text = tostring(displayValue)
					Callback(displayValue)
				end
			end)
		end
		function Elements:CreateDropdown(DropdownText,options,Callback)
			local Dropdown_1 = Instance.new("Frame")
			local UICorner_9 = Instance.new("UICorner")
			local DropdownTop_1 = Instance.new("Frame")
			local UICorner_10 = Instance.new("UICorner")
			local DropdownBtn_1 = Instance.new("TextButton")
			local UIPadding_7 = Instance.new("UIPadding")
			local DropdownSelected_1 = Instance.new("TextLabel")
			local UIPadding_8 = Instance.new("UIPadding")
			local DropdownOptions_1 = Instance.new("ScrollingFrame")
			local OptionButton_1 = Instance.new("TextButton")
			local UIListLayout_2 = Instance.new("UIListLayout")
			local UIPadding_9 = Instance.new("UIPadding")
			
			Dropdown_1.Name = "Dropdown"
			Dropdown_1.Parent = Items_1
			Dropdown_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
			Dropdown_1.BackgroundTransparency = 0.800000011920929
			Dropdown_1.BorderColor3 = Color3.fromRGB(0,0,0)
			Dropdown_1.BorderSizePixel = 0
			Dropdown_1.Position = UDim2.new(0, 0,0.103448279, 0)
			Dropdown_1.Size = UDim2.new(0, 274,0, 30)

			UICorner_9.Parent = Dropdown_1
			UICorner_9.CornerRadius = UDim.new(0,12)

			DropdownTop_1.Name = "DropdownTop"
			DropdownTop_1.Parent = Dropdown_1
			DropdownTop_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
			DropdownTop_1.BackgroundTransparency = 0.800000011920929
			DropdownTop_1.BorderColor3 = Color3.fromRGB(0,0,0)
			DropdownTop_1.BorderSizePixel = 0
			DropdownTop_1.Size = UDim2.new(0, 274,0, 30)

			UICorner_10.Parent = DropdownTop_1
			UICorner_10.CornerRadius = UDim.new(0,12)

			DropdownBtn_1.Name = "DropdownBtn"
			DropdownBtn_1.Parent = DropdownTop_1
			DropdownBtn_1.Active = true
			DropdownBtn_1.AnchorPoint = Vector2.new(0.5, 0.5)
			DropdownBtn_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
			DropdownBtn_1.BackgroundTransparency = 1
			DropdownBtn_1.BorderColor3 = Color3.fromRGB(0,0,0)
			DropdownBtn_1.BorderSizePixel = 0
			DropdownBtn_1.Position = UDim2.new(0.5, 0,0.5, 0)
			DropdownBtn_1.Size = UDim2.new(0, 274,0, 30)
			DropdownBtn_1.Font = Enum.Font.GothamBold
			DropdownBtn_1.Text = DropdownText
			DropdownBtn_1.TextColor3 = Color3.fromRGB(255,255,255)
			DropdownBtn_1.TextSize = 16
			DropdownBtn_1.TextXAlignment = Enum.TextXAlignment.Left

			UIPadding_7.Parent = DropdownBtn_1
			UIPadding_7.PaddingLeft = UDim.new(0,7)

			DropdownSelected_1.Name = "DropdownSelected"
			DropdownSelected_1.Parent = DropdownTop_1
			DropdownSelected_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
			DropdownSelected_1.BackgroundTransparency = 1
			DropdownSelected_1.BorderColor3 = Color3.fromRGB(0,0,0)
			DropdownSelected_1.BorderSizePixel = 0
			DropdownSelected_1.Position = UDim2.new(0.598540127, 0,0, 0)
			DropdownSelected_1.Size = UDim2.new(0, 110,0, 30)
			DropdownSelected_1.Font = Enum.Font.GothamBold
			DropdownSelected_1.Text = "..."
			DropdownSelected_1.TextColor3 = Color3.fromRGB(255,255,255)
			DropdownSelected_1.TextSize = 14
			DropdownSelected_1.TextXAlignment = Enum.TextXAlignment.Right

			UIPadding_8.Parent = DropdownSelected_1
			UIPadding_8.PaddingRight = UDim.new(0,9)

			DropdownOptions_1.Name = "DropdownOptions"
			DropdownOptions_1.Parent = Dropdown_1
			DropdownOptions_1.Active = true
			DropdownOptions_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
			DropdownOptions_1.BackgroundTransparency = 1
			DropdownOptions_1.BorderColor3 = Color3.fromRGB(0,0,0)
			DropdownOptions_1.BorderSizePixel = 0
			DropdownOptions_1.Position = UDim2.new(0, 0,0.25, 0)
			DropdownOptions_1.Size = UDim2.new(0, 274,0, 84)
			DropdownOptions_1.ClipsDescendants = true
			DropdownOptions_1.AutomaticCanvasSize = Enum.AutomaticSize.Y
			DropdownOptions_1.BottomImage = "rbxasset://textures/ui/Scroll/scroll-bottom.png"
			DropdownOptions_1.CanvasPosition = Vector2.new(0, 0)
			DropdownOptions_1.CanvasSize = UDim2.new(0, 0,0.5, 0)
			DropdownOptions_1.ElasticBehavior = Enum.ElasticBehavior.Never
			DropdownOptions_1.HorizontalScrollBarInset = Enum.ScrollBarInset.None
			DropdownOptions_1.MidImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
			DropdownOptions_1.ScrollBarImageTransparency = 0
			DropdownOptions_1.ScrollBarThickness = 4
			DropdownOptions_1.ScrollingDirection = Enum.ScrollingDirection.Y
			DropdownOptions_1.TopImage = "rbxasset://textures/ui/Scroll/scroll-top.png"
			DropdownOptions_1.VerticalScrollBarInset = Enum.ScrollBarInset.None
			DropdownOptions_1.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right
			DropdownOptions_1.Visible = false
			
			OptionButton_1.Name = "OptionButton"
			OptionButton_1.Parent = DropdownOptions_1
			OptionButton_1.Active = true
			OptionButton_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
			OptionButton_1.BackgroundTransparency = 1
			OptionButton_1.BorderColor3 = Color3.fromRGB(0,0,0)
			OptionButton_1.BorderSizePixel = 0
			OptionButton_1.Size = UDim2.new(0, 263,0, 22)
			OptionButton_1.Font = Enum.Font.GothamBold
			OptionButton_1.Text = "Select:"
			OptionButton_1.TextColor3 = Color3.fromRGB(255,255,255)
			OptionButton_1.TextSize = 14

			UIListLayout_2.Parent = DropdownOptions_1
			UIListLayout_2.Padding = UDim.new(0,2)
			UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder

			UIPadding_9.Parent = DropdownOptions_1
			UIPadding_9.PaddingBottom = UDim.new(0,4)
			UIPadding_9.PaddingTop = UDim.new(0,4)
			
			local function ToggleDropdown()
				local isExpanded = DropdownOptions_1.Visible
				local targetSize = isExpanded and UDim2.new(0, 275, 0, 30) or UDim2.new(0, 275, 0, 90)

				local targetRotation = isExpanded and -90 or 90 -- Choose the target rotation based on expansion

				if isExpanded then
					DropdownOptions_1.Visible = false
				else
					DropdownOptions_1.Visible = true
				end

				local tweenInfo = TweenInfo.new(
					0.2, -- Duration
					Enum.EasingStyle.Quad, -- Easing style
					Enum.EasingDirection.Out -- Easing direction
				)

				local sizeTween = TweenService:Create(
					Dropdown_1,
					tweenInfo,
					{Size = targetSize}
				)
				sizeTween:Play()
			end

			local function CreateOptionButton(option)
				if option == OptionButton_1.Text then
					return -- Skip creating an option button for the default value
				end

				local OptionButtonClone = OptionButton_1:Clone()
				OptionButtonClone.Parent = DropdownOptions_1
				OptionButtonClone.Text = option
				OptionButtonClone.LayoutOrder = #DropdownOptions_1:GetChildren()
				OptionButtonClone.MouseButton1Click:Connect(function()
					DropdownSelected_1.Text = option
					ToggleDropdown()
					Callback(option) -- Call the provided callback function
				end)
			end

			local function InitializeDropdown()
				for _, option in ipairs(options) do
					CreateOptionButton(option)
				end
			end

			InitializeDropdown() -- Call the InitializeDropdown function to set up the dropdown

			DropdownBtn_1.MouseButton1Click:Connect(ToggleDropdown)
		end
		return Elements
	end
	return Tabs
end
return Library
