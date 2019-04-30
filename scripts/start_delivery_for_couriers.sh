#!/bin/bash

echo "starting delivery for both couriers"

echo  "  "

echo "First delivery for JaipurToCustomer"
composer transaction submit -c admin@last-mile-delivery-network -d '{
  "$class": "delivery.StartDeliveryTransporter",
  "currentLatitude": 26.78,
  "currentLongitude": 75.89,
  "transporter": "resource:delivery.Transporter#trans3@q3.com",
  "historys": ["resource:delivery.OrderHistory#OrderJaipur1"]
}'

echo "Wrong Password"

composer transaction submit -c admin@last-mile-delivery-network -d '{
  "$class": "delivery.DeliverToCustomer",
  "OTP":"3333332",
  "currentLongitude": 0,
  "currentLatitude": 0,
  "courier": "resource:delivery.Transporter#trans3@q3.com",
  "order": "resource:delivery.Order#OrderJaipur1"
}'

echo "Correct Password"
composer transaction submit -c admin@last-mile-delivery-network -d '{
  "$class": "delivery.DeliverToCustomer",
  "OTP":"1111",
  "currentLongitude": 0,
  "currentLatitude": 0,
  "courier": "resource:delivery.Transporter#trans3@q3.com",
  "order": "resource:delivery.Order#OrderJaipur1"
}'

echo "Second Delivery For JaipurToCustomer"

composer transaction submit -c admin@last-mile-delivery-network -d '{
  "$class": "delivery.StartDeliveryTransporter",
  "currentLatitude": 26.78,
  "currentLongitude": 75.89,
  "transporter": "resource:delivery.Transporter#trans3@q3.com",
  "historys": ["resource:delivery.OrderHistory#OrderJaipur2"]
}'

echo "Wrong Password"

composer transaction submit -c admin@last-mile-delivery-network -d '{
  "$class": "delivery.DeliverToCustomer",
  "OTP":"3333332",
  "currentLongitude": 0,
  "currentLatitude": 0,
  "courier": "resource:delivery.Transporter#trans3@q3.com",
  "order": "resource:delivery.Order#OrderJaipur2"
}'

echo "Correct Password"

composer transaction submit -c admin@last-mile-delivery-network -d '{
  "$class": "delivery.DeliverToCustomer",
  "OTP":"1111",
  "currentLongitude": 0,
  "currentLatitude": 0,
  "courier": "resource:delivery.Transporter#trans3@q3.com",
  "order": "resource:delivery.Order#OrderJaipur2"
}'

echo "Third Delivery For JaipurToCustomer"

composer transaction submit -c admin@last-mile-delivery-network -d '{
  "$class": "delivery.StartDeliveryTransporter",
  "currentLatitude": 26.78,
  "currentLongitude": 75.89,
  "transporter": "resource:delivery.Transporter#trans3@q3.com",
  "historys": ["resource:delivery.OrderHistory#OrderJaipur3"]
}'

echo "Wrong Password"

composer transaction submit -c admin@last-mile-delivery-network -d '{
  "$class": "delivery.DeliverToCustomer",
  "OTP":"3333332",
  "currentLongitude": 0,
  "currentLatitude": 0,
  "courier": "resource:delivery.Transporter#trans3@q3.com",
  "order": "resource:delivery.Order#OrderJaipur3"
}'

echo "Correct Password"

composer transaction submit -c admin@last-mile-delivery-network -d '{
  "$class": "delivery.DeliverToCustomer",
  "OTP":"1111",
  "currentLongitude": 0,
  "currentLatitude": 0,
  "courier": "resource:delivery.Transporter#trans3@q3.com",
  "order": "resource:delivery.Order#OrderJaipur3"
}'


echo "First Delivery for AjmerToCustomer"

composer transaction submit -c admin@last-mile-delivery-network -d '{
  "$class": "delivery.StartDeliveryTransporter",
  "currentLatitude": 26.78,
  "currentLongitude": 75.89,
  "transporter": "resource:delivery.Transporter#trans4@q3.com",
  "historys": ["resource:delivery.OrderHistory#OrderAjmer1"]
}'

echo "Wrong Password"

composer transaction submit -c admin@last-mile-delivery-network -d '{
  "$class": "delivery.DeliverToCustomer",
  "OTP":"3333332",
  "currentLongitude": 0,
  "currentLatitude": 0,
  "courier": "resource:delivery.Transporter#trans4@q3.com",
  "order": "resource:delivery.Order#OrderAjmer1"
}'

echo "Correct Password"

composer transaction submit -c admin@last-mile-delivery-network -d '{
  "$class": "delivery.DeliverToCustomer",
  "OTP":"1111",
  "currentLongitude": 0,
  "currentLatitude": 0,
  "courier": "resource:delivery.Transporter#trans4@q3.com",
  "order": "resource:delivery.Order#OrderAjmer1"
}'

echo "Second Delivery for AjmerToCustomer"

composer transaction submit -c admin@last-mile-delivery-network -d '{
  "$class": "delivery.StartDeliveryTransporter",
  "currentLatitude": 26.78,
  "currentLongitude": 75.89,
  "transporter": "resource:delivery.Transporter#trans4@q3.com",
  "historys": ["resource:delivery.OrderHistory#OrderAjmer2"]
}'

echo "Wrong Password"


composer transaction submit -c admin@last-mile-delivery-network -d '{
  "$class": "delivery.DeliverToCustomer",
  "OTP":"3333332",
  "currentLongitude": 0,
  "currentLatitude": 0,
  "courier": "resource:delivery.Transporter#trans4@q3.com",
  "order": "resource:delivery.Order#OrderAjmer2"
}'

echo "Correct Password"

composer transaction submit -c admin@last-mile-delivery-network -d '{
  "$class": "delivery.DeliverToCustomer",
  "OTP":"1111",
  "currentLongitude": 0,
  "currentLatitude": 0,
  "courier": "resource:delivery.Transporter#trans4@q3.com",
  "order": "resource:delivery.Order#OrderAjmer2"
}'