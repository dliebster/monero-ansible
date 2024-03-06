# monero-ansible

Ansiblized monero + p2pool admin for small clusters.
Tested: 2024/03/04 - Ubuntu 23.10 variety of Intel/AMD microPCs.

## Install monero to nodes

```bash
ansible-playbook -i hosts.yaml add_monero.yaml
```

## Install p2pool

```bash
ansible-playbook -i hosts.yaml add_p2p.yaml
```

## Install xmrig -> work in progress

```bash
ansible-playbook -i hosts.yaml add_xmrig.yaml
```

## Monitor monerod progess

```bash
ansible-playbook -i hosts.yaml monitor/uptime-monerod.yaml
ansible-playbook -i hosts.yaml monitor/uptime-p2p.yaml
ansible-playbook -i hosts.yaml monitor/uptime-xmrig.yaml
```

## Reverse proxy

Conf/nginx_tcp_proxy.conf contains a tcp_stream proxy snippet, pls make sure the nginx tcp-streams module
is installed (e.g. apt install -y nginx-extras). 
Once nginx is running, remeber to configure your NAT / forwarding gateway to forward all its inbound port 18080 connections to the nginx host, port 19080.

## Docker image

Located in the docker diretory, it does build but needs runing container testing.

## SW Versions

```shell
ansible core 2.14.9
podman version 4.3.1
buildah version 1.28.2 
Ubuntu  version 23.10
```
