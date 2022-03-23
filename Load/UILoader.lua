PRO_PIC_WIDTH= 162
PRO_PIC_HEIGHT = 209
function UiLoad()
    ProfilePic = love.graphics.newImage("Assets/UI/ProfilePic.png")

    -- Same heights as normal cards
    Winner = {}
    Winner[1] = love.graphics.newImage("Assets/UI/P1Win.png")
    Winner[2] = love.graphics.newImage("Assets/UI/P2Win.png")
end