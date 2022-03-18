-- for i = 1, #str do
--    local c = str:sub(i,i)
    -- do something with c
-- end

letter = {}
letter.c = 'a'
letter.up = false
letter.Y = 0

Letters = {}
Letters[1] = table.deepcopy(letter)
function changingColor(str, textX, textY)

    local strLength = 0

    for i = 1, #str do
        strLength = strLength + 1
    end

    for i = 1, #str do
        local c = str:sub(i,i)
        love.graphics.setColor(love.math.random(0, 0.1),0,0);
        
        love.graphics.print(c, textX + (i * 9) - ((strLength / 4) * 9), textY)
        love.graphics.setColor(0,0,0)
    end
end

function flotyLetters(str, textX, textY)
    local strLength = 0

    for i = 1, #str do
        strLength = strLength + 1
    end

    for i = 1, #str do
        local c = str:sub(i,i)
        if letterPos(c) == -1 then
            local tabLength = table.length(Letters)
            Letters[tabLength + 1] = table.deepcopy(letter)
            Letters[tabLength + 1].c = c
        end
        
        if Letters[letterPos(c)].up then
            if Letters[letterPos(c)].Y > 2 then
                Letters[letterPos(c)].up = false
            end
            Letters[letterPos(c)].Y = Letters[letterPos(c)].Y + 0.01
        else
            if Letters[letterPos(c)].Y < -2 then
                Letters[letterPos(c)].up = true
            end
            Letters[letterPos(c)].Y = Letters[letterPos(c)].Y - 0.01
        end
        
        love.graphics.print(c, textX + (i * 9) - ((strLength / 4) * 9), textY + Letters[letterPos(c)].Y)
    end
end

function letterPos(c)
    local tabLength = table.length(Letters)

    for i = tabLength, 1, -1 do
        if Letters[i].c == c then
            return i
        end
    end

    return -1
end