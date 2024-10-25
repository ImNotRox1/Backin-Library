# Backin Library
This documentation is for the release of Backin Library.

## Booting the Library
```lua
local BackinLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/ImNotRox1/Backin-Library/refs/heads/main/source.lua')))()
```



## Creating a Window
```lua
local Window = BackinLib:New({
	Title = "UI Library"
})
```



## Creating a Tab
```lua
local Tab = Window:MakeTab({
	Title = "Tab 1",
	Icon = "rbxassetid://4483345998",
})
```

## Creating a Button
```lua
Tab:AddButton({
	Title = "Button",
	Callback = function()
      	print("button pressed")
  	end    
})
```

### Changing the text of an existing Button
```lua
BUTTONYEY:SetText("BUTTON YAY!")
```
### Changing the function of an existing Button
```lua
BUTTONYEY:SetCallback(function() 
	print("hello")
end)
```


## Creating a Toggle
```lua
Tab:AddToggle({
	Name = "This is a toggle!",
	Callback = function(Value)
		print(Value)
	end    
})
```

### Changing the value of an existing Toggle
```lua
ImAToggle:Toggle(false)
```

## Creating a Slider
```lua
Tab:AddSlider({
	Title = "Slider",
	Min = 0,
	Max = 20,
	Default = 5,
	Callback = function(Value)
		print(Value)
	end    
})
```

### Change Slider Value
```lua
Slider:SetValue(0)
```
Make sure you make your slider a variable (local CoolSlider = Tab:AddSlider...) for this to work.


## Creating a Label
```lua
Tab:AddLabel({
	Text = "WOW! im a label!"
})
```

### Changing the value of an existing label
```lua
CoolLabel:SetText("I changed my text yay!")
```

## Destroying the Interface
```lua
BackinLib:Destroy()
```
