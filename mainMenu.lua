local composer = require("composer")
local scene = composer.newScene()-- объявление сцены
local genButton = require "myFunctions"

-- контент перед визуализацией сцены, все графические компоненты, аудио компоненты
function scene:create( event )
    local sceneGroup = self.view
    local background = display.newImageRect(sceneGroup,"img/BG03.png", 960, 590)
    background.x = display.contentCenterX
    background.y = display.contentCenterY

    -- Генерация кнопки перехода на выбор уровней
    ButtonLevels = generationButton ("Играть", "menu")
    ButtonLevels.x = 160
    ButtonLevels.y = 189
    -- Генерация кнопки перехода на страницу с рекордами
    ButtonBest = generationButton ("Рекорды", "results")
    ButtonBest.x = 160
    ButtonBest.y = 254

    -- Добавление объектов в сцену
    sceneGroup:insert(ButtonLevels)
    sceneGroup:insert(ButtonBest)
end

-- визуализация сцены, события при отображении и работы сцены
function scene:show( event ) 
    if (event.phase == "will") then --перед первой загрузкой
        composer.removeScene("results")
    end
end

-- вызывется при сворачивании или закрытии сцены: снять прослушиватели, остановить физику
function scene:hide( event )   
    if (event.phase == "did") then --когда сцена уже закрыта
        composer.removeScene("mainMenu")
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