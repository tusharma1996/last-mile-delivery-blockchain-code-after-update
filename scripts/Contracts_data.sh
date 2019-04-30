#!/bin/bash
echo "adding Contracts data"
composer transaction submit -c admin@last-mile-delivery-network -d '{"$class":"org.hyperledger.composer.system.AddAsset","resources":[{
  "$class": "delivery.Contract",
  "contractId": "Contract1",
  "pincode": "302002",
  "hubs": [
    {
      "$class": "delivery.Address",
      "name": "North Warehouse",
      "address": "38/6, Delhi - Jaipur Expy, Mohammed Pur, Khandsha, Sector 37, Gurugram, Haryana 122004",
      "latitude": "28.422572",
      "longitude": "77.000422",
      "City": "Gurugram",
      "EstimatedTimeForDelivery": 1555411907000
    },
    {
      "$class": "delivery.Address",
      "name": "Rajasthan Warehouse",
      "address": "Bhawani Singh Road, Jaipur, Rajasthan 302001",
      "latitude": "26.901152",
      "longitude": "75.795674",
      "City": "Jaipur",
      "EstimatedTimeForDelivery": 1555498307000
    }
  ]
},
{
  "$class": "delivery.Contract",
  "contractId": "Contract2",
  "pincode": "305001",
  "hubs": [
    {
      "$class": "delivery.Address",
      "name": "North Warehouse",
      "address": "38/6, Delhi - Jaipur Expy, Mohammed Pur, Khandsha, Sector 37, Gurugram, Haryana 122004",
      "latitude": "28.422572",
      "longitude": "77.000422",
      "City":"Gurugram",
      "EstimatedTimeForDelivery": 1555411907000
    },
    {
      "$class": "delivery.Address",
      "name": "Rajasthan Warehouse",
      "address": "Bhawani Singh Road, Jaipur, Rajasthan 302001",
      "latitude": "26.901152",
      "longitude": "75.795674",
      "City": "Jaipur",
      "EstimatedTimeForDelivery": 1555498307000
    },
    {
      "$class": "delivery.Address",
      "name": "Ajmer Warehouse",
      "address": "Bhagwan Adinath Marg,Kaiser GanjRd,Parao,Ajmer,Rajasthan 305001",
      "latitude": "26.4486874",
      "longitude": "74.6335015",
      "City": "Ajmer",
      "EstimatedTimeForDelivery": 1555584707000
    }
  ]
}],"targetRegistry":"resource:org.hyperledger.composer.system.AssetRegistry#delivery.Contract"}'
