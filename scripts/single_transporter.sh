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
  "holderId": "trans1@q3.com",
  "password":"12345"
}],"targetRegistry":"resource:org.hyperledger.composer.system.ParticipantRegistry#delivery.Transporter"}'
