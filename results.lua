--работа со сценами
local composer = require("composer")
local scene = composer.newScene()-- объявление сцены
local genButton = require "myFunctions"

-- контент перед визуализацией сцены, все графические компоненты, аудио компоненты
function scene:create( event )
    local sceneGroup = self.view
    local background = display.newImageRect(sceneGroup,"img/BG04.png", 960, 590)
    background.x = display.contentCenterX
    background.y = display.contentCenterY

    local backgroundText = display.newImage(sceneGroup, "img/BGR3.png", 160, 90)
    backgroundText.height = 210
    backgroundText.width = 210

    local Text1 = display.newText("Лучшие игры:", 160, 20, "Helvetica", 30)
    local Text2 = display.newText("1 уровень - "..bestLevel1, 160, 60, "Helvetica", 30)
    local Text3 = display.newText("2 уровень - "..bestLevel2, 160, 100, "Helvetica", 30)
    local Text4 = display.newText("3 уровень - "..bestLevel3, 160, 140, "Helvetica", 30)

    MenuLevel3 = generationButton ("В меню", "mainMenu")
    MenuLevel3.x = 150
    MenuLevel3.y = 400

    sceneGroup:insert(MenuLevel3)--добавление объектов в сцену
    sceneGroup:insert(Text1)--добавление объектов в сцену
    sceneGroup:insert(Text2)--добавление объектов в сцену
    sceneGroup:insert(Text3)--добавление объектов в сцену
    sceneGroup:insert(Text4)--добавление объектов в сцену
end

-- визуализация сцены, события при отображении и работы сцены
function scene:show( event ) 
    if (event.phase == "will") then --перед первой загрузкой
        --при переходе из первой о вторую сцену, нужно первую сцену удалить
        composer.removeScene("mainMenu")
    end
end

-- вызывется при сворачивании или закрытии сцены: снять прослушиватели, остановить физику
function scene:hide( event )   
    if (event.phase == "did") then --когда сцена уже закрыта
        display.remove(Text1)
        composer.removeScene("results")
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