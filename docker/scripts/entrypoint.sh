#! /usr/bin/env bash

echo "Starting p2pool stack"

/usr/local/bin/monerod --config-file=/etc/monero/monerod.conf --pidfile /var/run/monero/monerod.pid --detach
/usr/local/bin/p2pool --host 127.0.0.1 --wallet 4B4LNifyYDGS5KDGJT8R9Gew9jirz9dtGPeZ8DygUstQSpW4WhXDox44hk2ji7mFgSPxf5rqQca6qcugwrDfu7NWJWQ66Yh &
/usr/local/bin/xmrig -o 127.0.0.1:3333 &

echo "Exiting p2pool stack entrypoint.sh $0"