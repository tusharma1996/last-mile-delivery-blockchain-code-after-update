'use strict';
/**
 * Write your transction processor functions here
 */

/**
 * Sample transaction
 * @param {delivery.PlaceOrder} tx
 * @transaction
 */
function PlaceOrder(tx) {
    var order = tx.order

    var factory2 = getFactory()
    var historyFields = factory2.newConcept('delivery','HistoryFields')
    historyFields.description = "Order placed and packed"
    historyFields.location = order.currentLocationReached
    historyFields.datetime = Date.now()
    historyFields.level = 1
    historyFields.isCurrentStatus = true

    historyId = order.orderId
    var factory1 = getFactory()
    var orderHistory = factory1.newResource('delivery','OrderHistory',historyId)
    orderHistory.history = []
    orderHistory.history.push(historyFields)

    return getAssetRegistry('delivery.WarehouseHistory')
    .then(function(assetRegistry){
        return assetRegistry.get('ware1@q3.com')
    })
    .then(function(warehousehistory){
        if(warehousehistory.warehouseTransactions.length > 0){
            var lastlevel = warehousehistory.warehouseTransactions.pop()
            lastlevel.isCurrentStatus = false

            var factory3 = getFactory()
            var warehouseTransaction = factory3.newConcept('delivery','WarehouseTransactions')
            warehouseTransaction.orderPlaced = factory3.newRelationship('delivery','Order',order.orderId)
            warehouseTransaction.description = "Order " + order.orderId + " Placed in the warehouse"
            warehouseTransaction.location = order.currentLocationReached
            warehouseTransaction.datetime = Date.now()
            warehouseTransaction.level = lastlevel.level + 1
            warehouseTransaction.isCurrentStatus = true

            warehousehistory.warehouseTransactions.push(lastlevel)
            warehousehistory.warehouseTransactions.push(warehouseTransaction)
        }
        else{
            var factory3 = getFactory()
            var warehouseTransaction = factory3.newConcept('delivery','WarehouseTransactions')
            warehouseTransaction.orderPlaced = factory3.newRelationship('delivery','Order',order.orderId)
            warehouseTransaction.description = "Order " + order.orderId + " Placed in the warehouse"
            warehouseTransaction.location = order.currentLocationReached
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
    .then(function(){
        return getAssetRegistry('delivery.OrderHistory')
        .then(function(assetRegistry){
            return assetRegistry.add(orderHistory)
        })
    })
    .then(function(){
        return getAssetRegistry('delivery.Order')
        .then(function(assetRegistry){
           return assetRegistry.add(order)
     })
    })
}