#!/bin/bash

echo "accepting orders by Couriers both"

composer transaction submit -c admin@last-mile-delivery-network -d '{
  "$class": "delivery.AcceptOrder",
  "currentLatitude": 26.78,
  "currentLongitude": 75.89,
  "transporter": "resource:delivery.Transporter#AjmerToCustomer",
  "historys":["resource:delivery.OrderHistory#OrderAjmer1","resource:delivery.OrderHistory#OrderAjmer2"]
}'

composer transaction submit -c admin@last-mile-delivery-network -d '{
  "$class": "delivery.AcceptOrder",
  "currentLatitude": 26.78,
  "currentLongitude": 75.89,
  "transporter": "resource:delivery.Transporter#JaipurToCustomer",
  "historys":["resource:delivery.OrderHistory#OrderJaipur1","resource:delivery.OrderHistory#OrderJaipur2","resource:delivery.OrderHistory#OrderJaipur3"]
}'