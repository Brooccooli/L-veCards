function UpdateStart(dt)

end

function UpdatePlayer1(dt)
    for i = slots, 1, -1 do
        cardSlots[i][WIDTH] = turnCard(cardSlots[i][WIDTH], i)

        -- if hovered
        cardSlots[i][HOVER] = MInside(cardSlots[i][X], cardSlots[i][Y])
    end
end

function UpdatePlayer2(dt)
    
end

function UpdateArenaPick(dt)
    
end

function UpdateFight(dt)
    
end