

execute 
    as @e[tag=itemtransporter.itemtransporter,predicate=!itemtransporter:impl/destroy]
    at @s 
    run function itemtransporter:impl/itemtransporter/destroy:
        kill @e[limit=1,type=item,distance=..5,nbt={Age:0s,Item:{id:"minecraft:dropper"}}]
        loot spawn ~ ~ ~ loot itemtransporter:impl/itemtransporter
        kill @s


schedule function itemtransporter:impl/tick 1t replace