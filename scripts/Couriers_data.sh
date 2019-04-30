#!/bin/bash
composer transaction submit -c admin@last-mile-delivery-network -d '{"$class":"org.hyperledger.composer.system.AddParticipant","resources":[{
  "$class": "delivery.Courier",
  "DriverFirstName": "Michael",
  "DriverLastName": "Sheen",
  "TransporterName": "Hariram Pvt. Ltd..",
  "VehicleNumber": "32342DF3",
  "VehicleId": "232SDF3",
  "emailId": "trans3@q3.com",
  "DeliveryId": "",
  "orders": [],
  "deliveredOrders":[],
  "StatusId": 0,
  "location": "",
  "holderId": "JaipurToCustomer"
  "password": "12345"
},
{
  "$class": "delivery.Courier",
  "DriverFirstName": "Idris",
  "DriverLastName": "Alba",
  "TransporterName": "Pardesi Ltd.(C)",
  "VehicleNumber": "32A423",
  "VehicleId": "24SDF23",
  "emailId": "trans4@q3.com",
  "DeliveryId": "",
  "orders": [],
  "deliveredOrders":[],
  "StatusId": 0,
  "location": "",
  "holderId": "AjmerToCustomer"
  "password": "12345"
}],"targetRegistry":"resource:org.hyperledger.composer.system.ParticipantRegistry#delivery.Courier"}'
