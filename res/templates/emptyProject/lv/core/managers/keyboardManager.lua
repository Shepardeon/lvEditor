--[[
    Manager module that allows to keep the state of the keyboard
    at a given frame of the game.

    Each key registered in the keyState table can only have 3 states :
        - true: the key has been pressed THIS frame of the game
        - false: the key has been released THIS frame of the game
        - nil: the key hasn't changed state
]]
local KeyboardManager = Class:derive("KeyboardManager")

-- Function solely used to hook the manager to the relevant love events
local function HookLoveEvents(self) 
    -- Note that we don't use the scanCode or the isRepeat but keep them for reference
    function love.keypressed(p_key, p_scanCode, p_isRepeat) 
        self.keyState[p_key] = true
    end

    -- Same as before, we're not using the scanCode but keep it for reference
    function love.keyreleased(p_key, p_scanCode)
        self.keyState[p_key] = false
    end
end

-- Creates a keyboard manager and hook it up
function KeyboardManager:new()
    HookLoveEvents(self)
    self.keyState = {}
end

-- Allows to "reset" the last state
function KeyboardManager:update()
    for key, _ in pairs(self.keyState) do
        self.keyState[key] = nil
    end
end

-- Returns the dynamic state of a keyboard key
function KeyboardManager:key(p_key)
    return love.keyboard.isDown(p_key)
end

-- Returns if a key has been pressed this frame
function KeyboardManager:keyDown(p_key)
    return self.keyState[p_key]
end

-- Returns if a key has been released this frame
function KeyboardManager:keyUp(p_key)
    return self.keyState[p_key] == false
end

return KeyboardManager