# Runs every 10 game ticks while tag is in progress
execute if score #tagstatus info matches 2..3 run schedule function projektredstoneworld:rtctag/tagschedule 10t

# Tag timer with lag compensation
scoreboard players set #tagtimerdiff info 1000000
scoreboard players operation #tagtimerdiff info /= tpscalc tps_system
# Clamp difference to 400 to 2000
execute if score #tagtimerdiff info matches ..400 run scoreboard players set #tagtimerdiff info 400
execute if score #tagtimerdiff info matches 2000.. run scoreboard players set #tagtimerdiff info 2000
# Apply difference, clamp
execute unless score #tagtimer info matches 0 run scoreboard players operation #tagtimer info -= #tagtimerdiff info
execute if score #tagtimer info matches ..0 if score #tagstatus info matches 2 run function projektredstoneworld:rtctag/start
execute if score #tagtimer info matches ..0 if score #tagstatus info matches 3 run function projektredstoneworld:rtctag/end
execute if score #tagtimer info matches ..0 run scoreboard players set #tagtimer info 0
# Display timer + Formatting
scoreboard players operation #tagtimersec info = #tagtimer info
scoreboard players operation #tagtimersec info /= 1000 CONSTANTS
scoreboard players operation #tagtimermin info = #tagtimersec info
scoreboard players operation #tagtimermin info /= 60 CONSTANTS
scoreboard players operation #tagtimersec info %= 60 CONSTANTS
execute store result bossbar tagtimer value run scoreboard players get #tagtimer info
execute if score #tagstatus info matches 2 if score #tagtimersec info matches 10.. run bossbar set tagtimer name [{"text":"Head start: ","color":"#FFFF00"},{"score":{"name":"#tagtimermin","objective":"info"},"color":"#FFFF00","bold":true},{"text":":","bold":true},{"score":{"name":"#tagtimersec","objective":"info"},"color":"#FFFF00","bold":true}]
execute if score #tagstatus info matches 2 if score #tagtimersec info matches ..9 run bossbar set tagtimer name [{"text":"Head start: ","color":"#FFFF00"},{"score":{"name":"#tagtimermin","objective":"info"},"color":"#FFFF00","bold":true},{"text":":0","bold":true},{"score":{"name":"#tagtimersec","objective":"info"},"color":"#FFFF00","bold":true}]
execute if score #tagstatus info matches 3 if score #tagtimersec info matches 10.. run bossbar set tagtimer name [{"text":"Time remaining: ","color":"#FF0000"},{"score":{"name":"#tagtimermin","objective":"info"},"color":"#FF0000","bold":true},{"text":":","bold":true},{"score":{"name":"#tagtimersec","objective":"info"},"color":"#FF0000","bold":true}]
execute if score #tagstatus info matches 3 if score #tagtimersec info matches ..9 run bossbar set tagtimer name [{"text":"Time remaining: ","color":"#FF0000"},{"score":{"name":"#tagtimermin","objective":"info"},"color":"#FF0000","bold":true},{"text":":0","bold":true},{"score":{"name":"#tagtimersec","objective":"info"},"color":"#FF0000","bold":true}]


# Effects
effect give @a[tag=pontoka] saturation 100 100 true
effect clear @a[tag=pontoka]
effect give @a[tag=pontoka] glowing 10 100 true
effect give @a[tag=pontoka] regeneration 4 4 true
effect give @a[tag=pontoka] saturation 100 100 true
effect give @a[tag=pontokachase] strength 4 255 true
