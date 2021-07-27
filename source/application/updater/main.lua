-- Copyright 2021 - Deviap (deviap.com)
local breakpointer = require("devgit:source/libraries/UI-breakpointer/main.lua")
local colourMap = require("devgit:source/application/utilities/colourScheme.lua")

local container = core.construct("guiFrame", {
	parent = core.interface,
	size = guiCoord(1, 0, 1, 100),
	position = guiCoord(0, 0, 0, -50),
	backgroundColour = colourMap.orange
})

local pattern = core.construct("guiImage", {
	parent = container,
	size = guiCoord(0, 3000, 0, 3000),
	backgroundAlpha = 0,
	image = "devgit:assets/images/tile.png",
	patternScaleValues = false,
	imageTopLeft = vector2(0, 0),
	imageBottomRight = vector2(25, 25),
	imageColour = colour.black()
})

local tween;
tween = core.tween:begin(pattern, 10, {
	imageTopLeft = vector2(-1, 1),
	imageBottomRight = vector2(24, 26)
}, "linear", function()
	tween:reset()
	tween:resume()
end)

local sideContainer = core.construct("guiFrame", {
	parent = core.interface,
	backgroundAlpha = 0
})

breakpointer:bind(sideContainer, "xs", {
	size = guiCoord(1, -50, 1, -50),
	position = guiCoord(0, 25, 0, 25)
})

breakpointer:bind(sideContainer, "md", {
	size = guiCoord(0.5, 0, 1, -200),
	position = guiCoord(0.5, 0, 0, 100)
})

require("devgit:source/application/utilities/logo.lua")({
	parent = sideContainer,
	size = guiCoord(0, 50, 0, 50),
	position = guiCoord(0.5, -25, 0.5, -80)
})

local mainText = core.construct("guiTextBox", {
	parent = sideContainer,
	size = guiCoord(0, 130, 0, 30),
	position = guiCoord(0.5, -65, 0.5, -15),
	text = "Update in progress",
	textAlign = "middle",
	textFont = "deviap:fonts/openSansBold.ttf",
	textSize = 20,
    textColour = colour(1, 1, 1),
	backgroundAlpha = 0
})
local subText = core.construct("guiTextBox", {
	parent = sideContainer,
	size = guiCoord(0, 130, 0, 30),
	position = guiCoord(0.5, -65, 0.5, 20),
	text = "test",
	textAlign = "middle",
	textSize = 16,
    textColour = colour(1, 1, 1),
	backgroundAlpha = 0
})

core.engine:on("updateMessage", function(message)
    mainText.text = message
end)

core.engine:on("updateProgress", function(str)
    print("updateProgress", str)
    subText.text = tostring(str)
end)