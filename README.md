# ansible-kubernetes-setup
The purpose of this project is to demonstrate the setup of kubernetes cluster, and using bind9 dns server with LDAP server to manage the cluster.
There will be High Availabilty incorperated into the cluster (2 master nodes and 2 worker nodes).
Another node will run HAproxy server, LDAP server and DNS server.

For complete kubernetes cluster playbook, run the main.yml
```
$ ansible-playbook main.yml -i inventory.yml
```

For individual play, each step is listed below. 
## Step 1
Remove swap from Master and Worker nodes
```
- hosts: all
  tasks:
  
    - name: Remove swap from "/etc/fstab"
      lineinfile:
        path: /etc/fstab
        regexp: /swap.imp*
        state: absent
        backup: yes
      
    - name: Run swappoff command on hosts
      command: swapoff -a
```
Confirm that swap is removed by running ad-hoc command

`$ ansible all -m command -a "free -h" `

## Step 2
Run containerd.yml playbook to setup config files and create required files for network bridge, 
and modules (br_netfilter and overlay). Also install the Container Network Interface software (kubernetes-cni)

`$ ansible-playbook containerd.yml -i inventory.yml ` 

## Step 3
Run the playbook for installing kubeadm, kubectl, and kubelet

`$ ansible-playbook kube-pkg-installs.yml -i inventory.yml ` 

## Step 4 
On the control plane nodes, install the Container Network (CNI) plugin.
```
$ curl https://raw.githubusercontent.com/projectcalico/calico/v3.28.0/manifests/calico.yaml -O

$ kubectl apply -f calico.yaml
```
validate that all nodes and pods are healthy

`$ kubectl get nodes`
`$ kubectl get all -A`
