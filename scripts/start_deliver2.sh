#!/bin/bash

echo "starting delvery for JaipurToAjmer"

composer transaction submit -c admin@last-mile-delivery-network -d '{
  "$class": "delivery.StartDeliveryTransporter",
  "currentLatitude": 26.78,
  "currentLongitude": 75.89,
  "transporter": "resource:delivery.Transporter#trans2@q3.com",
  "historys": ["resource:delivery.OrderHistory#OrderAjmer1","resource:delivery.OrderHistory#OrderAjmer2"]
}'