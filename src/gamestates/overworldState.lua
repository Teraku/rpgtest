overworldState = {}

function overworldState:init()
    self.player = Player:new(0, 0)
end

function overworldState:update(dt)
    
    self.player:update(dt)
    
end

function overworldState:draw()
    push:apply("start")
    
    self.player:draw()
    
    push:apply("end")
end