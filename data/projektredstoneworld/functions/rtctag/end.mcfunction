# Runs when the RTC tag game ends.

scoreboard players set #tagstatus info 0
bossbar set tagtimer visible false
bossbar set tagtimer color white
bossbar set tagtimer max 1
bossbar set tagtimer value 1
bossbar set tagtimer name [{"text":"---=== TAG LOBBY: Wait for the game to start ===---","color":"white"}]

execute in overworld run tp @a[tag=pontoka] 286.5 4.0 654.5 0 0
execute in overworld run tp @a[tag=pontokadead] 286.5 4.0 654.5 0 0
effect clear @a[tag=pontoka]
gamemode survival @a[tag=pontoka]
tag @a remove pontoka
tag @a remove wantchase
tag @a remove pontokachase
tag @a remove pontokarun
tag @a remove tagfirtcbound
tag @a remove tagrtcbound
tag @a remove tagrtc2bound
tag @a remove pontokanearmiss
tag @a add pontokaneedperm
setblock 297 5 666 minecraft:redstone_block
tellraw @a [{"text":"[Tag] ","color":"#FF0055","bold":true},{"text":"The game has ended!","bold":false}]

scoreboard objectives remove tagdeathrip

scoreboard players set #tagfailtime info 0

execute in overworld run tp @a[tag=rtcm,x=-317,y=62,z=404,dx=4,dy=5,dz=5] 286.5 4.0 654.5 0 0

fill 288 6 669 284 6 669 pink_stained_glass