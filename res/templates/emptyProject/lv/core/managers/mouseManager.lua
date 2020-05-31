--[[
    Manager module that allows to keep the state of the mouse
    at a given frame of the game.

    Each button registered in the btnState table can only have 3 states :
        - true: the button has been pressed THIS frame of the game
        - false: the button has been released THIS frame of the game
        - nil: the button hasn't changed state
]]
local MouseManager = Class:derive("MouseManager")

-- Function solely used to hook the manager to the relevant love events
local function HookLoveEvents(self) 
    function love.mousepressed(p_x, p_y, p_button)
        self.btnState[tostring(p_button)] = true
    end

    function love.mousereleased(p_x, p_y, p_button)
        self.btnState[tostring(p_button)] = false
    end

    function love.wheelmoved(p_x, p_y)
        self.wheel = y
    end
end

-- Creates a mouse manager and hook it up
function MouseManager:new()
    HookLoveEvents(self)

    self.wheel = 0
    self.btnState = {}
end

-- Allows to "reset" the last state
function MouseManager:update()
    for btn, _ in pairs(self.btnState) do
        self.btnState[btn] = nil
    end

    self.wheel = 0
end

-- Returns a vectorized mouse pos
function MouseManager:getPos()
    return Vector(love.mouse.getPosition())
end

-- Returns the wheel value for this frame
function MouseManager:getWheel()
    return self.wheel
end

-- Returns the dynamic state of a mouse button
function MouseManager:button(p_button)
    return love.mouse.isDown(p_button)
end

-- Returns if a button has been pressed this frame
function MouseManager:buttonDown(p_button)
    return self.btnState[p_button]
end

-- Returns if a button has been released this frame
function MouseManager:buttonUp(p_button)
    return self.btnState[p_button] == false
end

return MouseManager