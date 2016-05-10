#!/bin/sh

kernel="vmlinuz-3.2.0-4-versatile"
initrd="initrd.img-3.2.0-4-versatile"
hda="debian_wheezy_armel_standard.qcow2"
networking="-net nic -net tap,ifname=tap0,script=no,downscript=no"
qemu-system-arm -pidfile /var/run/qemu-service.pid -M versatilepb -kernel $kernel -initrd $initrd -hda $hda -append 'root=/dev/sda1' $networking -daemonize -display none