/**
 * Sample transaction
 * @param {delivery.StartDeliveryTransporter} tx
 * @transaction
 */
function StartDelivery(tx){
    var transporter = tx.transporter
    var historys = tx.historys
    var orders = transporter.orders

    if (transporter.holderId == "trans1@q3.com" || transporter.holderId == "trans2@q3.com" ){
        for (i=0;i < historys.length;i++){
            orders[i].statusId = 5
    
            var previousHistoryField = historys[i].history.pop()
            previousHistoryField.isCurrentStatus = false
    
            var factory2 = getFactory()
            var historyFields = factory2.newConcept('delivery','HistoryFields')
            historyFields.description = "Transporter "+transporter.holderId + " started delivery " + transporter.DeliveryId
            historyFields.location = orders[i].currentLocationReached
            historyFields.currentLongitude = tx.currentLongitude
            historyFields.currentLatitude = tx.currentLatitude 
            historyFields.datetime = Date.now()
            historyFields.level = previousHistoryField.level + 1
            historyFields.isCurrentStatus = true
    
            historys[i].history.push(previousHistoryField)
            historys[i].history.push(historyFields)
    
        }
        
        return  getAssetRegistry('delivery.OrderHistory')
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

    if(transporter.holderId == "trans3@q3.com" || transporter.holderId == "trans4@q3.com"){
        return getAssetRegistry('delivery.Order')
        .then(function(assetRegistry){
            return assetRegistry.get(historys[0].historyId)
        })
        .then(function(order){
            order.statusId = 5
    
            var previousHistoryField = historys[0].history.pop()
            previousHistoryField.isCurrentStatus = false
    
            var factory2 = getFactory()
            var historyFields = factory2.newConcept('delivery','HistoryFields')
            historyFields.description = "Transporter "+transporter.holderId + " started delivery " + transporter.DeliveryId
            historyFields.location = order.currentLocationReached
            historyFields.currentLongitude = tx.currentLongitude
            historyFields.currentLatitude = tx.currentLatitude 
            historyFields.datetime = Date.now()
            historyFields.level = previousHistoryField.level + 1
            historyFields.isCurrentStatus = true
    
            historys[0].history.push(previousHistoryField)
            historys[0].history.push(historyFields)

            return getAssetRegistry('delivery.Order')
            .then(function(assetRegistry){
                return assetRegistry.update(order)
            })
            .then(function(){
                return getAssetRegistry('delivery.OrderHistory')
                .then(function(assetRegistry){
                    return assetRegistry.updateAll(historys)
                })
            })
        })
    }

    }
