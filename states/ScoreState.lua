ScoreState = Class{__includes = BaseState}

--[[
    When we enter the score state, we expect to receive the score
    from the play state so we know what to render to the State.
]]
BRONZE_MEDAL = love.graphics.newImage('bronze.png')
BRONZE_MEDAL_WIDTH = BRONZE_MEDAL:getWidth()
SILVER_MEDAL = love.graphics.newImage('silver.png')
SILVER_MEDAL_WIDTH = SILVER_MEDAL:getWidth()
GOLD_MEDAL = love.graphics.newImage('gold.png')
GOLD_MEDAL_WIDTH = GOLD_MEDAL:getWidth()
function ScoreState:enter(params)
    self.score = params.score
end

function ScoreState:update(dt)
    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function ScoreState:render()
    -- simply render the score to the middle of the screen
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Oof! You lost!', 0, 100, VIRTUAL_WIDTH, 'center')
    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 130, VIRTUAL_WIDTH, 'center')
    if self.score >= 1 and self.score < 10 then
        love.graphics.draw(BRONZE_MEDAL, VIRTUAL_WIDTH/2 - BRONZE_MEDAL_WIDTH/2, 0)
    elseif self.score >= 10 and self.score < 15 then
        love.graphics.draw(SILVER_MEDAL, VIRTUAL_WIDTH/2 - SILVER_MEDAL_WIDTH/2, 0)
    elseif self.score >= 15 then
        love.graphics.draw(GOLD_MEDAL, VIRTUAL_WIDTH/2 - GOLD_MEDAL_WIDTH/2, 0)
    else
        love.graphics.printf('Loser 😛', 0, 60, VIRTUAL_WIDTH, 'center')
    end
    love.graphics.printf('Press Enter to Play Again!', 0, 160, VIRTUAL_WIDTH, 'center')
end