#!/bin/bash

echo "Delivering orders at Ajmer Warehouse by JaipurToAjmer transporter"

composer transaction submit -c admin@last-mile-delivery-network -d '{
  "$class": "delivery.DeliverOrder",
  "currentLatitude": 26.78,
  "currentLongitude": 75.89,
  "transporter": "resource:delivery.Transporter#JaipurToAjmer",
  "productHolder": "resource:delivery.Warehouse#WarehouseAjmer",
  "historys":["resource:delivery.OrderHistory#OrderAjmer1","resource:delivery.OrderHistory#OrderAjmer2"]
}'