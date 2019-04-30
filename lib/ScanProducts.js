/**
 * Sample transaction
 * @param {delivery.ScanProductsInWarehouse} tx
 * @transaction
 */
function ScanProductsInWarehouse(tx){
    var warehouse = tx.warehouse
    var historys = tx.historys
    var orders = tx.orders
    var deliveryId = orders[1].DeliveryId


    // updating warehouse history when orders delivered at warehouses
    return getAssetRegistry('delivery.WarehouseHistory')
    .then(function(assetRegistry){
        if (warehouse.holderId == "ware2@q3.com"){
            return assetRegistry.get("ware2@q3.com")
        }
        if (warehouse.holderId == "ware3@q3.com"){
            return assetRegistry.get("ware3@q3.com")
        }
        })
        .then(function(warehousehistory){
            var lastlevel = warehousehistory.warehouseTransactions.pop()
            lastlevel.isCurrentStatus = false

            var factory3 = getFactory()
            var warehouseTransaction = factory3.newConcept('delivery','WarehouseTransactions')

            var factory4 = getFactory()
            var ordersScanned = factory4.newConcept('delivery','ScannedOrders')
            ordersScanned.DeliveryId = deliveryId
            ordersScanned.orders = orders
            ordersScanned.scannedAt = warehouse

            warehouseTransaction.ordersScanned = ordersScanned
            warehouseTransaction.description = "Orders in delivery id " + deliveryId + " scanned successfully at " + warehouse.name
            warehouseTransaction.location = warehouse.name
            warehouseTransaction.datetime = Date.now()
            warehouseTransaction.level = lastlevel.level + 1
            warehouseTransaction.isCurrentStatus = true

            warehousehistory.warehouseTransactions.push(lastlevel)
            warehousehistory.warehouseTransactions.push(warehouseTransaction)
        
            return getAssetRegistry('delivery.WarehouseHistory')
            .then(function(assetRegistry){
                return assetRegistry.update(warehousehistory)
            })
        })
        .then(function(){
            for (i=0;i < orders.length;i++){
                orders[i].statusId = 2
        
                var previousHistoryField = historys[i].history.pop()
                previousHistoryField.isCurrentStatus = false
        
                var factory2 = getFactory()
                var historyFields = factory2.newConcept('delivery','HistoryFields')
                historyFields.description = "Order "+orders[i].orderId + " scanned successfully at warehouse " + warehouse.holderId
                historyFields.location = orders[i].currentLocationReached
                historyFields.currentLongitude = tx.currentLongitude
                historyFields.currentLatitude = tx.currentLatitude  
                historyFields.datetime = Date.now()
                historyFields.level = previousHistoryField.level + 1
                historyFields.isCurrentStatus = true
        
                historys[i].history.push(previousHistoryField)
                historys[i].history.push(historyFields)
            }
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
        })
    
    }
