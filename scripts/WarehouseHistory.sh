#!/bin/bash
echo "adding WarehouseHistory data"
composer transaction submit -c admin@last-mile-delivery-network -d '{"$class":"org.hyperledger.composer.system.AddAsset","resources":[{
  "$class": "delivery.WarehouseHistory",
  "warehouseTransactions": [],
  "historyId": "ware1@q3.com"
},
{
  "$class": "delivery.WarehouseHistory",
  "warehouseTransactions": [],
  "historyId": "ware2@q3.com"
},
{
  "$class": "delivery.WarehouseHistory",
  "warehouseTransactions": [],
  "historyId": "ware3@q3.com"
}],"targetRegistry":"resource:org.hyperledger.composer.system.AssetRegistry#delivery.WarehouseHistory"}'
