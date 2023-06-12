local ResetButton = {}
ResetButton.__index = ResetButton

function ResetButton.new(x, y, width, height)
    local button = setmetatable({}, ResetButton)
    button.x = x
    button.y = y
    button.width = width
    button.height = height
    return button
end

function ResetButton:draw()
    love.graphics.setColor(0, 0.6, 0.2)
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
    love.graphics.setColor(1, 1, 1)
    love.graphics.printf("Reset", self.x, self.y + 8, self.width, "center")
end

function ResetButton:isClicked(x, y)
    return x >= self.x and x <= self.x + self.width and y >= self.y and y <= self.y + self.height
end

function ResetButton:handleClick(x, y)
    if x >= self.x and x <= self.x + self.width and y >= self.y and y <= self.y + self.height then
        self.game:reset()
    end
end

return ResetButton