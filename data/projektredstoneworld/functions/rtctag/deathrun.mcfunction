tellraw @a [{"text":"[Tag] ","color":"#FF0055","bold":true},{"selector":"@s","bold":false},{"text":" has been caught!","bold":false,"color":"#FF0055"}]
tag @s remove pontokarun
# Infection mode!
execute if score #tagchasers info matches 0 run tag @s add pontokachase
execute if score #tagchasers info matches 0 run tellraw @s [{"text":"Since this is infection mode, you are now a chaser!"}]
execute store result score #tagpcount info if entity @a[tag=pontoka]
execute store result score #tagchasec info if entity @a[tag=pontokachase]
execute if score #tagchasers info matches 0 if score #tagpcount info = #tagchasec info run tellraw @a [{"text":"[Tag] ","color":"#FF0055","bold":true},{"text":"Everyone has been infected!","bold":false}]
execute if score #tagchasers info matches 0 if score #tagpcount info = #tagchasec info run function projektredstoneworld:rtctag/end
execute if score #tagchasers info matches 0 unless score #tagpcount info = #tagchasec info run tp @s @a[tag=pontokachase,limit=1,sort=furthest]
execute if score #tagchasers info matches 0 unless score #tagpcount info = #tagchasec info run gamemode adventure @s
execute if score #tagchasers info matches 0 run return fail
# Not infection mode!
tag @s remove pontoka
tag @s remove wantchase
tag @s remove pontokachase
tag @s remove pontokarun
tag @s remove tagfirtcbound
tag @s remove tagrtcbound
tag @s remove tagrtc2bound
tag @s remove pontokanearmiss
tag @s add pontokadead
tellraw @s "You have been caught, gg!"
gamemode survival @s
execute store result score #tagrunc info if entity @a[tag=pontokarun]
execute if score #tagrunc info matches 0 run tellraw @a [{"text":"[Tag] ","color":"#FF0055","bold":true},{"text":"The runner(s) have been all caught! The chasers win!","bold":false}]
execute if score #tagrunc info matches 0 run function projektredstoneworld:rtctag/end
