#!/bin/sh

qemu-system-arm -M versatilepb -kernel vmlinuz-3.2.0-4-versatile -initrd initrd.img-3.2.0-4-versatile -hda debian_wheezy_armel_standard.qcow2 -append 'root=/dev/sda1' -net nic,macaddr=52:54:BE:EF:96:D4 -net vde,sock=/var/run/vde2/mytap.ctl -daemonize -display none
