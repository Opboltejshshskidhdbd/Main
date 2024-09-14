_G.Main = {}

function _G.Main:New(Title)

    local ScreenGui = Instance.new("ScreenGui")
    local Frame = Instance.new("Frame")
    local TextLabel = Instance.new("TextLabel")
  local TabsFrame = Instance.new("Frame")
  local TabsUiList = Instance.new("UIListLayout")
  local CloseButton = Instance.new("TextButton")
  local TabsScroll = Instance.new("ScrollingFrame")
  
    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    ScreenGui.ResetOnSpawn = false

    Frame.Parent = ScreenGui
    Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    Frame.Position = UDim2.new(0.05382213, 0, 0.274487466, 0)
    Frame.Size = UDim2.new(0, 600, 0, 370)

  
    TextLabel.Parent = Frame
    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.BackgroundTransparency = 1.000
    TextLabel.LayoutOrder = 5
    TextLabel.Position = UDim2.new(0, 0, 0.0205405708, 0)
    TextLabel.Size = UDim2.new(0, 600, 0, 40)
    TextLabel.ZIndex = 2
    TextLabel.Font = Enum.Font.Antique
    TextLabel.Text = Title
    TextLabel.TextColor3 = Color3.fromRGB(232, 232, 232)
    TextLabel.TextSize = 18.000
    TextLabel.TextWrapped = true
    TextLabel.TextXAlignment = Enum.TextXAlignment.Left

    local function MVMBOL_fake_script()
        local script = Instance.new('LocalScript', Frame)

        script.Parent.Active = true
        script.Parent.Draggable = true
    end
    coroutine.wrap(MVMBOL_fake_script)()

    CloseButton.Name = "CloseButton"
    CloseButton.Parent = TextLabel
    CloseButton.BackgroundColor3 = Color3.fromRGB(255, 75, 75)
    CloseButton.BorderSizePixel = 0
    CloseButton.Position = UDim2.new(0.9, -3, 0.1, 0)
    CloseButton.Size = UDim2.new(0.1, 0, 1, 0)
    CloseButton.Font = Enum.Font.GothamBold
    CloseButton.Text = "X"
    CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseButton.TextScaled = true
    CloseButton.TextSize = 10

    local UICornerClose = Instance.new("UICorner")
    UICornerClose.CornerRadius = UDim.new(0, 10)
    UICornerClose.Parent = CloseButton

    -- Functionality to close the UI
    CloseButton.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)
    -- TabsFrame properties
    TabsFrame.Name = "TabsFrame"
    TabsFrame.Parent = Frame
    TabsFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
    TabsFrame.BorderSizePixel = 0
    TabsFrame.Position = UDim2.new(0, 0, 0.15, 0)
    TabsFrame.Size = UDim2.new(0.25, 0, 0.80, 0)
    
    TabsScroll.Parent = TabsFrame
  TabsScroll.Active = true
  TabsScroll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  TabsScroll.BackgroundTransparency = 1.000
  TabsScroll.BorderSizePixel = 0
  TabsScroll.Position = UDim2.new(0, 0, 0, 0)  -- Adjusted to fill Frame_2
  TabsScroll.Size = UDim2.new(1, 0, 1, 0)  -- Adjusted to fill Frame_2
  TabsScroll.ScrollBarThickness = 2
  TabsScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
  
    TabsUiList.Name = "TabsUiList"
    TabsUiList.Parent = TabsScroll
    TabsUiList.Padding = UDim.new(0, 10)
    TabsUiList.HorizontalAlignment = Enum.HorizontalAlignment.Center
    TabsUiList.SortOrder = Enum.SortOrder.LayoutOrder
    
    _G.Frame = {}
local firstTabCreated = false
  function _G.Frame:Tab(Name)
   local Frame_2 = Instance.new("Frame")
   local ScrollingFrame = Instance.new("ScrollingFrame")
   local UIListLayout = Instance.new("UIListLayout")
   local TabButton = Instance.new("TextButton")
    
    -- Button will add whenever new tab created in ui library and switch between tabs when clicked
    TabButton.Name = "TabButton"
    TabButton.Parent = TabsScroll
    TabButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    TabButton.Size = UDim2.new(1, 0, 0, 40)
    TabButton.Text = Name
    TabButton.TextColor3 = Color3.fromRGB(232, 232, 232)
    
   --Contemt Container for each tab
   Frame_2.Parent = Frame
   Frame_2.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
   Frame_2.BorderSizePixel = 0
   Frame_2.Position = UDim2.new(0.250, 0, 0.145615742, 0)
   Frame_2.Size = UDim2.new(0, 440, 0, 298)
  
  ScrollingFrame.Parent = Frame_2
  ScrollingFrame.Active = true
  ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  ScrollingFrame.BackgroundTransparency = 1.000
  ScrollingFrame.BorderSizePixel = 0
  ScrollingFrame.Position = UDim2.new(0, 0, 0, 0)  -- Adjusted to fill Frame_2
  ScrollingFrame.Size = UDim2.new(1, 0, 1, 0)  -- Adjusted to fill Frame_2
  ScrollingFrame.ScrollBarThickness = 2
  ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y

    UIListLayout.Parent = ScrollingFrame
    UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 10)

    if firstTabCreated == false then
      Frame_2.Visible = true
      firstTabCreated = true
        else
            Frame_2.Visible = false
    end
    
    TabButton.MouseButton1Click:Connect(function()
            for _, v in pairs(Frame:GetChildren()) do
                if v:IsA("Frame") and v ~= TabsFrame then
                    v.Visible = false
                end
            end
            Frame_2.Visible = true
        end)
    
function _G.Frame:Button(Name, Call)
    local ButtonContainer = Instance.new("Frame")
    ButtonContainer.Parent = ScrollingFrame
    ButtonContainer.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    ButtonContainer.BorderSizePixel = 0
    ButtonContainer.Size = UDim2.new(0, 430, 0, 36)
    
    local ContainerUiCorner = Instance.new("UICorner")
    ContainerUiCorner.CornerRadius = UDim.new(0, 5)
    ContainerUiCorner.Parent = ButtonContainer

  -- UI Setup for the Galaxy-Themed Button
local GalaxyButton = Instance.new("TextButton")
local ButtonText = Instance.new("TextLabel")
local UIGradient = Instance.new("UIGradient")
local UICorner = Instance.new("UICorner")
local UIPadding = Instance.new("UIPadding")

-- Galaxy Button
GalaxyButton.Parent = ButtonContainer
GalaxyButton.Size = UDim2.new(0, 430, 0, 34)
GalaxyButton.BackgroundColor3 = Color3.fromRGB(20, 20, 40)
GalaxyButton.BorderSizePixel = 0
GalaxyButton.Text = ""
GalaxyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
GalaxyButton.TextScaled = true
GalaxyButton.TextStrokeTransparency = 1  -- Hide default stroke
GalaxyButton.TextWrapped = true
GalaxyButton.Position = UDim2.new(0, 0, 0, 1)
-- Button Text
ButtonText.Parent = GalaxyButton
ButtonText.Size = UDim2.new(1, 0, 1, 0)
ButtonText.Position = UDim2.new(0, 0, 0, 0)
ButtonText.BackgroundTransparency = 1
ButtonText.Text = Name
ButtonText.TextColor3 = Color3.fromRGB(255, 255, 255)
ButtonText.TextStrokeTransparency = 0.5
ButtonText.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
ButtonText.TextSize = 18
ButtonText.TextXAlignment = Enum.TextXAlignment.Center
ButtonText.Font = Enum.Font.Antique

-- Gradient Background for the Button
UIGradient.Parent = GalaxyButton
UIGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 30)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(50, 0, 100)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 0, 150))
}
UIGradient.Rotation = 45

-- Gradient for the Text
local TextGradient = Instance.new("UIGradient")
TextGradient.Parent = ButtonText
TextGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),  -- White
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 150, 255)),  -- Light Blue
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 255))     -- Magenta
}
TextGradient.Rotation = 45

-- Corner Rounding
UICorner.CornerRadius = UDim.new(0, 9)
UICorner.Parent = GalaxyButton

-- Padding
UIPadding.Parent = GalaxyButton
UIPadding.PaddingLeft = UDim.new(0, 10)
UIPadding.PaddingRight = UDim.new(0, 10)
UIPadding.PaddingTop = UDim.new(0, 5)
UIPadding.PaddingBottom = UDim.new(0, 5)

-- Animation Function
local function buttonAnimation()
    local tweenService = game:GetService("TweenService")

    -- Tween info for hover effect
    local hoverTweenInfo = TweenInfo.new(
        0.3, -- Time
        Enum.EasingStyle.Quad, -- EasingStyle
        Enum.EasingDirection.Out -- EasingDirection
    )

    local hoverGoal = {BackgroundColor3 = Color3.fromRGB(255, 100, 200)}

    -- Tween info for non-hover effect
    local normalTweenInfo = TweenInfo.new(
        0.3, -- Time
        Enum.EasingStyle.Quad, -- EasingStyle
        Enum.EasingDirection.Out -- EasingDirection
    )

    local normalGoal = {BackgroundColor3 = Color3.fromRGB(20, 20, 40)}

    local hoverTween = tweenService:Create(GalaxyButton, hoverTweenInfo, hoverGoal)
    local normalTween = tweenService:Create(GalaxyButton, normalTweenInfo, normalGoal)

    GalaxyButton.MouseEnter:Connect(function()
        hoverTween:Play()
    end)

    GalaxyButton.MouseLeave:Connect(function()
        normalTween:Play()
    end)
end

-- Initialize button animation
buttonAnimation()

GalaxyButton.MouseButton1Click:Connect(function()
  pcall(Call)
 end)
end

function _G.Frame:AnimatedLabel(Text)

  local textLabel = Instance.new("TextLabel")
  local uiGradient = Instance.new("UIGradient")
  local outline = Instance.new("Frame")
  local shineFrame = Instance.new("Frame")
  local shineGradient = Instance.new("UIGradient")
  local glowPulse = Instance.new("Frame")

  -- Setting up the TextLabel
  textLabel.Parent = ScrollingFrame
  textLabel.Size = UDim2.new(1, 0, 0, 34) -- Adjust the size as needed
  textLabel.Position = UDim2.new(0, 0, 0, 0) -- Adjust the position as needed
  textLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Dark background
  textLabel.BorderSizePixel = 0
  textLabel.Text = Text
  textLabel.Font = Enum.Font.GothamBlack
  textLabel.TextSize = 20 -- Bigger text for a more striking look
  textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
  textLabel.TextXAlignment = Enum.TextXAlignment.Left -- Aligning text to the left
  textLabel.ClipsDescendants = true -- Clips text that overflows
  textLabel.ZIndex = 2

  -- Adding a UIGradient for the text with white, cyan, blue, purple, and pink
  uiGradient.Color = ColorSequence.new{
      ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)),
      ColorSequenceKeypoint.new(0.20, Color3.fromRGB(0, 255, 255)),
      ColorSequenceKeypoint.new(0.40, Color3.fromRGB(0, 102, 255)),
      ColorSequenceKeypoint.new(0.60, Color3.fromRGB(153, 51, 255)),
      ColorSequenceKeypoint.new(0.80, Color3.fromRGB(255, 102, 178)),
      ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))
  }
  uiGradient.Rotation = 90 -- Vertical gradient
  uiGradient.Parent = textLabel

  -- Gradient rotation animation
  local rotationTweenInfo = TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1, true)
  local rotationGoal = {Rotation = 360}
  local rotationTween = game:GetService("TweenService"):Create(uiGradient, rotationTweenInfo, rotationGoal)
  rotationTween:Play()

  -- Adding a glowing outline with the same color palette
  outline.Parent = Parent
  outline.Size = textLabel.Size + UDim2.new(0, 20, 0, 20)
  outline.Position = textLabel.Position - UDim2.new(0, 10, 0, 10)
  outline.BackgroundTransparency = 1
  outline.ZIndex = 1

  local outlineGradient = Instance.new("UIGradient")
  outlineGradient.Color = uiGradient.Color
  outlineGradient.Rotation = 45
  outlineGradient.Parent = outline

  -- Outline rotation animation
  local outlineTweenInfo = TweenInfo.new(6, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1, true)
  local outlineGoal = {Rotation = 360}
  local outlineTween = game:GetService("TweenService"):Create(outlineGradient, outlineTweenInfo, outlineGoal)
  outlineTween:Play()

  -- Adding a shine effect
  shineFrame.Parent = textLabel
  shineFrame.Size = UDim2.new(2, 0, 1, 0) -- Bigger than the label for smooth sliding
  shineFrame.BackgroundTransparency = 1
  shineFrame.ZIndex = 3

  shineGradient.Color = ColorSequence.new{
      ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)),
      ColorSequenceKeypoint.new(0.50, Color3.fromRGB(255, 255, 255)),
      ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))
  }
  shineGradient.Transparency = NumberSequence.new{
      NumberSequenceKeypoint.new(0.00, 1),
      NumberSequenceKeypoint.new(0.25, 0.7),
      NumberSequenceKeypoint.new(0.50, 0),
      NumberSequenceKeypoint.new(0.75, 0.7),
      NumberSequenceKeypoint.new(1.00, 1)
  }
  shineGradient.Rotation = 45
  shineGradient.Parent = shineFrame

  -- Shine animation
  local shineTweenInfo = TweenInfo.new(2.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)
  local shineGoal = {Position = UDim2.new(-1, 0, 0, 0)}
  local shineTween = game:GetService("TweenService"):Create(shineFrame, shineTweenInfo, shineGoal)
  shineTween:Play()

  -- Adding a glow pulse effect around the text
  glowPulse.Parent = Parent
  glowPulse.Size = textLabel.Size + UDim2.new(0, 30, 0, 30)
  glowPulse.Position = textLabel.Position - UDim2.new(0, 15, 0, 15)
  glowPulse.BackgroundTransparency = 1
  glowPulse.ZIndex = 0

  local glowGradient = Instance.new("UIGradient")
  glowGradient.Color = uiGradient.Color
  glowGradient.Rotation = 90
  glowGradient.Parent = glowPulse

  -- Glow animation
  local glowTweenInfo = TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)
  local glowGoal = {Rotation = 180}
  local glowTween = game:GetService("TweenService"):Create(glowGradient, glowTweenInfo, glowGoal)
  glowTween:Play()

  return textLabel
    end

function _G.Frame:Toggle(conpig)
          conpig = conpig or {}
                        conpig.Text = conpig.Text
                        conpig.Callback = conpig.Callback or function(a) print(a) end

local ToggleButton = Instance.new("TextButton")
local ToggleKnob = Instance.new("Frame")
local UIGradient = Instance.new("UIGradient")
local UICorner = Instance.new("UICorner")
local Toggle = Instance.new("Frame")
local ToggleText = Instance.new("TextLabel")
local uiGradient = Instance.new("UIGradient")
local outline = Instance.new("Frame")
local shineFrame = Instance.new("Frame")
local shineGradient = Instance.new("UIGradient")
local glowPulse = Instance.new("Frame")


Toggle.Name = "Toggle"
Toggle.Parent = ScrollingFrame
Toggle.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Toggle.BackgroundTransparency = 0
Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
Toggle.BorderSizePixel = 0
Toggle.Size = UDim2.new(0, 430, 0, 35)

  -- Setting up the TextLabel
  ToggleText.Parent = Toggle
  ToggleText.Size = UDim2.new(1, 0, 0, 34) -- Adjust the size as needed
  ToggleText.Position = UDim2.new(0, 0, 0, 0) -- Adjust the position as needed
  ToggleText.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Dark background
  ToggleText.BorderSizePixel = 0
  ToggleText.Text = "   "..tostring(conpig.Text)
  ToggleText.Font = Enum.Font.GothamBlack
  ToggleText.TextSize = 20 -- Bigger text for a more striking look
  ToggleText.TextColor3 = Color3.fromRGB(255, 255, 255)
  ToggleText.TextXAlignment = Enum.TextXAlignment.Left -- Aligning text to the left
  ToggleText.ClipsDescendants = true -- Clips text that overflows
  ToggleText.ZIndex = 255
  ToggleText.BackgroundTransparency = 1

  -- Adding a UIGradient for the text with white, cyan, blue, purple, and pink
  uiGradient.Color = ColorSequence.new{
      ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)),
      ColorSequenceKeypoint.new(0.20, Color3.fromRGB(0, 255, 255)),
      ColorSequenceKeypoint.new(0.40, Color3.fromRGB(0, 102, 255)),
      ColorSequenceKeypoint.new(0.60, Color3.fromRGB(153, 51, 255)),
      ColorSequenceKeypoint.new(0.80, Color3.fromRGB(255, 102, 178)),
      ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))
  }
  uiGradient.Rotation = 90 -- Vertical gradient
  uiGradient.Parent = ToggleText

  -- Gradient rotation animation

  -- Gradient rotation animation
  local rotationTweenInfo = TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1, true)
  local rotationGoal = {Rotation = 360}
  local rotationTween = game:GetService("TweenService"):Create(uiGradient, rotationTweenInfo, rotationGoal)
  rotationTween:Play()

  -- Adding a glowing outline with the same color palette
  outline.Parent = Parent
  outline.Size = ToggleText.Size + UDim2.new(0, 20, 0, 20)
  outline.Position = ToggleText.Position - UDim2.new(0, 10, 0, 10)
  outline.BackgroundTransparency = 1
  outline.ZIndex = 1

  local outlineGradient = Instance.new("UIGradient")
  outlineGradient.Color = uiGradient.Color
  outlineGradient.Rotation = 45
  outlineGradient.Parent = outline

  -- Outline rotation animation
  local outlineTweenInfo = TweenInfo.new(6, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1, true)
  local outlineGoal = {Rotation = 360}
  local outlineTween = game:GetService("TweenService"):Create(outlineGradient, outlineTweenInfo, outlineGoal)
  outlineTween:Play()

  -- Adding a shine effect
  shineFrame.Parent = ToggleText
  shineFrame.Size = UDim2.new(2, 0, 1, 0) -- Bigger than the label for smooth sliding
  shineFrame.BackgroundTransparency = 1
  shineFrame.ZIndex = 3

  shineGradient.Color = ColorSequence.new{
      ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)),
      ColorSequenceKeypoint.new(0.50, Color3.fromRGB(255, 255, 255)),
      ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))
  }
  shineGradient.Transparency = NumberSequence.new{
      NumberSequenceKeypoint.new(0.00, 1),
      NumberSequenceKeypoint.new(0.25, 0.7),
      NumberSequenceKeypoint.new(0.50, 0),
      NumberSequenceKeypoint.new(0.75, 0.7),
      NumberSequenceKeypoint.new(1.00, 1)
  }
  shineGradient.Rotation = 45
  shineGradient.Parent = shineFrame

  -- Shine animation
  local shineTweenInfo = TweenInfo.new(2.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)
  local shineGoal = {Position = UDim2.new(-1, 0, 0, 0)}
  local shineTween = game:GetService("TweenService"):Create(shineFrame, shineTweenInfo, shineGoal)
  shineTween:Play()

  -- Adding a glow pulse effect around the text
  glowPulse.Parent = Parent
  glowPulse.Size = ToggleText.Size + UDim2.new(0, 30, 0, 30)
  glowPulse.Position = ToggleText.Position - UDim2.new(0, 15, 0, 15)
  glowPulse.BackgroundTransparency = 1
  glowPulse.ZIndex = 0

  local glowGradient = Instance.new("UIGradient")
  glowGradient.Color = uiGradient.Color
  glowGradient.Rotation = 90
  glowGradient.Parent = glowPulse

  -- Glow animation
  local glowTweenInfo = TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)
  local glowGoal = {Rotation = 180}
  local glowTween = game:GetService("TweenService"):Create(glowGradient, glowTweenInfo, glowGoal)
  glowTween:Play()

-- Toggle Button
ToggleButton.Parent = ToggleText
ToggleButton.Size = UDim2.new(0, 75, 0, 38)  -- Adjusted size
ToggleButton.Position = UDim2.new(0, 345, 0, 0)
ToggleButton.BackgroundColor3 = Color3.new(0, 0, 0)
ToggleButton.BorderSizePixel = 0
ToggleButton.Text = ""

-- Knob
ToggleKnob.Parent = ToggleButton
ToggleKnob.Size = UDim2.new(0, 36, 1, -4)  -- Adjusted size
ToggleKnob.Position = UDim2.new(0, 2, 0, 2)
ToggleKnob.BackgroundColor3 = Color3.new(1, 1, 1)
ToggleKnob.BorderSizePixel = 0

-- Gradient Background for the Button
UIGradient.Parent = ToggleButton
UIGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 50)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(50, 0, 100)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 0, 150))
}

-- Corner Rounding
UICorner.CornerRadius = UDim.new(0, 20)
UICorner.Parent = ToggleButton

-- Corner Rounding for the Knob
local KnobCorner = UICorner:Clone()
KnobCorner.Parent = ToggleKnob

-- Animation Function
local function toggleAnimation(isEnabled)
    if isEnabled then
        ToggleKnob:TweenPosition(
            UDim2.new(1, -38, 0, 2),  -- Adjusted knob position
            "Out", "Quad", 0.3, true
        )
        UIGradient.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 50, 0)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 100, 50)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 150, 100))
        }
        ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0)  -- Green color for enabled
    else
        ToggleKnob:TweenPosition(
            UDim2.new(0, 2, 0, 2),  -- Adjusted knob position
            "Out", "Quad", 0.3, true
        )
        UIGradient.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(50, 0, 0)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(100, 50, 0)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(150, 100, 0))
        }
        ToggleButton.BackgroundColor3 = Color3.new(0, 0, 0)  -- Black color for disabled
    end
end

-- Initial toggle state
local toggled = false

ToggleButton.MouseButton1Click:Connect(function()
if toggled == false then
   toggled = true
    conpig.Callback(true)
    toggleAnimation(toggled)
          else
    toggled = false
    conpig.Callback(false)
    toggleAnimation(toggled)
end
end)
    end
    return _G.Frame
  end

    return _G.Frame
end

--usage example 

local Main = _G.Main:New("Main")
local Tab1 = Main:Tab("Tab1")

local Button1 = Tab1:Button("Button1", function()
    print("Button1 clicked!")
end)

local Toggle1 = Tab1:Toggle({
  Text = "Toggle1",
  Callback = function(a)
    print(a)
  end
  })

local toggle2 = Tab1:Toggle({
    Text = "Toggle2 abcd efg g se nikle",
    Callback = function()
      print("hi")
    end
  })


return _G.Main
