/**
 * Sample transaction
 * @param {delivery.AcceptOrder} tx
 * @transaction
 */
function AcceptOrder(tx){
    var transporter = tx.transporter  
    var orders = transporter.orders
    var historys = tx.historys
    
    for (i=0;i < orders.length;i++){
        orders[i].statusId = 4
        
        var previousHistoryField = historys[i].history.pop()
        previousHistoryField.isCurrentStatus = false

        var factory2 = getFactory()
        var historyFields = factory2.newConcept('delivery','HistoryFields')
        historyFields.description = "Order accepted by transporter "+transporter.holderId
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
}