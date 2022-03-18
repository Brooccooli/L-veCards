function DrawCards()
    for i = slots, 1, -1 do
        local offset = (MAX_SIZE / 2) - (cardSlots[i][WIDTH] / 2) * CARD_PIXEL_X + 20

        -- Bigger if hovered
        if cardSlots[i][HOVER] then
            love.graphics.draw(cardSlots[i][PNG], cardSlots[i][X] + offset - 6, cardSlots[i][Y] - 6, 0, cardSlots[i][WIDTH] + 0.02, cardSlots[i][HEIGHT] + 0.02)
            love.graphics.setColor(0,0,0, 255)

            -- Print description if hovered and not face down
            if cardSlots[i][PNG] ~= cardBack then
                if cardSlots[i][TYPE] == DIMENSION  then
                    floatyLetters(cardSlots[i][DESC], cardSlots[i][X] + offset, cardSlots[i][Y] - cardSlots[i][HEIGHT] - 30)
                elseif cardSlots[i][TYPE] == MUTANT  then
                    changingColor(cardSlots[i][DESC], cardSlots[i][X] + offset, cardSlots[i][Y] - cardSlots[i][HEIGHT] - 30)
                elseif cardSlots[i][TYPE] == MONKE  then
                    shadow(cardSlots[i][DESC], cardSlots[i][X] + offset, cardSlots[i][Y] - cardSlots[i][HEIGHT] - 30)
                elseif cardSlots[i][TYPE] == GOD  then
                    missingLetters(cardSlots[i][DESC], cardSlots[i][X] + offset, cardSlots[i][Y] - cardSlots[i][HEIGHT] - 30)
                end
            end
            love.graphics.setColor(1,1,1)

        else
            -- Draw card normal size
            love.graphics.draw(cardSlots[i][PNG], cardSlots[i][X] + offset, cardSlots[i][Y], 0, cardSlots[i][WIDTH], cardSlots[i][HEIGHT])
        end
    end
end