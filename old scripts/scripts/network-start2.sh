#!/bin/bash
~/fabric-tools/./startFabric.sh
rm -rf ~/.composer
~/fabric-tools/./createPeerAdminCard.sh
composer runtime install -c PeerAdmin@hlfv1 -n last-mile-delivery-network
composer network start -c PeerAdmin@hlfv1 -A admin -S adminpw -a last-mile-delivery-network@1.0.10.bna -f networkadmin.createPeerAdminCard
composer card import -f networkadmin.card
