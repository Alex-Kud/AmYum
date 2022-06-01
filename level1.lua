-- Работа со сценами
local composer = require("composer")
local scene = composer.newScene()-- объявление сцены
local genButton = require "myFunctions"
local physics = require ("physics")
physics.start()

-- Контент перед визуализацией сцены, все графические компоненты, аудио компоненты
function scene:create( event )
    -- Генерация подарков
    local spawnGiftTimer = timer.performWithDelay (2000, spawn, 0, "giftTimer")
    spawnGiftTimer.params = { img = "img/gift.png", id = "gift" }
    -- Генерация мороженного
    local spawnGiftTimer = timer.performWithDelay (3000, spawn, 0, "lifeTimer")
    spawnGiftTimer.params = { img = "img/life.png", id = "life" }

    local score = 0
    local lives = 5
    local sceneGroup = self.view
    local background = display.newImageRect(sceneGroup,"img/BG02.png", 960, 590)
    background.x = display.contentCenterX
    background.y = display.contentCenterY

    -- Дед Мороз
    local player = display.newImage(sceneGroup, "img/ded.png", 160, 470)
    player.height = 130
    player.width = 120
    player.Id = "ded"
    physics.addBody(player, "dynamic", {radius = 20, isSensor = true} )
    player.gravityScale = 0

    -- Перемещение персонажа
    local function dragPlayer (event)
        if(event.phase == "began") then
            display.currentStage:setFocus(player)
            player.touchOffsetX = event.x - player.x
        elseif(event.phase == "moved") then
            player.x = event.x - player.touchOffsetX
        elseif(event.phase == "ended") then
            display.currentStage:setFocus(nil)
        end
    end
    player:addEventListener("touch", dragPlayer)

    -- Подарки (очки)
    local gifts = display.newImage(sceneGroup, "img/gift.png", 20, 5)
    gifts.height = 30
    gifts.width = 30
    local giftsText = display.newText(sceneGroup, score, 57, 5, "Helvatica", 26)

    -- Подарки (очки)
    local livesImg = display.newImage(sceneGroup, "img/life.png", 300, 0)
    livesImg.height = 30
    livesImg.width = 30
    local livesText = display.newText(sceneGroup, lives, 257, 5, "Helvatica", 26)

    -- Обработка столкновений
    local function CollisionHandling (event)
        if(event.phase == "began") then
            local obj1 = event.object1
            local obj2 = event.object2
            -- Столкновение с подарком
            if (obj1.Id == "ded" and obj2.Id == "gift") then
                score = score + 1
                giftsText.text = score
                display.remove(obj2)
            end
            -- Столкновение с мороженным
            if (obj1.Id == "ded" and obj2.Id == "life") then
                lives = lives + 1
                livesText.text = lives
                display.remove(obj2)
            end





        end
    end
    Runtime:addEventListener("collision", CollisionHandling)











    MenuLevel1 = generationButton ("В меню", "menu")
    MenuLevel1.width = 150
    MenuLevel1.x = 160
    MenuLevel1.y = 0

    sceneGroup:insert(MenuLevel1)--добавление объектов в сцену
end

-- визуализация сцены, события при отображении и работы сцены
function scene:show( event ) 
    if (event.phase == "will") then --перед первой загрузкой
        --при переходе из первой о вторую сцену, нужно первую сцену удалить
        composer.removeScene("menu")
    end
end

-- вызывется при сворачивании или закрытии сцены: снять прослушиватели, остановить физику
function scene:hide( event )   
    timer.cancel("giftTimer")
    timer.cancel("lifeTimer")
    if (event.phase == "did") then --когда сцена уже закрыта
        composer.removeScene("level1")
    end
end

-- очищение сцены из ОП
function scene:destroy( event )
end

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene