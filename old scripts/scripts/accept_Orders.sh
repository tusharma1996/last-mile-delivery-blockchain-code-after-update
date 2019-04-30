#!/bin/bash

echo "accepting orders for GurgaonToJaipur"
composer transaction submit -c admin@last-mile-delivery-network -d '{
  "$class": "delivery.AcceptOrder",
  "currentLatitude": 26.78,
  "currentLongitude": 75.89,
  "transporter": "resource:delivery.Transporter#GurgaonToJaipur",
  "historys":["resource:delivery.OrderHistory#OrderAjmer1","resource:delivery.OrderHistory#OrderAjmer2","resource:delivery.OrderHistory#OrderJaipur1","resource:delivery.OrderHistory#OrderJaipur2","resource:delivery.OrderHistory#OrderJaipur3"]
}'