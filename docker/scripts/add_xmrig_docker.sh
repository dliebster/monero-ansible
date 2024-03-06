#!/usr/bin/env bash
set -x

wget https://github.com/xmrig/xmrig/releases/download/v6.21.1/xmrig-6.21.1-focal-x64.tar.gz
gzip -df xmrig-6.21.1-focal-x64.tar.gz
tar -xvf xmrig-6.21.1-focal-x64.tar
chmod +x xmrig-6.21.1/xmrig
sudo cp xmrig-6.21.1/xmrig /usr/local/bin/


# /usr/local/bin/xmrig -o 127.0.0.1:3333 &