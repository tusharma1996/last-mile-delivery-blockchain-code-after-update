/**
 * Sample transaction
 * @param {delivery.AssignTransporter} tx
 * @transaction
 */
 async function AssignTransporter(tx){
    var deliveryId = tx.DeliveryId
    console.log("@debug 1 "+deliveryId)
    var estimatedTime = tx.EstimatedTime
    console.log("@debug 2 "+estimatedTime)
    var location = tx.ToLocation
    console.log("@debug 3 "+location)
    var orders = tx.orders
    console.log("@debug 4 "+orders)
    var historys = tx.historys
    console.log("@debug 5 "+historys)
    var transporter = tx.transporter
    console.log("@debug 501 "+transporter)


    transporter.DeliveryId = deliveryId
    transporter.location = location
    transporter.EstimatedTimeForDelivery = estimatedTime
    transporter.orders = orders  

    async function updateWarehouseForTransporter(){
        // Updating warehouse for transporter for two different transporters
        console.log("@debug executring updateWarehouseForTransporter function")
        return getParticipantRegistry('delivery.WarehouseForTransporter')
        .then(function(participantRegistry){
            console.log("@debug 6"+participantRegistry)
            if (transporter.holderId == "trans1@q3.com"){
                console.log("@debug 7"+transporter.holderId)
                return participantRegistry.get("ware2@q3.com")
            }
            if (transporter.holderId == "trans2@q3.com"){
                console.log("@debug 8"+transporter.holderId)
                return participantRegistry.get("ware3@q3.com")
            }
        })
        .then(function(warehouseForTransporter){
            console.log("@debug 9"+warehouseForTransporter)
    
            if(typeof warehouseForTransporter !== 'undefined'){
            warehouseForTransporter.EstimatedTimeForDelivery = estimatedTime
            console.log("@debug 10 "+warehouseForTransporter.EstimatedTimeForDelivery)
    
            warehouseForTransporter.TransporterName = transporter.holderId
            console.log("@debug 11 "+warehouseForTransporter.TransporterName)
    
            return getParticipantRegistry('delivery.WarehouseForTransporter')
                .then(function(participantRegistry){
                    console.log("@debug 12 "+warehouseForTransporter)
                    return participantRegistry.update(warehouseForTransporter)
            })
            }
            else {
                console.log("@debug 13 ")
                return null
                
            }
        })
    }
    
    async function updatingWarehouseHistory(){
        // updating warehouse history when orders assigned to transporter    
        return getAssetRegistry('delivery.WarehouseHistory')
        .then(function(assetRegistry){
            if (transporter.holderId == "trans1@q3.com"){
                console.log("@debug 14 "+transporter.holderId)
                return assetRegistry.get("ware1@q3.com")
            }
            if (transporter.holderId == "trans2@q3.com"){
                console.log("@debug 15 "+transporter.holderId)
                return assetRegistry.get("ware2@q3.com")
            }
            if (transporter.holderId == "trans3@q3.com"){
                console.log("@debug 16 "+transporter.holderId)
                return assetRegistry.get("ware2@q3.com")
            }
            if (transporter.holderId == "trans4@q3.com"){
                console.log("@debug 17 "+transporter.holderId)
                return assetRegistry.get("ware3@q3.com")
            }
        })
        .then(function(warehousehistory){
            console.log("@debug 18 "+warehousehistory)
            console.log("@debug 19 "+warehousehistory.warehouseTransactions.length)
    
            if(warehousehistory.warehouseTransactions.length > 0){
                var lastlevel = warehousehistory.warehouseTransactions.pop()
                console.log("@debug 20 "+lastlevel)
                lastlevel.isCurrentStatus = false
    
                var factory3 = getFactory()
                var warehouseTransaction = factory3.newConcept('delivery','WarehouseTransactions')
    
                var factory4 = getFactory()
                var ordersAssigned = factory4.newConcept('delivery','AssignedOrders')
                ordersAssigned.DeliveryId = deliveryId
                console.log("@debug 21 "+ordersAssigned.DeliveryId)
    
                ordersAssigned.orders = orders
                console.log("@debug 22 "+ordersAssigned.orders)
    
                ordersAssigned.assignedTo = transporter
                console.log("@debug 23 "+ordersAssigned.assignedTo)
    
                warehouseTransaction.ordersAssigned = ordersAssigned
                console.log("@debug 24 "+warehouseTransaction.ordersAssigned)
    
                warehouseTransaction.description = "Orders in delivery id " + deliveryId + " assigned to the " + transporter.holderId
                console.log("@debug 25 "+warehouseTransaction.description)
    
                warehouseTransaction.location = location
                console.log("@debug 26 "+warehouseTransaction.location)
    
                warehouseTransaction.datetime = Date.now()
                console.log("@debug 27 "+warehouseTransaction.datetime)
    
                warehouseTransaction.level = lastlevel.level + 1
                console.log("@debug 28 "+warehouseTransaction.datetime)
    
                warehouseTransaction.isCurrentStatus = true
                console.log("@debug 29 "+warehouseTransaction.isCurrentStatus)
    
                warehousehistory.warehouseTransactions.push(lastlevel)
                warehousehistory.warehouseTransactions.push(warehouseTransaction)
    
                console.log("@debug 30 "+warehousehistory.warehouseTransactions)
                console.log("@debug 31 "+warehousehistory)
    
                return getAssetRegistry('delivery.WarehouseHistory')
                .then(function(assetRegistry){
                    return assetRegistry.update(warehousehistory)
                })
            }
    
            else{
                var factory3 = getFactory()
                var warehouseTransaction = factory3.newConcept('delivery','WarehouseTransactions')
    
                var factory4 = getFactory()
                var ordersAssigned = factory4.newConcept('delivery','DeliveredOrders')
                console.log("@debug 32 "+ordersAssigned)
    
                ordersAssigned.DeliveryId = deliveryId
                console.log("@debug 33 "+ordersAssigned.DeliveryId)
    
                ordersAssigned.orders = orders
                console.log("@debug 34 "+ordersAssigned.orders)
    
                ordersAssigned.deliveredTo = transporter
                console.log("@debug 35 "+ordersAssigned.orders.deliveredTo)
    
    
                warehouseTransaction.ordersAssigned = ordersAssigned
                console.log("@debug 36 "+warehouseTransaction.ordersAssigned)
    
                warehouseTransaction.description = "Orders in delivery id " + deliveryId + " assigned to the " + transporter.holderId
                console.log("@debug 37 "+warehouseTransaction.description)
    
                warehouseTransaction.location = location
                console.log("@debug 38 "+warehouseTransaction.location)
    
                warehouseTransaction.datetime = Date.now()
                console.log("@debug 38 "+warehouseTransaction.datetime)
    
                warehouseTransaction.level =  1
                console.log("@debug 39 "+warehouseTransaction.level)
    
                warehouseTransaction.isCurrentStatus = true
                console.log("@debug 40 "+warehouseTransaction.isCurrentStatus)
    
                warehousehistory.warehouseTransactions.push(warehouseTransaction)  
                console.log("@debug 41 "+warehousehistory)    
            
                return getAssetRegistry('delivery.WarehouseHistory')
                .then(function(assetRegistry){
                    return assetRegistry.update(warehousehistory)
                })
            }
    
        })
    }

        for (i=0;i < orders.length;i++){
                console.log("@debug 42 "+i+" "+orders.length)
                orders[i].holder = transporter
                orders[i].statusId = 3
                orders[i].currentLocationReached = transporter.holderId
                orders[i].DeliveryId = deliveryId
                orders[i].ToLocation = location
                var previousHistoryField = historys[i].history.pop()
                previousHistoryField.isCurrentStatus = false
        
                var factory2 = getFactory()
                var historyFields = factory2.newConcept('delivery','HistoryFields')
                historyFields.description = "Order assigned to transporter "+transporter.holderId
                historyFields.location = orders[i].currentLocationReached
                historyFields.currentLongitude = tx.currentLongitude
                historyFields.currentLatitude = tx.currentLatitude 
                historyFields.datetime = Date.now()
                historyFields.level = previousHistoryField.level + 1
                historyFields.isCurrentStatus = true
        
        
                historys[i].history.push(previousHistoryField)
                historys[i].history.push(historyFields)
            }

            const updateWarehouseForTransporterVar = await updateWarehouseForTransporter()
            console.log("@debug using updateWarehouseForTransprter "+updateWarehouseForTransporterVar)
        
            const updatingWarehouseHistoryVar = await updatingWarehouseHistory()
            console.log("@debug using updatingWarehouseHistory "+updatingWarehouseHistoryVar) 

            return getAssetRegistry('delivery.Order')
                .then(function(assetRegistry){
                    console.log("@debug 45 "+orders)
                    return assetRegistry.updateAll(orders)
                })
                .then(function(){
                   return getAssetRegistry('delivery.OrderHistory')
                    .then(function(assetRegistry){
                        console.log("@debug 44 "+historys)
                        return assetRegistry.updateAll(historys)
                    })
                })
                .then(function(){
                    return getParticipantRegistry('delivery.Transporter')
                    .then(function(participantRegistry){
                        console.log("@debug 43 "+transporter)
                        return participantRegistry.update(transporter)
                    })
                })




}

