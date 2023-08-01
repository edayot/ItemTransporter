

execute
    as @e[tag=itemtransporter.itemtransporter.extract] at @s
    run function itemtransporter:impl/itemtransporter/transfer:
        # setup destination
        scoreboard players operation #my_id itemtransporter.math = @s itemtransporter.math
        execute 
            as @e[tag=itemtransporter.itemtransporter.insert] 
            if score #my_id itemtransporter.math = @s itemtransporter.math at @s
            summon marker run function itemtransporter:impl/itemtransporter/transfer/generate_destination:
                say aaa




schedule function itemtransporter:impl/20tick 20t replace
