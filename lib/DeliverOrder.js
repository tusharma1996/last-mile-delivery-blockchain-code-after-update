/**
 * Sample transaction
 * @param {delivery.DeliverOrder} tx
 * @transaction
 */
async function DeliverOrder(tx){
    var transporter = tx.transporter
    var deliveryId = transporter.DeliveryId
    var productHolder = tx.productHolder
    var historys = tx.historys
    orders = transporter.orders

    async function updatingWarehousehistory(){
        // updating warehouse history when orders delivered at warehouses
    return getAssetRegistry('delivery.WarehouseHistory')
    .then(function(assetRegistry){
        if (transporter.holderId == "trans1@q3.com"){
            return assetRegistry.get("ware2@q3.com")
        }
        if (transporter.holderId == "trans2@q3.com"){
            return assetRegistry.get("ware3@q3.com")
        }
        if (transporter.holderId == "trans3@q3.com"){
            return assetRegistry.get("ware2@q3.com")
        }
        if (transporter.holderId == "trans4@q3.com"){
            return assetRegistry.get("ware3@q3.com")
        }
        })
        .then(function(warehousehistory){
            if(warehousehistory.warehouseTransactions.length > 0){
            var lastlevel = warehousehistory.warehouseTransactions.pop()
            lastlevel.isCurrentStatus = false

            var factory3 = getFactory()
            var warehouseTransaction = factory3.newConcept('delivery','WarehouseTransactions')

            var factory4 = getFactory()
            var ordersReceived = factory4.newConcept('delivery','ReceivedOrders')
            ordersReceived.DeliveryId = transporter.deliveryId
            ordersReceived.orders = orders
            ordersReceived.receivedFrom = productHolder

            warehouseTransaction.ordersReceived = ordersReceived
            warehouseTransaction.description = "Orders in delivery id " + deliveryId + " received from " + transporter.holderId
            warehouseTransaction.location = productHolder.name
            warehouseTransaction.datetime = Date.now()
            warehouseTransaction.level = lastlevel.level + 1
            warehouseTransaction.isCurrentStatus = true

            warehousehistory.warehouseTransactions.push(lastlevel)
            warehousehistory.warehouseTransactions.push(warehouseTransaction)
            }
            else{

            var factory3 = getFactory()
            var warehouseTransaction = factory3.newConcept('delivery','WarehouseTransactions')

            var factory4 = getFactory()
            var ordersReceived = factory4.newConcept('delivery','ReceivedOrders')
            ordersReceived.DeliveryId = deliveryId
            ordersReceived.orders = orders
            ordersReceived.receivedFrom = transporter

            warehouseTransaction.ordersReceived = ordersReceived
            warehouseTransaction.description = "Orders in delivery id " + deliveryId + " received from " + transporter.holderId
            warehouseTransaction.location = productHolder.name
            warehouseTransaction.datetime = Date.now()
            warehouseTransaction.level =  1
            warehouseTransaction.isCurrentStatus = true

            warehousehistory.warehouseTransactions.push(warehouseTransaction)
    
    
            }
            return getAssetRegistry('delivery.WarehouseHistory')
            .then(function(assetRegistry){
                return assetRegistry.update(warehousehistory)
            })
        })
    }
    
    async function updatingTransporter(){

        var factory = getFactory()
        var deliveredOrders = factory.newConcept('delivery','DeliveredOrders')
        deliveredOrders.DeliveryId = transporter.DeliveryId
        deliveredOrders.orders = orders
        deliveredOrders.deliveredTo = productHolder
    
        transporter.deliveredOrders.push(deliveredOrders)
    
        return getParticipantRegistry('delivery.Transporter')
        .then(function(participantRegistry){
            return participantRegistry.update(transporter)
        })
    }
    
        for (i=0;i < orders.length;i++){
            orders[i].holder = productHolder
            orders[i].statusId = 1
            orders[i].currentLocationReached = productHolder.address
            // orders[i].DeliveryId = ""
            
            var previousHistoryField = historys[i].history.pop()
            previousHistoryField.isCurrentStatus = false
    
            var factory2 = getFactory()
            var historyFields = factory2.newConcept('delivery','HistoryFields')
            historyFields.description = "Order delivered to warehouse "+productHolder.holderId
            historyFields.location = orders[i].currentLocationReached
            historyFields.currentLongitude = tx.currentLongitude
            historyFields.currentLatitude = tx.currentLatitude 
            historyFields.datetime = Date.now()
            historyFields.level = previousHistoryField.level + 1
            historyFields.isCurrentStatus = true
    
            historys[i].history.push(previousHistoryField)
            historys[i].history.push(historyFields)
        }

        const updatingWarehousehistoryVar = await updatingWarehousehistory()
        console.log("@debug using updateWarehouseForTransprter "+updatingWarehousehistoryVar)
    
        const updatingTransporterVar = await updatingTransporter()
        console.log("@debug using updatingWarehouseHistory "+updatingTransporterVar) 

        return getAssetRegistry('delivery.OrderHistory')
            .then(function(assetRegistry){
                return assetRegistry.updateAll(historys)
            })
            .then(function(){
               return getAssetRegistry('delivery.Order')
                .then(function(participantRegistry){
                    return participantRegistry.updateAll(orders)
                })
            })  
}
