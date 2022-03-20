

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
    offset = offset + TEXTH
    love.graphics.print("P1 Card Index: "..p1Card, TEXTW, offset)
    offset = offset + TEXTH
    if HaveFought then
        love.graphics.print("Have fought: true", TEXTW, offset)
    else
        love.graphics.print("Have fought: false", TEXTW, offset)
    end

    -- Controlled areas
    offset = offset + TEXTH
    love.graphics.print("P1 mutant:"..p1Areas[MUTANT].." P1 dimension:"..p1Areas[DIMENSION].." P1 Monke:"..p1Areas[MONKE], TEXTW, offset)
    offset = offset + TEXTH
    love.graphics.print("P2 mutant:"..p2Areas[MUTANT].." P2 dimension:"..p2Areas[DIMENSION].." P2 Monke:"..p2Areas[MONKE], TEXTW, offset)

    love.graphics.setColor(1,1,1)
end