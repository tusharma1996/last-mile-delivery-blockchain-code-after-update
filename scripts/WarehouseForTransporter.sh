#!/bin/bash
echo "adding WarehouseForTransporter data"
composer transaction submit -c admin@last-mile-delivery-network -d '{"$class":"org.hyperledger.composer.system.AddParticipant","resources":[
  {
  "$class": "delivery.WarehouseForTransporter",
  "id":1,
  "userId": 11,
  "name": "Ajmer Warehouse",
  "address": "Bhagwan Adinath Marg,Kaiser GanjRd,Parao,Ajmer,Rajasthan 305001",
  "latitude": 26.452610,
  "longitude": 74.635753,
  "number": "9876543210",
  "holderId": "ware3@q3.com",
  "EstimatedTimeForDelivery": "",
  "TransporterName": "trans2@q3.com"
},
{
  "$class": "delivery.WarehouseForTransporter",
  "id":3,
  "userId": 6,
  "name": "Rajasthan Warehouse",
  "address": "Bhawani Singh Road, Jaipur, Rajasthan 302001",
  "latitude": 26.901152,
  "longitude": 75.795674,
  "number": "9876543210",
  "holderId": "ware2@q3.com",
  "EstimatedTimeForDelivery": "",
  "TransporterName": "trans1@q3.com"
}],"targetRegistry":"resource:org.hyperledger.composer.system.ParticipantRegistry#delivery.WarehouseForTransporter"}'

