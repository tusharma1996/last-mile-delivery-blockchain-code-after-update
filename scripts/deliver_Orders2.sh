#!/bin/bash

echo "Delivering orders at Ajmer Warehouse by JaipurToAjmer transporter"

composer transaction submit -c admin@last-mile-delivery-network -d '{
  "$class": "delivery.DeliverOrder",
  "currentLatitude": 26.78,
  "currentLongitude": 75.89,
  "transporter": "resource:delivery.Transporter#trans2@q3.com",
  "productHolder": "resource:delivery.Warehouse#ware3@q3.com",
  "historys":["resource:delivery.OrderHistory#OrderAjmer1","resource:delivery.OrderHistory#OrderAjmer2"]
}'