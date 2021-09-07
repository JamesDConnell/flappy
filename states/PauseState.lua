--[[
    PauseState Class
    Author: James Connell
    cogden@cs50.harvard.edu

    A simple state used to display the player's score before they
    transition back into the play state. Transitioned to from the
    PlayState when they collide with a Pipe.
]]

PauseState = Class{__includes = BaseState}
ReturnParams = {}
--[[
    When we enter the pause state, we expect to receive the score
    from the play state so we know what to render to the State.
]]
function PauseState:enter(params)   
    ReturnParams = params    
end

function PauseState:update(dt)
    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('play',ReturnParams)
    end
end

function PauseState:render()
    -- simply render the pause message to the middle of the screen
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Paused!', 0, 64, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Press Enter to continue!', 0, 160, VIRTUAL_WIDTH, 'center')
end