#!/bin/sh

sudo apt-get update

# Ansible
sudo apt-get install -y ansible
sudo cp /vagrant/ansible/hosts /etc/ansible/hosts

# QEmu for ARM VM
sudo apt-get install -y qemu bridge-utils

# Setup DHCP server for ARM VM
sudo apt-get install -y dnsmasq vde2
sudo cp /vagrant/qemu-service/dnsmasq.conf /etc/dnsmasq.conf
sudo cp /vagrant/qemu-service/network-interface /etc/network/interfaces.d/mytap
sudo ifup mytap
sudo /etc/init.d/dnsmasq restart

# Downloading ARM boxes with Debian Wheezy
echo "Downloading ARM boxes with Debian Wheezy"
[ -d /var/vm-boxes ] || mkdir /var/vm-boxes
cd /var/vm-boxes
[ -f ./debian_wheezy_armel_standard.qcow2 ] || wget https://people.debian.org/~aurel32/qemu/armel/debian_wheezy_armel_standard.qcow2
[ -f ./initrd.img-3.2.0-4-versatile ] || wget https://people.debian.org/~aurel32/qemu/armel/initrd.img-3.2.0-4-versatile
[ -f ./vmlinuz-3.2.0-4-versatile ] || wget https://people.debian.org/~aurel32/qemu/armel/vmlinuz-3.2.0-4-versatile

# Setting up service for ARM VM
sudo cp /vagrant/qemu-service/startqemu.sh /var/vm-boxes/startqemu.sh
sudo cp /vagrant/qemu-service/qemu-service /etc/init.d/qemu-service
sudo chmod 744 /var/vm-boxes/startqemu.sh
sudo /etc/init.d/qemu-service restart
sudo update-rc.d qemu-service defaults