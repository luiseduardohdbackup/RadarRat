-- required includes should go here --
local composer = require("composer")

-- local vars should go here --
local scene = composer.newScene()
local joystickEnsbled = false

-- input controller commands and listeners
local inputDevices = system.getInputDevices()
local controllers = {}

-- forward references should go here --


---------------------------------------------------------------------------------
-- BEGINNING OF IMPLEMENTATION
---------------------------------------------------------------------------------

---------------------------------------------------------------------------
-- onKeyEvent
-- 
-- Called BEFORE scene has moved onscreen:
-- 
-- @param event
-- @return
---------------------------------------------------------------------------
function onKeyEvent( event )
    
end

---------------------------------------------------------------------------
-- onInputdeviceStatusChanged
-- 
-- Called BEFORE scene has moved onscreen:
-- 
-- @param event
-- @return
---------------------------------------------------------------------------
function onInputdeviceStatusChanged( event )
    
end

---------------------------------------------------------------------------
-- create
-- 
-- Called if scene has been not yet been created:
-- 
-- @param event
-- @return
---------------------------------------------------------------------------
function scene:create( event )
    local group = self.view
end

---------------------------------------------------------------------------
-- Show
-- 
-- Called BEFORE scene has moved onscreen: event.phase == "will"
-- Called after scene has moved on screem: event.phase == "did"
-- 
-- @param event
-- @return
---------------------------------------------------------------------------
function scene:show( event )
    local group = self.view
    
    -- We only want to execute the controller check once.
    if event.phase == "will" then
        -- check which devices we have (if any)
        for deviceIndex = 1, #inputDevices do
            print( deviceIndex, "canVibrate", inputDevices[deviceIndex].canVibrate )
            print( deviceIndex, "connectionState", inputDevices[deviceIndex].connectionState )
            print( deviceIndex, "descriptor", inputDevices[deviceIndex].descriptor )
            print( deviceIndex, "displayName", inputDevices[deviceIndex].displayName )
            print( deviceIndex, "isConnected", inputDevices[deviceIndex].isConnected )
            print( deviceIndex, "type", inputDevices[deviceIndex].type )
            print( deviceIndex, "permenantid", tostring(inputDevices[deviceIndex].permanentId) )
            print( deviceIndex, "andoridDeviceid", inputDevices[deviceIndex].androidDeviceId ) 

            if inputDevices[deviceIndex].descriptor == "Joystick 1" then
                controllers[1] = inputDevices[deviceIndex]
            elseif inputDevices[deviceIndex].descriptor == "Joystick 2" then
                controllers[2] = inputDevices[deviceIndex]
            elseif inputDevices[deviceIndex].descriptor == "Joystick 3" then
                controllers[3] = inputDevices[deviceIndex]
            elseif inputDevices[deviceIndex].descriptor == "Joystick 4" then
                controllers[4] = inputDevices[deviceIndex]
            end    
        end
        
        -- If we detect a controller then enaberl controller options
        if controllers[1] ~= nil then
            joystickEnabled = true
        end
    end
end


---------------------------------------------------------------------------
-- hide
-- 
-- Called BEFORE scene has moved off screen:event.phase == "will"
-- Called when scene has moved off screen: event.phase == "did" 
--
-- @param event
-- @return
---------------------------------------------------------------------------
function scene:hide( event )
    local group = self.view
    
end

---------------------------------------------------------------------------
-- destroy
-- 
-- Called when scene is destroyed:
-- 
-- @param event
-- @return
---------------------------------------------------------------------------
function scene:destroy( event )
    local group = self.view
    
end

---------------------------------------------------------------------------------
-- END OF IMPLEMENTATION
---------------------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "create", scene )
-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "show", scene )
-- "exitScene" event is dispatched before next scene's transition begins
scene:addEventListener( "hide", scene )
-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroy", scene )

---------------------------------------------------------------------------------
Runtime:addEventListener( "key", onKeyEvent )
Runtime:addEventListener( "inputDevicestatus", onInputdeviceStatusChanged )

return scene


