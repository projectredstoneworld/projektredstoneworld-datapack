function projektredstoneworld:handleid
function projektredstoneworld:totem
execute if score #tagstatus info matches 1..3 run function projektredstoneworld:rtctag/tagtick
#execute as @e[type=armor_stand,tag=novisname] run data remove entity @s CustomNameVisible
#execute as @e[tag=rcrailseat] at @s run data modify entity @s Motion set from entity @e[type=minecart,tag=rcraildrive,limit=1,sort=nearest,distance=..10] Motion

# Track mainworld playtime
execute in minecraft:overworld as @a[x=0] run scoreboard players add @s mainworldplaytime 1