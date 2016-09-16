Entity = class()

function Entity:init(x, y, width, height)
    self.health = 10
    self.speed = 200
    
    if x and y then
        self.x = x
        self.y = y
    end
    
    if width and height then
        self.width = width
        self.height = height
    end
    
    self.velocity = {x = 0, y = 0}
end

function Entity:update(dt)
    return self.velocity
end