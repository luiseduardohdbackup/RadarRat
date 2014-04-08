-- Setup default states for the device
display.setStatusBar( display.HiddenStatusBar )
display.setDefault( "magTextureFilter", "nearest" )
display.setDefault( "minTextureFilter", "nearest" )
system.activate("multitouch")

local mte = require("mte").createMTE()
local composer = require("composer")

-- forward declarations

-- local variables
local movement = nil

-- Attach this instance of mte to the composer
composer.mte = mte

-- Movement functions 
local move = function( event )
	if event.phase == "began" then
		display.getCurrentStage():setFocus(event.target, event.id)
		event.target.isFocus = true
	end
    
	if event.phase == "began" or event.phase == "moved" then
		local dirX = event.x - event.target.x
		local dirY = event.y - event.target.y	
		local angle = math.deg(math.atan(dirY/dirX))
		if dirX < 0 then
			angle = 90 + (90 - (angle * -1))
		end
		angle = angle + 90
		angle = math.round(angle / 90) * 90
		if angle == 360 then
			angle = 0
		end
		if angle % 90 ~= 0 then
			movement = nil
		else
			movement = tostring(angle)
		end
	elseif event.phase == "ended" or event.phase == "cancelled" then
		movement = nil
		display.getCurrentStage():setFocus( event.target, nil )
		event.target.isFocus = false
	end
	return true
end
