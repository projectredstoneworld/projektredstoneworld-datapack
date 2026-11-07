execute if entity @a[tag=pontokanocancel,distance=..5] run tellraw @a [{"text":"[Tag] ","color":"#FF0055","bold":true},{"text":"The game cannot be cancelled because of the following nearby player(s): ","bold":false},{"selector":"@a[distance=..5,tag=pontokanocancel]"}]
execute if entity @a[tag=pontokanocancel,distance=..5] run return fail

execute if score #tagstatus info matches 1 run scoreboard players set #tagstatus info 0
execute if score #tagstatus info matches 2.. run function projektredstoneworld:rtctag/end
tellraw @a [{"text":"[Tag] ","color":"#FF0055","bold":true},{"text":"The player ","bold":false},{"selector":"@p","bold":false},{"text":" has cancelled the game.","bold":false}]
