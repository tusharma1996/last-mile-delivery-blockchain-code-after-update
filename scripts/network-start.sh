#!/bin/bash

~/fabric-tools/./startFabric.sh
rm -rf ~/.composer
~/fabric-tools/./createPeerAdminCard.sh
composer network install -c PeerAdmin@hlfv12 -n last-mile-delivery-network
composer network start -c PeerAdmin@hlfv1 -A admin -S adminpw -a last-mile-delivery-network@1.0.9.bna -f networkadmin.createPeerAdminCard
composer card import -f networkadmin.card
