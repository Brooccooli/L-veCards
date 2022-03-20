function LoadCards()
    
    -- Cards specific
    CARD_AMOUNT = 16
    PNG = "png"
    ACTIVE = "active"
    HALFWAY = "halfway"
    DESC = "describtion"
    X = "x"
    Y = "y"
    WIDTH = "width"
    HEIGHT = "height"
    INDEX = "index"
    HOVER = "hover"
    TYPE = "type"
    STAT = "stat"
    FACE_UP = "fUp"

    -- Card Types
    DIMENSION = "dimension"
    MUTANT = "mutant"
    MONKE = "monke"
    GOD = "god"

    -- Load Card PNGs
    LoadPNG()

    -- Deck
    deck = {}
    deck[X] = 1
    deck[Y] = 500

    -- Card Template
    card = {}      
    card[PNG] = cardBack
    card[ACTIVE] = false
    card[HALFWAY] = false
    card[HOVER] = false
    card[X] = -1000
    card[Y] = -1000
    card[WIDTH] = MAX_SIZE
    card[HEIGHT] = MAX_SIZE
    card[DESC] = "You forgot to write something here..."
    card[TYPE] = MUTANT
    card[STAT] = 3
    card[FACE_UP] = false

    -- Table in Table
    cards = {}
    for i = CARD_AMOUNT, 1, -1 do
        cards[i] = table.deepcopy(card)
        cards[i][PNG] = cardPNG[i]
    end

    SetDescriptions()

    -- Set Cardslots
    cardPadding = CARD_PIXEL_X + 45
    slots = 4
    cardSlots = {}
    for i = slots, 1, -1 do
        cardSlots[i] = table.deepcopy(card)
        cardSlots[i][X] = cardPadding * (i - 1) + 100 + ((SCREEN_WIDTH - 1000) / 2)
        cardSlots[i][Y] = 500
        cardSlots[i][PNG] = cardBack
    end

    -- Set cards in slots
    for i = slots, 1, -1 do
        local index = love.math.random(2, CARD_AMOUNT)
        cardSlots[i][INDEX] = index
        cardSlots[i][DESC] = cards[index][DESC]
        cardSlots[i][TYPE] = cards[index][TYPE]
    end

    SummonGod()

    -- TODO: 4 of the same card summons God card and play new effect
end

function reRoll()
    for i = slots, 1, -1 do
        -- Random 34
        --math.floor(rand()*10) + 1

        local index = love.math.random(2, CARD_AMOUNT)
        cardSlots[i][INDEX] = index
        --cardSlots[i][PNG] = cardBack
        cardSlots[i][DESC] = cards[index][DESC]
        cardSlots[i][TYPE] = cards[index][TYPE]
    end
    SummonGod()
end

-- ###################
-- ###### SETUP ######
-- ###################
function LoadPNG()
    cardPNG = {}

    -- Loading cards
    cardReroll = love.graphics.newImage("Assets/Cards/Reroll.png")
    cardBack = love.graphics.newImage("Assets/Cards/Backside.png")
    cardPNG[1] = love.graphics.newImage("Assets/Cards/AllSeeing.png")
    cardPNG[2] = love.graphics.newImage("Assets/Cards/CaveEye.png")
    cardPNG[3] = love.graphics.newImage("Assets/Cards/Creep.png")
    cardPNG[4] = love.graphics.newImage("Assets/Cards/Crystal.png")
    cardPNG[5] = love.graphics.newImage("Assets/Cards/Electro.png")
    cardPNG[6] = love.graphics.newImage("Assets/Cards/Fin.png")
    cardPNG[7] = love.graphics.newImage("Assets/Cards/Ghost.png")
    cardPNG[8] = love.graphics.newImage("Assets/Cards/HackPC.png")
    cardPNG[9] = love.graphics.newImage("Assets/Cards/Hunger.png")
    cardPNG[10] = love.graphics.newImage("Assets/Cards/KingTurtle.png")
    cardPNG[11] = love.graphics.newImage("Assets/Cards/Knight.png")
    cardPNG[12] = love.graphics.newImage("Assets/Cards/Mogu.png")
    cardPNG[13] = love.graphics.newImage("Assets/Cards/Monke.png")
    cardPNG[14] = love.graphics.newImage("Assets/Cards/Ninja.png")
    cardPNG[15] = love.graphics.newImage("Assets/Cards/Wizard.png")
    cardPNG[16] = love.graphics.newImage("Assets/Cards/Xorb.png")
end

function SetDescriptions()
    -- Card Description
    cards[1][DESC] = 'EROR 404: No info on this being'
    cards[2][DESC] = 'He pulled himself out of the socket'
    cards[3][DESC] = 'He ate one too many humans'
    cards[4][DESC] = 'He just appeared, does nothing, says nothing'
    cards[5][DESC] = 'Nobody has dared to get close enough to get any info'
    cards[6][DESC] = 'He jumped out of the TV!'
    cards[7][DESC] = 'ERROR ERROR ERROR ERROR'
    cards[8][DESC] = 'I`ve hidden the info on me, lol'
    cards[9][DESC] = 'Always hungry, never eats'
    cards[10][DESC] = 'He`s king of a ocean without inteligence'
    cards[11][DESC] = 'His flail put anti-gravity on anything it hits'
    cards[12][DESC] = 'Seems to have more power then he wants to show'
    cards[13][DESC] = 'Has been everywhere and collected everything'
    cards[14][DESC] = 'Leader of the cyclops ninja clan'
    cards[15][DESC] = 'Able to distort reality'
    cards[16][DESC] = 'Exurbia retired and is now a single dad'

    -- Card typ
    cards[1][TYPE] = GOD
    cards[2][TYPE] = MUTANT
    cards[3][TYPE] = MUTANT
    cards[4][TYPE] = DIMENSION
    cards[5][TYPE] = DIMENSION
    cards[6][TYPE] = MONKE
    cards[7][TYPE] = DIMENSION
    cards[8][TYPE] = MUTANT
    cards[9][TYPE] = DIMENSION
    cards[10][TYPE] = MUTANT
    cards[11][TYPE] = MONKE
    cards[12][TYPE] = DIMENSION
    cards[13][TYPE] = MONKE
    cards[14][TYPE] = MONKE
    cards[15][TYPE] = MONKE
    cards[16][TYPE] = MUTANT
    
    -- Card type stat
    cards[1][STAT] = 100
    cards[2][STAT] = 3
    cards[3][STAT] = 3
    cards[4][STAT] = 3
    cards[5][STAT] = 3
    cards[6][STAT] = 3
    cards[7][STAT] = 3
    cards[8][STAT] = 3
    cards[9][STAT] = 3
    cards[10][STAT] = 3
    cards[11][STAT] = 3
    cards[12][STAT] = 3
    cards[13][STAT] = 3
    cards[14][STAT] = 3
    cards[15][STAT] = 3
    cards[16][STAT] = 3
end

function SummonGod()
    matches = 0
    local lastCard = 0
    for i = slots, 1, -1 do
        if i == slots then
            lastCard = cardSlots[i][INDEX]
        elseif cardSlots[i][INDEX] == lastCard then
            matches = matches + 1
        end
    end
    if matches == slots - 1 then
        for i = slots, 1, -1 do
            cardSlots[i][INDEX] = 1
            cardSlots[i][PNG] = cardPNG[1]
            cardSlots[i][DESC] = cards[1][DESC]
            cardSlots[i][TYPE] = cards[1][TYPE]
        end
    end
end