#!/bin/bash
echo "adding WarehouseHistory data"
composer transaction submit -c admin@last-mile-delivery-network -d '{"$class":"org.hyperledger.composer.system.AddAsset","resources":[{
  "$class": "delivery.WarehouseHistory",
  "warehouseTransactions": [],
  "historyId": "WarehouseGurgaon"
},
{
  "$class": "delivery.WarehouseHistory",
  "warehouseTransactions": [],
  "historyId": "WarehouseJaipur"
},
{
  "$class": "delivery.WarehouseHistory",
  "warehouseTransactions": [],
  "historyId": "WarehouseAjmer"
}],"targetRegistry":"resource:org.hyperledger.composer.system.AssetRegistry#delivery.WarehouseHistory"}'
