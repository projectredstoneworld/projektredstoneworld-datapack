execute store result score #px tagcoords run data get entity @s Pos[0] 100
execute store result score #py tagcoords run data get entity @s Pos[1] 100
execute store result score #pz tagcoords run data get entity @s Pos[2] 100

execute store result score #dx tagcoords run data get entity @a[tag=pontokanear,limit=1] Pos[0] 100
execute store result score #dy tagcoords run data get entity @a[tag=pontokanear,limit=1] Pos[1] 100
execute store result score #dz tagcoords run data get entity @a[tag=pontokanear,limit=1] Pos[2] 100

scoreboard players operation #dx tagcoords -= #px tagcoords
scoreboard players operation #dy tagcoords -= #py tagcoords
scoreboard players operation #dz tagcoords -= #pz tagcoords

scoreboard players operation #pythagx info = #dx tagcoords
scoreboard players operation #pythagy info = #dx tagcoords
scoreboard players operation #pythagz info = #dx tagcoords
function projektredstoneworld:pythag

scoreboard players operation #sqrtmod info = #sqrt info
scoreboard players operation #sqrtmod info %= 100 CONSTANTS
scoreboard players operation #sqrt info /= 100 CONSTANTS
execute if score #sqrtmod info matches ..9 run title @s actionbar [{"text":"Nearest player: ","color":"#00BBFF"},{"selector":"@a[tag=pontokanear]"},{"text":" - "},{"text":"X: "},{"score":{"name":"#nearx","objective":"tagcoords"}},{"text":" Y: "},{"score":{"name":"#nearx","objective":"tagcoords"}},{"text":" Z: "},{"score":{"name":"#nearx","objective":"tagcoords"}},{"text":" - Distance: "},{"score":{"name":"#sqrt","objective":"info"}},{"text":".0"},{"score":{"name":"#sqrtmod","objective":"info"}}]
execute if score #sqrtmod info matches 10.. run title @s actionbar [{"text":"Nearest player: ","color":"#00BBFF"},{"selector":"@a[tag=pontokanear]"},{"text":" - "},{"text":"X: "},{"score":{"name":"#nearx","objective":"tagcoords"}},{"text":" Y: "},{"score":{"name":"#nearx","objective":"tagcoords"}},{"text":" Z: "},{"score":{"name":"#nearx","objective":"tagcoords"}},{"text":" - Distance: "},{"score":{"name":"#sqrt","objective":"info"}},{"text":"."},{"score":{"name":"#sqrtmod","objective":"info"}}]
