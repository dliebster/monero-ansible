# monero-ansible

![Build Status](https://img.shields.io/badge/ansible-deploys-blue)\
![Build Status](https://img.shields.io/badge/docker-builds-blue)

Ansiblized deployment of Monerod + P2Pool + XMRig for clusters.\
Dockerized version in progress in ./docker.

| Asset sources: |  |
| ---  | -- |
| [Monero](https://getmonero.org/) | Monero source of goodness |
| [P2Pool]( https://github.com/SChernykh/p2pool) | P2Pool github |
| [XMRig]( https://github.com/xmrig/xmrig) | XMRig github |

## Install monero to nodes

Deployment consists of running 3 Ansible playbooks, soon to be one.

The ~200GB of Monero chain file will be written to /var/lib/monero, and have the xmrig
process start consuming ~ 70\% CPU core time.

```bash
ansible-playbook -i hosts.yaml add_monero.yaml
```

## Install p2pool

```bash
ansible-playbook -i hosts.yaml add_p2p.yaml
```

Wallet id is presently set in conf/p2pool.service, to be parameteized in a future commit...

## Install xmrig

```bash
ansible-playbook -i hosts.yaml add_xmrig.yaml
```

## Monitor monerod progess

```bash
ansible-playbook -i hosts.yaml monitor/uptime-monerod.yaml
ansible-playbook -i hosts.yaml monitor/uptime-p2p.yaml
ansible-playbook -i hosts.yaml monitor/uptime-xmrig.yaml
```

/var/log/p2pool.log will show the following status every ~30-60 mins when the Monero chain has fully synced all 3 svcs are running correctly :

```bash
# tail -f p2pool.log |grep -A20 -B10 "BLOCK FOUND"
major_version           = 16
height                  = 3100429
prev_id                 = af1874fc39fbf93db97c0d265de7d22dc5526da1b7cf16d2b1b896e362b5d9bd
seed_hash               = 4ec15c377ac3576f49361d2e912ecb2256c438937821e7262508d5995b37c7e6
difficulty              = 256245245518
median_weight           = 325041
already_generated_coins = 18407453310373662001
transactions            = 203
---------------------------------------------------------------------------------------------------------------
NOTICE  2024-03-08 08:13:12.3364 P2Pool new main chain block: height = 3100428, id = af1874fc39fbf93db97c0d265de7d22dc5526da1b7cf16d2b1b896e362b5d9bd, timestamp = 1709885582, reward = 0.616350624165 XMR
NOTICE  2024-03-08 08:13:12.3364 P2Pool BLOCK FOUND: main chain block at height 3100428 was mined by someone else in this p2pool
-----------------------------------------------------------------------------------------------
| ######   #        #######   #####   #    #      #######  #######  #     #  #     #  ######  |
| #     #  #        #     #  #     #  #   #       #        #     #  #     #  ##    #  #     # |
| #     #  #        #     #  #        #  #        #        #     #  #     #  # #   #  #     # |
| ######   #        #     #  #        ###         #####    #     #  #     #  #  #  #  #     # |
| #     #  #        #     #  #        #  #        #        #     #  #     #  #   # #  #     # |
| #     #  #        #     #  #     #  #   #       #        #     #  #     #  #    ##  #     # |
| ######   #######  #######   #####   #    #      #        #######   #####   #     #  ######  |
-----------------------------------------------------------------------------------------------
NOTICE  2024-03-08 08:13:12.3364 P2Pool Your wallet 4B4LNifyYDGS5KDGJT8R9Gew9jirz9dtGPeZ8DygUstQSpW4WhXDox44hk2ji7mFgSPxf5rqQca6qcugwrDfu7NWJWQ66Yh didn't get a payout in block 3100428 because you had no shares in PPLNS window
```

## Reverse proxy

./conf/nginx_tcp_proxy.conf contains a tcp_stream proxy snippet, pls make sure\
the nginx tcp-streams module is installed (e.g. apt install -y nginx-extras).\
Once nginx is running, remeber to configure your NAT forwarding gateway\
to forward all its inbound port 18080 connections to the nginx host, port 19080.

## Docker image

Located in the docker diretory, it does build but needs docker-run testing.

## SW Versions

```shell
ansible core 2.14.9
podman version 4.3.1
buildah version 1.28.2 
Ubuntu  version 23.10
```

## Tested: 2024/03/08

Build/deploy status:\
'OS Deploy to node' : Fully Functional Ubuntu 23:10\
'Docker Deploy'     : Image builds aok, needs 'docker run' testing..
