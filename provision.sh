#!/bin/sh

[ -f /var/first-apt-get-update ] && echo "APT already updated" || sudo apt-get update > /var/first-apt-get-update

# Setup network bridge for ARM VM
apt-get install -y qemu bridge-utils
cp /vagrant/qemu-service/network-interface /etc/network/interfaces.d/br0
service networking restart

# Downloading ARM boxes with Debian Wheezy
echo "Downloading ARM boxes with Debian Wheezy"
[ -d /var/vm-boxes ] || mkdir /var/vm-boxes
cd /var/vm-boxes
[ -f ./debian_wheezy_armel_standard.qcow2 ] && echo "ARM image already downloaded" || wget https://people.debian.org/~aurel32/qemu/armel/debian_wheezy_armel_standard.qcow2
[ -f ./initrd.img-3.2.0-4-versatile ] || wget https://people.debian.org/~aurel32/qemu/armel/initrd.img-3.2.0-4-versatile
[ -f ./vmlinuz-3.2.0-4-versatile ] || wget https://people.debian.org/~aurel32/qemu/armel/vmlinuz-3.2.0-4-versatile

# Setting up service for ARM VM
cp /vagrant/qemu-service/startqemu.sh /var/vm-boxes/startqemu.sh
cp /vagrant/qemu-service/qemu-service /etc/init.d/qemu-service
chmod 744 /var/vm-boxes/startqemu.sh
service qemu-service restart
update-rc.d qemu-service defaults

# Ansible
apt-get install -y ansible
cp /vagrant/ansible/hosts /etc/ansible/hosts

# Copy SSH key to the ARM VM
[ -f /home/vagrant/.ssh/id_rsa ] && echo "SSH key already generated" || \
    (ssh-keygen -b 2048 -t rsa -f /home/vagrant/.ssh/id_rsa -q -N "" && \
    chown vagrant /home/vagrant/.ssh/id_rsa* && \
    chgrp vagrant /home/vagrant/.ssh/id_rsa* && \
    echo "Inside vagrant box execute following command to copy SSH key into ARM VM (password: root)" && \
    echo "$ ssh-copy-id -i /home/vagrant/.ssh/id_rsa.pub root@10.0.2.16")
