#!/bin/bash
export FABRIC_VERSION=hlfv12
~/fabric-dev-servers/./startFabric.sh
rm -rf ~/.composer
~/fabric-dev-servers/./createPeerAdminCard.sh
# composer network install -c PeerAdmin@hlfv1 -a last-mile-delivery-network@0.0.2.bna
# composer network start -c PeerAdmin@hlfv1 -V 0.0.2 -A admin -S adminpw -f networkadmin.card -n last-mile-delivery-network
#composer card import -f networkadmin.card
