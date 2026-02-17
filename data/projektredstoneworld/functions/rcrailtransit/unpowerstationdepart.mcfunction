data modify entity @s data.block set value "minecraft:deepslate_tiles"
function projektredstoneworld:macrosetblock with entity @s data
scoreboard players set @s rcrailunpowertime 0
tag @s remove rcrailpowered

# Prompt after leaving station
execute at @s[tag=rcsneg] as @a[distance=5..20,tag=rcrailprimary,tag=rcrailrider,limit=1,sort=nearest,tag=rcrailneg] run tellraw @s {"text":"Press if you would like to change your destination station","color":"#00FF00","bold":true,"underlined":true,"clickEvent":{"action":"run_command","value":"/trigger rcrailtrig set -1"}}
execute at @s[tag=rcspos] as @a[distance=5..20,tag=rcrailprimary,tag=rcrailrider,limit=1,sort=nearest,tag=rcrailpos] run tellraw @s {"text":"Press if you would like to change your destination station","color":"#00FF00","bold":true,"underlined":true,"clickEvent":{"action":"run_command","value":"/trigger rcrailtrig set -1"}}

# Remove primary tag
execute at @s[tag=rcspos] run tag @a[distance=5..20,tag=rcrailprimary,tag=rcrailrider,limit=1,sort=nearest,tag=rcrailpos] remove rcrailprimary
execute at @s[tag=rcsneg] run tag @a[distance=5..20,tag=rcrailprimary,tag=rcrailrider,limit=1,sort=nearest,tag=rcrailneg] remove rcrailprimary
