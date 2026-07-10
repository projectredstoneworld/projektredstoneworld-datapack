tag @s add pontoka
execute store result score #tagpcount info if entity @a[tag=pontoka]
tellraw @s {"text":"Welcome to RTC Tag! Feel free to change the settings as you wish, and start the game once everyone has joined."}
tellraw @a [{"text":"[Tag] ","color":"#FF0055","bold":true},{"selector":"@s","color":"#FF0055","bold":false},{"text":" has joined the game! (","color":"#FF0055","bold":false},{"score": {"name":"#tagpcount","objective":"info"},"color":"#FF0055","bold":false},{"text":" player(s))","color":"#FF0055","bold":false}]
bossbar set tagtimer visible true
bossbar set tagtimer players @a[tag=pontoka]
execute if score #tagpcount info matches 2.. run setblock 288 6 669 redstone_block