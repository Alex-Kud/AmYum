-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
-- Работа со сценами
local composer = require("composer")
local audioNewYear = audio.loadSound( "music/newYear.mp3" )
audio.play(audioNewYear)
-- Переход к сцене
composer.gotoScene("mainMenu")