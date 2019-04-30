#!/bin/bash
echo "adding Transporter and Courier data"
composer transaction submit -c admin@last-mile-delivery-network -d '{"$class":"org.hyperledger.composer.system.AddParticipant","resources":[{
  "$class": "delivery.Transporter",
  "DriverFirstName": "Raj",
  "DriverLastName": "Mehta",
  "TransporterName": "Balaji Ltd.",
  "VehicleNumber": "Vn1234",
  "VehicleId": "V123",
  "emailId": "trans1@q3.com",
  "DeliveryId": "",
  "orders": [],
  "deliveredOrders":[],
  "location": "",
  "holderId": "GurgaonToJaipur"
},
{
  "$class": "delivery.Transporter",
  "DriverFirstName": "Ravi",
  "DriverLastName": "Yadav",
  "TransporterName": "K.K.Sons",
  "VehicleNumber": "Vn2345",
  "VehicleId": "V234",
  "emailId": "trans2@q3.com",
  "DeliveryId": "",
  "orders": [],
  "deliveredOrders":[],
  "location": "",
  "holderId": "JaipurToAjmer"
},
{
  "$class": "delivery.Transporter",
  "DriverFirstName": "Manish",
  "DriverLastName": "Vyas",
  "TransporterName": "Hariram Pvt. Ltd..",
  "VehicleNumber": "Vn3456",
  "VehicleId": "V345",
  "emailId": "trans3@q3.com",
  "DeliveryId": "",
  "orders": [],
  "deliveredOrders":[],
  "location": "",
  "holderId": "JaipurToCustomer"
},
{
  "$class": "delivery.Transporter",
  "DriverFirstName": "Vivek",
  "DriverLastName": "Gupta",
  "TransporterName": "Pardesi Ltd.(C)",
  "VehicleNumber": "Vn4567",
  "VehicleId": "V456",
  "emailId": "trans4@q3.com",
  "DeliveryId": "",
  "orders": [],
  "deliveredOrders":[],
  "location": "",
  "holderId": "AjmerToCustomer"
}],"targetRegistry":"resource:org.hyperledger.composer.system.ParticipantRegistry#delivery.Transporter"}'