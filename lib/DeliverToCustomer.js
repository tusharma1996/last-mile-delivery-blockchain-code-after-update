/**
 * Sample transaction
 * @param {delivery.DeliverToCustomer} tx
 * @transaction
 */
function DeliverToCustomer(tx){
    var OTP = tx.OTP
    var courier = tx.courier
    var order = tx.order

        return getParticipantRegistry('delivery.Customer')
        .then(function(participantRegistry){
            if(OTP == '1111' && order.orderId == 'OrderAjmer1'){
                return participantRegistry.get('CustomerAjmer1')
            }

            if(OTP == '1111' && order.orderId == 'OrderAjmer2'){
                return participantRegistry.get('CustomerAjmer2')
            }

            if(OTP == '1111' && order.orderId == 'OrderJaipur1'){
                return participantRegistry.get('CustomerJaipur1')
            }

            if(OTP == '1111' && order.orderId == 'OrderJaipur2'){
                return participantRegistry.get('CustomerJaipur2')
            }

            if(OTP == '1111' && order.orderId == 'OrderJaipur3'){
                return participantRegistry.get('CustomerJaipur3')
            }        
        })
        .then(function(customer){
            if(typeof customer !== 'undefined'){  

                order.holder = customer
                order.statusId = 6
                order.currentLocationReached = order.buyerAddress
    
                return getAssetRegistry('delivery.Order')
                .then(function(assetRegistry){
                    return assetRegistry.update(order)
                })
                .then(function(){
                    return getAssetRegistry('delivery.OrderHistory')
                    .then(function(assetRegistry){
                        return assetRegistry.get(order.orderId)
                    })
                    .then(function(orderHistory){
                        var previousHistoryField = orderHistory.history.pop()
                        previousHistoryField.isCurrentStatus = false
                
                        var factory2 = getFactory()
                        var historyFields = factory2.newConcept('delivery','HistoryFields')
                        historyFields.description = "Order delivered to Customer "+customer.holderId
                        historyFields.location = customer.buyerAddress
                        historyFields.currentLongitude = tx.currentLongitude
                        historyFields.currentLatitude = tx.currentLatitude 
                        historyFields.datetime = Date.now()
                        historyFields.level = previousHistoryField.level + 1
                        historyFields.isCurrentStatus = true
                
                        orderHistory.history.push(previousHistoryField)
                        orderHistory.history.push(historyFields)
        
                        return getAssetRegistry('delivery.OrderHistory')
                        .then(function(assetRegistry){
                            return assetRegistry.update(orderHistory)
                        })
                    })
            })
            .then(function(){
                    var factory = getFactory()
                    var deliveredOrders = factory.newConcept('delivery','DeliveredOrders')
                    deliveredOrders.DeliveryId = courier.DeliveryId
                    deliveredOrders.orders = []
                    deliveredOrders.orders.push(order)
                    deliveredOrders.deliveredTo = customer
        
                    courier.deliveredOrders.push(deliveredOrders)
        
                    return getParticipantRegistry('delivery.Transporter')
                    .then(function(participantRegistry){
                        return participantRegistry.update(courier)
                    })
            })
            }
            else{

                throw "wrong OTP, please try again"
            }
        })
}