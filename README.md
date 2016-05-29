# ansible-controlled-nas

Ansible and ARM virtualization for testing environment insite one VirtualBox

Debian ARM images:
https://people.debian.org/~aurel32/qemu/armel/

Vagrant box users:
- `root:puppet`
- `vagrant:vagrant`

ARM VM ip: `10.0.2.16`
ARM VM users:
- `root:root`
- `user:user`

## Setup steps

0. Clone this project; Make sure you have vagrant installed on your host.

0. Setup your host name / ip address to your NAS in Ansible's hosts config file `ansible/hosts`.

0. First time vagrant run:
    > `$ vagrant up`

0. Go into the Vagrant
    > `$ vagrant ssh`

0. Add your public SSH key to `authorized_keys` on your NAS

0. Copy SSH id to the ARM VM (password: `root`)
    > `vagrant@localhost$ ssh-copy-id -i ~/.ssh/id_rsa.pub root@10.0.2.16`


## Running Ansible
1. Run Ansible to install the packages on your virtual NAS
    > `vagrant@localhost$ ansible-playbook /vagrant/ansible/site.yml --limit=stage `


## Usefull links
- http://jamie.lentin.co.uk/devices/dlink-dns325/
- http://docs.ansible.com/ansible/intro_getting_started.html#your-first-commands
- https://www.digitalocean.com/community/tutorials/how-to-add-delete-and-grant-sudo-privileges-to-users-on-a-debian-vps
- https://people.debian.org/~aurel32/qemu/armel/
- https://github.com/fhd/init-script-template
- https://wiki.debian.org/QEMU#QEMU_networking_with_VDE

## TODO
- enable fan // echo 2000 > /sys/class/hwmon/hwmon?/fan1_target
- turn off disks after period of inactivitiy
