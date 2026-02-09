execute run item replace entity @a[scores={totemused=1,holdingtotem=1},tag=!totemban] weapon.offhand with minecraft:totem_of_undying{Enchantments:[{lvl:1s,id:"minecraft:infinity"}]}
execute run item replace entity @a[scores={totemused=1,holdingtotem=2},tag=!totemban] weapon.mainhand with minecraft:totem_of_undying{Enchantments:[{lvl:1s,id:"minecraft:infinity"}]}

scoreboard players set @a holdingtotem 0
scoreboard players set @a[tag=!totemban,nbt={Inventory:[{Slot:-106b,id:"minecraft:totem_of_undying",tag:{Enchantments:[{id:"minecraft:infinity"}]}}]}] holdingtotem 1
scoreboard players set @a[tag=!totemban,nbt={SelectedItem:{id:"minecraft:totem_of_undying",tag:{Enchantments:[{id:"minecraft:infinity"}]}}}] holdingtotem 2

scoreboard players set @a totemused 0