#!/bin/bash

echo "scanning orders at Jaipur Warehouse"

composer transaction submit -c admin@last-mile-delivery-network -d '{
  "$class": "delivery.ScanProductsInWarehouse",
  "currentLatitude": 26.78,
  "currentLongitude": 75.89,
  "warehouse": "resource:delivery.Warehouse#ware2@q3.com",
  "orders": ["resource:delivery.Order#OrderAjmer1","resource:delivery.Order#OrderAjmer2","resource:delivery.Order#OrderJaipur1","resource:delivery.Order#OrderJaipur2","resource:delivery.Order#OrderJaipur3"],
  "historys": ["resource:delivery.OrderHistory#OrderAjmer1","resource:delivery.OrderHistory#OrderAjmer2","resource:delivery.OrderHistory#OrderJaipur1","resource:delivery.OrderHistory#OrderJaipur2","resource:delivery.OrderHistory#OrderJaipur3"]
}'