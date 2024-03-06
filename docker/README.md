# Work in Progress

## Plan is to use ansible-bender to re-use ansible code 1 level up.


ansible-bender working notes:

To build...
```bash
    ansible-bender build create-image-playbook.yaml --python-interpreter=/usr/bin/python3
```



Status: 
2024/03/06 Image builds with cli above, container needs runtime validation.


Todo    - Clean up .debs needed only for the installtion process, likely via ansible.builtin.packages.
        - Resolve python3 double installer in ansible-bender yaml.