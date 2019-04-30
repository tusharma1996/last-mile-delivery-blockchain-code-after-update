#!/bin/bash

echo "delivering orders by GurgaonToJaipur at JaipurWarehouse"

composer transaction submit -c admin@last-mile-delivery-network -d '{
  "$class": "delivery.DeliverOrder",
  "currentLatitude": 26.78,
  "currentLongitude": 75.89,
  "transporter": "resource:delivery.Transporter#GurgaonToJaipur",
  "productHolder": "resource:delivery.Warehouse#WarehouseJaipur",
  "historys":["resource:delivery.OrderHistory#OrderJaipur1","resource:delivery.OrderHistory#OrderJaipur2","resource:delivery.OrderHistory#OrderJaipur3","resource:delivery.OrderHistory#OrderAjmer1","resource:delivery.OrderHistory#OrderAjmer2"]
}'