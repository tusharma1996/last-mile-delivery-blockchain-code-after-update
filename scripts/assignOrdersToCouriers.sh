#!/bin/bash

echo "assigning orders to Couriers both"

composer transaction submit -c admin@last-mile-delivery-network -d '{
  "$class": "delivery.AssignTransporter",
  "DeliveryId": "DelCourier1",
  "transporter": "resource:delivery.Transporter#trans3@q3.com",
  "EstimatedTime": "23423432",
  "ToLocation": "CustomerJaipur",
  "currentLongitude": 0,
  "currentLatitude": 0,
  "orders": ["resource:delivery.Order#OrderJaipur1","resource:delivery.Order#OrderJaipur2","resource:delivery.Order#OrderJaipur3"],
  "historys": ["resource:delivery.OrderHistory#OrderJaipur1","resource:delivery.OrderHistory#OrderJaipur2","resource:delivery.OrderHistory#OrderJaipur3"]
}'

composer transaction submit -c admin@last-mile-delivery-network -d '{
  "$class": "delivery.AssignTransporter",
  "DeliveryId": "DelCourier2",
  "transporter": "resource:delivery.Transporter#trans4@q3.com",
  "EstimatedTime": "23423432",
  "ToLocation": "CustomerAjmer",
  "currentLongitude": 0,
  "currentLatitude": 0,
  "orders": ["resource:delivery.Order#OrderAjmer1","resource:delivery.Order#OrderAjmer2"],
  "historys": ["resource:delivery.OrderHistory#OrderAjmer1","resource:delivery.OrderHistory#OrderAjmer2"]
}'