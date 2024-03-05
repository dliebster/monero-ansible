# monero-ansible

Ansiblized monero + p2pool admin for small clusters.

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

conf/nginx_tcp_proxy.conf contains a tcp_stream proxy snippet, pls make sure the nginx tcp-streams module
is installed (e.g. apt install -y nginx-extras )