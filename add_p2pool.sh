wget https://github.com/SChernykh/p2pool/releases/download/v3.10/p2pool-v3.10-linux-x64.tar.gz

gzip -df p2pool-v3.10-linux-x64.tar.gz 
tar -xvf p2pool-v3.10-linux-x64.tar
p2pool-v3.10-linux-x64/
p2pool-v3.10-linux-x64/README.md
chmod +x p2pool-v3.10-linux-x64/p2pool
sudo cp p2pool-v3.10-linux-x64/p2pool /usr/local/bin/

/usr/local/bin/p2pool --host 127.0.0.1 --wallet 4B4LNifyYDGS5KDGJT8R9Gew9jirz9dtGPeZ8DygUstQSpW4WhXDox44hk2ji7mFgSPxf5rqQca6qcugwrDfu7NWJWQ66Yh

wget https://github.com/xmrig/xmrig/releases/download/v6.21.1/xmrig-6.21.1-focal-x64.tar.gz
gzip -df xmrig-6.21.1-focal-x64.tar.gz
tar -xvf xmrig-6.21.1-focal-x64.tar
chmod +x xmrig-6.21.1/xmrig
sudo cp xmrig-6.21.1/xmrig /usr/local/bin/


/usr/local/bin/xmrig -o 127.0.0.1:3333
