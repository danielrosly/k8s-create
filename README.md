## K8S-CREATE

Ansible playbooks that create three-node K8S cluster.
Can be used with VirtualBox in Windows workstation. Or anywnere else.

Review contents in `src`, adjust it to your needs and run.

### Execution

Create `.kube` subdir in your home. Configure inventory.

First run

`ansible-playbook 01_init.yaml`

And then

`ansible-playbook 02_admin_node.yaml`

After that, you will have working K8S cluster.

Then you can run

`ansible-playbook 03_install_software.yaml`

to install: Helm, Metrics-Server, LoadBalancer (Metal LB), ArgoCD.

## Inventory

Example inventory file that is used with playbooks:

```
---
all:
  children:
    master:
      hosts:
        ubuntu1:
          ansible_host: 192.168.56.111
          ansible_user: ansible
          ansible_port: 22
          ansible_connection: ssh
          ansible_ssh_private_key_file: "~/.ssh/id_rsa"
    workers:
      hosts:
        ubuntu2:
          ansible_host: 192.168.56.112
          ansible_user: ansible
          ansible_port: 22
          ansible_connection: ssh
          ansible_ssh_private_key_file: "~/.ssh/id_rsa"
        ubuntu3:
          ansible_host: 192.168.56.113
          ansible_user: ansible
          ansible_port: 22
          ansible_connection: ssh
          ansible_ssh_private_key_file: "~/.ssh/id_rsa"
```

## More info

Playbooks are based on things found in Internet. These things are referenced in documents.
