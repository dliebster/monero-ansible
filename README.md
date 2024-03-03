# monero-ansible
Ansiblized monero admin for small clusters

# Install monero to nodes:
ansible-playbook -i <inventory.yaml> add_monero.yaml

# Install p2pool and xmrig:
ansible-playbook -i <inventory.yaml> add_pool.sh --> WIP converting to playbook...


# Monitor monerod progess:
ansible-playbook -i <inventory.yaml> uptime.yaml
