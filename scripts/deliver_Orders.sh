#!/bin/bash

echo "delivering orders by GurgaonToJaipur at JaipurWarehouse"

composer transaction submit -c admin@last-mile-delivery-network -d '{
  "$class": "delivery.DeliverOrder",
  "currentLatitude": 26.78,
  "currentLongitude": 75.89,
  "transporter": "resource:delivery.Transporter#trans1@q3.com",
  "productHolder": "resource:delivery.Warehouse#ware2@q3.com",
  "historys":["resource:delivery.OrderHistory#OrderJaipur1","resource:delivery.OrderHistory#OrderJaipur2","resource:delivery.OrderHistory#OrderJaipur3","resource:delivery.OrderHistory#OrderAjmer1","resource:delivery.OrderHistory#OrderAjmer2"]
}'