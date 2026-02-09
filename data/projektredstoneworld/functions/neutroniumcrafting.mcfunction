execute as @e[type=item,distance=..15,nbt={Item:{id:"minecraft:netherite_scrap",tag:{neutronium:1b},Count:6b}}] at @s if block ~ ~1 ~ lava run tag @s add neutroniumscrap
execute as @e[type=item,distance=..15,nbt={Item:{id:"minecraft:netherite_scrap",tag:{neutronium:1b},Count:6b}}] at @s if block ~ ~ ~ lava run tag @s add neutroniumscrap
execute as @e[type=item,distance=..15,nbt={Item:{id:"minecraft:netherite_scrap",tag:{neutronium:1b},Count:6b}}] at @s if block ~ ~-1 ~ lava run tag @s add neutroniumscrap

# execute positioned -22.53 95.50 326.44 as @e[type=item,tag=neutroniumscrap] run summon item ~ ~ ~ {Item:{id:"minecraft:netherite_ingot",Count:1b,tag:{display:{Name:'{"text":"Compacted Neutronium Ingot","color":"dark_gray","bold":true,"italic":false}',Lore:['{"text":"A byproduct of nuclear enrichment, can be used in crafting powerful gear","color":"gray","bold":false,"italic":false}']},neutroniumingot:1b}}}
execute positioned -22.53 95.50 326.44 as @e[type=item,tag=neutroniumscrap] run summon item ~ ~ ~ {Item:{id:"minecraft:netherite_ingot",Count:1b,tag:{display:{Name:'{"text":"Compacted Neutronium Ingot","color":"dark_gray","bold":true,"italic":false}',Lore:['{"text":"A byproduct of nuclear enrichment, can be used in crafting powerful gear","color":"gray","bold":false,"italic":false}','{"text":"Infused with the power of lava, the compressed neutronium has turned into a powerful bar","color":"dark_gray","bold":true,"italic":false}']},neutroniumingot:1b}}}
execute positioned -22.53 95.50 326.44 as @e[type=item,tag=neutroniumscrap] run particle end_rod ~ ~.4 ~ .2 .2 .2 0.1 16
execute positioned -22.53 95.50 326.44 as @e[type=item,tag=neutroniumscrap] run playsound item.trident.thunder master @a[distance=..10] ~ ~ ~ 360 1 1
execute as @e[type=item,tag=neutroniumscrap] run kill @s

execute as @e[type=item,distance=..15,nbt={Item:{id:"minecraft:netherite_ingot",tag:{neutroniumingot:1b},Count:2b}}] at @s if block ~ ~1 ~ lava run tag @s add neutroniumingot
execute as @e[type=item,distance=..15,nbt={Item:{id:"minecraft:netherite_chestplate"}}] at @s if block ~ ~1 ~ lava run tag @s add neutroniumchest
execute as @e[type=item,distance=..15,nbt={Item:{id:"minecraft:netherite_helmet"}}] at @s if block ~ ~1 ~ lava run tag @s add neutroniumhelmet
execute as @e[type=item,distance=..15,nbt={Item:{id:"minecraft:netherite_leggings"}}] at @s if block ~ ~1 ~ lava run tag @s add neutroniumleg
execute as @e[type=item,distance=..15,nbt={Item:{id:"minecraft:netherite_boots"}}] at @s if block ~ ~1 ~ lava run tag @s add neutroniumboot
execute as @e[type=item,distance=..15,nbt={Item:{id:"minecraft:netherite_sword"}}] at @s if block ~ ~1 ~ lava run tag @s add neutroniumsword


execute at @e[tag=neutroniumchest] positioned -22.53 95.50 326.44 as @e[type=item,tag=neutroniumingot] run summon item ~ ~ ~ {Tags:["craftedneutronium"],Item:{id: "minecraft:netherite_chestplate", tag: {Enchantments: [{id: "minecraft:blast_protection", lvl: 127s}, {id: "minecraft:fire_protection", lvl: 127s}, {id: "minecraft:mending", lvl: 127s}, {id: "minecraft:projectile_protection", lvl: 127s}, {id: "minecraft:protection", lvl: 127s}, {id: "minecraft:thorns", lvl: 127s}, {id: "minecraft:unbreaking", lvl: 127s}], Unbreakable: 1b, Damage: 0, display: {Name: '{"extra":[{"bold":true,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"color":"gray","text":"Neutronium \'Heldengewand\' Chestplate"}],"text":""}', Lore: ['{"extra":[{"bold":true,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"color":"gray","text":"This Netherite Chestplate has been covered with a layer of Neutronium and has artifically became a piece of MasterGear"}],"text":""}']}}, Count: 1b}}
execute at @e[tag=neutroniumhelmet] positioned -22.53 95.50 326.44 as @e[type=item,tag=neutroniumingot] run summon item ~ ~ ~ {Tags:["craftedneutronium"],Item:{id: "minecraft:netherite_helmet", tag: {Enchantments: [{id: "minecraft:aqua_affinity", lvl: 127s}, {id: "minecraft:blast_protection", lvl: 127s}, {id: "minecraft:fire_protection", lvl: 127s}, {id: "minecraft:mending", lvl: 127s}, {id: "minecraft:projectile_protection", lvl: 127s}, {id: "minecraft:protection", lvl: 127s}, {id: "minecraft:respiration", lvl: 127s}, {id: "minecraft:thorns", lvl: 127s}, {id: "minecraft:unbreaking", lvl: 127s}], Unbreakable: 1b, Damage: 0, display: {Name: '{"extra":[{"bold":true,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"color":"gray","text":"Neutronium \'Heldengewand\' Helmet"}],"text":""}', Lore: ['{"extra":[{"bold":true,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"color":"gray","text":"This Netherite Helmet has been covered with a layer of Neutronium and has artifically became a piece of MasterGear"}],"text":""}']}}, Count: 1b}}
execute at @e[tag=neutroniumleg] positioned -22.53 95.50 326.44 as @e[type=item,tag=neutroniumingot] run summon item ~ ~ ~ {Tags:["craftedneutronium"],Item:{id: "minecraft:netherite_leggings", tag: {Enchantments: [{id: "minecraft:blast_protection", lvl: 127s}, {id: "minecraft:fire_protection", lvl: 127s}, {id: "minecraft:mending", lvl: 127s}, {id: "minecraft:projectile_protection", lvl: 127s}, {id: "minecraft:protection", lvl: 127s}, {id: "minecraft:thorns", lvl: 127s}, {id: "minecraft:unbreaking", lvl: 127s}], Unbreakable: 1b, Damage: 0, display: {Name: '{"extra":[{"bold":true,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"color":"gray","text":"Neutronium \'Heldengewand\' Leggings"}],"text":""}', Lore: ['{"extra":[{"bold":true,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"color":"gray","text":"These Netherite Leggings have been covered with a layer of Neutronium and has artifically became a piece of MasterGear"}],"text":""}']}}, Count: 1b}}
execute at @e[tag=neutroniumboot] positioned -22.53 95.50 326.44 as @e[type=item,tag=neutroniumingot] run summon item ~ ~ ~ {Tags:["craftedneutronium"],Item:{id: "minecraft:netherite_boots", tag: {Enchantments: [{id: "minecraft:blast_protection", lvl: 127s}, {id: "minecraft:depth_strider", lvl: 127s}, {id: "minecraft:feather_falling", lvl: 127s}, {id: "minecraft:fire_protection", lvl: 127s}, {id: "minecraft:mending", lvl: 127s}, {id: "minecraft:projectile_protection", lvl: 127s}, {id: "minecraft:protection", lvl: 127s}, {id: "minecraft:thorns", lvl: 127s}, {id: "minecraft:unbreaking", lvl: 127s}], Unbreakable: 1b, Damage: 0, display: {Name: '{"extra":[{"bold":true,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"color":"gray","text":"Neutronium \'Heldengewand\' Boots"}],"text":""}', Lore: ['{"extra":[{"bold":true,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"color":"gray","text":"These Netherite Boots have been covered with a layer of Neutronium and has artifically became a piece of MasterGear"}],"text":""}']}}, Count: 1b}}
execute at @e[tag=neutroniumsword] positioned -22.53 95.50 326.44 as @e[type=item,tag=neutroniumingot] run summon item ~ ~ ~ {Tags:["craftedneutronium"],Item:{id: "minecraft:netherite_sword", tag: {Enchantments: [{id: "minecraft:bane_of_arthropods", lvl: 127s}, {id: "minecraft:fire_aspect", lvl: 127s}, {id: "minecraft:knockback", lvl: 127s}, {id: "minecraft:looting", lvl: 127s}, {id: "minecraft:mending", lvl: 127s}, {id: "minecraft:sharpness", lvl: 127s}, {id: "minecraft:smite", lvl: 127s}, {id: "minecraft:unbreaking", lvl: 127s}], Unbreakable: 1b, Damage: 0, display: {Name: '{"extra":[{"bold":true,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"color":"gray","text":"Neutronium \'MasterSword\' Sword"}],"text":""}', Lore: ['{"extra":[{"bold":true,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"color":"gray","text":"This Netherite Sword has been covered with a layer of Neutronium and has artifically became a Level 2 Master Sword"}],"text":""}']}}, Count: 1b}}




















execute positioned -22.53 95.50 326.44 as @e[type=item,tag=craftedneutronium] run particle end_rod ~ ~.4 ~ .2 .2 .2 0.1 16
execute positioned -22.53 95.50 326.44 as @e[type=item,tag=craftedneutronium] run playsound item.trident.thunder master @a[distance=..10] ~ ~ ~ 360 1 1
execute as @e[tag=craftedneutronium] as @e[tag=neutroniumingot] run kill @s
execute as @e[tag=craftedneutronium] as @e[tag=neutroniumchest] run kill @s
execute as @e[tag=craftedneutronium] as @e[tag=neutroniumhelmet] run kill @s
execute as @e[tag=craftedneutronium] as @e[tag=neutroniumleg] run kill @s
execute as @e[tag=craftedneutronium] as @e[tag=neutroniumboot] run kill @s
execute as @e[tag=craftedneutronium] as @e[tag=neutroniumsword] run kill @s

execute as @e[tag=craftedneutronium] run tag @s remove craftedneutronium
