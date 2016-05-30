#!/bin/sh

apt-get install -y bridge-utils
cp /vagrant/vagrant/networking/network-bridge /etc/network/interfaces.d/br0
/etc/init.d/networking restart

