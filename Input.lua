DebugDistX = 0
DebugDistY = 0

function SetMouse()
    mouseX = love.mouse.getX()
    mouseY = love.mouse.getY()
end

function MInside(tempX, tempY)
    local tempSX = CARD_PIXEL_X / 2
    local tempSY = CARD_PIXEL_Y / 2

    local midX = tempX + (tempSX)
    local midY = tempY + (tempSY)

    local distX = ABS(midX - mouseX)
    local distY = ABS(midY - mouseY)

    -- Debug
    DebugDistX = distX
    DebugDistY = distY

    if distX < tempSX and distY < tempSY then
        return true
    end

    return false
end

function love.mousepressed(x, y, button, istouch, presses)
    if button == 1 then
        -- click effects
        pSystem:emit(32)

        for i = slots, 1, -1 do
            if not cardSlots[i][FACE_UP] then
                if MInside(cardSlots[i][X], cardSlots[i][Y]) then
                    cardSlots[i][ACTIVE] = true
                end
            end
        end
    end
    if MInside(deck[X], deck[Y]) then
        DeckPress()
    end
end