#!/bin/sh

[ -f /var/first-apt-get-update ] && echo "APT already updated" || sudo apt-get update > /var/first-apt-get-update

# Ansible
sudo apt-get install -y ansible
sudo cp /vagrant/ansible/hosts /etc/ansible/hosts
[ -f /home/vagrant/.ssh/id_rsa ] && echo "SSH key already generated" || ssh-keygen -b 2048 -t rsa -f /home/vagrant/.ssh/id_rsa -q -N ""

# QEmu for ARM VM
sudo apt-get install -y qemu bridge-utils

# Setup DHCP server for ARM VM
sudo cp /vagrant/qemu-service/network-interface /etc/network/interfaces
sudo /etc/init.d/networking restart

# Downloading ARM boxes with Debian Wheezy
echo "Downloading ARM boxes with Debian Wheezy"
[ -d /var/vm-boxes ] || mkdir /var/vm-boxes
cd /var/vm-boxes
[ -f ./debian_wheezy_armel_standard.qcow2 ] && echo "ARM image already downloaded" || wget https://people.debian.org/~aurel32/qemu/armel/debian_wheezy_armel_standard.qcow2
[ -f ./initrd.img-3.2.0-4-versatile ] || wget https://people.debian.org/~aurel32/qemu/armel/initrd.img-3.2.0-4-versatile
[ -f ./vmlinuz-3.2.0-4-versatile ] || wget https://people.debian.org/~aurel32/qemu/armel/vmlinuz-3.2.0-4-versatile

# Setting up service for ARM VM
sudo cp /vagrant/qemu-service/startqemu.sh /var/vm-boxes/startqemu.sh
sudo cp /vagrant/qemu-service/qemu-service /etc/init.d/qemu-service
sudo chmod 744 /var/vm-boxes/startqemu.sh
sudo /etc/init.d/qemu-service restart
sudo update-rc.d qemu-service defaults