echo "adding Central Warehouse data"
composer transaction submit -c admin@last-mile-delivery-network -d '{"$class":"org.hyperledger.composer.system.AddParticipant","resources":[
{
  "$class": "delivery.Warehouse",
   "id":2,
  "userId": 2,
  "name": "North Warehouse",
  "address": "38/6, Delhi - Jaipur Expy, Mohammed Pur, Khandsha, Sector 37, Gurugram, Haryana 122004",
  "latitude": 28.422572,
  "longitude": 77.000422,
  "number": "9876543210",
  "holderId": "warehouse1@q3.com",
  "password": "12345"
}],"targetRegistry":"resource:org.hyperledger.composer.system.ParticipantRegistry#delivery.Warehouse"}'