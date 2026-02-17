# have code here for opening door

execute at @s as @a[distance=5..20,tag=rcrailrider,limit=2,sort=nearest] run tellraw @s {"text":"Press if you would like to change your destination station","color":"#00FF00","bold":true,"underlined":true,"clickEvent":{"action":"run_command","value":"/trigger rcrailtrig set -1"}}


execute at @s as @a[distance=5..20,tag=rcrailrider,limit=2,sort=nearest] run tellraw @s {"text":"You have arrived at your destination station!","color":"#00FF00","bold":true}

execute at @s as @e[type=minecart,tag=rcraildrive,distance=..1,tag=rcrailaged] run tag @s add rcrailarrive

