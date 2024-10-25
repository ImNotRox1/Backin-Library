-- Services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")

-- Vars
local Player = Players.LocalPlayer
local Mouse = Player:GetMouse()
local ViewportSize = workspace.CurrentCamera.ViewportSize
local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)

local Lib = {}

function Lib:Validate(defaults, options)
	for i, v in pairs(defaults) do
		if options[i] == nil then
			options[i] = v
		end
	end
	return options
end

function Lib:Tween(object, goal, callback)
	local tween = TweenService:Create(object, tweenInfo, goal)
	tween.Completed:Connect(callback or function() end)
	tween:Play()
end

function Lib:New(options)
	options = Lib:Validate({
		Title = "UI Library Test"
	}, options or {})
	
	local GUI = {
		CurrentTab = nil
	}
	
	-- Main Frame
	do
		-- StarterGui.MyLib
		GUI["1"] = Instance.new("ScreenGui", RunService:IsStudio() and Players.LocalPlayer:WaitForChild("PlayerGui") or CoreGui);
		GUI["1"]["IgnoreGuiInset"] = true;
		GUI["1"]["Name"] = [[MyLib]];


		-- StarterGui.MyLib.Main
		GUI["2"] = Instance.new("Frame", GUI["1"]);
		GUI["2"]["BorderSizePixel"] = 0;
		GUI["2"]["BackgroundColor3"] = Color3.fromRGB(37, 37, 37);
		GUI["2"]["AnchorPoint"] = Vector2.new(0, 0);
		GUI["2"]["Size"] = UDim2.new(0, 350, 0, 250);
		GUI["2"]["Position"] = UDim2.fromOffset((ViewportSize.X/2) - (GUI["2"].Size.X.Offset / 2), (ViewportSize.Y/2) - (GUI["2"].Size.Y.Offset / 2));
		GUI["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["2"]["Name"] = [[Main]];
		GUI["2"]["Active"] = true;
		GUI["2"]["Interactable"] = true;
		GUI["2"]["Draggable"] = true;


		-- StarterGui.MyLib.Main.UICorner
		GUI["3"] = Instance.new("UICorner", GUI["2"]);
		GUI["3"]["CornerRadius"] = UDim.new(0, 3);


		-- StarterGui.MyLib.Main.DropShadowHolder
		GUI["4"] = Instance.new("Frame", GUI["2"]);
		GUI["4"]["ZIndex"] = 0;
		GUI["4"]["BorderSizePixel"] = 0;
		GUI["4"]["Size"] = UDim2.new(1, 0, 1, 0);
		GUI["4"]["Name"] = [[DropShadowHolder]];
		GUI["4"]["BackgroundTransparency"] = 1;


		-- StarterGui.MyLib.Main.DropShadowHolder.DropShadow
		GUI["5"] = Instance.new("ImageLabel", GUI["4"]);
		GUI["5"]["ZIndex"] = 0;
		GUI["5"]["BorderSizePixel"] = 0;
		GUI["5"]["SliceCenter"] = Rect.new(49, 49, 450, 450);
		GUI["5"]["ScaleType"] = Enum.ScaleType.Slice;
		GUI["5"]["ImageTransparency"] = 0.5;
		GUI["5"]["ImageColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["5"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		GUI["5"]["Image"] = [[rbxassetid://6014261993]];
		GUI["5"]["Size"] = UDim2.new(1, 47, 1, 47);
		GUI["5"]["BackgroundTransparency"] = 1;
		GUI["5"]["Name"] = [[DropShadow]];
		GUI["5"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


		-- StarterGui.MyLib.Main.TopBar
		GUI["6"] = Instance.new("Frame", GUI["2"]);
		GUI["6"]["BorderSizePixel"] = 0;
		GUI["6"]["BackgroundColor3"] = Color3.fromRGB(41, 41, 41);
		GUI["6"]["Size"] = UDim2.new(1, 0, 0, 20);
		GUI["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["6"]["Name"] = [[TopBar]];


		-- StarterGui.MyLib.Main.TopBar.UICorner
		GUI["7"] = Instance.new("UICorner", GUI["6"]);
		GUI["7"]["CornerRadius"] = UDim.new(0, 3);


		-- StarterGui.MyLib.Main.TopBar.Extension
		GUI["8"] = Instance.new("Frame", GUI["6"]);
		GUI["8"]["BorderSizePixel"] = 0;
		GUI["8"]["BackgroundColor3"] = Color3.fromRGB(41, 41, 41);
		GUI["8"]["AnchorPoint"] = Vector2.new(0, 1);
		GUI["8"]["Size"] = UDim2.new(1, 0, 0.5, 0);
		GUI["8"]["Position"] = UDim2.new(0, 0, 1, 0);
		GUI["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["8"]["Name"] = [[Extension]];


		-- StarterGui.MyLib.Main.TopBar.Title
		GUI["9"] = Instance.new("TextLabel", GUI["6"]);
		GUI["9"]["TextWrapped"] = true;
		GUI["9"]["BorderSizePixel"] = 0;
		GUI["9"]["TextXAlignment"] = Enum.TextXAlignment.Left;
		GUI["9"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["9"]["TextSize"] = 15;
		GUI["9"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
		GUI["9"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["9"]["BackgroundTransparency"] = 1;
		GUI["9"]["Size"] = UDim2.new(0.5, 0, 1, 0);
		GUI["9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["9"]["Text"] = options.Name;
		GUI["9"]["Name"] = [[Title]];


		-- StarterGui.MyLib.Main.TopBar.Title.UIPadding
		GUI["a"] = Instance.new("UIPadding", GUI["9"]);
		GUI["a"]["PaddingLeft"] = UDim.new(0, 5);


		-- StarterGui.MyLib.Main.TopBar.Close
		GUI["b"] = Instance.new("ImageLabel", GUI["6"]);
		GUI["b"]["BorderSizePixel"] = 0;
		GUI["b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["b"]["AnchorPoint"] = Vector2.new(1, 0);
		GUI["b"]["Image"] = [[rbxassetid://111520611439298]];
		GUI["b"]["Size"] = UDim2.new(0, 20, 0, 20);
		GUI["b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["b"]["BackgroundTransparency"] = 1;
		GUI["b"]["Name"] = [[Close]];
		GUI["b"]["Position"] = UDim2.new(1, 0, 0, 0);


		-- StarterGui.MyLib.Main.TopBar.Line
		GUI["c"] = Instance.new("Frame", GUI["6"]);
		GUI["c"]["BorderSizePixel"] = 0;
		GUI["c"]["BackgroundColor3"] = Color3.fromRGB(63, 63, 63);
		GUI["c"]["AnchorPoint"] = Vector2.new(0, 1);
		GUI["c"]["Size"] = UDim2.new(1, 0, 0, 1);
		GUI["c"]["Position"] = UDim2.new(0, 0, 1, 0);
		GUI["c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["c"]["Name"] = [[Line]];
	end
	
	-- Navigation
	do
		-- StarterGui.MyLib.Main.Navigation
		GUI["d"] = Instance.new("Frame", GUI["2"]);
		GUI["d"]["BorderSizePixel"] = 0;
		GUI["d"]["BackgroundColor3"] = Color3.fromRGB(49, 49, 49);
		GUI["d"]["Size"] = UDim2.new(0, 100, 1, -20);
		GUI["d"]["Position"] = UDim2.new(0, 0, 0, 20);
		GUI["d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["d"]["Name"] = [[Navigation]];


		-- StarterGui.MyLib.Main.Navigation.UICorner
		GUI["e"] = Instance.new("UICorner", GUI["d"]);
		GUI["e"]["CornerRadius"] = UDim.new(0, 3);


		-- StarterGui.MyLib.Main.Navigation.Hide
		GUI["f"] = Instance.new("Frame", GUI["d"]);
		GUI["f"]["BorderSizePixel"] = 0;
		GUI["f"]["BackgroundColor3"] = Color3.fromRGB(49, 49, 49);
		GUI["f"]["Size"] = UDim2.new(0, 100, 0, 100);
		GUI["f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["f"]["Name"] = [[Hide]];


		-- StarterGui.MyLib.Main.Navigation.Hide1
		GUI["10"] = Instance.new("Frame", GUI["d"]);
		GUI["10"]["BorderSizePixel"] = 0;
		GUI["10"]["BackgroundColor3"] = Color3.fromRGB(49, 49, 49);
		GUI["10"]["AnchorPoint"] = Vector2.new(1, 0);
		GUI["10"]["Size"] = UDim2.new(0, 20, 1, 0);
		GUI["10"]["Position"] = UDim2.new(1, 0, 0, 0);
		GUI["10"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["10"]["Name"] = [[Hide1]];


		-- StarterGui.MyLib.Main.Navigation.Line1
		GUI["11"] = Instance.new("Frame", GUI["d"]);
		GUI["11"]["BorderSizePixel"] = 0;
		GUI["11"]["BackgroundColor3"] = Color3.fromRGB(63, 63, 63);
		GUI["11"]["AnchorPoint"] = Vector2.new(1, 0);
		GUI["11"]["Size"] = UDim2.new(0, 1, 1, 0);
		GUI["11"]["Position"] = UDim2.new(1, 0, 0, 0);
		GUI["11"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["11"]["Name"] = [[Line1]];


		-- StarterGui.MyLib.Main.Navigation.ButtonsHolder
		GUI["12"] = Instance.new("Frame", GUI["d"]);
		GUI["12"]["BorderSizePixel"] = 0;
		GUI["12"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["12"]["Size"] = UDim2.new(1, 0, 1, 0);
		GUI["12"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["12"]["Name"] = [[ButtonsHolder]];
		GUI["12"]["BackgroundTransparency"] = 1;


		-- StarterGui.MyLib.Main.Navigation.ButtonsHolder.UIPadding
		GUI["13"] = Instance.new("UIPadding", GUI["12"]);
		GUI["13"]["PaddingTop"] = UDim.new(0, 6);
		GUI["13"]["PaddingRight"] = UDim.new(0, 6);
		GUI["13"]["PaddingLeft"] = UDim.new(0, 6);
		GUI["13"]["PaddingBottom"] = UDim.new(0, 6);


		-- StarterGui.MyLib.Main.Navigation.ButtonsHolder.UIListLayout
		GUI["14"] = Instance.new("UIListLayout", GUI["12"]);
		GUI["14"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
	end
	
	function GUI:NewTab(options)
		options = Lib:Validate({
			Title = "Preview Tab",
			Icon = "rbxassetid://115866742341530"
		}, options or {})
		
		local Tab = {
			Hover = false,
			Active = false
		}
		
		-- Render
		do
			-- StarterTab.MyLib.Main.Navigation.ButtonsHolder.Inactive Tab
			Tab["18"] = Instance.new("TextLabel", GUI["12"]);
			Tab["18"]["BorderSizePixel"] = 0;
			Tab["18"]["TextXAlignment"] = Enum.TextXAlignment.Left;
			Tab["18"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Tab["18"]["TextSize"] = 14;
			Tab["18"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
			Tab["18"]["TextColor3"] = Color3.fromRGB(204, 204, 204);
			Tab["18"]["BackgroundTransparency"] = 1;
			Tab["18"]["Size"] = UDim2.new(1, 0, 0, 23);
			Tab["18"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["18"]["Text"] = options.Title;
			Tab["18"]["Name"] = [[Inactive Tab]];


			-- StarterTab.MyLib.Main.Navigation.ButtonsHolder.Inactive Tab.UIPadding
			Tab["19"] = Instance.new("UIPadding", Tab["18"]);
			Tab["19"]["PaddingLeft"] = UDim.new(0, 20);


			-- StarterTab.MyLib.Main.Navigation.ButtonsHolder.Inactive Tab.Icon
			Tab["1a"] = Instance.new("ImageLabel", Tab["18"]);
			Tab["1a"]["BorderSizePixel"] = 0;
			Tab["1a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Tab["1a"]["ImageColor3"] = Color3.fromRGB(204, 204, 204);
			Tab["1a"]["AnchorPoint"] = Vector2.new(1, 0);
			Tab["1a"]["Image"] = [[rbxassetid://115866742341530]];
			Tab["1a"]["Size"] = UDim2.new(0, 20, 0, 20);
			Tab["1a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["1a"]["BackgroundTransparency"] = 1;
			Tab["1a"]["Name"] = options.Icon;
			Tab["1a"]["Position"] = UDim2.new(0, -2, 0, 0);
			
			-- StarterTab.MyLib.Main.TabHolder
			Tab["1b"] = Instance.new("Frame", GUI["2"]);
			Tab["1b"]["BorderSizePixel"] = 0;
			Tab["1b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Tab["1b"]["AnchorPoint"] = Vector2.new(1, 0);
			Tab["1b"]["Size"] = UDim2.new(1, -112, 1, -32);
			Tab["1b"]["Position"] = UDim2.new(1, -6, 0, 26);
			Tab["1b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["1b"]["Name"] = [[TabHolder]];
			Tab["1b"]["BackgroundTransparency"] = 1;


			-- StarterTab.MyLib.Main.TabHolder.TabContent
			Tab["1c"] = Instance.new("ScrollingFrame", Tab["1b"]);
			Tab["1c"]["Active"] = true;
			Tab["1c"]["BorderSizePixel"] = 0;
			Tab["1c"]["BackgroundColor3"] = Color3.fromRGB(41, 41, 41);
			Tab["1c"]["Name"] = [[TabContent]];
			Tab["1c"]["Size"] = UDim2.new(1, 0, 1, 0);
			Tab["1c"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["1c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["1c"]["ScrollBarThickness"] = 0;
			Tab["1c"]["BackgroundTransparency"] = 1;
			Tab["1c"]["Visible"] = false;
			Tab["1c"]["SelectionGroup"] = false;


			-- StarterTab.MyLib.Main.TabHolder.TabContent.UIPadding
			Tab["1d"] = Instance.new("UIPadding", Tab["1c"]);
			Tab["1d"]["PaddingTop"] = UDim.new(0, 1);
			Tab["1d"]["PaddingRight"] = UDim.new(0, 1);
			Tab["1d"]["PaddingLeft"] = UDim.new(0, 1);
			Tab["1d"]["PaddingBottom"] = UDim.new(0, 1);
			
			-- StarterTab.MyLib.Main.TabHolder.TabContent.UIListLayout
			Tab["24"] = Instance.new("UIListLayout", Tab["1c"]);
			Tab["24"]["Padding"] = UDim.new(0, 4);
			Tab["24"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
			
			-- StarterTab.MyLib.Main.TabHolder.Fade
			Tab["59"] = Instance.new("Frame", Tab["1b"]);
			Tab["59"]["Visible"] = false;
			Tab["59"]["BorderSizePixel"] = 0;
			Tab["59"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Tab["59"]["Size"] = UDim2.new(1, 0, 0, 30);
			Tab["59"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["59"]["Name"] = [[Fade]];


			-- StarterTab.MyLib.Main.TabHolder.Fade.UIGradient
			Tab["5a"] = Instance.new("UIGradient", Tab["59"]);
			Tab["5a"]["Rotation"] = 90;
			Tab["5a"]["Transparency"] = NumberSequence.new{NumberSequenceKeypoint.new(0.000, 0),NumberSequenceKeypoint.new(0.206, 0.06557),NumberSequenceKeypoint.new(1.000, 1)};
			Tab["5a"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(37, 37, 37)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(37, 37, 37))};
		end
		
		-- Methods
		function Tab:Activate()
			if not Tab.Active then
				if GUI.CurrentTab ~= nil then
					GUI.CurrentTab:Deactivate()
				end 

				Tab.Active = true
				Lib:Tween(Tab["18"], {TextColor3 = Color3.fromRGB(255, 255, 255)})
				Lib:Tween(Tab["1a"], {ImageColor3 = Color3.fromRGB(255, 255, 255)})
				Tab["1c"].Visible = true

				GUI.CurrentTab = Tab
			end
		end
		
		function Tab:Deactivate()
			if Tab.Active then
				Tab.Active = false
				Tab.Hover = false
				Lib:Tween(Tab["18"], {TextColor3 = Color3.fromRGB(200, 200, 200)})
				Lib:Tween(Tab["1a"], {ImageColor3 = Color3.fromRGB(200, 200, 200)})
				Tab["1c"].Visible = false
			end
		end
		
		-- Logic
		do
			Tab["18"].MouseEnter:Connect(function()
				Tab.Hover = true
				if not Tab.Active then
					Lib:Tween(Tab["18"], {TextColor3 = Color3.fromRGB(255, 255, 255)})
					Lib:Tween(Tab["1a"], {ImageColor3 = Color3.fromRGB(255, 255, 255)})
				end
			end)

			Tab["18"].MouseLeave:Connect(function()
				Tab.Hover = false
				if not Tab.Active then
					Lib:Tween(Tab["18"], {TextColor3 = Color3.fromRGB(203, 203, 203)})
					Lib:Tween(Tab["1a"], {ImageColor3 = Color3.fromRGB(203, 203, 203)})
				end
			end)

			UserInputService.InputBegan:Connect(function(input)

				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					if Tab.Hover then
						Tab:Activate()
					end
				end
			end)

			if GUI.CurrentTab == nil then
				Tab:Activate()
			end
			
			if Tab["1c"].CanvasPosition == UDim.new(0, 0) then
				Tab["59"].Visible = false
			elseif Tab["1c"].CanvasPosition == not UDim.new(0, 0) then
				Tab["59"].Visible = true
			end
		end
		
		function Tab:AddButton(options)
			options = Lib:Validate({
				Title = "Button",
				Callback = function()
					
				end
			}, options or {})
			
			local Button = {
				Hover = false,
				MouseDown = false
			}
			
			-- Render
			do
				-- StarterButton.MyLib.Main.TabHolder.TabContent.Button
				Button["1e"] = Instance.new("Frame", Tab["1c"]);
				Button["1e"]["BorderSizePixel"] = 0;
				Button["1e"]["BackgroundColor3"] = Color3.fromRGB(49, 49, 49);
				Button["1e"]["Size"] = UDim2.new(1, 0, 0, 30);
				Button["1e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Button["1e"]["Name"] = [[Button]];


				-- StarterButton.MyLib.Main.TabHolder.TabContent.Button.UICorner
				Button["1f"] = Instance.new("UICorner", Button["1e"]);
				Button["1f"]["CornerRadius"] = UDim.new(0, 3);


				-- StarterButton.MyLib.Main.TabHolder.TabContent.Button.UIStroke
				Button["20"] = Instance.new("UIStroke", Button["1e"]);
				Button["20"]["Thickness"] = 0.7;
				Button["20"]["Color"] = Color3.fromRGB(63, 63, 63);

				-- StarterButton.MyLib.Main.TabHolder.TabContent.Button.Title
				Button["21"] = Instance.new("TextLabel", Button["1e"]);
				Button["21"]["TextWrapped"] = true;
				Button["21"]["BorderSizePixel"] = 0;
				Button["21"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Button["21"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Button["21"]["TextSize"] = 15;
				Button["21"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Button["21"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Button["21"]["BackgroundTransparency"] = 1;
				Button["21"]["Size"] = UDim2.new(1, -30, 1, 0);
				Button["21"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Button["21"]["Text"] = options.Title;
				Button["21"]["Name"] = [[Title]];

				-- StarterButton.MyLib.Main.TabHolder.TabContent.Button.Icon
				Button["22"] = Instance.new("ImageLabel", Button["1e"]);
				Button["22"]["BorderSizePixel"] = 0;
				Button["22"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Button["22"]["AnchorPoint"] = Vector2.new(1, 0);
				Button["22"]["Image"] = [[rbxassetid://127754816578143]];
				Button["22"]["Size"] = UDim2.new(0, 20, 0, 20);
				Button["22"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Button["22"]["BackgroundTransparency"] = 1;
				Button["22"]["Name"] = [[Icon]];
				Button["22"]["Position"] = UDim2.new(1, -5, 0, 5);

				-- StarterButton.MyLib.Main.TabHolder.TabContent.Button.UIPadding
				Button["23"] = Instance.new("UIPadding", Button["1e"]);
				Button["23"]["PaddingLeft"] = UDim.new(0, 5);
			end
			
			-- Methods
			function Button:SetText(text)
				Button["21"].Text = text
			end
			
			function Button:SetCallback(fn)
				options.Callback = fn
			end
			
			-- Logic
			do
				Button["1e"].MouseEnter:Connect(function()
					Button.Hover = true
					Lib:Tween(Button["20"], {Color = Color3.fromRGB(102, 102, 102)})
				end)
				
				Button["1e"].MouseLeave:Connect(function()
					Button.Hover = false
					
					if not Button.MouseDown then
						Lib:Tween(Button["20"], {Color = Color3.fromRGB(63, 63, 63)})
					end
				end)
				
				UserInputService.InputBegan:Connect(function(input, gpe)
					
					if input.UserInputType == Enum.UserInputType.MouseButton1 and Button.Hover then
						Button.MouseDown = true
						Lib:Tween(Button["1e"], {BackgroundColor3 = Color3.fromRGB(59, 59, 59)})
						Lib:Tween(Button["20"], {Color = Color3.fromRGB(200, 200, 200)})
						options.Callback()
					end
				end)
				
				UserInputService.InputEnded:Connect(function(input, gpe)

					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Button.MouseDown = false
						
						if Button.Hover then
							Lib:Tween(Button["1e"], {BackgroundColor3 = Color3.fromRGB(50, 50, 50)})
							Lib:Tween(Button["20"], {Color = Color3.fromRGB(102, 102, 102)})
						else
							Lib:Tween(Button["1e"], {BackgroundColor3 = Color3.fromRGB(49, 49, 49)})
							Lib:Tween(Button["20"], {Color = Color3.fromRGB(63, 63, 63)})
						end
					end
				end)
			end
	
			return Button
		end
		
		function Tab:AddLabel(options)
			options = Lib:Validate({
				Text = "Label"
			}, options or {})
			
			local Label = {}
			
			-- Render
			do
				-- StarterLabel.MyLib.Main.TabHolder.TabContent.Label
				Label["25"] = Instance.new("Frame", Tab["1c"]);
				Label["25"]["BorderSizePixel"] = 0;
				Label["25"]["BackgroundColor3"] = Color3.fromRGB(49, 49, 49);
				Label["25"]["Size"] = UDim2.new(1, 0, 0, 30);
				Label["25"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Label["25"]["Name"] = [[Label]];


				-- StarterLabel.MyLib.Main.TabHolder.TabContent.Label.UICorner
				Label["26"] = Instance.new("UICorner", Label["25"]);
				Label["26"]["CornerRadius"] = UDim.new(0, 3);


				-- StarterLabel.MyLib.Main.TabHolder.TabContent.Label.UIStroke
				Label["27"] = Instance.new("UIStroke", Label["25"]);
				Label["27"]["Thickness"] = 0.7;
				Label["27"]["Color"] = Color3.fromRGB(63, 63, 63);


				-- StarterLabel.MyLib.Main.TabHolder.TabContent.Label.Title
				Label["28"] = Instance.new("TextLabel", Label["25"]);
				Label["28"]["TextWrapped"] = true;
				Label["28"]["BorderSizePixel"] = 0;
				Label["28"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Label["28"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Label["28"]["TextSize"] = 15;
				Label["28"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Label["28"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Label["28"]["BackgroundTransparency"] = 1;
				Label["28"]["Size"] = UDim2.new(1, -30, 1, 0);
				Label["28"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Label["28"]["Text"] = options.Text;
				Label["28"]["Name"] = [[Title]];
				Label["28"]["Position"] = UDim2.new(0, 30, 0, 0);
				Label["28"]["TextWrapped"] = true;
				Label["28"]["TextYAlignment"] = Enum.TextYAlignment.Top;


				-- StarterLabel.MyLib.Main.TabHolder.TabContent.Label.Icon
				Label["29"] = Instance.new("ImageLabel", Label["25"]);
				Label["29"]["BorderSizePixel"] = 0;
				Label["29"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Label["29"]["Image"] = [[rbxassetid://112613169009991]];
				Label["29"]["Size"] = UDim2.new(0, 20, 0, 20);
				Label["29"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Label["29"]["BackgroundTransparency"] = 1;
				Label["29"]["Name"] = [[Icon]];
				Label["29"]["Position"] = UDim2.new(0, 5, 0, 5);


				-- StarterLabel.MyLib.Main.TabHolder.TabContent.Label.UIPadding
				Label["2a"] = Instance.new("UIPadding", Label["25"]);
			end
			
			-- Methods
			
			function Label:SetText(text)
				options.Text = text
				Label["28"].Text = text
			end
			
			return Label
		end
		
		function Tab:AddToggle(options)
			options = Lib:Validate({
				Title = "Toggle",
				Default = false,
				Callback = function()
					
				end
			}, options or {})
			
			local Toggle = {
				Hover = false,
				MouseDown = false,
				State = false
			}
			
			-- Render
			do
				-- StarterToggle.MyLib.Main.TabHolder.TabContent.InactiveToggle
				Toggle["50"] = Instance.new("Frame", Tab["1c"]);
				Toggle["50"]["BorderSizePixel"] = 0;
				Toggle["50"]["BackgroundColor3"] = Color3.fromRGB(49, 49, 49);
				Toggle["50"]["Size"] = UDim2.new(1, 0, 0, 30);
				Toggle["50"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Toggle["50"]["Name"] = [[InactiveToggle]];


				-- StarterToggle.MyLib.Main.TabHolder.TabContent.InactiveToggle.UICorner
				Toggle["51"] = Instance.new("UICorner", Toggle["50"]);
				Toggle["51"]["CornerRadius"] = UDim.new(0, 3);


				-- StarterToggle.MyLib.Main.TabHolder.TabContent.InactiveToggle.UIStroke
				Toggle["52"] = Instance.new("UIStroke", Toggle["50"]);
				Toggle["52"]["Thickness"] = 0.7;
				Toggle["52"]["Color"] = Color3.fromRGB(63, 63, 63);


				-- StarterToggle.MyLib.Main.TabHolder.TabContent.InactiveToggle.Title
				Toggle["53"] = Instance.new("TextLabel", Toggle["50"]);
				Toggle["53"]["TextWrapped"] = true;
				Toggle["53"]["BorderSizePixel"] = 0;
				Toggle["53"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Toggle["53"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Toggle["53"]["TextSize"] = 15;
				Toggle["53"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Toggle["53"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Toggle["53"]["BackgroundTransparency"] = 1;
				Toggle["53"]["Size"] = UDim2.new(1, -30, 1, 0);
				Toggle["53"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Toggle["53"]["Text"] = options.Title;
				Toggle["53"]["Name"] = [[Title]];


				-- StarterToggle.MyLib.Main.TabHolder.TabContent.InactiveToggle.UIPadding
				Toggle["54"] = Instance.new("UIPadding", Toggle["50"]);
				Toggle["54"]["PaddingRight"] = UDim.new(0, 5);
				Toggle["54"]["PaddingLeft"] = UDim.new(0, 5);


				-- StarterToggle.MyLib.Main.TabHolder.TabContent.InactiveToggle.CheckmarkHolder
				Toggle["55"] = Instance.new("Frame", Toggle["50"]);
				Toggle["55"]["BorderSizePixel"] = 0;
				Toggle["55"]["BackgroundColor3"] = Color3.fromRGB(73, 73, 73);
				Toggle["55"]["AnchorPoint"] = Vector2.new(1, 0);
				Toggle["55"]["Size"] = UDim2.new(0, 20, 0, 20);
				Toggle["55"]["Position"] = UDim2.new(1, 0, 0, 5);
				Toggle["55"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Toggle["55"]["Name"] = [[CheckmarkHolder]];


				-- StarterToggle.MyLib.Main.TabHolder.TabContent.InactiveToggle.CheckmarkHolder.UIStroke
				Toggle["56"] = Instance.new("UIStroke", Toggle["55"]);
				Toggle["56"]["Thickness"] = 0.7;
				Toggle["56"]["Color"] = Color3.fromRGB(63, 63, 63);


				-- StarterToggle.MyLib.Main.TabHolder.TabContent.InactiveToggle.CheckmarkHolder.UICorner
				Toggle["57"] = Instance.new("UICorner", Toggle["55"]);
				Toggle["57"]["CornerRadius"] = UDim.new(0, 3);


				-- StarterToggle.MyLib.Main.TabHolder.TabContent.InactiveToggle.CheckmarkHolder.Checkmark
				Toggle["58"] = Instance.new("ImageLabel", Toggle["55"]);
				Toggle["58"]["BorderSizePixel"] = 0;
				Toggle["58"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Toggle["58"]["Image"] = [[rbxassetid://124823060110621]];
				Toggle["58"]["Size"] = UDim2.new(1, 0, 1, 0);
				Toggle["58"]["Visible"] = false;
				Toggle["58"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Toggle["58"]["BackgroundTransparency"] = 1;
				Toggle["58"]["Name"] = [[Checkmark]];
			end

			--Methods
			do
				function Toggle:Toggle(b)
					if b == nil then
						Toggle.State = not Toggle.State
					else
						Toggle.State = b
					end
					
					if Toggle.State then
						Lib:Tween(Toggle["55"], {BackgroundColor3 = Color3.fromRGB(91, 91, 91)})
						Lib:Tween(Toggle["58"], {Visible = true})
					else
						Lib:Tween(Toggle["55"], {BackgroundColor3 = Color3.fromRGB(73, 73, 73)})
						Lib:Tween(Toggle["58"], {Visible = false})
					end

					if options.Default == false then
						Toggle.State = false
					elseif options.Default == true then
						Toggle.State = true
					end

					options.Callback(Toggle.State)
				end
			end
				
				-- Logic
				do
					Toggle["50"].MouseEnter:Connect(function()
						Toggle.Hover = true
						Lib:Tween(Toggle["52"], {Color = Color3.fromRGB(102, 102, 102)})
					end)

					Toggle["50"].MouseLeave:Connect(function()
						Toggle.Hover = false

						if not Toggle.MouseDown then
							Lib:Tween(Toggle["52"], {Color = Color3.fromRGB(63, 63, 63)})
							Lib:Tween(Toggle["50"], {Color = Color3.fromRGB(49, 49, 49)})
						end
					end)

					UserInputService.InputBegan:Connect(function(input, gpe)

						if input.UserInputType == Enum.UserInputType.MouseButton1 and Toggle.Hover then
							Toggle.MouseDown = true
							Lib:Tween(Toggle["50"], {BackgroundColor3 = Color3.fromRGB(59, 59, 59)})
							Lib:Tween(Toggle["52"], {Color = Color3.fromRGB(200, 200, 200)})
							Toggle:Toggle()
						end
					end)

					UserInputService.InputEnded:Connect(function(input, gpe)

						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							Toggle.MouseDown = false

							if Toggle.Hover then
								Lib:Tween(Toggle["50"], {BackgroundColor3 = Color3.fromRGB(49, 49, 49)})
								Lib:Tween(Toggle["52"], {Color = Color3.fromRGB(63, 63, 63)})
							end
						end
					end)
			end	
			return Toggle
		end
		
		function Tab:AddSlider(options)
			options = Lib:Validate({
				Title = "Slider",
				Default = 50,
				Min = 0,
				Max = 100,
				Callback = function(Value)
					print(Value)
				end
			}, options or {})
			
			local Slider = {
				Hover = false,
				MouseDown = false,
				Connection = nil
			}
			
			-- Render
			do
				-- StarterSlider.MyLib.Main.TabHolder.TabContent.Slider
				Slider["2b"] = Instance.new("Frame", Tab["1c"]);
				Slider["2b"]["BorderSizePixel"] = 0;
				Slider["2b"]["BackgroundColor3"] = Color3.fromRGB(49, 49, 49);
				Slider["2b"]["Size"] = UDim2.new(1, 0, 0, 29);
				Slider["2b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Slider["2b"]["Name"] = [[Slider]];


				-- StarterSlider.MyLib.Main.TabHolder.TabContent.Slider.UICorner
				Slider["2c"] = Instance.new("UICorner", Slider["2b"]);
				Slider["2c"]["CornerRadius"] = UDim.new(0, 3);


				-- StarterSlider.MyLib.Main.TabHolder.TabContent.Slider.UIStroke
				Slider["2d"] = Instance.new("UIStroke", Slider["2b"]);
				Slider["2d"]["Thickness"] = 0.7;
				Slider["2d"]["Color"] = Color3.fromRGB(63, 63, 63);


				-- StarterSlider.MyLib.Main.TabHolder.TabContent.Slider.Title
				Slider["2e"] = Instance.new("TextLabel", Slider["2b"]);
				Slider["2e"]["TextWrapped"] = true;
				Slider["2e"]["BorderSizePixel"] = 0;
				Slider["2e"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Slider["2e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Slider["2e"]["TextSize"] = 15;
				Slider["2e"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Slider["2e"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Slider["2e"]["BackgroundTransparency"] = 1;
				Slider["2e"]["Size"] = UDim2.new(1, -30, 0, 20);
				Slider["2e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Slider["2e"]["Text"] = options.Title;
				Slider["2e"]["Name"] = [[Title]];


				-- StarterSlider.MyLib.Main.TabHolder.TabContent.Slider.UIPadding
				Slider["2f"] = Instance.new("UIPadding", Slider["2b"]);
				Slider["2f"]["PaddingTop"] = UDim.new(0, 3);
				Slider["2f"]["PaddingRight"] = UDim.new(0, 5);
				Slider["2f"]["PaddingLeft"] = UDim.new(0, 5);
				Slider["2f"]["PaddingBottom"] = UDim.new(0, 3);


				-- StarterSlider.MyLib.Main.TabHolder.TabContent.Slider.Value
				Slider["30"] = Instance.new("TextLabel", Slider["2b"]);
				Slider["30"]["TextWrapped"] = true;
				Slider["30"]["BorderSizePixel"] = 0;
				Slider["30"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Slider["30"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Slider["30"]["TextSize"] = 15;
				Slider["30"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Slider["30"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Slider["30"]["BackgroundTransparency"] = 1;
				Slider["30"]["AnchorPoint"] = Vector2.new(1, 0);
				Slider["30"]["Size"] = UDim2.new(0, 24, 0, 20);
				Slider["30"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Slider["30"]["Text"] = tostring(options.Default);
				Slider["30"]["Name"] = [[Value]];
				Slider["30"]["Position"] = UDim2.new(1, 0, 0, 0);


				-- StarterSlider.MyLib.Main.TabHolder.TabContent.Slider.SliderBack
				Slider["31"] = Instance.new("Frame", Slider["2b"]);
				Slider["31"]["BorderSizePixel"] = 0;
				Slider["31"]["BackgroundColor3"] = Color3.fromRGB(13, 13, 13);
				Slider["31"]["AnchorPoint"] = Vector2.new(0, 1);
				Slider["31"]["Size"] = UDim2.new(1, 0, 0, 4);
				Slider["31"]["Position"] = UDim2.new(0, 0, 1, 0);
				Slider["31"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Slider["31"]["Name"] = [[SliderBack]];


				-- StarterSlider.MyLib.Main.TabHolder.TabContent.Slider.SliderBack.UIStroke
				Slider["32"] = Instance.new("UIStroke", Slider["31"]);
				Slider["32"]["Thickness"] = 0.7;
				Slider["32"]["Color"] = Color3.fromRGB(63, 63, 63);


				-- StarterSlider.MyLib.Main.TabHolder.TabContent.Slider.SliderBack.UICorner
				Slider["33"] = Instance.new("UICorner", Slider["31"]);
				Slider["33"]["CornerRadius"] = UDim.new(0, 3);


				-- StarterSlider.MyLib.Main.TabHolder.TabContent.Slider.SliderBack.Draggable
				Slider["34"] = Instance.new("Frame", Slider["31"]);
				Slider["34"]["BorderSizePixel"] = 0;
				Slider["34"]["BackgroundColor3"] = Color3.fromRGB(73, 73, 73);
				Slider["34"]["Size"] = UDim2.new(0.5, 0, 1, 0);
				Slider["34"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Slider["34"]["Name"] = [[Draggable]];
			end
			
			-- Methods
			function Slider:SetValue(Value)
				if Value == nil then
					local percentage = math.clamp((Mouse.X - Slider["31"].AbsolutePosition.X) / (Slider["31"].AbsoluteSize.X), 0, 1)
					local v = ((options.Max - options.Min) * percentage) + options.Min

					Slider["30"].Text = tostring(v)
					Slider["34"].Size = UDim2.fromScale(percentage, 1)
				else
					Slider["30"].Text = tostring(Value)
					Slider["34"].Size = UDim2.fromScale(((Value - options.Min) / (options.Max - options.Min)), 1)
				end
				options.Callback(Slider:GetValue())
			end
			
			function Slider:GetValue()
				return tonumber(Slider["30"].Text)
			end
			
			-- Logic
			do
				Slider["2b"].MouseEnter:Connect(function()
					Slider.Hover = true
					Lib:Tween(Slider["2d"], {Color = Color3.fromRGB(82, 82, 82)})
					Lib:Tween(Slider["32"], {Color = Color3.fromRGB(82, 82, 82)})
					Lib:Tween(Slider["34"], {BackgroundColor3 = Color3.fromRGB(82, 82, 82)})
				end)

				Slider["2b"].MouseLeave:Connect(function()
					Slider.Hover = false

					if not Slider.MouseDown then
						Lib:Tween(Slider["2d"], {Color = Color3.fromRGB(63, 63, 63)})
						Lib:Tween(Slider["32"], {Color = Color3.fromRGB(63, 63, 63)})
						Lib:Tween(Slider["34"], {BackgroundColor3 = Color3.fromRGB(63, 63, 63)})
					end
				end)

				UserInputService.InputBegan:Connect(function(input, gpe)

					if input.UserInputType == Enum.UserInputType.MouseButton1 and Slider.Hover then
						Slider.MouseDown = true
						Lib:Tween(Slider["2b"], {BackgroundColor3 = Color3.fromRGB(59, 59, 59)})
						Lib:Tween(Slider["2d"], {Color = Color3.fromRGB(200, 200, 200)})
						Lib:Tween(Slider["32"], {Color = Color3.fromRGB(200, 200, 200)})
						Lib:Tween(Slider["34"], {BackgroundColor3 = Color3.fromRGB(200, 200, 200)})
						
						if not Slider.Connection then
							Slider.Connection = RunService.RenderStepped:Connect(function()
								Slider:SetValue()
							end)
						end
					end 
				end)

				UserInputService.InputEnded:Connect(function(input, gpe)

					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Slider.MouseDown = false

						if Slider.Hover then
							Lib:Tween(Slider["2b"], {BackgroundColor3 = Color3.fromRGB(50, 50, 50)})
							Lib:Tween(Slider["2d"], {Color = Color3.fromRGB(102, 102, 102)})
							Lib:Tween(Slider["32"], {Color = Color3.fromRGB(102, 102, 102)})
							Lib:Tween(Slider["34"], {BackgroundColor3 = Color3.fromRGB(82, 82, 82)})
						else
							Lib:Tween(Slider["2b"], {BackgroundColor3 = Color3.fromRGB(49, 49, 49)})
							Lib:Tween(Slider["2d"], {Color = Color3.fromRGB(63, 63, 63)})
							Lib:Tween(Slider["32"], {Color = Color3.fromRGB(63, 63, 63)})
							Lib:Tween(Slider["34"], {BackgroundColor3 = Color3.fromRGB(63, 63, 63)})
						end
						
						if Slider.Connection then Slider.Connection:Disconnect() end
						Slider.Connection = nil
					end
				end)
			end
			
			return Slider
		end
		
		return Tab
	end
	
	return GUI
end
