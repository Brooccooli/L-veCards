function turnCard(w, cardIndex)
    local width = w

    if not cardSlots[cardIndex][ACTIVE] then
        return MAX_SIZE
    end

    if cardSlots[cardIndex][ACTIVE] and cardSlots[cardIndex][HALFWAY] and width > MAX_SIZE then
        cardSlots[cardIndex][ACTIVE] = false
        cardSlots[cardIndex][HALFWAY] = false
        return MAX_SIZE
    end
    
    if not cardSlots[cardIndex][HALFWAY] then
        width = width - 0.025
    else
        width = width + 0.025
    end

    if width < 0.01 and width > -0.01 then
        cardSlots[cardIndex][HALFWAY] = true

        -- change sprite
        if cardSlots[cardIndex][PNG] == cardBack then
            cardSlots[cardIndex][PNG] = cardPNG[cardSlots[cardIndex][INDEX]]
            cardSlots[cardIndex][FACE_UP] = true
        else
            cardSlots[cardIndex][PNG] = cardBack
            cardSlots[cardIndex][FACE_UP] = false
        end
    end

    return width
end

function flipCard()
    for i = slots, 1, -1 do
        if cardSlots[i][FACE_UP] then
            cardSlots[i][PNG] = cardReroll
        else
            cardSlots[i][PNG] = cardBack
        end
    end
end