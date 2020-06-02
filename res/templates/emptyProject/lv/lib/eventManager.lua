--[[
    Module used to fire events and trigger hooked function to
    different events
]]
local EventManager = Class:derive("EventManager")

function EventManager:new()
    self.events = {}
end

-- Allows to register a new event type
-- Each event type is expected to be unique
function EventManager:add(p_strName)
    assert(type(p_strName) == "string", "Name must be of type string, got "..type(p_strName).." instead!")
    assert(self.events[p_strName] == nil, "Event "..p_strName.." is already registred!")
    self.events[p_strName] = {}
end

-- Allows to unregister an event type
function EventManager:remove(p_strName)
    self.events[p_strName] = nil
end

-- Allows to add callbacks to events
function EventManager:hook(p_strName, p_funCallback, p_boolReplace)
    assert(type(p_strName) == "string", "Name must be of type string, got "..type(p_strName).." instead!")
    assert(type(p_funCallback) == "function", "Callback must be of type function, got "..type(p_strName).." instead!")
    assert(self.events[p_strName] ~= nil, "Event "..p_strName.." isn't a registered event!")
    assert(indexOf(self.events[p_strName], p_funCallback) == -1, "Tried to hook an already hooked callback!")

    p_boolReplace = p_boolReplace or false

    if p_boolReplace then
        self.events[p_strName] = p_funCallback
    else
        table.insert(self.events[p_strName], p_funCallback)
    end
end

-- Allows to unhook a callback from an event
function EventManager:unhook(p_strName, p_funCallback)
    assert(type(p_strName) == "string", "Name must be of type string, got "..type(p_strName).." instead!")
    assert(type(p_funCallback) == "function", "Callback must be of type function, got "..type(p_strName).." instead!")
    assert(self.events[p_strName] ~= nil, "Event "..p_strName.." isn't a registered event!")

    local i = indexOf(self.events[p_strName], p_funCallback)

    if i > -1 then
        table.remove(self.events[p_strName], p_funCallback)
    end
end

-- Allows to clear all the registered callbacks from an events
-- or from all events if no name is provided
function EventManager:clear(p_strName)
    if p_strName == nil then
        for evt, _ in pairs(self.events) do
            self.events[evt] = {}
        end
    elseif self.events[p_strName] ~= nil then
        self.events[p_strName] = {}
    end
end

-- Allows to fire an event and thus call every attached callbacks
-- passing them any arguments provided
-- This won't do anything if the event isn't registered
function EventManager:fire(p_strName, ...)
    local cbs = self.events[p_strName]
    if cbs == nil then return end

    for i = 1, #cbs do
        cbs[i](...)
    end
end

return EventManager