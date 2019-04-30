#!/bin/bash
echo "Verifying Transporter"
composer transaction submit -c admin@last-mile-delivery-network -d '{
 "$class": "delivery.VerifyUser",
 "holderId": "2968",
 "password": "12345"
}'

composer transaction submit -c admin@last-mile-delivery-network -d '{
 "$class": "delivery.VerifyUser",
 "holderId": "29682",
 "password": "12345"
}'

echo "Verifying Warehouse"
composer transaction submit -c admin@last-mile-delivery-network -d '{
 "$class": "delivery.VerifyUser",
 "holderId": "4323",
 "password": "12345"
}'

composer transaction submit -c admin@last-mile-delivery-network -d '{
 "$class": "delivery.VerifyUser",
 "holderId": "29682",
 "password": "12345"
}'