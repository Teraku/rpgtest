function class(superClass)
    
    local function deepcopy(orig)
        local orig_type = type(orig)
        local copy
        if orig_type == 'table' then
            copy = {}
            for orig_key, orig_value in next, orig, nil do
                copy[deepcopy(orig_key)] = deepcopy(orig_value)
            end
            setmetatable(copy, deepcopy(getmetatable(orig)))
        else -- number, string, boolean, etc
            copy = orig
        end
        return copy
    end
    
    local classTable
    
    if superClass then
        classTable = deepcopy(superClass)
        classTable.super = superClass
    else
        classTable = {
            --Copy current class and then call the constructor.
            new = function(self, ...)
                local object = deepcopy(self)
                object:init(...)
                return object
            end,
            
            --Constructor
            init = function(self, ...) end
        }
    end
    
    return classTable    
end