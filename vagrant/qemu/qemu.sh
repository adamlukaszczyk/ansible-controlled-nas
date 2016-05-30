#!/bin/sh

# Downloading ARM boxes with Debian Wheezy
echo "Downloading ARM boxes with Debian Wheezy"
[ -d /var/vm-boxes ] || mkdir /var/vm-boxes
cd /var/vm-boxes
[ -f ./debian_wheezy_armel_standard.qcow2 ] && echo "ARM image already downloaded" || wget https://people.debian.org/~aurel32/qemu/armel/debian_wheezy_armel_standard.qcow2
[ -f ./initrd.img-3.2.0-4-versatile ] || wget https://people.debian.org/~aurel32/qemu/armel/initrd.img-3.2.0-4-versatile
[ -f ./vmlinuz-3.2.0-4-versatile ] || wget https://people.debian.org/~aurel32/qemu/armel/vmlinuz-3.2.0-4-versatile

# Setting up service for ARM VM
apt-get install -y qemu
cp /vagrant/vagrant/qemu/startqemu.sh /var/vm-boxes/startqemu.sh
cp /vagrant/vagrant/qemu/qemu-service /etc/init.d/qemu-service
chmod 744 /var/vm-boxes/startqemu.sh
/etc/init.d/qemu-service restart
update-rc.d qemu-service defaults
