

execute
    as @e[tag=itemtransporter.itemtransporter.extract] 
    at @s
    run function itemtransporter:impl/itemtransporter/transfer:
        # setup destination
        scoreboard players operation #my_id itemtransporter.math = @s itemtransporter.math
        execute 
            as @e[tag=itemtransporter.itemtransporter.insert] 
            if score #my_id itemtransporter.math = @s itemtransporter.math
            at @s
            positioned ^ ^ ^1
            summon marker 
            run function itemtransporter:impl/itemtransporter/transfer/generate_destination:
                tag @s add itemio.transfer.destination
                tag @s add itemtransporter.temp
                for faceaa in ["north", "east", "south", "west", "up", "down"]:
                    execute 
                        if entity @s[tag=f"itemtransporter.{faceaa}"]
                        run data modify storage itemio:io input_side set value f"{faceaa}"

        
        # transfer
        data remove storage itemio:io filters
        data remove storage itemio:io input
        for faceaa in ["north", "east", "south", "west", "up", "down"]:
            execute 
                if entity @s[tag=f"itemtransporter.{faceaa}"]
                run data modify storage itemio:io output_side set value f"{faceaa}"       
        scoreboard players set #max_output_count itemio.io 1
        execute 
            positioned ^ ^ ^1 
            run function #itemio:calls/transfer  
        #clean up 
        kill @e[type=marker,tag=itemtransporter.temp]




schedule function itemtransporter:impl/20tick 20t replace
