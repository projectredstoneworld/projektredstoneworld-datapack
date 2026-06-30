execute at @s[scores={jiwalking=1}] run data merge entity @s[distance=..1] {Pose:{Body:[0f,0f,0f],LeftArm:[-30f,0f,0f],RightArm:[30f,0f,0f],LeftLeg:[30f,0f,0f],RightLeg:[-30f,0f,0f],Head:[0f,0f,0f]}}
execute at @s[scores={jiwalking=6}] run data merge entity @s[distance=..1] {Pose:{Body:[0f,0f,0f],LeftArm:[0f,0f,0f],RightArm:[0f,0f,0f],LeftLeg:[0f,0f,0f],RightLeg:[0f,0f,0f],Head:[0f,0f,0f]}}
execute at @s[scores={jiwalking=11}] run data merge entity @s[distance=..1] {Pose:{Body:[0f,0f,0f],LeftArm:[30f,0f,0f],RightArm:[-30f,0f,0f],LeftLeg:[-30f,0f,0f],RightLeg:[30f,0f,0f],Head:[0f,0f,0f]}}
execute at @s[scores={jiwalking=16}] run data merge entity @s[distance=..1] {Pose:{Body:[0f,0f,0f],LeftArm:[0f,0f,0f],RightArm:[0f,0f,0f],LeftLeg:[0f,0f,0f],RightLeg:[0f,0f,0f],Head:[0f,0f,0f]}}
scoreboard players add @s[scores={jiwalked=1..}] jiwalking 1
scoreboard players set @s[scores={jiwalking=21..}] jiwalking 0
scoreboard players set @s jiwalked 1 
scoreboard players set @s[tag=!condellwalk] jiwalked 0
execute at @s[scores={jiwalked=0}] run data merge entity @s[distance=..1] {Pose:{Body:[0f,0f,0f],LeftArm:[0f,0f,0f],RightArm:[0f,0f,0f],LeftLeg:[0f,0f,0f],RightLeg:[0f,0f,0f],Head:[0f,0f,0f]}}