

execute 
    as @e[tag=itemtransporter.itemtransporter]
    at @s 
    run function itemtransporter:imp/itemtransporter/tick:
        execute unless predicate itemtransporter:impl/destroy 
            run function itemtransporter:impl/itemtransporter/destroy:
                kill @e[limit=1,type=item,distance=..5,nbt={Age:0s,Item:{id:"minecraft:dropper"}}]
                loot spawn ~ ~ ~ loot itemtransporter:impl/itemtransporter
                kill @s
        data modify storage itemtransporter:main ItemsGUI set from block ~ ~ ~ Items



schedule function itemtransporter:impl/tick 1t replace