#!/bin/bash
composer transaction submit -c admin@last-mile-delivery-network -d '{
 "$class": "org.hyperledger.composer.system.AddParticipant",
 "resources": [
  {
   "$class": "delivery.CustomerForCourier",
   "EstimatedTimeForDelivery": "",
   "CourierName": "",
  "buyerName": "ExxonMobil",
  "latitude": 26.456118,
  "longitude": 74.6260124,
  "buyerCity": "Ajmer",
  "buyerState": "Rajasthan",
  "buyerAddress": "111, Faiz Manzil, Nathwan Shah, Dargah Sharif, Khadim Mohalla, Ajmer, Rajasthan 305001",
  "contactNo": "9876543210",
  "holderId": "CustomerAjmer"
  "password": "12345"
  },
    {
   "$class": "delivery.CustomerForCourier",
   "EstimatedTimeForDelivery": "",
   "CourierName": "",
  "buyerName": "CVS Health",
  "latitude": 26.9535678,
  "longitude": 75.8437479,
  "buyerCity": "Jaipur",
  "buyerState": "Rajasthan",
  "buyerAddress": "Sri Krishna Service Station Amer Road Inside Hpcl, Opp Jal Mahal & Man Sagar Lake, Parasrampuri, Jaipur, Rajasthan 302002",
  "contactNo": "9876543210",
  "holderId": "CustomerJaipur"
  }
 ],
 "targetRegistry": "resource:org.hyperledger.composer.system.ParticipantRegistry#delivery.CustomerForCourier"
}'