--работа со сценами
local composer = require("composer")
local scene = composer.newScene()-- объявление сцены
local genButton = require "myFunctions"

-- контент перед визуализацией сцены, все графические компоненты, аудио компоненты
function scene:create( event )
    local sceneGroup = self.view
    display.setDefault("background", 1, 0, 0)

    --textbox и его параметры
    local BestLevels = native.newTextBox(160, 80, 250, 150)
    BestLevels.font = native.newFont("Helvetica", 20)--шрифт
    BestLevels:setTextColor(0, 0, 0)--цвет шрифта
    BestLevels.text = "Лучшие игры\n1 уровень - "..bestLevel1.."\n".."2 уровень - "..bestLevel2.."\n".."3 уровень - "..bestLevel3
    BestLevels.isEditable = false--разрешение на редактирование поляя

    MenuLevel3 = generationButton ("В меню", "mainMenu")
    MenuLevel3.x = 150
    MenuLevel3.y = 250

    sceneGroup:insert(MenuLevel3)--добавление объектов в сцену
    sceneGroup:insert (BestLevels)
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