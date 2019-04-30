#!/bin/bash

echo "scanning orders at Ajmer Warehosue"

composer transaction submit -c admin@last-mile-delivery-network -d '{
  "$class": "delivery.ScanProductsInWarehouse",
  "currentLatitude": 26.78,
  "currentLongitude": 75.89,
  "warehouse": "resource:delivery.Warehouse#WarehouseAjmer",
  "orders": ["resource:delivery.Order#OrderAjmer1","resource:delivery.Order#OrderAjmer2"],
  "historys": ["resource:delivery.OrderHistory#OrderAjmer1","resource:delivery.OrderHistory#OrderAjmer2"]
}'