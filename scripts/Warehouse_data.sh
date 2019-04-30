#!/bin/bash
# Warehouses
#composer participant add -c admin@last-mile-delivery-network -d '{"$class":"delivery.Warehouse","userId":11,"name":"Ajmer Warehouse","address":"Bhagwan Adinath Marg,Kaiser GanjRd,Parao,Ajmer,Rajasthan 305001","latitude":26.4486874,"longitude":74.6335015,"number":"9876543210L","holderId":"WarehouseAjmer"}'
#composer participant add -c admin@last-mile-delivery-network -d '{"$class":"delivery.Warehouse","userId":6,"name":"Rajasthan Warehouse","address":"Bhawani Singh Road, Jaipur, Rajasthan 302001","latitude":28.0216219,"longitude":73.2845209,"number":"9876543210L","holderId":"WarehouseJaipur"}'
#composer participant add -c admin@last-mile-delivery-network -d '{"$class":"delivery.Warehouse","userId":2,"name":"North Warehouse","address":"38/6, Delhi - Jaipur Expy, Mohammed Pur, Khandsha, Sector 37, Gurugram, Haryana 122004","latitude":30.8908227,"longitude":75.8391252,"number":"9876543210L","holderId":"WarehouseGurgaon"}'

# Transporters
#composer participant add -c admin@last-mile-delivery-network -d '{"$class":"delivery.Transporter","DriverFirstName":"Charlie","DriverLastName":"Day","TransporterName":"BalajiLtd.","VehicleNumber":"323423","VehicleId":"2323","emailId":"trans1@q3.co","DeliveryId":"","StatusId":0,"Time":"","location":"Gurgaon","holderId":"GurgaonToJaipur"}'
#composer participant add -c admin@last-mile-delivery-network -d '{"$class":"delivery.Transporter","DriverFirstName":"Andy","DriverLastName":"Garcia","TransporterName":"K.K.Sons","VehicleNumber":"323423","VehicleId":"2423","emailId":"trans2@q3.co","DeliveryId":"","StatusId":0,"Time":"","location":"Jaipur","holderId":"JaipurToAjmer"}'

#Warehouses

echo "adding Warehouse data"
composer transaction submit -c admin@last-mile-delivery-network -d '{"$class":"org.hyperledger.composer.system.AddParticipant","resources":[{
  "$class": "delivery.Warehouse",
  "id":1,
  "userId": 11,
  "name": "Ajmer Warehouse",
  "address": "Bhagwan Adinath Marg,Kaiser GanjRd,Parao,Ajmer,Rajasthan 305001",
  "latitude": 26.4486874,
  "longitude": 74.6335015,
  "number": "9876543210",
  "holderId": "ware3@q3.com",
  "password": "12345"
},
{ 
  "$class": "delivery.Warehouse",
   "id":2,
  "userId": 2,
  "name": "North Warehouse",
  "address": "38/6, Delhi - Jaipur Expy, Mohammed Pur, Khandsha, Sector 37, Gurugram, Haryana 122004",
  "latitude": 28.422572,
  "longitude": 77.000422,
  "number": "9876543210",
  "holderId": "ware1@q3.com",
  "password": "12345"
},
{
  "$class": "delivery.Warehouse",
   "id":3,
  "userId": 6,
  "name": "Rajasthan Warehouse",
  "address": "Bhawani Singh Road, Jaipur, Rajasthan 302001",
  "latitude": 26.901152,
  "longitude": 75.795674,
  "number": "9876543210",
  "holderId": "ware2@q3.com",
  "password": "12345"
}],"targetRegistry":"resource:org.hyperledger.composer.system.ParticipantRegistry#delivery.Warehouse"}'

