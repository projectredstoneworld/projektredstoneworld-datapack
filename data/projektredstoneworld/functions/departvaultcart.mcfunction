summon armor_stand 102 -25 702 {Tags:["vaulttot2stand","vaultstandnew"],Invisible:1b}
ride @e[type=armor_stand,tag=vaultstandnew,limit=1] mount @s
tag @e[tag=vaultstandnew] remove vaultstandnew
tag @s add vaultstandcomplete
execute as @e[type=minecart,tag=vaulttot2cart,tag=!vaultplayercart,tag=!vaultstandcomplete] at @s run function projektredstoneworld:departvaultcart