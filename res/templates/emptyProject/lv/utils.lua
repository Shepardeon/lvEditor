-- Allows to retrieve the index of an element within a table
function indexOf(pTable, pElem)
    if pTable == nil or pElem == nil then return -1 end

    for i = 1, #pTable do
        if pTable[i] == pElem then return i end
    end

    return -1
end

-- Make it so using #true returns 1 and #false returns 0
debug.setmetatable(true, {__len = function(v) return v and 1 or 0 end})