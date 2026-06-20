scoreboard players set #tagstatus info 1

execute store result score #tagpcount info if entity @a[tag=pontoka]
execute if score #tagchasers info matches 0 if score #tagpcount info matches ..2 run scoreboard players set #tagstatus info 0
execute if score #tagchasers info matches 1 if score #tagpcount info matches ..2 run scoreboard players set #tagstatus info 0
execute if score #tagchasers info matches 2 if score #tagpcount info matches ..3 run scoreboard players set #tagstatus info 0
execute if score #tagchasers info matches 3 if score #tagpcount info matches ..4 run scoreboard players set #tagstatus info 0
execute if score #tagchasers info matches 4 if score #tagpcount info matches ..5 run scoreboard players set #tagstatus info 0
execute if score #tagstatus info matches 0 run tellraw @a [{"text":"[Tag] ","color":"#FF0055","bold":true},{"text":"Not enough players have joined to start the game! Either change the number of chasers (or game mode) or ask more people to play!","color":"#FF0055","bold":false}]

tellraw @a [{"text":"[Tag] ","color":"#FF0055","bold":true},{"text":"The game will start in 10 seconds!","bold":false}]

execute store result score #tagneedchase info if entity @a[tag=wantchase]
scoreboard players operation #tagneedchase info -= #tagchasers info
execute if score #tagneedchase info matches ..0 run tag @a[tag=pontoka,tag=wantchase] add pontokachase
execute if score #tagneedchase info matches -4 run tag @a[tag=pontoka,tag=!wantchase,limit=4] add pontokachase
execute if score #tagneedchase info matches -3 run tag @a[tag=pontoka,tag=!wantchase,limit=3] add pontokachase
execute if score #tagneedchase info matches -2 run tag @a[tag=pontoka,tag=!wantchase,limit=2] add pontokachase
execute if score #tagneedchase info matches -1 run tag @a[tag=pontoka,tag=!wantchase,limit=1] add pontokachase
execute if score #tagneedchase info matches 1.. if score #tagchasers info matches 1 run tag @a[tag=pontoka,tag=wantchase,limit=1] add pontokachase
execute if score #tagneedchase info matches 1.. if score #tagchasers info matches 2 run tag @a[tag=pontoka,tag=wantchase,limit=2] add pontokachase
execute if score #tagneedchase info matches 1.. if score #tagchasers info matches 3 run tag @a[tag=pontoka,tag=wantchase,limit=3] add pontokachase
execute if score #tagneedchase info matches 1.. if score #tagchasers info matches 4 run tag @a[tag=pontoka,tag=wantchase,limit=4] add pontokachase

tag @a[tag=pontoka,tag=!pontokachase] add pontokarun

title @a[tag=pontokarun] title [{"text":"You are a runner!","color":"#00FF00"}]
title @a[tag=pontokarun] subtitle [{"text":"Don't get tagged by a chaser!","color":"#00FF00"}]
title @a[tag=pontokachase] title [{"text":"You are a chaser!","color":"#FF0000"}]
title @a[tag=pontokachase] subtitle [{"text":"Try to catch the runners!","color":"#FF0000"}]

execute if score #tagchasers info matches ..1 run tellraw @a [{"text":"[Tag] ","color":"#FF0055","bold":true},{"text":"The chaser is ","bold":false},{"selector":"@a[tag=pontokachase]","bold":false}]
execute if score #tagchasers info matches 2.. run tellraw @a [{"text":"[Tag] ","color":"#FF0055","bold":true},{"text":"The chasers are ","bold":false},{"selector":"@a[tag=pontokachase]","bold":false}]

scoreboard players set #tagstatus info -1
schedule function projektredstoneworld:rtctag/init 200t
