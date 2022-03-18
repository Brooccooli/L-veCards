function DrawCards()
    for i = slots, 1, -1 do
        local offset = (MAX_SIZE / 2) - (cardSlots[i][WIDTH] / 2) * CARD_PIXEL_X + 20

        if cardSlots[i][HOVER] then
            love.graphics.draw(cardSlots[i][PNG], cardSlots[i][X] + offset - 6, cardSlots[i][Y] - 6, 0, cardSlots[i][WIDTH] + 0.02, cardSlots[i][HEIGHT] + 0.02)
            love.graphics.setColor(0,0,0, 255)

            if cardSlots[i][PNG] ~= cardBack then
                if cardSlots[i][EVIL]  then
                    changingColor(cardSlots[i][DESC], cardSlots[i][X] + offset, cardSlots[i][Y] - cardSlots[i][HEIGHT] - 30)
                else
                    flotyLetters(cardSlots[i][DESC], cardSlots[i][X] + offset, cardSlots[i][Y] - cardSlots[i][HEIGHT] - 30)
                end
            end
            love.graphics.setColor(1,1,1)
        else
            love.graphics.draw(cardSlots[i][PNG], cardSlots[i][X] + offset, cardSlots[i][Y], 0, cardSlots[i][WIDTH], cardSlots[i][HEIGHT])
        end
    end
end