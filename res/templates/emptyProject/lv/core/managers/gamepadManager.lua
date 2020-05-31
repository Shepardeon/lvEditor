--[[
    Manager module that allows to keep the state of multiple gamepads
    at a given frame of the game.

    Each input registered in each gamepad input's table can only have 3 states :
        - true: input has been pressed THIS frame of the game
        - false: input has been released THIS frame of the game
        - nil: input hasn't changed state
]]
local GamepadManager = Class:derive("GamepadManager")
local abs = math.abs

-- Function solely used to hook the manager to the relevant love events
-- Note we could upgrade this by also taking into account the raw buttons (love.joystickpressed/released)
local function HookLoveEvents(self) 
    function love.joystickadded(p_joystick)
        local id = p_joystick:getID()
        assert(self.connectedSticks[id] == nil, "Joystick with ID "..id.." is already connected! This should never happen!")

        self.connectedSticks[id] = p_joystick
        self.stickButtons[id] = {}
    end

    function love.joystickremoved(p_joystick)
        local id = p_joystick:getID()
        self.connectedSticks[id] = nil
        self.stickButtons[id] = nil
    end

    function love.gamepadpressed(p_joystick, p_button)
        local id = p_joystick:getID()
        self.stickButtons[id][p_button] = true
    end

    function love.gamepadreleased(p_joystick, p_button)
        local id = p_joystick:getID()
        self.stickButtons[id][p_button] = false
    end
end

function GamepadManager:new(p_fileMappings)
    HookLoveEvents(self)

    love.joystick.loadGamepadMappings(p_fileMappings)
    self.connectedSticks = {}
    self.stickButtons = {}
    self.deadZone = 0.1 -- This would be edited through options
end

function GamepadManager:update()
    -- O(n²) but it's ok since we shouldn't have that much joystick connected anyway
    for id = 1, #self.connectedSticks do
        for btn, _ in pairs(self.stickButtons[id]) do
            self.stickButtons[id][btn] = nil
        end
    end
end

function GamepadManager:button(p_button, p_joyID)
    p_joyID = p_joyID or 1
    local stick = self.connectedSticks[p_joyID]
    if stick == nil then return false end

    return stick:isGamepadDown(p_button)
end

function GamepadManager:buttonDown(p_button, p_joyID)
    p_joyID = p_joyID or 1
    local stick = self.stickButtons[p_joyID]
    if stick == nil then return false end

    return stick[p_button]
end

function GamepadManager:buttonUp(p_button, p_joyID)
    p_joyID = p_joyID or 1
    local stick = self.stickButtons[p_joyID]
    if stick == nil then return false end

    return stick[p_button] == false
end

function GamepadManager:axis(p_axis, p_joyID)
    p_joyID = p_joyID or 1
    local stick = self.connectedSticks[p_joyID]
    if stick == nil then return 0 end

    local axis = stick:getGamepadAxis(p_axis)
    if abs(axis) > self.deadZone then return axis end
    return 0
end

return GamepadManager