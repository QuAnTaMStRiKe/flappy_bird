Pipe = Class{}

local Pipe_Image = love.graphics.newImage('pipe.png')

function Pipe:init(orientation, y)
    self.x = VIRTUAL_WIDTH
    self.y = y
    self.width = Pipe_Image:getWidth()
    self.height = PIPE_HEIGHT

    self.orientation = orientation

end

function Pipe:update(dt)
    
end

function Pipe:render()
    love.graphics.draw(Pipe_Image, self.x, (self.orientation == 'top' and self.y + PIPE_HEIGHT or self.y), 0, 1, self.orientation == 'top' and -1 or 1)

    --tweaks krke dekhne
end