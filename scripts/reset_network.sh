#!/bin/bash
composer network reset -c admin@last-mile-delivery-network

scripts/./Transporter_data.sh
scripts/./Warehouse_data.sh
scripts/./Customer_data.sh
scripts/./Contracts_data.sh
scripts/./WarehouseForTransporter.sh
scripts/./WarehouseHistory.sh
scripts/./Place_Orders.sh
