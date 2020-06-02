--[[
    Module used to "translate" all kinds of input from the player
    and redirect them to the corresponding manager.
    Allows to rebind every in-game action to any number of user inputs

    TODO: Rewrite the module and associated modules to avoid having lots
    of if/elseif/else statements
]]
local InputManager = Class:derive("InputManager")

-- Loading in all our managers
local KeyMgr    = require("lv.core.managers.keyboardManager")
local PadMgr    = require("lv.core.managers.gamepadManager")
local MouseMgr  = require("lv.core.managers.mouseManager")

local function getInput(p_strBind)
    local mgr   = p_strInput:sub(1, 1)
    local input = p_strInput:sub(3)

    return mgr, input
end

function InputManager:new(p_fileMappings)
    Key     = KeyMgr()
    Pad     = PadMgr(p_fileMappings)
    Mouse   = MouseMgr()

    self.actions = {}
end

function InputManager:update()
    Key:update()
    Pad:update()
    Mouse:update()
end

-- Registers a new action and bind it to its inputs
-- Inputs are string with the following format:
-- k_X => keyboard input
-- m_X => mouse input
-- g_X => gamepad input
-- a_X => gamepad axis input
function InputManager:bind(p_strAction, p_tblInputs)
    assert(type(p_strAction) == "string", "Action must be of type string, got "..type(p_strAction).." instead!")
    assert(self.actions[p_strAction] == nil, "Action "..p_strAction.." is already a registred action!")
    assert(type(p_tblInputs) == "table", "Inputs must be of type table, got "..type(p_tblInputs).." instead!")
    self.actions[p_strAction] = p_tblInputs
end

-- Allows to completely unbind an action
function InputManager:unbind(p_strAction)
    assert(type(p_strAction) == "string", "Action must be of type string, got "..type(p_strAction).." instead!")
    self.actions[p_strAction] = nil
end

-- Allows to bind a single new input to an action
function InputManager:bindAdd(p_strAction, p_strInput)
    assert(type(p_strAction) == "string", "Action must be of type string, got "..type(p_strAction).." instead!")
    assert(type(p_strInput) == "string", "Input must be of type table, got "..type(p_strInput).." instead!")
    assert(self.actions[p_strAction] ~= nil, "Action "..p_strAction.." isn't a registered action!")

    table.insert(self.actions[p_strAction], p_strInput)
end

-- Allows to unbind a single input from an action
function InputManager:bindRemove(p_strAction, p_strInput)
    assert(type(p_strAction) == "string", "Action must be of type string, got "..type(p_strAction).." instead!")
    assert(type(p_strInput) == "string", "Input must be of type table, got "..type(p_strInput).." instead!")
    assert(self.actions[p_strAction] ~= nil, "Action "..p_strAction.." isn't a registered action!")

    local i = indexOf(self.actions[p_strAction], p_strInput)
    if i > -1 then 
        table.remove(self.actions[p_strAction], p_strInput)
    end
end

-- Returns the dynamic state of an action
-- Will return true if at least one input bound to the action is true
function InputManager:get(p_strAction)
    assert(self.actions[p_strAction] ~= nil, "Action "..p_strAction.." isn't a registered action!")

    for i = 1, #self.actions[p_strAction] do
        local mgr, input = getInput(self.actions[p_strAction][i])

        if mgr == "k" then
            if Key:key(input) then return true end
        elseif mgr == "m" then
            if Mouse:button(input) then return true end
        elseif mgr == "g" then
            if Pad:button(input) then return true end
        elseif mgr == "a" then
            return Pad:axis(input)
        else
            -- TODO: log this.
        end
    end

    return false
end

function InputManager:getDown(p_strAction)
    assert(self.actions[p_strAction] ~= nil, "Action "..p_strAction.." isn't a registered action!")

    for i = 1, #self.actions[p_strAction] do
        local mgr, input = getInput(self.actions[p_strAction][i])

        if mgr == "k" then
            if Key:keyDown(input) then return true end
        elseif mgr == "m" then
            if Mouse:buttonDown(input) then return true end
        elseif mgr == "g" then
            if Pad:buttonDown(input) then return true end
        else
            -- TODO: log this.
        end
    end

    return false
end

function InputManager:getUp(p_strAction)
    assert(self.actions[p_strAction] ~= nil, "Action "..p_strAction.." isn't a registered action!")

    for i = 1, #self.actions[p_strAction] do
        local mgr, input = getInput(self.actions[p_strAction][i])

        if mgr == "k" then
            if Key:keyUp(input) then return true end
        elseif mgr == "m" then
            if Mouse:buttonUp(input) then return true end
        elseif mgr == "g" then
            if Pad:buttonUp(input) then return true end
        else
            -- TODO: log this.
        end
    end

    return false
end

function InputManager:getMousePos()
    return Mouse:getPos()
end

function InputManager:getMouseWheel()
    return Mouse:getWheel()
end

return InputManager