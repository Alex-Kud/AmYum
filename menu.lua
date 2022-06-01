local composer = require("composer")
local scene = composer.newScene()-- объявление сцены
local genButton = require "myFunctions"

-- контент перед визуализацией сцены, все графические компоненты, аудио компоненты
function scene:create( event )
    local sceneGroup = self.view
    --display.setDefault("background", 0, 1, 0)
    local background = display.newImageRect(sceneGroup,"/img/BG03.png", 960, 590)
    background.x = display.contentCenterX
    background.y = display.contentCenterY

    -- Генерация кнопки перехода на первый уровень игры
    ButtonLevel1 = generationButton ("1", "level1")
    ButtonLevel1.x = 160
    ButtonLevel1.y = 124
    -- Генерация кнопки перехода на второй уровень игры
    ButtonLevel2 = generationButton ("2", "level2")
    ButtonLevel2.x = 160
    ButtonLevel2.y = 189
    -- Генерация кнопки перехода на третий уровень игры
    ButtonLevel3 = generationButton ("3", "level3")
    ButtonLevel3.x = 160
    ButtonLevel3.y = 254
    -- Генерация кнопки перехода в главное меню
    ButtonMainMenu = generationButton ("Меню", "mainMenu")
    ButtonMainMenu.x = 160
    ButtonMainMenu.y = 320

    -- Добавление объектов в сцену
    sceneGroup:insert(ButtonLevel1)
    sceneGroup:insert(ButtonLevel2)
    sceneGroup:insert(ButtonLevel3)
    sceneGroup:insert(ButtonMainMenu)
end

-- визуализация сцены, события при отображении и работы сцены
function scene:show( event ) 
    if (event.phase == "will") then --перед первой загрузкой
        composer.removeScene("level1")
    end
end

-- вызывется при сворачивании или закрытии сцены: снять прослушиватели, остановить физику
function scene:hide( event )   
    if (event.phase == "did") then --когда сцена уже закрыта
        composer.removeScene("menu")
        Button = nil
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