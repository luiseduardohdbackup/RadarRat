-- Setup default states for the device
display.setStatusBar( display.HiddenStatusBar )
display.setDefault( "magTextureFilter", "nearest" )
display.setDefault( "minTextureFilter", "nearest" )
system.activate("multitouch")

-- required includes go here --
local mte = require("mte").createMTE()
local composer = require("composer")
local analytics = require("analytics")

-- forward declarations go here --

-- local variables go here --
local movement = nil

-- Attach this instance of mte to the composer
composer.mte = mte
composer.gotoScene("MainMenu")
