#!/bin/bash
composer transaction submit -c admin@last-mile-delivery-network -d '{
  "$class": "delivery.DeliverToCustomer",
  "OTP":"3333332",
  "currentLongitude": 0,
  "currentLatitude": 0,
  "courier": "resource:delivery.Transporter#JaipurToCustomer",
  "order": "resource:delivery.Order#OrderJaipur2"
}'

composer transaction submit -c admin@last-mile-delivery-network -d '{
  "$class": "delivery.DeliverToCustomer",
  "OTP":"444444",
  "currentLongitude": 0,
  "currentLatitude": 0,
  "courier": "resource:delivery.Transporter#JaipurToCustomer",
  "order": "resource:delivery.Order#OrderJaipur2"
}'