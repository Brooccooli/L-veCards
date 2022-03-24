function DrawStart()
    love.graphics.draw(StartScreen, 0, 0)

    -- Draw buttons
    love.graphics.draw(StartCard.PNG, StartCard.X + (CARD_PIXEL_X / 2), StartCard.Y + (CARD_PIXEL_Y / 2), StartCard.Rot, MAX_SIZE, MAX_SIZE, CARD_PIXEL_X * 2.5, CARD_PIXEL_Y * 2.5)

    -- Credits
    love.graphics.setColor(0,0,0)
    floatyLetters("Creator of Everything: Alvin Jangvik", SCREEN_WIDTH - 300, SCREEN_HEIGHT - 20)
    love.graphics.setColor(1,1,1)
end

--ProfilePic positions
local pic1 = {}; pic1.x = 12; pic1.y = 12
local pic2 = {}; pic2.x = SCREEN_WIDTH - PRO_PIC_WIDTH - 12; pic2.y = 12
function DrawCardPic()
    -- Fill screen
    love.graphics.setBackgroundColor(0.5, 0, 1)
    DrawCards()

    DrawProfilePics()
    DrawControlledArenas()

    -- Card Deck
    for i = 10, 1, -1 do
        if MInside(deck[X], deck[Y]) then
            love.graphics.draw(cardBack, deck[X] - i, deck[Y] - i, MAX_SIZE - (0.05 * i), MAX_SIZE, MAX_SIZE)
        else
            love.graphics.draw(cardBack, deck[X] - i, deck[Y] - i, MAX_SIZE, MAX_SIZE, MAX_SIZE)
        end
    end
end

function DrawArenaPick()
    -- Fill screen
    love.graphics.setBackgroundColor(0, 0, 0)
    local midScreenX = (SCREEN_WIDTH / 2) - (ARENA_PIXEL_WIDTH / 2)
    local midScreenY = (SCREEN_HEIGHT / 2) - (ARENA_PIXEL_HEIGHT / 2)
    love.graphics.draw(currentStage, midScreenX, midScreenY, 0, ARENA_SIZE_WIDTH, ARENA_SIZE_HEIGHT)
end

function DrawFight()
    local midScreenX = (SCREEN_WIDTH / 2) - (ARENA_PIXEL_WIDTH / 2)
    local midScreenY = (SCREEN_HEIGHT / 2) - (ARENA_PIXEL_HEIGHT / 2)
    love.graphics.draw(currentStage, midScreenX, midScreenY, 0, ARENA_SIZE_WIDTH, ARENA_SIZE_HEIGHT)

    -- Card positions
    local posX1 = 50
    local posX2 = SCREEN_WIDTH - 50 - CARD_PIXEL_X
    local midX = (SCREEN_WIDTH / 2) - (CARD_PIXEL_X / 2)
    local posY = (SCREEN_HEIGHT / 2) - (CARD_PIXEL_Y / 2)

    -- Might this be good code at 4:23 am?
    if not HaveFought then
        -- prints both cards at each side of the screen
        love.graphics.setColor(0,0,0)
        love.graphics.draw(cardPNG[p1Card], posX1 - 4, posY - 4, 0, MAX_SIZE + 0.01, MAX_SIZE + 0.01)
        love.graphics.setColor(1,1,1)
        love.graphics.draw(cardPNG[p1Card], posX1, posY, 0, MAX_SIZE, MAX_SIZE)

        love.graphics.setColor(0,0,0)
        love.graphics.draw(cardPNG[p2Card], posX2 - 4, posY - 4, 0, MAX_SIZE + 0.01, MAX_SIZE + 0.01)
        love.graphics.setColor(1,1,1)
        love.graphics.draw(cardPNG[p2Card], posX2, posY, 0, MAX_SIZE, MAX_SIZE)
    elseif FightWinner == 1 then
        -- player 1 winner
        love.graphics.setColor(0,0,0)
        love.graphics.draw(cardPNG[p1Card], midX - 4, posY - 4, 0, MAX_SIZE + 0.01, MAX_SIZE + 0.01)
        love.graphics.setColor(1,1,1)
        love.graphics.draw(cardPNG[p1Card], midX, posY, 0, MAX_SIZE, MAX_SIZE)
    elseif FightWinner == -1 then
        -- player 2 winner
        love.graphics.setColor(0,0,0)
        love.graphics.draw(cardPNG[p2Card], midX - 4, posY - 4, 0, MAX_SIZE + 0.01, MAX_SIZE + 0.01)
        love.graphics.setColor(1,1,1)
        love.graphics.draw(cardPNG[p2Card], midX, posY, 0, MAX_SIZE, MAX_SIZE)
    else
        -- TIE
        love.graphics.setColor(0,0,0)
        love.graphics.draw(cardPNG[p1Card], midX - 4- (CARD_PIXEL_X / 2), posY - 4, 0, MAX_SIZE + 0.01, MAX_SIZE + 0.01)
        love.graphics.setColor(1,1,1)
        love.graphics.draw(cardPNG[p1Card], midX - (CARD_PIXEL_X / 2), posY, 0, MAX_SIZE, MAX_SIZE)

        
        love.graphics.setColor(0,0,0)
        love.graphics.draw(cardPNG[p2Card], midX - 4 + (CARD_PIXEL_X / 2), posY - 4, 0, MAX_SIZE + 0.01, MAX_SIZE + 0.01)
        love.graphics.setColor(1,1,1)
        love.graphics.draw(cardPNG[p2Card], midX + (CARD_PIXEL_X / 2), posY, 0, MAX_SIZE, MAX_SIZE)
    end
end

function DrawWinscreen(whichP)
    love.graphics.print("PLAYER "..WinPlayer.." WON!", (SCREEN_WIDTH / 2) - CARD_PIXEL_X, (SCREEN_HEIGHT / 2) - (CARD_PIXEL_Y * 1.5), 0, 4, 4)  
    love.graphics.draw(Winner[whichP], (SCREEN_WIDTH / 2) - (CARD_PIXEL_X / 2), (SCREEN_HEIGHT / 2) - (CARD_PIXEL_Y / 2), 0, MAX_SIZE, MAX_SIZE)     
end 

function DrawProfilePics()
    -- Draw Profile Pics
    if scene == scenes.Player2 then
        love.graphics.setColor(0.4,0,0)
    else
        love.graphics.setColor(1,1,1)
    end
    love.graphics.draw(ProfilePic, pic1.x, pic1.y, 0, 1, 1)
    love.graphics.setColor(0,0,0)
    love.graphics.print("Player 1", pic1.x + 20, pic1.y + ((PRO_PIC_HEIGHT / 5) * 4), 0.1, 2, 1)
    love.graphics.setColor(1,1,1)

    if scene == scenes.Player1 then
        love.graphics.setColor(0.4,0,0)
    else
        love.graphics.setColor(1,1,1)
    end
    love.graphics.draw(ProfilePic, pic2.x, pic2.y, 0, 1, 1)
    love.graphics.setColor(0,0,0)
    love.graphics.print("Player 2", pic2.x + 20, pic2.y + ((PRO_PIC_HEIGHT / 5) * 4) + 5, -0.1, 2, 1)
    love.graphics.setColor(1,1,1)
end

function DrawControlledArenas()
    -- Player one
    love.graphics.setColor(0,0,0)
    love.graphics.print("Contorolled Areas", pic1.x - 4, pic1.y + PRO_PIC_HEIGHT + 10, 0, 1.5, 1)
    shadow("Citys: "..p1Areas[MONKE], pic1.x, pic1.y + PRO_PIC_HEIGHT + 20)
    changingColor("Desert: "..p1Areas[MUTANT], pic1.x + 8, pic1.y + PRO_PIC_HEIGHT + 33)
    floatyLetters("???: "..p1Areas[DIMENSION], pic1.x + 1, pic1.y + PRO_PIC_HEIGHT + 46)

    -- Player 2
    love.graphics.print("Contorolled Areas", pic2.x - 4, pic2.y + PRO_PIC_HEIGHT + 10, 0, 1.5, 1)
    shadow("Citys: "..p2Areas[MONKE], pic2.x, pic2.y + PRO_PIC_HEIGHT + 20)
    changingColor("Desert: "..p2Areas[MUTANT], pic2.x + 8, pic2.y + PRO_PIC_HEIGHT + 33)
    floatyLetters("???: "..p2Areas[DIMENSION], pic2.x + 1, pic2.y + PRO_PIC_HEIGHT + 46)
    love.graphics.setColor(1, 1, 1)
end