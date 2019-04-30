#!/bin/bash
echo "Verifying Transporter"
composer transaction submit -c admin@last-mile-delivery-network -d '{
 "$class": "delivery.VerifyUser",
 "username": "2968",
 "password": "12345"
}'

composer transaction submit -c admin@last-mile-delivery-network -d '{
 "$class": "delivery.VerifyUser",
 "username": "29682",
 "password": "12345"
}'

echo "Verifying Warehouse"
composer transaction submit -c admin@last-mile-delivery-network -d '{
 "$class": "delivery.VerifyUser",
 "username": "4323",
 "password": "12345"
}'

composer transaction submit -c admin@last-mile-delivery-network -d '{
 "$class": "delivery.VerifyUser",
 "username": "29682",
 "password": "12345"
}'