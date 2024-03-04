#!/usr/bin/env bash

wget https://github.com/SChernykh/p2pool/releases/download/v3.10/p2pool-v3.10-linux-x64.tar.gz
gzip -df p2pool-v3.10-linux-x64.tar.gz 
tar -xvf p2pool-v3.10-linux-x64.tar
chmod +x p2pool-v3.10-linux-x64/p2pool
sudo cp p2pool-v3.10-linux-x64/p2pool /usr/local/bin/

/usr/local/bin/p2pool --host 127.0.0.1 --wallet 4B4LNifyYDGS5KDGJT8R9Gew9jirz9dtGPeZ8DygUstQSpW4WhXDox44hk2ji7mFgSPxf5rqQca6qcugwrDfu7NWJWQ66Yh
