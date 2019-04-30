#!/bin/bash

echo "assigning orders to Transporter JaipurToAjmer "

composer transaction submit -c admin@last-mile-delivery-network -d '{
"$class": "delivery.AssignTransporter",
"currentLatitude": 26.78,
"currentLongitude": 75.89,
"DeliveryId": "DEL02",
"EstimatedTime": 1551425519973,
"historys": [
"resource:delivery.OrderHistory#OrderAjmer1",
"resource:delivery.OrderHistory#OrderAjmer2"
],
"orders": [
"resource:delivery.Order#OrderAjmer1",
"resource:delivery.Order#OrderAjmer2"
],
"ToLocation": "Ajmer Warehouse",
"transporter": "resource:delivery.Transporter#trans2@q3.com"
}'

