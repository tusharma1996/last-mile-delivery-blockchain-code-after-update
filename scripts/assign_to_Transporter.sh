#!/bin/bash
echo "assign orders to transporter GurgaonToJaipur"

composer transaction submit -c admin@last-mile-delivery-network -d '{
"$class": "delivery.AssignTransporter",
"currentLatitude": 26.78,
"currentLongitude": 75.89,
"DeliveryId": "DEL01",
"EstimatedTime": 1551425519973,
"historys": [
"resource:delivery.OrderHistory#OrderJaipur1",
"resource:delivery.OrderHistory#OrderJaipur2",
"resource:delivery.OrderHistory#OrderJaipur3",
"resource:delivery.OrderHistory#OrderAjmer1",
"resource:delivery.OrderHistory#OrderAjmer2"
],
"orders": [
"resource:delivery.Order#OrderJaipur1",
"resource:delivery.Order#OrderJaipur2",
"resource:delivery.Order#OrderJaipur3",
"resource:delivery.Order#OrderAjmer1",
"resource:delivery.Order#OrderAjmer2"
],
"ToLocation": "Jaipur Warehouse",
"transporter": "resource:delivery.Transporter#trans1@q3.com"
}'
