
# Handle reconnect for reborn museum lock
tag @s remove rebornxfragwatcher
tag @s remove rebornxfoundfrag
tag @s remove mcdonaldsjob
tag @s remove janitorjob

# Minigame Center / Tag down below
# Keep things like usual if tag is going on
execute if entity @s[tag=pontoka] unless score #tagstatus info matches 2..3 run function projektredstoneworld:rtctag/reconnectlate

# Check if limbo tick is needed
execute store success score #limboactive info if entity @a[tag=limbo,limit=1]

# Clear reconnect status
scoreboard players reset @s rtcreconnect
