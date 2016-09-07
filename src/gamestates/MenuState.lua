menuState = {}

function menuState:init()
    
    self.text = "Select an option."
    
    self.buttons = {
        {
            text = "Start",
            selected = true,
            onPress = function()
                Gamestate.switch(overworldState)
            end
        },
        {
            text = "Options",
            selected = false,
            onPress = function()
                self.text = "Pressed options"
            end
        },
        {
            text = "Quit",
            selected = false,
            onPress = function()
                love.event.quit()
            end
        }
    }
end

function menuState:update(dt)
    
end

function menuState:draw()
    push:apply("start")
    
    --Set filter mode to produce more pixelated images instead of blurring.
    love.graphics.setDefaultFilter("nearest")
    
    --Draw background. setBackgroundColor does not work, because this will change the color of the black bars.
    love.graphics.setColor(255, 255, 255)
    love.graphics.rectangle("fill", 0, 0, push:getWidth(), push:getHeight())
    
    love.graphics.setColor(0, 0, 0)
    love.graphics.printf(self.text, 0, 10, push:getWidth(), "center")
    
    local buttonStartHeight = push:getHeight() / 2.2
    for name, button in pairs(self.buttons) do
        
        if button.selected then
            love.graphics.setColor(255, 0, 0)
        else
            love.graphics.setColor(0, 0, 0)
        end
        
        love.graphics.printf(button.text, 0, buttonStartHeight, push:getWidth(), "center")
        buttonStartHeight = buttonStartHeight + 50
    end
    
    push:apply("end")
end

function menuState:keypressed(key, scanCode, isRepeat)
        
    if key == "up" then        
        for i, button in pairs(self.buttons) do
            if button.selected and self.buttons[i-1] then
                self.buttons[i-1].selected = true
                button.selected = false
                break
            end
            
            previousButton = button
        end
    elseif key == "down" then
        for i, button in pairs(self.buttons) do
            if button.selected and self.buttons[i+1] then
                self.buttons[i+1].selected = true
                button.selected = false
                break
            end
        end
    elseif key == "enter" or key == "z" then
        for i, button in pairs(self.buttons) do
            if button.selected then
                button.onPress()
                break
            end
        end
    end
    
end