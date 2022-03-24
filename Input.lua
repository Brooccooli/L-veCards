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

-- Event activates on mouseclick
function love.mousepressed(x, y, button, istouch, presses)
    -- Left button
    if button == 1 then
        -- click effects
        ClickPSystem:emit(32)

        -- Start
        if scene == scenes.Start then
            if MInside(StartCard.X, StartCard.Y) then
                scene = scenes.Player1
            end
        end

        -- Card pick
        if scene == scenes.Player1 or scene == scenes.Player2 then
            -- Checks all card slots
            for i = slots, 1, -1 do
                -- If card is facing down flip up
                if MInside(cardSlots[i][X], cardSlots[i][Y]) then
                    if not cardSlots[i][FACE_UP] then
                        cardSlots[i][ACTIVE] = true
                    else
                        setCard(cardSlots[i][INDEX])
                    end
                end
            end
        end
    end
    if MInside(deck[X], deck[Y]) and rerolls > 0 then
        rerolls = rerolls - 1
        DeckPress()
    end
end