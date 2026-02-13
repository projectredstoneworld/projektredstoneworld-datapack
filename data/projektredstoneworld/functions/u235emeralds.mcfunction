tag @s add recievingu235emeralds
give @s emerald 1
scoreboard players remove @s tpu235math 1
execute unless score @s tpu235math matches 1.. run tag @s remove recievingu235emeralds

# yay recursion
execute if score @s tpu235math matches 1.. run function projektredstoneworld:u235emeralds