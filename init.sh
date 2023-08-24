#!/bin/bash

echo "=== Use number as parameter to get data from selected Group_Linux in VirtualBox_UbuntuCloudImage"
echo "Configuring trust to hosts and updating /etc/hosts"
sudo su --command='sed -i "/master.kubernetes.lab/d" /etc/hosts'
sudo su --command='sed -i "/wrk-01.kubernetes.lab/d" /etc/hosts'
sudo su --command='sed -i "/wrk-02.kubernetes.lab/d" /etc/hosts'
if [ "${1}" == "" ]; then
    ssh-keygen -f ~/.ssh/known_hosts -R "192.168.56.111" 2>/dev/null
    ssh-keygen -f ~/.ssh/known_hosts -R "192.168.56.112" 2>/dev/null
    ssh-keygen -f ~/.ssh/known_hosts -R "192.168.56.113" 2>/dev/null
    sudo su --command='echo "192.168.56.111 master.kubernetes.lab" >> /etc/hosts'
    sudo su --command='echo "192.168.56.112 wrk-01.kubernetes.lab" >> /etc/hosts'
    sudo su --command='echo "192.168.56.113 wrk-02.kubernetes.lab" >> /etc/hosts'
fi
if [ "${1}" == "2" ]; then
    ssh-keygen -f ~/.ssh/known_hosts -R "192.168.56.211" 2>/dev/null
    ssh-keygen -f ~/.ssh/known_hosts -R "192.168.56.212" 2>/dev/null
    ssh-keygen -f ~/.ssh/known_hosts -R "192.168.56.213" 2>/dev/null
    sudo su --command='echo "192.168.56.211 master.kubernetes.lab" >> /etc/hosts'
    sudo su --command='echo "192.168.56.212 wrk-01.kubernetes.lab" >> /etc/hosts'
    sudo su --command='echo "192.168.56.213 wrk-02.kubernetes.lab" >> /etc/hosts'
fi
touch ~/.ssh/config
echo 'Host *' >> ~/.ssh/config
echo '   StrictHostKeyChecking no' >> ~/.ssh/config
chmod 600 ~/.ssh/config

mkdir -p ~/.kube

echo "Coping ansible configuration"
echo "Ignoring /etc/ansible/hosts, using variable to point out inventory in current dir."
current_dir=$(pwd)
cp "/mnt/e/Danek/Dokumenty/MojeProgramy/DevOps/VirtualBox_UbuntuCloudImage/Group_Linux${1}/hosts" $current_dir
echo 
echo "Run following command:     export ANSIBLE_INVENTORY=$current_dir/hosts"
echo
