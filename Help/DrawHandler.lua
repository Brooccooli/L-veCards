function DrawStart()

end

function DrawPlayer1()
    DrawCards()

    -- Card Deck
    for i = 10, 1, -1 do
        if MInside(deck[X], deck[Y]) then
            love.graphics.draw(cardBack, deck[X] - i, deck[Y] - i, MAX_SIZE - 0.1, MAX_SIZE, MAX_SIZE)
        else
            love.graphics.draw(cardBack, deck[X] - i, deck[Y] - i, MAX_SIZE, MAX_SIZE, MAX_SIZE)
        end
    end
end

function DrawPlayer2()
    
end

function DrawArenaPick()
    
end

function DrawFight()
    
end