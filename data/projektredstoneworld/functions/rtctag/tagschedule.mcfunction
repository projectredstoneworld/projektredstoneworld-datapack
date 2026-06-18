# Runs every 10 game ticks while tag is in progress
execute if score #tagstatus info matches 2..3 run schedule function projektredstoneworld:rtctag/tagschedule 10t

# Tag timer with lag compensation
scoreboard players set #tpstimerdiff info 1000000
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
execute if score #tagstatus info matches 2 if score #tagtimersec info matches 10.. run title @a[tag=pontoka] actionbar [{"text":"Head start:","color":"yellow"},{"score":{"name":"#tagtimermin","objective":"info"},"color":"yellow"},{"text":":"},{"score":{"name":"#tagtimersec","objective":"info"},"color":"yellow"}]
execute if score #tagstatus info matches 2 if score #tagtimersec info matches ..9 run title @a[tag=pontoka] actionbar [{"text":"Head start:","color":"yellow"},{"score":{"name":"#tagtimermin","objective":"info"},"color":"yellow"},{"text":":0"},{"score":{"name":"#tagtimersec","objective":"info"},"color":"yellow"}]
execute if score #tagstatus info matches 3 if score #tagtimersec info matches 10.. run title @a[tag=pontoka] actionbar [{"text":"Time remaining:","color":"red"},{"score":{"name":"#tagtimermin","objective":"info"},"color":"red"},{"text":":"},{"score":{"name":"#tagtimersec","objective":"info"},"color":"red"}]
execute if score #tagstatus info matches 3 if score #tagtimersec info matches ..9 run title @a[tag=pontoka] actionbar [{"text":"Time remaining:","color":"red"},{"score":{"name":"#tagtimermin","objective":"info"},"color":"red"},{"text":":0"},{"score":{"name":"#tagtimersec","objective":"info"},"color":"red"}]
