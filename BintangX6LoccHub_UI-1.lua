-- Services.
local playersService = game:GetService("Players")
local userInputService = game:GetService("UserInputService")
local tweenService = game:GetService("TweenService")
local lightingService = game:GetService("Lighting")

-- Config. Change these three lines.
local HUB_NAME = "BintangX6LoccHub"
local OWNER_NAME = "BintangHub"
local DISCORD_LINK = "https://discord.gg/GANTI_LINK"

local TOGGLE_KEY = Enum.KeyCode.RightShift
local LOGO_FILE = "BintangX6LoccHub_logo.jpg"
local LOGO_BASE64 = "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"

-- Re-execution guard.
if shared.BintangX6LoccHub then
	pcall(shared.BintangX6LoccHub.destroy)
end

-- State.
local localPlayer = playersService.LocalPlayer
local parentGui = (gethui and gethui()) or game:GetService("CoreGui")
local flags, callbacks, elements = {}, {}, {}
local connections = {}
local pages, registries, tabButtons = {}, {}, {}
local activeRegistry = {}
local currentTab = "Info"
local activeSlider = nil
local autoY = Enum.AutomaticSize.Y
local layoutOrder = Enum.SortOrder.LayoutOrder

local Hub = { flags = flags }

-- Theme (crimson).
local colors = {
	window = Color3.fromRGB(13, 9, 9),
	row = Color3.fromRGB(26, 17, 17),
	line = Color3.fromRGB(46, 30, 30),
	border = Color3.fromRGB(90, 35, 38),
	off = Color3.fromRGB(47, 34, 34),
	accent = Color3.fromRGB(193, 39, 45),
	text = Color3.fromRGB(238, 238, 238),
	bright = Color3.fromRGB(241, 222, 222),
	muted = Color3.fromRGB(167, 154, 154),
	dim = Color3.fromRGB(127, 112, 112),
}

local palette = {
	Color3.fromRGB(255, 59, 59), Color3.fromRGB(255, 154, 0), Color3.fromRGB(255, 230, 0),
	Color3.fromRGB(18, 184, 74), Color3.fromRGB(0, 200, 200), Color3.fromRGB(59, 156, 255),
	Color3.fromRGB(139, 92, 246), Color3.fromRGB(255, 120, 220), Color3.fromRGB(255, 255, 255),
	Color3.fromRGB(150, 150, 150),
}

-- Decode base64 without relying on executor functions.
local function decodeBase64(data)
	local alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
	local lookup = {}
	for index = 1, #alphabet do
		lookup[alphabet:byte(index)] = index - 1
	end

	local output, buffer, bits = {}, 0, 0
	for index = 1, #data do
		local value = lookup[data:byte(index)]
		if value then
			buffer = buffer * 64 + value
			bits += 6
			if bits >= 8 then
				bits -= 8
				table.insert(output, string.char(math.floor(buffer / 2 ^ bits)))
				buffer = buffer % 2 ^ bits
			end
		end
	end

	return table.concat(output)
end

-- Write the logo to disk and get an asset id. Falls back to a letter.
local function loadLogo()
	if not (writefile and getcustomasset) then
		return nil
	end

	local ok, asset = pcall(function()
		writefile(LOGO_FILE, decodeBase64(LOGO_BASE64))
		return getcustomasset(LOGO_FILE)
	end)

	return ok and asset or nil
end

local logoAsset = loadLogo()

-- Create an instance with properties in one call.
local function create(className, properties, parent)
	local instance = Instance.new(className)
	for key, value in pairs(properties) do
		instance[key] = value
	end
	instance.Parent = parent
	return instance
end

local function round(instance, radius)
	create("UICorner", { CornerRadius = UDim.new(0, radius) }, instance)
end

local function stroke(instance, color, thickness)
	create("UIStroke", { Color = color, Thickness = thickness or 1 }, instance)
end

-- Fire a flag change and its callback.
local function fire(key, value)
	flags[key] = value
	local callback = callbacks[key]
	if callback then
		task.spawn(callback, value)
	end
end

-- Logo image, or a letter if images are unsupported.
local function createLogo(parent, size, radius)
	local logo
	if logoAsset then
		logo = create("ImageLabel", {
			Size = UDim2.fromOffset(size, size),
			BackgroundTransparency = 1,
			Image = logoAsset,
			ScaleType = Enum.ScaleType.Crop,
		}, parent)
	else
		logo = create("TextLabel", {
			Size = UDim2.fromOffset(size, size),
			BackgroundColor3 = colors.accent,
			Font = Enum.Font.GothamBold,
			TextSize = math.floor(size * 0.55),
			TextColor3 = Color3.new(1, 1, 1),
			Text = HUB_NAME:sub(1, 1),
		}, parent)
	end
	round(logo, radius)
	return logo
end

-- Window.
local gui = create("ScreenGui", { Name = HUB_NAME, ResetOnSpawn = false, DisplayOrder = 100 }, parentGui)

local viewport = workspace.CurrentCamera.ViewportSize
local windowWidth = math.clamp(viewport.X - 60, 380, 580)
local windowHeight = math.clamp(viewport.Y - 40, 250, 350)

local window = create("Frame", {
	Size = UDim2.fromOffset(windowWidth, windowHeight),
	Position = UDim2.new(0.5, -windowWidth / 2, 0.5, -windowHeight / 2),
	BackgroundColor3 = colors.window,
	BorderSizePixel = 0,
	ClipsDescendants = true,
}, gui)
round(window, 12)
stroke(window, colors.border, 1.5)

-- Sidebar.
local sidebar = create("Frame", { Size = UDim2.new(0, 150, 1, 0), BackgroundTransparency = 1 }, window)
create("Frame", { Size = UDim2.new(0, 1, 1, 0), Position = UDim2.new(1, -1, 0, 0), BackgroundColor3 = colors.line, BorderSizePixel = 0 }, sidebar)

local brandLogo = createLogo(sidebar, 22, 6)
brandLogo.Position = UDim2.fromOffset(8, 8)

create("TextLabel", {
	Size = UDim2.new(1, -44, 0, 22),
	Position = UDim2.fromOffset(36, 8),
	BackgroundTransparency = 1,
	Font = Enum.Font.GothamBold,
	TextSize = 11,
	TextColor3 = colors.text,
	TextXAlignment = Enum.TextXAlignment.Left,
	TextTruncate = Enum.TextTruncate.AtEnd,
	Text = HUB_NAME,
}, sidebar)

local searchBox = create("TextBox", {
	Size = UDim2.new(1, -16, 0, 26),
	Position = UDim2.fromOffset(8, 38),
	BackgroundColor3 = colors.window,
	Font = Enum.Font.Gotham,
	TextSize = 12,
	TextColor3 = colors.text,
	PlaceholderText = "Search",
	PlaceholderColor3 = colors.dim,
	Text = "",
	ClearTextOnFocus = false,
	TextXAlignment = Enum.TextXAlignment.Left,
}, sidebar)
round(searchBox, 6)
stroke(searchBox, colors.line)
create("UIPadding", { PaddingLeft = UDim.new(0, 8) }, searchBox)

create("Frame", { Size = UDim2.new(1, -16, 0, 1), Position = UDim2.fromOffset(8, 70), BackgroundColor3 = colors.line, BorderSizePixel = 0 }, sidebar)

local nav = create("ScrollingFrame", {
	Size = UDim2.new(1, -12, 1, -132),
	Position = UDim2.fromOffset(6, 76),
	BackgroundTransparency = 1,
	BorderSizePixel = 0,
	ScrollBarThickness = 0,
	CanvasSize = UDim2.new(),
	AutomaticCanvasSize = autoY,
}, sidebar)
create("UIListLayout", { Padding = UDim.new(0, 2), SortOrder = layoutOrder }, nav)

-- Footer with avatar and name.
local footer = create("Frame", { Size = UDim2.new(1, 0, 0, 48), Position = UDim2.new(0, 0, 1, -48), BackgroundTransparency = 1 }, sidebar)
create("Frame", { Size = UDim2.new(1, -16, 0, 1), Position = UDim2.fromOffset(8, 0), BackgroundColor3 = colors.line, BorderSizePixel = 0 }, footer)

local avatar = create("ImageLabel", {
	Size = UDim2.fromOffset(28, 28),
	Position = UDim2.fromOffset(8, 11),
	BackgroundColor3 = colors.row,
	BorderSizePixel = 0,
}, footer)
round(avatar, 6)

task.spawn(function()
	local ok, content = pcall(playersService.GetUserThumbnailAsync, playersService, localPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48)
	if ok then
		avatar.Image = content
	end
end)

create("TextLabel", {
	Size = UDim2.new(1, -46, 0, 16),
	Position = UDim2.fromOffset(42, 10),
	BackgroundTransparency = 1,
	Font = Enum.Font.GothamBold,
	TextSize = 11,
	TextColor3 = colors.text,
	TextXAlignment = Enum.TextXAlignment.Left,
	TextTruncate = Enum.TextTruncate.AtEnd,
	Text = localPlayer.DisplayName,
}, footer)

create("TextLabel", {
	Size = UDim2.new(1, -46, 0, 14),
	Position = UDim2.fromOffset(42, 25),
	BackgroundTransparency = 1,
	Font = Enum.Font.Gotham,
	TextSize = 10,
	TextColor3 = colors.dim,
	TextXAlignment = Enum.TextXAlignment.Left,
	Text = "Violence District",
}, footer)

-- Header with title, minimize and close.
local header = create("Frame", { Size = UDim2.new(1, -150, 0, 36), Position = UDim2.fromOffset(150, 0), BackgroundTransparency = 1 }, window)
create("Frame", { Size = UDim2.new(1, 0, 0, 1), Position = UDim2.new(0, 0, 1, -1), BackgroundColor3 = colors.line, BorderSizePixel = 0 }, header)

local headerTitle = create("TextLabel", {
	Size = UDim2.new(1, -80, 1, 0),
	Position = UDim2.fromOffset(14, 0),
	BackgroundTransparency = 1,
	Font = Enum.Font.GothamBold,
	TextSize = 14,
	TextColor3 = colors.text,
	TextXAlignment = Enum.TextXAlignment.Left,
	Text = "Info",
}, header)

local function createHeaderButton(text, offsetX, callback)
	local button = create("TextButton", {
		Size = UDim2.fromOffset(24, 24),
		Position = UDim2.new(1, offsetX, 0, 6),
		BackgroundTransparency = 1,
		Font = Enum.Font.GothamBold,
		TextSize = 16,
		TextColor3 = colors.muted,
		Text = text,
	}, header)
	button.MouseButton1Click:Connect(callback)
end

createHeaderButton("-", -56, function()
	window.Visible = false
end)

createHeaderButton("x", -28, function()
	Hub.destroy()
end)

local pagesHolder = create("Frame", {
	Size = UDim2.new(1, -150, 1, -36),
	Position = UDim2.fromOffset(150, 36),
	BackgroundTransparency = 1,
	ClipsDescendants = true,
}, window)

-- Floating button to show or hide the window.
local floatButton = create("ImageButton", {
	Size = UDim2.fromOffset(38, 38),
	Position = UDim2.fromOffset(12, 56),
	BackgroundColor3 = colors.window,
	BorderSizePixel = 0,
	Image = logoAsset or "",
}, gui)
round(floatButton, 10)
stroke(floatButton, colors.border, 1.5)
floatButton.MouseButton1Click:Connect(function()
	window.Visible = not window.Visible
end)

-- Window dragging and slider dragging share one input listener.
local dragging, dragStart, startPosition = false, nil, nil

local function isPointerInput(input)
	return input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch
end

local function setScrollLocked(locked)
	for _, page in pairs(pages) do
		if page:IsA("ScrollingFrame") then
			page.ScrollingEnabled = not locked
		end
	end
end

header.InputBegan:Connect(function(input)
	if isPointerInput(input) then
		dragging, dragStart, startPosition = true, input.Position, window.Position
	end
end)

table.insert(connections, userInputService.InputChanged:Connect(function(input)
	if input.UserInputType ~= Enum.UserInputType.MouseMovement and input.UserInputType ~= Enum.UserInputType.Touch then
		return
	end

	if activeSlider then
		activeSlider(input)
	end

	if dragging then
		local delta = input.Position - dragStart
		window.Position = UDim2.new(
			startPosition.X.Scale, startPosition.X.Offset + delta.X,
			startPosition.Y.Scale, startPosition.Y.Offset + delta.Y
		)
	end
end))

table.insert(connections, userInputService.InputEnded:Connect(function(input)
	if isPointerInput(input) then
		dragging = false
		activeSlider = nil
		setScrollLocked(false)
	end
end))

table.insert(connections, userInputService.InputBegan:Connect(function(input, processed)
	if not processed and input.KeyCode == TOGGLE_KEY then
		window.Visible = not window.Visible
	end
end))

-- Row builders. Each one registers a flag under its key.
local builders = {}

local function registerRow(frame, text)
	table.insert(activeRegistry, { frame = frame, text = text:lower() })
end

local function createLabel(parent, text, size, color)
	return create("TextLabel", {
		Size = size,
		BackgroundTransparency = 1,
		Font = Enum.Font.GothamMedium,
		TextSize = 12,
		TextColor3 = color or colors.text,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextTruncate = Enum.TextTruncate.AtEnd,
		Text = text,
	}, parent)
end

builders.toggle = function(body, row, key)
	local frame = create("Frame", { Size = UDim2.new(1, 0, 0, 28), BackgroundTransparency = 1 }, body)
	registerRow(frame, row.text)
	createLabel(frame, row.text, UDim2.new(1, -44, 1, 0))

	local track = create("Frame", {
		Size = UDim2.fromOffset(34, 18),
		Position = UDim2.new(1, -34, 0.5, -9),
		BackgroundColor3 = colors.off,
		BorderSizePixel = 0,
	}, frame)
	round(track, 9)

	local knob = create("Frame", {
		Size = UDim2.fromOffset(12, 12),
		Position = UDim2.fromOffset(3, 3),
		BackgroundColor3 = colors.muted,
		BorderSizePixel = 0,
	}, track)
	round(knob, 6)

	local value = row.default

	local function render(animate)
		local trackColor = value and colors.accent or colors.off
		local knobColor = value and Color3.new(1, 1, 1) or colors.muted
		local knobPosition = UDim2.fromOffset(value and 19 or 3, 3)

		if animate then
			local info = TweenInfo.new(0.12)
			tweenService:Create(track, info, { BackgroundColor3 = trackColor }):Play()
			tweenService:Create(knob, info, { BackgroundColor3 = knobColor, Position = knobPosition }):Play()
		else
			track.BackgroundColor3, knob.BackgroundColor3, knob.Position = trackColor, knobColor, knobPosition
		end
	end

	local function set(newValue, silent)
		value = newValue and true or false
		render(true)
		if silent then
			flags[key] = value
		else
			fire(key, value)
		end
	end

	local click = create("TextButton", { Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Text = "" }, frame)
	click.MouseButton1Click:Connect(function()
		set(not value)
	end)

	flags[key] = value
	render(false)
	elements[key] = { set = set }
end

builders.slider = function(body, row, key)
	local frame = create("Frame", { Size = UDim2.new(1, 0, 0, 40), BackgroundTransparency = 1 }, body)
	registerRow(frame, row.text)
	createLabel(frame, row.text, UDim2.new(1, -50, 0, 20))

	local valueLabel = create("TextLabel", {
		Size = UDim2.fromOffset(46, 20),
		Position = UDim2.new(1, -46, 0, 0),
		BackgroundTransparency = 1,
		Font = Enum.Font.Gotham,
		TextSize = 12,
		TextColor3 = colors.muted,
		TextXAlignment = Enum.TextXAlignment.Right,
	}, frame)

	local track = create("Frame", {
		Size = UDim2.new(1, 0, 0, 6),
		Position = UDim2.fromOffset(0, 26),
		BackgroundColor3 = colors.off,
		BorderSizePixel = 0,
	}, frame)
	round(track, 3)

	local fill = create("Frame", { Size = UDim2.fromScale(0, 1), BackgroundColor3 = colors.accent, BorderSizePixel = 0 }, track)
	round(fill, 3)

	local knob = create("Frame", {
		Size = UDim2.fromOffset(12, 12),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0, 0.5),
		BackgroundColor3 = Color3.new(1, 1, 1),
		BorderSizePixel = 0,
	}, track)
	round(knob, 6)

	local value = row.default
	local range = row.max - row.min

	local function render()
		local alpha = (value - row.min) / range
		fill.Size = UDim2.fromScale(alpha, 1)
		knob.Position = UDim2.fromScale(alpha, 0.5)
		valueLabel.Text = row.step < 1 and string.format("%.2f", value) or tostring(value)
	end

	local function set(newValue, silent)
		value = math.clamp(math.floor(newValue / row.step + 0.5) * row.step, row.min, row.max)
		render()
		if silent then
			flags[key] = value
		else
			fire(key, value)
		end
	end

	local function update(input)
		local alpha = math.clamp((input.Position.X - track.AbsolutePosition.X) / track.AbsoluteSize.X, 0, 1)
		set(row.min + alpha * range)
	end

	frame.InputBegan:Connect(function(input)
		if isPointerInput(input) then
			activeSlider = update
			setScrollLocked(true)
			update(input)
		end
	end)

	flags[key] = value
	render()
	elements[key] = { set = set }
end

builders.dropdown = function(body, row, key)
	local frame = create("Frame", { Size = UDim2.new(1, 0, 0, 0), AutomaticSize = autoY, BackgroundTransparency = 1 }, body)
	create("UIListLayout", { Padding = UDim.new(0, 3), SortOrder = layoutOrder }, frame)
	registerRow(frame, row.text)

	local label = createLabel(frame, row.text, UDim2.new(1, 0, 0, 16), colors.muted)
	label.LayoutOrder = 1

	local box = create("TextButton", {
		Size = UDim2.new(1, 0, 0, 26),
		LayoutOrder = 2,
		BackgroundColor3 = colors.row,
		AutoButtonColor = false,
		Font = Enum.Font.Gotham,
		TextSize = 12,
		TextColor3 = colors.text,
		TextXAlignment = Enum.TextXAlignment.Left,
	}, frame)
	round(box, 6)
	stroke(box, colors.line)
	create("UIPadding", { PaddingLeft = UDim.new(0, 8) }, box)

	local optionsFrame = create("Frame", {
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = autoY,
		LayoutOrder = 3,
		BackgroundTransparency = 1,
		Visible = false,
	}, frame)
	create("UIListLayout", { Padding = UDim.new(0, 2) }, optionsFrame)

	local value = row.default

	local function set(newValue, silent)
		value = newValue
		box.Text = tostring(value) .. "  v"
		if silent then
			flags[key] = value
		else
			fire(key, value)
		end
	end

	-- Replace the list of choices (for example a player list).
	local function setOptions(list)
		for _, child in ipairs(optionsFrame:GetChildren()) do
			if child:IsA("TextButton") then
				child:Destroy()
			end
		end

		for _, option in ipairs(list) do
			local optionButton = create("TextButton", {
				Size = UDim2.new(1, 0, 0, 24),
				BackgroundColor3 = colors.window,
				AutoButtonColor = false,
				Font = Enum.Font.Gotham,
				TextSize = 12,
				TextColor3 = colors.muted,
				Text = tostring(option),
			}, optionsFrame)
			round(optionButton, 5)

			optionButton.MouseButton1Click:Connect(function()
				set(option)
				optionsFrame.Visible = false
			end)
		end
	end

	box.MouseButton1Click:Connect(function()
		optionsFrame.Visible = not optionsFrame.Visible
	end)

	setOptions(row.options)
	flags[key] = value
	set(value, true)
	elements[key] = { set = set, setOptions = setOptions }
end

builders.colorPick = function(body, row, key)
	local frame = create("Frame", { Size = UDim2.new(1, 0, 0, 0), AutomaticSize = autoY, BackgroundTransparency = 1 }, body)
	create("UIListLayout", { Padding = UDim.new(0, 4), SortOrder = layoutOrder }, frame)
	registerRow(frame, row.text)

	local top = create("Frame", { Size = UDim2.new(1, 0, 0, 26), LayoutOrder = 1, BackgroundTransparency = 1 }, frame)
	createLabel(top, row.text, UDim2.new(1, -44, 1, 0), colors.muted)

	local swatch = create("TextButton", {
		Size = UDim2.fromOffset(34, 16),
		Position = UDim2.new(1, -34, 0.5, -8),
		BackgroundColor3 = row.default,
		AutoButtonColor = false,
		Text = "",
	}, top)
	round(swatch, 4)
	stroke(swatch, colors.border)

	local palettePanel = create("Frame", {
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = autoY,
		LayoutOrder = 2,
		BackgroundTransparency = 1,
		Visible = false,
	}, frame)
	create("UIGridLayout", { CellSize = UDim2.fromOffset(22, 22), CellPadding = UDim2.fromOffset(4, 4) }, palettePanel)

	local value = row.default

	local function set(newValue, silent)
		value = newValue
		swatch.BackgroundColor3 = value
		if silent then
			flags[key] = value
		else
			fire(key, value)
		end
	end

	for _, presetColor in ipairs(palette) do
		local presetButton = create("TextButton", { BackgroundColor3 = presetColor, AutoButtonColor = false, Text = "" }, palettePanel)
		round(presetButton, 4)
		presetButton.MouseButton1Click:Connect(function()
			set(presetColor)
			palettePanel.Visible = false
		end)
	end

	swatch.MouseButton1Click:Connect(function()
		palettePanel.Visible = not palettePanel.Visible
	end)

	flags[key] = value
	elements[key] = { set = set }
end

builders.button = function(body, row, key)
	local button = create("TextButton", {
		Size = UDim2.new(1, 0, 0, 30),
		BackgroundColor3 = colors.row,
		BorderSizePixel = 0,
		AutoButtonColor = false,
		Font = Enum.Font.GothamBold,
		TextSize = 12,
		TextColor3 = colors.bright,
		Text = row.text:upper(),
	}, body)
	round(button, 6)
	stroke(button, colors.line)
	registerRow(button, row.text)

	button.MouseButton1Click:Connect(function()
		button.BackgroundColor3 = colors.accent
		tweenService:Create(button, TweenInfo.new(0.25), { BackgroundColor3 = colors.row }):Play()
		local callback = callbacks[key]
		if callback then
			task.spawn(callback)
		end
	end)

	elements[key] = {}
end

builders.textBox = function(body, row, key)
	local frame = create("Frame", { Size = UDim2.new(1, 0, 0, 48), BackgroundTransparency = 1 }, body)
	registerRow(frame, row.text)
	createLabel(frame, row.text, UDim2.new(1, 0, 0, 16), colors.muted)

	local box = create("TextBox", {
		Size = UDim2.new(1, 0, 0, 26),
		Position = UDim2.fromOffset(0, 20),
		BackgroundColor3 = colors.row,
		Font = Enum.Font.Gotham,
		TextSize = 12,
		TextColor3 = colors.text,
		PlaceholderText = row.placeholder or "",
		PlaceholderColor3 = colors.dim,
		Text = "",
		ClearTextOnFocus = false,
		TextXAlignment = Enum.TextXAlignment.Left,
	}, frame)
	round(box, 6)
	stroke(box, colors.line)
	create("UIPadding", { PaddingLeft = UDim.new(0, 8) }, box)

	box.FocusLost:Connect(function()
		fire(key, box.Text)
	end)

	flags[key] = ""
	elements[key] = {
		set = function(newValue, silent)
			box.Text = newValue
			if silent then
				flags[key] = newValue
			else
				fire(key, newValue)
			end
		end,
	}
end

builders.note = function(body, row)
	local label = createLabel(body, row.text, UDim2.new(1, 0, 0, 18), colors.dim)
	label.TextSize = 11
end

-- Row and card constructors for the tab data below.
local function toggle(text, default) return { kind = "toggle", text = text, default = default or false } end
local function slider(text, min, max, default, step) return { kind = "slider", text = text, min = min, max = max, default = default, step = step or 1 } end
local function dropdown(text, options, default) return { kind = "dropdown", text = text, options = options, default = default or options[1] } end
local function colorPick(text, value) return { kind = "colorPick", text = text, default = value } end
local function button(text) return { kind = "button", text = text } end
local function textBox(text, placeholder) return { kind = "textBox", text = text, placeholder = placeholder } end
local function note(text) return { kind = "note", text = text } end
local function card(title, rows) return { title = title, rows = rows } end

-- Tabs. Add or remove rows here. Key = "TabName.Row text".
local tabs = {
	{ name = "Info", info = true },
	{
		name = "Exclusive",
		left = {
			card("Utility", { toggle("Self Unhook GUI"), toggle("Fast Bandage GUI") }),
			card("Crosshair", {
				toggle("Enable Crosshair"),
				colorPick("Crosshair Color", Color3.fromRGB(255, 230, 0)),
				dropdown("Style", { "Dot", "Cross", "Circle" }),
				slider("Size", 1, 20, 8),
			}),
			card("Movement", { toggle("Auto Vault") }),
		},
		right = {
			card("Camera", {
				toggle("Max Zoom"), toggle("Killer Radar"), toggle("Camera FOV"),
				slider("FOV Value", 40, 120, 90),
				toggle("Third Person (Killer)"), toggle("DBD Camera"),
				slider("DBD Camera Distance", 1, 10, 3),
				slider("Custom Scale", 1, 5, 1),
			}),
			card("Fake Perks", {
				toggle("Fake Quick Recovery"), toggle("Fake Perfect Landing"),
				toggle("Fake Flowstate"), toggle("Fake Adrenaline Rush"),
				slider("Perks Cooldown (sec)", 1, 60, 10),
			}),
		},
	},
	{
		name = "Survivor",
		left = {
			card("Skill Check Instant", {
				toggle("Auto Skill Check"),
				dropdown("Skill Check Mode", { "Legit", "Instant" }),
				dropdown("Bypass Gen Mode", { "Manual Repair", "Auto Repair" }),
				toggle("Gene Boost"), toggle("Auto Skill Check Trap"),
			}),
			card("Survivor Ability", {
				toggle("God Mode (Anti Knock)"), toggle("Dodge Slash Abyss"), toggle("Unlimited Vault"),
				toggle("Fast Vault (Anti Slow)"), toggle("No CD Flowstate"), toggle("No Fall Damage"),
				toggle("Exit Gate Ghost"), toggle("Self Heal"), toggle("Instant Escape"),
			}),
		},
		right = {
			card("Silent Aim (Pistol)", {
				toggle("Silent Aim TOF"), toggle("Predict Aim TOF"), toggle("Block Aim Knocked"),
				toggle("Wallcheck"), toggle("Enable Laser Effect", true),
			}),
			card("Flash Aim", { toggle("Silent Aim (Flash)"), slider("Flash Head Offset (Y)", 0, 20, 8) }),
		},
	},
	{
		name = "Killer",
		left = {
			card("Killer Ability", {
				toggle("Enable Aimbot"),
				slider("Melee Lock Distance", 1, 30, 12),
				slider("Aimbot Smoothness", 1, 20, 5),
				toggle("Anti Blind (Flash)"), toggle("No Slowdown"), toggle("Infinity Lunge"), toggle("Aim Lock Hidden"),
			}),
		},
		right = {
			card("Veil Spear Silent Aim", {
				toggle("Silent Veil OP"), toggle("Tracer", true), toggle("Show FOV", true),
				slider("FOV Radius", 50, 800, 400),
			}),
			card("Silent Aim Flask (Cure)", { toggle("Silent Aim Flask (Cure)"), toggle("Enable Laser") }),
		},
	},
	{
		name = "ESP",
		left = {
			card("ESP Players", {
				toggle("Enable ESP"), toggle("ESP Survivor"),
				colorPick("Player Color", Color3.fromRGB(59, 156, 255)),
				toggle("ESP Killer"),
				colorPick("Killer Color", Color3.fromRGB(255, 59, 59)),
				toggle("Mode Outline"), toggle("ESP Hook Count"), toggle("ESP Name"), toggle("ESP Distance"),
				toggle("ESP Health State"), toggle("ESP Zombie"),
				colorPick("SCP Color", Color3.fromRGB(255, 230, 0)),
				toggle("ESP Item Icon"), toggle("Killer Warn"),
			}),
			card("ESP Maps", {
				toggle("Generator"), colorPick("Generator Color", Color3.fromRGB(255, 200, 60)),
				toggle("Gen Name and Progress", true),
				toggle("Pallet"), colorPick("Pallet Color", Color3.fromRGB(18, 184, 74)),
				toggle("Window / Vault"), colorPick("Window Color", Color3.fromRGB(255, 255, 255)),
				toggle("Hook"), colorPick("Hook Color", Color3.fromRGB(18, 184, 74)),
				toggle("Exit Gate"), colorPick("Gate Color", Color3.fromRGB(255, 255, 255)),
				toggle("ESP Trap"), colorPick("Bear Trap Color", Color3.fromRGB(190, 100, 255)),
				toggle("ESP Pumpkin"), colorPick("Pumpkin Color", Color3.fromRGB(255, 154, 0)),
			}),
		},
		right = {
			card("Info Player", {
				toggle("FPS + Ping"), toggle("Next Killer"), toggle("Next Map"),
				toggle("Stun Indicator"), toggle("Show Killer Perks"),
			}),
			card("World Effects", {
				toggle("Full Bright"), toggle("No Fog"), toggle("No Shadow"),
				toggle("Low Graphics"), toggle("Clean Sky"), slider("Time Of Day", 0, 24, 14),
			}),
		},
	},
	{
		name = "Teleport",
		left = {
			card("Teleport Players", {
				dropdown("Pilih Player", { "None" }),
				button("Refresh player"), button("Teleport ke player dipilih"),
			}),
		},
		right = {
			card("Teleport Maps", {
				button("TP generator"), button("TP hook (loop)"), button("TP gate (loop)"),
				button("TP pallet (loop)"), button("TP window (loop)"), button("Refresh map"),
			}),
		},
	},
	{
		name = "Config",
		left = {
			card("Config Manager", {
				textBox("Config Name", "my config"),
				dropdown("Configs", { "none" }),
				note("autoload: none"),
				button("Save config"), button("Load config"), button("Delete config"),
			}),
		},
		right = {
			card("Misc Player", {
				toggle("Copy Avatar GUI"), toggle("Fly GUI"), toggle("Noclip"),
				toggle("Enable Speed Boost"), slider("Speed Boost Value", 1, 10, 2),
			}),
		},
	},
}

-- Page builders.
local function createScrollPage()
	local page = create("ScrollingFrame", {
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ScrollBarThickness = 2,
		ScrollBarImageColor3 = colors.accent,
		CanvasSize = UDim2.new(),
		AutomaticCanvasSize = autoY,
		Visible = false,
	}, pagesHolder)
	create("UIPadding", {
		PaddingTop = UDim.new(0, 8), PaddingBottom = UDim.new(0, 8),
		PaddingLeft = UDim.new(0, 8), PaddingRight = UDim.new(0, 10),
	}, page)
	return page
end

local function createColumns(page)
	local holder = create("Frame", { Size = UDim2.new(1, 0, 0, 0), AutomaticSize = autoY, BackgroundTransparency = 1 }, page)
	create("UIListLayout", {
		FillDirection = Enum.FillDirection.Horizontal,
		VerticalAlignment = Enum.VerticalAlignment.Top,
		Padding = UDim.new(0, 8),
		SortOrder = layoutOrder,
	}, holder)

	local columns = {}
	for index = 1, 2 do
		local column = create("Frame", {
			Size = UDim2.new(0.5, -4, 0, 0),
			AutomaticSize = autoY,
			BackgroundTransparency = 1,
			LayoutOrder = index,
		}, holder)
		create("UIListLayout", { Padding = UDim.new(0, 8), SortOrder = layoutOrder }, column)
		columns[index] = column
	end

	return columns[1], columns[2]
end

-- A collapsible card holding rows.
local function buildCard(column, tabName, cardData)
	local cardFrame = create("Frame", {
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = autoY,
		BackgroundColor3 = colors.window,
		BorderSizePixel = 0,
	}, column)
	round(cardFrame, 8)
	stroke(cardFrame, colors.line)
	create("UIListLayout", { SortOrder = layoutOrder }, cardFrame)

	local headerButton = create("TextButton", {
		Size = UDim2.new(1, 0, 0, 30),
		LayoutOrder = 1,
		BackgroundTransparency = 1,
		Text = "",
		AutoButtonColor = false,
	}, cardFrame)

	local titleLabel = createLabel(headerButton, cardData.title, UDim2.new(1, -30, 1, 0))
	titleLabel.Position = UDim2.fromOffset(10, 0)
	titleLabel.Font = Enum.Font.GothamBold

	local arrow = create("TextLabel", {
		Size = UDim2.fromOffset(20, 30),
		Position = UDim2.new(1, -24, 0, 0),
		BackgroundTransparency = 1,
		Font = Enum.Font.GothamBold,
		TextSize = 12,
		TextColor3 = colors.muted,
		Text = "v",
	}, headerButton)

	create("Frame", { Size = UDim2.new(1, 0, 0, 1), LayoutOrder = 2, BackgroundColor3 = colors.line, BorderSizePixel = 0 }, cardFrame)

	local body = create("Frame", { Size = UDim2.new(1, 0, 0, 0), AutomaticSize = autoY, LayoutOrder = 3, BackgroundTransparency = 1 }, cardFrame)
	create("UIPadding", {
		PaddingTop = UDim.new(0, 4), PaddingBottom = UDim.new(0, 8),
		PaddingLeft = UDim.new(0, 10), PaddingRight = UDim.new(0, 10),
	}, body)
	create("UIListLayout", { Padding = UDim.new(0, 4), SortOrder = layoutOrder }, body)

	headerButton.MouseButton1Click:Connect(function()
		body.Visible = not body.Visible
		arrow.Text = body.Visible and "v" or ">"
	end)

	for _, row in ipairs(cardData.rows) do
		builders[row.kind](body, row, row.key or (tabName .. "." .. row.text))
	end
end

-- Info tab: welcome text, Discord button and owner.
local function buildInfoPage(page)
	local infoCard = create("Frame", {
		Size = UDim2.new(1, -16, 1, -16),
		Position = UDim2.fromOffset(8, 8),
		BackgroundTransparency = 1,
	}, page)
	round(infoCard, 8)
	stroke(infoCard, colors.line)
	create("UIListLayout", {
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		VerticalAlignment = Enum.VerticalAlignment.Center,
		Padding = UDim.new(0, 8),
		SortOrder = layoutOrder,
	}, infoCard)

	local infoLogo = createLogo(infoCard, 56, 14)
	infoLogo.LayoutOrder = 1

	create("TextLabel", {
		LayoutOrder = 2,
		Size = UDim2.fromOffset(280, 26),
		BackgroundTransparency = 1,
		Font = Enum.Font.GothamBold,
		TextSize = 20,
		TextColor3 = colors.text,
		Text = "SELAMAT BERMAIN",
	}, infoCard)

	local copyButton = create("TextButton", {
		LayoutOrder = 3,
		Size = UDim2.fromOffset(210, 32),
		BackgroundColor3 = colors.row,
		AutoButtonColor = false,
		Font = Enum.Font.GothamBold,
		TextSize = 12,
		TextColor3 = colors.bright,
		Text = "COPY LINK DC",
	}, infoCard)
	round(copyButton, 6)
	stroke(copyButton, colors.line)

	local feedback = create("TextLabel", {
		LayoutOrder = 4,
		Size = UDim2.fromOffset(210, 14),
		BackgroundTransparency = 1,
		Font = Enum.Font.Gotham,
		TextSize = 11,
		TextColor3 = colors.dim,
		Text = "",
	}, infoCard)

	create("TextLabel", {
		LayoutOrder = 5,
		Size = UDim2.fromOffset(210, 18),
		BackgroundTransparency = 1,
		Font = Enum.Font.Gotham,
		TextSize = 12,
		TextColor3 = colors.muted,
		RichText = true,
		Text = 'Owner  <font color="rgb(241,222,222)"><b>' .. OWNER_NAME .. "</b></font>",
	}, infoCard)

	copyButton.MouseButton1Click:Connect(function()
		local clip = setclipboard or toclipboard
		if clip then
			pcall(clip, DISCORD_LINK)
			feedback.Text = "Link DC tersalin"
		else
			warn(DISCORD_LINK)
			feedback.Text = "Executor tidak support clipboard"
		end

		task.delay(1.6, function()
			feedback.Text = ""
		end)
	end)
end

-- Search only filters the tab that is open.
local function applySearch()
	local query = searchBox.Text:lower()
	for _, entry in ipairs(registries[currentTab] or {}) do
		entry.frame.Visible = query == "" or entry.text:find(query, 1, true) ~= nil
	end
end

local function selectTab(name)
	currentTab = name
	headerTitle.Text = name

	for pageName, page in pairs(pages) do
		page.Visible = pageName == name
	end

	for tabName, entry in pairs(tabButtons) do
		local active = tabName == name
		entry.button.BackgroundTransparency = active and 0 or 1
		entry.button.TextColor3 = active and colors.text or colors.muted
		entry.bar.Visible = active
	end

	applySearch()
end

searchBox:GetPropertyChangedSignal("Text"):Connect(applySearch)

-- Build every tab, its page and its sidebar button.
for index, tab in ipairs(tabs) do
	activeRegistry = {}
	registries[tab.name] = activeRegistry

	local page
	if tab.info then
		page = create("Frame", { Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Visible = false }, pagesHolder)
		buildInfoPage(page)
	else
		page = createScrollPage()
		local left, right = createColumns(page)
		for _, cardData in ipairs(tab.left or {}) do
			buildCard(left, tab.name, cardData)
		end
		for _, cardData in ipairs(tab.right or {}) do
			buildCard(right, tab.name, cardData)
		end
	end
	pages[tab.name] = page

	local navButton = create("TextButton", {
		Size = UDim2.new(1, 0, 0, 28),
		LayoutOrder = index,
		BackgroundColor3 = colors.row,
		BackgroundTransparency = 1,
		AutoButtonColor = false,
		Font = Enum.Font.GothamMedium,
		TextSize = 12,
		TextColor3 = colors.muted,
		TextXAlignment = Enum.TextXAlignment.Left,
		Text = tab.name,
	}, nav)
	round(navButton, 6)
	create("UIPadding", { PaddingLeft = UDim.new(0, 12) }, navButton)

	local bar = create("Frame", {
		Size = UDim2.new(0, 2, 1, -12),
		Position = UDim2.fromOffset(-10, 6),
		BackgroundColor3 = colors.accent,
		BorderSizePixel = 0,
		Visible = false,
	}, navButton)

	tabButtons[tab.name] = { button = navButton, bar = bar }
	navButton.MouseButton1Click:Connect(function()
		selectTab(tab.name)
	end)
end

selectTab("Info")

-- Public API for your own feature code.

---Run a function whenever a row changes. Buttons call it with no value.
---@param key string
---@param callback function
---@param runNow boolean
function Hub.on(key, callback, runNow)
	if not elements[key] then
		return warn("Unknown key: " .. key)
	end

	callbacks[key] = callback
	if runNow and flags[key] ~= nil then
		task.spawn(callback, flags[key])
	end
end

---Change a row from code. Pass silent = true to skip its callback.
function Hub.set(key, value, silent)
	local element = elements[key]
	if element and element.set then
		element.set(value, silent)
	end
end

---Replace the choices of a dropdown, for example a player list.
function Hub.setOptions(key, list)
	local element = elements[key]
	if element and element.setOptions then
		element.setOptions(list)
	end
end

---List every key you can hook.
function Hub.listKeys()
	local keys = {}
	for key in pairs(elements) do
		table.insert(keys, key)
	end
	table.sort(keys)
	return keys
end

function Hub.destroy()
	for _, connection in ipairs(connections) do
		connection:Disconnect()
	end

	gui:Destroy()
	shared.BintangX6LoccHub = nil
end

shared.BintangX6LoccHub = Hub

-- FEATURE HOOKS. Put your own logic below. This one is only an example.
local savedBrightness = lightingService.Brightness

Hub.on("ESP.Full Bright", function(enabled)
	lightingService.Brightness = enabled and 2 or savedBrightness
end)
