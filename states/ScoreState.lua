--[[
    ScoreState Class
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    A simple state used to display the player's score before they
    transition back into the play state. Transitioned to from the
    PlayState when they collide with a Pipe.
]]

ScoreState = Class{__includes = BaseState}

local medalGold = love.graphics.newImage('medalGold.png')
local medalSilver = love.graphics.newImage('medalSilver.png')
local medalBronze = love.graphics.newImage('medalBronze.png')

--[[
    When we enter the score state, we expect to receive the score
    from the play state so we know what to render to the State.
]]
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
    love.graphics.printf('Oof! You lost!', 0, 64, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 100, VIRTUAL_WIDTH, 'center')

    
    local scaleX = 32 / medalBronze:getWidth()
    local scaleY = 32 / medalBronze:getHeight()

    if self.score > 0 then
        love.graphics.printf('bronze' , 0, 110, VIRTUAL_WIDTH, 'center')
        love.graphics.draw(medalBronze,(VIRTUAL_WIDTH / 2) - 16,(VIRTUAL_HEIGHT / 2) - 16,0 ,scaleX,scaleY)
    elseif self.score > 20 then
        love.graphics.printf('silver ' , 0, 110, VIRTUAL_WIDTH, 'center')
        love.graphics.draw(medalSilver,(VIRTUAL_WIDTH / 2) - 16,(VIRTUAL_HEIGHT / 2) - 16,0 ,scaleX,scaleY)        
    elseif self.score > 30 then
        love.graphics.printf('gold' , 0, 110, VIRTUAL_WIDTH, 'center')
        love.graphics.draw(medalGold,(VIRTUAL_WIDTH / 2) - 16,(VIRTUAL_HEIGHT / 2) - 16,0 ,scaleX,scaleY)                
    end
    
    love.graphics.printf('Press Enter to Play Again!', 0, 160, VIRTUAL_WIDTH, 'center')
end