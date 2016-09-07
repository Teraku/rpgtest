Entity = class()

function Entity:init(x, y)
    self.health = 10
    self.speed = 100
    
    if x and y then
        self.pos = {x, y}
    end
    
    self.velocity = {0, 0}
end