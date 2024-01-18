# ansible-dns-server-clients
Ansible playbook to automate bind9 implementation on primary, secondary dns server and clients

## Directory Structure
ansible-dns-server-clients/
├── ansible.cfg
├── main.yml
├── nameservers.yml
├── README.md
└── roles
    ├── inventory.yml
    └── templates
        ├── 10.0.0.rev
        ├── mytechlab.com
        ├── named.conf.primary
        ├── named.conf.secondary
        └── resolv.conf

main.yml file
```
- import_playbook: nameservers.yml

- hosts: all
  become: true
  tasks:

   - name: Populate resolv.conf file with nameservers and search domain
     ansible.builtin.copy:
       src: roles/templates/resolv.conf
       dest: /etc/resolv.conf
       owner: root
```

Run the main playbook "main.yml" 
`ansible-playbook main.yml -i inventory.yml`
