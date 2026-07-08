tag @s remove pontoka
tag @s remove wantchase
tag @s remove pontokachase
tag @s remove pontokarun
tag @s remove tagfirtcbound
tag @s remove tagrtcbound
tag @s remove tagrtc2bound
tag @s remove pontokanearmiss

tellraw @s {"text": "You have been removed from the RTC tag game due to a reconnect after the game already ended. Please restart the game if you wish to play again.","color":"#FF0000"}
tp @s 286.5 4.0 654.5 0 0

tag @s add pontokaneedperm
setblock 297 5 666 minecraft:redstone_block
