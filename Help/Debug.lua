

function Debug()
    local TEXTH = 20
    local TEXTW = 800

    love.graphics.setColor(1,0,0)

    offset = TEXTH
    love.graphics.print("--- DEBUG ---", TEXTW, offset)
    offset = offset + TEXTH
    love.graphics.print("mouse X:"..mouseX.." mouse Y:"..mouseY, TEXTW, offset)

    -- Distance
    local inside = ""
    if MInside(cardSlots[1][X], cardSlots[1][Y]) then
        inside = "true"
    else
        inside = "false"
    end
    offset = offset + TEXTH
    love.graphics.print("Mouse inside:"..inside, TEXTW, offset)
    offset = offset + TEXTH
    love.graphics.print("distance X:"..DebugDistX.." distnace Y:"..DebugDistY, TEXTW, offset)

    -- Current scene
    offset = offset + TEXTH
    love.graphics.print("Current Scene: "..scene, TEXTW, offset)
    offset = offset + TEXTH
    love.graphics.print("God mathces: "..matches, TEXTW, offset)

    love.graphics.setColor(1,1,1)
end