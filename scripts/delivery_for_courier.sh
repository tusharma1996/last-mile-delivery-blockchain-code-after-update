#!/bin/bash

echo "starting delivery for both couriers"

echo  "  "

echo "First delivery for JaipurToCustomer"

echo "Wrong Password"

composer transaction submit -c admin@last-mile-delivery-network -d '{
  "$class": "delivery.DeliverToCustomer",
  "OTP":"3333332",
  "currentLongitude": 0,
  "currentLatitude": 0,
  "courier": "resource:delivery.Transporter#JaipurToCustomer",
  "order": "resource:delivery.Order#OrderJaipur1"
}'

echo "Correct Password"
composer transaction submit -c admin@last-mile-delivery-network -d '{
  "$class": "delivery.DeliverToCustomer",
  "OTP":"1111",
  "currentLongitude": 0,
  "currentLatitude": 0,
  "courier": "resource:delivery.Transporter#JaipurToCustomer",
  "order": "resource:delivery.Order#OrderJaipur1"
}'

echo "Second Delivery For JaipurToCustomer"

echo "Wrong Password"

composer transaction submit -c admin@last-mile-delivery-network -d '{
  "$class": "delivery.DeliverToCustomer",
  "OTP":"3333332",
  "currentLongitude": 0,
  "currentLatitude": 0,
  "courier": "resource:delivery.Transporter#JaipurToCustomer",
  "order": "resource:delivery.Order#OrderJaipur2"
}'

echo "Correct Password"

composer transaction submit -c admin@last-mile-delivery-network -d '{
  "$class": "delivery.DeliverToCustomer",
  "OTP":"1111",
  "currentLongitude": 0,
  "currentLatitude": 0,
  "courier": "resource:delivery.Transporter#JaipurToCustomer",
  "order": "resource:delivery.Order#OrderJaipur2"
}'

echo "Third Delivery For JaipurToCustomer"

echo "Wrong Password"

composer transaction submit -c admin@last-mile-delivery-network -d '{
  "$class": "delivery.DeliverToCustomer",
  "OTP":"3333332",
  "currentLongitude": 0,
  "currentLatitude": 0,
  "courier": "resource:delivery.Transporter#JaipurToCustomer",
  "order": "resource:delivery.Order#OrderJaipur3"
}'

echo "Correct Password"

composer transaction submit -c admin@last-mile-delivery-network -d '{
  "$class": "delivery.DeliverToCustomer",
  "OTP":"1111",
  "currentLongitude": 0,
  "currentLatitude": 0,
  "courier": "resource:delivery.Transporter#JaipurToCustomer",
  "order": "resource:delivery.Order#OrderJaipur3"
}'


echo "First Delivery for AjmerToCustomer"


echo "Wrong Password"

composer transaction submit -c admin@last-mile-delivery-network -d '{
  "$class": "delivery.DeliverToCustomer",
  "OTP":"3333332",
  "currentLongitude": 0,
  "currentLatitude": 0,
  "courier": "resource:delivery.Transporter#AjmerToCustomer",
  "order": "resource:delivery.Order#OrderAjmer1"
}'

echo "Correct Password"

composer transaction submit -c admin@last-mile-delivery-network -d '{
  "$class": "delivery.DeliverToCustomer",
  "OTP":"1111",
  "currentLongitude": 0,
  "currentLatitude": 0,
  "courier": "resource:delivery.Transporter#AjmerToCustomer",
  "order": "resource:delivery.Order#OrderAjmer1"
}'

echo "Second Delivery for AjmerToCustomer"
echo "Wrong Password"


composer transaction submit -c admin@last-mile-delivery-network -d '{
  "$class": "delivery.DeliverToCustomer",
  "OTP":"3333332",
  "currentLongitude": 0,
  "currentLatitude": 0,
  "courier": "resource:delivery.Transporter#AjmerToCustomer",
  "order": "resource:delivery.Order#OrderAjmer2"
}'

echo "Correct Password"

composer transaction submit -c admin@last-mile-delivery-network -d '{
  "$class": "delivery.DeliverToCustomer",
  "OTP":"1111",
  "currentLongitude": 0,
  "currentLatitude": 0,
  "courier": "resource:delivery.Transporter#AjmerToCustomer",
  "order": "resource:delivery.Order#OrderAjmer2"
}'