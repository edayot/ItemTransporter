

def cache_face(block):
    F=["north", "east", "south", "west", "up", "down"]
    for i in range(len(F)):
        execute if block ~ ~ ~ block[facing=F[i]] run scoreboard players set #temp itemtransporter.math i


def add_tag():
    F=["north", "east", "south", "west", "up", "down"]
    for i in range(len(F)):
        execute if score #temp itemtransporter.math matches i run tag @s add f"itemtransporter.{F[i]}"


# @public

execute 
    if data storage smithed.custom_block:main {blockApi:{id:"itemtransporter:itemtransporter"}} 
    run function itemtransporter:impl/itemtransporter/place:

        cache_face("dropper")
        
        execute summon item_display run function itemtransporter:impl/itemtransporter/place_entity:
            add_tag()
            tag @s add itemtransporter.itemtransporter
            tag @s add itemtransporter.itemtransporter.extract

            scoreboard players set @s itemtransporter.math 0

            execute 
                store result score @s itemtransporter.math 
                run data get storage smithed.custom_block:main blockApi.__data.Items[0].tag.itemtransporter.id



            tag @s add itemio.container
            tag @s add itemio.container.nope
            function #itemio:calls/container/destroy
        setblock ~ ~ ~ dropper


            







