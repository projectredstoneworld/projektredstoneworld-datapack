execute at @e[tag=JiPigMonkHunt,scores={jiwalking=1}] run data merge entity @e[type=armor_stand,tag=JiArmorMonkHunt,distance=..1,limit=1] {Pose:{Body:[0f,0f,0f],LeftArm:[-30f,0f,0f],RightArm:[30f,0f,0f],LeftLeg:[30f,0f,0f],RightLeg:[-30f,0f,0f],Head:[0f,0f,0f]}}
execute at @e[tag=JiPigMonkHunt,scores={jiwalking=6}] run data merge entity @e[type=armor_stand,tag=JiArmorMonkHunt,distance=..1,limit=1] {Pose:{Body:[0f,0f,0f],LeftArm:[0f,0f,0f],RightArm:[0f,0f,0f],LeftLeg:[0f,0f,0f],RightLeg:[0f,0f,0f],Head:[0f,0f,0f]}}
execute at @e[tag=JiPigMonkHunt,scores={jiwalking=11}] run data merge entity @e[type=armor_stand,tag=JiArmorMonkHunt,distance=..1,limit=1] {Pose:{Body:[0f,0f,0f],LeftArm:[30f,0f,0f],RightArm:[-30f,0f,0f],LeftLeg:[-30f,0f,0f],RightLeg:[30f,0f,0f],Head:[0f,0f,0f]}}
execute at @e[tag=JiPigMonkHunt,scores={jiwalking=16}] run data merge entity @e[type=armor_stand,tag=JiArmorMonkHunt,distance=..1,limit=1] {Pose:{Body:[0f,0f,0f],LeftArm:[0f,0f,0f],RightArm:[0f,0f,0f],LeftLeg:[0f,0f,0f],RightLeg:[0f,0f,0f],Head:[0f,0f,0f]}}
scoreboard players add @e[scores={jiwalked=1..}] jiwalking 1
scoreboard players set @e[scores={jiwalking=21..}] jiwalking 0
scoreboard players set @e[tag=JiPigMonkHunt] jiwalked 1 
scoreboard players set @e[tag=JiPigMonkHunt,nbt={Motion:[0.0,0.0,0.0]}] jiwalked 0
execute at @e[tag=JiPigMonkHunt,scores={jiwalked=0}] run data merge entity @e[type=armor_stand,tag=JiArmorMonkHunt,distance=..1,limit=1] {Pose:{Body:[0f,0f,0f],LeftArm:[0f,0f,0f],RightArm:[0f,0f,0f],LeftLeg:[0f,0f,0f],RightLeg:[0f,0f,0f],Head:[0f,0f,0f]}}