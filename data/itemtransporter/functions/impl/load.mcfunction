



scoreboard objectives add itemtransporter.math dummy

data modify storage itemtransporter:main ItemsNBT.itemtransporter set value {
    id:"minecraft:furnace",
    Count:1b,
    tag:{
        ctc:{id:"itemtransporter",from:"airdox_:itemtransporter",traits:{"block":1b}},
        BlockEntityTag:{
            Items:[
                {id:"minecraft:stone",Count:1b,Slot:0b,tag:{
                    smithed:{block:{id:"itemtransporter:itemtransporter"}}
                    }}]},
        display:{Name:'{"translate":"itemtransporter.itemtransporter","color":"white","italic":false}'}}
    }


schedule function itemtransporter:impl/tick 1t replace
schedule function itemtransporter:impl/20tick 20t replace