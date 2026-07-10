tag @s remove pontoka
execute store result score #tagpcount info if entity @a[tag=pontoka]
tellraw @a [{"text":"[Tag] ","color":"#FF0055","bold":true},{"selector":"@s","color":"#FF0055","bold":false},{"text":" has left the game! (","color":"#FF0055","bold":false},{"score": {"name":"#tagpcount","objective":"info"},"color":"#FF0055","bold":false},{"text":" player(s))","color":"#FF0055","bold":false}]
tag @s remove tagfirtcbound
tag @s remove tagrtc2bound
tag @s remove tagrtcbound
tag @s remove pontokachase
tag @s remove pontokarun
tag @s remove pontokawantchase
tag @s remove pontokanearmiss
effect clear @s
gamemode survival @s
bossbar set tagtimer players @a[tag=pontoka]
execute if score #tagpcount info matches ..1 run setblock 288 6 669 pink_stained_glass