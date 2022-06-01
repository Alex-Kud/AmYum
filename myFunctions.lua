local composer = require("composer")

bestLevel1 = 0
bestLevel2 = 0
bestLevel3 = 0

function generationButton(text, scene)
    local widget = require "widget"

    Button = widget.newButton {
        label = text,
        defaultFile = "img/button.png",
        labelColor = {default = {0, 0, 0}, over={0.5, 0.5, 0.5}},--цвет текста
        fontSize = 20,
        width = 200, height = 50,
        onRelease = function() composer.gotoScene(scene) end
    }
    return Button
end

function spawn( event )
    local params = event.source.params
    local newObject = display.newImageRect(params.img, 40, 40)
    newObject.x = math.random(10, 310)
    newObject.y = -100
    newObject.Id = params.id
    physics.addBody(newObject, "dynamic", {radius = 10, isSensor = true})
end