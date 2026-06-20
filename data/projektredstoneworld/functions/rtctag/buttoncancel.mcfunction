execute if score #tagstatus info matches 1 run scoreboard players set #tagstatus info 0
execute if score #tagstatus info matches 2.. run function projektredstoneworld:rtctag/end
tellraw @a [{"text":"[Tag] ","color":"#FF0055","bold":true},{"text":"The player ","bold":false},{"selector":"@p","bold":false},{"text":" has cancelled the game.","bold":false}]
