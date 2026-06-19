execute as @a run function projektredstoneworld:rtctag/bounds

execute if score #tagbound info matches 1 as @a[tag=!tagrtc2bound] run title @s subtitle {"text":"You are out of bounds","color":"#FF0000"}
execute if score #tagbound info matches 2 as @a[tag=!tagrtcbound] run title @s subtitle {"text":"You are out of bounds","color":"#FF0000"}
execute if score #tagbound info matches 3 as @a[tag=!tagfirtcbound] run title @s subtitle {"text":"You are out of bounds","color":"#FF0000"}
# Change for logout protection
execute store result score #tagchasec info if entity @a[tag=pontokachase]
execute if score #tagbound info matches -1 if score #tagchasec info matches 1 as @a[tag=!tagrtc2bound] run title @s subtitle {"text":"You are out of bounds","color":"#FF0000"}
execute if score #tagbound info matches -1 if score #tagchasec info matches 2.. as @a[tag=!tagrtcbound] run title @s subtitle {"text":"You are out of bounds","color":"#FF0000"}
execute if score #tagbound info matches 1 as @a[tag=!tagrtc2bound] run damage @s 5 out_of_world
execute if score #tagbound info matches 2 as @a[tag=!tagrtcbound] run damage @s 5 out_of_world
execute if score #tagbound info matches 3 as @a[tag=!tagfirtcbound] run damage @s 5 out_of_world
# Change for logout protection
execute store result score #tagchasec info if entity @a[tag=pontokachase]
execute if score #tagbound info matches -1 if score #tagchasec info matches 1 as @a[tag=!tagrtc2bound] run damage @s 5 out_of_world
execute if score #tagbound info matches -1 if score #tagchasec info matches 2.. as @a[tag=!tagrtcbound] run damage @s 5 out_of_world

# Coord displays
execute as @a[tag=pontoka] if score #tagcoord info matches 1 run function projektredstoneworld:rtctag/coorddisp
