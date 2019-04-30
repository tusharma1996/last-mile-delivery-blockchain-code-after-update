#!/bin/bash
echo "adding Customer data"
composer transaction submit -c admin@last-mile-delivery-network -d '{"$class":"org.hyperledger.composer.system.AddParticipant","resources":[
{
  "$class": "delivery.Customer",
  "buyerName": "Koolwal Electronics",
  "latitude": 26.9535678,
  "longitude": 75.8437479,
  "buyerCity": "Jaipur",
  "buyerState": "Rajasthan",
  "buyerAddress": "Shop No A 16-17, Radio Market, Nehru Bazar, Radio Market, Jaipur, Rajasthan 302002",
  "contactNo": "9876543210",
  "holderId": "CustomerJaipur1"
},
{
  "$class": "delivery.Customer",
  "buyerName": "Shri Gupta Electronics",
  "latitude": 26.922973,
  "longitude": 75.826611,
  "buyerCity": "Jaipur",
  "buyerState": "Rajasthan",
  "buyerAddress": "Jagdish Colony Rd, Kailashpuri, Ramgarhmode, Kagdiwara, Brahampuri, Jaipur, Rajasthan 302002",
  "contactNo": "9876543210",
  "holderId": "CustomerJaipur2"
},
{
  "$class": "delivery.Customer",
  "buyerName": "Shikha Electronics",
  "latitude": 26.9535678,
  "longitude": 75.8437479,
  "buyerCity": "Jaipur",
  "buyerState": "Rajasthan",
  "buyerAddress": "1126, Main Subhash Chowk Circle, Subhash Chowk, Jaipur, Rajasthan 302002",
  "contactNo": "9876543210",
  "holderId": "CustomerJaipur3"
},
{
  "$class": "delivery.Customer",
  "buyerName": "Splash Mobile Shop",
  "latitude": 26.456118,
  "longitude": 74.6260124,
  "buyerCity": "Ajmer",
  "buyerState": "Rajasthan",
  "buyerAddress": "Opp Elite Restaurant, Station Road, Ajmer, Rajasthan 305001",
  "contactNo": "9876543210",
  "holderId": "CustomerAjmer1"
},
{
  "$class": "delivery.Customer",
  "buyerName": "Rajputana Automobiles",
  "latitude": 26.456118,
  "longitude": 74.6260124,
  "buyerCity": "Ajmer",
  "buyerState": "Rajasthan",
  "buyerAddress": "Kutchery Road, Mahatma Gandhi Marg, Ajmer, Rajasthan 305001",
  "contactNo": "9876543210",
  "holderId": "CustomerAjmer2"
}],"targetRegistry":"resource:org.hyperledger.composer.system.ParticipantRegistry#delivery.Customer"}'
