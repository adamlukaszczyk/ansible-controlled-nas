#!/bin/sh

[ -f /home/vagrant/.ssh/id_rsa ] && echo "SSH key already generated" || \
    (ssh-keygen -b 2048 -t rsa -f /home/vagrant/.ssh/id_rsa -q -N "" && \
    chown vagrant /home/vagrant/.ssh/id_rsa* && \
    chgrp vagrant /home/vagrant/.ssh/id_rsa* && \
    echo "Inside vagrant box execute following command to copy SSH key into ARM VM (password: root)" && \
    echo "vagrant@localhost$ ssh-copy-id -i /home/vagrant/.ssh/id_rsa.pub root@10.0.2.16")
