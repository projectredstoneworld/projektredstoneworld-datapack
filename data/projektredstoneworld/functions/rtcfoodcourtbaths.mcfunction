# To be executed as items that land there

# Baked Potato (Fries)
execute if entity @s[x=-8.0,y=174.0,z=583.0,dx=1.0,dy=0,dz=0] if entity @s[nbt={Item:{id:"minecraft:baked_potato",tag:{rtchealthy:1b}}}] align xyz positioned ~.5 ~.3 ~.5 run summon item ~ ~ ~ {Item:{id:"minecraft:baked_potato",Count:1b,tag:{rtchealthy:0b,display:{Name:'{"text":"French Fries","color":"gold","bold":true,"italic":false}',Lore:['{"text":"Ultra Processed and sauced on Floor 6 of RTC-1"}']}}},Motion:[-0.05,0.5,0.0]}
execute if entity @s[x=-8.0,y=174.0,z=583.0,dx=1.0,dy=0,dz=0] if entity @s[nbt={Item:{id:"minecraft:baked_potato",tag:{rtchealthy:1b}}}] run playsound block.redstone_torch.burnout master @a[distance=..10] ~ ~ ~ 1 1 1
execute if entity @s[x=-8.0,y=174.0,z=583.0,dx=1.0,dy=0,dz=0] if entity @s[nbt={Item:{id:"minecraft:baked_potato",tag:{rtchealthy:1b}}}] run return run kill @s

# Steak + Bread (Burger)
execute if entity @s[x=-8.0,y=174.0,z=583.0,dx=1.0,dy=0,dz=0] if entity @s[nbt={Item:{id:"minecraft:cooked_beef",tag:{rtchealthy:1b}}}] if entity @e[type=item,x=-8.0,y=174.0,z=583.0,dx=1.0,dy=0,dz=0,nbt={Item:{id:"minecraft:bread",tag:{rtchealthy:1b}}}] align xyz positioned ~.5 ~.3 ~.5 run summon item ~ ~ ~ {Item:{id:"minecraft:cooked_beef",Count:1b,tag: {display: {Name: '{"text":"","extra":[{"text":"Hamburger","obfuscated":false,"italic":false,"underlined":false,"strikethrough":false,"color":"gold","bold":true}]}', Lore: ['{"text":"","extra":["Ultra-processed so much that the buns seem invisible in your hand..."]}']}, rtchealthy: 0b}},Motion:[-0.05,0.5,0.0]}
execute if entity @s[x=-8.0,y=174.0,z=583.0,dx=1.0,dy=0,dz=0] if entity @s[nbt={Item:{id:"minecraft:cooked_beef",tag:{rtchealthy:1b}}}] if entity @e[type=item,x=-8.0,y=174.0,z=583.0,dx=1.0,dy=0,dz=0,nbt={Item:{id:"minecraft:bread",tag:{rtchealthy:1b}}}] run playsound block.redstone_torch.burnout master @a[distance=..10] ~ ~ ~ 1 1 1
execute if entity @s[x=-8.0,y=174.0,z=583.0,dx=1.0,dy=0,dz=0] if entity @s[nbt={Item:{id:"minecraft:cooked_beef",tag:{rtchealthy:1b}}}] if entity @e[type=item,x=-8.0,y=174.0,z=583.0,dx=1.0,dy=0,dz=0,nbt={Item:{id:"minecraft:bread",tag:{rtchealthy:1b}}}] run kill @e[type=item,limit=2,distance=..3,nbt={Item:{tag:{rtchealthy:1b}}}]

# Cookie (Sugar Bath offset +1 z)
execute if entity @s[x=-8.0,y=174.0,z=584.0,dx=1.0,dy=0,dz=0] if entity @s[nbt={Item:{id:"minecraft:cookie",tag:{rtchealthy:1b}}}] align xyz positioned ~.5 ~.3 ~.5 run summon item ~ ~ ~ {Item:{id:"minecraft:cookie",Count:1b,tag: {display: {Name: '{"text":"","extra":[{"text":"Ultra Sugar Chocolate Cookie","bold":true}]}', Lore: ['{"text":"","extra":["Soaked in the RTC Sugar Bath... it tastes amazing but that for sure can\'t be healthy!"]}']}, rtchealthy: 0b}},Motion:[-0.05,0.5,0.0]}
execute if entity @s[x=-8.0,y=174.0,z=584.0,dx=1.0,dy=0,dz=0] if entity @s[nbt={Item:{id:"minecraft:cookie",tag:{rtchealthy:1b}}}] run playsound block.brewing_stand.brew master @a[distance=..10] ~ ~ ~ 1 1 1
execute if entity @s[x=-8.0,y=174.0,z=584.0,dx=1.0,dy=0,dz=0] if entity @s[nbt={Item:{id:"minecraft:cookie",tag:{rtchealthy:1b}}}] run return run kill @s
