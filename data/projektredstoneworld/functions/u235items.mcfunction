summon item -1974.54 58.69 854.44 {Motion:[0.0,0.0,0.0],Item:{id:"minecraft:lime_dye",Count:1b,tag:{u235:1b,display:{Name:'{"text":"Processed U-235","color":"green","bold":true,"italic":false}',Lore:['{"text":"Uranium fit to be used in the fission process","color":"gray","bold":false,"italic":false}']}}}}

scoreboard players remove #server tpu235payout 1

execute if score #server tpu235payout matches 1.. run function projektredstoneworld:u235items
