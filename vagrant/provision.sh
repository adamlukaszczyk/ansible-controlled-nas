#!/bin/sh

[ -f /var/first-apt-get-update ] && echo "APT already updated" || sudo apt-get update > /var/first-apt-get-update

# Setup network bridge for ARM VM
/vagrant/vagrant/networking/networking.sh

# Downloading ARM boxes with Debian Wheezy
/vagrant/vagrant/qemu/qemu.sh

# Ansible
/vagrant/vagrant/ansible/ansible.sh

# Copy SSH key to the ARM VM
/vagrant/vagrant/ssh/keygen.sh