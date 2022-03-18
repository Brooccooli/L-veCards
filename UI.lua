function DeckPress()
    for i = slots, 1, -1 do
        cardSlots[i][ACTIVE] = true
        cardSlots[i][FACE_UP] = true
    end
    flipCard()

    
    reRoll()
end